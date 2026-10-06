import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { useState } from "react";
import { ArrowLeft } from "lucide-react";
import { toast } from "sonner";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Switch } from "@/components/ui/switch";
import { supabase } from "@/integrations/supabase/client";
import { adminBroadcast, adminCreateQr, adminSaveEvent, adminStats, adminToggle } from "@/lib/live.functions";
import { profileQuery } from "@/lib/queries";
import { useGeo } from "@/lib/geo";
import { fmt } from "@/lib/game";

export const Route = createFileRoute("/_authenticated/admin-live")({
  head: () => ({ meta: [
    { title: "Live & analys — PLATSLY Admin" },
    { name: "description", content: "Hantera evenemang, QR-koder, butik, notiser och statistik." },
    { property: "og:title", content: "Live & analys — PLATSLY Admin" },
    { property: "og:description", content: "Adminverktyg för live-innehåll." },
    { property: "og:type", content: "website" }, { name: "twitter:card", content: "summary_large_image" },
  ] }),
  component: AdminLive,
});

const statLabels: Record<string, string> = { players: "Spelare", active7: "Aktiva 7 d", discoveries7: "Upptäckter 7 d", parcels: "Mark tagen", checkins: "Event-incheckningar", qr: "QR-inlösningar", flags7: "Fusk-flaggor 7 d", coins: "Coins i omlopp" };

function AdminLive() {
  const { data: p } = useQuery(profileQuery);
  const isAdmin = p?.roles.includes("admin") ?? false;
  const geo = useGeo();
  const { run, busy } = useGameAction();
  const stats = useServerFn(adminStats), save = useServerFn(adminSaveEvent), toggle = useServerFn(adminToggle), qr = useServerFn(adminCreateQr), cast = useServerFn(adminBroadcast);
  const st = useQuery({ queryKey: ["adminStats"], enabled: isAdmin, queryFn: () => stats() });
  const lists = useQuery({ queryKey: ["adminLive"], enabled: isAdmin, queryFn: async () => {
    const [e, q, s] = await Promise.all([
      supabase.from("events").select("*").order("ends_at", { ascending: false }).limit(30),
      supabase.from("qr_codes").select("*").order("created_at", { ascending: false }).limit(30),
      supabase.from("shop_items").select("*").order("sort"),
    ]);
    return { events: e.data ?? [], qrs: q.data ?? [], items: s.data ?? [] };
  } });
  const day = (d: number) => new Date(Date.now() + d * 86400000).toISOString().slice(0, 16);
  const [ev, setEv] = useState({ title: "", description: "", city: "", sponsor: "", coords: "", radius: "150", xp: "100", coins: "40", start: day(0), end: day(3) });
  const [q, setQ] = useState({ code: "", label: "", xp: "50", coins: "25", max: "500" });
  const [msg, setMsg] = useState({ title: "", body: "" });
  if (!isAdmin) return <AppShell><p className="mt-20 text-center text-muted-foreground">Endast admin.</p></AppShell>;
  const set = <T,>(f: React.Dispatch<React.SetStateAction<T>>) => (k: keyof T) => (e: React.ChangeEvent<HTMLInputElement>) => f((o) => ({ ...o, [k]: e.target.value }));
  const sEv = set(setEv), sQ = set(setQ);

  function submitEvent(): void {
    const [lat, lng] = ev.coords.split(",").map((x) => Number(x.trim()));
    if (!Number.isFinite(lat) || !Number.isFinite(lng)) { toast.error("Ange position som lat, lng"); return; }
    void run(() => save({ data: { title: ev.title, description: ev.description, city: ev.city, sponsor: ev.sponsor, lat: lat!, lng: lng!, radius_m: +ev.radius, xp_reward: +ev.xp, coin_reward: +ev.coins, starts_at: new Date(ev.start).toISOString(), ends_at: new Date(ev.end).toISOString() } }), () => toast.success("Evenemang skapat"));
  }

  return (
    <AppShell wide>
      <Link to="/admin" className="mb-3 flex items-center gap-1 text-sm text-primary"><ArrowLeft className="size-4" />Kontrollrum</Link>
      <PageTitle sub="Evenemang, QR, butik, notiser och analys">Live & analys</PageTitle>

      <div className="mb-5 grid grid-cols-2 gap-2 sm:grid-cols-4">
        {st.data?.ok && Object.entries(st.data.data).map(([k, v]) => (
          <Card key={k}><p className="text-xs text-muted-foreground">{statLabels[k] ?? k}</p><p className="text-2xl font-bold">{fmt(Number(v))}</p></Card>
        ))}
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <Card>
          <h2 className="mb-3 font-bold">Nytt evenemang</h2>
          <div className="grid gap-2">
            <Input placeholder="Titel" value={ev.title} onChange={sEv("title")} />
            <Input placeholder="Beskrivning" value={ev.description} onChange={sEv("description")} />
            <div className="grid grid-cols-2 gap-2"><Input placeholder="Ort" value={ev.city} onChange={sEv("city")} /><Input placeholder="Företag/sponsor (valfritt)" value={ev.sponsor} onChange={sEv("sponsor")} /></div>
            <div className="flex gap-2"><Input placeholder="lat, lng" value={ev.coords} onChange={sEv("coords")} />{geo.lat != null && <Button variant="outline" onClick={() => setEv((o) => ({ ...o, coords: `${geo.lat!.toFixed(5)}, ${geo.lng!.toFixed(5)}` }))}>Min plats</Button>}</div>
            <div className="grid grid-cols-3 gap-2"><Input type="number" aria-label="Radie m" value={ev.radius} onChange={sEv("radius")} /><Input type="number" aria-label="XP" value={ev.xp} onChange={sEv("xp")} /><Input type="number" aria-label="Coins" value={ev.coins} onChange={sEv("coins")} /></div>
            <p className="text-xs text-muted-foreground">Radie (m) · XP · Coins</p>
            <div className="grid grid-cols-2 gap-2"><Input type="datetime-local" value={ev.start} onChange={sEv("start")} /><Input type="datetime-local" value={ev.end} onChange={sEv("end")} /></div>
            <Button disabled={busy || ev.title.length < 2} onClick={submitEvent}>Skapa evenemang</Button>
          </div>
          <ul className="mt-4 space-y-2">
            {lists.data?.events.map((e) => (
              <li key={e.id} className="flex items-center justify-between gap-2 text-sm"><span className="truncate">{e.title} · {e.city} · t.o.m. {new Date(e.ends_at).toLocaleDateString("sv-SE")}</span>
                <Switch checked={e.active} onCheckedChange={(v) => run(() => toggle({ data: { table: "events", id: e.id, active: v } }))} /></li>
            ))}
          </ul>
        </Card>

        <Card>
          <h2 className="mb-3 font-bold">QR-koder</h2>
          <div className="grid gap-2">
            <div className="grid grid-cols-2 gap-2"><Input placeholder="Kod, t.ex. SUNNE2026" value={q.code} onChange={sQ("code")} /><Input placeholder="Namn" value={q.label} onChange={sQ("label")} /></div>
            <div className="grid grid-cols-3 gap-2"><Input type="number" aria-label="XP" value={q.xp} onChange={sQ("xp")} /><Input type="number" aria-label="Coins" value={q.coins} onChange={sQ("coins")} /><Input type="number" aria-label="Max" value={q.max} onChange={sQ("max")} /></div>
            <p className="text-xs text-muted-foreground">XP · Coins · Max antal användningar</p>
            <Button disabled={busy || q.code.length < 3 || q.label.length < 2} onClick={() => run(() => qr({ data: { code: q.code, label: q.label, xp: +q.xp, coins: +q.coins, max: +q.max } }), () => toast.success("QR-kod skapad"))}>Skapa QR-kod</Button>
          </div>
          <ul className="mt-4 space-y-3">
            {lists.data?.qrs.map((c) => {
              const url = `${typeof window !== "undefined" ? window.location.origin : ""}/live?kod=${encodeURIComponent(c.code)}`;
              return (
                <li key={c.id} className="flex items-center gap-3 text-sm">
                  <a href={`https://api.qrserver.com/v1/create-qr-code/?size=600x600&data=${encodeURIComponent(url)}`} target="_blank" rel="noreferrer" className="text-primary underline">Visa QR</a>
                  <span className="flex-1 truncate">{c.code} · {c.label} · {c.uses}/{c.max_uses}</span>
                  <Switch checked={c.active} onCheckedChange={(v) => run(() => toggle({ data: { table: "qr_codes", id: c.id, active: v } }))} />
                </li>
              );
            })}
          </ul>
        </Card>

        <Card>
          <h2 className="mb-3 font-bold">Skicka notis till alla</h2>
          <div className="grid gap-2">
            <Input placeholder="Rubrik" value={msg.title} onChange={(e) => setMsg((m) => ({ ...m, title: e.target.value }))} />
            <Input placeholder="Meddelande" value={msg.body} onChange={(e) => setMsg((m) => ({ ...m, body: e.target.value }))} />
            <Button disabled={busy || msg.title.length < 2} onClick={() => run(() => cast({ data: msg }), (r) => { toast.success(`Skickad till ${r.ok && r.data?.["sent"]} spelare`); setMsg({ title: "", body: "" }); })}>Skicka</Button>
          </div>
        </Card>

        <Card>
          <h2 className="mb-3 font-bold">Butiksföremål</h2>
          <ul className="space-y-2">
            {lists.data?.items.map((i) => (
              <li key={i.id} className="flex items-center justify-between text-sm"><span>{i.value} {i.name} · {fmt(i.price)} coins</span>
                <Switch checked={i.active} onCheckedChange={(v) => run(() => toggle({ data: { table: "shop_items", id: i.id, active: v } }))} /></li>
            ))}
          </ul>
        </Card>
      </div>
    </AppShell>
  );
}

import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { useEffect, useState } from "react";
import { CalendarClock, QrCode, MapPin, Check } from "lucide-react";
import { toast } from "sonner";
import { z } from "zod";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { supabase } from "@/integrations/supabase/client";
import { eventCheckin, redeemQr } from "@/lib/live.functions";
import { startGeo, useGeo } from "@/lib/geo";
import { haversine } from "@/lib/game";

export const Route = createFileRoute("/_authenticated/live")({
  validateSearch: z.object({ kod: z.string().optional() }),
  head: () => ({ meta: [
    { title: "Evenemang & QR — PLATSLY" },
    { name: "description", content: "Tidsbegränsade evenemang och QR-bonusar i PLATSLY." },
    { property: "og:title", content: "Evenemang & QR — PLATSLY" },
    { property: "og:description", content: "Checka in på evenemang och skanna QR-koder för bonusar." },
    { property: "og:type", content: "website" }, { name: "twitter:card", content: "summary_large_image" },
  ] }),
  component: Live,
});

function left(ends: string) {
  const ms = new Date(ends).getTime() - Date.now();
  const h = Math.floor(ms / 3600000);
  return h >= 24 ? `${Math.floor(h / 24)} d kvar` : `${Math.max(h, 0)} h ${Math.max(Math.floor((ms % 3600000) / 60000), 0)} min kvar`;
}

function Live() {
  const { kod } = Route.useSearch();
  const geo = useGeo();
  const { run, busy } = useGameAction();
  const checkin = useServerFn(eventCheckin), redeem = useServerFn(redeemQr);
  const [code, setCode] = useState(kod ?? "");
  useEffect(() => { startGeo(); }, []);
  const events = useQuery({ queryKey: ["events"], queryFn: async () => {
    const now = new Date().toISOString();
    const [{ data: ev }, { data: mine }] = await Promise.all([
      supabase.from("events").select("*").eq("active", true).lte("starts_at", now).gte("ends_at", now).order("ends_at"),
      supabase.from("event_checkins").select("event_id"),
    ]);
    const done = new Set((mine ?? []).map((m) => m.event_id));
    return (ev ?? []).map((e) => ({ ...e, done: done.has(e.id) }));
  } });
  const doRedeem = () => run(() => redeem({ data: { code } }), (r) => { toast.success(`+${(r.ok && r.data?.["coins"])} coins från ${(r.ok && r.data?.["label"])}!`); setCode(""); });

  return (
    <AppShell>
      <PageTitle sub="Begränsad tid – var snabb">Evenemang</PageTitle>
      <Card className="mb-5">
        <h2 className="mb-1 flex items-center gap-2 font-bold"><QrCode className="size-5 text-accent" />QR-bonus</h2>
        <p className="mb-3 text-sm text-muted-foreground">Skanna en PLATSLY-kod med kameran eller skriv in koden.</p>
        <div className="flex gap-2">
          <Input value={code} onChange={(e) => setCode(e.target.value)} placeholder="T.ex. SUNNE2026" className="h-11 uppercase" />
          <Button className="h-11" disabled={busy || code.trim().length < 3} onClick={doRedeem}>Lös in</Button>
        </div>
      </Card>
      <div className="space-y-3">
        {events.data?.length === 0 && <Card><p className="text-center text-muted-foreground">Inga evenemang just nu. Håll utkik!</p></Card>}
        {events.data?.map((e) => {
          const dist = geo.lat != null && geo.lng != null ? haversine(geo.lat, geo.lng, e.lat, e.lng) : null;
          return (
            <Card key={e.id}>
              <div className="flex items-start justify-between gap-3">
                <div>
                  <h3 className="font-bold">{e.title}</h3>
                  {e.sponsor && <p className="text-xs font-bold text-accent">Presenteras av {e.sponsor}</p>}
                  <p className="mt-1 text-sm text-muted-foreground">{e.description}</p>
                </div>
                <span className="shrink-0 rounded-full bg-gold/15 px-2 py-1 text-xs font-bold text-gold">+{e.coin_reward}</span>
              </div>
              <div className="mt-3 flex flex-wrap gap-3 text-xs text-muted-foreground">
                <span className="flex items-center gap-1"><CalendarClock className="size-4" />{left(e.ends_at)}</span>
                <span className="flex items-center gap-1"><MapPin className="size-4" />{e.city}{dist != null && ` · ${dist < 1000 ? `${Math.round(dist)} m` : `${(dist / 1000).toFixed(1)} km`}`}</span>
              </div>
              <Button className="mt-3 h-11 w-full" disabled={busy || e.done || geo.lat == null}
                onClick={() => run(() => checkin({ data: { id: e.id, lat: geo.lat!, lng: geo.lng! } }), (r) => toast.success(`+${(r.ok && r.data?.["coins"])} coins & ${(r.ok && r.data?.["xp"])} XP!`))}>
                {e.done ? <><Check />Avklarat</> : "Checka in"}
              </Button>
            </Card>
          );
        })}
      </div>
    </AppShell>
  );
}

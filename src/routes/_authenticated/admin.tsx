import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { useMemo, useState } from "react";
import { toast } from "sonner";
import { ArrowLeft, LayoutDashboard, MapPin, Plus, SlidersHorizontal, ShieldCheck, LocateFixed, Search, RefreshCw, Download, Save, ChevronLeft, ChevronRight, ArrowUpRight, Coins, Crown, Check, LoaderCircle, Navigation, X } from "lucide-react";
import { AppShell, PageTitle } from "@/components/game/AppShell";
import { CategoryIcon } from "@/components/game/CategoryIcon";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Switch } from "@/components/ui/switch";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { supabase } from "@/integrations/supabase/client";
import { createLocation, grantRoleByUsername, setLocationActive, updateConfig } from "@/lib/game.functions";
import { simulatePosition, useGeo } from "@/lib/geo";
import { configQuery, profileQuery } from "@/lib/queries";
import { fmt } from "@/lib/game";
import { isInSweden } from "@/lib/sweden";

export const Route = createFileRoute("/_authenticated/admin")({
  head: () => ({ meta: [
    { title: "Admin — PLATSLY" },
    { name: "description", content: "Översikt, platser, spelvärden och behörigheter för PLATSLY." },
    { property: "og:title", content: "Admin — PLATSLY" },
    { property: "og:description", content: "Administrera platser och spelvärden i PLATSLY." },
    { property: "og:type", content: "website" }, { name: "twitter:card", content: "summary_large_image" },
  ] }), component: Admin,
});

const sections = [
  { key: "overview", label: "Översikt", icon: LayoutDashboard },
  { key: "places", label: "Platser", icon: MapPin },
  { key: "new", label: "Ny plats", icon: Plus },
  { key: "settings", label: "Spelvärden", icon: SlidersHorizontal },
  { key: "access", label: "Behörigheter", icon: ShieldCheck },
  { key: "gps", label: "GPS & test", icon: LocateFixed },
] as const;
type Section = (typeof sections)[number]["key"];
const categories = ["landmärke", "natur", "utsikt", "stad", "historisk", "gata", "butik", "mat", "offentligt", "sport", "skola", "kyrka"];
const createCategories = ["landmärke", "natur", "utsikt", "stad", "historisk"] as const;
type CreateCategory = (typeof createCategories)[number];
const emptyPlace = { name: "", city: "", description: "", coords: "", category: "landmärke" as CreateCategory, xp: "50", coins: "12" };
function coordinates(value: string) {
  const parts = value.split(",").map(s => s.trim());
  if (parts.length !== 2 || parts.some(s => !s)) throw new Error("Ange latitud och longitud, separerade med komma.");
  const lat = Number(parts[0]), lng = Number(parts[1]);
  if (!Number.isFinite(lat) || !Number.isFinite(lng) || !isInSweden(lat, lng)) throw new Error("Ange en giltig position i Sverige.");
  return { lat, lng };
}
function settingGroup(key: string) {
  if (key.startsWith("parcel_")) return "Mark";
  if (key.startsWith("daily_")) return "Dagliga belöningar";
  if (/invite|challenge|team/.test(key)) return "Socialt";
  return "GPS & upptäckter";
}
function Picker({ label, value, onChange, options }: { label: string; value: string; onChange: (value: string) => void; options: { value: string; label: string }[] }) {
  return <Select value={value} onValueChange={onChange}><SelectTrigger aria-label={label} className="h-11 bg-background"><SelectValue /></SelectTrigger><SelectContent>{options.map(o => <SelectItem key={o.value} value={o.value}>{o.label}</SelectItem>)}</SelectContent></Select>;
}

function Admin() {
  const { data: p } = useQuery(profileQuery);
  const isAdmin = p?.roles.includes("admin") ?? false;
  const { data: cfg } = useQuery({ ...configQuery, enabled: isAdmin });
  const qc = useQueryClient();
  const geo = useGeo();
  const upd = useServerFn(updateConfig), setActive = useServerFn(setLocationActive), create = useServerFn(createLocation), grant = useServerFn(grantRoleByUsername);
  const places = useQuery({ queryKey: ["adminLocations"], enabled: isAdmin, queryFn: async () => {
    const all = [];
    for (let from = 0; ; from += 1000) {
      const { data, error } = await supabase.from("locations").select("id,name,city,active,category,lat,lng,xp_reward,coin_reward").order("id").range(from, from + 999);
      if (error) throw error;
      all.push(...data);
      if (data.length < 1000) break;
    }
    return all;
  } });
  const [section, setSection] = useState<Section>("overview");
  const [search, setSearch] = useState(""), [city, setCity] = useState("all"), [category, setCategory] = useState("all"), [status, setStatus] = useState("all"), [page, setPage] = useState(0);
  const [vals, setVals] = useState<Record<string, string>>({}), [configSearch, setConfigSearch] = useState("");
  const [sim, setSim] = useState(""), [grantName, setGrantName] = useState(""), [role, setRole] = useState<"admin" | "founder" | null>(null);
  const [nl, setNl] = useState(emptyPlace), [busy, setBusy] = useState<string | null>(null);
  const locs = places.data ?? [];
  const cities = useMemo(() => [...new Set(locs.map(l => l.city).filter(Boolean))].sort((a,b) => a.localeCompare(b, "sv")), [places.data]);
  const filtered = useMemo(() => locs.filter(l => `${l.name} ${l.city}`.toLocaleLowerCase("sv").includes(search.toLocaleLowerCase("sv")) && (city === "all" || l.city === city) && (category === "all" || l.category === category) && (status === "all" || l.active === (status === "active"))), [places.data, search, city, category, status]);
  const pages = Math.max(1, Math.ceil(filtered.length / 25));
  const currentPage = Math.min(page, pages - 1);
  const settings = (cfg ?? []).filter(c => `${c.label} ${c.key}`.toLowerCase().includes(configSearch.toLowerCase()));
  const active = locs.filter(l => l.active).length;
  async function safe(key: string, fn: () => Promise<unknown>, msg = "Sparat!") {
    setBusy(key);
    try { await fn(); toast.success(msg); await qc.invalidateQueries(); return true; }
    catch(e) { toast.error(e instanceof Error ? e.message : "Kunde inte spara. Försök igen."); return false; }
    finally { setBusy(null); }
  }
  function exportPlaces() {
    const columns = ["Namn", "Ort", "Kategori", "Aktiv", "Latitud", "Longitud"];
    const rows = filtered.map(l => [l.name, l.city, l.category, l.active ? "Ja" : "Nej", l.lat, l.lng]);
    const csv = "\uFEFF" + [columns, ...rows].map(row => row.map(v => `"${String(v).replaceAll('"', '""')}"`).join(";")).join("\r\n");
    const url = URL.createObjectURL(new Blob([csv], { type: "text/csv;charset=utf-8" }));
    const a = document.createElement("a"); a.href = url; a.download = "platsly-platser.csv"; a.click(); URL.revokeObjectURL(url);
  }
  if (!p) return <AppShell><p className="py-20 text-center text-muted-foreground">Laddar…</p></AppShell>;
  if (!isAdmin) return <AppShell><ShieldCheck className="mx-auto mt-20 size-10 text-muted-foreground" /><p className="mt-4 text-center">Endast för administratörer.</p></AppShell>;
  return <AppShell wide>
    <header className="mb-6 flex items-center justify-between gap-3">
      <Button asChild variant="ghost" className="-ml-3"><Link to="/profil"><ArrowLeft /> Profil</Link></Button>
      <span className="flex items-center gap-2 text-xs font-bold text-primary"><ShieldCheck className="size-4" /> PLATSLY ADMIN</span>
    </header>
    <div className="flex items-start justify-between gap-3"><PageTitle sub={p.username}>Kontrollrum</PageTitle><Button asChild variant="outline" className="ml-auto h-11"><Link to="/admin-live">Live & analys</Link></Button><Button size="icon" variant="outline" title="Uppdatera översikten" aria-label="Uppdatera översikten" disabled={places.isFetching} onClick={() => qc.invalidateQueries()} className="size-11"><RefreshCw className={places.isFetching ? "animate-spin" : ""} /></Button></div>
    <div className="admin-layout">
      <nav aria-label="Adminmeny" className="admin-nav">
        {sections.map(s => <Button key={s.key} variant="ghost" aria-pressed={section === s.key} onClick={() => setSection(s.key)} className={`admin-nav-item ${section === s.key ? "admin-nav-active" : ""}`}><s.icon /><span>{s.label}</span>{s.key === "places" && <span className="ml-auto hidden text-xs opacity-70 lg:inline">{fmt(locs.length)}</span>}</Button>)}
      </nav>
      <div className="min-w-0">
        {section === "overview" && <>
          <div className="mb-7 grid grid-cols-2 gap-3 sm:grid-cols-4">{[{label:"Platser",value:locs.length,icon:MapPin,tone:"text-primary"},{label:"Aktiva",value:active,icon:Check,tone:"text-primary"},{label:"Orter",value:cities.length,icon:Navigation,tone:"text-accent"},{label:"Pausade",value:locs.length-active,icon:MapPin,tone:"text-gold"}].map(s => <div key={s.label} className="rounded-lg border border-border bg-card p-4"><s.icon className={`mb-3 size-5 ${s.tone}`} /><p className="font-display text-2xl font-bold">{places.isPending ? "—" : fmt(s.value)}</p><p className="mt-1 text-xs text-muted-foreground">{s.label}</p></div>)}</div>
          <h2 className="mb-3 text-lg font-bold">Snabbval</h2>
          <div className="mb-7 grid gap-2 sm:grid-cols-2">{sections.slice(1).map(s => <Button key={s.key} variant="outline" onClick={() => setSection(s.key)} className="h-16 justify-start gap-3 bg-card px-4"><span className="icon-well"><s.icon /></span>{s.label}<ArrowUpRight className="ml-auto text-muted-foreground" /></Button>)}</div>
          <div className="flex items-center justify-between border-b border-border pb-3"><h2 className="text-lg font-bold">Platser per ort</h2><Button variant="link" onClick={() => setSection("places")}>Visa alla <ChevronRight /></Button></div>
          {places.isPending && <p className="py-6 text-muted-foreground">Hämtar platser…</p>}
          {cities.map(c => ({city:c,count:locs.filter(l => l.city === c).length})).sort((a,b) => b.count-a.count).slice(0,8).map(c => <Button key={c.city} variant="ghost" className="h-12 w-full justify-between rounded-none border-b border-border px-0" onClick={() => {setCity(c.city);setPage(0);setSection("places");}}><span>{c.city}</span><span className="text-muted-foreground">{fmt(c.count)} <ChevronRight className="ml-2 inline size-4" /></span></Button>)}
        </>}
        {section === "places" && <>
          <div className="mb-4 flex items-center justify-between gap-2"><h2 className="text-xl font-bold">Platser</h2><div className="flex gap-2"><Button variant="outline" size="icon" className="size-11" title="Exportera filtrerade platser" aria-label="Exportera filtrerade platser" disabled={!filtered.length} onClick={exportPlaces}><Download /></Button><Button className="h-11" onClick={() => setSection("new")}><Plus /> Ny plats</Button></div></div>
          <div className="relative mb-3"><Search className="absolute left-3 top-3 size-5 text-muted-foreground" /><Input aria-label="Sök plats eller ort" placeholder="Sök plats eller ort…" className="h-11 pl-10" value={search} onChange={e => {setSearch(e.target.value);setPage(0);}} /></div>
          <div className="mb-3 grid grid-cols-1 gap-2 sm:grid-cols-3"><Picker label="Ort" value={city} onChange={v => {setCity(v);setPage(0);}} options={[{value:"all",label:"Alla orter"},...cities.map(c => ({value:c,label:c}))]} /><Picker label="Kategori" value={category} onChange={v => {setCategory(v);setPage(0);}} options={[{value:"all",label:"Alla kategorier"},...categories.map(c => ({value:c,label:c.charAt(0).toUpperCase()+c.slice(1)}))]} /><Picker label="Status" value={status} onChange={v => {setStatus(v);setPage(0);}} options={[{value:"all",label:"Alla statusar"},{value:"active",label:"Aktiva"},{value:"paused",label:"Pausade"}]} /></div>
          <div className="mb-3 flex items-center justify-between text-xs text-muted-foreground"><span>{fmt(filtered.length)} platser</span><Button variant="ghost" size="sm" onClick={() => {setSearch("");setCity("all");setCategory("all");setStatus("all");setPage(0);}}><X /> Rensa filter</Button></div>
          {places.isPending && <p className="py-10 text-center text-muted-foreground">Hämtar platser…</p>}
          {places.isError && <p role="alert" className="py-6 text-destructive">Kunde inte hämta platser. Försök uppdatera.</p>}
          {!places.isPending && !filtered.length && <p className="py-10 text-center text-muted-foreground">Inga platser matchar din sökning.</p>}
          <ul className="divide-y divide-border">{filtered.slice(currentPage*25,currentPage*25+25).map(l => <li key={l.id} className="flex items-center gap-3 py-4"><span className={`icon-well shrink-0 ${l.active ? "text-accent" : "text-muted-foreground"}`}><CategoryIcon category={l.category} /></span><div className="min-w-0 flex-1"><p className="truncate text-sm font-bold" title={l.name}>{l.name}</p><p className="mt-1 text-xs text-muted-foreground">{l.city} · {l.category}</p><p className="mt-1 font-mono text-xs text-muted-foreground">{l.lat.toFixed(5)}, {l.lng.toFixed(5)}</p></div><div className="flex shrink-0 flex-col items-center gap-2"><Switch aria-label={`Aktivera ${l.name}`} checked={l.active} disabled={busy !== null} onCheckedChange={v => safe(l.id,() => setActive({data:{id:l.id,active:v}}),v?"Platsen är aktiv":"Platsen är pausad")} /><span className={`text-[10px] ${l.active ? "text-primary" : "text-muted-foreground"}`}>{l.active ? "Aktiv" : "Pausad"}</span></div></li>)}</ul>
          {filtered.length > 0 && <div className="mt-5 flex items-center justify-between border-t border-border pt-4"><Button variant="outline" size="icon" className="size-11" aria-label="Föregående sida" disabled={currentPage === 0} onClick={() => setPage(currentPage-1)}><ChevronLeft /></Button><span className="text-xs text-muted-foreground">Sida {currentPage+1} av {pages}</span><Button variant="outline" size="icon" className="size-11" aria-label="Nästa sida" disabled={currentPage+1 >= pages} onClick={() => setPage(currentPage+1)}><ChevronRight /></Button></div>}
        </>}
        {section === "new" && <>
          <h2 className="mb-6 text-xl font-bold">Ny plats</h2>
          <form className="space-y-5" onSubmit={async e => {e.preventDefault();try {const pos=coordinates(nl.coords);const ok=await safe("create",() => create({data:{name:nl.name.trim(),city:nl.city.trim(),description:nl.description,...pos,category:nl.category,xp_reward:Number(nl.xp),coin_reward:Number(nl.coins)}}),"Platsen är skapad");if(ok){setNl(emptyPlace);setSection("places");}}catch(err){toast.error(err instanceof Error ? err.message : "Ogiltig plats");}}}>
            <div className="grid gap-4 sm:grid-cols-2">{[{key:"name",label:"Platsens namn",placeholder:"Namn"},{key:"city",label:"Ort",placeholder:"Ort"}].map(f => <div key={f.key} className="space-y-2"><Label htmlFor={`new-${f.key}`}>{f.label}</Label><Input id={`new-${f.key}`} className="h-12" required minLength={f.key === "name" ? 2 : 1} maxLength={f.key === "name" ? 80 : 60} value={nl[f.key as "name"|"city"]} placeholder={f.placeholder} onChange={e => setNl({...nl,[f.key]:e.target.value})} /></div>)}</div>
            <div className="space-y-2"><Label htmlFor="new-description">Beskrivning</Label><Input id="new-description" className="h-12" maxLength={300} value={nl.description} onChange={e => setNl({...nl,description:e.target.value})} /></div>
            <div className="space-y-2"><Label htmlFor="new-coords">Koordinater</Label><Input id="new-coords" className="h-12 font-mono" required placeholder="Latitud, longitud" value={nl.coords} onChange={e => setNl({...nl,coords:e.target.value})} /></div>
            <div className="space-y-2"><Label>Kategori</Label><Picker label="Kategori för ny plats" value={nl.category} onChange={v => {const c=createCategories.find(c => c===v);if(c)setNl({...nl,category:c});}} options={createCategories.map(c => ({value:c,label:c.charAt(0).toUpperCase()+c.slice(1)}))} /></div>
            <h3 className="border-t border-border pt-5 font-bold">Belöning vid upptäckt</h3><div className="grid grid-cols-2 gap-4">{[{key:"xp",label:"XP"},{key:"coins",label:"Coins"}].map(f => <div key={f.key} className="space-y-2"><Label htmlFor={`new-${f.key}`}>{f.label}</Label><Input id={`new-${f.key}`} className="h-12" type="number" required min={0} max={5000} step={1} value={nl[f.key as "xp"|"coins"]} onChange={e => setNl({...nl,[f.key]:e.target.value})} /></div>)}</div>
            <Button className="h-12 w-full sm:w-auto" type="submit" disabled={busy !== null}>{busy === "create" ? <LoaderCircle className="animate-spin" /> : <Plus />} Skapa plats</Button>
          </form>
        </>}
        {section === "settings" && <>
          <h2 className="mb-5 text-xl font-bold">Spelvärden</h2><div className="relative mb-6"><Search className="absolute left-3 top-3 size-5 text-muted-foreground" /><Input className="h-11 pl-10" aria-label="Sök inställning" placeholder="Sök inställning…" value={configSearch} onChange={e => setConfigSearch(e.target.value)} /></div>
          {["Mark","Dagliga belöningar","Socialt","GPS & upptäckter"].map(group => {const rows=settings.filter(c => settingGroup(c.key)===group);return rows.length>0 && <section key={group} className="mb-7"><h3 className="mb-1 flex items-center gap-2 border-b border-border pb-3 font-bold"><SlidersHorizontal className="size-4 text-accent" />{group}</h3>{rows.map(c => {const value=vals[c.key] ?? String(c.value);const changed=value!==String(c.value);return <div key={c.key} className="grid grid-cols-[1fr_auto] items-center gap-x-3 gap-y-2 border-b border-border py-4 sm:grid-cols-[1fr_100px_44px]"><Label htmlFor={`cfg-${c.key}`} className="col-span-2 text-sm leading-relaxed sm:col-span-1">{c.label}</Label><Input id={`cfg-${c.key}`} className="h-11 w-full sm:w-24" type="number" min={0} max={1000000} step="any" value={value} onChange={e => setVals({...vals,[c.key]:e.target.value})} /><Button size="icon" variant={changed ? "default" : "outline"} className="size-11" title={`Spara ${c.label}`} aria-label={`Spara ${c.label}`} disabled={!changed || busy !== null || !value.trim() || !Number.isFinite(Number(value)) || Number(value)<0 || Number(value)>1000000} onClick={() => safe(c.key,() => upd({data:{key:c.key,value:Number(value)}}))}>{busy===c.key ? <LoaderCircle className="animate-spin" /> : <Save />}</Button></div>;})}</section>;})}
          {!settings.length && <p className="text-muted-foreground">Inga inställningar matchar sökningen.</p>}
        </>}
        {section === "access" && <>
          <h2 className="mb-6 text-xl font-bold">Behörigheter</h2><div className="mb-6 flex items-center gap-3 border-b border-border pb-5"><span className="icon-well text-primary"><ShieldCheck /></span><div><p className="font-bold">{p.username}</p><p className="mt-1 text-xs text-muted-foreground">Administratör{p.roles.includes("founder") ? " · Grundare" : ""}</p></div></div>
          <div className="space-y-2"><Label htmlFor="grant-name">Spelarens användarnamn</Label><Input id="grant-name" className="h-12" placeholder="Användarnamn" value={grantName} onChange={e => setGrantName(e.target.value)} /></div>
          <div className="mt-5 grid gap-3 sm:grid-cols-2"><Button variant="outline" className="h-16 justify-start" disabled={grantName.trim().length<2 || busy !== null} onClick={() => setRole("admin")}><ShieldCheck className="text-primary" /> Tilldela admin</Button><Button variant="outline" className="h-16 justify-start" disabled={grantName.trim().length<2 || busy !== null} onClick={() => setRole("founder")}><Crown className="text-gold" /> Tilldela grundare</Button></div>
          <Dialog open={role !== null} onOpenChange={v => {if(!v)setRole(null);}}><DialogContent className="max-w-[calc(100%-2rem)] rounded-lg sm:max-w-md"><DialogHeader><DialogTitle>{role === "admin" ? "Tilldela administratör?" : "Tilldela grundare?"}</DialogTitle><DialogDescription>{role === "admin" ? `${grantName} får tillgång till admin, platser och spelvärden.` : `${grantName} får grundarrollen, nivå 10 000, en miljard XP och coins, och döljs på topplistan.`}</DialogDescription></DialogHeader><DialogFooter><Button variant="outline" onClick={() => setRole(null)}>Avbryt</Button><Button disabled={busy !== null} onClick={async () => {if(!role)return;const ok=await safe("role",() => grant({data:{username:grantName.trim(),role}}),"Rollen är tilldelad");if(ok){setRole(null);setGrantName("");}}}>Bekräfta</Button></DialogFooter></DialogContent></Dialog>
        </>}
        {section === "gps" && <>
          <h2 className="mb-6 text-xl font-bold">GPS & test</h2><div className="mb-6 flex items-center gap-3 border-b border-border pb-5"><span className={`icon-well ${geo.simulated ? "text-gold" : "text-primary"}`}><LocateFixed /></span><div><p className="font-bold">{geo.simulated ? "Testposition aktiv" : "Riktig GPS"}</p><p className="mt-1 font-mono text-xs text-muted-foreground">{geo.lat != null && geo.lng != null ? `${geo.lat.toFixed(6)}, ${geo.lng.toFixed(6)}` : "Ingen position tillgänglig"}</p></div></div>
          <form className="space-y-4" onSubmit={e => {e.preventDefault();try {simulatePosition(coordinates(sim));toast.success("Testposition aktiverad");}catch(err){toast.error(err instanceof Error ? err.message : "Ogiltig position");}}}><Label htmlFor="test-coords">Testkoordinater</Label><Input id="test-coords" className="h-12 font-mono" placeholder="Latitud, longitud" required value={sim} onChange={e => setSim(e.target.value)} /><div className="flex flex-wrap gap-2"><Button type="submit" className="h-12"><LocateFixed /> Aktivera testposition</Button>{geo.simulated && <Button type="button" variant="outline" className="h-12" onClick={() => {simulatePosition(null);toast.success("Riktig GPS aktiverad");}}><Navigation /> Återställ GPS</Button>}</div></form>
          <Button asChild variant="outline" className="mt-6 h-12"><Link to="/karta"><MapPin /> Öppna kartan <ArrowUpRight /></Link></Button>
        </>}
        {places.isError && section === "overview" && <p role="alert" className="text-destructive">Kunde inte hämta platser. Försök uppdatera.</p>}
      </div>
    </div>
  </AppShell>;
}

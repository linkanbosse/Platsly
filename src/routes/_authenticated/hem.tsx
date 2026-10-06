import { CalendarClock, ShoppingBag, Bell } from "lucide-react";
import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useEffect, useMemo, useState } from "react";
import { Flame, MapPin, Sparkles, Gift, Coins, Users, ChevronRight, Target, Medal } from "lucide-react";
import { AppShell, Card } from "@/components/game/AppShell";
import { CategoryIcon } from "@/components/game/CategoryIcon";
import { Celebration, type CelebrationData } from "@/components/game/Celebration";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { useServerFn } from "@tanstack/react-start";
import { claimDaily, collectCoins } from "@/lib/game.functions";
import { fmt, formatDistance, haversine, levelProgress } from "@/lib/game";
import { useGeo } from "@/lib/geo";
import { achievementsQuery, locationsQuery, missionsQuery, myDiscoveriesQuery, myParcelsQuery, notificationsQuery, profileQuery } from "@/lib/queries";
import { isInSweden, OUTSIDE_MESSAGE } from "@/lib/sweden";

export const Route = createFileRoute("/_authenticated/hem")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Hem — PLATSLY" },
      { name: "description", content: "Din översikt i PLATSLY: nivå, coins, streak och upptäckter nära dig." },
      { property: "og:title", content: "Hem — PLATSLY" },
      { property: "og:description", content: "Din översikt i PLATSLY." },
    ],
  }),
  component: Home,
});

function Home() {
  const navigate = useNavigate();
  const { data: p } = useQuery(profileQuery);
  const unread = useQuery(notificationsQuery).data?.filter((n) => !n.read).length ?? 0;
  const { data: locs } = useQuery(locationsQuery);
  const { data: disc } = useQuery(myDiscoveriesQuery);
  const { data: parcels } = useQuery(myParcelsQuery);
  const { data: missions } = useQuery(missionsQuery);
  const { data: ach } = useQuery(achievementsQuery);
  const geo = useGeo();
  const { run, busy } = useGameAction();
  const daily = useServerFn(claimDaily);
  const collect = useServerFn(collectCoins);
  const [cel, setCel] = useState<CelebrationData | null>(null);

  useEffect(() => {
    if (p && !p.onboarded) navigate({ to: "/onboarding", replace: true });
  }, [p, navigate]);

  const nearby = useMemo(() => {
    const lat = geo.lat, lng = geo.lng;
    if (!locs || lat == null || lng == null) return [];
    const found = new Set(disc?.map((d) => d.location_id));
    return locs
      .filter((l) => !found.has(l.id))
      .map((l) => ({ ...l, dist: haversine(lat, lng, l.lat, l.lng) }))
      .sort((a, b) => a.dist - b.dist)
      .slice(0, 3);
  }, [locs, disc, geo.lat, geo.lng]);

  if (!p) return <AppShell><div className="mt-20 text-center text-muted-foreground">Laddar…</div></AppShell>;

  const lp = levelProgress(p.xp, p.level);
  const todayStr = new Date().toLocaleDateString("sv-SE", { timeZone: "Europe/Stockholm" });
  const dailyDone = p.last_daily === todayStr;
  const outside = geo.status === "ok" && geo.lat != null && geo.lng != null && !isInSweden(geo.lat, geo.lng);
  const activeMissions = (missions ?? []).filter((m) => !m.claimed).slice(0, 3);
  const recentAch = (ach ?? []).filter((a) => a.unlocked).slice(0, 4);

  return (
    <AppShell>
      <header className="mb-5 flex items-center gap-3 animate-rise">
        <div className="grid size-14 place-items-center rounded-2xl bg-aurora text-3xl shadow-glow">{p.avatar_emoji}</div>
        <div className="min-w-0 flex-1">
          <p className="text-sm text-muted-foreground">Hej,</p>
          <h1 className="truncate text-2xl font-bold">{p.username}</h1>
        </div>
        <div className="flex items-center gap-1 rounded-full glass px-3 py-2 font-bold text-gold">
          <Flame className="size-5" /> {p.streak}
        </div>
      </header>

      {outside && <Card className="mb-4 border-destructive/40 text-center font-semibold">{OUTSIDE_MESSAGE}</Card>}

      <Card className="mb-4">
        <div className="flex items-baseline justify-between">
          <span className="font-display text-sm font-bold tracking-widest text-muted-foreground">NIVÅ</span>
          <span className="font-display text-4xl font-extrabold">{fmt(p.level)}</span>
        </div>
        <Progress value={lp.pct} className="mt-3 h-3" />
        <p className="mt-2 text-sm text-muted-foreground">{fmt(lp.cur)} / {fmt(lp.need)} XP</p>
        <div className="mt-4 flex items-center justify-between rounded-2xl bg-gold/10 px-4 py-3">
          <span className="flex items-center gap-2 font-semibold"><Coins className="size-5 text-gold" /> PLATSLY Coins</span>
          <span className="font-display text-xl font-bold text-gold">{fmt(p.coins)}</span>
        </div>
      </Card>

      <div className="mb-4 grid grid-cols-2 gap-3">
        <Button
          disabled={dailyDone || busy}
          onClick={() => run(() => daily(), (r) => setCel({ title: "Daglig belöning!", subtitle: `Streak: ${(r.data as { streak: number }).streak} dagar 🔥`, icon: "🎁" }))}
          className="min-h-24 h-auto flex-col gap-2 rounded-lg px-2 py-4 text-sm font-bold whitespace-normal text-center [&_svg]:size-6"
          variant={dailyDone ? "secondary" : "default"}
        >
          <Gift strokeWidth={1.8} />
          {dailyDone ? "Hämtad idag" : "Daglig belöning"}
        </Button>
        <Button
          disabled={busy || !parcels?.length}
          onClick={() => run(() => collect(), (r) => setCel({ title: "Insamlat!", subtitle: "Din mark har varit flitig", coins: Number((r.data as { coins: number }).coins), icon: "🌾" }))}
          variant="secondary"
          className="min-h-24 h-auto flex-col gap-2 rounded-lg px-2 py-4 text-sm font-bold whitespace-normal text-center [&_svg]:size-6"
        >
          <Coins strokeWidth={1.8} />
          Samla från mark ({parcels?.length ?? 0})
        </Button>
      </div>

      <Card className="mb-4">
        <h2 className="mb-3 flex items-center gap-2 text-lg font-bold"><Sparkles className="size-5 text-primary" /> Nära dig</h2>
        {geo.status === "denied" && <p className="text-muted-foreground">Tillåt platsåtkomst i webbläsaren för att se upptäckter nära dig.</p>}
        {geo.status === "pending" && <p className="text-muted-foreground">Hämtar din position…</p>}
        {nearby.length > 0 && (
          <>
            <p className="mb-3 text-sm text-muted-foreground">📍 {nearby.filter((n) => n.dist < 5000).length} upptäckter inom 5 km</p>
            <ul className="space-y-2">
              {nearby.map((l) => (
                <li key={l.id} className="flex items-center gap-3 rounded-2xl bg-muted/50 p-3">
                  <span className="icon-well shrink-0 text-accent"><CategoryIcon category={l.category} /></span>
                  <div className="min-w-0 flex-1">
                    <p className="truncate font-semibold">{l.name}</p>
                    <p className="text-xs text-muted-foreground">{l.city}</p>
                  </div>
                  <span className="text-sm font-bold text-primary">{formatDistance(l.dist)}</span>
                </li>
              ))}
            </ul>
          </>
        )}
        <Button asChild className="mt-4 h-12 w-full rounded-lg font-bold"><Link to="/karta">
          <MapPin className="size-5" /> Öppna kartan
        </Link></Button>
      </Card>

      <Button asChild variant="outline" className="mb-4 h-18 w-full justify-start gap-3 rounded-lg bg-card px-4 whitespace-normal"><Link to="/socialt"><span className="icon-well shrink-0 text-accent"><Users /></span><span className="flex-1 text-left font-bold">Vänner, lag & utmaningar</span><ChevronRight className="text-primary" /></Link></Button>
      <div className="mb-4 grid grid-cols-3 gap-2">
        {([["/live", "Evenemang", CalendarClock], ["/butik", "Butik", ShoppingBag], ["/notiser", "Notiser", Bell]] as const).map(([to, label, Icon]) => (
          <Button key={to} asChild variant="outline" className="relative h-20 flex-col gap-2 rounded-lg bg-card text-xs font-bold"><Link to={to}><Icon className="size-5 text-accent" />{label}{to === "/notiser" && unread > 0 && <span className="absolute right-2 top-2 rounded-full bg-primary px-1.5 text-[10px] text-primary-foreground">{unread}</span>}</Link></Button>
        ))}
      </div>

      <Card className="mb-4">
        <div className="mb-3 flex items-center justify-between">
          <h2 className="flex items-center gap-2 text-lg font-bold"><Target className="size-5 text-primary" /> Aktiva uppdrag</h2>
          <Link to="/uppdrag" className="text-sm font-semibold text-primary">Alla</Link>
        </div>
        {activeMissions.length === 0 && <p className="text-muted-foreground">Alla uppdrag klara. Snyggt!</p>}
        <ul className="space-y-3">
          {activeMissions.map((m) => (
            <li key={m.id}>
              <div className="flex justify-between text-sm"><span className="font-semibold">{m.title}</span><span className="text-muted-foreground">{m.progress}/{m.target}</span></div>
              <Progress value={(m.progress / m.target) * 100} className="mt-1 h-2" />
            </li>
          ))}
        </ul>
      </Card>

      {recentAch.length > 0 && (
        <Card>
          <h2 className="mb-3 flex items-center gap-2 text-lg font-bold"><Medal className="size-5 text-gold" /> Senaste prestationer</h2>
          <div className="flex gap-3 overflow-x-auto">
            {recentAch.map((a) => (
              <div key={a.code} className="flex min-w-20 flex-col items-center rounded-2xl bg-muted/50 p-3 text-center">
                <span className="text-3xl">{a.icon}</span>
                <span className="mt-1 text-xs font-semibold">{a.title}</span>
              </div>
            ))}
          </div>
        </Card>
      )}
      <Celebration data={cel} onClose={() => setCel(null)} />
    </AppShell>
  );
}

import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { Settings, Shield, Users, Sparkles, Flag, Flame, Medal, Coins, ChevronRight } from "lucide-react";
import { AppShell, Card } from "@/components/game/AppShell";
import { Progress } from "@/components/ui/progress";
import { Button } from "@/components/ui/button";
import { fmt, levelProgress } from "@/lib/game";
import { achievementsQuery, profileQuery } from "@/lib/queries";

export const Route = createFileRoute("/_authenticated/profil")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Profil — PLATSLY" },
      { name: "description", content: "Din spelarprofil, statistik och prestationer." },
      { property: "og:title", content: "Profil — PLATSLY" },
      { property: "og:description", content: "Din spelarprofil i PLATSLY." },
    ],
  }),
  component: Profile,
});

function Profile() {
  const { data: p } = useQuery(profileQuery);
  const { data: ach } = useQuery(achievementsQuery);
  if (!p) return <AppShell><p className="mt-20 text-center text-muted-foreground">Laddar…</p></AppShell>;
  const lp = levelProgress(p.xp, p.level);
  const founder = p.roles.includes("founder");
  const isAdmin = p.roles.includes("admin");
  const stats = [
    { label: "Upptäckter", value: p.discoveries_count, icon: Sparkles, tone: "text-accent" },
    { label: "Mark", value: p.parcels_count, icon: Flag, tone: "text-primary" },
    { label: "Streak", value: p.streak, icon: Flame, tone: "text-gold" },
    { label: "Prestationer", value: (ach ?? []).filter((a) => a.unlocked).length, icon: Medal, tone: "text-gold" },
  ];
  return (
    <AppShell>
      <div className="mb-4 flex justify-end gap-2 animate-rise">
        <Button asChild variant="outline" size="icon" className="size-11"><Link to="/installningar" title="Inställningar" aria-label="Inställningar"><Settings /></Link></Button>
      </div>
      <div className="mb-6 flex flex-col items-center text-center animate-rise">
        <div className={`grid size-28 place-items-center rounded-[2rem] bg-aurora text-6xl shadow-glow ${founder ? "ring-4 ring-gold" : ""}`}>{p.avatar_emoji}</div>
        <h1 className="mt-4 text-3xl font-bold">{p.username}</h1>
        {founder && <span className="mt-2 rounded-full bg-gold/20 px-3 py-1 text-xs font-bold tracking-widest text-gold">👑 GRUNDARE</span>}
        <p className="mt-2 font-mono text-sm text-muted-foreground">{p.player_id}</p>
      </div>
      <Card className="mb-4">
        <div className="flex justify-between font-bold"><span>Nivå {fmt(p.level)}</span><span className="flex items-center gap-2 text-gold"><Coins className="size-5" /> {fmt(p.coins)}</span></div>
        <Progress value={lp.pct} className="mt-3 h-3" />
        <p className="mt-2 text-sm text-muted-foreground">{fmt(lp.cur)} / {fmt(lp.need)} XP till nästa nivå</p>
      </Card>
      <div className="mb-4 grid grid-cols-2 gap-3">
        {stats.map((s) => (
          <Card key={s.label} className="text-center">
            <s.icon className={`mx-auto mb-2 size-6 ${s.tone}`} strokeWidth={1.8} />
            <div className="font-display text-2xl font-bold">{fmt(s.value)}</div>
            <div className="text-xs text-muted-foreground">{s.label}</div>
          </Card>
        ))}
      </div>
      <nav aria-label="Profilmeny" className="mb-6 divide-y divide-border border-y border-border">
        <Button asChild variant="ghost" className="h-16 w-full justify-start rounded-none px-2"><Link to="/socialt"><span className="icon-well text-accent"><Users /></span>Vänner & lag<ChevronRight className="ml-auto text-muted-foreground" /></Link></Button>
        {isAdmin && <Button asChild variant="ghost" className="h-16 w-full justify-start rounded-none px-2"><Link to="/admin"><span className="icon-well text-primary"><Shield /></span>Admin · Kontrollrum<ChevronRight className="ml-auto text-muted-foreground" /></Link></Button>}
        <Button asChild variant="ghost" className="h-16 w-full justify-start rounded-none px-2"><Link to="/installningar"><span className="icon-well text-muted-foreground"><Settings /></span>Inställningar<ChevronRight className="ml-auto text-muted-foreground" /></Link></Button>
      </nav>
      <p className="text-center text-xs text-muted-foreground">Medlem sedan {new Date(p.created_at).toLocaleDateString("sv-SE")}</p>
    </AppShell>
  );
}

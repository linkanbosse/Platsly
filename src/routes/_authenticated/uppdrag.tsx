import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { claimMission } from "@/lib/game.functions";
import { achievementsQuery, missionsQuery } from "@/lib/queries";
import { toast } from "sonner";

export const Route = createFileRoute("/_authenticated/uppdrag")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Uppdrag — PLATSLY" },
      { name: "description", content: "Dagliga och veckovisa uppdrag samt prestationer i PLATSLY." },
      { property: "og:title", content: "Uppdrag — PLATSLY" },
      { property: "og:description", content: "Dagliga och veckovisa uppdrag i PLATSLY." },
    ],
  }),
  component: Missions,
});

function Missions() {
  const { data: missions } = useQuery(missionsQuery);
  const { data: ach } = useQuery(achievementsQuery);
  const { run, busy } = useGameAction();
  const claim = useServerFn(claimMission);

  const groups = [
    { key: "daily", title: "Dagliga uppdrag", sub: "Nollställs vid midnatt" },
    { key: "weekly", title: "Veckans uppdrag", sub: "Nollställs på måndag" },
  ];

  return (
    <AppShell>
      <PageTitle sub="Klara uppdrag för XP och coins">Uppdrag</PageTitle>
      {groups.map((g) => (
        <Card key={g.key} className="mb-4">
          <h2 className="text-lg font-bold">{g.title}</h2>
          <p className="mb-3 text-xs text-muted-foreground">{g.sub}</p>
          <ul className="space-y-4">
            {(missions ?? []).filter((m) => m.period === g.key).map((m) => {
              const done = m.progress >= m.target;
              return (
                <li key={m.id} className="rounded-2xl bg-muted/40 p-3">
                  <div className="flex items-start justify-between gap-3">
                    <div>
                      <p className="font-semibold">{m.title}</p>
                      <p className="text-sm text-muted-foreground">{m.description}</p>
                    </div>
                    <span className="shrink-0 text-xs font-bold text-gold">+{m.coin_reward} 💰</span>
                  </div>
                  <Progress value={(m.progress / m.target) * 100} className="mt-2 h-2" />
                  <div className="mt-2 flex items-center justify-between">
                    <span className="text-xs text-muted-foreground">{m.progress}/{m.target} · +{m.xp_reward} XP</span>
                    {m.claimed ? (
                      <span className="text-sm font-semibold text-primary">✅ Hämtad</span>
                    ) : (
                      <Button size="sm" disabled={!done || busy || !m.playerMissionId} className="min-h-10 rounded-xl font-bold" onClick={() => run(() => claim({ data: { id: m.playerMissionId! } }), () => toast.success(`+${m.xp_reward} XP, +${m.coin_reward} coins`))}>
                        {done ? "Hämta" : "Pågår"}
                      </Button>
                    )}
                  </div>
                </li>
              );
            })}
          </ul>
        </Card>
      ))}
      <Card>
        <h2 className="mb-3 text-lg font-bold">🏅 Prestationer</h2>
        <div className="grid grid-cols-3 gap-3">
          {(ach ?? []).map((a) => (
            <div key={a.code} className={`flex flex-col items-center rounded-2xl p-3 text-center ${a.unlocked ? "bg-primary/10" : "bg-muted/40 opacity-50 grayscale"}`}>
              <span className="text-3xl">{a.icon}</span>
              <span className="mt-1 text-xs font-bold">{a.title}</span>
              <span className="mt-1 text-[10px] text-muted-foreground">{a.description}</span>
            </div>
          ))}
        </div>
      </Card>
    </AppShell>
  );
}

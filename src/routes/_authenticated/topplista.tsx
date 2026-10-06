import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useState } from "react";
import { Sparkles, Flag, Zap } from "lucide-react";
import { Button } from "@/components/ui/button";
import { AppShell, PageTitle } from "@/components/game/AppShell";
import { supabase } from "@/integrations/supabase/client";
import { fmt } from "@/lib/game";
import { profileQuery } from "@/lib/queries";

export const Route = createFileRoute("/_authenticated/topplista")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Topplista — PLATSLY" },
      { name: "description", content: "Se vem som utforskat mest av Sverige." },
      { property: "og:title", content: "Topplista — PLATSLY" },
      { property: "og:description", content: "Se vem som utforskat mest av Sverige." },
    ],
  }),
  component: Leaderboard,
});

const tabs = [
  { key: "xp", label: "XP", icon: Zap },
  { key: "discoveries_count", label: "Upptäckter", icon: Sparkles },
  { key: "parcels_count", label: "Mark", icon: Flag },
] as const;

function Leaderboard() {
  const [tab, setTab] = useState<(typeof tabs)[number]["key"]>("xp");
  const { data: me } = useQuery(profileQuery);
  const { data: rows } = useQuery({
    queryKey: ["leaderboard", tab],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("profiles")
        .select("id, username, avatar_emoji, level, xp, discoveries_count, parcels_count")
        .eq("show_on_leaderboard", true)
        .order(tab, { ascending: false })
        .limit(50);
      if (error) throw error;
      return data;
    },
  });

  return (
    <AppShell>
      <PageTitle sub="Hela Sverige">Topplista</PageTitle>
      <div aria-label="Topplistans vyer" className="mb-4 grid grid-cols-3 gap-1 border-b border-border pb-3">
        {tabs.map((t) => (
          <Button variant="ghost" aria-pressed={tab === t.key} key={t.key} onClick={() => setTab(t.key)} className={`h-16 flex-col gap-2 rounded-lg px-0 text-xs font-bold [&_svg]:size-5 ${tab === t.key ? "bg-primary/10 text-primary" : "text-muted-foreground"}`}>
            <t.icon strokeWidth={1.8} />
            {t.label}
          </Button>
        ))}
      </div>
      <ol className="space-y-2">
        {(rows ?? []).map((r, i) => (
          <li key={r.id} className={`glass flex items-center gap-3 rounded-2xl p-3 animate-rise ${r.id === me?.id ? "ring-2 ring-primary" : ""}`}>
            <span className={`w-8 text-center font-display text-lg font-extrabold ${i < 3 ? "text-gold" : "text-muted-foreground"}`}>{i < 3 ? ["🥇", "🥈", "🥉"][i] : i + 1}</span>
            <span className="text-2xl">{r.avatar_emoji}</span>
            <div className="min-w-0 flex-1">
              <p className="truncate font-semibold">{r.username}</p>
              <p className="text-xs text-muted-foreground">Nivå {r.level}</p>
            </div>
            <span className="font-display font-bold">{fmt(Number(r[tab]))}</span>
          </li>
        ))}
        {rows?.length === 0 && <p className="text-center text-muted-foreground">Inga spelare än — bli först!</p>}
      </ol>
    </AppShell>
  );
}

import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { useEffect, useState } from "react";
import { Users, Flag, Swords, UserPlus } from "lucide-react";
import { toast } from "sonner";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { supabase } from "@/integrations/supabase/client";
import { fmt } from "@/lib/game";
import { cfgValue, configQuery, profileQuery } from "@/lib/queries";
import {
  createChallenge, createTeam, joinTeam, leaveTeam, redeemInvite, respondChallenge,
  respondFriend, sendFriendRequest, syncChallenges,
} from "@/lib/social.functions";

export const Route = createFileRoute("/_authenticated/socialt")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Socialt — PLATSLY" },
      { name: "description", content: "Vänner, lag, utmaningar och inbjudningar i PLATSLY." },
      { property: "og:title", content: "Socialt — PLATSLY" },
      { property: "og:description", content: "Spela tillsammans med vänner och lag." },
    ],
  }),
  component: Social,
});

const tabs = [
  { key: "friends", label: "Vänner", icon: Users },
  { key: "teams", label: "Lag", icon: Flag },
  { key: "challenges", label: "Utmaningar", icon: Swords },
  { key: "invite", label: "Bjud in", icon: UserPlus },
] as const;
type Tab = (typeof tabs)[number]["key"];

type Mini = { id: string; username: string; avatar_emoji: string; level: number; xp: number; discoveries_count: number; parcels_count: number };
const miniCols = "id, username, avatar_emoji, level, xp, discoveries_count, parcels_count";

async function profilesById(ids: string[]) {
  if (!ids.length) return new Map<string, Mini>();
  const { data } = await supabase.from("profiles").select(miniCols).in("id", ids);
  return new Map((data ?? []).map((p) => [p.id, p as Mini]));
}

function Social() {
  const [tab, setTab] = useState<Tab>("friends");
  const { data: me } = useQuery(profileQuery);
  return (
    <AppShell>
      <PageTitle sub="Spela tillsammans">Socialt</PageTitle>
      <div aria-label="Sociala vyer" className="mb-5 grid grid-cols-4 gap-1 border-b border-border pb-3">
        {tabs.map((t) => (
          <Button variant="ghost" aria-pressed={tab === t.key} key={t.key} onClick={() => setTab(t.key)} className={`h-16 flex-col gap-2 rounded-lg px-0 text-[10px] font-bold [&_svg]:size-5 ${tab === t.key ? "bg-primary/10 text-primary" : "text-muted-foreground"}`}>
            <t.icon strokeWidth={1.8} />
            {t.label}
          </Button>
        ))}
      </div>
      {me && tab === "friends" && <Friends meId={me.id} />}
      {me && tab === "teams" && <Teams meId={me.id} />}
      {me && tab === "challenges" && <Challenges meId={me.id} />}
      {me && tab === "invite" && <Invite playerId={me.player_id} invited={!!me.invited_by} />}
    </AppShell>
  );
}

function useFriends(meId: string) {
  return useQuery({
    queryKey: ["friends"],
    queryFn: async () => {
      const { data } = await supabase.from("friendships").select("*");
      const rows = data ?? [];
      const map = await profilesById(rows.map((r) => (r.requester === meId ? r.addressee : r.requester)));
      return rows.map((r) => ({ ...r, other: map.get(r.requester === meId ? r.addressee : r.requester) }));
    },
  });
}

function Person({ p, right }: { p?: Mini | undefined; right?: React.ReactNode }) {
  return (
    <li className="glass flex items-center gap-3 rounded-2xl p-3">
      <span className="text-2xl">{p?.avatar_emoji ?? "🧭"}</span>
      <div className="min-w-0 flex-1">
        <p className="truncate font-semibold">{p?.username ?? "Okänd"}</p>
        <p className="text-xs text-muted-foreground">Nivå {p?.level ?? 1} · {fmt(p?.xp ?? 0)} XP</p>
      </div>
      {right}
    </li>
  );
}

function Friends({ meId }: { meId: string }) {
  const { data } = useFriends(meId);
  const { run, busy } = useGameAction();
  const send = useServerFn(sendFriendRequest);
  const respond = useServerFn(respondFriend);
  const [q, setQ] = useState("");
  const accepted = (data ?? []).filter((f) => f.status === "accepted");
  const incoming = (data ?? []).filter((f) => f.status === "pending" && f.addressee === meId);
  const outgoing = (data ?? []).filter((f) => f.status === "pending" && f.requester === meId);
  return (
    <div className="space-y-4">
      <Card>
        <p className="mb-2 font-semibold">Lägg till vän</p>
        <div className="flex gap-2">
          <Input className="h-12 rounded-xl" placeholder="Användarnamn eller spelar-ID" value={q} onChange={(e) => setQ(e.target.value)} />
          <Button className="h-12 rounded-xl" disabled={busy || q.trim().length < 2}
            onClick={() => run(() => send({ data: { query: q } }), (r) => { setQ(""); toast.success(r.data?.["accepted"] ? "Ni är nu vänner!" : "Förfrågan skickad!"); })}>
            Skicka
          </Button>
        </div>
      </Card>
      {incoming.length > 0 && (
        <section>
          <h2 className="mb-2 font-bold">Förfrågningar</h2>
          <ul className="space-y-2">
            {incoming.map((f) => (
              <Person key={f.id} p={f.other} right={
                <div className="flex gap-1">
                  <Button size="sm" disabled={busy} onClick={() => run(() => respond({ data: { id: f.id, accept: true } }))}>Acceptera</Button>
                  <Button size="sm" variant="secondary" disabled={busy} onClick={() => run(() => respond({ data: { id: f.id, accept: false } }))}>Nej</Button>
                </div>
              } />
            ))}
          </ul>
        </section>
      )}
      <section>
        <h2 className="mb-2 font-bold">Mina vänner ({accepted.length})</h2>
        <ul className="space-y-2">
          {accepted.map((f) => (
            <Person key={f.id} p={f.other} right={
              <Button size="sm" variant="ghost" disabled={busy} onClick={() => run(() => respond({ data: { id: f.id, accept: false } }))}>Ta bort</Button>
            } />
          ))}
          {accepted.length === 0 && <p className="text-sm text-muted-foreground">Inga vänner än. Lägg till någon ovan eller bjud in en kompis!</p>}
        </ul>
      </section>
      {outgoing.length > 0 && (
        <section>
          <h2 className="mb-2 font-bold">Skickade</h2>
          <ul className="space-y-2">
            {outgoing.map((f) => (
              <Person key={f.id} p={f.other} right={<span className="text-xs text-muted-foreground">Väntar…</span>} />
            ))}
          </ul>
        </section>
      )}
    </div>
  );
}

function Teams({ meId }: { meId: string }) {
  const { run, busy } = useGameAction();
  const create = useServerFn(createTeam);
  const join = useServerFn(joinTeam);
  const leave = useServerFn(leaveTeam);
  const [name, setName] = useState("");
  const [emoji, setEmoji] = useState("🛡️");
  const { data } = useQuery({
    queryKey: ["teams"],
    queryFn: async () => {
      const [{ data: teams }, { data: members }] = await Promise.all([
        supabase.from("teams").select("*"),
        supabase.from("team_members").select("team_id, user_id"),
      ]);
      const map = await profilesById((members ?? []).map((m) => m.user_id));
      return (teams ?? [])
        .map((t) => {
          const mem = (members ?? []).filter((m) => m.team_id === t.id).map((m) => map.get(m.user_id)).filter(Boolean) as Mini[];
          return { ...t, members: mem, xp: mem.reduce((s, m) => s + Number(m.xp), 0) };
        })
        .sort((a, b) => b.xp - a.xp);
    },
  });
  const mine = data?.find((t) => t.members.some((m) => m.id === meId));
  return (
    <div className="space-y-4">
      {mine ? (
        <Card>
          <div className="flex items-center gap-3">
            <span className="text-4xl">{mine.emoji}</span>
            <div className="flex-1">
              <p className="text-xl font-bold">{mine.name}</p>
              <p className="text-sm text-muted-foreground">{mine.members.length} medlemmar · {fmt(mine.xp)} XP</p>
            </div>
          </div>
          <ul className="mt-3 space-y-2">
            {mine.members.map((m) => <Person key={m.id} p={m} right={m.id === mine.owner_id ? <span className="text-xs text-gold">Ledare</span> : null} />)}
          </ul>
          <Button variant="secondary" className="mt-3 h-11 w-full rounded-xl" disabled={busy} onClick={() => run(() => leave())}>Lämna laget</Button>
        </Card>
      ) : (
        <Card>
          <p className="mb-2 font-semibold">Skapa lag</p>
          <div className="flex gap-2">
            <Input className="h-12 w-16 rounded-xl text-center text-xl" value={emoji} maxLength={4} onChange={(e) => setEmoji(e.target.value)} />
            <Input className="h-12 rounded-xl" placeholder="Lagnamn" value={name} onChange={(e) => setName(e.target.value)} />
          </div>
          <Button className="mt-2 h-12 w-full rounded-xl" disabled={busy || name.trim().length < 3}
            onClick={() => run(() => create({ data: { name, emoji } }), () => { setName(""); toast.success("Laget är skapat!"); })}>
            Skapa
          </Button>
        </Card>
      )}
      <section>
        <h2 className="mb-2 font-bold">Lagtopplista</h2>
        <ol className="space-y-2">
          {(data ?? []).map((t, i) => (
            <li key={t.id} className={`glass flex items-center gap-3 rounded-2xl p-3 ${t.id === mine?.id ? "ring-2 ring-primary" : ""}`}>
              <span className="w-6 text-center font-display font-extrabold text-muted-foreground">{i + 1}</span>
              <span className="text-2xl">{t.emoji}</span>
              <div className="min-w-0 flex-1">
                <p className="truncate font-semibold">{t.name}</p>
                <p className="text-xs text-muted-foreground">{t.members.length} medlemmar · {fmt(t.xp)} XP</p>
              </div>
              {!mine && <Button size="sm" disabled={busy} onClick={() => run(() => join({ data: { id: t.id } }), () => toast.success(`Välkommen till ${t.name}!`))}>Gå med</Button>}
            </li>
          ))}
          {data?.length === 0 && <p className="text-sm text-muted-foreground">Inga lag än — skapa det första!</p>}
        </ol>
      </section>
    </div>
  );
}

const metricLabel = { discover: "Flest upptäckter", claim: "Mest mark" } as const;

function Challenges({ meId }: { meId: string }) {
  const { run, busy } = useGameAction();
  const sync = useServerFn(syncChallenges);
  const create = useServerFn(createChallenge);
  const respond = useServerFn(respondChallenge);
  const { data: friends } = useFriends(meId);
  const { data: cfg } = useQuery(configQuery);
  const [ready, setReady] = useState(false);
  useEffect(() => { sync().finally(() => setReady(true)); }, [sync]);
  const { data } = useQuery({
    queryKey: ["challenges", ready],
    enabled: ready,
    queryFn: async () => {
      const { data } = await supabase.from("challenges").select("*").order("created_at", { ascending: false }).limit(30);
      const rows = data ?? [];
      const map = await profilesById(rows.map((r) => (r.challenger === meId ? r.opponent : r.challenger)));
      return rows.map((r) => ({ ...r, other: map.get(r.challenger === meId ? r.opponent : r.challenger) }));
    },
  });
  const accepted = (friends ?? []).filter((f) => f.status === "accepted" && f.other);
  const [friend, setFriend] = useState("");
  const [metric, setMetric] = useState<"discover" | "claim">("discover");
  const days = cfgValue(cfg, "challenge_days", 7);
  const reward = cfgValue(cfg, "challenge_reward_coins", 75);
  return (
    <div className="space-y-4">
      <Card>
        <p className="font-semibold">Utmana en vän</p>
        <p className="mb-2 text-sm text-muted-foreground">{days} dagar. Vinnaren får {reward} coins.</p>
        {accepted.length === 0 ? (
          <p className="text-sm text-muted-foreground">Lägg till vänner först.</p>
        ) : (
          <>
            <select className="mb-2 h-12 w-full rounded-xl border border-input bg-background px-3" value={friend} onChange={(e) => setFriend(e.target.value)}>
              <option value="">Välj vän…</option>
              {accepted.map((f) => <option key={f.id} value={f.other!.id}>{f.other!.avatar_emoji} {f.other!.username}</option>)}
            </select>
            <div className="mb-2 grid grid-cols-2 gap-2">
              {(["discover", "claim"] as const).map((m) => (
                <button key={m} onClick={() => setMetric(m)} className={`min-h-11 rounded-xl text-sm font-bold ${metric === m ? "bg-primary text-primary-foreground" : "glass text-muted-foreground"}`}>{metricLabel[m]}</button>
              ))}
            </div>
            <Button className="h-12 w-full rounded-xl" disabled={busy || !friend}
              onClick={() => run(() => create({ data: { friend, metric } }), () => { setFriend(""); toast.success("Utmaning skickad!"); })}>
              Skicka utmaning ⚔️
            </Button>
          </>
        )}
      </Card>
      <ul className="space-y-2">
        {(data ?? []).map((c) => {
          const iAmA = c.challenger === meId;
          const mine = iAmA ? c.score_a : c.score_b;
          const theirs = iAmA ? c.score_b : c.score_a;
          const name = c.other?.username ?? "Okänd";
          return (
            <li key={c.id} className="glass rounded-2xl p-3">
              <div className="flex items-center justify-between">
                <p className="font-semibold">⚔️ {name}</p>
                <span className="text-xs text-muted-foreground">{metricLabel[c.metric as "discover" | "claim"]}</span>
              </div>
              {c.status === "pending" && !iAmA && (
                <div className="mt-2 flex gap-2">
                  <Button size="sm" className="flex-1" disabled={busy} onClick={() => run(() => respond({ data: { id: c.id, accept: true } }))}>Anta</Button>
                  <Button size="sm" variant="secondary" className="flex-1" disabled={busy} onClick={() => run(() => respond({ data: { id: c.id, accept: false } }))}>Avböj</Button>
                </div>
              )}
              {c.status === "pending" && iAmA && <p className="mt-1 text-sm text-muted-foreground">Väntar på svar…</p>}
              {c.status === "declined" && <p className="mt-1 text-sm text-muted-foreground">Avböjd</p>}
              {(c.status === "active" || c.status === "done") && (
                <>
                  <p className="mt-1 font-display text-2xl font-bold">Du {mine} – {theirs} {name}</p>
                  <p className="text-sm text-muted-foreground">
                    {c.status === "active"
                      ? `Slutar ${new Date(c.ends_at!).toLocaleDateString("sv-SE", { weekday: "short", day: "numeric", month: "short" })}`
                      : c.winner === meId ? `🏆 Du vann! +${reward} coins` : c.winner ? "Du förlorade den här gången." : "Oavgjort."}
                  </p>
                </>
              )}
            </li>
          );
        })}
      </ul>
    </div>
  );
}

function Invite({ playerId, invited }: { playerId: string; invited: boolean }) {
  const { run, busy } = useGameAction();
  const redeem = useServerFn(redeemInvite);
  const { data: cfg } = useQuery(configQuery);
  const reward = cfgValue(cfg, "invite_reward_coins", 100);
  const [code, setCode] = useState("");
  const link = typeof window !== "undefined" ? `${window.location.origin}/auth` : "";
  async function share() {
    const text = `Spela PLATSLY med mig! Använd min kod ${playerId} så får vi båda ${reward} coins.`;
    if (navigator.share) await navigator.share({ title: "PLATSLY", text, url: link }).catch(() => {});
    else { await navigator.clipboard.writeText(`${text} ${link}`); toast.success("Kopierat!"); }
  }
  return (
    <div className="space-y-4">
      <Card className="text-center">
        <p className="text-sm text-muted-foreground">Din inbjudningskod</p>
        <p className="my-2 font-display text-4xl font-extrabold tracking-widest text-primary">{playerId}</p>
        <p className="mb-3 text-sm">Ni får båda <span className="text-gold font-bold">{reward} coins</span> när en ny spelare använder din kod.</p>
        <Button className="h-12 w-full rounded-xl font-bold" onClick={share}>Dela inbjudan</Button>
      </Card>
      {!invited && (
        <Card>
          <p className="mb-2 font-semibold">Har du fått en kod?</p>
          <div className="flex gap-2">
            <Input className="h-12 rounded-xl uppercase" placeholder="Kod" value={code} onChange={(e) => setCode(e.target.value)} />
            <Button className="h-12 rounded-xl" disabled={busy || code.trim().length < 3}
              onClick={() => run(() => redeem({ data: { code } }), () => { setCode(""); toast.success(`+${reward} coins! Ni är nu vänner.`); })}>
              Använd
            </Button>
          </div>
        </Card>
      )}
    </div>
  );
}

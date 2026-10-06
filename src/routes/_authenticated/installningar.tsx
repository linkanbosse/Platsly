import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { useEffect, useState } from "react";
import { toast } from "sonner";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Switch } from "@/components/ui/switch";
import {
  AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription,
  AlertDialogFooter, AlertDialogHeader, AlertDialogTitle, AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import { supabase } from "@/integrations/supabase/client";
import { deleteMyAccount } from "@/lib/game.functions";
import { profileQuery } from "@/lib/queries";

export const Route = createFileRoute("/_authenticated/installningar")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Inställningar — PLATSLY" },
      { name: "description", content: "Ändra användarnamn, avatar, integritet och konto." },
      { property: "og:title", content: "Inställningar — PLATSLY" },
      { property: "og:description", content: "Inställningar för ditt PLATSLY-konto." },
    ],
  }),
  component: SettingsPage,
});

const AVATARS = ["🧭", "🦊", "🫎", "🐻", "🦉", "🐺", "🌲", "🏔️", "⛵", "🚲", "🦌", "❄️"];

function SettingsPage() {
  const { data: p } = useQuery(profileQuery);
  const qc = useQueryClient();
  const navigate = useNavigate();
  const del = useServerFn(deleteMyAccount);
  const [name, setName] = useState("");
  useEffect(() => { if (p) setName(p.username); }, [p]);

  async function update(patch: { username?: string; avatar_emoji?: string; show_on_leaderboard?: boolean }) {
    if (!p) return;
    if (patch.username && !/^[a-zA-Z0-9_åäöÅÄÖ]{3,16}$/.test(patch.username)) { toast.error("3–16 tecken: bokstäver, siffror eller _."); return; }
    const { error } = await supabase.from("profiles").update(patch).eq("id", p.id);
    if (error) { toast.error(error.code === "23505" ? "Användarnamnet är upptaget." : "Kunde inte spara."); return; }
    toast.success("Sparat!");
    qc.invalidateQueries();
  }

  async function logout() {
    await supabase.auth.signOut();
    navigate({ to: "/auth", replace: true });
  }

  async function remove() {
    const r = await del();
    if (!r.ok) { toast.error(r.error); return; }
    await supabase.auth.signOut();
    navigate({ to: "/auth", replace: true });
  }

  if (!p) return <AppShell><p className="mt-20 text-center text-muted-foreground">Laddar…</p></AppShell>;

  return (
    <AppShell>
      <Link to="/profil" className="text-sm font-semibold text-primary">← Profil</Link>
      <div className="mt-3"><PageTitle>Inställningar</PageTitle></div>
      <Card className="mb-4">
        <h2 className="mb-3 font-bold">Användarnamn</h2>
        <div className="flex gap-2">
          <Input className="h-12 rounded-xl" value={name} onChange={(e) => setName(e.target.value)} />
          <Button className="h-12 rounded-xl" onClick={() => update({ username: name })}>Spara</Button>
        </div>
      </Card>
      <Card className="mb-4">
        <h2 className="mb-3 font-bold">Avatar</h2>
        <div className="grid grid-cols-6 gap-2">
          {AVATARS.map((a) => (
            <button key={a} onClick={() => update({ avatar_emoji: a })} className={`grid aspect-square place-items-center rounded-2xl text-2xl ${p.avatar_emoji === a ? "bg-primary/25 ring-2 ring-primary" : "bg-muted/50"}`}>{a}</button>
          ))}
        </div>
      </Card>
      <Card className="mb-4">
        <label className="flex items-center justify-between gap-4">
          <span><span className="block font-bold">Visa mig på topplistan</span><span className="text-sm text-muted-foreground">Användarnamn och statistik syns för andra</span></span>
          <Switch checked={p.show_on_leaderboard} onCheckedChange={(v) => update({ show_on_leaderboard: v })} />
        </label>
      </Card>
      <Card className="mb-4 space-y-3">
        <Link to="/villkor" className="block font-semibold">Användarvillkor</Link>
        <Link to="/integritet" className="block font-semibold">Integritetspolicy</Link>
        <Link to="/spelvaluta" className="block font-semibold">Om PLATSLY Coins</Link>
      </Card>
      <Button variant="secondary" className="mb-3 h-12 w-full rounded-2xl font-bold" onClick={logout}>Logga ut</Button>
      <AlertDialog>
        <AlertDialogTrigger asChild>
          <Button variant="destructive" className="h-12 w-full rounded-2xl font-bold">Radera konto</Button>
        </AlertDialogTrigger>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Radera ditt konto?</AlertDialogTitle>
            <AlertDialogDescription>Alla dina upptäckter, din spelmark, XP och coins försvinner permanent.</AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Avbryt</AlertDialogCancel>
            <AlertDialogAction onClick={remove}>Radera</AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </AppShell>
  );
}

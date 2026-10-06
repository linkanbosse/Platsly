import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { supabase } from "@/integrations/supabase/client";

export const Route = createFileRoute("/auth")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Logga in — PLATSLY" },
      { name: "description", content: "Skapa konto eller logga in på PLATSLY och börja upptäcka Sverige." },
      { property: "og:title", content: "Logga in — PLATSLY" },
      { property: "og:description", content: "Skapa konto eller logga in på PLATSLY." },
    ],
  }),
  component: AuthPage,
});

type Mode = "login" | "signup" | "forgot";

function AuthPage() {
  const navigate = useNavigate();
  const [mode, setMode] = useState<Mode>("login");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [username, setUsername] = useState("");
  const [accept, setAccept] = useState(false);
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => {
      if (data.session) navigate({ to: "/hem", replace: true });
    });
    const { data } = supabase.auth.onAuthStateChange((_e, s) => {
      if (s) navigate({ to: "/hem", replace: true });
    });
    return () => data.subscription.unsubscribe();
  }, [navigate]);

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    setBusy(true);
    try {
      if (mode === "signup") {
        const cleanUsername = username.trim();
        if (!/^[a-zA-Z0-9_åäöÅÄÖ]{3,20}$/.test(cleanUsername)) {
          throw new Error("Användarnamn: 3–20 tecken, bokstäver, siffror eller _.");
        }
        if (password.length < 8) throw new Error("Lösenordet måste vara minst 8 tecken.");
        if (!accept) throw new Error("Du måste godkänna villkoren.");
        const { data, error } = await supabase.auth.signUp({
          email: email.trim(),
          password,
          options: { emailRedirectTo: window.location.origin + "/hem", data: { username: cleanUsername } },
        });
        if (error) throw error;
        if (!data.session) toast.success("Kolla din e-post och bekräfta kontot.");
      } else if (mode === "login") {
        const { error } = await supabase.auth.signInWithPassword({ email: email.trim(), password });
        if (error) throw new Error("Fel e-post eller lösenord.");
      } else {
        const { error } = await supabase.auth.resetPasswordForEmail(email.trim(), { redirectTo: window.location.origin + "/reset-password" });
        if (error) throw error;
        toast.success("Vi har skickat en länk för att återställa lösenordet.");
        setMode("login");
      }
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Något gick fel.");
    } finally {
      setBusy(false);
    }
  }

  async function google() {
    const { error } = await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: window.location.origin },
    });
    if (error) toast.error("Inloggning med Google misslyckades.");
  }

  return (
    <div className="mx-auto flex min-h-dvh max-w-md flex-col justify-center px-5 py-10">
      <div className="mb-8 text-center animate-rise">
        <h1 className="bg-aurora bg-clip-text text-5xl font-extrabold text-transparent">PLATSLY</h1>
        <p className="mt-2 text-xs font-bold tracking-[0.35em] text-muted-foreground">UPPTÄCK SVERIGE 🇸🇪</p>
      </div>
      <div className="glass rounded-[2rem] p-6 animate-rise">
        <h2 className="mb-5 text-2xl font-bold">
          {mode === "login" ? "Välkommen tillbaka" : mode === "signup" ? "Skapa konto" : "Glömt lösenord"}
        </h2>
        <form onSubmit={submit} className="space-y-4">
          {mode === "signup" && (
            <div className="space-y-2">
              <Label htmlFor="u">Användarnamn</Label>
              <Input id="u" className="h-12 rounded-xl" value={username} onChange={(e) => setUsername(e.target.value)} required autoComplete="username" />
            </div>
          )}
          <div className="space-y-2">
            <Label htmlFor="e">E-post</Label>
            <Input id="e" type="email" className="h-12 rounded-xl" value={email} onChange={(e) => setEmail(e.target.value)} required autoComplete="email" />
          </div>
          {mode !== "forgot" && (
            <div className="space-y-2">
              <Label htmlFor="p">Lösenord</Label>
              <Input id="p" type="password" className="h-12 rounded-xl" value={password} onChange={(e) => setPassword(e.target.value)} required autoComplete={mode === "signup" ? "new-password" : "current-password"} />
            </div>
          )}
          {mode === "signup" && (
            <label className="flex items-start gap-3 text-sm text-muted-foreground">
              <input type="checkbox" className="mt-1 size-5 accent-primary" checked={accept} onChange={(e) => setAccept(e.target.checked)} />
              <span>
                Jag godkänner <Link to="/villkor" className="text-primary underline">villkoren</Link> och förstår att PLATSLY Coins saknar verkligt värde.
              </span>
            </label>
          )}
          <Button type="submit" disabled={busy} className="h-13 w-full rounded-2xl bg-aurora py-3 text-base font-bold shadow-glow">
            {mode === "login" ? "Logga in" : mode === "signup" ? "Skapa konto" : "Skicka länk"}
          </Button>
        </form>
        {mode !== "forgot" && (
          <>
            <div className="my-5 flex items-center gap-3 text-xs text-muted-foreground"><span className="h-px flex-1 bg-border" />eller<span className="h-px flex-1 bg-border" /></div>
            <Button variant="secondary" onClick={google} className="h-12 w-full rounded-2xl text-base font-semibold">Fortsätt med Google</Button>
          </>
        )}
        <div className="mt-5 flex flex-col items-center gap-3 text-sm">
          {mode === "login" && (
            <>
              <button className="font-semibold text-primary" onClick={() => setMode("signup")}>Ny här? Skapa konto</button>
              <button className="text-muted-foreground" onClick={() => setMode("forgot")}>Glömt lösenordet?</button>
            </>
          )}
          {mode !== "login" && <button className="font-semibold text-primary" onClick={() => setMode("login")}>Har du redan ett konto? Logga in</button>}
        </div>
      </div>
    </div>
  );
}

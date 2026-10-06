import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { supabase } from "@/integrations/supabase/client";

export const Route = createFileRoute("/reset-password")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Nytt lösenord — PLATSLY" },
      { name: "description", content: "Välj ett nytt lösenord för ditt PLATSLY-konto." },
      { property: "og:title", content: "Nytt lösenord — PLATSLY" },
      { property: "og:description", content: "Välj ett nytt lösenord för ditt PLATSLY-konto." },
    ],
  }),
  component: Reset,
});

function Reset() {
  const [pw, setPw] = useState("");
  const navigate = useNavigate();
  async function save(e: React.FormEvent) {
    e.preventDefault();
    if (pw.length < 8) { toast.error("Minst 8 tecken."); return; }
    const { error } = await supabase.auth.updateUser({ password: pw });
    if (error) { toast.error("Länken har gått ut. Begär en ny."); return; }
    toast.success("Lösenordet är uppdaterat!");
    navigate({ to: "/hem" });
  }
  return (
    <div className="mx-auto flex min-h-dvh max-w-md flex-col justify-center px-5">
      <form onSubmit={save} className="glass space-y-4 rounded-[2rem] p-6">
        <h1 className="text-2xl font-bold">Välj nytt lösenord</h1>
        <Input type="password" className="h-12 rounded-xl" value={pw} onChange={(e) => setPw(e.target.value)} placeholder="Nytt lösenord" autoComplete="new-password" />
        <Button type="submit" className="h-12 w-full rounded-2xl font-bold">Spara</Button>
      </form>
    </div>
  );
}

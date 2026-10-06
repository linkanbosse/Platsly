import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { supabase } from "@/integrations/supabase/client";
import { startGeo } from "@/lib/geo";

export const Route = createFileRoute("/_authenticated/onboarding")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Kom igång — PLATSLY" },
      { name: "description", content: "Lär dig spela PLATSLY." },
      { property: "og:title", content: "Kom igång — PLATSLY" },
      { property: "og:description", content: "Lär dig spela PLATSLY." },
    ],
  }),
  component: Onboarding,
});

const slides = [
  { icon: "✨", title: "Upptäck Sverige", text: "Gå till riktiga platser runt om i Sverige. När du är nära låser du upp dem och får XP och coins." },
  { icon: "🚩", title: "Ta spelmark", text: "Kartan är indelad i rutor. Ta rutor nära dig — de ger coins över tid." },
  { icon: "💰", title: "Bara ett spel", text: "PLATSLY Coins är spelvaluta utan verkligt värde. De kan aldrig tas ut eller växlas mot pengar." },
  { icon: "📍", title: "Din position", text: "PLATSLY behöver din position för att fungera. Var uppmärksam på din omgivning och spela säkert." },
];

function Onboarding() {
  const [i, setI] = useState(0);
  const navigate = useNavigate();
  const qc = useQueryClient();
  const last = i === slides.length - 1;
  const s = slides[i]!;

  async function next() {
    if (!last) return setI(i + 1);
    startGeo();
    const { data } = await supabase.auth.getUser();
    if (data.user) await supabase.from("profiles").update({ onboarded: true }).eq("id", data.user.id);
    await qc.invalidateQueries({ queryKey: ["profile"] });
    navigate({ to: "/hem", replace: true });
  }

  return (
    <div className="mx-auto flex min-h-dvh max-w-md flex-col px-6 pt-safe pb-safe">
      <div className="flex flex-1 flex-col items-center justify-center text-center" key={i}>
        <div className="mb-8 grid size-36 place-items-center rounded-full glass text-7xl shadow-glow animate-pop">{s.icon}</div>
        <h1 className="text-3xl font-bold animate-rise">{s.title}</h1>
        <p className="mt-4 text-lg text-muted-foreground animate-rise">{s.text}</p>
      </div>
      <div className="mb-6 flex justify-center gap-2">
        {slides.map((_, k) => (
          <span key={k} className={`h-2 rounded-full transition-all ${k === i ? "w-8 bg-primary" : "w-2 bg-muted"}`} />
        ))}
      </div>
      <Button onClick={next} className="mb-4 h-14 w-full rounded-2xl bg-aurora text-lg font-bold shadow-glow">
        {last ? "Tillåt position och börja" : "Nästa"}
      </Button>
    </div>
  );
}

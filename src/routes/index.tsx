import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useEffect } from "react";
import { supabase } from "@/integrations/supabase/client";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "PLATSLY — Upptäck Sverige" },
      { name: "description", content: "PLATSLY är ett svenskt platsbaserat utforskarspel. Upptäck platser, ta virtuell spelmark och klättra på topplistan." },
      { property: "og:title", content: "PLATSLY — Upptäck Sverige" },
      { property: "og:description", content: "Ett svenskt platsbaserat utforskarspel. Upptäck, samla och tävla." },
    ],
  }),
  component: Splash,
});

function Splash() {
  const navigate = useNavigate();
  useEffect(() => {
    const t = setTimeout(async () => {
      const { data } = await supabase.auth.getSession();
      navigate({ to: data.session ? "/hem" : "/auth", replace: true });
    }, 1800);
    return () => clearTimeout(t);
  }, [navigate]);

  return (
    <div className="flex min-h-dvh flex-col items-center justify-center gap-4 px-6 text-center">
      <div className="relative animate-pop">
        <div className="absolute inset-0 -z-10 rounded-full bg-aurora opacity-30 blur-3xl" />
        <h1 className="bg-aurora bg-clip-text text-6xl font-extrabold tracking-tight text-transparent">PLATSLY</h1>
      </div>
      <div className="text-5xl animate-pop [animation-delay:200ms]">🇸🇪</div>
      <p className="font-display text-sm font-bold tracking-[0.4em] text-muted-foreground animate-rise [animation-delay:400ms]">
        UPPTÄCK SVERIGE
      </p>
    </div>
  );
}

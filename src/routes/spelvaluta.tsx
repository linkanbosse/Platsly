import { createFileRoute } from "@tanstack/react-router";
import { LegalPage } from "@/components/game/LegalPage";

export const Route = createFileRoute("/spelvaluta")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Om PLATSLY Coins — PLATSLY" },
      { name: "description", content: "PLATSLY Coins är virtuell spelvaluta utan verkligt värde." },
      { property: "og:title", content: "Om PLATSLY Coins — PLATSLY" },
      { property: "og:description", content: "PLATSLY Coins är virtuell spelvaluta utan verkligt värde." },
    ],
  }),
  component: () => (
    <LegalPage title="💰 PLATSLY Coins">
      <p>PLATSLY Coins är virtuell spelvaluta som endast kan användas i spelet.</p>
      <p>PLATSLY Coins har inget kontantvärde och kan inte tas ut, växlas till SEK, föras över till bank, Swish, PayPal, kryptovaluta eller presentkort, eller lösas in mot riktiga pengar.</p>
      <p>PLATSLY är ett spel och ingen investering.</p>
    </LegalPage>
  ),
});

import { createFileRoute } from "@tanstack/react-router";
import { LegalPage } from "@/components/game/LegalPage";

export const Route = createFileRoute("/villkor")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Användarvillkor — PLATSLY" },
      { name: "description", content: "Villkor för att spela PLATSLY." },
      { property: "og:title", content: "Användarvillkor — PLATSLY" },
      { property: "og:description", content: "Villkor för att spela PLATSLY." },
    ],
  }),
  component: () => (
    <LegalPage title="Användarvillkor">
      <p>PLATSLY är ett spel. Genom att skapa ett konto godkänner du dessa villkor.</p>
      <h2>Virtuell spelmark</h2>
      <p>Detta är virtuell spelmark. Mark i PLATSLY är helt digital och representerar inte verkligt markägande eller någon rättighet till fysisk egendom.</p>
      <h2>Säkert spelande</h2>
      <p>Var uppmärksam på din omgivning. Gå aldrig in på privat mark, avspärrade områden eller farliga platser för att spela. Spela inte medan du kör.</p>
      <h2>Fusk</h2>
      <p>Falsk GPS, automatisering och flera konton är inte tillåtet och kan leda till avstängning.</p>
      <h2>Ditt konto</h2>
      <p>Du kan när som helst radera ditt konto under Inställningar.</p>
      <p className="text-xs">Utkast — ska granskas juridiskt innan lansering.</p>
    </LegalPage>
  ),
});

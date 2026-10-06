import { createFileRoute } from "@tanstack/react-router";
import { LegalPage } from "@/components/game/LegalPage";

export const Route = createFileRoute("/integritet")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Integritetspolicy — PLATSLY" },
      { name: "description", content: "Hur PLATSLY hanterar dina personuppgifter och din position." },
      { property: "og:title", content: "Integritetspolicy — PLATSLY" },
      { property: "og:description", content: "Hur PLATSLY hanterar dina personuppgifter och din position." },
    ],
  }),
  component: () => (
    <LegalPage title="Integritetspolicy">
      <p>Vi samlar bara in det som behövs för att spelet ska fungera.</p>
      <h2>Position</h2>
      <p>Din position används för att visa kartan och kontrollera upptäckter och markanspråk. Vi sparar endast din senaste position vid en spelhandling, för att förhindra fusk. Din exakta position visas aldrig för andra spelare.</p>
      <h2>Kontouppgifter</h2>
      <p>E-post, användarnamn, spelar-ID och spelstatistik. Användarnamn och statistik kan synas på topplistan, vilket du kan stänga av i Inställningar.</p>
      <h2>Radering</h2>
      <p>När du raderar ditt konto tas dina uppgifter och din spelmark bort.</p>
      <p className="text-xs">Utkast — ska granskas juridiskt (GDPR) innan lansering.</p>
    </LegalPage>
  ),
});

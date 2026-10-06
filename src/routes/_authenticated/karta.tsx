import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { lazy, Suspense, useMemo, useState } from "react";
import { Crosshair, X, Flag, Coins, Sparkles, Check } from "lucide-react";
import { AppShell } from "@/components/game/AppShell";
import { CategoryIcon } from "@/components/game/CategoryIcon";
import { Celebration, type CelebrationData } from "@/components/game/Celebration";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { claimParcel, discoverLocation } from "@/lib/game.functions";
import { CATEGORY_ICON, cellFor, fmt, formatDistance, haversine, LAT_STEP, LNG_STEP, RARITY_CLASS } from "@/lib/game";
import { useGeo } from "@/lib/geo";
import { cfgValue, configQuery, locationsQuery, myDiscoveriesQuery, profileQuery } from "@/lib/queries";
import { isInSweden, OUTSIDE_MESSAGE } from "@/lib/sweden";

const GameMap = lazy(() => import("@/components/game/GameMap"));

export const Route = createFileRoute("/_authenticated/karta")({
  head: () => ({
    meta: [
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { title: "Karta — PLATSLY" },
      { name: "description", content: "Utforska kartan, upptäck platser och ta virtuell spelmark." },
      { property: "og:title", content: "Karta — PLATSLY" },
      { property: "og:description", content: "Utforska kartan och ta virtuell spelmark." },
    ],
  }),
  component: MapPage,
});

type Sel = { kind: "loc"; id: string } | { kind: "cell"; id: string; owner: string | null } | null;

function MapPage() {
  const geo = useGeo();
  const { data: p } = useQuery(profileQuery);
  const { data: locs } = useQuery(locationsQuery);
  const { data: disc } = useQuery(myDiscoveriesQuery);
  const { data: cfg } = useQuery(configQuery);
  const { run, busy } = useGameAction();
  const discover = useServerFn(discoverLocation);
  const claim = useServerFn(claimParcel);
  const [sel, setSel] = useState<Sel>(null);
  const [cel, setCel] = useState<CelebrationData | null>(null);
  const [refreshKey, setRefreshKey] = useState(0);
  const [recenter, setRecenter] = useState(0);

  const me = geo.status === "ok" && geo.lat != null && geo.lng != null ? { lat: geo.lat, lng: geo.lng } : null;
  const inSweden = me ? isInSweden(me.lat, me.lng) : true;
  const found = useMemo(() => new Set(disc?.map((d) => d.location_id)), [disc]);
  const mapLocs = useMemo(() => (locs ?? []).map((l) => ({ ...l, discovered: found.has(l.id) })), [locs, found]);

  const selLoc = sel?.kind === "loc" ? locs?.find((l) => l.id === sel.id) : null;
  const locDist = selLoc && me ? haversine(me.lat, me.lng, selLoc.lat, selLoc.lng) : null;
  const canDiscover = selLoc && locDist != null && !found.has(selLoc.id) && locDist <= selLoc.radius_m + cfgValue(cfg, "discovery_gps_buffer_m", 30);

  const cellCenter = sel?.kind === "cell" ? (() => { const [li = 0, gi = 0] = sel.id.split(":").map(Number); return { lat: (li + 0.5) * LAT_STEP, lng: (gi + 0.5) * LNG_STEP }; })() : null;
  const cellDist = cellCenter && me ? haversine(me.lat, me.lng, cellCenter.lat, cellCenter.lng) : null;
  const claimRadius = cfgValue(cfg, "parcel_claim_radius_m", 150);
  const cost = cfgValue(cfg, "parcel_claim_cost", 50);

  return (
    <AppShell flush>
      <div className="fixed inset-0 mx-auto max-w-md">
        <Suspense fallback={<div className="grid h-full place-items-center text-muted-foreground">Laddar karta…</div>}>
          {(
            <GameMap
              me={me}
              locations={mapLocs}
              myId={p?.id ?? ""}
              refreshKey={refreshKey}
              recenterKey={recenter}
              onSelectLocation={(id) => setSel({ kind: "loc", id })}
              onSelectCell={(id, owner) => setSel({ kind: "cell", id, owner })}
            />
          )}
        </Suspense>

        <div className="pointer-events-none absolute inset-x-0 top-0 z-[900] flex items-start justify-between gap-2 p-4 pt-safe">
          <div className="glass pointer-events-auto rounded-2xl px-4 py-2">
            <p className="flex items-center gap-2 font-display text-sm font-bold text-gold"><Coins className="size-4" />{fmt(p?.coins ?? 0)}</p>
            <p className="text-xs text-muted-foreground">Nivå {p?.level ?? 1}</p>
          </div>
          <Button variant="outline" size="icon" aria-label="Centrera på mig" title="Centrera på mig" disabled={!me} onClick={() => { if (me) { setRecenter((k) => k + 1); } }} className="glass pointer-events-auto size-12 rounded-lg [&_svg]:size-6"><Crosshair className="text-accent" /></Button>
        </div>

        {(!inSweden || geo.status === "denied") && (
          <div className="glass absolute inset-x-4 top-24 z-[900] rounded-2xl p-4 text-center font-semibold pt-safe">
            {geo.status === "denied" ? "Tillåt platsåtkomst för att spela." : OUTSIDE_MESSAGE}
          </div>
        )}

        {me && inSweden && !sel && (
          <div className="absolute inset-x-4 bottom-28 z-[900]">
            <Button onClick={() => { const c = cellFor(me.lat, me.lng); setSel({ kind: "cell", id: c.id, owner: null }); setRefreshKey((k) => k + 1); }} className="h-14 w-full rounded-lg text-base font-bold shadow-glow">
              <Flag /> Ta marken där jag står
            </Button>
          </div>
        )}

        {sel && (
          <div className="glass absolute inset-x-3 bottom-28 z-[950] max-h-[calc(100dvh-14rem)] overflow-y-auto rounded-xl p-5 animate-rise">
            <Button variant="secondary" size="icon" aria-label="Stäng" onClick={() => setSel(null)} className="absolute top-3 right-3 size-10 rounded-lg"><X /></Button>
            {selLoc && (
              <>
                <div className="flex items-center gap-3 pr-10">
                  <span className="icon-well shrink-0 text-accent"><CategoryIcon category={selLoc.category} /></span>
                  <div className="min-w-0">
                    <h2 className="break-words text-lg font-bold">{selLoc.name}</h2>
                    <p className={`text-sm font-semibold capitalize ${RARITY_CLASS[selLoc.rarity] ?? ""}`}>{selLoc.rarity} · {selLoc.city}</p>
                  </div>
                </div>
                <p className="mt-3 text-sm text-muted-foreground">{selLoc.description}</p>
                {selLoc.is_demo && <p className="mt-1 text-xs text-muted-foreground">Demoplats — ej verifierad.</p>}
                <div className="mt-3 flex flex-wrap gap-2 text-sm font-bold">
                  <span className="rounded-full bg-primary/15 px-3 py-1 text-primary">+{selLoc.xp_reward} XP</span>
                  <span className="rounded-full bg-gold/15 px-3 py-1 text-gold">+{selLoc.coin_reward} 💰</span>
                  {locDist != null && <span className="ml-auto self-center text-muted-foreground">{formatDistance(locDist)}</span>}
                </div>
                {found.has(selLoc.id) ? (
                  <p className="mt-4 flex items-center justify-center gap-2 font-semibold text-primary"><Check className="size-5" />Redan upptäckt</p>
                ) : (
                  <Button
                    disabled={!canDiscover || busy || !inSweden}
                    onClick={() => { if (!me) return; run(() => discover({ data: { locationId: selLoc.id, lat: me.lat, lng: me.lng } }), () => { setSel(null); setCel({ title: "PLATS UPPTÄCKT! 🎉", subtitle: selLoc.name, xp: selLoc.xp_reward, coins: selLoc.coin_reward, icon: CATEGORY_ICON[selLoc.category] ?? "✨" }); }); }}
                    className="mt-4 h-14 w-full rounded-lg text-sm font-bold shadow-glow"
                  >
                    <Sparkles />{canDiscover ? "Upptäck" : "Gå närmare för att upptäcka"}
                  </Button>
                )}
              </>
            )}
            {sel.kind === "cell" && (
              <>
                <h2 className="flex items-center gap-2 pr-10 text-xl font-bold"><Flag className="size-6 text-primary" />Spelmark</h2>
                {sel.owner ? (
                  <p className="mt-4 font-semibold">{sel.owner === p?.id ? "Den här marken är din. Den ger coins över tid." : "Den här marken är redan tagen av en annan spelare."}</p>
                ) : (
                  <>
                    <p className="mt-3 text-sm text-muted-foreground">Ledig ruta. Kostar <b className="text-gold">{cost} 💰</b> och ger coins varje timme.</p>
                    {cellDist != null && <p className="mt-1 text-sm text-muted-foreground">Avstånd: {formatDistance(cellDist)} (max {claimRadius} m)</p>}
                    <Button
                      disabled={busy || !me || !inSweden || (cellDist ?? Infinity) > claimRadius}
                      onClick={() => { if (!me) return; run(() => claim({ data: { cellId: sel.id, lat: me.lat, lng: me.lng } }), () => { setSel(null); setRefreshKey((k) => k + 1); setCel({ title: "Mark tagen!", icon: "🚩" }); }); }}
                      className="mt-4 h-14 w-full rounded-lg text-base font-bold shadow-glow"
                    >
                      {(cellDist ?? Infinity) > claimRadius ? "För långt bort" : `Ta marken (${cost} 💰)`}
                    </Button>
                  </>
                )}
              </>
            )}
          </div>
        )}
      </div>
      <Celebration data={cel} onClose={() => setCel(null)} />
    </AppShell>
  );
}

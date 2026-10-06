import { useEffect, useRef } from "react";
import L from "leaflet";
import { createMapLocationIcon } from "./CategoryIcon";
import { supabase } from "@/integrations/supabase/client";
import { cellBounds, cellFor, LAT_STEP, LNG_STEP } from "@/lib/game";
import { SWEDEN_CENTER } from "@/lib/sweden";

export type MapLoc = { id: string; name: string; lat: number; lng: number; category: string; discovered: boolean };

type Props = {
  me: { lat: number; lng: number } | null;
  locations: MapLoc[];
  myId: string;
  refreshKey: number;
  recenterKey: number;
  onSelectLocation: (id: string) => void;
  onSelectCell: (cellId: string, owner: string | null) => void;
};

export default function GameMap({ me, locations, myId, refreshKey, recenterKey, onSelectLocation, onSelectCell }: Props) {
  const el = useRef<HTMLDivElement>(null);
  const map = useRef<L.Map | null>(null);
  const locLayer = useRef<L.LayerGroup | null>(null);
  const gridLayer = useRef<L.LayerGroup | null>(null);
  const meMarker = useRef<L.Marker | null>(null);
  const centered = useRef(false);
  const cb = useRef({ onSelectLocation, onSelectCell, myId });
  cb.current = { onSelectLocation, onSelectCell, myId };

  useEffect(() => {
    if (!el.current || map.current) return;
    const m = L.map(el.current, { zoomControl: false, attributionControl: true, minZoom: 4 }).setView(SWEDEN_CENTER, 5);
    L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 19,
      className: "platsly-dark-tiles",
    }).addTo(m);
    locLayer.current = L.layerGroup().addTo(m);
    gridLayer.current = L.layerGroup().addTo(m);
    map.current = m;
    m.on("moveend", () => { drawGrid(); drawLocations(); });
    return () => {
      m.remove();
      map.current = null;
      locLayer.current = null;
      gridLayer.current = null;
      meMarker.current = null;
      centered.current = false;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function drawGrid() {
    const m = map.current;
    const layer = gridLayer.current;
    if (!m || !layer) return;
    layer.clearLayers();
    if (m.getZoom() < 15) return;
    const b = m.getBounds();
    const { data } = await supabase
      .from("parcels")
      .select("cell_id, owner_id")
      .gte("lat", b.getSouth() - LAT_STEP)
      .lte("lat", b.getNorth() + LAT_STEP)
      .gte("lng", b.getWest() - LNG_STEP)
      .lte("lng", b.getEast() + LNG_STEP)
      .limit(1000);
    const owners = new Map((data ?? []).map((p) => [p.cell_id, p.owner_id]));
    layer.clearLayers();
    const sw = cellFor(b.getSouth(), b.getWest());
    const ne = cellFor(b.getNorth(), b.getEast());
    if ((ne.li - sw.li) * (ne.gi - sw.gi) > 2500) return;
    const primary = getComputedStyle(document.documentElement).getPropertyValue("--primary").trim();
    const glow = getComputedStyle(document.documentElement).getPropertyValue("--primary-glow").trim();
    const gold = getComputedStyle(document.documentElement).getPropertyValue("--gold").trim();
    for (let li = sw.li; li <= ne.li; li++) {
      for (let gi = sw.gi; gi <= ne.gi; gi++) {
        const id = `${li}:${gi}`;
        const owner = owners.get(id) ?? null;
        const mine = owner === cb.current.myId;
        const r = L.rectangle(cellBounds(id), {
          color: owner ? (mine ? primary : gold) : glow,
          weight: owner ? 1.5 : 0.5,
          opacity: owner ? 0.9 : 0.25,
          fillColor: owner ? (mine ? primary : gold) : glow,
          fillOpacity: owner ? 0.28 : 0.02,
        });
        r.on("click", () => cb.current.onSelectCell(id, owner));
        r.addTo(layer);
      }
    }
  }

  useEffect(() => {
    drawGrid();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [refreshKey]);

  const locsRef = useRef(locations);
  locsRef.current = locations;
  function drawLocations() {
    const m = map.current;
    const layer = locLayer.current;
    if (!m || !layer) return;
    layer.clearLayers();
    const z = m.getZoom();
    const b = m.getBounds().pad(0.2);
    const minor = new Set(["gata", "butik", "mat"]);
    let n = 0;
    for (const l of locsRef.current) {
      if (!b.contains([l.lat, l.lng])) continue;
      if (minor.has(l.category) ? z < 15 : z < 11) continue;
      if (++n > 400) break;
      const icon = L.divIcon({
        className: "",
        html: createMapLocationIcon(l.category, l.discovered),
        iconSize: [34, 34],
        iconAnchor: [17, 17],
      });
      L.marker([l.lat, l.lng], { icon, zIndexOffset: 500 }).on("click", () => cb.current.onSelectLocation(l.id)).addTo(layer);
    }
  }

  useEffect(() => {
    drawLocations();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [locations]);

  useEffect(() => {
    const m = map.current;
    if (!m || !me) return;
    if (!meMarker.current) {
      meMarker.current = L.marker([me.lat, me.lng], {
        icon: L.divIcon({ className: "", html: '<div class="pl-me"></div>', iconSize: [18, 18], iconAnchor: [9, 9] }),
        zIndexOffset: 1000,
        interactive: false,
      }).addTo(m);
    } else meMarker.current.setLatLng([me.lat, me.lng]);
    if (!centered.current) {
      centered.current = true;
      m.setView([me.lat, me.lng], 16);
    }
  }, [me]);

  useEffect(() => {
    if (recenterKey && me && map.current) map.current.setView([me.lat, me.lng], 16);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [recenterKey]);

  return <div ref={el} className="absolute inset-0" />;
}

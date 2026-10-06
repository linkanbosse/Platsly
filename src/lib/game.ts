export const LAT_STEP = 0.001;
export const LNG_STEP = 0.002;

export function cellFor(lat: number, lng: number) {
  const li = Math.floor(lat / LAT_STEP);
  const gi = Math.floor(lng / LNG_STEP);
  return { id: `${li}:${gi}`, li, gi };
}

export function cellBounds(cellId: string): [[number, number], [number, number]] {
  const [li = 0, gi = 0] = cellId.split(":").map(Number);
  return [
    [li * LAT_STEP, gi * LNG_STEP],
    [(li + 1) * LAT_STEP, (gi + 1) * LNG_STEP],
  ];
}

export function haversine(lat1: number, lng1: number, lat2: number, lng2: number) {
  const r = (d: number) => (d * Math.PI) / 180;
  const a =
    Math.sin(r(lat2 - lat1) / 2) ** 2 +
    Math.cos(r(lat1)) * Math.cos(r(lat2)) * Math.sin(r(lng2 - lng1) / 2) ** 2;
  return 2 * 6371000 * Math.asin(Math.sqrt(a));
}

export const xpForLevel = (n: number) => 25 * n * (n - 1);

export function levelProgress(xp: number, level: number) {
  const cur = xpForLevel(level);
  const next = xpForLevel(level + 1);
  return { cur: xp - cur, need: next - cur, pct: Math.min(100, ((xp - cur) / (next - cur)) * 100) };
}

export const fmt = (n: number) => new Intl.NumberFormat("sv-SE").format(n);

export function formatDistance(m: number) {
  return m < 1000 ? `${Math.round(m)} m` : `${(m / 1000).toFixed(m < 10000 ? 1 : 0)} km`;
}

export const CATEGORY_ICON: Record<string, string> = {
  landmärke: "🏛️",
  natur: "🌲",
  utsikt: "🏔️",
  stad: "🏙️",
  historisk: "🏰",
  gata: "🛣️",
  butik: "🛍️",
  mat: "☕",
  offentligt: "🏢",
  sport: "⚽",
  skola: "🎓",
  kyrka: "⛪",
};

export const RARITY_CLASS: Record<string, string> = {
  vanlig: "text-muted-foreground",
  ovanlig: "text-primary",
  sällsynt: "text-primary-glow",
  episk: "text-gold",
};

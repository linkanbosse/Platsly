// Simplified, slightly generous outline of Sweden (lng, lat). Mainland + Gotland + Öland.
const MAINLAND: [number, number][] = [
  [13.4, 55.25], [12.7, 55.33], [12.75, 55.62], [12.5, 56.05], [12.3, 56.35], [12.6, 56.7],
  [12.0, 57.15], [11.55, 57.7], [11.15, 58.3], [10.95, 59.05], [11.6, 59.05], [11.75, 59.8],
  [12.45, 60.1], [12.7, 61.0], [12.2, 61.75], [12.4, 62.3], [12.0, 63.0], [12.1, 63.55],
  [13.2, 64.0], [14.1, 64.5], [13.6, 65.1], [14.5, 66.1], [15.4, 66.35], [16.3, 67.15],
  [17.3, 68.0], [18.1, 68.5], [19.9, 68.4], [20.4, 69.1], [21.2, 69.0], [21.0, 68.6],
  [22.4, 68.5], [23.4, 68.0], [23.6, 67.3], [23.4, 66.6], [24.0, 66.0], [24.3, 65.75],
  [22.6, 65.3], [21.6, 64.5], [20.9, 63.8], [19.3, 63.2], [18.0, 62.4], [17.6, 61.6],
  [17.5, 60.75], [18.8, 60.5], [19.3, 59.8], [19.2, 59.1], [17.9, 58.6], [16.95, 58.2],
  [16.95, 57.6], [16.7, 56.9], [16.5, 56.2], [15.9, 56.0], [14.9, 56.0], [14.4, 55.4],
];
const GOTLAND: [number, number][] = [
  [18.0, 56.85], [18.55, 57.1], [18.95, 57.5], [19.4, 57.95], [18.9, 58.0], [18.4, 57.75], [17.95, 57.2],
];
const OLAND: [number, number][] = [
  [16.35, 56.15], [16.55, 56.1], [16.75, 56.6], [17.2, 57.4], [16.95, 57.45], [16.4, 56.6],
];
const POLYS = [MAINLAND, GOTLAND, OLAND];

function inPoly(lng: number, lat: number, poly: [number, number][]) {
  let inside = false;
  for (let i = 0, j = poly.length - 1; i < poly.length; j = i++) {
    const [xi, yi] = poly[i]!;
    const [xj, yj] = poly[j]!;
    if (yi > lat !== yj > lat && lng < ((xj - xi) * (lat - yi)) / (yj - yi) + xi) inside = !inside;
  }
  return inside;
}

export function isInSweden(lat: number, lng: number) {
  return POLYS.some((p) => inPoly(lng, lat, p));
}

export const SWEDEN_CENTER: [number, number] = [62.0, 15.5];
export const OUTSIDE_MESSAGE = "PLATSLY är just nu tillgängligt i Sverige.";

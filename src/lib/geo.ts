import { useEffect, useSyncExternalStore } from "react";

export type GeoState = {
  status: "idle" | "pending" | "ok" | "denied" | "unavailable";
  lat?: number;
  lng?: number;
  accuracy?: number;
  simulated?: boolean;
};

let state: GeoState = { status: "idle" };
const listeners = new Set<() => void>();
let watchId: number | null = null;
let simulated: { lat: number; lng: number } | null = null;

function set(s: GeoState) {
  state = s;
  listeners.forEach((l) => l());
}

export function startGeo() {
  if (typeof navigator === "undefined" || watchId !== null || simulated) return;
  if (!navigator.geolocation) return set({ status: "unavailable" });
  set({ ...state, status: state.status === "ok" ? "ok" : "pending" });
  watchId = navigator.geolocation.watchPosition(
    (p) => set({ status: "ok", lat: p.coords.latitude, lng: p.coords.longitude, accuracy: p.coords.accuracy }),
    (e) => set({ status: e.code === 1 ? "denied" : "unavailable" }),
    { enableHighAccuracy: true, maximumAge: 5000, timeout: 20000 },
  );
}

/** Admin testing aid: simulate a position. Server checks still apply. */
export function simulatePosition(pos: { lat: number; lng: number } | null) {
  simulated = pos;
  if (pos) {
    if (watchId !== null) navigator.geolocation.clearWatch(watchId);
    watchId = null;
    set({ status: "ok", lat: pos.lat, lng: pos.lng, accuracy: 5, simulated: true });
  } else {
    set({ status: "idle" });
    startGeo();
  }
}

export function useGeo() {
  const s = useSyncExternalStore(
    (l) => {
      listeners.add(l);
      return () => listeners.delete(l);
    },
    () => state,
    () => state,
  );
  useEffect(() => {
    startGeo();
  }, []);
  return s;
}

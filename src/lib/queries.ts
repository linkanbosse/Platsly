import { queryOptions } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

async function uid() {
  const { data } = await supabase.auth.getSession();
  const id = data.session?.user.id;
  if (!id) throw new Error("Inte inloggad");
  return id;
}

export const profileQuery = queryOptions({
  queryKey: ["profile"],
  queryFn: async () => {
    const id = await uid();
    const { data, error } = await supabase.from("profiles").select("*").eq("id", id).single();
    if (error) throw error;
    const { data: roles } = await supabase.from("user_roles").select("role").eq("user_id", id);
    return { ...data, roles: (roles ?? []).map((r) => r.role) };
  },
});

export const locationsQuery = queryOptions({
  queryKey: ["locations"],
  queryFn: async () => {
    const all = [];
    for (let from = 0; ; from += 1000) {
      const { data, error } = await supabase.from("locations").select("*").eq("active", true).order("id").range(from, from + 999);
      if (error) throw error;
      all.push(...data);
      if (data.length < 1000) break;
    }
    return all;
  },
  staleTime: 10 * 60_000,
});

export const myDiscoveriesQuery = queryOptions({
  queryKey: ["discoveries"],
  queryFn: async () => {
    const id = await uid();
    const { data, error } = await supabase.from("discoveries").select("location_id, created_at").eq("user_id", id);
    if (error) throw error;
    return data;
  },
});

export const myParcelsQuery = queryOptions({
  queryKey: ["myParcels"],
  queryFn: async () => {
    const id = await uid();
    const { data, error } = await supabase.from("parcels").select("*").eq("owner_id", id);
    if (error) throw error;
    return data;
  },
});

export const configQuery = queryOptions({
  queryKey: ["config"],
  queryFn: async () => {
    const { data, error } = await supabase.from("game_config").select("*").order("key");
    if (error) throw error;
    return data;
  },
});

export function cfgValue(cfg: { key: string; value: number }[] | undefined, key: string, fallback: number) {
  return Number(cfg?.find((c) => c.key === key)?.value ?? fallback);
}

export function periodKeys() {
  const now = new Date(new Date().toLocaleString("en-US", { timeZone: "Europe/Stockholm" }));
  const day = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
  const d = new Date(Date.UTC(now.getFullYear(), now.getMonth(), now.getDate()));
  const dayNum = d.getUTCDay() || 7;
  d.setUTCDate(d.getUTCDate() + 4 - dayNum);
  const yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
  const week = Math.ceil(((d.getTime() - yearStart.getTime()) / 86400000 + 1) / 7);
  return { daily: day, weekly: `${d.getUTCFullYear()}-W${String(week).padStart(2, "0")}` };
}

export const missionsQuery = queryOptions({
  queryKey: ["missions"],
  queryFn: async () => {
    const id = await uid();
    const keys = periodKeys();
    const [{ data: missions }, { data: pm }] = await Promise.all([
      supabase.from("missions").select("*").eq("active", true),
      supabase.from("player_missions").select("*").eq("user_id", id).in("period_key", [keys.daily, keys.weekly]),
    ]);
    return (missions ?? []).map((m) => {
      const p = (pm ?? []).find((x) => x.mission_id === m.id && x.period_key === (m.period === "daily" ? keys.daily : keys.weekly));
      return { ...m, progress: p?.progress ?? 0, claimed: p?.claimed ?? false, playerMissionId: p?.id ?? null };
    });
  },
});

export const achievementsQuery = queryOptions({
  queryKey: ["achievements"],
  queryFn: async () => {
    const id = await uid();
    const [{ data: all }, { data: mine }] = await Promise.all([
      supabase.from("achievements").select("*"),
      supabase.from("player_achievements").select("*").eq("user_id", id),
    ]);
    return (all ?? []).map((a) => ({ ...a, unlocked: (mine ?? []).some((m) => m.code === a.code) }));
  },
});

export const notificationsQuery = queryOptions({
  queryKey: ["notifications"],
  queryFn: async () => {
    const { data, error } = await supabase.from("notifications").select("*").order("created_at", { ascending: false }).limit(50);
    if (error) throw error;
    return data;
  },
});

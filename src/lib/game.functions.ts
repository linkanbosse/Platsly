import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { isInSweden, OUTSIDE_MESSAGE } from "./sweden";

const pos = z.object({ lat: z.number().min(-90).max(90), lng: z.number().min(-180).max(180) });

async function admin() {
  const { supabaseAdmin } = await import("@/integrations/supabase/client.server");
  return supabaseAdmin;
}

function clean(msg: string) {
  return msg.replace(/^.*?ERROR:\s*/, "");
}

async function rpc(name: string, args: Record<string, unknown>) {
  const sb = await admin();
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { data, error } = await (sb.rpc as any)(name, args);
  if (error) return { ok: false as const, error: clean(error.message) };
  return { ok: true as const, data: data as Record<string, number | string> };
}

export const discoverLocation = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => pos.extend({ locationId: z.string().uuid() }).parse(d))
  .handler(async ({ data, context }) => {
    if (!isInSweden(data.lat, data.lng)) return { ok: false as const, error: OUTSIDE_MESSAGE };
    const guard = await rpc("live_discover_guard", { p_user: context.userId });
    if (!guard.ok) return guard;
    return rpc("game_discover", { p_user: context.userId, p_location: data.locationId, p_lat: data.lat, p_lng: data.lng });
  });

export const claimParcel = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => pos.extend({ cellId: z.string().regex(/^-?\d+:-?\d+$/) }).parse(d))
  .handler(async ({ data, context }) => {
    if (!isInSweden(data.lat, data.lng)) return { ok: false as const, error: OUTSIDE_MESSAGE };
    return rpc("game_claim", { p_user: context.userId, p_cell: data.cellId, p_lat: data.lat, p_lng: data.lng });
  });

export const collectCoins = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => rpc("game_collect", { p_user: context.userId }));

export const claimDaily = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => rpc("game_daily", { p_user: context.userId }));

export const claimMission = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id: z.string().uuid() }).parse(d))
  .handler(async ({ data, context }) => rpc("game_claim_mission", { p_user: context.userId, p_player_mission: data.id }));

export const deleteMyAccount = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const sb = await admin();
    await sb.from("profiles").delete().eq("id", context.userId);
    const { error } = await sb.auth.admin.deleteUser(context.userId);
    if (error) return { ok: false as const, error: "Kunde inte radera kontot." };
    return { ok: true as const };
  });

// ---------- Admin ----------
async function assertAdmin(supabase: { rpc: (...a: never[]) => unknown }, userId: string) {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { data } = await (supabase as any).rpc("has_role", { _user_id: userId, _role: "admin" });
  if (!data) throw new Error("Endast för administratörer.");
}

export const updateConfig = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ key: z.string().max(64), value: z.number().min(0).max(1_000_000) }).parse(d))
  .handler(async ({ data, context }) => {
    await assertAdmin(context.supabase as never, context.userId);
    const sb = await admin();
    const { error } = await sb.from("game_config").update({ value: data.value }).eq("key", data.key);
    if (error) throw new Error(error.message);
    return { ok: true };
  });

export const setLocationActive = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id: z.string().uuid(), active: z.boolean() }).parse(d))
  .handler(async ({ data, context }) => {
    await assertAdmin(context.supabase as never, context.userId);
    const sb = await admin();
    await sb.from("locations").update({ active: data.active }).eq("id", data.id);
    return { ok: true };
  });

export const createLocation = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) =>
    z
      .object({
        name: z.string().min(2).max(80),
        description: z.string().max(300),
        city: z.string().max(60),
        lat: z.number(),
        lng: z.number(),
        category: z.enum(["landmärke", "natur", "utsikt", "stad", "historisk"]),
        xp_reward: z.number().int().min(0).max(5000),
        coin_reward: z.number().int().min(0).max(5000),
      })
      .parse(d),
  )
  .handler(async ({ data, context }) => {
    await assertAdmin(context.supabase as never, context.userId);
    if (!isInSweden(data.lat, data.lng)) throw new Error("Platsen måste ligga i Sverige.");
    const sb = await admin();
    const { error } = await sb.from("locations").insert({ ...data, is_demo: false });
    if (error) throw new Error(error.message);
    return { ok: true };
  });

export const grantRoleByUsername = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ username: z.string().min(2).max(40), role: z.enum(["admin", "founder"]) }).parse(d))
  .handler(async ({ data, context }) => {
    await assertAdmin(context.supabase as never, context.userId);
    const sb = await admin();
    const { data: p } = await sb.from("profiles").select("id").eq("username", data.username).maybeSingle();
    if (!p) throw new Error("Hittade ingen spelare med det namnet.");
    await sb.from("user_roles").upsert({ user_id: p.id, role: data.role }, { onConflict: "user_id,role" });
    if (data.role === "founder") {
      await sb
        .from("profiles")
        .update({ level: 10000, xp: 1_000_000_000, coins: 1_000_000_000, show_on_leaderboard: false })
        .eq("id", p.id);
    }
    return { ok: true };
  });

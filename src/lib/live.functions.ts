import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { isInSweden, OUTSIDE_MESSAGE } from "./sweden";

async function rpc(name: string, args: Record<string, unknown>) {
  const { supabaseAdmin } = await import("@/integrations/supabase/client.server");
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { data, error } = await (supabaseAdmin.rpc as any)(name, args);
  if (error) return { ok: false as const, error: error.message.replace(/^.*?ERROR:\s*/, "") };
  return { ok: true as const, data: data as Record<string, number | string | boolean> };
}

const id = z.string().uuid();

export const eventCheckin = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id, lat: z.number(), lng: z.number() }).parse(d))
  .handler(({ data, context }) => {
    if (!isInSweden(data.lat, data.lng)) return { ok: false as const, error: OUTSIDE_MESSAGE };
    return rpc("live_event_checkin", { p_user: context.userId, p_event: data.id, p_lat: data.lat, p_lng: data.lng });
  });

export const redeemQr = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ code: z.string().trim().min(3).max(60) }).parse(d))
  .handler(({ data, context }) => rpc("live_qr_redeem", { p_user: context.userId, p_code: data.code }));

export const buyItem = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id }).parse(d))
  .handler(({ data, context }) => rpc("shop_buy", { p_user: context.userId, p_item: data.id }));

export const equipItem = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id }).parse(d))
  .handler(({ data, context }) => rpc("shop_equip", { p_user: context.userId, p_item: data.id }));

export const readAllNotifications = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(({ context }) => rpc("notif_read_all", { p_user: context.userId }));

// Admin (role re-checked in SQL)
export const adminSaveEvent = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) =>
    z.object({
      title: z.string().trim().min(2).max(80), description: z.string().max(400), city: z.string().max(60),
      sponsor: z.string().max(60), lat: z.number(), lng: z.number(), radius_m: z.number().int().min(20).max(2000),
      xp_reward: z.number().int().min(0).max(5000), coin_reward: z.number().int().min(0).max(5000),
      starts_at: z.string(), ends_at: z.string(),
    }).parse(d))
  .handler(({ data, context }) => rpc("admin_event_save", { p_user: context.userId, p: data }));

export const adminToggle = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ table: z.enum(["events", "qr_codes", "shop_items"]), id, active: z.boolean() }).parse(d))
  .handler(({ data, context }) => rpc("admin_toggle", { p_user: context.userId, p_table: data.table, p_id: data.id, p_active: data.active }));

export const adminCreateQr = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) =>
    z.object({ code: z.string().trim().min(3).max(60), label: z.string().trim().min(2).max(80), xp: z.number().int().min(0).max(5000), coins: z.number().int().min(0).max(5000), max: z.number().int().min(1).max(100000) }).parse(d))
  .handler(({ data, context }) => rpc("admin_qr_create", { p_user: context.userId, p_code: data.code, p_label: data.label, p_xp: data.xp, p_coins: data.coins, p_max: data.max }));

export const adminBroadcast = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ title: z.string().trim().min(2).max(80), body: z.string().max(300) }).parse(d))
  .handler(({ data, context }) => rpc("admin_broadcast", { p_user: context.userId, p_title: data.title, p_body: data.body }));

export const adminStats = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(({ context }) => rpc("admin_stats", { p_user: context.userId }));

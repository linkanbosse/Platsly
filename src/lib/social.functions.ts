import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";

async function rpc(name: string, args: Record<string, unknown>) {
  const { supabaseAdmin } = await import("@/integrations/supabase/client.server");
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { data, error } = await (supabaseAdmin.rpc as any)(name, args);
  if (error) return { ok: false as const, error: error.message.replace(/^.*?ERROR:\s*/, "") };
  return { ok: true as const, data: data as Record<string, number | string | boolean> };
}

const id = z.string().uuid();

export const sendFriendRequest = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ query: z.string().trim().min(2).max(40) }).parse(d))
  .handler(({ data, context }) => rpc("social_friend_request", { p_user: context.userId, p_query: data.query }));

export const respondFriend = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id, accept: z.boolean() }).parse(d))
  .handler(({ data, context }) => rpc("social_friend_respond", { p_user: context.userId, p_id: data.id, p_accept: data.accept }));

export const createTeam = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ name: z.string().trim().min(3).max(30), emoji: z.string().max(8) }).parse(d))
  .handler(({ data, context }) => rpc("social_team_create", { p_user: context.userId, p_name: data.name, p_emoji: data.emoji }));

export const joinTeam = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id }).parse(d))
  .handler(({ data, context }) => rpc("social_team_join", { p_user: context.userId, p_team: data.id }));

export const leaveTeam = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(({ context }) => rpc("social_team_leave", { p_user: context.userId }));

export const createChallenge = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ friend: id, metric: z.enum(["discover", "claim"]) }).parse(d))
  .handler(({ data, context }) => rpc("social_challenge_create", { p_user: context.userId, p_friend: data.friend, p_metric: data.metric }));

export const respondChallenge = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ id, accept: z.boolean() }).parse(d))
  .handler(({ data, context }) => rpc("social_challenge_respond", { p_user: context.userId, p_id: data.id, p_accept: data.accept }));

export const syncChallenges = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .handler(({ context }) => rpc("social_challenge_sync", { p_user: context.userId }));

export const redeemInvite = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((d) => z.object({ code: z.string().trim().min(3).max(20) }).parse(d))
  .handler(({ data, context }) => rpc("social_redeem_invite", { p_user: context.userId, p_code: data.code }));

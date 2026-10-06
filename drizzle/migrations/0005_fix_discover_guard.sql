create or replace function public.live_discover_guard(p_user uuid) returns void language plpgsql security definer set search_path = public as $$
begin
  if (select count(*) from public.discoveries where user_id = p_user and created_at > now() - interval '1 day') >= public.cfg('max_discoveries_per_day') then
    insert into public.cheat_flags (user_id, reason) values (p_user, 'Dagsgräns för upptäckter');
    raise exception 'Dagens gräns för upptäckter är nådd. Kom tillbaka i morgon!';
  end if;
end $$;
revoke execute on function public.live_discover_guard from public, anon, authenticated;
grant execute on function public.live_discover_guard to service_role;
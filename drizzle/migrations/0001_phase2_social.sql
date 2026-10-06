alter table public.profiles add column invited_by uuid references public.profiles(id) on delete set null;

create table public.friendships (
  id uuid primary key default gen_random_uuid(),
  requester uuid not null references public.profiles(id) on delete cascade,
  addressee uuid not null references public.profiles(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending','accepted')),
  created_at timestamptz not null default now(),
  check (requester <> addressee)
);
create unique index friendships_pair on public.friendships (least(requester,addressee), greatest(requester,addressee));
grant select on public.friendships to authenticated;
grant all on public.friendships to service_role;
alter table public.friendships enable row level security;
create policy "own friendships" on public.friendships for select to authenticated using (auth.uid() in (requester, addressee));

create table public.teams (
  id uuid primary key default gen_random_uuid(),
  name text unique not null check (char_length(name) between 3 and 30),
  emoji text not null default '🛡️',
  owner_id uuid not null references public.profiles(id) on delete cascade,
  created_at timestamptz not null default now()
);
create table public.team_members (
  team_id uuid not null references public.teams(id) on delete cascade,
  user_id uuid primary key references public.profiles(id) on delete cascade,
  joined_at timestamptz not null default now()
);
grant select on public.teams, public.team_members to authenticated;
grant all on public.teams, public.team_members to service_role;
alter table public.teams enable row level security;
alter table public.team_members enable row level security;
create policy "teams readable" on public.teams for select to authenticated using (true);
create policy "members readable" on public.team_members for select to authenticated using (true);

create table public.challenges (
  id uuid primary key default gen_random_uuid(),
  challenger uuid not null references public.profiles(id) on delete cascade,
  opponent uuid not null references public.profiles(id) on delete cascade,
  metric text not null check (metric in ('discover','claim')),
  status text not null default 'pending' check (status in ('pending','active','done','declined')),
  base_a int not null default 0,
  base_b int not null default 0,
  score_a int not null default 0,
  score_b int not null default 0,
  winner uuid,
  ends_at timestamptz,
  created_at timestamptz not null default now()
);
grant select on public.challenges to authenticated;
grant all on public.challenges to service_role;
alter table public.challenges enable row level security;
create policy "own challenges" on public.challenges for select to authenticated using (auth.uid() in (challenger, opponent));

insert into public.game_config (key, value, label) values
 ('invite_reward_coins', 100, 'Coins till båda vid inbjudan'),
 ('challenge_reward_coins', 75, 'Coins till vinnaren av en utmaning'),
 ('challenge_days', 7, 'Längd på utmaningar (dagar)'),
 ('team_max_members', 20, 'Max medlemmar per lag')
on conflict (key) do nothing;

create or replace function public._find_player(p_q text) returns uuid language sql stable security definer set search_path = public as $$
  select id from public.profiles where lower(username) = lower(trim(p_q)) or upper(player_id) = upper(trim(p_q)) limit 1 $$;

create or replace function public._are_friends(a uuid, b uuid) returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.friendships where status='accepted' and least(requester,addressee)=least(a,b) and greatest(requester,addressee)=greatest(a,b)) $$;

create or replace function public.social_friend_request(p_user uuid, p_query text) returns json
language plpgsql security definer set search_path = public as $$
declare t uuid; f record;
begin
  t := public._find_player(p_query);
  if t is null then raise exception 'Hittade ingen spelare med det namnet.'; end if;
  if t = p_user then raise exception 'Du kan inte lägga till dig själv.'; end if;
  select * into f from public.friendships where least(requester,addressee)=least(p_user,t) and greatest(requester,addressee)=greatest(p_user,t);
  if found then
    if f.status = 'accepted' then raise exception 'Ni är redan vänner.'; end if;
    if f.addressee = p_user then update public.friendships set status='accepted' where id=f.id; return json_build_object('accepted', true); end if;
    raise exception 'Förfrågan är redan skickad.';
  end if;
  insert into public.friendships (requester, addressee) values (p_user, t);
  return json_build_object('sent', true);
end $$;

create or replace function public.social_friend_respond(p_user uuid, p_id uuid, p_accept boolean) returns json
language plpgsql security definer set search_path = public as $$
begin
  if p_accept then
    update public.friendships set status='accepted' where id=p_id and addressee=p_user and status='pending';
  else
    delete from public.friendships where id=p_id and p_user in (requester, addressee);
  end if;
  return json_build_object('ok', true);
end $$;

create or replace function public.social_team_create(p_user uuid, p_name text, p_emoji text) returns json
language plpgsql security definer set search_path = public as $$
declare tid uuid;
begin
  if exists (select 1 from public.team_members where user_id=p_user) then raise exception 'Du är redan med i ett lag.'; end if;
  if exists (select 1 from public.teams where lower(name)=lower(trim(p_name))) then raise exception 'Lagnamnet är upptaget.'; end if;
  insert into public.teams (name, emoji, owner_id) values (trim(p_name), coalesce(nullif(p_emoji,''),'🛡️'), p_user) returning id into tid;
  insert into public.team_members (team_id, user_id) values (tid, p_user);
  return json_build_object('team', tid);
end $$;

create or replace function public.social_team_join(p_user uuid, p_team uuid) returns json
language plpgsql security definer set search_path = public as $$
begin
  if exists (select 1 from public.team_members where user_id=p_user) then raise exception 'Lämna ditt nuvarande lag först.'; end if;
  if not exists (select 1 from public.teams where id=p_team) then raise exception 'Laget finns inte.'; end if;
  if (select count(*) from public.team_members where team_id=p_team) >= public.cfg('team_max_members') then raise exception 'Laget är fullt.'; end if;
  insert into public.team_members (team_id, user_id) values (p_team, p_user);
  return json_build_object('ok', true);
end $$;

create or replace function public.social_team_leave(p_user uuid) returns json
language plpgsql security definer set search_path = public as $$
declare tid uuid; nxt uuid;
begin
  delete from public.team_members where user_id=p_user returning team_id into tid;
  if tid is null then raise exception 'Du är inte med i något lag.'; end if;
  if exists (select 1 from public.teams where id=tid and owner_id=p_user) then
    select user_id into nxt from public.team_members where team_id=tid order by joined_at limit 1;
    if nxt is null then delete from public.teams where id=tid; else update public.teams set owner_id=nxt where id=tid; end if;
  end if;
  return json_build_object('ok', true);
end $$;

create or replace function public._metric_count(p_user uuid, p_metric text) returns int language sql stable security definer set search_path = public as $$
  select case p_metric when 'discover' then discoveries_count else parcels_count end from public.profiles where id=p_user $$;

create or replace function public.social_challenge_create(p_user uuid, p_friend uuid, p_metric text) returns json
language plpgsql security definer set search_path = public as $$
begin
  if not public._are_friends(p_user, p_friend) then raise exception 'Du kan bara utmana vänner.'; end if;
  if exists (select 1 from public.challenges where status in ('pending','active') and least(challenger,opponent)=least(p_user,p_friend) and greatest(challenger,opponent)=greatest(p_user,p_friend)) then
    raise exception 'Ni har redan en pågående utmaning.'; end if;
  insert into public.challenges (challenger, opponent, metric) values (p_user, p_friend, p_metric);
  return json_build_object('ok', true);
end $$;

create or replace function public.social_challenge_respond(p_user uuid, p_id uuid, p_accept boolean) returns json
language plpgsql security definer set search_path = public as $$
declare c record;
begin
  select * into c from public.challenges where id=p_id and opponent=p_user and status='pending' for update;
  if not found then raise exception 'Utmaningen hittades inte.'; end if;
  if not p_accept then update public.challenges set status='declined' where id=p_id; return json_build_object('ok', true); end if;
  update public.challenges set status='active',
    base_a = public._metric_count(c.challenger, c.metric), base_b = public._metric_count(c.opponent, c.metric),
    ends_at = now() + make_interval(days => public.cfg('challenge_days')::int)
  where id=p_id;
  return json_build_object('ok', true);
end $$;

create or replace function public.social_challenge_sync(p_user uuid) returns json
language plpgsql security definer set search_path = public as $$
declare c record; sa int; sb int; w uuid; reward bigint := public.cfg('challenge_reward_coins')::bigint;
begin
  for c in select * from public.challenges where status='active' and p_user in (challenger, opponent) for update loop
    sa := public._metric_count(c.challenger, c.metric) - c.base_a;
    sb := public._metric_count(c.opponent, c.metric) - c.base_b;
    if c.ends_at <= now() then
      w := case when sa > sb then c.challenger when sb > sa then c.opponent else null end;
      update public.challenges set score_a=sa, score_b=sb, status='done', winner=w where id=c.id;
      if w is not null then perform public._award(w, 0, reward, 'Vann utmaning'); end if;
    else
      update public.challenges set score_a=sa, score_b=sb where id=c.id;
    end if;
  end loop;
  return json_build_object('ok', true);
end $$;

create or replace function public.social_redeem_invite(p_user uuid, p_code text) returns json
language plpgsql security definer set search_path = public as $$
declare inviter uuid; reward bigint := public.cfg('invite_reward_coins')::bigint; prof record;
begin
  select * into prof from public.profiles where id=p_user for update;
  if prof.invited_by is not null then raise exception 'Du har redan använt en inbjudningskod.'; end if;
  if prof.created_at < now() - interval '14 days' then raise exception 'Inbjudningskoder kan bara användas av nya spelare.'; end if;
  select id into inviter from public.profiles where upper(player_id)=upper(trim(p_code));
  if inviter is null then raise exception 'Ogiltig kod.'; end if;
  if inviter = p_user then raise exception 'Du kan inte bjuda in dig själv.'; end if;
  update public.profiles set invited_by=inviter where id=p_user;
  perform public._award(p_user, 0, reward, 'Inbjudningsbonus');
  perform public._award(inviter, 0, reward, 'Bjöd in en vän');
  insert into public.friendships (requester, addressee, status) values (inviter, p_user, 'accepted') on conflict do nothing;
  return json_build_object('coins', reward);
end $$;

revoke execute on function public._find_player, public._are_friends, public._metric_count, public.social_friend_request, public.social_friend_respond, public.social_team_create, public.social_team_join, public.social_team_leave, public.social_challenge_create, public.social_challenge_respond, public.social_challenge_sync, public.social_redeem_invite from public, anon, authenticated;
grant execute on function public.social_friend_request, public.social_friend_respond, public.social_team_create, public.social_team_join, public.social_team_leave, public.social_challenge_create, public.social_challenge_respond, public.social_challenge_sync, public.social_redeem_invite to service_role;
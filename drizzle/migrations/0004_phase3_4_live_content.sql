alter table public.profiles add column if not exists title text;

create table public.events (
  id uuid primary key default gen_random_uuid(),
  title text not null, description text not null default '', city text not null default '',
  sponsor text, lat double precision not null, lng double precision not null,
  radius_m int not null default 150, xp_reward int not null default 100, coin_reward int not null default 40,
  starts_at timestamptz not null default now(), ends_at timestamptz not null,
  active boolean not null default true, created_at timestamptz not null default now()
);
create table public.event_checkins (event_id uuid references public.events(id) on delete cascade, user_id uuid references public.profiles(id) on delete cascade, created_at timestamptz not null default now(), primary key (event_id, user_id));
create table public.qr_codes (
  id uuid primary key default gen_random_uuid(), code text unique not null, label text not null,
  xp_reward int not null default 50, coin_reward int not null default 25, max_uses int not null default 1000,
  uses int not null default 0, active boolean not null default true, created_at timestamptz not null default now()
);
create table public.qr_redemptions (code_id uuid references public.qr_codes(id) on delete cascade, user_id uuid references public.profiles(id) on delete cascade, created_at timestamptz not null default now(), primary key (code_id, user_id));
create table public.shop_items (
  id uuid primary key default gen_random_uuid(), name text not null, kind text not null check (kind in ('avatar','title')),
  value text not null, price int not null check (price >= 0), active boolean not null default true, sort int not null default 0
);
create table public.inventory (user_id uuid references public.profiles(id) on delete cascade, item_id uuid references public.shop_items(id) on delete cascade, created_at timestamptz not null default now(), primary key (user_id, item_id));
create table public.notifications (
  id uuid primary key default gen_random_uuid(), user_id uuid references public.profiles(id) on delete cascade,
  title text not null, body text not null default '', read boolean not null default false, created_at timestamptz not null default now()
);
create index on public.notifications(user_id, created_at desc);
create table public.cheat_flags (id bigserial primary key, user_id uuid references public.profiles(id) on delete cascade, reason text not null, created_at timestamptz not null default now());

grant select on public.events, public.event_checkins, public.qr_redemptions, public.shop_items, public.inventory, public.notifications to authenticated;
grant select on public.qr_codes, public.cheat_flags to authenticated;
grant all on public.events, public.event_checkins, public.qr_codes, public.qr_redemptions, public.shop_items, public.inventory, public.notifications, public.cheat_flags to service_role;
grant usage, select on sequence public.cheat_flags_id_seq to service_role;
alter table public.events enable row level security;
alter table public.event_checkins enable row level security;
alter table public.qr_codes enable row level security;
alter table public.qr_redemptions enable row level security;
alter table public.shop_items enable row level security;
alter table public.inventory enable row level security;
alter table public.notifications enable row level security;
alter table public.cheat_flags enable row level security;
create policy "events readable" on public.events for select to authenticated using (active or public.has_role(auth.uid(),'admin'));
create policy "own checkins" on public.event_checkins for select to authenticated using (auth.uid() = user_id or public.has_role(auth.uid(),'admin'));
create policy "qr admin" on public.qr_codes for select to authenticated using (public.has_role(auth.uid(),'admin'));
create policy "own qr" on public.qr_redemptions for select to authenticated using (auth.uid() = user_id);
create policy "shop readable" on public.shop_items for select to authenticated using (active or public.has_role(auth.uid(),'admin'));
create policy "own inventory" on public.inventory for select to authenticated using (auth.uid() = user_id);
create policy "own notifications" on public.notifications for select to authenticated using (auth.uid() = user_id);
create policy "flags admin" on public.cheat_flags for select to authenticated using (public.has_role(auth.uid(),'admin'));

insert into public.game_config (key, value, label) values
 ('max_discoveries_per_day', 60, 'Max upptäckter per dag (fusk-skydd)'),
 ('max_qr_per_day', 10, 'Max QR-skanningar per dag'),
 ('payments_enabled', 0, 'Betalningar (avstängt i v1 – ändra ej)')
on conflict (key) do nothing;

insert into public.shop_items (name, kind, value, price, sort) values
 ('Räv','avatar','🦊',150,1),('Älg','avatar','🫎',250,2),('Varg','avatar','🐺',300,3),('Uggla','avatar','🦉',200,4),
 ('Norrsken','avatar','🌌',500,5),('Krona','avatar','👑',1000,6),
 ('Upptäckare','title','Upptäckare',200,10),('Värmlänning','title','Värmlänning',300,11),('Stigfinnare','title','Stigfinnare',400,12),
 ('Kartmästare','title','Kartmästare',800,13),('Legend','title','Legend',2000,14);

create or replace function public._notify(p_user uuid, p_title text, p_body text) returns void language sql security definer set search_path = public as $$
  insert into public.notifications (user_id, title, body) values (p_user, p_title, p_body)
$$;

create or replace function public.live_event_checkin(p_user uuid, p_event uuid, p_lat double precision, p_lng double precision)
returns json language plpgsql security definer set search_path = public as $$
declare e record; d double precision;
begin
  select * into e from public.events where id = p_event and active and now() between starts_at and ends_at;
  if e is null then raise exception 'Evenemanget är inte aktivt.'; end if;
  d := public.haversine_m(p_lat, p_lng, e.lat, e.lng);
  if d > e.radius_m + public.cfg('discovery_gps_buffer_m') then raise exception 'Du är för långt bort (% m).', round(d); end if;
  if exists (select 1 from public.event_checkins where event_id = p_event and user_id = p_user) then raise exception 'Du har redan checkat in här.'; end if;
  perform public._check_speed(p_user, p_lat, p_lng);
  insert into public.event_checkins (event_id, user_id) values (p_event, p_user);
  perform public._award(p_user, e.xp_reward, e.coin_reward, 'Evenemang: ' || e.title);
  perform public._notify(p_user, 'Evenemang avklarat!', e.title || ': +' || e.coin_reward || ' coins');
  return json_build_object('title', e.title, 'xp', e.xp_reward, 'coins', e.coin_reward);
end $$;

create or replace function public.live_qr_redeem(p_user uuid, p_code text)
returns json language plpgsql security definer set search_path = public as $$
declare q record; today int;
begin
  select count(*) into today from public.qr_redemptions where user_id = p_user and created_at > now() - interval '1 day';
  if today >= public.cfg('max_qr_per_day') then
    insert into public.cheat_flags (user_id, reason) values (p_user, 'För många QR-skanningar');
    raise exception 'Du har nått dagens gräns för QR-koder.';
  end if;
  select * into q from public.qr_codes where upper(code) = upper(trim(p_code)) and active for update;
  if q is null then raise exception 'Okänd QR-kod.'; end if;
  if q.uses >= q.max_uses then raise exception 'Koden är förbrukad.'; end if;
  if exists (select 1 from public.qr_redemptions where code_id = q.id and user_id = p_user) then raise exception 'Du har redan använt koden.'; end if;
  insert into public.qr_redemptions (code_id, user_id) values (q.id, p_user);
  update public.qr_codes set uses = uses + 1 where id = q.id;
  perform public._award(p_user, q.xp_reward, q.coin_reward, 'QR: ' || q.label);
  perform public._notify(p_user, 'QR-bonus!', q.label || ': +' || q.coin_reward || ' coins');
  return json_build_object('label', q.label, 'xp', q.xp_reward, 'coins', q.coin_reward);
end $$;

create or replace function public.shop_buy(p_user uuid, p_item uuid)
returns json language plpgsql security definer set search_path = public as $$
declare it record; prof record;
begin
  select * into it from public.shop_items where id = p_item and active;
  if it is null then raise exception 'Föremålet finns inte.'; end if;
  if exists (select 1 from public.inventory where user_id = p_user and item_id = p_item) then raise exception 'Du äger redan detta.'; end if;
  select * into prof from public.profiles where id = p_user for update;
  if prof.coins < it.price then raise exception 'Du behöver % coins.', it.price; end if;
  insert into public.inventory (user_id, item_id) values (p_user, p_item);
  perform public._award(p_user, 0, -it.price, 'Butik: ' || it.name);
  return json_build_object('name', it.name);
end $$;

create or replace function public.shop_equip(p_user uuid, p_item uuid)
returns json language plpgsql security definer set search_path = public as $$
declare it record;
begin
  select s.* into it from public.shop_items s join public.inventory i on i.item_id = s.id where s.id = p_item and i.user_id = p_user;
  if it is null then raise exception 'Du äger inte detta.'; end if;
  if it.kind = 'avatar' then update public.profiles set avatar_emoji = it.value where id = p_user;
  else update public.profiles set title = it.value where id = p_user; end if;
  return json_build_object('name', it.name);
end $$;

create or replace function public.notif_read_all(p_user uuid) returns json language sql security definer set search_path = public as $$
  update public.notifications set read = true where user_id = p_user and not read;
  select json_build_object('ok', true);
$$;

-- anti-cheat: daily discovery cap wraps discover
create or replace function public.live_discover_guard(p_user uuid) returns void language plpgsql security definer set search_path = public as $$
begin
  if (select count(*) from public.discoveries where user_id = p_user and discovered_at > now() - interval '1 day') >= public.cfg('max_discoveries_per_day') then
    raise exception 'Dagens gräns för upptäckter är nådd. Kom tillbaka i morgon!';
  end if;
end $$;

-- admin
create or replace function public._require_admin(p_user uuid) returns void language plpgsql security definer set search_path = public as $$
begin if not public.has_role(p_user, 'admin') then raise exception 'Endast admin.'; end if; end $$;

create or replace function public.admin_event_save(p_user uuid, p jsonb) returns json language plpgsql security definer set search_path = public as $$
begin
  perform public._require_admin(p_user);
  insert into public.events (title, description, city, sponsor, lat, lng, radius_m, xp_reward, coin_reward, starts_at, ends_at)
  values (p->>'title', coalesce(p->>'description',''), coalesce(p->>'city',''), nullif(p->>'sponsor',''), (p->>'lat')::float8, (p->>'lng')::float8,
    (p->>'radius_m')::int, (p->>'xp_reward')::int, (p->>'coin_reward')::int, (p->>'starts_at')::timestamptz, (p->>'ends_at')::timestamptz);
  return json_build_object('ok', true);
end $$;
create or replace function public.admin_toggle(p_user uuid, p_table text, p_id uuid, p_active boolean) returns json language plpgsql security definer set search_path = public as $$
begin
  perform public._require_admin(p_user);
  if p_table not in ('events','qr_codes','shop_items') then raise exception 'Ogiltig tabell.'; end if;
  execute format('update public.%I set active = $1 where id = $2', p_table) using p_active, p_id;
  return json_build_object('ok', true);
end $$;
create or replace function public.admin_qr_create(p_user uuid, p_code text, p_label text, p_xp int, p_coins int, p_max int) returns json language plpgsql security definer set search_path = public as $$
begin
  perform public._require_admin(p_user);
  insert into public.qr_codes (code, label, xp_reward, coin_reward, max_uses) values (upper(trim(p_code)), p_label, p_xp, p_coins, p_max);
  return json_build_object('ok', true);
end $$;
create or replace function public.admin_broadcast(p_user uuid, p_title text, p_body text) returns json language plpgsql security definer set search_path = public as $$
declare n int;
begin
  perform public._require_admin(p_user);
  insert into public.notifications (user_id, title, body) select id, p_title, p_body from public.profiles;
  get diagnostics n = row_count;
  return json_build_object('sent', n);
end $$;
create or replace function public.admin_stats(p_user uuid) returns json language plpgsql security definer set search_path = public as $$
begin
  perform public._require_admin(p_user);
  return json_build_object(
    'players', (select count(*) from public.profiles),
    'active7', (select count(distinct user_id) from public.coin_ledger where created_at > now() - interval '7 days'),
    'discoveries7', (select count(*) from public.discoveries where discovered_at > now() - interval '7 days'),
    'parcels', (select count(*) from public.parcels),
    'checkins', (select count(*) from public.event_checkins),
    'qr', (select count(*) from public.qr_redemptions),
    'flags7', (select count(*) from public.cheat_flags where created_at > now() - interval '7 days'),
    'coins', (select coalesce(sum(coins),0) from public.profiles)
  );
end $$;

revoke execute on function public._notify, public.live_event_checkin, public.live_qr_redeem, public.shop_buy, public.shop_equip, public.notif_read_all, public.live_discover_guard, public._require_admin, public.admin_event_save, public.admin_toggle, public.admin_qr_create, public.admin_broadcast, public.admin_stats from public, anon, authenticated;
grant execute on function public.live_event_checkin, public.live_qr_redeem, public.shop_buy, public.shop_equip, public.notif_read_all, public.live_discover_guard, public.admin_event_save, public.admin_toggle, public.admin_qr_create, public.admin_broadcast, public.admin_stats to service_role;
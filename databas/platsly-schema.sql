
create type public.app_role as enum ('admin','founder','user');

create table public.profiles (
  id uuid primary key,
  username text unique not null,
  player_id text unique not null,
  avatar_emoji text not null default '🧭',
  xp bigint not null default 0,
  coins bigint not null default 100,
  level int not null default 1,
  streak int not null default 0,
  last_daily date,
  discoveries_count int not null default 0,
  parcels_count int not null default 0,
  onboarded boolean not null default false,
  show_on_leaderboard boolean not null default true,
  last_lat double precision,
  last_lng double precision,
  last_action_at timestamptz,
  created_at timestamptz not null default now()
);
grant select on public.profiles to authenticated;
grant update (username, avatar_emoji, onboarded, show_on_leaderboard) on public.profiles to authenticated;
grant all on public.profiles to service_role;
alter table public.profiles enable row level security;
create policy "profiles readable" on public.profiles for select to authenticated using (true);
create policy "update own profile" on public.profiles for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);

create table public.user_roles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  role app_role not null,
  unique (user_id, role)
);
grant select on public.user_roles to authenticated;
grant all on public.user_roles to service_role;
alter table public.user_roles enable row level security;
create policy "read own roles" on public.user_roles for select to authenticated using (auth.uid() = user_id);

create or replace function public.has_role(_user_id uuid, _role app_role)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.user_roles where user_id = _user_id and role = _role)
$$;

create table public.game_config (
  key text primary key,
  value numeric not null,
  label text not null default ''
);
grant select on public.game_config to authenticated;
grant all on public.game_config to service_role;
alter table public.game_config enable row level security;
create policy "config readable" on public.game_config for select to authenticated using (true);

insert into public.game_config (key, value, label) values
 ('parcel_claim_cost', 50, 'Kostnad för att ta mark (coins)'),
 ('parcel_min_level', 1, 'Lägsta nivå för att ta mark'),
 ('parcel_claim_xp', 25, 'XP för att ta mark'),
 ('parcel_coins_per_hour', 1, 'Coins per timme per mark'),
 ('parcel_max_hours', 24, 'Max timmar att samla i taget'),
 ('parcel_claim_radius_m', 150, 'Avstånd för att ta mark (m)'),
 ('discovery_gps_buffer_m', 30, 'GPS-marginal vid upptäckt (m)'),
 ('daily_reward_coins', 20, 'Daglig belöning (coins)'),
 ('daily_reward_xp', 10, 'Daglig belöning (XP)'),
 ('max_speed_kmh', 200, 'Max hastighet mellan handlingar (km/h)');

create table public.locations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text not null default '',
  city text not null default '',
  lat double precision not null,
  lng double precision not null,
  category text not null default 'landmark',
  radius_m int not null default 75,
  xp_reward int not null default 50,
  coin_reward int not null default 10,
  rarity text not null default 'vanlig',
  is_demo boolean not null default true,
  active boolean not null default true,
  created_at timestamptz not null default now()
);
grant select on public.locations to authenticated;
grant all on public.locations to service_role;
alter table public.locations enable row level security;
create policy "active locations readable" on public.locations for select to authenticated using (active or public.has_role(auth.uid(),'admin'));

create table public.discoveries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  location_id uuid not null references public.locations(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (user_id, location_id)
);
grant select on public.discoveries to authenticated;
grant all on public.discoveries to service_role;
alter table public.discoveries enable row level security;
create policy "own discoveries" on public.discoveries for select to authenticated using (auth.uid() = user_id);

create table public.parcels (
  cell_id text primary key,
  owner_id uuid not null references public.profiles(id) on delete cascade,
  lat double precision not null,
  lng double precision not null,
  level int not null default 1,
  claimed_at timestamptz not null default now(),
  last_collected_at timestamptz not null default now()
);
create index on public.parcels(owner_id);
create index on public.parcels(lat, lng);
grant select on public.parcels to authenticated;
grant all on public.parcels to service_role;
alter table public.parcels enable row level security;
create policy "parcels readable" on public.parcels for select to authenticated using (true);

create table public.missions (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text not null,
  period text not null check (period in ('daily','weekly')),
  metric text not null check (metric in ('discover','claim','collect','daily')),
  target int not null,
  xp_reward int not null,
  coin_reward int not null,
  active boolean not null default true
);
grant select on public.missions to authenticated;
grant all on public.missions to service_role;
alter table public.missions enable row level security;
create policy "missions readable" on public.missions for select to authenticated using (true);

insert into public.missions (title, description, period, metric, target, xp_reward, coin_reward) values
 ('Dagens upptäckt', 'Upptäck 1 plats idag', 'daily', 'discover', 1, 40, 10),
 ('Hämta skörden', 'Samla in coins från din mark', 'daily', 'collect', 1, 20, 5),
 ('Logga in', 'Hämta din dagliga belöning', 'daily', 'daily', 1, 15, 5),
 ('Veckans utforskare', 'Upptäck 5 platser denna vecka', 'weekly', 'discover', 5, 200, 50),
 ('Markägare', 'Ta 3 bitar spelmark denna vecka', 'weekly', 'claim', 3, 150, 40);

create table public.player_missions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  mission_id uuid not null references public.missions(id) on delete cascade,
  period_key text not null,
  progress int not null default 0,
  claimed boolean not null default false,
  unique (user_id, mission_id, period_key)
);
grant select on public.player_missions to authenticated;
grant all on public.player_missions to service_role;
alter table public.player_missions enable row level security;
create policy "own player missions" on public.player_missions for select to authenticated using (auth.uid() = user_id);

create table public.achievements (
  code text primary key,
  title text not null,
  description text not null,
  icon text not null,
  metric text not null,
  target int not null,
  xp_reward int not null,
  coin_reward int not null
);
grant select on public.achievements to authenticated;
grant all on public.achievements to service_role;
alter table public.achievements enable row level security;
create policy "achievements readable" on public.achievements for select to authenticated using (true);

insert into public.achievements values
 ('first_discovery','Första steget','Upptäck din första plats','🥾','discover',1,50,20),
 ('discover_10','Upptäcktsresande','Upptäck 10 platser','🧭','discover',10,300,100),
 ('discover_50','Sverigekännare','Upptäck 50 platser','🗺️','discover',50,1500,500),
 ('first_parcel','Första marken','Ta din första spelmark','🚩','claim',1,50,20),
 ('parcel_10','Godsägare','Äg 10 bitar spelmark','🏰','claim',10,400,150),
 ('streak_7','Veckovana','Spela 7 dagar i rad','🔥','streak',7,300,100);

create table public.player_achievements (
  user_id uuid not null references public.profiles(id) on delete cascade,
  code text not null references public.achievements(code) on delete cascade,
  unlocked_at timestamptz not null default now(),
  primary key (user_id, code)
);
grant select on public.player_achievements to authenticated;
grant all on public.player_achievements to service_role;
alter table public.player_achievements enable row level security;
create policy "own achievements" on public.player_achievements for select to authenticated using (auth.uid() = user_id);

create table public.coin_ledger (
  id bigserial primary key,
  user_id uuid not null references public.profiles(id) on delete cascade,
  coin_delta bigint not null default 0,
  xp_delta bigint not null default 0,
  reason text not null,
  created_at timestamptz not null default now()
);
create index on public.coin_ledger(user_id, created_at desc);
grant select on public.coin_ledger to authenticated;
grant all on public.coin_ledger to service_role;
grant usage, select on sequence public.coin_ledger_id_seq to service_role;
alter table public.coin_ledger enable row level security;
create policy "own ledger" on public.coin_ledger for select to authenticated using (auth.uid() = user_id);

-- new user
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  base text;
  uname text;
  pid text;
begin
  base := lower(regexp_replace(coalesce(new.raw_user_meta_data->>'username', split_part(new.email,'@',1), 'spelare'), '[^a-zA-Z0-9_åäöÅÄÖ]', '', 'g'));
  if length(base) < 3 then base := 'spelare'; end if;
  base := left(base, 16);
  uname := base;
  while exists (select 1 from public.profiles where username = uname) loop
    uname := base || floor(random()*9000+1000)::text;
  end loop;
  loop
    pid := 'PL-' || upper(substr(md5(random()::text), 1, 6));
    exit when not exists (select 1 from public.profiles where player_id = pid);
  end loop;
  insert into public.profiles (id, username, player_id) values (new.id, uname, pid);
  insert into public.user_roles (user_id, role) values (new.id, 'user');
  return new;
end $$;
create trigger on_auth_user_created after insert on auth.users for each row execute function public.handle_new_user();

-- helpers
create or replace function public.level_for_xp(p_xp bigint)
returns int language sql immutable as $$
  select greatest(1, floor((1 + sqrt(1 + 8 * greatest(p_xp,0) / 50.0)) / 2)::int)
$$;

create or replace function public.haversine_m(lat1 double precision, lng1 double precision, lat2 double precision, lng2 double precision)
returns double precision language sql immutable as $$
  select 2 * 6371000 * asin(sqrt(power(sin(radians(lat2-lat1)/2),2) + cos(radians(lat1))*cos(radians(lat2))*power(sin(radians(lng2-lng1)/2),2)))
$$;

create or replace function public.cfg(p_key text) returns numeric language sql stable security definer set search_path = public as $$
  select value from public.game_config where key = p_key
$$;

create or replace function public._award(p_user uuid, p_xp bigint, p_coins bigint, p_reason text)
returns void language plpgsql security definer set search_path = public as $$
begin
  update public.profiles set xp = xp + p_xp, coins = coins + p_coins, level = public.level_for_xp(xp + p_xp) where id = p_user;
  insert into public.coin_ledger (user_id, coin_delta, xp_delta, reason) values (p_user, p_coins, p_xp, p_reason);
end $$;

create or replace function public._progress(p_user uuid, p_metric text, p_amount int)
returns void language plpgsql security definer set search_path = public as $$
declare
  m record;
  pk text;
  cnt int;
  a record;
begin
  for m in select * from public.missions where active and metric = p_metric loop
    pk := case when m.period = 'daily' then to_char(now() at time zone 'Europe/Stockholm', 'YYYY-MM-DD') else to_char(now() at time zone 'Europe/Stockholm', 'IYYY-"W"IW') end;
    insert into public.player_missions (user_id, mission_id, period_key, progress) values (p_user, m.id, pk, least(p_amount, m.target))
    on conflict (user_id, mission_id, period_key) do update set progress = least(public.player_missions.progress + p_amount, m.target);
  end loop;
  for a in select * from public.achievements where metric in (p_metric, 'streak') loop
    if exists (select 1 from public.player_achievements where user_id = p_user and code = a.code) then continue; end if;
    select case a.metric when 'discover' then discoveries_count when 'claim' then parcels_count when 'streak' then streak else 0 end into cnt from public.profiles where id = p_user;
    if cnt >= a.target then
      insert into public.player_achievements (user_id, code) values (p_user, a.code);
      perform public._award(p_user, a.xp_reward, a.coin_reward, 'Prestation: ' || a.title);
    end if;
  end loop;
end $$;

create or replace function public._check_speed(p_user uuid, p_lat double precision, p_lng double precision)
returns void language plpgsql security definer set search_path = public as $$
declare p record; secs double precision; kmh double precision;
begin
  select last_lat, last_lng, last_action_at into p from public.profiles where id = p_user;
  if p.last_action_at is not null and p.last_lat is not null then
    secs := greatest(extract(epoch from now() - p.last_action_at), 1);
    kmh := public.haversine_m(p.last_lat, p.last_lng, p_lat, p_lng) / secs * 3.6;
    if kmh > public.cfg('max_speed_kmh') and public.haversine_m(p.last_lat, p.last_lng, p_lat, p_lng) > 1000 then
      raise exception 'Du verkar röra dig orimligt snabbt. Försök igen om en stund.';
    end if;
  end if;
  update public.profiles set last_lat = p_lat, last_lng = p_lng, last_action_at = now() where id = p_user;
end $$;

create or replace function public.game_discover(p_user uuid, p_location uuid, p_lat double precision, p_lng double precision)
returns json language plpgsql security definer set search_path = public as $$
declare loc record; d double precision;
begin
  select * into loc from public.locations where id = p_location and active;
  if loc is null then raise exception 'Platsen finns inte.'; end if;
  d := public.haversine_m(p_lat, p_lng, loc.lat, loc.lng);
  if d > loc.radius_m + public.cfg('discovery_gps_buffer_m') then
    raise exception 'Du är för långt bort (% m).', round(d);
  end if;
  if exists (select 1 from public.discoveries where user_id = p_user and location_id = p_location) then
    raise exception 'Du har redan upptäckt den här platsen.';
  end if;
  perform public._check_speed(p_user, p_lat, p_lng);
  insert into public.discoveries (user_id, location_id) values (p_user, p_location);
  update public.profiles set discoveries_count = discoveries_count + 1 where id = p_user;
  perform public._award(p_user, loc.xp_reward, loc.coin_reward, 'Upptäckt: ' || loc.name);
  perform public._progress(p_user, 'discover', 1);
  return json_build_object('name', loc.name, 'xp', loc.xp_reward, 'coins', loc.coin_reward);
end $$;

create or replace function public.game_claim(p_user uuid, p_cell text, p_lat double precision, p_lng double precision)
returns json language plpgsql security definer set search_path = public as $$
declare
  li int; gi int; clat double precision; clng double precision; cost int; prof record;
begin
  if p_cell !~ '^-?\d+:-?\d+$' then raise exception 'Ogiltig mark.'; end if;
  li := split_part(p_cell, ':', 1)::int; gi := split_part(p_cell, ':', 2)::int;
  clat := (li + 0.5) * 0.001; clng := (gi + 0.5) * 0.002;
  if public.haversine_m(p_lat, p_lng, clat, clng) > public.cfg('parcel_claim_radius_m') then
    raise exception 'Du måste vara närmare marken för att ta den.';
  end if;
  if exists (select 1 from public.parcels where cell_id = p_cell) then raise exception 'Marken är redan tagen.'; end if;
  select * into prof from public.profiles where id = p_user for update;
  if prof.level < public.cfg('parcel_min_level') then raise exception 'Du behöver nå nivå % först.', public.cfg('parcel_min_level'); end if;
  cost := public.cfg('parcel_claim_cost');
  if prof.coins < cost then raise exception 'Du behöver % coins för att ta marken.', cost; end if;
  perform public._check_speed(p_user, p_lat, p_lng);
  insert into public.parcels (cell_id, owner_id, lat, lng) values (p_cell, p_user, clat, clng);
  update public.profiles set parcels_count = parcels_count + 1 where id = p_user;
  perform public._award(p_user, public.cfg('parcel_claim_xp')::bigint, -cost, 'Tog spelmark ' || p_cell);
  perform public._progress(p_user, 'claim', 1);
  return json_build_object('cell', p_cell, 'cost', cost);
end $$;

create or replace function public.game_collect(p_user uuid)
returns json language plpgsql security definer set search_path = public as $$
declare total bigint;
begin
  select coalesce(sum(floor(least(extract(epoch from now() - last_collected_at)/3600.0, public.cfg('parcel_max_hours')) * public.cfg('parcel_coins_per_hour') * level)), 0)::bigint
    into total from public.parcels where owner_id = p_user;
  if total <= 0 then raise exception 'Inget att samla in ännu. Kom tillbaka senare!'; end if;
  update public.parcels set last_collected_at = now() where owner_id = p_user;
  perform public._award(p_user, 0, total, 'Insamling från mark');
  perform public._progress(p_user, 'collect', 1);
  return json_build_object('coins', total);
end $$;

create or replace function public.game_daily(p_user uuid)
returns json language plpgsql security definer set search_path = public as $$
declare today date := (now() at time zone 'Europe/Stockholm')::date; prof record; ns int;
begin
  select * into prof from public.profiles where id = p_user for update;
  if prof.last_daily = today then raise exception 'Du har redan hämtat dagens belöning.'; end if;
  ns := case when prof.last_daily = today - 1 then prof.streak + 1 else 1 end;
  update public.profiles set streak = ns, last_daily = today where id = p_user;
  perform public._award(p_user, public.cfg('daily_reward_xp')::bigint, (public.cfg('daily_reward_coins') + least(ns, 7) * 2)::bigint, 'Daglig belöning');
  perform public._progress(p_user, 'daily', 1);
  return json_build_object('streak', ns);
end $$;

create or replace function public.game_claim_mission(p_user uuid, p_player_mission uuid)
returns json language plpgsql security definer set search_path = public as $$
declare pm record; m record;
begin
  select * into pm from public.player_missions where id = p_player_mission and user_id = p_user for update;
  if pm is null then raise exception 'Uppdraget hittades inte.'; end if;
  if pm.claimed then raise exception 'Redan hämtad.'; end if;
  select * into m from public.missions where id = pm.mission_id;
  if pm.progress < m.target then raise exception 'Uppdraget är inte klart än.'; end if;
  update public.player_missions set claimed = true where id = pm.id;
  perform public._award(p_user, m.xp_reward, m.coin_reward, 'Uppdrag: ' || m.title);
  return json_build_object('xp', m.xp_reward, 'coins', m.coin_reward);
end $$;

revoke execute on function public._award, public._progress, public._check_speed, public.game_discover, public.game_claim, public.game_collect, public.game_daily, public.game_claim_mission, public.handle_new_user from public, anon, authenticated;
grant execute on function public.game_discover, public.game_claim, public.game_collect, public.game_daily, public.game_claim_mission to service_role;

-- seed locations (demo)
insert into public.locations (name, description, city, lat, lng, category, radius_m, xp_reward, coin_reward, rarity) values
('Gamla stan','Stockholms medeltida stadskärna med smala gränder.','Stockholm',59.3251,18.0711,'historisk',120,60,15,'vanlig'),
('Stadshuset','Stadshuset vid Riddarfjärden.','Stockholm',59.3275,18.0543,'landmärke',90,50,12,'vanlig'),
('Monteliusvägen','Utsiktspromenad över Riddarfjärden.','Stockholm',59.3197,18.0626,'utsikt',80,70,18,'ovanlig'),
('Djurgården','Grön ö mitt i staden.','Stockholm',59.3260,18.1150,'natur',200,50,12,'vanlig'),
('Skinnarviksberget','Stockholms högsta naturliga punkt i innerstaden.','Stockholm',59.3205,18.0548,'utsikt',70,80,20,'ovanlig'),
('Hagaparken','Kunglig park i Solna.','Stockholm',59.3613,18.0367,'natur',200,50,12,'vanlig'),
('Liseberg','Nöjespark i centrala Göteborg.','Göteborg',57.6953,11.9920,'landmärke',150,50,12,'vanlig'),
('Skansen Kronan','Befästning på en kulle i Haga.','Göteborg',57.6967,11.9532,'historisk',70,70,18,'ovanlig'),
('Ramberget','Utsikt över hamnen.','Göteborg',57.7180,11.9330,'utsikt',100,80,20,'ovanlig'),
('Slottsskogen','Stor stadspark.','Göteborg',57.6860,11.9420,'natur',200,50,12,'vanlig'),
('Turning Torso','Skandinaviens kanske mest kända skyskrapa.','Malmö',55.6133,12.9763,'landmärke',100,50,12,'vanlig'),
('Malmöhus slott','Renässansslott i centrala Malmö.','Malmö',55.6047,12.9871,'historisk',100,60,15,'vanlig'),
('Ribersborgs kallbadhus','Klassiskt kallbadhus.','Malmö',55.6011,12.9611,'landmärke',80,60,15,'vanlig'),
('Uppsala domkyrka','Nordens största kyrka.','Uppsala',59.8581,17.6331,'historisk',100,60,15,'vanlig'),
('Gamla Uppsala','Kungshögar från järnåldern.','Uppsala',59.8986,17.6314,'historisk',150,90,25,'sällsynt'),
('Uppsala slott','Slott på åsen över staden.','Uppsala',59.8536,17.6350,'historisk',100,60,15,'vanlig'),
('Sandgrund','Konsthall vid Klarälven.','Karlstad',59.3833,13.4950,'landmärke',80,50,12,'vanlig'),
('Stora torget Karlstad','Stadens hjärta.','Karlstad',59.3810,13.5035,'stad',100,40,10,'vanlig'),
('Örebro slott','Medeltida slott i Svartån.','Örebro',59.2741,15.2149,'historisk',100,60,15,'vanlig'),
('Svampen','Vattentorn med utsikt.','Örebro',59.2874,15.2245,'utsikt',80,70,18,'ovanlig'),
('Västerås domkyrka','Gotisk domkyrka.','Västerås',59.6122,16.5441,'historisk',90,60,15,'vanlig'),
('Anundshög','Sveriges största gravhög.','Västerås',59.6267,16.6150,'historisk',120,90,25,'sällsynt'),
('Linköpings domkyrka','En av Sveriges största medeltida kyrkor.','Linköping',58.4097,15.6215,'historisk',90,60,15,'vanlig'),
('Gamla Linköping','Friluftsmuseum med kulturhistoriska hus.','Linköping',58.4064,15.5928,'historisk',120,60,15,'vanlig'),
('Industrilandskapet','Kanaler och gamla fabriker.','Norrköping',58.5920,16.1820,'historisk',150,60,15,'vanlig'),
('Kolmårdens djurpark','Djurpark vid Bråviken.','Norrköping',58.6670,16.3990,'landmärke',250,70,18,'ovanlig'),
('Norra Stadsberget','Utsiktstorn ovanför Sundsvall.','Sundsvall',62.3990,17.2950,'utsikt',150,80,20,'ovanlig'),
('Stenstan','Stenstaden efter branden 1888.','Sundsvall',62.3910,17.3080,'stad',150,50,12,'vanlig'),
('Umeälven strandpromenad','Promenad längs älven.','Umeå',63.8240,20.2630,'natur',200,50,12,'vanlig'),
('Gammlia','Friluftsmuseum i Umeå.','Umeå',63.8290,20.2860,'historisk',120,60,15,'vanlig'),
('Gammelstads kyrkstad','Världsarv med kyrkstugor.','Luleå',65.6460,22.0290,'historisk',150,100,30,'sällsynt'),
('Luleå Norra hamn','Hamnen i Luleå.','Luleå',65.5870,22.1550,'stad',150,40,10,'vanlig'),
('Växjö domkyrka','Katedral i Växjö.','Växjö',56.8780,14.8050,'historisk',90,60,15,'vanlig'),
('Kronobergs slottsruin','Ruin vid Helgasjön.','Växjö',56.9100,14.8150,'historisk',100,80,20,'ovanlig'),
('Vätterstranden','Strand mot Vättern.','Jönköping',57.7860,14.1700,'natur',200,50,12,'vanlig'),
('Stadsparken Jönköping','Park med utsikt över Vättern.','Jönköping',57.7850,14.1450,'utsikt',150,60,15,'vanlig'),
('Kiruna kyrka','Träkyrka i Kiruna.','Kiruna',67.8500,20.2190,'historisk',100,100,30,'sällsynt'),
('Abisko','Porten till fjällen.','Abisko',68.3570,18.7830,'natur',250,150,40,'episk'),
('Visby ringmur','Medeltida ringmur på Gotland.','Visby',57.6390,18.2920,'historisk',200,100,30,'sällsynt'),
('Borgholms slottsruin','Ruin på Öland.','Borgholm',56.8640,16.6420,'historisk',150,90,25,'sällsynt'),
('Kalmar slott','Renässansslott vid havet.','Kalmar',56.6590,16.3560,'historisk',120,70,18,'ovanlig'),
('Ales stenar','Skeppssättning ovanför Kåseberga.','Kåseberga',55.3830,14.0550,'historisk',120,120,35,'episk'),
('Kullabergs fyr','Fyr längst ut på Kullaberg.','Mölle',56.3040,12.4530,'utsikt',150,100,30,'sällsynt'),
('Höga kusten-bron','Hängbro över Ångermanälven.','Kramfors',62.7980,17.9370,'landmärke',200,90,25,'sällsynt'),
('Skuleberget','Berg vid Höga kusten.','Kramfors',63.1050,18.3800,'natur',200,120,35,'episk'),
('Falu gruva','Världsarv och koppargruva.','Falun',60.6000,15.6110,'historisk',150,90,25,'sällsynt'),
('Siljan Tällberg','Utsikt över Siljan.','Tällberg',60.8240,14.9970,'utsikt',150,80,20,'ovanlig'),
('Åre torg','Fjällby i Jämtland.','Åre',63.3990,13.0810,'stad',150,80,20,'ovanlig'),
('Marstrands fästning','Carlstens fästning.','Marstrand',57.8870,11.5830,'historisk',150,90,25,'sällsynt'),
('Smögenbryggan','Färgglad brygga på västkusten.','Smögen',58.3580,11.2220,'landmärke',150,80,20,'ovanlig'),
('Vadstena slott','Vasaslott vid Vättern.','Vadstena',58.4480,14.8880,'historisk',120,80,20,'ovanlig'),
('Ystads torg','Medeltida torg i Ystad.','Ystad',55.4290,13.8200,'stad',100,50,12,'vanlig'),
('Haparanda gränsen','Gränsstaden mot Finland.','Haparanda',65.8350,24.1370,'stad',150,80,20,'ovanlig'),
('Göta kanal Berg','Slussarna i Berg.','Linköping',58.4870,15.5290,'landmärke',150,70,18,'ovanlig'),
('Mariefreds Gripsholm','Slott vid Mälaren.','Mariefred',59.2560,17.2190,'historisk',120,80,20,'ovanlig'),
('Sigtuna Stora gatan','Sveriges äldsta gata.','Sigtuna',59.6170,17.7230,'historisk',120,70,18,'ovanlig'),
('Dalarö','Skärgårdsidyll.','Dalarö',59.1330,18.4050,'natur',150,70,18,'ovanlig'),
('Lunds domkyrka','Romansk domkyrka.','Lund',55.7040,13.1940,'historisk',90,60,15,'vanlig'),
('Helsingborg Kärnan','Medeltida kastaltorn.','Helsingborg',56.0470,12.6950,'historisk',90,60,15,'vanlig'),
('Lilla Karlsö utsikt','Fågelö utanför Gotland, sett från stranden.','Klintehamn',57.3100,18.1700,'natur',250,120,35,'episk');
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
grant execute on function public.social_friend_request, public.social_friend_respond, public.social_team_create, public.social_team_join, public.social_team_leave, public.social_challenge_create, public.social_challenge_respond, public.social_challenge_sync, public.social_redeem_invite to service_role;insert into public.locations (name, description, city, lat, lng, category, radius_m, xp_reward, coin_reward, rarity) values
('Storgatan Sunne','Sunnes huvudgata med butiker och caféer.','Sunne',59.8368,13.1432,'stad',120,40,10,'vanlig'),
('Sunne kyrka','Kyrkan mitt i Sunne.','Sunne',59.8382,13.1468,'historisk',80,50,12,'vanlig'),
('Sunne station','Järnvägsstationen i Sunne.','Sunne',59.8372,13.1392,'stad',80,35,8,'vanlig'),
('Sunne bibliotek','Kommunens bibliotek i centrum.','Sunne',59.8360,13.1418,'stad',70,40,10,'vanlig'),
('Sundsbergs gård','Herrgård känd från Gösta Berlings saga.','Sunne',59.8352,13.1448,'historisk',80,60,15,'ovanlig'),
('Kolsnäsudden','Badplats och grönområde vid Fryken.','Sunne',59.8300,13.1370,'natur',150,50,12,'vanlig'),
('Ski Sunne','Skidbacken strax väster om Sunne.','Sunne',59.8490,13.0930,'natur',200,60,15,'ovanlig'),
('Tossebergsklätten','Utsiktsberg med vy över Frykensjöarna.','Sunne',59.8700,13.0800,'utsikt',150,90,22,'sällsynt'),
('Rottneros park','Skulpturpark och herrgård vid Fryken.','Sunne',59.7978,13.1186,'landmärke',200,70,18,'ovanlig'),
('Mårbacka','Selma Lagerlöfs hem.','Sunne',59.7593,13.2405,'historisk',150,90,22,'sällsynt'),
('Storgatan Torsby','Torsbys centrumgata.','Torsby',60.1358,13.0075,'stad',120,40,10,'vanlig'),
('Torsby station','Järnvägsstationen i Torsby.','Torsby',60.1335,13.0005,'stad',80,35,8,'vanlig'),
('Torsby kyrka','Kyrkan i Torsby.','Torsby',60.1350,13.0015,'historisk',80,50,12,'vanlig'),
('Torsby Fordonsmuseum','Museum med bilar och motorcyklar.','Torsby',60.1392,13.0050,'landmärke',80,60,15,'ovanlig'),
('Torsby skidtunnel','Skidtunnel för åretruntåkning.','Torsby',60.1490,13.0240,'landmärke',120,70,18,'ovanlig'),
('Hovfjället','Fjäll och skidområde norr om Torsby.','Torsby',60.1960,13.0540,'natur',250,90,22,'sällsynt'),
('Storgatan Kil','Kils centrumgata.','Kil',59.5032,13.3165,'stad',120,40,10,'vanlig'),
('Kil station','Järnvägsknuten i Kil.','Kil',59.5036,13.3178,'stad',80,35,8,'vanlig'),
('Kils kyrka','Kyrkan i Kil.','Kil',59.5085,13.3200,'historisk',80,50,12,'vanlig'),
('Karlstads domkyrka','Domkyrkan i Karlstad.','Karlstad',59.3807,13.5048,'historisk',80,50,12,'vanlig'),
('Karlstad C','Centralstationen i Karlstad.','Karlstad',59.3780,13.4990,'stad',100,35,8,'vanlig'),
('Mariebergsskogen','Park och friluftsmuseum.','Karlstad',59.3700,13.4880,'natur',200,50,12,'vanlig'),
('Karlstads universitet','Universitetet i Karlstad.','Karlstad',59.4057,13.5808,'stad',200,40,10,'vanlig'),
('Kungsgatan Karlstad','Gågata i Karlstads centrum.','Karlstad',59.3800,13.5010,'stad',100,40,10,'vanlig'),
('Arvika torg','Torget i Arvika.','Arvika',59.6550,12.5880,'stad',100,40,10,'vanlig'),
('Hagfors centrum','Centrum i Hagfors.','Hagfors',60.0330,13.6960,'stad',120,40,10,'vanlig');delete from public.discoveries where location_id in (select id from public.locations where is_demo and city in ('Sunne','Torsby','Kil','Arvika','Hagfors') or (is_demo and name in ('Karlstads domkyrka','Karlstad C','Mariebergsskogen','Karlstads universitet','Kungsgatan Karlstad')));
delete from public.locations where is_demo and (city in ('Sunne','Torsby','Kil','Arvika','Hagfors') or name in ('Karlstads domkyrka','Karlstad C','Mariebergsskogen','Karlstads universitet','Kungsgatan Karlstad'));alter table public.profiles add column if not exists title text;

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
grant execute on function public.live_event_checkin, public.live_qr_redeem, public.shop_buy, public.shop_equip, public.notif_read_all, public.live_discover_guard, public.admin_event_save, public.admin_toggle, public.admin_qr_create, public.admin_broadcast, public.admin_stats to service_role;create or replace function public.live_discover_guard(p_user uuid) returns void language plpgsql security definer set search_path = public as $$
begin
  if (select count(*) from public.discoveries where user_id = p_user and created_at > now() - interval '1 day') >= public.cfg('max_discoveries_per_day') then
    insert into public.cheat_flags (user_id, reason) values (p_user, 'Dagsgräns för upptäckter');
    raise exception 'Dagens gräns för upptäckter är nådd. Kom tillbaka i morgon!';
  end if;
end $$;
revoke execute on function public.live_discover_guard from public, anon, authenticated;
grant execute on function public.live_discover_guard to service_role;
set session_replication_role = replica;
truncate public.friendships, public.teams, public.team_members, public.challenges, public.profiles, public.user_roles, public.game_config, public.locations, public.discoveries, public.parcels, public.missions, public.player_missions, public.achievements, public.player_achievements, public.coin_ledger, public.events, public.event_checkins, public.qr_codes, public.qr_redemptions, public.shop_items, public.inventory, public.notifications, public.cheat_flags cascade;
--
-- PostgreSQL database dump
--

\restrict gKZrMLvAueALExrZODKxyfQTvo1LnrT2NfkQeOIes6hhnDdyqxKv3HzOaFWlF6t

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.achievements DISABLE TRIGGER ALL;

COPY public.achievements (code, title, description, icon, metric, target, xp_reward, coin_reward) FROM stdin;
first_discovery	Första steget	Upptäck din första plats	🥾	discover	1	50	20
discover_10	Upptäcktsresande	Upptäck 10 platser	🧭	discover	10	300	100
discover_50	Sverigekännare	Upptäck 50 platser	🗺️	discover	50	1500	500
first_parcel	Första marken	Ta din första spelmark	🚩	claim	1	50	20
parcel_10	Godsägare	Äg 10 bitar spelmark	🏰	claim	10	400	150
streak_7	Veckovana	Spela 7 dagar i rad	🔥	streak	7	300	100
\.


ALTER TABLE public.achievements ENABLE TRIGGER ALL;

--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.profiles DISABLE TRIGGER ALL;

COPY public.profiles (id, username, player_id, avatar_emoji, xp, coins, level, streak, last_daily, discoveries_count, parcels_count, onboarded, show_on_leaderboard, last_lat, last_lng, last_action_at, created_at, invited_by, title) FROM stdin;
1230ab95-18da-454f-9058-83978e7fa478	linkko98	PL-13EDC6	🌲	3010600	45	347	1	2026-10-06	0	5	t	t	59.8037848	13.1053043	2026-10-06 18:13:18.074057+00	2026-10-06 17:25:45.257962+00	\N	\N
386fdfc8-2396-4407-b5e5-0b4baa5b58b6	derru68	PL-CE0A0E	🧭	60	147	2	1	2026-10-06	0	0	t	t	\N	\N	\N	2026-10-06 17:44:13.501095+00	\N	\N
\.


ALTER TABLE public.profiles ENABLE TRIGGER ALL;

--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.challenges DISABLE TRIGGER ALL;

COPY public.challenges (id, challenger, opponent, metric, status, base_a, base_b, score_a, score_b, winner, ends_at, created_at) FROM stdin;
\.


ALTER TABLE public.challenges ENABLE TRIGGER ALL;

--
-- Data for Name: cheat_flags; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.cheat_flags DISABLE TRIGGER ALL;

COPY public.cheat_flags (id, user_id, reason, created_at) FROM stdin;
\.


ALTER TABLE public.cheat_flags ENABLE TRIGGER ALL;

--
-- Data for Name: coin_ledger; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.coin_ledger DISABLE TRIGGER ALL;

COPY public.coin_ledger (id, user_id, coin_delta, xp_delta, reason, created_at) FROM stdin;
1	1230ab95-18da-454f-9058-83978e7fa478	22	10	Daglig belöning	2026-10-06 17:27:10.159784+00
2	1230ab95-18da-454f-9058-83978e7fa478	-50	25	Tog spelmark 59803:6552	2026-10-06 17:35:01.449732+00
3	1230ab95-18da-454f-9058-83978e7fa478	20	50	Prestation: Första marken	2026-10-06 17:35:01.449732+00
4	1230ab95-18da-454f-9058-83978e7fa478	5	15	Uppdrag: Logga in	2026-10-06 17:43:14.298423+00
5	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	22	10	Daglig belöning	2026-10-06 17:44:39.350809+00
6	1230ab95-18da-454f-9058-83978e7fa478	-50	10500	Tog spelmark 59804:6552	2026-10-06 18:11:47.767315+00
7	1230ab95-18da-454f-9058-83978e7fa478	-1	1000000	Tog spelmark 59804:6553	2026-10-06 18:12:54.445825+00
8	1230ab95-18da-454f-9058-83978e7fa478	-1	1000000	Tog spelmark 59803:6553	2026-10-06 18:13:00.844571+00
9	1230ab95-18da-454f-9058-83978e7fa478	-1	1000000	Tog spelmark 59802:6552	2026-10-06 18:13:18.074057+00
10	1230ab95-18da-454f-9058-83978e7fa478	1	0	Insamling från mark	2026-10-06 18:40:21.413737+00
11	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	25	50	QR: Tack för att du spelar	2026-10-06 18:43:41.421974+00
\.


ALTER TABLE public.coin_ledger ENABLE TRIGGER ALL;

--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.locations DISABLE TRIGGER ALL;

COPY public.locations (id, name, description, city, lat, lng, category, radius_m, xp_reward, coin_reward, rarity, is_demo, active, created_at) FROM stdin;
e23909ea-371c-4b92-b3cd-5ebdb71e3e41	Gamla stan	Stockholms medeltida stadskärna med smala gränder.	Stockholm	59.3251	18.0711	historisk	120	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
00efc99b-2e35-4fe9-ad36-11bc9afd38e6	Stadshuset	Stadshuset vid Riddarfjärden.	Stockholm	59.3275	18.0543	landmärke	90	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
3802bb94-e4bf-4420-8fbb-528811854d97	Monteliusvägen	Utsiktspromenad över Riddarfjärden.	Stockholm	59.3197	18.0626	utsikt	80	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
4602b0cb-94e8-4189-a954-5eb84b096e2a	Djurgården	Grön ö mitt i staden.	Stockholm	59.326	18.115	natur	200	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
50b303d5-21da-4a82-8de1-d6cbd628dd4c	Skinnarviksberget	Stockholms högsta naturliga punkt i innerstaden.	Stockholm	59.3205	18.0548	utsikt	70	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
3c3eb439-6e66-4d94-b3f5-298f6cb85ed3	Hagaparken	Kunglig park i Solna.	Stockholm	59.3613	18.0367	natur	200	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
3c04cd3c-6a1f-42d3-97b0-0549782c59c0	Liseberg	Nöjespark i centrala Göteborg.	Göteborg	57.6953	11.992	landmärke	150	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
9a6e7137-afba-4fad-8093-871746ad898b	Skansen Kronan	Befästning på en kulle i Haga.	Göteborg	57.6967	11.9532	historisk	70	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
ef657eb8-0e04-4a02-b44d-3e9f8848e2c3	Ramberget	Utsikt över hamnen.	Göteborg	57.718	11.933	utsikt	100	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
8e5a3994-b514-485a-ad19-02b7d70187e1	Slottsskogen	Stor stadspark.	Göteborg	57.686	11.942	natur	200	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
882f4247-db71-42ce-98ac-c433941ff2ce	Turning Torso	Skandinaviens kanske mest kända skyskrapa.	Malmö	55.6133	12.9763	landmärke	100	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
405cf67b-413a-4c64-adce-3409c50d5a8d	Malmöhus slott	Renässansslott i centrala Malmö.	Malmö	55.6047	12.9871	historisk	100	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
f4ee0d39-381f-400f-9f83-0131ec5e64bc	Ribersborgs kallbadhus	Klassiskt kallbadhus.	Malmö	55.6011	12.9611	landmärke	80	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
9a9c52ae-b18c-4db4-929e-e3619a0a9216	Uppsala domkyrka	Nordens största kyrka.	Uppsala	59.8581	17.6331	historisk	100	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
777250c3-e8a2-40c6-87c4-e569d412c4c2	Gamla Uppsala	Kungshögar från järnåldern.	Uppsala	59.8986	17.6314	historisk	150	90	25	sällsynt	t	t	2026-10-06 17:17:11.42549+00
1efcdac6-4a20-49e5-a9bd-177b2e54cb37	Uppsala slott	Slott på åsen över staden.	Uppsala	59.8536	17.635	historisk	100	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
526bf18f-b337-435c-a787-fd5b9afc495b	Sandgrund	Konsthall vid Klarälven.	Karlstad	59.3833	13.495	landmärke	80	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
a6dced7f-c620-45d5-84e5-dc08734d1bff	Stora torget Karlstad	Stadens hjärta.	Karlstad	59.381	13.5035	stad	100	40	10	vanlig	t	t	2026-10-06 17:17:11.42549+00
a119042a-e052-46e6-9614-575bfd3aa905	Örebro slott	Medeltida slott i Svartån.	Örebro	59.2741	15.2149	historisk	100	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
93158f51-7eaf-45bf-a619-ee9c148e3a3f	Svampen	Vattentorn med utsikt.	Örebro	59.2874	15.2245	utsikt	80	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
339a9a57-8d8b-46ec-aed4-cfd8c1c14ed7	Västerås domkyrka	Gotisk domkyrka.	Västerås	59.6122	16.5441	historisk	90	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
b5d59fd8-8b62-45b2-91c0-8da5acdc8c66	Anundshög	Sveriges största gravhög.	Västerås	59.6267	16.615	historisk	120	90	25	sällsynt	t	t	2026-10-06 17:17:11.42549+00
7f4714fc-8030-4acf-bf41-7291cdc1f11d	Linköpings domkyrka	En av Sveriges största medeltida kyrkor.	Linköping	58.4097	15.6215	historisk	90	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
b20f50c7-3451-4119-8da4-5c62a5181093	Gamla Linköping	Friluftsmuseum med kulturhistoriska hus.	Linköping	58.4064	15.5928	historisk	120	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
c550d172-d304-4658-81c9-a1d1995cb756	Industrilandskapet	Kanaler och gamla fabriker.	Norrköping	58.592	16.182	historisk	150	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
a5ecc75e-b579-438d-9e44-af0f8e1a7dae	Kolmårdens djurpark	Djurpark vid Bråviken.	Norrköping	58.667	16.399	landmärke	250	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
e03828bb-23f5-4284-be4b-81f132386ebc	Norra Stadsberget	Utsiktstorn ovanför Sundsvall.	Sundsvall	62.399	17.295	utsikt	150	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
4d625d77-3ad0-4254-a8b9-cb1f33d999ed	Stenstan	Stenstaden efter branden 1888.	Sundsvall	62.391	17.308	stad	150	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
b2d64990-915d-41fc-a286-11f47d90a275	Umeälven strandpromenad	Promenad längs älven.	Umeå	63.824	20.263	natur	200	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
2d6ccd98-6953-4598-baa6-64925daaea96	Gammlia	Friluftsmuseum i Umeå.	Umeå	63.829	20.286	historisk	120	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
589ee6c3-6acf-4f5d-b59c-9076f20dcb6f	Gammelstads kyrkstad	Världsarv med kyrkstugor.	Luleå	65.646	22.029	historisk	150	100	30	sällsynt	t	t	2026-10-06 17:17:11.42549+00
815f9e7a-843e-4b04-be4c-a8d76303b25f	Luleå Norra hamn	Hamnen i Luleå.	Luleå	65.587	22.155	stad	150	40	10	vanlig	t	t	2026-10-06 17:17:11.42549+00
d318c7df-1f76-41e4-84b2-22c2f1c150e2	Växjö domkyrka	Katedral i Växjö.	Växjö	56.878	14.805	historisk	90	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
a1adfd31-41d7-45b5-b1f4-a6d3cb933334	Kronobergs slottsruin	Ruin vid Helgasjön.	Växjö	56.91	14.815	historisk	100	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
bd2f560a-2948-45d4-ad41-c40c8966fd46	Vätterstranden	Strand mot Vättern.	Jönköping	57.786	14.17	natur	200	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
083c0bb2-ff60-4d34-be7f-de8606956aa3	Stadsparken Jönköping	Park med utsikt över Vättern.	Jönköping	57.785	14.145	utsikt	150	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
57edf64b-be25-46f8-b768-be53ade652f7	Kiruna kyrka	Träkyrka i Kiruna.	Kiruna	67.85	20.219	historisk	100	100	30	sällsynt	t	t	2026-10-06 17:17:11.42549+00
0e6d582c-86f8-4364-87e2-a4de0f1e2840	Abisko	Porten till fjällen.	Abisko	68.357	18.783	natur	250	150	40	episk	t	t	2026-10-06 17:17:11.42549+00
e481057b-2225-4e40-8d13-35c071e5a0cd	Visby ringmur	Medeltida ringmur på Gotland.	Visby	57.639	18.292	historisk	200	100	30	sällsynt	t	t	2026-10-06 17:17:11.42549+00
f7486312-5162-4c15-9804-2cd7b06c356a	Borgholms slottsruin	Ruin på Öland.	Borgholm	56.864	16.642	historisk	150	90	25	sällsynt	t	t	2026-10-06 17:17:11.42549+00
08b32e78-abb8-44f6-8879-039925f86b50	Kalmar slott	Renässansslott vid havet.	Kalmar	56.659	16.356	historisk	120	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
1b9276b0-5cfa-40d4-ba2d-da56a2f33ade	Ales stenar	Skeppssättning ovanför Kåseberga.	Kåseberga	55.383	14.055	historisk	120	120	35	episk	t	t	2026-10-06 17:17:11.42549+00
a2b57d78-8913-46dc-8867-a294b8980106	Kullabergs fyr	Fyr längst ut på Kullaberg.	Mölle	56.304	12.453	utsikt	150	100	30	sällsynt	t	t	2026-10-06 17:17:11.42549+00
212a8505-fe90-45c1-a5b5-d7825e81d240	Höga kusten-bron	Hängbro över Ångermanälven.	Kramfors	62.798	17.937	landmärke	200	90	25	sällsynt	t	t	2026-10-06 17:17:11.42549+00
df16ec63-becb-436b-ad59-7978fb35747b	Skuleberget	Berg vid Höga kusten.	Kramfors	63.105	18.38	natur	200	120	35	episk	t	t	2026-10-06 17:17:11.42549+00
dadcb819-415d-40cc-8261-cc7075ab19a9	Falu gruva	Världsarv och koppargruva.	Falun	60.6	15.611	historisk	150	90	25	sällsynt	t	t	2026-10-06 17:17:11.42549+00
32fc8dd5-c651-4a15-9480-f98098e7e4aa	Siljan Tällberg	Utsikt över Siljan.	Tällberg	60.824	14.997	utsikt	150	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
c8c34593-f33b-4f5c-9b85-1c19462fdaea	Åre torg	Fjällby i Jämtland.	Åre	63.399	13.081	stad	150	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
2e0d420c-370e-4ca8-ad75-bd1189a227d9	Marstrands fästning	Carlstens fästning.	Marstrand	57.887	11.583	historisk	150	90	25	sällsynt	t	t	2026-10-06 17:17:11.42549+00
e99426ad-0a36-4f0a-bd09-5cf3353ec284	Smögenbryggan	Färgglad brygga på västkusten.	Smögen	58.358	11.222	landmärke	150	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
0503ff26-f7c5-450a-9b95-0c752dd2bd8b	Inovia Data	Butik i Sunne	Sunne	59.834093	13.148206	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1b0b332-f35d-45d4-9200-cffe5903b2a4	Vadstena slott	Vasaslott vid Vättern.	Vadstena	58.448	14.888	historisk	120	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
3064480a-baab-4b61-84c3-bdb6f5069e38	Ystads torg	Medeltida torg i Ystad.	Ystad	55.429	13.82	stad	100	50	12	vanlig	t	t	2026-10-06 17:17:11.42549+00
3e636937-3c3c-46b2-950a-43702d0f9556	Haparanda gränsen	Gränsstaden mot Finland.	Haparanda	65.835	24.137	stad	150	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
c5c2c4a7-a309-4966-a326-d3bae9e4c870	Göta kanal Berg	Slussarna i Berg.	Linköping	58.487	15.529	landmärke	150	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
02426428-e12f-4e92-95f3-fc6c8ba217e0	Mariefreds Gripsholm	Slott vid Mälaren.	Mariefred	59.256	17.219	historisk	120	80	20	ovanlig	t	t	2026-10-06 17:17:11.42549+00
6b034fea-b56b-4a34-aa70-a56639804531	Sigtuna Stora gatan	Sveriges äldsta gata.	Sigtuna	59.617	17.723	historisk	120	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
7ec59bf0-eb24-4cc5-8873-59c8cbc921d8	Dalarö	Skärgårdsidyll.	Dalarö	59.133	18.405	natur	150	70	18	ovanlig	t	t	2026-10-06 17:17:11.42549+00
fba78f5c-e3d6-4035-840e-139d0f83aca8	Lunds domkyrka	Romansk domkyrka.	Lund	55.704	13.194	historisk	90	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
ea1a5caa-ed26-4ec4-8ca2-75beb6bc8a74	Helsingborg Kärnan	Medeltida kastaltorn.	Helsingborg	56.047	12.695	historisk	90	60	15	vanlig	t	t	2026-10-06 17:17:11.42549+00
76abc1fb-e1f1-449e-a51a-aeba02cc4f89	Lilla Karlsö utsikt	Fågelö utanför Gotland, sett från stranden.	Klintehamn	57.31	18.17	natur	250	120	35	episk	t	t	2026-10-06 17:17:11.42549+00
d8dc0261-c5db-46ba-918d-5c08d66780a0	Tanka	Butik i Sunne	Sunne	59.838102	13.12858	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d516e5d-0795-44fd-ab85-ca2d1e5127e0	Selma SPA	Sevärdhet i Sunne	Sunne	59.828162	13.12886	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
066f5fd6-c120-4b44-97bf-340d7eded374	Sunne polisstation	Offentlig plats i Sunne	Sunne	59.83722	13.141764	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c47547e8-692d-47c3-ab5d-498fa696215b	Fire department	Offentlig plats i Sunne	Sunne	59.838425	13.135443	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
97c414d5-0a79-43ed-8cda-b8a3280edd21	Sunne Gästhamn	Sport & fritid i Sunne	Sunne	59.838633	13.146171	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f8804be-ff4f-447d-96f7-12c338cda23d	Coop Sunne	Butik i Sunne	Sunne	59.838639	13.143077	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
776d4fb8-e16d-4253-acc3-d795fa8b2291	Bibliotek Sunne	Offentlig plats i Sunne	Sunne	59.83728	13.14381	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a52a17d9-5a66-4355-a128-9ffe809aab76	Magasinet MyWay	Butik i Sunne	Sunne	59.837869	13.141415	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9407e42b-4923-40d8-a403-bdfab35a86c9	ICA-BBB	Butik i Sunne	Sunne	59.837743	13.14509	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4030d4f-cde9-48a7-a81b-64eabc755e32	Sibylla	Café/restaurang i Sunne	Sunne	59.83791	13.143672	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
54752683-061a-41fd-8b7d-078ed19ae0a9	Ferlöfs Bok & Pappershandel	Butik i Sunne	Sunne	59.837636	13.144782	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
704e4660-5b08-45b9-990b-f808a7d2da22	Apoteket	Offentlig plats i Sunne	Sunne	59.836543	13.144276	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0c19a1f-234a-412e-a07f-06bf58ff937f	Systembolaget	Butik i Sunne	Sunne	59.836664	13.145043	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f80d6fc7-7fb0-47e3-8a52-36d791dcc9ef	Living Interiör	Butik i Sunne	Sunne	59.837415	13.142822	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a74f0b09-1619-438a-ac06-971983119cd5	Sunne-Bazaren	Butik i Sunne	Sunne	59.836462	13.143534	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
98f9fbf2-2ae2-4495-a03a-cd1b2822c123	Saffran & vitlök	Café/restaurang i Sunne	Sunne	59.837233	13.143724	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c44dbd4d-6375-4769-8e8f-8b5f25938868	Kvarngatans pizzeria	Café/restaurang i Sunne	Sunne	59.836439	13.146644	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d8cf60d4-f460-4286-9144-9ac9f9377c12	Eurasia	Café/restaurang i Sunne	Sunne	59.838712	13.144301	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3c82e55-04ab-4cd4-9779-fc575dacc0b1	Ahn Thaifood	Café/restaurang i Sunne	Sunne	59.836818	13.143693	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a37311a-9892-468b-a13e-d07d7951b41f	Restaurang Tigris	Café/restaurang i Sunne	Sunne	59.835424	13.148657	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7bdf488d-9182-4a04-8f2f-867c861c11f2	Pizzeria Sunne	Café/restaurang i Sunne	Sunne	59.836449	13.141469	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5384f60a-2818-42a2-8e1f-1fe18aa57627	Pizzeria city	Café/restaurang i Sunne	Sunne	59.837729	13.14476	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f12d5cc0-4ca5-493b-8cac-fcfea30e3256	Pekås	Butik i Sunne	Sunne	59.843618	13.126658	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
70c695aa-0127-4751-b85c-c89d98e8c946	Sunne	Offentlig plats i Sunne	Sunne	59.835643	13.148679	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d01ae6ab-708a-4f29-ad49-3b88f5247953	Skatberget	Natur/park i Sunne	Sunne	59.820036	13.116126	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9d046ba-df19-4c91-af69-38f7cf8955c4	Koberget	Natur/park i Sunne	Sunne	59.824523	13.121919	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
10123c6b-ab43-42f8-ab2f-d9e7fc8c3f93	Klövberget	Utsiktsplats i Sunne	Sunne	59.817991	13.109641	utsikt	20	80	80	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee11cab8-3095-4a3f-9280-6f6b122314f9	appelquist	Sevärdhet i Sunne	Sunne	59.835318	13.141629	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
edeaaf63-e4ae-4808-b51b-c0348092a8b0	sunne commune	Offentlig plats i Sunne	Sunne	59.836953	13.146974	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
482e08e5-d025-4c32-83a7-d107ee607326	JYSK	Butik i Sunne	Sunne	59.836496	13.12858	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c187b0de-afd6-441c-aeb9-a258b9f8d841	Helmia Bil AB	Butik i Sunne	Sunne	59.838155	13.127206	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b076b138-bce0-41e3-befb-8f14b861f204	Löven Restaurang och Café	Café/restaurang i Sunne	Sunne	59.84109	13.125377	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b393b836-728b-4662-9222-2c203310819a	Broby Gästgivaregård	Sevärdhet i Sunne	Sunne	59.839566	13.142142	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
26216ee4-a0d1-478d-bf7c-cfe2505a8e52	Kolsnäsrestaurangen	Café/restaurang i Sunne	Sunne	59.823962	13.143153	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a06d980f-e046-40f3-ad6d-97c43bf9a53b	Teaterbiografen	Sevärdhet i Sunne	Sunne	59.836937	13.143479	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
0be11d1a-e8f5-41fb-b1bd-1a4ddef55625	Sunne kommunhus	Offentlig plats i Sunne	Sunne	59.837266	13.147755	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f87dbb06-7e2f-479c-ab01-04dc50a87d23	Pizzeria Fryken	Café/restaurang i Sunne	Sunne	59.838291	13.14166	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b19cc416-031d-4e71-8d4a-eb04bad3075b	Sunne Järnhandel	Butik i Sunne	Sunne	59.838102	13.139537	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
af8566a8-a7fa-4267-ba19-af0d9818e36a	Sommarhemmet Sundsberget	Café/restaurang i Sunne	Sunne	59.830343	13.130035	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
146e2466-d3dd-495f-8a32-f5af31d88358	Gyllebys hotel - restaurang	Café/restaurang i Sunne	Sunne	59.826903	13.167144	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
37e0896d-8b11-4050-b7a1-5fb089726934	Sunne hembydgsgård B&B	Sevärdhet i Sunne	Sunne	59.846545	13.136275	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b9071a3-7407-473c-ac34-ce9d1a1f1992	OKQ8 Sörgårdsgatan	Butik i Sunne	Sunne	59.837226	13.128265	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf58e02d-0693-4f12-861d-98aebb256aeb	entré	Butik i Sunne	Sunne	59.837221	13.143253	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1923606f-e03c-4d83-8bf0-acd6449c6e71	Garderob i Sunne AB	Butik i Sunne	Sunne	59.836672	13.143418	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
62d8d22c-d4ed-4b86-8564-5812b8d4898d	Blombutiken	Butik i Sunne	Sunne	59.836676	13.145234	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba064000-e948-47fb-9975-57cadb2fdca4	No design	Butik i Sunne	Sunne	59.836801	13.144628	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8c077a8-59fc-46a4-9e1e-e6f07f28da76	Lilla Garnverkstan	Butik i Sunne	Sunne	59.836858	13.145575	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
27dca1c9-3704-49be-b593-e1824be050a0	Intersport	Butik i Sunne	Sunne	59.836989	13.146517	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
313028bf-c9cc-4225-8d1e-9f6d957efe9f	Lindex	Butik i Sunne	Sunne	59.837458	13.143301	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6a68576-0cbb-42ea-a38c-4e52c772c550	Elon	Butik i Sunne	Sunne	59.837289	13.146082	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d11ca4e-41bd-4c1c-ba56-6484ee86c2ff	Wafab Bil	Butik i Sunne	Sunne	59.837488	13.129845	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
14ef6d97-2a62-4c7b-97a9-2dded820586a	Gröna Lena	Sevärdhet i Sunne	Sunne	59.836452	13.138339	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
467c227d-da94-4cdf-866a-1507d727c039	Skäggebergsskolan	Skola i Sunne	Sunne	59.837609	13.134995	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
632b6c28-4548-4e57-9a2e-7f9a0f246f45	Sushi Poké	Café/restaurang i Sunne	Sunne	59.837544	13.142525	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5aedae27-88fa-4017-a766-c73741a1b32c	Carinas Klo & Klös AB	Butik i Sunne	Sunne	59.837217	13.142718	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7efc961d-e32b-416c-86dc-2f6fc1df2655	AB Sunne Färghall	Butik i Sunne	Sunne	59.837059	13.142699	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a3966e3-5bec-4230-a547-5635215c3e9f	Café Villa Helios	Café/restaurang i Sunne	Sunne	59.836323	13.140869	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b4e0d57-db29-4120-a9e7-316f5293d589	Shangri La	Butik i Sunne	Sunne	59.836503	13.142442	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
df83ae9a-eb78-4149-a6e6-013678f1ce02	Inka Musik	Butik i Sunne	Sunne	59.836335	13.142414	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3352157-4613-485c-adf2-41947eb9574d	Sallakliniken AB	Offentlig plats i Sunne	Sunne	59.836617	13.144821	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8cc099d-910b-4fe7-b5e4-bc653ce713fe	Herbertsson Florist & Blommor AB	Butik i Sunne	Sunne	59.836966	13.144071	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a57c54f5-0ffa-447d-a7c2-425be298b358	Nya Skoshoppen	Butik i Sunne	Sunne	59.836989	13.144632	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
422f1ef5-d816-44b5-86d4-7fc67e22e50c	Klippnytt	Butik i Sunne	Sunne	59.836863	13.14585	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
12da8199-a384-408e-a4f1-2fa4b975e555	Direkten Sunne	Butik i Sunne	Sunne	59.836762	13.147814	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3930f210-8637-4c4b-b700-defebcc007b1	Restaurang Slottet	Café/restaurang i Sunne	Sunne	59.837322	13.147022	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
04ec6a1e-f701-45b5-9255-0aff5dfdccdd	Nya Hembageriet	Butik i Sunne	Sunne	59.837312	13.146456	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
14de85cd-a60f-4bfe-a697-394d3cb84a5a	Nya Sunnegrillen	Café/restaurang i Sunne	Sunne	59.83769	13.14896	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
85a39e51-ccb1-4540-a171-f7347552e047	Hår & Kroppsverkstan i Sunne AB	Butik i Sunne	Sunne	59.835077	13.151307	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
99d736d1-6db9-49d9-8de2-f04175c3a952	Tentipi AB	Butik i Sunne	Sunne	59.834522	13.149964	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc47fe5a-a748-48ec-80f6-802b5aef0569	Sun Screen AB	Butik i Sunne	Sunne	59.833668	13.15002	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6247a8c4-973c-4eb2-aa67-90483136cd51	Renta Sunne	Butik i Sunne	Sunne	59.83349	13.14962	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a80060d-1cc9-476f-844c-d31eff116bc1	Bergqvist Gummiverkstad AB	Butik i Sunne	Sunne	59.833237	13.149816	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f84f851e-fb91-4fdf-aabe-2291857eaf49	I Skincare	Butik i Sunne	Sunne	59.833415	13.148131	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6da8a25d-7057-4fd5-bc6c-f17d596690d7	Elon Åkes El & VVS	Butik i Sunne	Sunne	59.835487	13.14626	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5891839f-f386-4d2d-9186-51a891c8ef6e	Selma Lagerlöf staty	Sevärdhet i Sunne	Sunne	59.837724	13.143916	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
724d4856-e133-4412-934b-1c12b1ea4d4d	Böjda Spön AB	Butik i Sunne	Sunne	59.837811	13.141918	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f308ccd3-0f30-4e4b-8136-0d44d44f8056	Sunne Missionsförsamling	Kyrka i Sunne	Sunne	59.841512	13.142881	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
b43b067b-0aa3-456f-a013-76bae39069a6	Sunne Vårdcentral	Offentlig plats i Sunne	Sunne	59.843723	13.140763	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f99a0af-e897-4713-9e36-86d12efc54a8	Stop & shop	Butik i Sunne	Sunne	59.836689	13.146218	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6175e05d-e213-4070-9630-193489f2be4a	Juvelen	Butik i Sunne	Sunne	59.838266	13.140912	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee7fa648-6049-40fd-93d0-2cb255fb243f	Yankee wings	Offentlig plats i Sunne	Sunne	59.835574	13.144486	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
16660821-8905-4489-bd70-2b1198c9ea78	Ungdomscafé	Offentlig plats i Sunne	Sunne	59.836475	13.144214	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6ce6ccf-fefa-4c9b-86cf-045aeb32d88a	Ellas cafe	Café/restaurang i Sunne	Sunne	59.835582	13.148623	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a30c74ad-8f4e-40a7-b237-7ad37d623c33	Ur & Gold	Butik i Sunne	Sunne	59.836676	13.145901	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad9c6aa7-9a9f-490f-a4fd-37b5483d17e7	Anderson's frisör	Butik i Sunne	Sunne	59.836642	13.143337	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
346250b9-7cae-47a8-a599-1e4bec93e0eb	Härstudion	Butik i Sunne	Sunne	59.836741	13.143548	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7b472af-7b6c-4e17-960f-93a5b461eb08	FryksDalsDesign	Butik i Sunne	Sunne	59.836902	13.143944	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a1e12deb-44af-4df7-b6a7-85350e85874b	UMA	Butik i Sunne	Sunne	59.837002	13.146196	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
14a3d9c9-c55f-4b31-8968-3e3c3514e0fd	Sunne salong	Butik i Sunne	Sunne	59.836878	13.146196	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3565da5-9232-414d-8035-f9450e4d74b1	Zolboo's Sushi & Poké Bowl	Café/restaurang i Sunne	Sunne	59.836664	13.145606	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ecb35503-45f0-4d94-bf93-7f9546db58a0	Klippar'n	Butik i Sunne	Sunne	59.837879	13.141107	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
274c2984-941a-4dd7-b12f-fe9f6ed5dfaf	Meca Sunne	Butik i Sunne	Sunne	59.837521	13.140934	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bebd1a12-b6bd-44c0-ba84-e2a440c2f517	AlphaOmega	Butik i Sunne	Sunne	59.839058	13.139532	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f65db04f-7b45-4a80-be0e-dac1aef841b4	Tandhälsen Sunne	Offentlig plats i Sunne	Sunne	59.836498	13.143871	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7056be39-27f9-4a6d-a628-982131da0f7a	Nybo Kök	Café/restaurang i Sunne	Sunne	59.846277	13.135673	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bac99827-4a2e-45d0-bee4-6f3bea640fbe	Ekeby skola	Skola i Sunne	Sunne	59.833629	13.138511	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6050c1b3-1d4b-457b-bbf5-644474ad0243	Bengster förskola	Skola i Sunne	Sunne	59.841093	13.142711	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
21a585e5-d318-4846-964d-3a4622e9ac29	Akka stadion	Sport & fritid i Sunne	Sunne	59.826097	13.131174	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
73f12b8d-a581-4a10-9cdd-890518a03867	Sparbankshallen	Sport & fritid i Sunne	Sunne	59.84198	13.163695	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7528071-9c09-4f6f-997d-1564c45f29b7	Helmia arena, ishall	Sport & fritid i Sunne	Sunne	59.842228	13.162063	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
be203821-224d-4c65-9646-2a5205ad04e5	Missionshus	Kyrka i Sunne	Sunne	59.83913	13.139549	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d52de37-6d95-4749-940b-1df479faa9a6	Sunne kyrka	Kyrka i Sunne	Sunne	59.837685	13.154486	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
521bc6ff-c156-406d-b94e-8047572a6746	Fryxellska skolan	Skola i Sunne	Sunne	59.841147	13.159051	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f87a417-e1e7-4f0b-8c9b-72292e76bd16	Sundsbergs Gård	Sevärdhet i Sunne	Sunne	59.828623	13.136002	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ad2603d-3e51-46c6-a628-4b4709018ca2	Betelparken	Natur/park i Sunne	Sunne	59.835435	13.143029	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3cefc5c-7201-4d23-bac1-e99a4d223960	Sunne GK	Sport & fritid i Sunne	Sunne	59.80975	13.127706	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
1caa853e-06f6-4058-b16e-bf179943dfd9	Bryggargatan	Gata i Sunne	Sunne	59.838341	13.143349	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e37d00f6-b275-459e-8e74-0868028dba73	Kvarngatan	Gata i Sunne	Sunne	59.836762	13.146275	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca235812-c960-4a56-a137-fdfc02fa8bc0	Parkgatan	Gata i Sunne	Sunne	59.835844	13.146472	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82eab126-8f80-4f86-9a88-733f5e583814	Ekebyvägen	Gata i Sunne	Sunne	59.835166	13.141114	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
763b4714-f471-420a-bb70-21708c2a0028	Sörgårdsgatan	Gata i Sunne	Sunne	59.837064	13.128742	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
be2f6987-01e4-4e51-8945-e43a5d1285fc	Långgatan	Gata i Sunne	Sunne	59.840255	13.143001	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c059bad-176a-4f5b-aecd-c21b75e89d78	Järnvägsgatan	Gata i Sunne	Sunne	59.83597	13.148089	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0add3fd-13a4-45d8-aa41-4c4c9ecac69e	Strandvägen	Gata i Sunne	Sunne	59.837127	13.150006	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4414e45-7c64-4042-a7ca-05639e63b075	Brårudsvägen	Gata i Sunne	Sunne	59.845114	13.160948	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9044d5f-6051-4a92-90e6-168058041de7	Lodjursvägen	Gata i Sunne	Sunne	59.845308	13.154534	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a26cc2f-445c-49a3-ab4c-ad5448d4999f	Älgvägen	Gata i Sunne	Sunne	59.847465	13.153538	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e53fa5a1-7ced-4b08-9caa-b8cff7083eaf	Fabriksgatan	Gata i Sunne	Sunne	59.840201	13.152458	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7df16f3-199a-40ef-b99d-0e811cd4faff	Mejerigatan	Gata i Sunne	Sunne	59.838338	13.146341	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
033aa0ff-8217-44a3-99d0-daf92f558a27	Fiskartorpsvägen	Gata i Sunne	Sunne	59.847477	13.157597	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b8cbe59-1657-48db-8ff2-dd49ca5f097a	Storgatan	Gata i Sunne	Sunne	59.837871	13.135742	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af68e46d-3d9e-4bdb-8ee2-1f12c20e0900	Skäggebergsvägen	Gata i Sunne	Sunne	59.837817	13.136246	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
926b4b46-bffd-4a7a-a22c-d801c4856575	Sandgatan	Gata i Sunne	Sunne	59.843397	13.135514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
228578b1-5f66-4207-87dd-60caacc557cc	Allégatan	Gata i Sunne	Sunne	59.83833	13.139621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a00478a9-98fc-406b-9ae3-1636a704fe91	Rådjursvägen	Gata i Sunne	Sunne	59.844313	13.15407	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f8a44e01-b8d7-41ea-9ef4-235db5787325	Badhusgatan	Gata i Sunne	Sunne	59.83631	13.146404	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8940f08f-41ea-4234-b771-5fb0547c3c8d	Svetsarvägen	Gata i Sunne	Sunne	59.848726	13.150965	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7aeb2e9a-b64e-4b20-acf5-0ed6310d4739	Ringvägen	Gata i Sunne	Sunne	59.845791	13.159704	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0970297a-4ad7-469e-9f3d-e0c2f89a19db	Norénsvägen	Gata i Sunne	Sunne	59.833876	13.141595	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9cbc5f9-7178-4aa7-b58b-f83b9fdaf92f	Höglundagatan	Gata i Sunne	Sunne	59.843382	13.129183	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
98c6bd0c-7a0c-4768-8004-b9375eebedd7	Villagatan	Gata i Sunne	Sunne	59.838659	13.136373	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
90089853-d234-44b0-ae1e-5d45f43f3f0d	Skolgatan	Gata i Sunne	Sunne	59.841184	13.155627	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e919aacb-7f8a-463f-9194-7c38ec3166e6	Bengstergatan	Gata i Sunne	Sunne	59.840319	13.14148	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
10176db3-b854-40a4-be81-e35ab259ed97	Hasselbolsvägen	Gata i Sunne	Sunne	59.842256	13.154598	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc346b2f-62ce-46d5-850f-7925f10c455f	Hjortvägen	Gata i Sunne	Sunne	59.8423	13.155045	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
62e44240-5220-4ad7-9fca-e470cde87cac	Mårdvägen	Gata i Sunne	Sunne	59.843017	13.155902	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a977eaa6-eb98-4c55-82b8-035938b16302	Renvägen	Gata i Sunne	Sunne	59.842642	13.154062	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
895511ab-9729-45ae-b1f6-bc5d5fec62ca	Smedjegatan	Gata i Sunne	Sunne	59.832808	13.141358	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf9dcd59-05fc-4ccb-bd62-5f8480d37bbf	Brobygatan	Gata i Sunne	Sunne	59.839307	13.138186	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a33088c1-5f88-4315-a63d-3f2e653136b4	Klövervägen	Gata i Sunne	Sunne	59.843607	13.128944	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5538989-7f56-4862-a760-dc489a40779a	Älvkullsgatan	Gata i Sunne	Sunne	59.836903	13.135183	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d78cf76c-0f22-435e-bdbe-779966bc3b4d	Cederbergsgatan	Gata i Sunne	Sunne	59.837322	13.138753	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ee5961a-2dfc-4bee-95b6-ff5f98e30264	Älvgatan	Gata i Sunne	Sunne	59.835594	13.144831	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74b9180f-3528-4275-aea1-e626073768fe	Granvägen	Gata i Sunne	Sunne	59.832168	13.139907	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f8b69e2-9459-4977-bba8-2a4b34c9a49e	Kapellvägen	Gata i Sunne	Sunne	59.831601	13.139768	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aef974ce-782c-4059-a123-76e9bd5f7744	Lövnäsvägen	Gata i Sunne	Sunne	59.83137	13.145899	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b6d38ca-e619-4467-8aca-1349da57cbb5	Björnevägen	Gata i Sunne	Sunne	59.827305	13.139459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f90e19ac-a8ec-491d-bfda-d040d1e8dfdb	Rottnavägen	Gata i Sunne	Sunne	59.828018	13.140596	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ccde0ac-b4ee-462e-9ecf-c9902807587c	Idrottsvägen	Gata i Sunne	Sunne	59.82889	13.140668	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b01970e4-f90b-4ff2-98ef-a1448fd81752	Lindvägen	Gata i Sunne	Sunne	59.831028	13.139693	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ab6cafe-8ad2-4494-8ed1-a9c383fe1b38	Ljungvägen	Gata i Sunne	Sunne	59.829365	13.141943	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
29829c3f-5e1e-47d1-b55c-88457586eb9b	Sundbyvägen	Gata i Sunne	Sunne	59.827786	13.140675	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c4785e9-ec15-4c44-a780-3b8239c3c6fa	Solviksvägen	Gata i Sunne	Sunne	59.828432	13.138635	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
07190c66-5253-4d99-8c5a-88c520431095	Mellanvägen	Gata i Sunne	Sunne	59.82744	13.141119	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b4c007c-6c0b-441c-a88c-56d37494acd8	Frykenvägen	Gata i Sunne	Sunne	59.846268	13.146514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1cc6ad91-1d95-48ec-ae4d-d1845df6cfea	Strandbrinken	Gata i Sunne	Sunne	59.842777	13.144665	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eaf2247b-f998-46c5-b81a-2a39f6aab982	Vårvägen	Gata i Sunne	Sunne	59.831228	13.134285	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb454758-7894-4a7c-8100-21a7ffa2ba02	Bäckgatan	Gata i Sunne	Sunne	59.842092	13.141522	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b6fdae4-1d50-4d4f-ad13-69526b655ce7	Åmbergsvägen	Gata i Sunne	Sunne	59.844563	13.135861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee49ac02-61dd-453d-89c9-5a7daf7e441e	Gärdesvägen	Gata i Sunne	Sunne	59.830955	13.135444	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2e44ffd-c1fa-4dc7-b10a-01b3f2e3a830	Åkarevägen	Gata i Sunne	Sunne	59.829845	13.135785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c50b27d-be18-48a1-bd53-7dd3b9bcb871	Åsvägen	Gata i Sunne	Sunne	59.832109	13.135131	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca81b743-8c98-4e2c-a5ef-4a5f60b3a693	Floragatan	Gata i Sunne	Sunne	59.836101	13.135229	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f5abc5f-bc6d-487e-afe6-579031f979a2	Dalgången	Gata i Sunne	Sunne	59.835737	13.137592	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
769081f9-87c6-4f6e-aab6-3d8845624593	Gersbyvägen	Gata i Sunne	Sunne	59.829122	13.137785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c978720-8453-4f42-aab8-18262c0b3f74	Hembygdsvägen	Gata i Sunne	Sunne	59.845316	13.135773	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9904920-07a6-4935-a465-ef8ba663062a	Brogårdsgatan	Gata i Sunne	Sunne	59.841549	13.131101	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b3e5fd7-8144-4fc6-9381-66fc2fa7ad59	Rudebäcksgatan	Gata i Sunne	Sunne	59.835856	13.134966	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
629ef08e-3e30-430e-be7a-e9713e4ad3ef	Målaregatan	Gata i Sunne	Sunne	59.842788	13.136231	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d62c1c8-d125-4361-a9a1-a1bda36c0db4	Björkhagsvägen	Gata i Sunne	Sunne	59.831136	13.145898	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7501500-50e1-44b2-b351-a818c9323a56	Källgatan	Gata i Sunne	Sunne	59.842238	13.135637	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd3c2df9-c239-45e0-8aa3-692e7d459017	Trädgårdsgatan	Gata i Sunne	Sunne	59.840779	13.136487	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
81e67c0b-0fb7-4c3f-811e-7859a7c72993	Bergavägen	Gata i Sunne	Sunne	59.843934	13.126061	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74cd7f20-afaf-426b-a07f-9c426ce4c2d6	Knektvägen	Gata i Sunne	Sunne	59.848595	13.131729	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cfd19144-fa31-4681-8bc2-617c5ea17761	Norrgårdsgatan	Gata i Sunne	Sunne	59.840812	13.126649	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
217d3fce-c793-4fc6-8cf6-2f37d6e3801c	Rågvägen	Gata i Sunne	Sunne	59.846855	13.126399	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9ec7750-3987-4f8d-80b0-75a8aedb4bab	Kornvägen	Gata i Sunne	Sunne	59.846612	13.128781	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
007b0272-1383-457c-bf77-df6a0bf71d30	Bondevägen	Gata i Sunne	Sunne	59.845519	13.13255	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b3653a4-ee07-411b-b6fd-06822c8456f9	Boställsvägen	Gata i Sunne	Sunne	59.840767	13.127784	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
db54afd7-a478-4bf0-b893-6b6ee5b60a7b	Zandergatan	Gata i Sunne	Sunne	59.844414	13.142541	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
226262fc-7e75-490b-bb44-5dca8b294a6a	Hagvägen	Gata i Sunne	Sunne	59.845742	13.142617	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2991649c-21bb-4eca-bd06-f81445de0cc6	Löjtnantsvägen	Gata i Sunne	Sunne	59.850469	13.130977	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ad3d781-ceac-4dbc-aeaa-5e34cb1b3371	Furugatan	Gata i Sunne	Sunne	59.845091	13.142521	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7a5ebd7d-5ffe-4f44-bdeb-ee6db0be0bde	Videvägen	Gata i Sunne	Sunne	59.846596	13.143774	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6466356e-5fd2-4e19-b77b-4951db17799b	Heavägen	Gata i Sunne	Sunne	59.850548	13.128787	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
66d0e23e-4538-428d-bf7a-891e8e554fa7	Fänriksvägen	Gata i Sunne	Sunne	59.850917	13.131005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7ebe84fb-f463-44fc-afbd-45ae28edde5a	Korpralsvägen	Gata i Sunne	Sunne	59.850192	13.12707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48ada23a-244a-4274-93bd-12d7d22c3c05	Brobyplan	Gata i Sunne	Sunne	59.844547	13.147017	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb95d999-ab3e-495b-88d0-e43a89415ea2	Sundgatan	Gata i Sunne	Sunne	59.848845	13.153388	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
28e58fb3-aeb4-449d-b2ea-5cbfd6c34851	Liljanstrand	Gata i Sunne	Sunne	59.841012	13.14928	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3b55aa0-c4b5-4b9e-ba3e-5f7180eceac3	Kyrkogatan	Gata i Sunne	Sunne	59.83876	13.153726	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da1a7acb-964a-4d33-8081-50e940a7b39d	Fryksellsvägen	Gata i Sunne	Sunne	59.837958	13.152835	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e9bd60e-8bff-4fc3-a917-b4eeffcf69bd	Torvnäsvägen	Gata i Sunne	Sunne	59.834297	13.155412	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5d87457-13e7-4527-ad93-9866162ea3df	Tunströms väg	Gata i Sunne	Sunne	59.837036	13.157542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
77775b35-87f7-4220-9bdb-f35c5e85f4e9	Peter Wermes väg	Gata i Sunne	Sunne	59.833931	13.154678	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
771965eb-771c-4aff-a72f-31ecbd5914a4	Klockareallén	Gata i Sunne	Sunne	59.839401	13.1527	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42a4d5c2-0995-482b-aeb6-92b9e88ee039	Linneavägen	Gata i Sunne	Sunne	59.829996	13.136967	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e24a827d-03e1-4684-a17d-a43d2a0d7a41	Alvägen	Gata i Sunne	Sunne	59.841048	13.138418	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4d951b2-52de-4096-ac67-76e92487d05b	Sommarvägen	Gata i Sunne	Sunne	59.830305	13.135447	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11800364-9fdd-4b8a-bdd9-11bc781ceca3	Domarevägen	Gata i Sunne	Sunne	59.832785	13.138205	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e92a604f-9b07-478b-ae77-c9e98cd2c008	Mossvägen	Gata i Sunne	Sunne	59.844215	13.169378	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
14b696ab-4e09-414c-a6e5-e0cdc27ebd03	Ulfsbyvägen	Gata i Sunne	Sunne	59.85622	13.129487	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
60ed581e-2bbf-4cb2-a4bf-ce025e987fd7	Mellkvistvägen	Gata i Sunne	Sunne	59.831668	13.141087	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
939213c2-5a1d-4b54-af5f-3b2d4dba296e	Illervägen	Gata i Sunne	Sunne	59.84664	13.155188	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42588da4-dc69-4b4e-8c9b-aceb2e7f5966	Bävervägen	Gata i Sunne	Sunne	59.84598	13.154861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
85e97446-6c7b-49a9-a00d-4dc506751f1b	Arenavägen	Gata i Sunne	Sunne	59.843451	13.162529	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f33cd46-d644-45e5-9e84-7f8c0e20f403	Ida Pripps gränd	Gata i Sunne	Sunne	59.832054	13.155458	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b5711b2-7928-47c5-a46d-09986c5d8a12	Nordenssonvägen	Gata i Sunne	Sunne	59.832157	13.154644	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a82c2d8-452b-42d1-9c0c-f3129c9f05ca	Svarvarevägen	Gata i Sunne	Sunne	59.852262	13.159176	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c313a80c-a797-49b8-bebb-e20bd47620f6	Smidesvägen	Gata i Sunne	Sunne	59.854699	13.162486	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f667b22-6bbc-4dfd-a2e2-976a50ac54b6	Fryksdalsvägen	Gata i Sunne	Sunne	59.833522	13.143208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
80929558-abfc-49c4-9506-28f617ed4f4d	Magasinsgatan	Gata i Sunne	Sunne	59.834579	13.142886	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f70d015-ce66-4f47-9a5a-10260bda4962	Bergvägen	Gata i Sunne	Sunne	59.8452	13.139518	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd8db46c-3871-416b-8236-50c95bcd641d	Enevägen	Gata i Sunne	Sunne	59.846582	13.142736	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5c9ecfd-a79c-4d83-a3c6-70641d4f63ff	Ängsgatan	Gata i Sunne	Sunne	59.845264	13.147003	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
07935f35-020e-4ba8-bcba-354fb13304f2	Herrestavägen	Gata i Sunne	Sunne	59.843913	13.144732	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ce67ce5-a871-40d0-922a-7b69e06a9f54	Verkstadsgatan	Gata i Sunne	Sunne	59.833702	13.150463	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
18b9ca86-e006-44b0-997c-e6559dcb87ff	Repslagaregatan	Gata i Sunne	Sunne	59.8448	13.134982	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
965fed74-ccb1-4902-974f-7dace3199142	Åmbergs prästgård	Gata i Sunne	Sunne	59.848077	13.127477	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5a1a0881-6514-4992-94f3-5000384ceed5	Timotejvägen	Gata i Sunne	Sunne	59.844966	13.125398	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82ce7743-86ed-4108-8338-2e966f9fa0cc	Furirvägen	Gata i Sunne	Sunne	59.851106	13.127381	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d07789d-90fc-4b53-8a90-70303df15a13	Kaptensvägen	Gata i Sunne	Sunne	59.850006	13.130967	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6eeedb0a-49aa-40d8-a678-98ba0e7b17a2	Uttervägen	Gata i Sunne	Sunne	59.84692	13.157684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bddfc8b1-acde-4f1d-864b-047757a88f4e	Brädgårdsgatan	Gata i Sunne	Sunne	59.840622	13.151059	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e87f932c-e232-4fd6-825a-e4de81387dbf	Brårudsallén	Gata i Sunne	Sunne	59.851137	13.157257	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e25cf5ce-403b-4a23-adcd-98f7098902cf	Isbjörnsvägen	Gata i Sunne	Sunne	59.842655	13.159985	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
67ac12d8-91ed-4134-ba94-c7f7ed5d3433	Sjögatan	Gata i Sunne	Sunne	59.830867	13.148754	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a74b305-f04b-4214-b1b9-82a0a319166a	Minkvägen	Gata i Sunne	Sunne	59.847766	13.157089	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
152417f9-eef1-40bf-9000-72f4c995c498	Lundvägen	Gata i Sunne	Sunne	59.847017	13.158261	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6bd00d06-d927-4333-8be9-2cc3c8821780	Vännomvägen	Gata i Sunne	Sunne	59.846886	13.161305	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b2a8aa1-2901-490d-b349-2680937bc355	Västergatan	Gata i Sunne	Sunne	59.836376	13.133271	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
999e5de5-3d8e-49ac-aa82-a10039694272	Timmervägen	Gata i Sunne	Sunne	59.830031	13.145842	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6ff3dfe-8165-4824-8a45-91fa6c930c72	Rådalsvägen	Gata i Sunne	Sunne	59.852357	13.150791	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3908be71-e1dc-47e5-bf0b-b540a0f81847	Solbacken	Gata i Sunne	Sunne	59.829001	13.158234	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0397a3b7-2eef-495a-9ac9-556fcbc09eef	Gräsmarksvägen	Gata i Sunne	Sunne	59.862023	13.055521	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4ca64d1-b827-4170-9752-00300ac6e5bf	Fogdevägen	Gata i Sunne	Sunne	59.831569	13.136293	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dffee04b-136a-4a17-b2f3-fbdafb0f6f5a	Frödingsvägen	Gata i Sunne	Sunne	59.842971	13.139333	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e12f10a7-fccf-4bc1-a91c-6f79d900dbdf	Vallgatan	Gata i Sunne	Sunne	59.844447	13.144203	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dff69f93-1949-4565-a4bd-000252002ece	Rönna väg	Gata i Sunne	Sunne	59.849174	13.123459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c319945-9eec-449d-b40c-76720f924708	Foravägen	Gata i Sunne	Sunne	59.856477	13.123153	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1296516-fcac-44ec-b96c-bbfc7a9902bb	Transportvägen	Gata i Sunne	Sunne	59.856151	13.122024	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47c1be86-35cf-4ea3-9cbd-07d6c794a3c9	Industrigatan	Gata i Sunne	Sunne	59.835322	13.150943	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
471ab899-8f56-4b54-8859-658ef63493ac	Rosenbergsgatan	Gata i Sunne	Sunne	59.839487	13.132768	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48fd1baf-a548-45c5-94ea-bd9814ba6f4b	Berghallagatan	Gata i Sunne	Sunne	59.839621	13.131294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5607b309-83c8-496a-8b17-9eead3bc86f6	Sundsbergsvägen	Gata i Sunne	Sunne	59.830646	13.130951	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef075077-f6a8-4d55-9006-051fb883726a	Kolsnäsvägen	Gata i Sunne	Sunne	59.825841	13.138299	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
09d1f94b-2f02-4897-ace8-561544affcb1	Hantverkaregatan	Gata i Sunne	Sunne	59.840629	13.154201	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3fe04d83-7225-4bc4-b642-eb4d2c2ed198	Bangränd	Gata i Sunne	Sunne	59.841595	13.150939	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86482735-41d5-4181-bd37-035377d5838d	Berga	Gata i Sunne	Sunne	59.844811	13.105107	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f5344d1-0572-4ef9-9818-17b80957a01b	Skäggeberg	Gata i Sunne	Sunne	59.840734	13.123679	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
550166af-4d2c-481e-a537-d97c95b98554	Tanka	Butik i Torsby	Torsby	60.130942	12.994248	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
51ccdd3e-2d95-487c-a24e-b9196168ad70	Valbergsängen	Sevärdhet i Torsby	Torsby	60.14349	12.98812	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3448121-188f-427c-b63a-f5c57d1dcd62	Torsby Pizzeria	Café/restaurang i Torsby	Torsby	60.136369	13.004708	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ddd6f59c-e72f-4e9a-a91e-9c9ade730897	Pizzeria Ararat	Café/restaurang i Torsby	Torsby	60.137199	13.003675	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
31be89de-42d0-4a3c-a3cf-63db44da4992	Björnidet	Sevärdhet i Torsby	Torsby	60.133761	13.006964	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b17c9449-3058-4bba-86ab-b3de54afe48f	Quickly	Café/restaurang i Torsby	Torsby	60.134303	13.007074	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4515514-a22f-410e-bce4-343642120d75	OKQ8	Butik i Torsby	Torsby	60.135402	13.011355	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ead65e9c-2be0-4345-a4a6-d84305632763	Q-star	Butik i Torsby	Torsby	60.13328	13.005589	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
919b4937-ec2a-4215-815e-38719f7ca1c7	ICA Supermarket Toria	Butik i Torsby	Torsby	60.130684	12.993438	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1924cbd-4913-4f34-9713-05207ac11828	Torsby sporthotell	Sevärdhet i Torsby	Torsby	60.148064	12.994071	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b34aab2-6d6e-4df6-9846-5d5bdcefb11a	Torsby skidtunnel	Sport & fritid i Torsby	Torsby	60.14802	12.993189	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd12e04a-dc40-486d-a940-56d2b3e23a57	Torsby	Offentlig plats i Torsby	Torsby	60.136281	13.001077	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
089289a7-3057-4b5d-a1f1-28cf61ccda4e	Pekås Torsby	Butik i Torsby	Torsby	60.136312	13.007036	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a01242a2-aff5-482c-973d-61fefb82d33d	Liao's Dynasty	Café/restaurang i Torsby	Torsby	60.135866	13.005399	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a5203195-74e1-490c-998c-af1c4c862705	Fordonsmuseet	Sevärdhet i Torsby	Torsby	60.133854	12.999522	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c457b254-05c4-4ec9-b060-bc79b36da3cd	Coop Torsby	Butik i Torsby	Torsby	60.130878	12.998199	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
29f23bdd-4307-471c-a67e-e12ae4298d87	Kommunhuset	Offentlig plats i Torsby	Torsby	60.136056	13.007671	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8940f109-ac64-4be9-818d-e4b1ca502db1	ICA Nära Frykenhallen	Butik i Torsby	Torsby	60.135853	13.008052	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2fba6a92-ae9f-40a8-9812-60337fbfabe3	Helmia Bil	Butik i Torsby	Torsby	60.131035	12.993644	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5541e9d-328d-46b3-bd3d-721c28f23f08	Toria värdshus	Café/restaurang i Torsby	Torsby	60.130671	12.994115	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9d02200-87cb-4952-babe-886f880442ce	Torsbybadet	Sport & fritid i Torsby	Torsby	60.141157	13.00367	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
a54fbfd6-f5b5-4b02-9956-6288e6b81a4d	Stjernehallen	Sport & fritid i Torsby	Torsby	60.14097	13.004629	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
81fbffa2-cfdf-4608-b09d-b8be9a770b72	Oregano	Café/restaurang i Torsby	Torsby	60.135846	13.006876	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e8680fc4-d8f5-4260-ae2b-fdc6fd7a56f9	Dollarstore	Butik i Torsby	Torsby	60.13646	12.986882	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
10995761-3dc8-4e09-b54c-4ac7ac381518	Pizzeria Amigos	Café/restaurang i Torsby	Torsby	60.13452	13.006584	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd506cb8-2a86-4be5-ab4c-e76d3bd1d9d5	Larseriks Frisersalong	Butik i Torsby	Torsby	60.134312	13.006101	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd25661f-c24b-4bd6-8177-ff0c55da0720	Stjärnan	Sevärdhet i Torsby	Torsby	60.134635	13.007255	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
cdf9bedf-9071-4a90-a376-c514bd6dbfd8	Sibylla	Café/restaurang i Torsby	Torsby	60.135491	13.005346	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e72fd970-6ee8-4b51-92a1-5803d85d801b	Wienerkonditoriet	Café/restaurang i Torsby	Torsby	60.13583	13.00555	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9da507c-4cdf-43f9-9b2e-db1c18a04941	Torsby Begravningsbyrå	Butik i Torsby	Torsby	60.137086	13.001968	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c95f67f-1a32-4c68-96ed-f1c67b25d73f	CNG Torsby	Butik i Torsby	Torsby	60.155455	13.003697	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
566e764a-5938-443a-b210-e6dc6f178709	Lya Livsmedes Butiken	Butik i Torsby	Torsby	60.136111	13.006454	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c5acbfe-2619-4f72-9e6e-f85e37ce4088	Catattoo	Butik i Torsby	Torsby	60.135118	13.006514	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd7d9bad-b827-4327-b8af-759e88afce2d	Systembolaget	Butik i Torsby	Torsby	60.135125	13.007949	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dfd2295b-e11a-40e2-aa12-61d70e78e744	Tärnemarks Ur & Guld	Butik i Torsby	Torsby	60.135982	13.006033	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7838c96c-83f0-47e4-bb67-6a230ceb45a2	Studio CH	Butik i Torsby	Torsby	60.135155	13.006932	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ababa9a5-3d8c-4eae-b531-407b15461fcf	Noll.560	Butik i Torsby	Torsby	60.136016	13.006138	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7cb3e713-7d01-4175-93ea-20e3c14ad619	Salong Hårdesign	Butik i Torsby	Torsby	60.136037	13.006222	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f097fbb-192d-480d-a79a-b3b55e077391	Gröna Rummet	Butik i Torsby	Torsby	60.135922	13.005849	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
06f8cc59-ffe2-4794-aa03-56a18893bdb4	MJ's Hem & Kontor	Butik i Torsby	Torsby	60.136283	13.004202	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
864b9ba7-7d49-43b9-9ae8-c9a623022590	DatorCenter	Butik i Torsby	Torsby	60.135175	13.007852	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
773dd39e-6a15-4671-b73a-6c0297e7e47e	Made by M&M	Butik i Torsby	Torsby	60.135232	13.006821	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f78d6ed6-4ea8-42b9-af7d-803c0aff0781	Wiktors Hörna	Butik i Torsby	Torsby	60.135373	13.006153	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e073f11-2184-493d-9b3b-6ec4e6603ec2	Hedbergs	Butik i Torsby	Torsby	60.135031	13.006592	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3d10b35-885c-4cc0-a34a-0d9ec147c867	Euronics	Butik i Torsby	Torsby	60.136225	13.00676	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e28723e-e9a2-47aa-b027-70289ea040b8	Kronans Apotek	Offentlig plats i Torsby	Torsby	60.135351	13.007673	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
980b6a33-8730-454f-8838-c363536b8ad8	Prima Sport och Mode	Butik i Torsby	Torsby	60.135378	13.005598	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
11c450ca-dbca-4acc-8f41-3c17f6ec54cd	Volvo	Butik i Torsby	Torsby	60.130816	12.993936	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb85c874-f905-40cb-9cd4-73291965c8f5	JYSK	Butik i Torsby	Torsby	60.135902	12.987055	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
46441d0b-d9ce-46ab-938a-30f911f231bb	allsport	Butik i Torsby	Torsby	60.135733	12.987103	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
64e538b8-9c10-4f54-bb75-be50e3146b7e	jem & fix	Butik i Torsby	Torsby	60.135254	12.987316	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9db65c55-3690-41dc-a7d1-601e466d94e7	Naturlig Skönhet	Butik i Torsby	Torsby	60.134415	13.008467	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9aa172f4-df5b-4cd1-ae7e-5869203063ca	SOLO	Butik i Torsby	Torsby	60.134368	13.006232	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ad2da02-f8d1-4928-8bd1-1bc308191736	Lundins eftr Guldsmedsaffär	Butik i Torsby	Torsby	60.134523	13.007398	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e0c3d58f-70f5-4c33-8554-593f081dafdb	Fryksände Begravningsbyrå	Butik i Torsby	Torsby	60.134456	13.008581	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
19375a34-2ad5-4bf9-bc32-af947972583f	Zolboo's Sushi	Café/restaurang i Torsby	Torsby	60.134576	13.007331	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
38f721f7-dc4a-4c92-8ed2-6cb83d6d96b5	Systrarna	Butik i Torsby	Torsby	60.134912	13.006314	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cbe98fcf-37d0-4b8e-9a8f-05d6fe7e6595	La Rose	Butik i Torsby	Torsby	60.135236	13.005848	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fedae254-0f89-4aa4-beba-41c0f007460c	Hedbergs Skor	Butik i Torsby	Torsby	60.135025	13.006144	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a5cd2ef-332f-4a02-803b-c426d84c6579	Torsby sjukhus	Offentlig plats i Torsby	Torsby	60.137875	12.99899	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b3b0328-c28d-49f1-b9e0-b0b9cdc9e6a8	Holmesskolan	Skola i Torsby	Torsby	60.135908	12.993706	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d065c03e-ca50-4dc6-a2a3-14660683984a	Frykenhallen	Sport & fritid i Torsby	Torsby	60.139592	13.014903	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
90b1d78d-029c-4157-8717-7fe55a062e73	Pingstkyrkan	Kyrka i Torsby	Torsby	60.13484	13.009951	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
f901e374-e96d-4386-bf40-00e2374ab111	Larssons Brygga	Café/restaurang i Torsby	Torsby	60.130447	13.012559	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
543ac64c-8dd9-4e63-a23c-fe121e24fea7	Torsby GK	Sport & fritid i Torsby	Torsby	60.140529	13.031158	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
866f594b-b976-4c3a-9b04-638406120174	Oleby skola	Skola i Torsby	Torsby	60.136363	13.039869	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3a14a68-c2ff-44e7-8e61-2253422a1ce2	Hotell Örnen	Sevärdhet i Torsby	Torsby	60.134622	13.005522	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
01f7a431-69f9-482e-a83e-2a763991ae9f	Fryksände kyrka	Kyrka i Torsby	Torsby	60.137482	13.013922	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d2826bf-8275-4738-942a-256db307fc98	Siris kapell	Kyrka i Torsby	Torsby	60.136685	13.017113	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
90294a97-29d7-44e9-8d9d-a7400fb916c8	Hembygdsgården Kollsberg	Sevärdhet i Torsby	Torsby	60.131355	13.021222	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
08920245-9d37-4d3b-8b1c-9108c737721c	Stjerneskolan	Skola i Torsby	Torsby	60.140002	13.006654	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd4525bb-a4fc-45d3-a402-57fe626daba2	Frykenskolan	Skola i Torsby	Torsby	60.139019	13.01521	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
afebd308-9d05-4656-b6a6-fa4e26fd6405	Bergebyvägen	Gata i Torsby	Torsby	60.150641	13.000415	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d450a8b8-f9e1-4bb0-9f87-34818766e197	Granstigen	Gata i Torsby	Torsby	60.144042	13.003161	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e760d581-c9ea-4003-971d-f989bb4b968e	Levgrensvägen	Gata i Torsby	Torsby	60.132558	13.015303	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3544f7ad-febc-4d42-83fa-8e26a3ebeaa6	Gräsmarksvägen	Gata i Torsby	Torsby	60.133417	13.00526	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cacbf366-e989-4992-a471-62c28c137143	Vasserudsvägen	Gata i Torsby	Torsby	60.15185	12.990935	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06f34593-0a79-4ed6-8378-c0538b439ff6	Olebyvägen	Gata i Torsby	Torsby	60.146186	13.021865	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4b70ee2-9559-4226-819f-a8ede75358fa	Furuvägen	Gata i Torsby	Torsby	60.143179	13.002443	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5879aad-0f9b-4ef1-b243-76ab9e64e283	Tallstigen	Gata i Torsby	Torsby	60.143879	13.001904	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3cadc730-3f48-4c1a-baf5-c197ca9a0797	Tunnelvägen	Gata i Torsby	Torsby	60.145705	12.994171	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5339ee96-01d6-47b4-a810-f90761c56c1e	Myrvägen	Gata i Torsby	Torsby	60.138583	12.979816	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca14f6ac-ce2f-416e-9280-33d8af38c8b9	Hagvägen	Gata i Torsby	Torsby	60.141477	12.979514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e226aeb-7568-4963-a736-c62872a07017	Sälgvägen	Gata i Torsby	Torsby	60.143389	13.006138	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
26d329b7-3e3b-47ea-a8bf-f778f41dcd67	Skallebyvägen	Gata i Torsby	Torsby	60.144818	13.005928	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a6a1391f-87df-446b-a5f2-1ec54e9f5984	Skogsvägen	Gata i Torsby	Torsby	60.144195	13.006409	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd70e2f9-1aba-40f0-9679-8a5b78c479ea	Valåsvägen	Gata i Torsby	Torsby	60.143569	13.007484	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
199dc513-5340-4e73-a0c0-064507726b13	Järnvägsgatan	Gata i Torsby	Torsby	60.140206	13.000672	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1aadd166-f8e0-47ad-993c-7375afa65fa0	Kyrkogatan	Gata i Torsby	Torsby	60.135741	13.011518	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46fc8fb0-b5ca-41d9-9ac0-81c2189aeb8c	Lasarettsvägen	Gata i Torsby	Torsby	60.136646	12.99467	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ff88999-c9f3-411f-b019-262409137eed	Södra Industrigatan	Gata i Torsby	Torsby	60.138947	13.006924	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2015c28b-e6c0-490b-8f6d-2adc9fb1e6ac	Sjögatan	Gata i Torsby	Torsby	60.133075	13.007831	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3f66d31-e71b-466d-9a68-3e0c802ba986	Valbergsvägen	Gata i Torsby	Torsby	60.142435	12.991437	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86a3e66b-fc86-4543-b31b-d3c2a400001c	Vitsandsvägen	Gata i Torsby	Torsby	60.144616	13.011859	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc4a843d-e7ba-45f2-a40f-54c9cbe61080	Västanviksvägen	Gata i Torsby	Torsby	60.130903	13.005561	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
578ffdcb-1d24-4448-b73c-d4680c06bfdd	Berggårdsvägen	Gata i Torsby	Torsby	60.128987	13.003209	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f6ccb22-c3e7-4178-b1dd-b0592534a2db	Östmarksvägen	Gata i Torsby	Torsby	60.135335	12.988791	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3cdc3f5-7dc5-4e69-a05e-bc82b728bd38	Bangårdsgatan	Gata i Torsby	Torsby	60.136678	13.006305	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d17fb7d4-b066-4f9f-a504-3f6d3a81ca25	Barrstigen	Gata i Torsby	Torsby	60.139021	12.992809	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5a263bd-63aa-4a22-b9cd-5b7d0155c7b4	Billerudsvägen	Gata i Torsby	Torsby	60.135083	12.995337	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e27d6884-d392-4924-8622-662f6c0b5d41	Kvarngatan	Gata i Torsby	Torsby	60.135494	13.000661	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
65768c3f-71a4-41bb-ae4e-614dc5bdbf0d	Landstormsvägen	Gata i Torsby	Torsby	60.137791	12.995465	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce266b85-7a19-4c64-a21e-04fb43540cfe	Lövstigen	Gata i Torsby	Torsby	60.137557	12.993116	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad5104ff-a8e9-44b0-adb4-7852a503b4b4	Norra Industrigatan	Gata i Torsby	Torsby	60.13852	13.006279	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8bdfb3c-fcba-4230-b080-c3f1bd9a0087	Norra Torggatan	Gata i Torsby	Torsby	60.134309	13.006465	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
21ee819b-18f8-48e8-bd31-f89d2a11bf1a	Ragvaldsgatan	Gata i Torsby	Torsby	60.135519	13.003162	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a0aab2d4-a8a2-44cc-a2d0-c749ab997371	Skolgatan	Gata i Torsby	Torsby	60.135287	12.996246	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
95a15a1c-f1a6-4cde-9487-a29ab67e3057	Timmervägen	Gata i Torsby	Torsby	60.137582	12.995604	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
254d46e9-36c2-40cc-80c7-b5a39ac31b97	Tingshusgatan	Gata i Torsby	Torsby	60.135857	13.00618	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2b2821d4-8bb7-4fcf-8f27-e6a858981067	Wåhlstedts väg	Gata i Torsby	Torsby	60.133055	12.989207	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2fc258d-7219-4c6a-80ca-c5e2c19901b3	Åsgatan	Gata i Torsby	Torsby	60.137771	12.99427	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2eea1a2-c017-400e-9d39-26e85b182011	Alstigen	Gata i Torsby	Torsby	60.14485	13.002051	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb1d98c5-a84c-409a-8aff-62c9c1163d9f	Altarvägen	Gata i Torsby	Torsby	60.133448	13.012632	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9be2f5f9-aa70-4348-8cd0-9760101804b6	Bryggarvägen	Gata i Torsby	Torsby	60.151291	13.014379	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3d386b13-a896-482d-8727-c1d6820e706a	Biografgatan	Gata i Torsby	Torsby	60.135399	13.00742	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
91be8ec3-2387-45a7-bd5a-4b088fcfad0c	Bjärkstigen	Gata i Torsby	Torsby	60.143726	13.000651	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d077222-3b6e-4ccb-a2e6-c12e0420b60d	Björnidesvägen	Gata i Torsby	Torsby	60.141129	13.01786	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4dbcd1ee-6037-4086-b44d-87761fe20f15	Enarsvägen	Gata i Torsby	Torsby	60.138176	13.00686	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aad6e597-98d8-448f-983e-0af0b5397af6	Fabriksgatan	Gata i Torsby	Torsby	60.141907	13.007931	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
22a8434d-7284-41bf-be53-7ea7378934ff	Fågelsångsvägen	Gata i Torsby	Torsby	60.142595	13.004944	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7a17969d-92dc-480e-afc8-0bdc8bbfad39	Fågelvägen	Gata i Torsby	Torsby	60.139403	13.002812	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b10eb1b-baf7-435f-a732-0df420d4e91e	Hantverkaregatan	Gata i Torsby	Torsby	60.135948	13.00936	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8bcc6bb6-481b-40ae-82c2-63258b324b5e	Holländergatan	Gata i Torsby	Torsby	60.131559	13.01018	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
559b77d0-68d1-4bef-a630-2e30ac8d2d8c	Idrottsvägen	Gata i Torsby	Torsby	60.143877	13.004621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1c1e285-996d-4a69-9461-e42b1f3079ce	Kärleksstigen	Gata i Torsby	Torsby	60.131958	13.015904	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c180e577-5c09-403e-9a2b-0150429d27e6	Lindblomsvägen	Gata i Torsby	Torsby	60.131546	13.012777	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
320cac05-dc85-4b0a-9489-ce45e62ffebc	Läroverksgatan	Gata i Torsby	Torsby	60.138252	13.015871	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce161099-971b-4da0-b299-e22c5dfd21e8	Norra Ringvägen	Gata i Torsby	Torsby	60.140907	13.007695	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2353506-c268-4eb4-9371-983a2db0c2b7	Nya Torggatan	Gata i Torsby	Torsby	60.134232	13.009969	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f859b82-d0c2-436d-940f-e15b8083f11e	Nya Torget	Gata i Torsby	Torsby	60.135407	13.007887	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6103055c-9db9-40b4-a0b4-a2932dbe0c4c	Nygatan	Gata i Torsby	Torsby	60.132455	13.01041	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
268ad9ee-9bfe-43fe-9f34-739ee35edf04	Prostgårdsvägen	Gata i Torsby	Torsby	60.133665	13.013469	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3956e22-bd77-4a0f-8a73-5e60c4423be9	Skepparegatan	Gata i Torsby	Torsby	60.134573	13.010809	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06a4dc4e-737a-4f1c-bd38-12aeb93556b8	Villagatan	Gata i Torsby	Torsby	60.138958	13.002659	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7ff44c5-84b9-4fec-a0ea-08acf6855ce3	Fridhemsvägen	Gata i Torsby	Torsby	60.131351	13.016569	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2f5df8f-18f1-4e8f-b664-b91235188719	Stationsvägen	Gata i Torsby	Torsby	60.131555	13.038896	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c22b1e6b-e9ba-41e8-b893-289718ba594e	Vinkelvägen	Gata i Torsby	Torsby	60.150517	13.007186	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d1eb63d-b332-4ee1-b127-c470f2040699	Viklundsvägen	Gata i Torsby	Torsby	60.12701	12.993632	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12d0226d-3745-49d5-9bfd-1932a0a6bb8a	Henrik Sörensens väg	Gata i Torsby	Torsby	60.127431	12.995289	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aaa98ea3-f7b9-4acc-a0d9-c45ab0209509	Sundbergsvägen	Gata i Torsby	Torsby	60.128834	12.992839	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
98f8e6cb-320a-4404-b829-1d6a3c8f0e9a	Brånåsvägen	Gata i Torsby	Torsby	60.127192	12.998208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da625356-4f3f-4550-bbab-d15b2b25ae16	Lövåsvägen	Gata i Torsby	Torsby	60.125307	12.996263	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8a13f6a-ea69-4445-8c75-f031a1cb8db3	Boställvägen	Gata i Torsby	Torsby	60.122883	13.004545	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
797a1c27-7bcc-4581-ab66-654dea97734d	Frisellvägen	Gata i Torsby	Torsby	60.126089	12.995893	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
083236ad-66e7-4d66-a962-1fef49298992	Lustavägen	Gata i Torsby	Torsby	60.127818	12.993103	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
594813b5-5371-495d-bea7-99282a81d937	Kilåsvägen	Gata i Torsby	Torsby	60.122855	13.007504	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
37fd8774-c61b-4bfb-b54b-33193e8961f5	Mellanvägen	Gata i Torsby	Torsby	60.121257	12.998707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d350a86f-0dcf-45ad-ac75-fc73acf02f08	Fallåsvägen	Gata i Torsby	Torsby	60.12083	13.0037	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
93e7dd7b-0c85-4688-89a4-5bf5438f6606	Blåbärsvägen	Gata i Torsby	Torsby	60.121168	12.996108	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fbc1987d-33b6-439a-a5d6-5e4ce1401268	Björklundavägen	Gata i Torsby	Torsby	60.120088	13.000566	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
10a619b6-3d16-4ff5-b074-45cc2d7658b4	Kärråsvägen	Gata i Torsby	Torsby	60.121394	13.00104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f8206c71-15e3-49a4-a4a6-5f57d3838fb7	Smedvägen	Gata i Torsby	Torsby	60.120464	13.002291	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
38ee53e6-404a-4e7c-aeb1-a07a94e4e0eb	Lingonvägen	Gata i Torsby	Torsby	60.120058	12.998445	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5bb2fc46-584a-4eae-9ff5-a04385d74480	Hollstens väg	Gata i Torsby	Torsby	60.121731	13.002437	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e3f3202-d147-4a4c-9f04-d7bb8dc58b71	Gunbyvägen	Gata i Torsby	Torsby	60.117095	13.01292	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6a82dfc-e2ab-4643-8dfd-da9e895b2a78	Täppstigen	Gata i Torsby	Torsby	60.12056	13.008985	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
815d09aa-0077-4661-ad05-72c3903fcc9a	Humlevägen	Gata i Torsby	Torsby	60.120198	13.009156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bbd2581a-47e7-4be6-8549-417cb8b5fb31	Solbergsvägen	Gata i Torsby	Torsby	60.1226	13.022072	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9f97c1d-d2ef-4307-8d27-c91a41527fc2	Notnäsvägen	Gata i Torsby	Torsby	60.128374	13.007922	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
490051fb-3ed6-475a-aa56-40b039da66be	Framgårdsvägen	Gata i Torsby	Torsby	60.123102	13.014057	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ec2be288-cb3e-4198-a0bd-55d75d778db9	Nyängsvägen	Gata i Torsby	Torsby	60.125204	13.007488	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
acb9772b-4169-42b5-9f24-7751c315279e	Skärvägen	Gata i Torsby	Torsby	60.129125	13.001715	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fd8cd47-83e1-405a-b7d9-5fc6bcf66887	Brunnsdalsvägen	Gata i Torsby	Torsby	60.129848	13.002277	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cbc8d50e-bb55-4781-8116-4997546fab6b	Lillvägen	Gata i Torsby	Torsby	60.126391	13.005537	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
62fc6eb4-0d8e-4010-894e-7ce923943352	Oscar Stjernes väg	Gata i Torsby	Torsby	60.136722	12.980649	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
70338674-46a2-46a2-803b-0dbeb72ab3be	Åsens väg	Gata i Torsby	Torsby	60.135078	12.982736	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
664651f6-8fcb-46e3-a880-bd2693a8e080	Akervägen	Gata i Torsby	Torsby	60.137345	12.981556	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1540af3e-0f12-44db-b8a7-d77f10814832	Hedvägen	Gata i Torsby	Torsby	60.135076	12.982079	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
baf40ed6-1d09-4d32-a05a-b91754a3f4af	Murar Pers väg	Gata i Torsby	Torsby	60.138842	12.981983	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
84cba982-96bd-4316-9aeb-e1fdd21fb0ef	Lindenvägen	Gata i Torsby	Torsby	60.141186	12.995514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c3427fd-dfad-4b38-abbb-52e1841213b9	Önnerudsvägen	Gata i Torsby	Torsby	60.162628	13.010164	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff63bf2b-2720-4e4b-96af-5b0408bb10db	Bergsängsvägen	Gata i Torsby	Torsby	60.144127	13.015534	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2b9d69d-45b8-4cfd-9d7f-01ac8e666f68	Parkvägen	Gata i Torsby	Torsby	60.145533	13.010471	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
17c57e4f-1920-4fd4-b812-441ac969bd9f	Ängsvägen	Gata i Torsby	Torsby	60.146242	13.012565	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8805ffb3-fa81-4389-aa8e-5c9ef3965d40	Mjölnarvägen	Gata i Torsby	Torsby	60.147296	13.013707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b685d29-50f0-4a64-95f4-1cf8a44f4613	Dahlbergsvägen	Gata i Torsby	Torsby	60.144964	13.010014	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
01c6c2c8-9b50-4699-8a39-1a2715906309	Källvägen	Gata i Torsby	Torsby	60.13919	13.012236	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7ec3878b-152b-4122-9b5f-f6318b5b9e39	Skaftvägen	Gata i Torsby	Torsby	60.143248	13.012249	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e2bcc83-738f-4277-9fde-65211877ae4d	Rönnallén	Gata i Torsby	Torsby	60.145343	13.014059	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e26c1b0-2a7f-40f0-9ea2-c3bf895bfac6	Bomansvägen	Gata i Torsby	Torsby	60.146349	13.014293	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
35c85405-24b8-4537-9dab-95aed16240a6	Sippstigen	Gata i Torsby	Torsby	60.147369	13.01085	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f8724774-0266-4b0b-8670-c8d83e926b66	Gärdesgatan	Gata i Torsby	Torsby	60.13915	13.013359	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
73a4afdc-e73b-45de-89b2-260af88c1539	Vävaregatan	Gata i Torsby	Torsby	60.14167	13.012664	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
558251c3-ac27-4ed2-8685-1fafb983ce8e	Ankarvägen	Gata i Torsby	Torsby	60.1357	13.036096	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
40e2ff36-e503-4c14-aa30-07ca24de0a74	Kaptensvägen	Gata i Torsby	Torsby	60.131761	13.040555	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5852fb97-bc8f-4862-9e42-dd462380455b	Matrosvägen	Gata i Torsby	Torsby	60.131527	13.038542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa4d8697-c25f-4ecb-b69b-436a9b2bfa15	Sjömansvägen	Gata i Torsby	Torsby	60.132842	13.038197	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
07663aba-b6df-4d49-b52a-d8dddaa39c8a	Styrmansvägen	Gata i Torsby	Torsby	60.13106	13.039362	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b50e83e-ad40-446e-983c-7d259b508ecf	Jungmansvägen	Gata i Torsby	Torsby	60.13217	13.039015	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
896df507-b40e-47f9-9cac-2b7840198e90	Barlastvägen	Gata i Torsby	Torsby	60.136882	13.036088	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e20a7ed1-9c8d-4f3e-8f31-c73f51f602e2	Babordsvägen	Gata i Torsby	Torsby	60.136824	13.036042	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da0039c6-0d26-4286-94f1-913fd5171e7f	Sandbovägen	Gata i Torsby	Torsby	60.121659	13.01179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
762116cd-0035-4f4c-b00c-6dd93de7c360	Styrbordsvägen	Gata i Torsby	Torsby	60.136569	13.032755	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
50035f46-6da2-478b-9f78-7ce3f937a2d9	Terminalvägen	Gata i Torsby	Torsby	60.153396	13.005203	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
63fd7b0a-476d-49c4-87c9-17eac47f0bb3	Norra gränd	Gata i Torsby	Torsby	60.147563	13.013435	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd6fc5a8-f763-466e-a309-67acb1422888	Håksvägen	Gata i Torsby	Torsby	60.133964	12.981169	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9e4618c-f9dd-4f19-a340-995cb6f8dd36	Risätervägen	Gata i Torsby	Torsby	60.123873	12.996769	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44dac6bc-afc7-49fa-a7d3-48e87a64e865	Graneviksvägen	Gata i Torsby	Torsby	60.117541	13.009451	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06ebf144-8750-4aff-8add-8a563e273295	Svennebyvägen	Gata i Torsby	Torsby	60.120732	13.016455	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7da2f6ef-e667-4a56-a123-0b2d89d9fe78	Genvägen	Gata i Torsby	Torsby	60.115504	13.028313	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b302c058-43fd-461b-9970-40b41fdca4a8	Vallmovägen	Gata i Torsby	Torsby	60.120047	13.007296	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
be6a19c5-5da5-4f91-a0a2-1c8c6c342a96	Båtåsvägen	Gata i Torsby	Torsby	60.124704	12.996032	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd2d52ea-3646-45e6-847a-4551194caad4	Preem - Kil, Montörsgatan Trb	Butik i Kil	Kil	59.510189	13.301886	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
caed23de-9798-4f8f-9afa-bd4c0ac434e3	Glada Killingen Pub & Restaurang	Café/restaurang i Kil	Kil	59.503672	13.315055	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
93b6a3bf-ac20-45f5-890e-f6ac3b4b50e6	Frendo	Butik i Kil	Kil	59.504498	13.323514	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
62645ce7-8ea1-4204-be0a-ecb1a117c5a8	Kil Stenåsen okq8	Butik i Kil	Kil	59.503827	13.331823	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
80d8fa5c-e352-4acd-aac4-e150902c0cf7	Kil	Offentlig plats i Kil	Kil	59.50478	13.315873	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e47103ff-324c-4c99-99f8-42b1679e5d85	Runnevåls skolmuseum	Sevärdhet i Kil	Kil	59.519904	13.310801	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ed9007c-c107-4a30-95a1-75360bd6fa9e	Kils Hotel & Restaurant	Sevärdhet i Kil	Kil	59.504781	13.321727	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7cbec76-08f6-41ab-bdcd-c6b5e4fd1d68	Systembolaget	Butik i Kil	Kil	59.504658	13.320804	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
12bf4626-7efa-4026-ad09-ea81eb0f5b88	Kils grillhus	Café/restaurang i Kil	Kil	59.504598	13.319602	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
92eb829f-35c0-4916-969e-c9fcac3cb268	Willys Hemma Kil	Butik i Kil	Kil	59.499884	13.317333	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d838fb01-7055-4a42-8585-c17df1bb0c24	Kil Ros	Café/restaurang i Kil	Kil	59.50423	13.319709	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9f274a2-86e0-4316-8172-49fee1c2df7c	Bosses Grill	Café/restaurang i Kil	Kil	59.50352	13.317881	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
73190449-cc2a-4b3b-adbc-14d02381d6a9	Kilspizzan	Café/restaurang i Kil	Kil	59.503579	13.318079	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
15d3f010-5877-46fc-a563-3c1784003083	Kil's pizzan	Café/restaurang i Kil	Kil	59.503429	13.313339	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b820784-6149-4a95-9716-767741290979	Kronans Apotek	Offentlig plats i Kil	Kil	59.503944	13.315768	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
00a5e84c-4715-484b-b5a3-f1042f9ad775	Ingo	Butik i Kil	Kil	59.504666	13.323402	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2919e315-2377-45dd-b83c-0bd96b2bebe1	Rörtjänst	Butik i Kil	Kil	59.500803	13.334135	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
736d4ed2-9178-4ef1-ae22-85bd77200bb3	Alfa Neon	Butik i Kil	Kil	59.500844	13.332526	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fb58750-0c9a-4910-b6b0-ee910d4b976a	Euromaster Däcko i Kil	Butik i Kil	Kil	59.500264	13.332859	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd34cd8d-279a-481b-9d9a-c66b0920d77e	Bolist	Butik i Kil	Kil	59.501694	13.333653	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1bad6dec-e0ea-4ab4-a8f0-c78c05546fa4	Kils bibliotek	Offentlig plats i Kil	Kil	59.503592	13.316911	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3abe19b-4e1f-455d-93a7-001cd017a677	Dumplings	Café/restaurang i Kil	Kil	59.504039	13.318176	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d383fb56-fbe3-4a3b-9b96-3da3100e962b	Händiga händer	Butik i Kil	Kil	59.504016	13.317964	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
453f0191-472d-478e-87aa-32fb0bb07bc7	Jessica's chark & deli	Butik i Kil	Kil	59.50419	13.319234	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
48fe5175-7838-4d04-bc1d-77c4ef7c7908	Grill o pizza stugan	Café/restaurang i Kil	Kil	59.503598	13.314864	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b546bb45-f9f5-4688-8368-40a84015929c	Fonus	Butik i Kil	Kil	59.504137	13.318893	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d13f06c-acf1-4f43-8c3f-f3fdd049dcc3	Järnvägscafeet	Café/restaurang i Kil	Kil	59.504609	13.31647	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
180ab418-92a5-4c0a-bb56-c54771bd7857	Snabb tugget pizza	Café/restaurang i Kil	Kil	59.503303	13.31219	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d8b7f50-785d-4d28-af0b-58b03d0308c5	Kilsravinerna	Natur/park i Kil	Kil	59.493091	13.302872	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb5b8b21-18cf-436a-bbcd-af80f77c79d2	Sannerudskyrkan	Kyrka i Kil	Kil	59.502204	13.306248	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1f0bf80-e644-4cfd-a9ed-3a6a2fd1d3bd	Coop Kil	Butik i Kil	Kil	59.503391	13.332132	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1806311a-3862-403c-94d9-233594689346	ICA Supermarket Kil	Butik i Kil	Kil	59.50396	13.314827	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4780d9b8-e82d-4f3e-83b9-2c127be39e2e	PeKås	Butik i Kil	Kil	59.504269	13.317373	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e13706aa-35c6-4e6f-a88c-d2aced7428e7	Sannerudsskolan	Skola i Kil	Kil	59.50101	13.30966	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5399b4a4-5136-4e2a-bfb3-c946ffbd45be	Stenåsenskolan	Skola i Kil	Kil	59.498876	13.343877	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa8ee3c9-eb79-4e1f-a1ab-7b5aa8d568bb	Vikstaskolan	Skola i Kil	Kil	59.512488	13.311856	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dcdcd3f1-f9ba-4d5a-9c24-ffd602a0a714	Vårdcentralen Kil	Offentlig plats i Kil	Kil	59.498181	13.3199	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
54017b78-b434-4099-8546-0f590d65d919	Sannerudsvallen	Sport & fritid i Kil	Kil	59.498244	13.312217	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
c718555b-a65b-44e5-ae5a-305c5f688e29	Sannerudshallen	Sport & fritid i Kil	Kil	59.498188	13.309896	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
c34224c0-30e0-4f40-b168-3188d9199e02	Kulturhuset KilArena	Offentlig plats i Kil	Kil	59.504924	13.307674	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d789cc2-3bc4-4c3b-a392-e860e4b6b161	Kils kommun	Offentlig plats i Kil	Kil	59.503323	13.317172	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e238479b-f347-426c-8145-fe8828c48a3e	Närhetens kyrka	Kyrka i Kil	Kil	59.502216	13.314938	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
99c60d9e-096f-4808-a72f-fb66e23a3223	Gröna Torget	Natur/park i Kil	Kil	59.501965	13.317569	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0fdcabd1-348d-4479-91c6-71359a5b138d	Röda Tornet Park	Natur/park i Kil	Kil	59.520182	13.326165	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
210ba82c-af53-499e-856f-8d13a62738c1	Meca	Butik i Kil	Kil	59.499785	13.333247	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d62a86f2-aa09-42ca-855a-370c17942480	Bilmecano	Butik i Kil	Kil	59.502948	13.333511	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c40b2326-4545-4fd9-8ad7-8003a22aa152	Brandstation	Offentlig plats i Kil	Kil	59.503598	13.308028	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca5d924a-a590-4c52-860f-e89ccddc6deb	Hembygsgården	Natur/park i Kil	Kil	59.521086	13.312701	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
37e397e5-86a4-473d-af33-0f1fc30f2692	Jonsbolsbacken	Gata i Kil	Kil	59.522116	13.316552	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
10bb5d0f-0be5-4947-a39b-c5b6e323c4f4	Odens väg	Gata i Kil	Kil	59.511741	13.301539	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a50e542-cb35-4e7f-a2d9-fe05e3cd174a	Montörsgatan	Gata i Kil	Kil	59.509232	13.305543	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
78ab2e5e-35f6-4962-a41c-a34e660cc4e5	Apertinsvägen	Gata i Kil	Kil	59.516143	13.33965	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b50b035-4851-4b61-a9e7-028f2bcbc2f7	Sjöleden	Gata i Kil	Kil	59.521279	13.330266	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4015f5e9-92fe-4569-a936-ea0e5af948c3	Långgatan	Gata i Kil	Kil	59.502026	13.308311	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9cb6af0-3aab-4eda-8568-526565f543c6	Valhallgatan	Gata i Kil	Kil	59.50394	13.327171	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bfe98fc9-233c-4c59-934e-aa912830ee8d	Ekvägen	Gata i Kil	Kil	59.500575	13.324615	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb961862-0571-4452-ac71-088bb8bcf6a4	Sannerudsgatan	Gata i Kil	Kil	59.501865	13.321319	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3e20cd9-52e4-4dbf-8177-ecbd1ba03ebe	Västra Torggatan	Gata i Kil	Kil	59.502075	13.316714	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc000342-ea79-4108-8305-1ef155c018ad	Sveagatan	Gata i Kil	Kil	59.501707	13.329999	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6ea64ba-ca2a-439f-8125-7046edb4ae09	Parkgatan	Gata i Kil	Kil	59.503284	13.321938	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a35778f-b2dc-4f7b-ae82-0f3b224f6480	Östra Torggatan	Gata i Kil	Kil	59.503418	13.317709	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
811d21ea-9de2-42c0-a343-1d2d2a278320	Thims väg	Gata i Kil	Kil	59.504005	13.320606	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
014ebc78-ee7a-42e1-bc53-e5da55bdd005	Ravinvägen	Gata i Kil	Kil	59.496915	13.325574	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e9293c4-5c76-4b24-a069-c10307030a21	Tallvägen	Gata i Kil	Kil	59.501638	13.328331	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e4902eb-136b-4271-9ccc-78a6c6bd8724	Hagagatan	Gata i Kil	Kil	59.503052	13.320082	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
220ebacd-0015-48e3-9613-e0ea7df51d2f	Järnvägsgatan	Gata i Kil	Kil	59.503492	13.323656	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9f8dc18-d59d-4647-8378-98b03d7b2d4a	Fabriksgatan	Gata i Kil	Kil	59.502028	13.32593	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d48414c-d145-47c4-bc13-9df39c2df474	Östra Trädgårdsgatan	Gata i Kil	Kil	59.503658	13.324492	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4cfc0988-7b1b-492e-a654-5575bce49a53	Rönnbärsstigen	Gata i Kil	Kil	59.496446	13.328993	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9ea5adf-a6bc-4a62-9d2a-012f0978f3b9	Nyponstigen	Gata i Kil	Kil	59.49745	13.326445	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
59590156-ef66-45f2-bd0d-8a6a17f58f14	Skogsvägen	Gata i Kil	Kil	59.500324	13.313333	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
de292774-e9ab-431d-a43c-f51bb0a27c60	Danielssons väg	Gata i Kil	Kil	59.503135	13.314047	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2a963aa-78da-4c5b-9532-2775b1566140	Smultronstigen	Gata i Kil	Kil	59.498041	13.32899	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d083fe2c-6b0a-49fb-82f9-fde119d17178	Stenbärsstigen	Gata i Kil	Kil	59.494561	13.322161	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a248bcf-843f-4252-a6d3-7060aa9cf1d7	Ostingevägen	Gata i Kil	Kil	59.492758	13.330703	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9c555d5-62da-4194-acb5-d06aed2613db	Lilla gränd	Gata i Kil	Kil	59.504518	13.328264	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
63de28a6-7e3b-48d0-bbd3-1aa91108ba29	Nygatan	Gata i Kil	Kil	59.502093	13.312442	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7b7b142-1f2d-472b-9e6f-54e8ad7974be	Hallonstigen	Gata i Kil	Kil	59.495027	13.324764	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f7026d0-eb7e-46a9-8668-b90b3a45996f	Västra Trädgårdsgatan	Gata i Kil	Kil	59.501906	13.311582	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b135120f-8bcc-4a0e-833a-8bef02d610d2	Björnbärsstigen	Gata i Kil	Kil	59.494795	13.32335	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd9f7770-ed50-4be1-bd8e-877d5c1dd725	Karlslundsgatan	Gata i Kil	Kil	59.501506	13.310826	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6f22012-9712-49dd-be32-4043d9a9b377	Granvägen	Gata i Kil	Kil	59.500031	13.325932	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ec67a490-00b3-49ba-99be-7c69a4b308d5	Blåbärsstigen	Gata i Kil	Kil	59.496576	13.329681	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc1542cc-526f-4ceb-b460-5368524027db	Hjortronstigen	Gata i Kil	Kil	59.496481	13.323112	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3096c27f-8f36-4ebd-bdbb-8ab13472d24e	Vattugatan	Gata i Kil	Kil	59.502315	13.314219	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
02011c65-3649-4d87-bc55-cfb0c4a0909b	Björkvägen	Gata i Kil	Kil	59.500147	13.326772	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
405bc1b6-608d-4cce-a397-782b2ba66d7f	Lingonstigen	Gata i Kil	Kil	59.496009	13.328103	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
24fecb6f-1567-4832-aa02-c7ea17205f47	Åkerbärsstigen	Gata i Kil	Kil	59.495699	13.321104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba0df2f8-64d9-411e-8aae-ef09f9204305	Bjurbäcksgatan	Gata i Kil	Kil	59.499948	13.306853	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e14ba31-4197-44e6-8509-09efab4a4b3a	Gravendalsvägen	Gata i Kil	Kil	59.499224	13.30965	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2bb1261-9d56-4580-b7dc-07c24202fbac	Villagatan	Gata i Kil	Kil	59.50068	13.307619	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ccd59305-3875-4172-9c12-20a9f16aeb67	Idrottsgatan	Gata i Kil	Kil	59.499384	13.307138	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e05f6fd6-4d9e-4ce6-908e-081592a24bab	Gärdesgatan	Gata i Kil	Kil	59.503297	13.308119	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d787ad9-6c31-4546-8bba-423477a6df1f	Agardhsgatan	Gata i Kil	Kil	59.499064	13.304646	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43dd15bf-917f-4f12-ab18-34978768a72c	Lagerlöfsgatan	Gata i Kil	Kil	59.500924	13.305027	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
917e923f-bc02-4743-91e1-e554d25d108f	Skyttegatan	Gata i Kil	Kil	59.498122	13.307743	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
57fd7abe-5136-4f15-a6de-4caca3128409	Fredholmsgatan	Gata i Kil	Kil	59.50053	13.306678	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
60fc0dce-1d7a-4994-8fb6-58864940e453	Lersättersvägen	Gata i Kil	Kil	59.497785	13.305297	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4cfe9e4f-bb59-4dd2-9b9c-2b0ebe607913	Bryggaregatan	Gata i Kil	Kil	59.501482	13.287771	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ff84276-6e00-4eea-859a-650af9595eeb	Mårdvägen	Gata i Kil	Kil	59.498328	13.302131	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fd77581-c3c3-49ad-822e-e37e39700576	Lodjursvägen	Gata i Kil	Kil	59.495763	13.308106	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c63760f5-f642-43f0-92d2-59d3cd9b9098	Broddvägen	Gata i Kil	Kil	59.498945	13.295695	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ca520a3-9e52-4e5a-b481-167c7e2a8eae	Rådjursvägen	Gata i Kil	Kil	59.496672	13.303663	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f883ebb8-e689-4ff2-a31b-a77705723652	Björnvägen	Gata i Kil	Kil	59.495784	13.306522	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
75c4d3ac-45a2-42f0-8377-538f197cb84c	Dallidsvägen	Gata i Kil	Kil	59.494497	13.332013	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
20e8b115-0c1b-42a3-b4ff-d590503ef969	Älgvägen	Gata i Kil	Kil	59.496635	13.30456	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
033d6ce3-d119-4c81-86fd-41f2e0064f75	Hjortvägen	Gata i Kil	Kil	59.496307	13.304792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1d6ef89-698b-4451-91f3-95c3ef272a70	Hälsostigen	Gata i Kil	Kil	59.49765	13.320129	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61f270db-9c8a-49c9-8f0c-5d7965ceb7b7	Hästskovägen	Gata i Kil	Kil	59.497992	13.294746	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9665cc1c-dc58-44e3-9e43-151941e1bcea	Blomstervägen	Gata i Kil	Kil	59.512384	13.341244	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9024af92-a533-4b8a-a8be-e7dd93bbcfc3	Timotejvägen	Gata i Kil	Kil	59.512827	13.341366	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b849ddb-80f6-457c-b46a-19c42e4f1dfa	Violvägen	Gata i Kil	Kil	59.512527	13.34315	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce496c85-3da4-48f0-a9f9-423ecde5ff42	Kilslundsgatan	Gata i Kil	Kil	59.507947	13.331831	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4738deee-8670-4c0d-9cfe-521517546cda	Morkullegatan	Gata i Kil	Kil	59.511498	13.338159	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2ec3930-e5d8-42e8-992a-63e5f33882e2	Orrgatan	Gata i Kil	Kil	59.510502	13.337841	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2010337c-e595-433e-9ab6-a56663fe6113	Ärlestigen	Gata i Kil	Kil	59.510305	13.338121	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4d917ae-d2e4-4ad6-a7ea-49812664a60e	Trastvägen	Gata i Kil	Kil	59.511233	13.336522	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eebb19a1-9c45-4200-9b42-b0e26b5752cf	Mogatan	Gata i Kil	Kil	59.509259	13.334992	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bdada74b-8321-4a6a-8c5d-2e592aa1c921	Birgits väg	Gata i Kil	Kil	59.507505	13.331351	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f476304d-8c2e-43d5-bfb5-a58988aa23fd	Duvstigen	Gata i Kil	Kil	59.510954	13.339735	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ceccfc01-fe1d-4771-9522-1014bc8ce6c2	Fasanstigen	Gata i Kil	Kil	59.508818	13.334577	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b4cdd80-a87e-4bcb-b8da-207a1b15e56a	Tvärgatan	Gata i Kil	Kil	59.507377	13.330409	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4b8e4f0-5b95-415f-92b5-39088dd45317	Lärkvägen	Gata i Kil	Kil	59.50565	13.332913	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
084cd021-161c-42c9-a5e4-fad0dba2d3b9	Tjäderstigen	Gata i Kil	Kil	59.510152	13.336004	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a89ffa8-9ba5-4f57-ba77-3630d5a9d4ca	Ripvägen	Gata i Kil	Kil	59.506483	13.333047	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6c32485-e08c-4cba-9300-e1a4d28b1108	Källgatan	Gata i Kil	Kil	59.509216	13.336863	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cce2d478-9961-44c1-9ec2-34e9e02c3c0c	Granitvägen	Gata i Kil	Kil	59.498272	13.343301	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d2c871d-4eae-45a2-a697-20310f1d9b7e	Höstvägen	Gata i Kil	Kil	59.501313	13.338094	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ecbd85eb-7622-4c62-9e65-2ce11ebe3cab	Fältspatvägen	Gata i Kil	Kil	59.497065	13.341783	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2bb350a8-fe54-483c-a00d-615c5e5789bc	Moränvägen	Gata i Kil	Kil	59.498604	13.343397	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6436d032-523e-4934-beba-e57255a188b4	Eldarens väg	Gata i Kil	Kil	59.497563	13.335741	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
478f70b9-0210-4f19-b507-917efd61afce	Lavavägen	Gata i Kil	Kil	59.496797	13.344602	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
31af0914-e173-4c8c-bad6-ec016395b5de	Stenåsvägen	Gata i Kil	Kil	59.503058	13.336292	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
05110004-0c49-46bb-aa0a-1382b8b53384	Skrivarens väg	Gata i Kil	Kil	59.498345	13.335653	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f5618c6-8836-4b9c-b54e-cf7649b5ee36	Lokförarvägen	Gata i Kil	Kil	59.499126	13.335933	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
505fb9df-dd61-4fe1-8dda-185f692e4280	Vårvägen	Gata i Kil	Kil	59.502061	13.336648	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d5bcdb7-ccdf-4061-a267-7e85152d6be1	Stinsens väg	Gata i Kil	Kil	59.495635	13.334496	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae9a20bb-e243-4220-bedf-94afa8800167	Skiffervägen	Gata i Kil	Kil	59.497378	13.342214	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
83b62a94-25bc-4ef6-8054-e142484d051f	Vintervägen	Gata i Kil	Kil	59.50145	13.339084	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2b58a56f-c151-46ba-b7f1-f92c10a1dd19	Tågmästarvägen	Gata i Kil	Kil	59.497785	13.335269	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c687008-437a-4b2b-8208-c3b5d3e457e5	Malmvägen	Gata i Kil	Kil	59.49676	13.3443	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea4b4273-ee0e-4183-9b1f-31678926973a	Konduktörsvägen	Gata i Kil	Kil	59.497314	13.334701	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c8f7353-6c19-43ae-ae87-8bd5a4bbbbc6	Årstidsvägen	Gata i Kil	Kil	59.501829	13.333511	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6017eb74-d4f4-4b6e-b2ef-e75c915799b5	Sommarvägen	Gata i Kil	Kil	59.501697	13.337059	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
29eab9e5-c289-4521-8274-3611e2a374f9	Täljstensvägen	Gata i Kil	Kil	59.495592	13.342627	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
20554c63-4158-452c-8739-682efe1cadc4	Rullstensvägen	Gata i Kil	Kil	59.494977	13.34163	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d249b9c5-4197-4734-8e3f-55cbc0e2e7a7	Sandstensvägen	Gata i Kil	Kil	59.495669	13.341401	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eabc4f88-79c9-4819-a0bd-677a94671992	Stenkolsvägen	Gata i Kil	Kil	59.494289	13.342295	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd64f23f-33e6-4e78-a6f0-6732b386fc61	Kalkstensvägen	Gata i Kil	Kil	59.495716	13.340201	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a0593c6f-8efa-4b96-b41f-3abc151a8773	Marmorvägen	Gata i Kil	Kil	59.494425	13.341099	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6ecd36e-1e32-400e-80bd-ce3873baed02	Glimmervägen	Gata i Kil	Kil	59.495713	13.344314	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df05db07-da84-4915-8f82-7facff02378f	Kiselvägen	Gata i Kil	Kil	59.495048	13.344156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
134c8697-143b-489d-9d40-b6655fffd7ad	Gnejsvägen	Gata i Kil	Kil	59.497588	13.345499	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ca2bdc1-cb4c-405c-b465-23c4a720795c	Storgatan	Gata i Kil	Kil	59.503751	13.314985	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fb0395b-8711-47e8-8ac3-80b6e91c9d3a	Kompassrondellen	Gata i Kil	Kil	59.504168	13.330157	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
704c6b03-0096-4580-a783-2ef716074a88	Sågaregatan	Gata i Kil	Kil	59.506348	13.294144	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d90f77f-862e-4b30-9ce4-d2bb9cefb2cb	Allégatan	Gata i Kil	Kil	59.506366	13.312716	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ab5dcd4-42aa-458a-801d-a1fd726d9b35	Grinnemogatan	Gata i Kil	Kil	59.509343	13.312473	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b26ed445-e600-48ed-a17e-237b1e346f0e	Ringvägen	Gata i Kil	Kil	59.509089	13.315247	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9933dec2-e1ca-46a0-a76f-fcb591816b14	Åkergatan	Gata i Kil	Kil	59.508451	13.315421	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d24c3d8d-9a52-4b48-b690-c1c81856bec2	Slåttervägen	Gata i Kil	Kil	59.508907	13.315841	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c94689d9-6e65-4093-8228-dc0a2ce34615	Tomtvägen	Gata i Kil	Kil	59.510735	13.31326	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6201c23-c5c3-4aef-ad03-23892d7ddec3	Fältgatan	Gata i Kil	Kil	59.508362	13.319409	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
78fccac4-3b7a-4b86-910d-e88669390658	Gamla Allégatan	Gata i Kil	Kil	59.506524	13.31915	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2118709-d1d6-4af4-8eb5-ddf9b4a40ec7	Hagvägen	Gata i Kil	Kil	59.507125	13.322324	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
62d00891-cdad-4629-9b45-6c4767823233	Vallvägen	Gata i Kil	Kil	59.506989	13.321892	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1e9d6bc-b621-4c96-8db3-678d7fe2627a	Tegvägen	Gata i Kil	Kil	59.506823	13.323152	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eac14e89-5fc0-44c7-bc74-ca6bfee098a4	Lövvägen	Gata i Kil	Kil	59.506065	13.312946	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd99d513-7963-4127-a3b4-2b3896eeb6c2	Industrigatan	Gata i Kil	Kil	59.507014	13.304783	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa1ac32d-e073-4bb7-a21f-3bb806ed5bb3	Snickerigatan	Gata i Kil	Kil	59.509869	13.304118	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7f2397f6-ab0f-4b13-8536-fddd5d505627	Adels väg	Gata i Kil	Kil	59.522248	13.333184	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
20556877-ec19-46bc-95b2-2a2a859bde44	Harkevålsvägen	Gata i Kil	Kil	59.503664	13.297915	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
685c03ad-ef2f-41ad-96a7-4e36a26762e2	Volymvägen	Gata i Kil	Kil	59.509581	13.295284	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92a8946c-fe09-485c-a786-87b355085c3f	Cirkulationsplats Lersättersmotet	Gata i Kil	Kil	59.50316	13.310062	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ed2bfb8-221b-41b5-94bf-715d8a006a37	Måns Smeds Väg	Gata i Kil	Kil	59.516451	13.343838	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab3fd906-5306-40d3-802f-5c38b1daa0e7	Hammars väg	Gata i Kil	Kil	59.517726	13.345299	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ee8c61f-b775-4d7e-be9b-ec987c1fc6ce	Bergslagsvägen	Gata i Kil	Kil	59.507281	13.33284	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4b89f35-92cd-47d3-bb87-8fbfb1991df6	Frej Alsterlinds väg	Gata i Kil	Kil	59.509875	13.331357	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
73f2f038-1839-4160-95d8-0669044c7daa	Arvid Anderssons väg	Gata i Kil	Kil	59.508687	13.328523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d11a8db0-c82e-45a2-93ae-cc9af9ec4d5b	Folke Kilhages väg	Gata i Kil	Kil	59.511143	13.331884	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3742cb6-cd82-4ccb-ba66-8c0d3742ba4b	Myrgatan	Gata i Kil	Kil	59.501438	13.296697	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffc5a704-7561-4590-8724-5a06b2fc8426	Släggatan	Gata i Kil	Kil	59.50119	13.292508	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
553cf50a-c805-4f4e-8867-972feb048d93	Trestegsgatan	Gata i Kil	Kil	59.499967	13.286862	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eeef15af-5868-4aab-81e2-58cc1902f891	Löparegatan	Gata i Kil	Kil	59.49997	13.290128	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fcdf4133-d19b-47e1-85b0-471004726e1c	Garvaregatan	Gata i Kil	Kil	59.505608	13.293418	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58cae27a-77b1-4760-840e-5bc0a8a34df7	Sunnanåvägen	Gata i Kil	Kil	59.499165	13.297581	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7484abe7-3111-43e1-a8e1-19f1d0eda4b8	Diskusgatan	Gata i Kil	Kil	59.501741	13.291578	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
485963b4-4793-4b74-97c2-d51fc89be83c	Gjutaregatan	Gata i Kil	Kil	59.501059	13.282664	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e99a766-9631-4d08-9e14-f1f5c51c7b07	Stafettgatan	Gata i Kil	Kil	59.498477	13.2897	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a4ac590-d9be-4d8d-867a-016989dd8704	Höjdgatan	Gata i Kil	Kil	59.500745	13.289332	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd25c16e-0b3f-44ae-814b-447a90a76af5	Kulgatan	Gata i Kil	Kil	59.500575	13.293207	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
30efd3ed-5941-466f-b173-e0efcea1547b	Häckgatan	Gata i Kil	Kil	59.498479	13.288295	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb54ac94-b59b-4e3d-964b-ecac7184ccb2	Bollgatan	Gata i Kil	Kil	59.498803	13.291154	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
656a56e9-b646-47f3-af15-51527b24359c	Stavgatan	Gata i Kil	Kil	59.500304	13.288478	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0ad3665e-8647-4080-87a0-f789b5af884a	Vävaregatan	Gata i Kil	Kil	59.505821	13.28823	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
090fa959-546a-49f7-88c3-3a52b7a9d827	Västingegatan	Gata i Kil	Kil	59.499431	13.293005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
72a4d280-8796-4b00-b104-ae0b3fd3b112	Hindergatan	Gata i Kil	Kil	59.499193	13.286808	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bad9cb20-c046-4695-9876-aa3878b962e8	Rallaregatan	Gata i Kil	Kil	59.501508	13.296128	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
347b7f07-46c9-479b-99cc-e35c26710c3d	Hugins väg	Gata i Kil	Kil	59.515565	13.296997	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8608fb9b-613f-43a2-8b1b-63f1e59582ae	Blåklintsvägen	Gata i Kil	Kil	59.513669	13.342854	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4858a128-8b31-46fb-982b-b5b9a2f47b1f	Bifrostvägen	Gata i Kil	Kil	59.518426	13.298146	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f680bee-044c-4f3a-b324-a1ac2c00169e	Tyrs väg	Gata i Kil	Kil	59.517264	13.302172	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee7af29a-1816-4f37-b4a9-7f79f0aab8e5	Brages väg	Gata i Kil	Kil	59.512757	13.302415	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eeb99ad5-c10c-44ec-a59d-b07dc26522d4	Konvaljvägen	Gata i Kil	Kil	59.512657	13.345725	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f21923b-9ebe-419d-8879-cd77837d4a9a	Tors väg	Gata i Kil	Kil	59.511592	13.305271	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e096d42a-59c0-44be-8954-79b4c5fa5511	Sleipners väg	Gata i Kil	Kil	59.516003	13.305051	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d93c51b-7c99-43a5-bb94-7f4d315495fa	Runnevålsvägen	Gata i Kil	Kil	59.521189	13.31145	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7c4c2187-4500-447e-b655-0e59a4765efb	Midgårdsvägen	Gata i Kil	Kil	59.51633	13.30459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a3a182ae-b430-45c1-ad67-711d0efaf8b9	Kyrkvärdsvägen	Gata i Kil	Kil	59.517321	13.310482	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8791f7c7-154a-48ca-b5ca-a0b590a951a4	Ottars väg	Gata i Kil	Kil	59.515126	13.297036	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2b85217-d63e-4e6f-bd6f-6589ccc67fdc	Ymers väg	Gata i Kil	Kil	59.511265	13.305512	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
496b66a4-1bcb-4af0-9433-dd0a0ae6a376	Balders väg	Gata i Kil	Kil	59.512423	13.302655	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b70806ac-098e-4d8e-9422-2faed52c81b5	Heimdalsvägen	Gata i Kil	Kil	59.517462	13.298362	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0ff634c7-f79c-4ff7-8735-3521c1687309	Frekes väg	Gata i Kil	Kil	59.515803	13.304993	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
53486ef3-ae5e-4f35-b404-c6d0ecf935c7	Vikstavägen	Gata i Kil	Kil	59.513491	13.309564	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
04b3f126-e54f-4902-b6e1-677af9f08d6a	Iduns väg	Gata i Kil	Kil	59.513767	13.300367	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aac9e210-853c-45c5-805d-2816ea879b9a	Klövervägen	Gata i Kil	Kil	59.514714	13.341448	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7e9d786-c022-43e9-8cbb-f5883b4c579a	Ägirs väg	Gata i Kil	Kil	59.517403	13.30349	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9db34c78-9d25-4409-b410-52f7b0b39c46	Egils väg	Gata i Kil	Kil	59.51374	13.306501	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
21ff3ca9-0f71-4b0b-9a05-413855ea3b5a	Asavägen	Gata i Kil	Kil	59.51419	13.299544	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fccd5a0-c1f6-4ee1-b413-4f2862504ab7	Spjutgatan	Gata i Kil	Kil	59.500949	13.291051	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
37e03d7c-1a46-4816-951e-e4e7376d12af	Mats väg	Gata i Kil	Kil	59.520621	13.337238	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad8ce473-175e-49e1-85dd-be1c5710a483	Beles väg	Gata i Kil	Kil	59.515132	13.297778	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
efb87df8-1941-41ff-96e3-b06a40e859f0	Bures väg	Gata i Kil	Kil	59.511386	13.306338	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cff47420-0ec6-4f4b-bb05-e0ccb9f0eb50	Frejas väg	Gata i Kil	Kil	59.513718	13.299623	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b77c8d5b-15c7-48c7-b74a-eed4e4f2c06d	Lokes väg	Gata i Kil	Kil	59.512436	13.303355	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e891321-2b02-4bec-b970-688f821f7ea6	Sätterbergavägen	Gata i Kil	Kil	59.509675	13.339009	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12b8ce18-83e8-411b-87fd-ffb8181f6225	Sandlyckevägen	Gata i Kil	Kil	59.523661	13.312402	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af9080b4-e91b-4cab-b65b-04d0e327d6a8	Fornhemsvägen	Gata i Kil	Kil	59.522655	13.312571	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea1ea8b8-f6a1-42a1-b03e-d362fbbc691d	Rydstedsvägen	Gata i Kil	Kil	59.522527	13.311406	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9701492d-022f-47d1-8c93-bbdb060c31f7	Utgårdsvägen	Gata i Kil	Kil	59.517665	13.300084	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
117d1566-3ca7-4553-8cd7-0c5c1306caf5	Finns väg	Gata i Kil	Kil	59.517243	13.302825	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
633ab60f-a1e1-4ebb-b443-4e9bb909e61c	Geres väg	Gata i Kil	Kil	59.515783	13.306017	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82cf99a4-9fae-49b3-9827-20c8ae1d1783	Skolgatan	Gata i Kil	Kil	59.500281	13.309458	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8dbe9434-1ebd-4bef-9bb8-9b6f6f548172	Fryksandsvägen	Gata i Kil	Kil	59.517738	13.319206	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d05538e-374a-41dd-81f1-ec5d92039dec	Tegelbruksvägen	Gata i Kil	Kil	59.514579	13.318145	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c19cfc99-21da-4ac8-b855-40a9161951ea	Erik Larssons väg	Gata i Kil	Kil	59.508547	13.328359	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d152af44-8aa0-4066-906a-5795866a081f	Magasingatan	Gata i Kil	Kil	59.50472	13.318907	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9582f5ac-e159-4379-8ca1-fb9f70178694	Odalgatan	Gata i Kil	Kil	59.511093	13.313327	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a4d7c70-0e73-48ea-a56c-9bcf0dcd66ce	Ängskällevägen	Gata i Kil	Kil	59.516661	13.318054	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5de30c6-9da6-4347-8e7f-c67360d42566	Lärarinnevägen	Gata i Kil	Kil	59.51885	13.312762	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9195721-2847-4f96-88db-5d4948e66671	Gamla Karlslundsvägen	Gata i Kil	Kil	59.503858	13.310132	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7035a615-1b27-4867-8318-d013e5ee4063	Värmevägen	Gata i Kil	Kil	59.508622	13.287092	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87809641-49d6-4e2c-8dac-74ba7914fed6	Sparvgatan	Gata i Kil	Kil	59.512128	13.336233	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2256593e-bf14-46ea-a58a-308183a4abe0	Olles väg	Gata i Kil	Kil	59.522962	13.334843	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da068b75-734b-44f6-b257-a16c2394d974	Tollestabacken	Gata i Kil	Kil	59.522584	13.318653	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
83364fc3-0c2f-4a8e-89a5-d71ef79ffaa1	Krukmakarvägen	Gata i Kil	Kil	59.517168	13.322324	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9fc1823-f11d-4b54-8b58-6d49e7e76f34	Tegelbacken	Gata i Kil	Kil	59.516739	13.322439	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
97211cfe-9f95-400e-8b71-243e9c4d0706	Porfyrvägen	Gata i Kil	Kil	59.497133	13.340514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
25eedbbf-7ff6-4dac-9c1c-6f1c92b18fab	Diabasvägen	Gata i Kil	Kil	59.49695	13.342951	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ed5aa1e2-47da-4f49-9cad-6cc3f2734284	Kvartsvägen	Gata i Kil	Kil	59.497849	13.341962	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
198c15de-3829-433e-9a08-b4685f6f4d73	Hotel Ibis - Good Morning Karlstad City	Sevärdhet i Karlstad	Karlstad	59.382365	13.502116	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6289e9f4-1216-4930-869e-e7f3d924df76	Fredsmonumentet	Historisk plats i Karlstad	Karlstad	59.38079	13.50239	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
084b4dc0-3cb5-4a83-ad28-52be2de1f344	Preem	Butik i Karlstad	Karlstad	59.37781	13.56108	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f985b12c-d9e0-4b20-9704-5a7e53f940ed	Tanka	Butik i Karlstad	Karlstad	59.3736	13.506042	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e91be653-f170-4dd8-a85a-fc60aadf8eac	Scandic Winn	Sevärdhet i Karlstad	Karlstad	59.382971	13.50497	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b3dd841-da36-4c3e-bc03-15cc66a15c1b	Scandic City	Sevärdhet i Karlstad	Karlstad	59.379303	13.505626	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
40140476-b231-4547-8cfd-b939644ca9ad	Berling Apartments	Sevärdhet i Karlstad	Karlstad	59.379035	13.507583	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9c91b78-82fb-4e7e-9be8-afb5c73c4334	Burger King	Café/restaurang i Karlstad	Karlstad	59.383402	13.475295	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
31d021d0-6925-4744-befd-d651340f9881	OKQ8	Butik i Karlstad	Karlstad	59.383849	13.478562	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e49f0e86-b9a4-4c0b-84e8-e61eacb0eb50	Apoteket	Offentlig plats i Karlstad	Karlstad	59.378524	13.499554	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a48ccc28-64b5-486d-86eb-2e1557082f48	Filmstaden	Sevärdhet i Karlstad	Karlstad	59.379112	13.497418	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
313d9bd0-c06c-4ee1-9121-f1644251ccf8	Herrhagens vårdcentral	Offentlig plats i Karlstad	Karlstad	59.38165	13.519504	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf67052a-dea6-4377-88da-b1fc450f509c	Vårdcentralen Gripen	Offentlig plats i Karlstad	Karlstad	59.3829	13.502188	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad83a4e4-a6cf-4269-88fe-cb199070fc0b	Coop Herrhagen	Butik i Karlstad	Karlstad	59.377606	13.517007	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dbc34c67-c1af-4f36-96ea-9fad298bc4c0	Chaplin	Café/restaurang i Karlstad	Karlstad	59.375673	13.515144	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
89c6ed66-6e56-4dfc-a478-ffa2e22b7fe6	Pizzeria Embla	Café/restaurang i Karlstad	Karlstad	59.378627	13.518095	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b3f6bfc-9c5f-4a9d-90cb-4566520c04fb	Chon Tong	Café/restaurang i Karlstad	Karlstad	59.376336	13.518059	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7f16344-8d44-4000-b80b-c722c241d0af	Butiken i hörnet	Butik i Karlstad	Karlstad	59.374564	13.514857	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3c6079f-6877-4f84-a396-6da665aa9e9a	Lecab	Butik i Karlstad	Karlstad	59.384623	13.476929	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7cd9e8d-f457-4015-b454-92b6fe15a076	Oliven	Café/restaurang i Karlstad	Karlstad	59.38444	13.475886	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
660d29b1-a34e-4aab-9bdd-281a35c07365	Vårdcentralen Åttkanten	Offentlig plats i Karlstad	Karlstad	59.381953	13.512739	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1360178-eb6b-4219-95c2-6a7c8b2746ac	Scalateatern	Sevärdhet i Karlstad	Karlstad	59.378704	13.501471	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5130f81-4674-47fd-b091-6321317b3c04	Systembolaget	Butik i Karlstad	Karlstad	59.378464	13.499809	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8909eff3-470f-4e14-bb54-da8285c05fe5	Västerstrand vårdcentral	Offentlig plats i Karlstad	Karlstad	59.385604	13.464447	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
867c2782-ad38-42b4-9716-4b5955eb9eb4	ICA Nära Kärnan	Butik i Karlstad	Karlstad	59.385148	13.463656	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
16142aa5-cb38-47f3-bef8-efe9b95f0093	Pekås Våxnäs	Butik i Karlstad	Karlstad	59.384293	13.463272	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f17c4379-07b9-4d19-8d0e-b2a9f03ad4e0	St1	Butik i Karlstad	Karlstad	59.382335	13.46308	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4083eec5-bbc0-4857-8266-794642e17b8d	Solsta cykel	Butik i Karlstad	Karlstad	59.382972	13.504291	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
507873e0-5e1c-4ff2-88f0-83d3ead3ab3e	Ventilen cykelverkstad	Butik i Karlstad	Karlstad	59.377475	13.516181	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef0804fb-c74b-4f5c-8af9-03b801566c21	Pepa Deli	Café/restaurang i Karlstad	Karlstad	59.380344	13.502457	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9522f499-ee6a-437f-ab56-da407fcb97d7	Café Slusswakten	Café/restaurang i Karlstad	Karlstad	59.380261	13.511069	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f4f9c6a-51c2-47e1-8aa3-f2a1e45a8d9e	Pitchers	Café/restaurang i Karlstad	Karlstad	59.381259	13.503858	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
735390c5-a56c-4962-b30f-40c7672ad6eb	Sola i Kallsta	Sevärdhet i Karlstad	Karlstad	59.38129	13.49978	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1f8896b-1e44-4e1b-a14c-069a83d469e6	Hertig Karl	Historisk plats i Karlstad	Karlstad	59.380848	13.499176	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c037535-0ea4-4162-bbc3-3b26da2ca553	Selma Lagerlöf	Historisk plats i Karlstad	Karlstad	59.382089	13.498765	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
a389849a-7c3d-40e3-b916-6926801e9f49	Stadshotellet	Sevärdhet i Karlstad	Karlstad	59.381311	13.500526	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c3a0dcd-4a96-4a1f-a45c-ac001e78f758	Bishops Arms	Café/restaurang i Karlstad	Karlstad	59.381351	13.500216	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2910b51-3dbf-4d89-8b22-8283e9063fd0	Home Hotel Plaza	Sevärdhet i Karlstad	Karlstad	59.378476	13.501829	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1536f0c-699a-4c55-8f11-bc83957f6ee0	Home Hotel Bilan	Sevärdhet i Karlstad	Karlstad	59.379522	13.508674	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f7ece7e-cb32-4c48-8938-416015cd7ee9	Telia	Butik i Karlstad	Karlstad	59.379563	13.499061	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
26492166-4af7-4388-9042-b5431fed5a7e	Pekås Viken	Butik i Karlstad	Karlstad	59.377375	13.492205	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7d0a300-4b98-4898-bed4-2a627ecd8fa7	ICA Nära Viken	Butik i Karlstad	Karlstad	59.376995	13.490667	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
98e79ba4-3ca2-4dba-a5e4-336c7cfb6687	Postens Företagscenter, Karlstad Väst	Offentlig plats i Karlstad	Karlstad	59.38655	13.47738	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c61c321-52ae-4a1c-bcb4-da58a04e0efb	Arenan	Sevärdhet i Karlstad	Karlstad	59.38352	13.502431	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
67624afa-57c0-4cfb-9380-dc7e645be814	Ristorante Alfie	Café/restaurang i Karlstad	Karlstad	59.382037	13.501713	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6fabd066-7292-452c-bc68-971977630a57	Rådhuscaféet	Café/restaurang i Karlstad	Karlstad	59.380621	13.501601	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4bab42b6-d750-420e-96b7-52a642a4503a	Barbros Brygga	Café/restaurang i Karlstad	Karlstad	59.376601	13.507609	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b6cc49b-c7c0-4c5f-a4ad-2b240a9a1b27	Koriander	Café/restaurang i Karlstad	Karlstad	59.379593	13.50192	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b4864cb-401e-4b7e-8e7a-7b4f9bf6b540	Mongolian Steakhouse	Café/restaurang i Karlstad	Karlstad	59.382575	13.512578	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3fa6b45-250b-472e-a3d8-d170cfd837d9	Restaurang Pizzeria Napoli	Café/restaurang i Karlstad	Karlstad	59.38086	13.511873	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
03905c1f-a2a6-4ddf-809c-7ca1d29c6d3b	Nya Peking Restaurang	Butik i Karlstad	Karlstad	59.379047	13.506884	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
545909f8-ed14-445a-a1c9-d8c442b05989	Restaurang Tain Loon	Café/restaurang i Karlstad	Karlstad	59.381314	13.51114	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb2bb42d-8751-4ac2-969b-be128a730687	Restaurant Tiffany's	Café/restaurang i Karlstad	Karlstad	59.381909	13.501706	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dab13dfd-480f-4800-a278-238aea316f97	Brasserie Winn	Café/restaurang i Karlstad	Karlstad	59.38295	13.504726	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3da57a2-1745-48a9-82a2-698ffb6ffeb3	Zest	Café/restaurang i Karlstad	Karlstad	59.383021	13.502803	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
35311402-6ab7-49c0-bdbe-87df8995a277	Sibylla	Café/restaurang i Karlstad	Karlstad	59.388924	13.51523	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
83851d33-32cd-446d-9aa6-45c7dc9ef444	Lidl	Butik i Karlstad	Karlstad	59.3867	13.47523	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0855e643-b58f-48ca-b156-8dd4458dd03e	Wermlandsdata	Butik i Karlstad	Karlstad	59.377727	13.517273	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
52575163-c53d-4585-ac23-2d231c6c86d2	Ingo	Butik i Karlstad	Karlstad	59.39064	13.49707	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
72d14a3a-c5bd-42c6-be72-9136a3842ce5	Scandic Klarälven	Sevärdhet i Karlstad	Karlstad	59.391173	13.497279	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a289391-a20f-4583-b0f7-7fd379cf7abb	Fontana di Trevi	Café/restaurang i Karlstad	Karlstad	59.37959	13.499556	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e749386-8654-4a4c-873f-c33b1c68cdfe	Hotell Solsta	Sevärdhet i Karlstad	Karlstad	59.379114	13.502466	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4a76dfe-1ce6-4d5f-a255-7d165bb1c0d9	Spicy Hot	Café/restaurang i Karlstad	Karlstad	59.381259	13.50397	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a9aa80f-4dc5-4fd4-85a4-11aff05413e0	Willys Karlstad	Butik i Karlstad	Karlstad	59.3877	13.4818	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7a5ac32-7b63-4d42-9f1b-47bcc0f1d057	Patienthotellet	Sevärdhet i Karlstad	Karlstad	59.374861	13.480965	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e61b68a-61a4-40f7-8fde-412f23ab773a	Kontorsbolaget Selvin AB	Butik i Karlstad	Karlstad	59.383356	13.468726	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d38dbca2-2e0f-4122-88a0-06ee602711d4	Grit Kitchen	Café/restaurang i Karlstad	Karlstad	59.384934	13.46896	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
63f2d268-6b89-4b7c-b817-9c844adaec83	Romstads Pizzeria	Café/restaurang i Karlstad	Karlstad	59.379893	13.475586	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
adab9c00-6f5b-471c-9e98-7c936d47ec3a	Klaraviks Cykelaffär	Butik i Karlstad	Karlstad	59.379897	13.47572	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
51fe8232-4436-478b-b24d-2f160bd85a51	Bergqvist skor	Butik i Karlstad	Karlstad	59.380325	13.503903	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a34b60a7-d1a7-431b-b333-ec04cc4335ca	Down Town Pub Och Restaurang	Café/restaurang i Karlstad	Karlstad	59.376521	13.517979	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a65968bb-40d7-4d77-bfc5-ba39c10de8ee	Herrhagens Skivbörs	Butik i Karlstad	Karlstad	59.377647	13.515698	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4526a3d6-c2b7-46e6-a8c5-709670b4d2cf	Pizzeria Opera	Café/restaurang i Karlstad	Karlstad	59.376314	13.518535	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
286cba06-ae51-4d5f-9937-4d1a6b7e0871	Magnus tobak & tips	Butik i Karlstad	Karlstad	59.376356	13.517659	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
671b089a-9c59-4e45-ae9d-82b23d9f75a3	Pizzeria Restaurang Bari	Café/restaurang i Karlstad	Karlstad	59.37625	13.519501	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7012522-4880-490a-812b-951de2670df0	Herrhagstvätten	Butik i Karlstad	Karlstad	59.378698	13.518106	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea620623-6e17-4cf7-952e-e9775aff6e38	Herrhagens Blomsterhandel	Butik i Karlstad	Karlstad	59.378083	13.51799	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
29b5fa7f-0c2a-4b0a-8906-03426c2acb86	Dans närbutik	Butik i Karlstad	Karlstad	59.379037	13.51818	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f629a9fe-ad0d-434f-9b29-bebc079504fc	Hugo's Herr	Butik i Karlstad	Karlstad	59.380316	13.499112	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6c337c8-9ce7-4f42-ac51-1c47f0f85cdc	Home Hotel Drott	Sevärdhet i Karlstad	Karlstad	59.378631	13.49902	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba262b3a-c283-4453-8ea2-bd249b6aaf2e	Hansons Tobak	Butik i Karlstad	Karlstad	59.378547	13.499019	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0db3ddf9-d98f-4ae1-a488-18b07b22687e	The Leprechaun Pub	Café/restaurang i Karlstad	Karlstad	59.378847	13.504442	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5958c8c5-41e2-4bda-a15e-7957f0a01a5c	Hemköp Karlstad C	Butik i Karlstad	Karlstad	59.379178	13.497726	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
626ad365-1a60-4264-9b71-efd41aa52b24	Tempelriddaren	Sevärdhet i Karlstad	Karlstad	59.37923	13.49468	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff877148-556e-414b-afc3-073da5b3428e	Carlstad City Hostel	Sevärdhet i Karlstad	Karlstad	59.37948	13.499553	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b2c8b12-56e5-43bd-a747-c0e2fd54b967	Kvarnens City	Café/restaurang i Karlstad	Karlstad	59.381547	13.504148	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c5b066c-ad5d-4e96-891b-4c4a5e731fd1	Törgkiosken	Café/restaurang i Karlstad	Karlstad	59.380674	13.503922	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8f65c23-b9d0-44ce-94a6-1f010ab6b82d	Musikhuset Karlstad	Butik i Karlstad	Karlstad	59.380299	13.505399	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5ef1802-4d16-4054-871a-501f2334a112	Åhléns	Butik i Karlstad	Karlstad	59.37916	13.499015	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b1fb89d-8a6b-4148-825b-f5ff4679c51f	Partaj	Butik i Karlstad	Karlstad	59.381672	13.504611	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9e417f8-1ad6-4cef-85bf-26054156fa9f	Teburu	Café/restaurang i Karlstad	Karlstad	59.381413	13.501703	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d50cd7ff-f4a8-404e-b96f-153ba222afef	Hello India	Café/restaurang i Karlstad	Karlstad	59.379149	13.496411	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4939636a-f67c-45a2-a4bb-c4fd615f5290	Tryckeriet	Café/restaurang i Karlstad	Karlstad	59.381291	13.503003	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
80166137-5c1b-45b6-a466-e78a3b9e3807	Pressbyrån	Butik i Karlstad	Karlstad	59.381282	13.503271	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
188e4a38-257f-41e2-8e1b-c7f68ba01fdd	Apoteksgruppen	Offentlig plats i Karlstad	Karlstad	59.405287	13.518315	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b6c259d-d1be-4c92-bb53-f5f8a4bd90e2	Pekås	Butik i Karlstad	Karlstad	59.405777	13.519443	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a58e2d12-8509-4309-aa5c-dc0351fc8c6b	Hotell Savoy	Sevärdhet i Karlstad	Karlstad	59.378625	13.501466	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f16d34f7-4772-4fbe-bcfe-5ddf72167068	Indian Taste	Café/restaurang i Karlstad	Karlstad	59.377313	13.497246	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6bbce46-af17-4524-a321-91bf20ac4754	Espresso House	Café/restaurang i Karlstad	Karlstad	59.379383	13.499551	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
651205b3-0992-4cfe-a431-a708d869e73c	Spikgården	Café/restaurang i Karlstad	Karlstad	59.370381	13.48243	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c3bb7fb-6c14-471a-82ae-12d3a6ebd737	Östanvind	Café/restaurang i Karlstad	Karlstad	59.385121	13.55501	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4cbf43a-4f6d-4ac3-b2e8-bd7e7fe31d17	Micke och Decimas vardagslyx	Café/restaurang i Karlstad	Karlstad	59.376795	13.457641	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4664b068-038d-4f9d-a30e-c02ab66197bb	PS Cykel & Bilservice	Butik i Karlstad	Karlstad	59.34613	13.500579	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5867f729-7a3f-4658-8fc2-f849025877e4	Katolska kyrkan	Kyrka i Karlstad	Karlstad	59.380223	13.507929	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
7f46c4db-2015-443c-a1d9-9e3b6ed892e7	Brasseriet	Café/restaurang i Karlstad	Karlstad	59.381303	13.502457	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dcaaff6d-90a2-4591-9430-fde622191207	Tam Hrap Thai	Café/restaurang i Karlstad	Karlstad	59.377107	13.490903	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
056fd7a6-2852-47b1-bd58-ab3a63fd34cd	Lindhés konditori	Butik i Karlstad	Karlstad	59.377032	13.49753	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6cd83361-8c25-4094-8720-0a16dcb67456	Roffes i Viken	Café/restaurang i Karlstad	Karlstad	59.37726	13.495377	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
353b718d-d851-4ba3-919b-f74842d1fa3f	Happy Kitchen	Café/restaurang i Karlstad	Karlstad	59.380168	13.512344	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff92350b-ac1f-4ea8-b635-7a618eeea0ad	Italiana pizzeria	Café/restaurang i Karlstad	Karlstad	59.37698	13.485943	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
daf2ff8c-c49e-4eb6-bca6-8f344820fd32	Restaurang Frost	Café/restaurang i Karlstad	Karlstad	59.37952	13.504479	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff919c1d-b8a8-41ed-ab77-0fd3ada5734e	Subway	Café/restaurang i Karlstad	Karlstad	59.379171	13.498535	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
da9ba408-0121-4031-9cb7-ac167b46c62f	Pizzeria Akuten	Café/restaurang i Karlstad	Karlstad	59.371398	13.478688	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb66db8e-4e21-4929-8950-d95771734055	Roffes i City	Café/restaurang i Karlstad	Karlstad	59.37944	13.503989	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f50657c1-17b2-4ef1-ac69-23da0e70ebd3	Klippoteket	Butik i Karlstad	Karlstad	59.382178	13.514144	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
74644b22-5aff-4cfb-9e12-935685bd8573	NTI Gymnasiet Karlstad	Skola i Karlstad	Karlstad	59.372381	13.499867	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab7ff927-717a-45bb-bdfb-5e0c08d7165c	Lernia	Skola i Karlstad	Karlstad	59.373937	13.501855	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
902e742a-fd73-41ad-a41f-c31366be97c6	Karlstad Fria Läroverk	Skola i Karlstad	Karlstad	59.373605	13.500996	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
89142e51-c8f5-46bd-bcb9-7b416578a16d	Råtorps Pizzeria	Café/restaurang i Karlstad	Karlstad	59.411056	13.488499	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1fcac4b-2d24-4798-a587-b7065a111b17	Startplats stadsbranden 1865	Historisk plats i Karlstad	Karlstad	59.379303	13.503922	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e102d81-1341-41f7-a46d-b72a9063660c	Karlstad Däcktjänst	Butik i Karlstad	Karlstad	59.380041	13.5151	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca9daa30-63ce-4629-a001-27d45b25eb29	Ferlin steppar	Sevärdhet i Karlstad	Karlstad	59.381169	13.50189	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
401080f6-91c8-4d9e-9140-000d994f22a7	Staty över Gustaf Fröding	Sevärdhet i Karlstad	Karlstad	59.380447	13.501862	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
695ec7d1-4bf7-4047-86e1-162a97e65431	Coop Norrstrand	Butik i Karlstad	Karlstad	59.391637	13.516962	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a8c2f2a-375c-4233-98a6-efad1ea94182	Pinchos	Café/restaurang i Karlstad	Karlstad	59.376723	13.50753	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bfce91a1-2864-4e76-8d95-ac90aa448f6e	Dressmann	Butik i Karlstad	Karlstad	59.379353	13.501261	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7dd46c7-f4a6-459c-8364-f8b686756af8	Coop City Karlstad	Butik i Karlstad	Karlstad	59.380316	13.500792	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8198b196-3c3f-4162-a2f3-73b51fd2b8cb	Orrholmens pizzeria	Café/restaurang i Karlstad	Karlstad	59.368764	13.498934	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4d8fbaf-3534-4749-a77c-1dad3e8ec46c	Orrholmens matservice	Butik i Karlstad	Karlstad	59.368781	13.498968	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4805f67e-68b9-427e-aa84-c343bbd146a6	Shu Uemura Hud & Hår	Butik i Karlstad	Karlstad	59.381889	13.511922	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
adda7776-9bf3-4949-a6e0-e884110acdf5	Scandinavian Gastro Clinic Karlstad	Offentlig plats i Karlstad	Karlstad	59.381524	13.511696	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b3b2e3c-8964-4719-a7a1-c7759a47edde	Vindarnas boning	Sevärdhet i Karlstad	Karlstad	59.381621	13.497654	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f1ae9d7-7d65-46ad-baec-ca2a56bbac34	Café Klaras	Café/restaurang i Karlstad	Karlstad	59.382244	13.495737	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f391c1f2-aa15-468e-9e34-cc6b9ae4c2d8	Jacobson & Schmid	Butik i Karlstad	Karlstad	59.382319	13.496235	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5b3ea49-4606-4dd5-82ec-55131f013e59	Salong Mali	Butik i Karlstad	Karlstad	59.377141	13.491396	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7bf43a2b-694f-4c5c-9272-995fd51f07ce	Salong Moda	Butik i Karlstad	Karlstad	59.370934	13.499466	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6bd207b4-9783-45d8-ba4e-3628f8f9aad0	Josef Salong	Butik i Karlstad	Karlstad	59.377264	13.494825	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a1c0b55-d6bd-4524-a9b0-a46307cfd405	Styling Studio	Butik i Karlstad	Karlstad	59.377321	13.499007	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
751e8f4c-eb19-483e-a432-d64902868224	Daik Kolgrill	Café/restaurang i Karlstad	Karlstad	59.405814	13.568672	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
39ee785b-9df0-4d8d-b7ee-8c893906a1d1	Kronoparkens Jouren	Butik i Karlstad	Karlstad	59.405733	13.568096	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a74045c-aace-496a-aa9c-b3fa1a58bd75	Kanotklubben KPK	Sport & fritid i Karlstad	Karlstad	59.36859	13.510284	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4572f98b-93fa-499a-b487-85d756a01c4e	Claesson's	Café/restaurang i Karlstad	Karlstad	59.381986	13.490622	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b87242e-cdb6-4767-a964-e378d80b2e54	GLG 1:an	Café/restaurang i Karlstad	Karlstad	59.380216	13.547502	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d5540c9-fd5d-4a28-8d81-4a05a2f00018	Zenobia	Café/restaurang i Karlstad	Karlstad	59.386651	13.489119	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2b8e476f-0d90-4470-86d7-742a4c0021e8	Pasha	Café/restaurang i Karlstad	Karlstad	59.382782	13.557931	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9cf00bf-dabe-46f9-b813-fb28017a5f50	Joj Catering	Café/restaurang i Karlstad	Karlstad	59.37244	13.500538	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e855b918-3e78-424c-a85f-ee4d97d83a40	The Bull Bar	Café/restaurang i Karlstad	Karlstad	59.37975	13.504495	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fe6066b-ec32-4f51-b1c0-df76a1bc117d	Combikiosken	Butik i Karlstad	Karlstad	59.383916	13.46312	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
27b26964-292e-4f34-8c72-55738f03aba1	Direkten Campus	Butik i Karlstad	Karlstad	59.411715	13.571657	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5bc0c809-ad79-46ce-881a-3f076aa6d3b2	Number One	Café/restaurang i Karlstad	Karlstad	59.41174	13.571897	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e19df605-7288-448b-b473-6e3929152a5e	Kroppkärrs Pizzeria	Café/restaurang i Karlstad	Karlstad	59.40049	13.547115	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe4a3f0e-27e5-4dcd-8106-b0455acb6e9b	Babyproffsen	Butik i Karlstad	Karlstad	59.387835	13.481789	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7a2ed7c4-abef-4e00-8da0-f251c83910da	Flügger färg	Butik i Karlstad	Karlstad	59.385871	13.480024	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3fc7bf2-405e-48f0-a885-f7aca65f830d	Rusta	Butik i Karlstad	Karlstad	59.387788	13.481605	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d36c73cb-4256-4626-946b-bac771cd0c0d	XL-BYGG	Butik i Karlstad	Karlstad	59.385768	13.478589	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6bc6b8a-c256-4091-bb9b-58f53573ac06	Coop Kronoparken	Butik i Karlstad	Karlstad	59.402607	13.571662	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb4c57f3-ad3b-449e-90f9-f83e626e5665	Hardy's Cykel	Butik i Karlstad	Karlstad	59.375743	13.497178	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
26aa3a22-c344-4818-ba3f-bc504f315c92	Em home	Butik i Karlstad	Karlstad	59.377365	13.444175	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d1eff952-eab1-478b-8101-6c294717766c	Matt-Tema	Butik i Karlstad	Karlstad	59.381994	13.46159	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
72e8c83b-7aa7-4acf-988e-3425dca0edc6	Plantagen	Butik i Karlstad	Karlstad	59.37685	13.443285	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
720a2c59-4fdd-442d-8092-b5c45d77de53	Wermlands Möbler	Butik i Karlstad	Karlstad	59.389191	13.474715	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a36a2ed2-6f7b-41ee-b84d-91bc48c8851a	Folktandvården	Offentlig plats i Karlstad	Karlstad	59.379062	13.50632	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a21fd57-8eea-4980-a615-b919f01d0d78	Texas Longhorn	Café/restaurang i Karlstad	Karlstad	59.379883	13.506703	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
74fad444-75cc-421c-9a0c-01581fa0cf57	Kronoparkens bibliotek	Offentlig plats i Karlstad	Karlstad	59.404271	13.571309	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
25cb25b6-8978-4cc9-8422-fb38248650f8	Kronoparkens Pizzeria	Café/restaurang i Karlstad	Karlstad	59.402849	13.572446	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5a318042-abce-49dd-9b7a-a6c2fe52b702	Pizzeria Mama Rosa	Café/restaurang i Karlstad	Karlstad	59.402872	13.57219	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
11f3da49-2f8c-4b8a-85d9-7e348879f5bd	Parkbadskiosken	Butik i Karlstad	Karlstad	59.402372	13.571122	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a23e214-5536-4de2-9226-efbd07b49d5b	Saxarna	Butik i Karlstad	Karlstad	59.402622	13.572241	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
df22650d-aa02-45ef-8a92-cc30b1c0664e	Din Salong	Butik i Karlstad	Karlstad	59.402859	13.571184	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8faf17d9-3ec1-49fa-b4ea-94bcaf5ffb69	Viking Bilbärgning Karlstad	Butik i Karlstad	Karlstad	59.38314	13.529223	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf89390f-68a8-4890-a4eb-933ff8792458	JW Bil	Butik i Karlstad	Karlstad	59.380893	13.471529	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c652fa2-f121-4c13-993b-f02930270e1b	team Christers salong	Butik i Karlstad	Karlstad	59.379841	13.477398	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
562f227c-f5de-41cb-87b5-9e4c4ed7a85e	Lijo kök	Butik i Karlstad	Karlstad	59.379857	13.476668	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
182f2400-f37a-4a75-a77f-9ec5af0d4cd4	Korsets kapell	Kyrka i Karlstad	Karlstad	59.401698	13.525218	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
81c3e77a-b688-47bb-a420-716df5656b40	Uppståndelse kapell	Kyrka i Karlstad	Karlstad	59.401847	13.52582	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
46d41688-9fb4-4e4e-a448-6526c9031905	Lunchpunkten	Café/restaurang i Karlstad	Karlstad	59.390207	13.479223	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5034b325-7256-4d3c-a6e9-b225c027ca19	Konst i Karlstad	Sevärdhet i Karlstad	Karlstad	59.381021	13.508854	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
029d15df-9682-42d3-8c35-404daa1fdbb3	Konsthantverkarna Karlstad	Sevärdhet i Karlstad	Karlstad	59.379581	13.506453	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b68b34d-085b-47d7-b161-2fbe6ed036f0	India Palace	Café/restaurang i Karlstad	Karlstad	59.379702	13.50449	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6d330e2-f576-44b8-972a-b683cfe75260	Dolce Vita	Café/restaurang i Karlstad	Karlstad	59.379098	13.50361	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
97fa2058-fa89-4f09-8b2f-bb391a7bdeba	Stadium	Butik i Karlstad	Karlstad	59.379105	13.503082	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dcbd97a1-3c87-4060-832e-9af1364a2d59	15-Huset	Butik i Karlstad	Karlstad	59.379116	13.502242	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c284718-1f19-4b6e-ad7b-a34411977995	Ll'Amice	Café/restaurang i Karlstad	Karlstad	59.379894	13.501548	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1e882e3-38b3-4245-8db6-a98edb02a9f6	ICA Supermarket Hagahallen	Butik i Karlstad	Karlstad	59.381953	13.512809	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
729d89e5-c7d3-41cf-ad40-aa21f5c05fd6	Zahraa Cake	Café/restaurang i Karlstad	Karlstad	59.381639	13.512312	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4638348-02ac-4095-918d-869cc58fc285	Beijer	Butik i Karlstad	Karlstad	59.37525	13.524714	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
afe64ddc-4713-47fc-82ac-6d0f40fd3a56	Lamberget Thai Restaurang	Café/restaurang i Karlstad	Karlstad	59.379088	13.532074	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
785f4740-95e6-48e9-abb8-c9546bba8957	brl ljud	Butik i Karlstad	Karlstad	59.387831	13.474666	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
639cde48-d000-460d-ae28-33f67be38d47	Nya Flamingo Pizzeria	Café/restaurang i Karlstad	Karlstad	59.388223	13.516372	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
199647f0-8a1f-40c3-b10a-6c3135edfbd5	Restaurang Sayang Malaysia	Café/restaurang i Karlstad	Karlstad	59.391143	13.515815	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
64bfd58e-8cb0-4b98-88b4-11de541581f1	Restaurant & Pizzeria Vedugnen	Café/restaurang i Karlstad	Karlstad	59.393366	13.516687	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
52c6e626-fdc8-429d-b344-0cd5fb89e1c2	Vårdcentralen Rud	Offentlig plats i Karlstad	Karlstad	59.405175	13.518619	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dfddab0c-fef4-413e-8c53-edb1de2ee490	Villa Rud Café	Café/restaurang i Karlstad	Karlstad	59.400585	13.527049	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ed9ae45-b0d6-4903-9e76-c463365fa0ec	Ruds Pizzeria	Café/restaurang i Karlstad	Karlstad	59.405477	13.520169	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
23d7f7c3-4d72-439b-ac7e-5a2bff39370d	Bari	Café/restaurang i Karlstad	Karlstad	59.398017	13.494582	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
45474254-3003-4658-b940-7f7743575d52	Färjestad Pizzeria	Café/restaurang i Karlstad	Karlstad	59.402752	13.509435	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
50716b56-ae44-470e-b5f1-7ade5a38c0a7	Café Råtorp	Café/restaurang i Karlstad	Karlstad	59.406238	13.494665	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c17d405-69ab-4105-9768-bf6e89449553	Solakoop B&B	Sevärdhet i Karlstad	Karlstad	59.38951	13.494724	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8cea7129-b7b7-4414-a141-0b4801f8b3fd	Wafab Bil AB	Butik i Karlstad	Karlstad	59.384471	13.479131	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d194cde-10eb-4fbf-aed7-6ad594aa423c	Däckia	Butik i Karlstad	Karlstad	59.384007	13.47448	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d01b05dd-71e7-4c6d-9c98-896689894e3b	go'medda	Café/restaurang i Karlstad	Karlstad	59.388899	13.477876	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
94eacefb-6c0d-4dbe-bce6-6bb9861ed5a5	Don Peppino Pizzeria o Restaurang	Café/restaurang i Karlstad	Karlstad	59.385048	13.463597	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a20c8592-9fc2-454b-82a8-d2388a55f584	Sushi Koya	Café/restaurang i Karlstad	Karlstad	59.383163	13.470907	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
12831063-8e19-459e-944a-49b7cca09823	Arken Zoo	Butik i Karlstad	Karlstad	59.375183	13.439176	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4489a98a-259c-421b-b0b9-f15d2db7ab0e	Care of Beds	Butik i Karlstad	Karlstad	59.375336	13.439127	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
03a619d7-3a37-4796-a7a6-380340cc4cc8	Team Sportia Karlstad	Butik i Karlstad	Karlstad	59.375019	13.439391	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ae10b14-5924-448a-8ab0-9c77d857ddeb	JYSK	Butik i Karlstad	Karlstad	59.375106	13.440034	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9bf74c2e-5c8f-4290-9622-7b68afd0ac66	Bellevue Pizzeria	Café/restaurang i Karlstad	Karlstad	59.368001	13.452866	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9d6aea9-2897-49b1-8d86-f934d25b11b3	Wermland Opera/Lilla Scenen	Sevärdhet i Karlstad	Karlstad	59.377894	13.478678	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f4459dc-84e5-44b2-bc58-52a4b4a660eb	Kvarnens pizzeria	Café/restaurang i Karlstad	Karlstad	59.375113	13.483664	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
04d0dba7-ee58-4d51-ae6d-7d58fe211a4d	Kronoparkens Moské	Kyrka i Karlstad	Karlstad	59.405958	13.568171	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d183ee5-e4eb-42ce-b7c6-8c2057a49ba9	Systrarna Larssons hembageri	Butik i Karlstad	Karlstad	59.346224	13.500311	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9bc324ae-ea1d-4a11-b7e3-edaa2183a37f	McDonald's	Café/restaurang i Karlstad	Karlstad	59.383659	13.47651	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1dfb4004-8549-4fe9-8710-19050de92c8c	H&M HOME	Butik i Karlstad	Karlstad	59.379327	13.502883	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
975471f4-77b7-42da-b72d-379c49f51f6b	H&M	Butik i Karlstad	Karlstad	59.37933	13.502646	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a29ae253-7c31-4d01-941f-77ad546f41b5	Myrorna	Butik i Karlstad	Karlstad	59.386762	13.480125	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
11dbeea7-7d78-461d-bdf4-6b1a227b021f	Cityverkstaden	Butik i Karlstad	Karlstad	59.387113	13.479902	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e9828e7-de8d-40b6-8dc3-eeba3ca94b29	Gengåvan Secondhand Karlstad	Butik i Karlstad	Karlstad	59.391022	13.472542	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc1566d5-7eda-4622-a57c-8f432b6e1965	Pizzeria 91	Café/restaurang i Karlstad	Karlstad	59.406458	13.517912	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffb407ae-dd0c-410f-a6e4-b667a3d20bfe	Stuvbutiken	Butik i Karlstad	Karlstad	59.388179	13.478283	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
85cd6a0d-0821-4220-9288-7edd24d2c1f4	Elon	Butik i Karlstad	Karlstad	59.38913	13.48081	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
989eb92e-99e1-47bb-a264-f0ca5e2d4e84	Autovåx Bil	Butik i Karlstad	Karlstad	59.392224	13.472937	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0610d49d-fa32-4c56-92f7-105ef04a432f	Colorama	Butik i Karlstad	Karlstad	59.392147	13.474605	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
48c312d2-85f9-43aa-8100-0cb91fdbe5ae	Guldapan	Café/restaurang i Karlstad	Karlstad	59.381652	13.504158	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1cf37d3-e48f-4e75-9e4a-486e2e7b8677	Trähangaren	Sevärdhet i Karlstad	Karlstad	59.377213	13.455651	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b010558f-55d9-4f66-bd1f-e3b2c7b38333	Marieberg	Historisk plats i Karlstad	Karlstad	59.394543	13.450089	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
e295fbf6-b65e-487b-98ce-29e0f975a7ce	Gammelgården	Sevärdhet i Karlstad	Karlstad	59.367927	13.482277	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
3429f0a9-cf54-4913-8aeb-58ef7702205f	Dye Domarring	Historisk plats i Karlstad	Karlstad	59.407459	13.475462	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
61234079-fc07-421a-bb9f-6d31d27b4764	Naturkompaniet	Butik i Karlstad	Karlstad	59.379788	13.501932	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c160711f-f682-49c2-ab0a-9edd3bdc08ed	Mekonomen	Butik i Karlstad	Karlstad	59.388098	13.473357	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee86c7d8-6ce1-4fc8-b743-1edf70f5c702	Swedol järnhandel	Butik i Karlstad	Karlstad	59.38738	13.47479	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c436eed-70ea-44dc-82cb-2469c318b2bb	Orientalisk Supermarket	Butik i Karlstad	Karlstad	59.38879	13.479937	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc7f6c7c-acc0-41d8-9bf3-a9937c45e1f6	Autoekonomi i Karlstad AB | BDS bilverkstad	Butik i Karlstad	Karlstad	59.389527	13.476686	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e7b00c8-ecff-4f97-99d4-cbf46a2f872e	Östpendeln second hand	Butik i Karlstad	Karlstad	59.38991	13.476938	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
01e793ef-2e8d-4ce7-aa26-58a8b19052da	Sweish Smart Repairs	Butik i Karlstad	Karlstad	59.391612	13.477157	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad403eba-3c17-42b7-8e85-c0cea58caa0e	Meca Sweden AB	Butik i Karlstad	Karlstad	59.391552	13.478911	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
35612754-5e5c-4283-a48a-363609d9fd21	Karlstads gästhamn	Sport & fritid i Karlstad	Karlstad	59.368303	13.51696	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
05d32491-f253-4571-be95-be840f00e7e0	Hjertmans Karlstad	Butik i Karlstad	Karlstad	59.382518	13.528778	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1f8478f-a040-4953-8e3b-f8edb3af07c0	Ruds Café & Inn	Café/restaurang i Karlstad	Karlstad	59.405548	13.520135	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6dea2b3c-96d6-436e-b166-e462ab863a23	Solareturen	Butik i Karlstad	Karlstad	59.380341	13.46712	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d8c4527-b6e1-4bc7-af79-33856d2127db	Återbruket	Butik i Karlstad	Karlstad	59.37674	13.55379	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
18071dd1-0a46-4449-9152-c4c8fc5081a0	Circle K	Butik i Karlstad	Karlstad	59.380589	13.465161	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3ce660b-6fbb-40e1-8737-1ad8b380ec16	Elias Salong	Butik i Karlstad	Karlstad	59.377514	13.51562	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7104e6b0-175e-4a49-9395-6ee91eab1969	Café Träffpunkten	Café/restaurang i Karlstad	Karlstad	59.375051	13.479873	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2c76ae0-f7e3-4711-96dc-d9578333ff6e	Lemon Livs	Butik i Karlstad	Karlstad	59.374295	13.481894	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
79de2608-1872-4932-b4e3-7bf3cc8e1d79	Butik Träffpunkten	Butik i Karlstad	Karlstad	59.375027	13.480098	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fba6d42f-738d-4eb3-a282-e4133687e33e	Florist54	Butik i Karlstad	Karlstad	59.374991	13.479454	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
40af1567-ef58-462d-abbd-97a3160a10ec	Olssons Bazar	Café/restaurang i Karlstad	Karlstad	59.376032	13.505752	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4265e6a2-6e20-4fc6-95d8-f6a41dbb9eed	Barón	Café/restaurang i Karlstad	Karlstad	59.380338	13.502899	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3067120e-0f99-463d-b838-db5ce2fc950e	Löfbergs Rosteri & Kaffebar	Café/restaurang i Karlstad	Karlstad	59.377231	13.505527	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
48ec3122-573f-49eb-bca9-8c2aa17bc68a	Kebabfabriken	Café/restaurang i Karlstad	Karlstad	59.378841	13.499515	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bac84f5d-e37a-4ffe-98c5-c8b3e25a2967	Carli	Café/restaurang i Karlstad	Karlstad	59.378822	13.49903	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea3ca0e7-ed52-4c7e-a13d-84a0afbcbf22	Hörnet	Café/restaurang i Karlstad	Karlstad	59.381315	13.502048	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6cccd8d4-3a26-40a2-92ec-1c6fa5a3eb9c	Cazanova	Café/restaurang i Karlstad	Karlstad	59.381298	13.502718	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
eba1d425-f9f8-4f04-a0f0-7a79c9e978cb	Citygrillen	Café/restaurang i Karlstad	Karlstad	59.381317	13.501166	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
76dc4230-9bda-414f-9660-0293c7e7d704	Kjell & Company	Butik i Karlstad	Karlstad	59.379671	13.500452	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9422230d-dd05-4a0b-8997-9125859cacb6	Clas Ohlson	Butik i Karlstad	Karlstad	59.38002	13.500774	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3bb0448a-c66e-4c5a-b2cc-69f7c0c2889d	Akademibokhandeln	Butik i Karlstad	Karlstad	59.379997	13.500964	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
be1b7804-f8c2-47f8-99c1-f06a4e99c364	Deichmann	Butik i Karlstad	Karlstad	59.379943	13.501093	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c06c2917-89fd-42e2-baa0-a016cf9ecece	Knastret	Butik i Karlstad	Karlstad	59.379959	13.504633	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
495b980d-2884-41f4-9588-6b419fd75d1e	Helmia Bil	Butik i Karlstad	Karlstad	59.374125	13.505676	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6e91117-f224-4077-96f5-09ce03f11b56	Mitra Hair Design	Butik i Karlstad	Karlstad	59.375001	13.506217	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
011e4054-97d2-4c3c-b8fe-45e35971061a	Artisan Bread	Butik i Karlstad	Karlstad	59.389931	13.4912	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce802e65-38cf-496a-a601-7a7427967dce	Ekolea	Butik i Karlstad	Karlstad	59.380388	13.500293	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5db22512-dcbb-479c-8212-9a586bc9109a	Kardemumma	Butik i Karlstad	Karlstad	59.379824	13.500772	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0cdb8c0-7145-415e-8022-dff2727d21ac	Yomo	Café/restaurang i Karlstad	Karlstad	59.379783	13.499748	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
43b69ddc-ee94-4acb-918c-27765c533a6d	HiFi Klubben	Butik i Karlstad	Karlstad	59.378406	13.497779	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
de28014d-bcde-4b41-89b6-1367a1488d43	Naviero	Café/restaurang i Karlstad	Karlstad	59.375457	13.509992	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3cdeb587-beef-4626-ba7d-1e77def35979	Castle of Antep	Café/restaurang i Karlstad	Karlstad	59.379193	13.496298	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc144c98-857d-43cc-8576-a9dbd6c5e13d	PostNord Företagscenter	Offentlig plats i Karlstad	Karlstad	59.383575	13.522958	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7749ea6c-e613-4b7c-b424-10495e3cb05b	Sixbackens Hembageri	Butik i Karlstad	Karlstad	59.380553	13.461623	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fa7a7be-d65a-459f-b191-135c31163706	Folkuniversitetet	Skola i Karlstad	Karlstad	59.380357	13.498332	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4135eb97-9287-44b8-9cd5-61705bf83a7f	ICA Supermarket Wallinders	Butik i Karlstad	Karlstad	59.392787	13.516421	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
662fc4dd-32e6-46f4-a175-a4eac3efe31e	Med ett leende	Sevärdhet i Karlstad	Karlstad	59.376396	13.50585	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2cc5ab2-d9b0-46b8-afc4-f2604b00a8dc	Gamla kranen	Historisk plats i Karlstad	Karlstad	59.376266	13.506156	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
87a71fd2-46d3-4258-94b9-5ac7ba49df8f	Torgdammen	Sevärdhet i Karlstad	Karlstad	59.383254	13.502629	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2486c37-d4b2-42bc-ba1e-1bcde4df7e4a	Bokmoln	Sevärdhet i Karlstad	Karlstad	59.38324	13.502106	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
95b350be-fbf0-4634-8465-963aacf9dd19	Hand i hand	Sevärdhet i Karlstad	Karlstad	59.384433	13.500277	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8069364-6220-4c24-a143-60065db0dbce	Dimman	Sevärdhet i Karlstad	Karlstad	59.376647	13.492968	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4ad69ea-de2b-4849-8418-382aff414604	Pojken och fisken	Sevärdhet i Karlstad	Karlstad	59.376887	13.493362	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
9312dabd-0236-4481-8282-586bebeb858e	Liten dansös	Sevärdhet i Karlstad	Karlstad	59.380169	13.508923	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
3219fe61-78be-415a-adb6-c3e656f6ea08	Uppståndelse	Sevärdhet i Karlstad	Karlstad	59.381139	13.507041	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9af9770-e6fa-4c2c-ba1c-c1e4690fd09d	Sveno Elfdalius	Historisk plats i Karlstad	Karlstad	59.381221	13.506558	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b33fe54-9822-43ad-b0dd-3b78611f5a1f	Johan Alfred Eklund	Historisk plats i Karlstad	Karlstad	59.381311	13.506048	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
13cdaeec-ef88-434f-9a62-ec233f7c2a12	Frödingherm	Historisk plats i Karlstad	Karlstad	59.384748	13.499756	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3e78ab2-d09a-4485-80ab-bffe63c19b82	Och solen har sin gång	Sevärdhet i Karlstad	Karlstad	59.38426	13.499546	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
53233f60-ba51-42b4-8a57-62ec2b216008	Efata – som tänkaren	Sevärdhet i Karlstad	Karlstad	59.379308	13.500279	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
72ecb58c-4e15-4d4d-84ae-42980b5357d2	Kongen och Prinsen	Sevärdhet i Karlstad	Karlstad	59.383992	13.501041	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
7cb57838-f073-455b-81f9-b2cca526522a	Le banc noir	Sevärdhet i Karlstad	Karlstad	59.385501	13.499023	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca83be05-7a6f-4e08-b9ab-322fb75374ce	Odd Fellow Orden	Offentlig plats i Karlstad	Karlstad	59.375752	13.500139	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
968bd7da-7843-4d8f-853a-e1cf4018d521	Bastard Burgers	Café/restaurang i Karlstad	Karlstad	59.376398	13.508071	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
99488ffe-b093-4773-b11d-e1d917a9bb5b	Kronans Apotek	Offentlig plats i Karlstad	Karlstad	59.379351	13.501423	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef4da523-0470-4083-8326-61f431b52a65	Indiska	Butik i Karlstad	Karlstad	59.379449	13.500756	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
845c2060-8bc1-4e32-b9fb-05591a76df28	Niji Sushi & Pokebowl	Café/restaurang i Karlstad	Karlstad	59.379374	13.499797	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e08c995-cb6b-496c-8169-1a24b3d9e08c	Rabalder	Butik i Karlstad	Karlstad	59.379147	13.500758	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7a521b8e-0a89-4d73-938d-956cf137577d	Synsam	Butik i Karlstad	Karlstad	59.379145	13.500876	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce505c69-2eff-4121-9bd7-ff18d39e8bb8	Hemtex	Butik i Karlstad	Karlstad	59.379013	13.500011	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc80417f-e37b-45f4-ab17-fcd3f19b0ca1	KappAhl	Butik i Karlstad	Karlstad	59.37916	13.49964	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
901edc01-472a-4c88-9f4d-aa1808fcc878	Karlstad grillen	Café/restaurang i Karlstad	Karlstad	59.3795	13.503993	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e63478b-55de-4215-bc02-d5432c3fc14a	Westerlunds Guldsmeder	Butik i Karlstad	Karlstad	59.379558	13.503996	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
070aeb13-30a9-4a6d-9843-064e6c494fdf	Salong Alexander	Butik i Karlstad	Karlstad	59.379542	13.501917	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f2fdd62-ce92-4946-9519-ad21cc7b979d	Studio	Butik i Karlstad	Karlstad	59.379663	13.501924	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3be6f25-7c5f-442e-be06-8ddc8287f534	Mollstedts ur	Butik i Karlstad	Karlstad	59.380013	13.501947	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ebae62d8-1d74-40f6-b0a4-0dd985a9c19e	Liljas väskor	Butik i Karlstad	Karlstad	59.380351	13.501969	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac971f2b-33a0-4a29-bf26-f517234f3460	MaxTek	Butik i Karlstad	Karlstad	59.378474	13.503948	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9162e10-4193-439a-a629-69008c0fbac5	Anonymous ink	Butik i Karlstad	Karlstad	59.379407	13.49775	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
275247fc-1e91-4020-9920-6860e5a6f24a	Shine Salong	Butik i Karlstad	Karlstad	59.381468	13.50167	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
72c7b320-24e2-4a65-aa5f-184df32a62e9	KungsLyktan	Butik i Karlstad	Karlstad	59.381311	13.501426	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
77cfd969-bb44-4347-b34a-3ca76d7a3846	Ticket	Butik i Karlstad	Karlstad	59.381309	13.501596	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4bc4ec81-852a-4f12-a5f8-f2ebe95d5b25	Nonna Grassa	Café/restaurang i Karlstad	Karlstad	59.381532	13.502044	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
292cf961-453d-4c8a-83fa-273594e72b93	Grym	Butik i Karlstad	Karlstad	59.381852	13.502064	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
04ffda26-2bde-4dba-b0c9-3c2aa82a53cf	Värmlands hemslöjd & design	Butik i Karlstad	Karlstad	59.38203	13.502078	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4255695-5a95-4e3f-a7dc-ca97fe7471d7	Ahnö vapen	Butik i Karlstad	Karlstad	59.382082	13.502305	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0bebec99-ccf1-4f0e-807e-bf88a7386d9d	Stick & sy	Butik i Karlstad	Karlstad	59.382073	13.502885	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
57db9fef-41fd-49f7-95a1-7bccfcdb0d2d	Hennig Optik	Butik i Karlstad	Karlstad	59.382072	13.503017	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d031cef7-e8c8-40cd-999c-b3f3fac0d453	Fisheye Ink	Butik i Karlstad	Karlstad	59.382063	13.503573	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2c2ffc0-df3c-4a26-8724-e160237e4f9e	Carlsta sol & spa	Butik i Karlstad	Karlstad	59.382219	13.503974	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d992404-1ebb-45fd-93cd-1842f2969936	Salong Idun	Butik i Karlstad	Karlstad	59.381986	13.504623	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3fa2f83-d353-4a9a-b09d-8d820fe26a6f	Hemmakväll	Butik i Karlstad	Karlstad	59.381503	13.504599	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
be796214-c038-4e89-974a-c5146203e2d4	Direkt Optik	Butik i Karlstad	Karlstad	59.381723	13.504611	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3cba0c66-02c6-4a73-bd4e-198d5bccde61	Swenströmskas Stenugnsbageri	Butik i Karlstad	Karlstad	59.381859	13.504621	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
74dfbbac-7d65-47d4-a580-96c728fa53e2	Östra Torggatans Thaimassage	Butik i Karlstad	Karlstad	59.378555	13.503951	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7cf7bdc-34cb-4467-b4ae-61eddbf0896b	Refixa	Butik i Karlstad	Karlstad	59.381832	13.504165	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
031e2463-2d08-426a-bfbf-80ea90f103be	Jakobine Boutique	Butik i Karlstad	Karlstad	59.381322	13.500946	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee859a5d-4282-4de9-8064-7560497672b6	Villa Gräsdalen	Sevärdhet i Karlstad	Karlstad	59.37727	13.453905	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d242e449-0da5-4c23-b466-60ae6f03cf36	Levi's	Butik i Karlstad	Karlstad	59.379975	13.500992	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ecec852-00b4-4fd2-8cf4-f80c0f0c00a2	MQ	Butik i Karlstad	Karlstad	59.380021	13.500647	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4825e0a8-22a1-47a3-a165-467da616ad0d	New Yorker	Butik i Karlstad	Karlstad	59.37995	13.500309	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f21210b-8533-4c60-8ead-e961cd3b49bc	Saras lågpris	Butik i Karlstad	Karlstad	59.380013	13.500494	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
702d188d-4f94-4d93-900f-9de3813340eb	Väskan	Butik i Karlstad	Karlstad	59.380326	13.500938	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
de9ad411-a571-48f7-9b59-779b61373837	Walthers & Elfrida	Butik i Karlstad	Karlstad	59.379907	13.499105	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef6b8d3b-c079-4333-a988-2c1be0c33e96	Apotek Hjärtat	Offentlig plats i Karlstad	Karlstad	59.380174	13.500785	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7bb25224-3d8e-47ca-b5e1-554c41443e01	Panduro	Butik i Karlstad	Karlstad	59.379739	13.500317	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab74bce4-83c4-41f7-9f89-f1b17faf42cf	Drakes blommor	Butik i Karlstad	Karlstad	59.379801	13.499101	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b410caa-6d71-456e-a95b-093e368102bc	Synoptik	Butik i Karlstad	Karlstad	59.379427	13.500865	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
33f8d099-0ee5-4117-b83a-0f69fedf2e77	Guldfynd	Butik i Karlstad	Karlstad	59.379579	13.500873	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ecf0ca5e-defe-4894-b7ac-91e938f79ad1	Glitter	Butik i Karlstad	Karlstad	59.37953	13.500871	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a6175151-fe29-4289-9c83-00022d2239ca	Guld & Silver Design	Butik i Karlstad	Karlstad	59.379674	13.499092	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bec5c721-1d6c-4fe0-8f2a-741f0adbaf28	Charlene Nails	Butik i Karlstad	Karlstad	59.379858	13.499101	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac8d75b1-d628-4678-8074-369d8a019a1d	Nova	Butik i Karlstad	Karlstad	59.379716	13.499093	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a432c255-df98-42a9-9b97-806698fd4f75	Ur&Penn	Butik i Karlstad	Karlstad	59.379606	13.499061	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6789ee35-3ec9-4a81-9eaf-e671fdfc8d46	Stolt	Butik i Karlstad	Karlstad	59.375993	13.49064	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e8dbc76-7d02-4762-ac0e-3d9754521e69	Syateljé Siluett	Butik i Karlstad	Karlstad	59.376268	13.490356	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6885059f-b610-4f0c-9a06-213bad138f95	Hud & kroppskliniken	Butik i Karlstad	Karlstad	59.374573	13.488262	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e5927d7-dc44-45d7-8483-2fdab504a4d9	Arthouse	Butik i Karlstad	Karlstad	59.374439	13.488576	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6530a1c4-eb06-4fe8-bcd7-35beed72065a	Lagerhaus	Butik i Karlstad	Karlstad	59.379323	13.503739	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9185759a-6675-4673-9fc3-06bb92a802f0	Village Tandoori	Café/restaurang i Karlstad	Karlstad	59.381053	13.508143	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
97d57c05-3d94-4637-934e-46b5fc6c6ac8	Wooden Giraffe	Sevärdhet i Karlstad	Karlstad	59.37605	13.492931	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
13643f29-8c60-4903-bf56-f84859ea1584	Wooden Zebra	Sevärdhet i Karlstad	Karlstad	59.376058	13.492658	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a279c86-4eb1-4946-99d2-35834e32ab79	Carlstad ölhall	Café/restaurang i Karlstad	Karlstad	59.378394	13.498998	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c843480-396b-44b1-97f1-056548f4c685	Sushi Yama	Café/restaurang i Karlstad	Karlstad	59.379859	13.500165	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
251a3562-241c-4476-aa70-02b72d5bef95	Anni Sushi	Café/restaurang i Karlstad	Karlstad	59.38038	13.500799	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b027a15-6d21-4983-a2e0-e62675389501	Food by Efendys	Café/restaurang i Karlstad	Karlstad	59.379806	13.500161	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2b312c94-a594-4e54-8302-6340593b322b	Go Banana	Butik i Karlstad	Karlstad	59.379208	13.49552	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a089649b-1b08-4a9f-93d9-1a79c3ba8fad	Wåxnäs Pizzeria	Café/restaurang i Karlstad	Karlstad	59.385046	13.468886	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
74594173-89cd-453e-bef3-545771e3499a	Partille Bilringar	Butik i Karlstad	Karlstad	59.379988	13.466121	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
797eb6b5-cf87-42ab-b4c4-330b9e894d4b	Lexus Karlstad	Butik i Karlstad	Karlstad	59.390025	13.481314	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
61218c33-d6a3-4497-8d3f-b1f51a543960	Bilcenter	Butik i Karlstad	Karlstad	59.391473	13.478213	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c4162c2-ae16-4eda-aed2-2b74bdcbd556	B&T Bil	Butik i Karlstad	Karlstad	59.391926	13.47544	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
91f14f2c-6423-48c7-b865-3fad9254c02b	Tuppen	Café/restaurang i Karlstad	Karlstad	59.389662	13.474866	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd0fa9a4-3280-4029-95ae-8f99b98c7f98	Vändande lo	Sevärdhet i Karlstad	Karlstad	59.387687	13.507683	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
871a6dc5-5603-49af-9163-60fb6a857517	PostNord Logistics	Offentlig plats i Karlstad	Karlstad	59.378485	13.562932	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
621a4c88-0099-42b2-96a1-09e154f4e9ca	Megashop.se	Butik i Karlstad	Karlstad	59.38171	13.52973	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
371912b1-dc63-4505-a3a3-7f01ed5945c5	Ankdammen	Café/restaurang i Karlstad	Karlstad	59.376638	13.50716	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c3db9a8-be91-4ba1-90fe-0107a73eaeac	K-Rauta	Butik i Karlstad	Karlstad	59.379544	13.436565	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c300fa24-4a9b-487c-b25e-400e1b50fcba	Lion Bar Karlstad	Café/restaurang i Karlstad	Karlstad	59.379651	13.504488	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
902512f6-0f36-45f5-a39b-e3697998433e	XLFOOD	Butik i Karlstad	Karlstad	59.379436	13.465819	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb66985c-37aa-4bd1-abe4-d55914fa3142	Kinoko Sushi	Café/restaurang i Karlstad	Karlstad	59.37903	13.496534	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
87a6f53e-8529-4471-97b5-63082eb32e1f	Kinoko Ramen - Madam Kong	Café/restaurang i Karlstad	Karlstad	59.37883	13.496516	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe6bb15e-c3d6-48ad-83e4-aaef593150c0	Naviero vinbar	Café/restaurang i Karlstad	Karlstad	59.376337	13.508206	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
559b49f1-229b-4518-b87b-24c87fdcf620	ericsson&co	Butik i Karlstad	Karlstad	59.374518	13.507652	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ba8665d-ff53-4a8b-b701-e06afec745de	Santa Haga Barbershop	Butik i Karlstad	Karlstad	59.380248	13.512264	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4c051d1-7ed5-4007-a74d-f3b425698105	Haga Hud & Fot	Butik i Karlstad	Karlstad	59.380446	13.512045	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd87b148-86a2-42f2-b836-8ac971473ea7	Renässansboden	Butik i Karlstad	Karlstad	59.38066	13.511803	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e15615c-5e2c-46d3-9fc3-77294faff7f7	Salong YOU	Butik i Karlstad	Karlstad	59.375171	13.510627	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d95d436-bfca-4d14-a697-f8120dca7175	Gustaf Adolf Andersson	Historisk plats i Karlstad	Karlstad	59.381082	13.51152	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
af8baf12-a865-4330-ae5a-c1962e5445f4	ClippCraft	Butik i Karlstad	Karlstad	59.376012	13.482757	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5403f95-b7de-4836-bcd9-028ec51fabd1	Willys Karlstad Bryggudden	Butik i Karlstad	Karlstad	59.377372	13.508218	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7c2d41b-2f56-4bdc-8e03-563280582d83	Good Guys Beer & Pizza	Café/restaurang i Karlstad	Karlstad	59.376562	13.5082	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
298d37c0-95bd-4370-83b7-43154f054bb2	ICA Supermarket Fanfaren	Butik i Karlstad	Karlstad	59.38336	13.486264	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
93a99ec2-c934-4624-8dba-d5f6f880491f	Lily Sushibar	Café/restaurang i Karlstad	Karlstad	59.402519	13.572226	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8ad781a-751d-49c3-bd48-6f9a38720f32	Sven-Erik Magnusson	Sevärdhet i Karlstad	Karlstad	59.386308	13.498875	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
bdd5803b-c39b-4f0c-81d9-9b58d7985ea3	Forat Livs	Butik i Karlstad	Karlstad	59.402374	13.57256	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
165ac22b-acd8-489e-abb2-35f9617e0681	Blackstone Steakhouse	Café/restaurang i Karlstad	Karlstad	59.376285	13.508312	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
248de5a5-3110-42b0-bc34-34b47a3bcdc4	Coop Strand	Butik i Karlstad	Karlstad	59.380748	13.470534	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e2a22ec-7011-45db-b51b-8d9e5f7b5aac	Coop Råtorp	Butik i Karlstad	Karlstad	59.399448	13.496001	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e60b33e6-2f80-4754-a386-c55a4d4f3545	Rondellen Pizzeria	Café/restaurang i Karlstad	Karlstad	59.383821	13.463087	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ecde595-af18-4d76-ad3a-1f90e96d0eb9	Goda Jorden	Butik i Karlstad	Karlstad	59.389402	13.474855	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
064d82ef-6946-45c4-891c-ee58cce3e371	Lekande barn	Sevärdhet i Karlstad	Karlstad	59.379965	13.518002	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
41c9c1a2-fed2-4e85-ad8e-154854649c8a	XenTattoo	Butik i Karlstad	Karlstad	59.380295	13.501487	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b27dd02-b0ae-4ff7-8605-f2f68cacc5a0	Vindöga	Sevärdhet i Karlstad	Karlstad	59.377265	13.4813	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9cd44af-d670-455a-8423-5b05623f1787	Glasögonmagasinet	Butik i Karlstad	Karlstad	59.3794	13.498381	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5be8989b-4461-4b75-9140-d95037536667	Anettes Bed & Breakfast	Sevärdhet i Karlstad	Karlstad	59.3776	13.530919	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ba03a8e-45f3-4c33-ade9-55f082f76159	Kroppkärrs Bed & Breakfast	Sevärdhet i Karlstad	Karlstad	59.398548	13.547616	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
45cd12e6-7483-42d7-ab26-ad0891bcd57d	Vidars fiske	Butik i Karlstad	Karlstad	59.376039	13.488605	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc850e42-0575-4f1a-912d-d8ab5efa83f5	Speed Bike	Butik i Karlstad	Karlstad	59.377126	13.492476	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
54484abd-6629-41fe-a1fd-800ea2f05774	Du1	Butik i Karlstad	Karlstad	59.375721	13.491545	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aff27985-5f96-4e74-96ab-1d84b1ea1255	Skogshyddans Dirty Restaurant	Café/restaurang i Karlstad	Karlstad	59.382029	13.504945	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8236ce13-b82c-4f37-b932-90136c0192a2	Röda Korset Second hand Karlstad	Butik i Karlstad	Karlstad	59.37928	13.506528	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
791adce3-e157-49be-8591-45408d4e198d	Blomsterlandet	Butik i Karlstad	Karlstad	59.388434	13.475229	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0eaabf9f-9d00-4ce2-bd2e-eeeb125fc46b	Snabbgross	Butik i Karlstad	Karlstad	59.383334	13.558096	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
626ec1f7-4b96-48b7-8c77-2bfbb62acac4	Nordmarkens Motor	Butik i Karlstad	Karlstad	59.388546	13.476366	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0768f00e-4623-4d5a-8b1c-adcf692d3eb7	Qstar	Butik i Karlstad	Karlstad	59.380382	13.56068	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f4bb277-89bc-4ccd-83e2-d530c0b7619b	Handbokbindare Olof A. Myrin	Butik i Karlstad	Karlstad	59.37774	13.51597	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1481eb87-4de0-492b-9a4f-628bc55f359d	Direkten, Nöje Casablanca	Butik i Karlstad	Karlstad	59.393139	13.516526	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
66dbf8d1-7acb-45b7-8905-212bf6b9b5b8	En Slapp En	Sevärdhet i Karlstad	Karlstad	59.383999	13.500668	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b54e0fb-361f-46b1-b931-1db6118fccdb	Må Få Löka Lite	Sevärdhet i Karlstad	Karlstad	59.384158	13.500754	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
0780b606-39c0-4148-8179-1990cf4f4811	Motor Trend - Karlstad	Butik i Karlstad	Karlstad	59.390012	13.481347	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
68feaf56-d587-449e-9e7a-bd88b1fa3d65	Klara Jour Livs	Butik i Karlstad	Karlstad	59.384135	13.495074	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
441ebf2c-4ed7-41b3-b17b-cdb0f0990e55	Vin O Deli	Café/restaurang i Karlstad	Karlstad	59.380148	13.498045	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
77c37c97-722a-49d9-926a-2246cd33dc3c	Byggmax	Butik i Karlstad	Karlstad	59.380295	13.52559	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f62ba3c-506d-4344-a558-ea647a781f64	Interaktiv Teknologi AB (ITtek)	Butik i Karlstad	Karlstad	59.405724	13.520148	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
47d1dbc6-1a05-4523-9d74-074fbd6c2f46	Zócalo	Café/restaurang i Karlstad	Karlstad	59.379362	13.499994	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
91e7c503-7092-47f5-bbce-c117e85d05ab	Bakgården Pizzeria	Café/restaurang i Karlstad	Karlstad	59.390182	13.490338	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e8e64d74-cfeb-458a-a5e3-a670e7c6167d	ChopChop Asian Express	Café/restaurang i Karlstad	Karlstad	59.383617	13.477298	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5422d3a3-0262-411a-8abd-a89201f06826	OnWater	Butik i Karlstad	Karlstad	59.368223	13.557453	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
00d09033-113d-498f-9f3f-0db0c8141559	Bryggeriarbetaren	Sevärdhet i Karlstad	Karlstad	59.382422	13.500559	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
a36df30b-babc-48a1-9a9f-96ec7dd0dec9	Cellisten	Sevärdhet i Karlstad	Karlstad	59.382071	13.497787	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
64cacccf-0011-40ed-aedf-c78edc7f0ace	I Fredens Tjänst	Historisk plats i Karlstad	Karlstad	59.388005	13.494954	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7c2d158-7e2c-4df6-8bc8-c12389d357c4	K Phone Service	Butik i Karlstad	Karlstad	59.402716	13.572342	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b05c7d31-d98f-4e92-9a50-233ec80c8a03	Karlstad Livs	Butik i Karlstad	Karlstad	59.402785	13.571088	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4f3bca5-3ac5-4289-9c86-1a3204a320ca	Parkens Barnershop	Butik i Karlstad	Karlstad	59.405698	13.56804	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a1293e5d-3a91-4450-8035-370ea8786274	Coop Tullholmen	Butik i Karlstad	Karlstad	59.373607	13.503599	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
44d159fe-9b0d-4b36-8fb3-3c132184e927	Roadrunner	Sevärdhet i Karlstad	Karlstad	59.398153	13.496472	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1882154-0671-4d3c-977e-80b3e95dcf40	Sooshi	Café/restaurang i Karlstad	Karlstad	59.381774	13.504615	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d051fa5-c1ae-4d95-bbe6-83ef2eab7790	Varg	Sevärdhet i Karlstad	Karlstad	59.369742	13.486679	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
f61cad71-0ec5-427c-9bc5-18cb9a53c003	Support i Karlstad	Butik i Karlstad	Karlstad	59.407177	13.525766	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5280f64c-a474-41b7-98ae-3afab9a0e402	Lolas	Butik i Karlstad	Karlstad	59.380304	13.505111	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0040fd7d-f4c8-4475-b5d3-500f201cff65	Button Town Cafe	Café/restaurang i Karlstad	Karlstad	59.356798	13.459384	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
be997d54-2d5d-438f-bdb2-d449e88460aa	Swetex	Butik i Karlstad	Karlstad	59.378641	13.540577	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa204723-1a53-4cc5-a67d-117b946e58c8	Karlstads Kirurgiska Laserklinik	Offentlig plats i Karlstad	Karlstad	59.40606	13.502366	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
de4e87a2-49f9-4f6e-b535-dd26aa52735a	Molkoms folkhögskola, filial Karlstad	Skola i Karlstad	Karlstad	59.372717	13.500427	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f5fec35-93e5-4818-aae2-6927e40069f3	Nordic Internation School Karlstad	Skola i Karlstad	Karlstad	59.372457	13.500121	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3cf3511-4011-4a25-a28d-016e62dfece2	Öppet klot	Sevärdhet i Karlstad	Karlstad	59.373822	13.477079	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
711d690f-39ae-4a14-b575-87e6fa371951	Specsavers	Butik i Karlstad	Karlstad	59.379086	13.504443	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7278528-6a1b-4652-9af1-8ce9d52d37b5	Clipodrom	Butik i Karlstad	Karlstad	59.381594	13.504151	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5db62898-3163-4145-8869-5a6fea6121ef	Babas	Café/restaurang i Karlstad	Karlstad	59.380356	13.50218	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d1ccfd56-4c42-467c-9835-f7af68c2e98e	Optikhuset	Butik i Karlstad	Karlstad	59.380218	13.501955	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
63da0b9a-6071-4bd8-9931-951a3344b3a3	Hair Office	Butik i Karlstad	Karlstad	59.380205	13.501574	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba53fc5b-bbb2-4600-8f8f-0a1a080af7c7	cut&color	Butik i Karlstad	Karlstad	59.380269	13.501577	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f02ac954-8516-445e-98cb-24a0a7708069	Radio Teknik AB	Butik i Karlstad	Karlstad	59.382943	13.505797	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad68370f-5ef9-41aa-ac0a-c30ecce7ceea	Normal	Butik i Karlstad	Karlstad	59.379112	13.502589	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a5c3a33-e029-4ecb-8e0c-41ceddcd2755	Kau City	Skola i Karlstad	Karlstad	59.379081	13.504799	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c83c7f5f-3e22-41e7-a536-421eab9f794f	Kleynes antikvariat	Butik i Karlstad	Karlstad	59.38023	13.496505	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f13f5e80-2272-4ec7-afc5-bd04d112b5bb	Kapsel	Sevärdhet i Karlstad	Karlstad	59.373793	13.481135	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e756a63-6cdc-4909-bdb4-5ce9426b3a1e	Örshomsgrillen	Café/restaurang i Karlstad	Karlstad	59.379133	13.557289	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c405f3f-280f-4f3a-bf77-2c748fac491e	Circle K Truck Karlstad Brisgatan	Butik i Karlstad	Karlstad	59.375969	13.554997	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b18d1307-ec75-49ce-99dd-19b102eb4d90	Solagrillen	Café/restaurang i Karlstad	Karlstad	59.378242	13.541976	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4f18674-1785-4cfa-837d-5a53bbb1b6be	Francks Kylindustri	Butik i Karlstad	Karlstad	59.374749	13.527969	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
166782fa-efca-4f05-a763-2864527b1b35	Säkerhetstjänst	Butik i Karlstad	Karlstad	59.374895	13.527916	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1288c89-e9b7-43cd-8887-ea09a5f61d1b	Elitebil	Butik i Karlstad	Karlstad	59.382879	13.534325	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9440948-5cfb-4e1b-bf24-3bc82b3e98f0	Ergonomicenter	Butik i Karlstad	Karlstad	59.382612	13.533765	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
65345a78-5c01-4bf4-b741-b84fd177e3ba	Motor Trend Karlstad	Butik i Karlstad	Karlstad	59.374884	13.545294	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
613f6b5d-e874-4b56-8a1f-6dcba7d2bf6e	Däckpartner Däckbolaget i Karlstad	Butik i Karlstad	Karlstad	59.378454	13.549189	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f7051c6-565e-4336-90c1-fee3540af078	Office Depot	Butik i Karlstad	Karlstad	59.377012	13.551395	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
634d95aa-0e95-41e4-8351-ee4b4b8c55ea	Katsu	Café/restaurang i Karlstad	Karlstad	59.380542	13.539326	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fab2474b-5f93-47e5-a089-0c66ad9ccd93	Ahlsell Karlstad	Butik i Karlstad	Karlstad	59.380034	13.539988	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b45e805-6545-4524-8bdf-0b89a931002b	Carlstad Chark & Deli	Butik i Karlstad	Karlstad	59.379663	13.540739	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
43268427-020c-4d32-8eb0-7b4510a7b6c6	Lundbergs Finbageri	Butik i Karlstad	Karlstad	59.379379	13.541698	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa5eaee5-6750-4ab5-9b70-34af6dd1cdcc	Bilaffären i Karlstad	Butik i Karlstad	Karlstad	59.379221	13.541208	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0bb93d28-82ea-4b76-a817-37afafb4a32d	Karlstad Partihandel	Butik i Karlstad	Karlstad	59.379027	13.542033	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a1983d5-5e0f-498f-a22d-56da6d1408f2	Restaurang Älven	Café/restaurang i Karlstad	Karlstad	59.378956	13.541811	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c21acabb-69fd-44f0-a48e-6bbe7fc1a648	Johan Hagberg Bil & Motor AB	Butik i Karlstad	Karlstad	59.377658	13.551214	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa1eaf67-c64b-46b5-b7e9-9c1e89235308	Gretas mackor	Café/restaurang i Karlstad	Karlstad	59.377628	13.551131	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
747c1243-5786-464a-99a5-171222a7caee	Grön Karlstad	Café/restaurang i Karlstad	Karlstad	59.379235	13.537206	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
223d8d46-ffbd-45f7-9c30-5381eb1cfd25	Lööfs Gasol	Butik i Karlstad	Karlstad	59.387614	13.557821	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2274e9e3-5324-4b6e-9c90-1fa1d8b72443	DäckMäster i Karlstad	Butik i Karlstad	Karlstad	59.384778	13.557013	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
af456bdb-598e-4b02-a79e-e8d13195b05b	Mekonomen Bilverkstad Karlstad	Butik i Karlstad	Karlstad	59.380332	13.55736	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
67067602-bc3d-4143-80e4-cb2f1a04ecfe	Restaurang Solsidan	Café/restaurang i Karlstad	Karlstad	59.375099	13.477822	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
177834d6-ab4f-4202-b70d-0f82754631d9	Guldkornet kök & café	Café/restaurang i Karlstad	Karlstad	59.374923	13.480832	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aea9f1cc-5631-4436-95fc-ac8f86fe4931	Karlstad Sjukhusbibliotek	Offentlig plats i Karlstad	Karlstad	59.37514	13.477106	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e06ec214-fe1b-4dd6-9b63-c76db1cd9672	Källan	Sevärdhet i Karlstad	Karlstad	59.376171	13.501695	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8530d7be-21f3-4639-878d-097bb30c3920	Lindhés Sommarcafé	Butik i Karlstad	Karlstad	59.375899	13.502438	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
72a2fa44-6231-4e4f-86ff-1da9884d82ee	Smaksinnenas skafferi	Butik i Karlstad	Karlstad	59.380016	13.500547	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
703e56c5-0082-4558-a778-56515174e39b	Volt	Butik i Karlstad	Karlstad	59.379683	13.500981	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa0445cd-c878-4003-8d83-4ce04b3628d3	Elgiganten	Butik i Karlstad	Karlstad	59.380041	13.500782	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c95de30-3283-4517-ab7e-5d68d6e02038	Carlings	Butik i Karlstad	Karlstad	59.379747	13.501086	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9effb5f3-5417-4dfd-bc1d-7ba5746bf667	Brothers	Butik i Karlstad	Karlstad	59.379806	13.500245	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
37ca00cb-07ce-4c29-857a-3beb2e0096f0	Scorett	Butik i Karlstad	Karlstad	59.379724	13.501442	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
64087092-6576-4776-b569-47df116d8dad	Pop shop	Butik i Karlstad	Karlstad	59.380164	13.500927	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
84dc6a55-d0f9-4020-a83d-8af1e772217c	Un Boschetto Baguetteria	Café/restaurang i Karlstad	Karlstad	59.379756	13.500895	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a263637f-f552-44e2-99e8-3c3abcf1b6e1	Cervera	Butik i Karlstad	Karlstad	59.379714	13.50036	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
83e93b9a-68b6-455c-a829-bf3f78790945	Bik Bok	Butik i Karlstad	Karlstad	59.379641	13.50066	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c595af0-3382-4cd8-819d-3ba109978e92	Butik Juli	Butik i Karlstad	Karlstad	59.3801	13.500914	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2159cf58-f825-41db-8362-97854742724c	Rituals	Butik i Karlstad	Karlstad	59.379791	13.50131	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
522bb659-9a97-4002-acd9-7c687d78553f	Your Beauty Box	Butik i Karlstad	Karlstad	59.379673	13.500698	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
474837d1-3531-4c51-8c29-f9ef3f68301b	Wagner	Butik i Karlstad	Karlstad	59.379671	13.500887	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a5a0b818-ff92-49b3-9cda-bd8325e2ae4e	Cubus	Butik i Karlstad	Karlstad	59.379718	13.50106	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
575f746e-83fd-40ec-9055-1e6c6f6013c9	Life	Butik i Karlstad	Karlstad	59.37861	13.49953	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b05b9ac6-7575-440f-8024-2a6076090a81	Dorthea accessories	Butik i Karlstad	Karlstad	59.37835	13.504395	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb213b77-7b46-4767-89dd-aabd56a0d367	Hair Studio 1	Butik i Karlstad	Karlstad	59.379376	13.50039	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7363889a-e2b4-4f1a-8d88-7c36bb7629f8	Din sko	Butik i Karlstad	Karlstad	59.379143	13.50113	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
20cd727e-2189-4da6-907a-c807a934b24a	Zao Street Kitchen	Café/restaurang i Karlstad	Karlstad	59.379174	13.498269	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2a69d5a-d5ae-4dc9-bc9b-f15a5b423f2c	SingSing Karaoke	Café/restaurang i Karlstad	Karlstad	59.379028	13.500511	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1bc2c7e8-4520-4835-9aa1-aced00a84af5	Gina Tricot	Butik i Karlstad	Karlstad	59.37915	13.50059	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
40ba840a-e76a-49d3-8f2e-8eafc864c225	Grön restaurang	Café/restaurang i Karlstad	Karlstad	59.379371	13.500483	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a3337b82-a0d8-49d4-b377-81e2bf5239c0	Buketten	Butik i Karlstad	Karlstad	59.379365	13.500281	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d35624d2-6ee7-4592-bfc7-e40946888a83	Löp1	Butik i Karlstad	Karlstad	59.379798	13.504004	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a721811-af53-4903-b6a9-282c98e9f6ff	Carlstad Art Gallery	Sevärdhet i Karlstad	Karlstad	59.378645	13.499871	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
57b91b7e-b3dc-4c51-9a23-30c3d345fcc5	Helt logiskt	Butik i Karlstad	Karlstad	59.378931	13.500104	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2890ec1-e340-4edc-b013-f6c2f42c6791	Kicks	Butik i Karlstad	Karlstad	59.37877	13.499978	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
38474fc0-04ab-44fb-b559-ab4e86d8213e	Vin o Deli Delikatessbar	Butik i Karlstad	Karlstad	59.378467	13.499681	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fae21e9-b0b5-4bca-bf7b-e840aa53dc56	Twilfit	Butik i Karlstad	Karlstad	59.378664	13.499983	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
35a51ca6-c071-4baf-9e56-9a37ac53a1f6	Cigge store	Butik i Karlstad	Karlstad	59.378877	13.50002	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf261987-146d-47c7-86b0-784332c01444	BestFlower	Butik i Karlstad	Karlstad	59.378981	13.500281	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc42e400-17da-4189-8c7d-b68a0b49ddef	Kuskhuset Byggnadsvård	Butik i Karlstad	Karlstad	59.381013	13.509286	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0be3911e-b896-462b-83bb-c1b41a11ff9b	Hunkemöller	Butik i Karlstad	Karlstad	59.379103	13.500348	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0381ad22-4a7a-4aea-99db-0f366aa0d7cb	3	Butik i Karlstad	Karlstad	59.379435	13.501519	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
723a799f-e217-4d59-aa7d-7adaef8cbb73	BraMöbler	Butik i Karlstad	Karlstad	59.378478	13.499911	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f995705-39ae-4d37-accd-251909710a7d	The Body Shop	Butik i Karlstad	Karlstad	59.378877	13.49981	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3add906b-c216-46a7-8a28-5af2956a7702	Nails for You	Butik i Karlstad	Karlstad	59.378784	13.499877	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cafdc62a-c5ee-4370-8b7d-63291e389bd8	Fru Retro	Butik i Karlstad	Karlstad	59.381592	13.511731	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3d5ac16-fff5-44ca-a748-c01454aa9a53	Praktiska Karlstad	Skola i Karlstad	Karlstad	59.374279	13.503842	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1fcea71d-7116-41f4-96af-af54d1f943f3	Realgymnasiet Karlstad	Skola i Karlstad	Karlstad	59.379143	13.500368	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b10c8f6f-814c-4aed-b380-518804d20c30	Thoren Business School Karlstad	Skola i Karlstad	Karlstad	59.378836	13.499463	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
58acae64-910a-4fea-9df4-75111d69e537	Folktandvården Haga	Offentlig plats i Karlstad	Karlstad	59.381512	13.514016	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c514c36-c745-4d86-8f7f-8e5a686515e3	Specialistkliniken för endodonti och parodontologi	Offentlig plats i Karlstad	Karlstad	59.381398	13.513976	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fd7bfb7-66f6-4a19-bf46-d1acbca50c0f	Specialistkliniken för barn- och ungdomstandvård	Offentlig plats i Karlstad	Karlstad	59.381278	13.513936	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3adb27b-640b-4f4c-a543-5e2daec10db6	Specialistkliniken för oral protektik	Offentlig plats i Karlstad	Karlstad	59.381327	13.513946	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
18595a3a-a4d5-4bfa-bc7f-5edc4687d81e	Tandregleringen Karlstad	Offentlig plats i Karlstad	Karlstad	59.379048	13.506521	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
29ce23b1-e503-4f92-9171-bfe2c441fb2b	Folktandvården Våxnäs	Offentlig plats i Karlstad	Karlstad	59.385014	13.46324	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e7ced04-4e64-4e6d-84a5-b34992102172	Fredricelunds skolan	Skola i Karlstad	Karlstad	59.385527	13.460353	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e14a394-e763-4732-80d5-345156e023dd	Sjukhuskyrkan	Kyrka i Karlstad	Karlstad	59.375058	13.478926	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4a64396-599a-4df1-9de3-677e09163511	Lumine LED	Butik i Karlstad	Karlstad	59.379921	13.557706	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b184893d-f6d4-45a6-a72e-8f1ff39c90e1	Svea Solar	Butik i Karlstad	Karlstad	59.379748	13.556885	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f178dec7-fb17-4874-a523-9f34d00c562a	Handelsboden Skinn- och MC-kläder	Butik i Karlstad	Karlstad	59.379226	13.556279	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
baceae93-4e05-45b8-a656-91fa2d67c136	Rundturståget Conrad Höök	Sevärdhet i Karlstad	Karlstad	59.368794	13.487543	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c42de86-0aa5-46a1-ab50-9abeff5f5ee7	Flottaren	Sevärdhet i Karlstad	Karlstad	59.381497	13.48732	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4415cf5d-9d2a-44b9-a899-4289a3859ccc	Chow chase	Café/restaurang i Karlstad	Karlstad	59.381277	13.503478	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b88d4f5-3c7c-48be-85ac-13072a55d0a9	Max Burgers	Café/restaurang i Karlstad	Karlstad	59.381476	13.468369	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9498e693-19ad-4dae-b187-41bc7a5e9350	Debut	Butik i Karlstad	Karlstad	59.379334	13.503636	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4cdb86e3-f79a-4c30-be25-a13fc8d8cab9	Feeling	Butik i Karlstad	Karlstad	59.379481	13.501526	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab651256-0eda-475d-89d4-9a465495ecaf	Ratorps Cykel	Butik i Karlstad	Karlstad	59.410942	13.48857	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
571159c0-29bd-47c2-8301-6d379b1d4e86	Drottning Blankas Gymnasieskola	Skola i Karlstad	Karlstad	59.388568	13.489309	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa96ca63-7139-4166-a62e-8be5dad7df19	Salong Gruvan	Butik i Karlstad	Karlstad	59.376345	13.460993	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea0866f5-dd3e-43cd-bcd8-88978523ca0e	Gobanana	Butik i Karlstad	Karlstad	59.375601	13.43898	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3cc9aad7-447c-47e1-8efc-f852bf1d29d8	Köpbarnvagn	Butik i Karlstad	Karlstad	59.377186	13.443991	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7efac5b6-3389-44b6-8f8e-a19a6ede5872	LekExtra Karlstad	Butik i Karlstad	Karlstad	59.375503	13.439001	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c062c83-dc9a-419b-8e34-4dd1176fa230	Nya Lyckans pizzeria	Café/restaurang i Karlstad	Karlstad	59.376337	13.461155	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
772aa9f0-8e1f-464e-8b01-6dacf492da60	What if Tattoo and Piercing	Butik i Karlstad	Karlstad	59.381395	13.511313	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d8f88df3-cf62-4541-8c9b-610470598ba1	Walfrid Svenssons möbler	Butik i Karlstad	Karlstad	59.38127	13.512149	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a8ad942-7598-49eb-8b96-9ff2321f3a36	Karlstad Kultur & Kuriosa	Butik i Karlstad	Karlstad	59.381486	13.511519	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3eff4949-e4f5-4d81-b141-fcf59cd3c0b7	Salong Casablanca	Butik i Karlstad	Karlstad	59.381757	13.512365	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c2ea7c7-efec-4ee9-adfc-0b95352c2a77	Katarina's Guldsmedja	Butik i Karlstad	Karlstad	59.381705	13.512343	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3f53c6b-3346-49c0-aec0-d2b3a1d55839	Inredningsstudion	Butik i Karlstad	Karlstad	59.381454	13.511443	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
95ab1c85-3580-4cc0-a9e4-8f3d207c40b9	Pricken barnkläder	Butik i Karlstad	Karlstad	59.38191	13.512547	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9de955c1-d663-4523-89a6-3ac662be858c	Pantbanken Sverige	Butik i Karlstad	Karlstad	59.381694	13.511801	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a88e2cea-354b-4a58-8a27-38b9d07a9bd8	Naturum café	Café/restaurang i Karlstad	Karlstad	59.366898	13.486479	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa8716f4-1d6c-475b-9337-75a77df969e7	Eja's mode	Butik i Karlstad	Karlstad	59.382469	13.504231	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e57fd076-9827-4445-b0a8-d12e61361130	Glow solarium	Butik i Karlstad	Karlstad	59.380235	13.507479	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1a15143-ed0f-4a02-bb3a-c3732000b27f	Uffes Dentalteknik	Offentlig plats i Karlstad	Karlstad	59.380422	13.509403	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
53909b41-2f70-47c7-a393-21fab034967e	Pizzeria Rimini	Café/restaurang i Karlstad	Karlstad	59.394028	13.517863	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce065d18-7787-43d3-a790-90d875419158	Ruds Spel och Post	Butik i Karlstad	Karlstad	59.405768	13.519681	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c506e1c8-0ad7-426d-bbd6-3b6e03406fad	Vikings number 1	Butik i Karlstad	Karlstad	59.37915	13.496512	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
735f7270-f927-47b6-8f43-38c0a9260aa9	Julins Backyard Barbecue	Café/restaurang i Karlstad	Karlstad	59.37971	13.556656	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3306a0f0-0013-4313-ace3-0063375c34b0	German Beer Hall Karlstad	Café/restaurang i Karlstad	Karlstad	59.381283	13.50339	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0b6ed31-35f6-4f85-bffa-63a827708190	Smarteyes	Butik i Karlstad	Karlstad	59.379322	13.503804	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
95cd31ef-fb2a-43ac-bc9e-5fbb3c8df22d	Monséns Äkta Mattor AB	Butik i Karlstad	Karlstad	59.376085	13.434435	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
68aa814f-e1db-483c-9fcd-0b9d4f6a0c69	Velostore	Butik i Karlstad	Karlstad	59.392246	13.516687	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd04181f-79f0-49b8-8be3-cb4126a9e4e6	Skogshyddans Funky Taco	Café/restaurang i Karlstad	Karlstad	59.38967	13.491067	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
16fa0a52-a684-409b-9c77-53151e5d2cb4	Rundgång	Butik i Karlstad	Karlstad	59.380259	13.504846	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
58d6acb5-561a-4988-978b-3fc7ca8c1198	Maria Wickström	Butik i Karlstad	Karlstad	59.381357	13.51127	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b928516-cae8-47ab-9cac-c4ef82965262	Hantverksbutiken	Butik i Karlstad	Karlstad	59.381613	13.502092	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
89ffe9bf-0447-47ad-99c2-a21541a6e8ee	Stilvalvet	Butik i Karlstad	Karlstad	59.379858	13.501936	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e03f608-8387-443f-ba0e-0dfe1a1bbdbb	Ebbas kiosk	Butik i Karlstad	Karlstad	59.368767	13.487858	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6fdf937-4e1c-49f4-80f4-850e3637ce99	My inside out	Butik i Karlstad	Karlstad	59.380327	13.501143	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4fd8d5c-0cd5-48a3-be6d-4e230f56992f	Delish	Butik i Karlstad	Karlstad	59.389792	13.490692	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7014515b-7686-4605-8c66-046c7a710b1f	Herrhagsskolan	Skola i Karlstad	Karlstad	59.376927	13.516599	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
48fb229e-3dbb-439e-9c42-3498feab1364	City Kiosk	Butik i Karlstad	Karlstad	59.37851	13.503949	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f76b63b9-b3fa-4539-a943-6a7fbdc1c3b2	Salong Tim	Butik i Karlstad	Karlstad	59.378437	13.503946	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b91ec916-2df4-4dc1-b430-bbef02b9a804	Soda	Butik i Karlstad	Karlstad	59.3786	13.503953	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a70ea70e-c6f0-41b3-b189-36885dbd626c	Al Mounajed Sweet	Butik i Karlstad	Karlstad	59.378649	13.503955	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
56b38c12-9ab0-47e9-9eff-c83716d1b195	Nails by My ...	Butik i Karlstad	Karlstad	59.378708	13.503958	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c69e468b-e561-4804-9070-0851d6eed01d	Binderiet	Butik i Karlstad	Karlstad	59.378752	13.50396	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e899452d-0024-42b7-9e3f-3900cc0db184	Lindex	Butik i Karlstad	Karlstad	59.379116	13.50234	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae8d8725-d8b7-4a1f-a6df-952ed206773e	Salong Aqua	Butik i Karlstad	Karlstad	59.379101	13.503983	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
62f9ef9e-e8a4-402d-adb2-7adeb1a56d34	Scanasia	Butik i Karlstad	Karlstad	59.379089	13.504011	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7dee46f4-74d1-430f-b8ba-5e3e727b965e	Companiet	Butik i Karlstad	Karlstad	59.379307	13.505021	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
becff6ea-fa5b-428a-a75a-c49a8814fd9a	Finare	Butik i Karlstad	Karlstad	59.379642	13.506452	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ab6b08a-0a1a-4900-a14e-d5b5a52ab2fa	Boutique Unique	Butik i Karlstad	Karlstad	59.37908	13.505445	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a971c51-e71b-4fd7-9b03-82e9913e2097	Salong Lale	Butik i Karlstad	Karlstad	59.379084	13.505144	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
74d836c1-a48a-4f06-8222-512a87bff96e	Cool Card	Butik i Karlstad	Karlstad	59.378502	13.504407	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
47051efd-a532-405b-8350-d441e5ffccd8	Exclusive Tattoo	Butik i Karlstad	Karlstad	59.378404	13.5044	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad32c28b-2473-4066-b671-a1bb4aeed891	The Bishops Arms	Café/restaurang i Karlstad	Karlstad	59.381332	13.500355	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f2d4d3e-9122-43cb-97d2-21b3e2cceb5b	Café Norrstrand	Café/restaurang i Karlstad	Karlstad	59.392053	13.516171	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2ece7639-a6f2-4d53-a7f3-76b102504c18	Spel och fantasi	Butik i Karlstad	Karlstad	59.382065	13.503415	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
799cf293-3ecf-4a42-8562-d0faf9145e84	Golden Athlete	Butik i Karlstad	Karlstad	59.379195	13.496103	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
97f8ac1a-e641-4e23-b753-1587b8c49d85	Magazinet	Butik i Karlstad	Karlstad	59.378479	13.496539	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
18695c7c-db86-42a8-b3e6-b6e36bc1d48c	Tvättbutiken	Butik i Karlstad	Karlstad	59.378703	13.496555	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d5219d6-bf60-45d1-b7fb-bc778fa0d0fc	Salongen	Butik i Karlstad	Karlstad	59.378796	13.496557	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4660364-2037-4357-98a6-e3198aa71262	Åhgrens Massage	Butik i Karlstad	Karlstad	59.377139	13.491697	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6c5bdd4-85cd-4966-8eb3-e91880d09137	Attimo	Butik i Karlstad	Karlstad	59.378465	13.499789	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6cadd8c-7791-484a-b1d4-7ae4f409f438	Tingvalla Idrottsplats	Sport & fritid i Karlstad	Karlstad	59.385685	13.492594	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
7f1ab858-82f8-4f3f-8b2a-1ba5209d1e20	Våxnäsparken	Natur/park i Karlstad	Karlstad	59.382908	13.492902	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb3b95d4-b855-4e08-8bb0-f4c916b5442f	Sandgrundsparken	Natur/park i Karlstad	Karlstad	59.386728	13.500284	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
822466b8-d0aa-4fa6-b0bf-85915b07f590	I2 Idrottsplats	Sport & fritid i Karlstad	Karlstad	59.392277	13.49175	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b049a6ea-9666-4d23-b896-e9b4248e5eb4	Tingvalla isstadion	Sport & fritid i Karlstad	Karlstad	59.388131	13.485563	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
13c08a76-4360-4cf5-bc88-a8227824f872	Wennbergsparken	Natur/park i Karlstad	Karlstad	59.376266	13.492837	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e0cb819b-5e24-4f09-96c1-30fb3bb406ed	Stadsträdgården	Natur/park i Karlstad	Karlstad	59.375819	13.502095	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
5832516c-c890-462a-a11d-c14bf6020f57	Kaplansholmens naturreservat	Natur/park i Karlstad	Karlstad	59.375065	13.581519	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
eda1dea3-1109-4755-a4de-c1743bf13cff	Bryngfjordens Golfklubb	Sport & fritid i Karlstad	Karlstad	59.414489	13.455013	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6750dfa-7ed6-47d2-a8e3-ad1bef5768b9	Sommarro GK	Sport & fritid i Karlstad	Karlstad	59.355796	13.470083	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
493e27ec-0550-4faf-945e-f3382606f86a	Södra Sanna skjutbana	Sport & fritid i Karlstad	Karlstad	59.396593	13.46182	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4988bc44-d09d-46bd-a7d5-d3997f9bc06e	Örsholmens idrottsplats	Sport & fritid i Karlstad	Karlstad	59.383546	13.542294	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c836fc3-9507-4cdf-8978-88c4e8856970	Karlstads domkyrka	Kyrka i Karlstad	Karlstad	59.381526	13.506512	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
4628dee1-be29-4d12-b592-5e78216aaf66	Karlstads stadsbibliotek	Offentlig plats i Karlstad	Karlstad	59.383642	13.502952	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4bf78ea7-642e-47b1-9b79-737af464d9c5	Wermland Opera	Sevärdhet i Karlstad	Karlstad	59.382071	13.497227	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
c510de4f-5a31-47e0-af16-0108971e7892	Friluftsteater	Sevärdhet i Karlstad	Karlstad	59.369717	13.485657	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
4aef82a2-5752-42ea-8815-6141d607d8db	Terassen	Café/restaurang i Karlstad	Karlstad	59.370408	13.485809	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e26565c-2e82-4ece-8f73-99513f26c9a2	Mariebergs herrgård	Historisk plats i Karlstad	Karlstad	59.371643	13.482724	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
cfa04523-a10a-4787-b458-d5df30ac8e51	Biltema (Closed for rebuild until 2027)	Butik i Karlstad	Karlstad	59.376667	13.438949	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
57ce996f-df68-44f7-b89c-02f8870ada38	Karlstads polisstation	Offentlig plats i Karlstad	Karlstad	59.390895	13.488411	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d14d2531-ce10-4fb0-93a2-3039036724dd	Carlstad Hostel	Sevärdhet i Karlstad	Karlstad	59.386778	13.488639	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
72a7ed23-fde8-46c3-99f7-e432c518cdd3	Vårdcentralen Kasernhöjden	Offentlig plats i Karlstad	Karlstad	59.387289	13.487677	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
50937aee-bc64-4535-b583-7ddd6aa1e1c7	Racketcenter	Sport & fritid i Karlstad	Karlstad	59.38688	13.484977	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2876bd2-652d-4475-a680-71ece7a2fba1	Sporthallen Gjutaren	Sport & fritid i Karlstad	Karlstad	59.380717	13.516109	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
36367d67-d76a-4dda-b9f4-3d946644cea2	Karlstad Innebandyarena	Sport & fritid i Karlstad	Karlstad	59.385614	13.484037	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f40fdcc-51fb-4658-9aa2-d673aa22e0fe	Västerstrands kyrka	Kyrka i Karlstad	Karlstad	59.382712	13.465036	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
2b41cd77-c75c-47ec-beab-39ead5538eb8	Våxnäshallen	Sport & fritid i Karlstad	Karlstad	59.390803	13.470563	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
aec1a6a6-b3da-443f-8722-97544d1dece6	Sandgrund Lars Lerin	Sevärdhet i Karlstad	Karlstad	59.38463	13.502764	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
de8da99c-5b1e-41f6-acc7-57fe2b84f21f	Sundstabadet	Sport & fritid i Karlstad	Karlstad	59.389684	13.512562	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c04de18-e76e-449b-b2f6-bb1542feb083	Filterteknik	Butik i Karlstad	Karlstad	59.370525	13.550161	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ade2316d-0ed1-4900-a4d0-a8b6749413fc	Gustaf Fröding Hotell	Sevärdhet i Karlstad	Karlstad	59.40052	13.535111	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e6d092c-521a-4272-ba21-f24536ec6e5d	Vikenkyrkan	Kyrka i Karlstad	Karlstad	59.375549	13.493763	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
23702f9a-e370-4fa0-b8af-3ade62a5b3b9	Max	Café/restaurang i Karlstad	Karlstad	59.381337	13.468253	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
903093d4-da54-42e0-a0c4-0f37aa427257	Klaraviksgrillen	Café/restaurang i Karlstad	Karlstad	59.379523	13.478032	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9cefd5c-2c94-4121-8c92-1ef28f074ac1	Lambergskiosken	Café/restaurang i Karlstad	Karlstad	59.376238	13.526877	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa163d7e-42cc-43ab-8193-8948b25469a0	Residensparken	Natur/park i Karlstad	Karlstad	59.380835	13.498751	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
3962c034-c536-4280-bdca-a77b8fc60cde	Gossip & Bubbels	Café/restaurang i Karlstad	Karlstad	59.380581	13.498071	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b930bd5-b59a-4c1a-894d-07bf8f9ab5d5	Pingstkyrkan	Kyrka i Karlstad	Karlstad	59.378536	13.497222	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
e035038e-6a1a-4875-8325-0601ee50ae3c	Sockerslottet	Historisk plats i Karlstad	Karlstad	59.381666	13.496354	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
2660dd31-f650-4fec-95e5-77a315a054ac	Frödingsparken	Natur/park i Karlstad	Karlstad	59.380293	13.509401	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb9a9ea7-726b-4bab-9675-3eca0bacd9d1	Tingvallakyrkan	Kyrka i Karlstad	Karlstad	59.382337	13.504912	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b0cc36e-94c0-4e75-8a21-7b0deef5b314	Norrstrandskyrkan	Kyrka i Karlstad	Karlstad	59.392911	13.513638	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
4723b8c1-57ea-4faf-a458-0f2462a30c31	Malmtorget	Natur/park i Karlstad	Karlstad	59.382728	13.495392	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6c5b584-721c-4d3b-bbfb-667c3fee6e6d	HSB-parken	Natur/park i Karlstad	Karlstad	59.395032	13.52364	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9e012cc-0ab3-4736-bb25-a6f57f5bb7a0	Rudskyrkan	Kyrka i Karlstad	Karlstad	59.405031	13.519898	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1b7cca1-59a8-4958-844e-6ab056b244d9	Allmat	Butik i Karlstad	Karlstad	59.385472	13.474244	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
68875c55-72ec-48a3-9cff-562cf9dd949c	Karlstads brandstation	Offentlig plats i Karlstad	Karlstad	59.391824	13.488547	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a12c9bd-5491-41af-b6f1-f4ec70d8de03	Våxnäs fotbollshall	Sport & fritid i Karlstad	Karlstad	59.389996	13.470546	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
a991c860-4327-47f2-b4f2-934f0a32a021	Mio	Butik i Karlstad	Karlstad	59.380797	13.467664	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
29c84ee7-6a56-4882-977a-eb2747d3e1e1	Seniorernas Hus	Offentlig plats i Karlstad	Karlstad	59.386505	13.510027	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dde5447b-c210-45c6-b9b3-bc876a8c83ef	Klaraborgs herrgård	Historisk plats i Karlstad	Karlstad	59.379472	13.489482	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
60988d10-314c-468b-87d8-80f7d4945201	Intresseskolan	Skola i Karlstad	Karlstad	59.361036	13.471164	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5cd608f-4179-435a-80d9-bae06739a9bf	Tolvmansgatans fritidsgård	Offentlig plats i Karlstad	Karlstad	59.386875	13.523906	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3cb87082-83a4-4c93-b568-cffebba9595d	Löfbergs Arena	Sport & fritid i Karlstad	Karlstad	59.407544	13.500684	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
77807799-098f-4ede-839a-c49b5b9d3cbc	Löfbergs Ice Arena	Sport & fritid i Karlstad	Karlstad	59.406916	13.50254	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
730a2385-8e64-4b93-9b27-794167ed6949	Färjestads herrgård	Historisk plats i Karlstad	Karlstad	59.40609	13.502351	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e3505a0-15dd-47b8-bf35-77a155bb1a2c	Kroppkärrskyrkan	Kyrka i Karlstad	Karlstad	59.403805	13.547567	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
f181bdb8-60f9-4bc1-b640-50e0c01aee39	Norrstrandsparken	Natur/park i Karlstad	Karlstad	59.394423	13.527382	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
7212b4f4-af28-46e8-a9a9-80c96dad244b	Stocken	Offentlig plats i Karlstad	Karlstad	59.41347	13.547471	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
256d05af-dbe2-4830-8471-45d42ccda43c	Vädersåg	Sevärdhet i Karlstad	Karlstad	59.369672	13.483994	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f10800f-85f1-48b3-9806-3b18168befbf	Lilla Våxnäs	Historisk plats i Karlstad	Karlstad	59.383316	13.491991	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
386a8af3-ed98-4be7-9d04-706ddd07a582	Jesu Kristi Kyrka av Sista Dagars Heliga	Kyrka i Karlstad	Karlstad	59.391682	13.520883	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
f996d9ec-cd7f-40a1-94b2-d6f22614fe62	Kalvholmen motorstadion	Sport & fritid i Karlstad	Karlstad	59.371634	13.538378	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c9b2170-f672-4207-a8c4-0dcaf703463b	Karlstad skateboard- och BMX-hall	Sport & fritid i Karlstad	Karlstad	59.389021	13.484274	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e248a895-029d-4c41-baec-02c6f54fa4da	Orrholmsskolan	Skola i Karlstad	Karlstad	59.369036	13.500528	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea3ecd5e-eb7f-468b-ade4-73b6d0bd4e0e	Fredricelundsskolan	Skola i Karlstad	Karlstad	59.385909	13.461065	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c63c8211-d5b8-4c7a-89b4-6b407d6e5952	Strands herrgård	Historisk plats i Karlstad	Karlstad	59.380754	13.484104	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b280770f-818d-4709-98e5-fed398cebffc	Internationella engelska skolan	Skola i Karlstad	Karlstad	59.37949	13.457669	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f96c49a-db83-4c3b-b5ee-fc9074d958ae	Tingvallagymnasiet	Skola i Karlstad	Karlstad	59.380721	13.50645	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a5122e4a-17d6-4e8b-8c6d-3d45cce04e7f	Rosenborgs herrgård	Historisk plats i Karlstad	Karlstad	59.371711	13.476327	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c458bdf4-c7c7-4125-bf2a-a80839586bef	Badhusparken	Natur/park i Karlstad	Karlstad	59.383619	13.506475	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
60063314-857a-4a2f-955f-3257f91c5cd6	Sundsta-Älvkullegymnasiet	Skola i Karlstad	Karlstad	59.392106	13.510209	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e18a5d9-f1f7-4d7e-8362-3b4e4ddeb748	Karlstads busstation	Offentlig plats i Karlstad	Karlstad	59.378878	13.493069	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
833a6dea-4e5b-417c-a3c6-f97fcc4c8bfa	Centralsjukhuset i Karlstad	Offentlig plats i Karlstad	Karlstad	59.375288	13.478306	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c093328-eac2-4ed0-94ed-cc99768ff843	Jehovas Vittnen	Kyrka i Karlstad	Karlstad	59.399725	13.548682	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
65c17836-d235-430c-b6ad-af1704379e5e	Paleniusparken	Natur/park i Karlstad	Karlstad	59.406703	13.488907	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b9d871a-3f9f-4079-89be-e45b81057aea	Råtorpskyrkan	Kyrka i Karlstad	Karlstad	59.406054	13.489532	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fdacb2a-79f1-4625-821c-41558180b44e	Sidvallen	Natur/park i Karlstad	Karlstad	59.408684	13.50855	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e11a019a-06c8-4b61-87c1-b2330e31af46	IT-Café	Café/restaurang i Karlstad	Karlstad	59.404479	13.56721	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e721ef01-96a5-4bc5-8d05-973a0c2deb68	Pizza Hut	Café/restaurang i Karlstad	Karlstad	59.394956	13.518368	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1eef016a-0e99-4ef4-9442-9d41d1c32958	Hagaborgsskolan	Skola i Karlstad	Karlstad	59.388899	13.519181	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a5129224-86c6-4f77-b5f1-d9ac74739753	Norrstrandsskolan	Skola i Karlstad	Karlstad	59.390577	13.524517	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
20f06a33-913e-4b81-8eb3-207a496c4a13	Fröding Arena	Sport & fritid i Karlstad	Karlstad	59.404469	13.570481	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
ed8022d8-893d-43b9-9e2e-98010d10de27	First Hotel River C	Sevärdhet i Karlstad	Karlstad	59.383622	13.508755	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d555af0-bce0-4af9-a57b-a5391cb3b229	Karlstads central	Offentlig plats i Karlstad	Karlstad	59.378005	13.499076	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
29d3e680-411e-4da9-a820-02745f367ff6	Mariebergsskolan	Skola i Karlstad	Karlstad	59.372077	13.480222	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
77e70e14-d8ac-404b-ad28-17828980383b	Lindas Gatukök	Café/restaurang i Karlstad	Karlstad	59.383952	13.463328	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9692fe04-f5aa-4c91-9d9c-b32e3bde6dbb	Karlavagnen	Skola i Karlstad	Karlstad	59.40826	13.573522	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f45732fd-0553-410d-8c89-77765b68ff71	Klasmossens förskola	Skola i Karlstad	Karlstad	59.40914	13.573299	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6d8927c-8a2c-471c-9a58-aa631c0bc292	Frödingskolan	Skola i Karlstad	Karlstad	59.403761	13.569808	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e530bf27-a035-401a-899c-f14c75d3830f	Kroppkärrs idrottsplats	Sport & fritid i Karlstad	Karlstad	59.402661	13.541917	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
475c9e38-331a-435b-ad81-b3917c59ef2f	Klasmossens idrottsplats	Sport & fritid i Karlstad	Karlstad	59.410685	13.573621	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ee481ee-50fb-4e73-be34-517ba860cbe7	Kroppkärrsskolan	Skola i Karlstad	Karlstad	59.403453	13.546348	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
890d0bb4-406d-47d9-958d-d41a5cd06ee9	Granngården	Butik i Karlstad	Karlstad	59.373909	13.445212	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e2f20a6-bbe6-4e5a-83b3-7b83790b977a	Lekbacken	Natur/park i Karlstad	Karlstad	59.414661	13.543027	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9edb59d-8f1c-469e-a272-c122f2f0cb5b	Olsätersplan	Natur/park i Karlstad	Karlstad	59.402767	13.539051	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0829ef9-7796-4cfc-b8a3-3ffb9cb2ed72	Råtorpsskolan	Skola i Karlstad	Karlstad	59.406278	13.491871	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1abd5bd-b187-41fe-948f-27c975c22dcf	Södra Råtorps skola	Skola i Karlstad	Karlstad	59.402992	13.487481	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ddfa67bb-f391-4630-89a4-3474141b921d	Utmarken	Natur/park i Karlstad	Karlstad	59.413295	13.483858	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
d22d1851-3b71-4419-ade2-741db2d4d1ea	Råtorps idrottsplats	Sport & fritid i Karlstad	Karlstad	59.409523	13.484442	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
520bbbdf-46ed-4ca5-816c-4b237f133dce	Skogsbackeskolan	Skola i Karlstad	Karlstad	59.408906	13.525696	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
827298f4-80c4-472a-bb89-e37f45fdbc44	Rudsskolan	Skola i Karlstad	Karlstad	59.401266	13.518944	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f4492cb-14c5-4fac-ba5a-bfe96a44db9e	Våxnäs idrottsplats	Sport & fritid i Karlstad	Karlstad	59.390041	13.468881	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c836433-4963-42a7-8b5d-8bad8cbf4663	Korskyrkan	Kyrka i Karlstad	Karlstad	59.382895	13.512847	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
79fd6d2d-0ad1-445e-bc87-6b5b8f805d71	Väderkvarn	Sevärdhet i Karlstad	Karlstad	59.365287	13.480982	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
a39eceb4-f04f-4134-8425-c428892bff25	Skvaltkvarnen	Sevärdhet i Karlstad	Karlstad	59.367819	13.483984	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
86f253c4-1d28-4b29-a6e7-48e49ce0566e	Mitt i City	Butik i Karlstad	Karlstad	59.379875	13.500553	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd2ddaf4-b7f2-4594-a9dd-e9c6517942bb	Axel Karlssons Hem Kök Tvätt	Butik i Karlstad	Karlstad	59.37577	13.444722	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d96bddb2-a6fb-4831-9137-18cd46f66f0c	Mariebergsskogen	Natur/park i Karlstad	Karlstad	59.36883	13.487251	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffc0a61b-debe-4846-8f0e-5f03364412eb	Herrgårdsparken	Natur/park i Karlstad	Karlstad	59.405481	13.50333	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffa0df1a-a69f-470a-b057-b908edb97782	Bydammen	Natur/park i Karlstad	Karlstad	59.405183	13.50634	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
983818d5-1f59-4088-a650-1db15b18e616	Tysta parken	Natur/park i Karlstad	Karlstad	59.384623	13.493697	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
551c2f78-0258-4dea-90dc-acbdedda382d	Brigadmuseum	Sevärdhet i Karlstad	Karlstad	59.388304	13.494734	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fa26033-925c-4105-895c-dfe9e9d52dce	O'Learys	Café/restaurang i Karlstad	Karlstad	59.379988	13.503281	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b65301e2-9fb5-49bf-a980-e3606a2dcdff	Galleria Duvan	Butik i Karlstad	Karlstad	59.378768	13.499959	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0903f951-0ae9-4eff-9f56-4fcba185e6e5	Mariebergshallen	Sport & fritid i Karlstad	Karlstad	59.36854	13.480009	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e3aa341-78c9-4f11-a0cf-4251c90f5316	Klara Teoretiska Gymnasium Karlstad	Skola i Karlstad	Karlstad	59.389131	13.491613	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
417f9efb-363e-487a-8318-b275fa872239	Karlstad Airdome	Sport & fritid i Karlstad	Karlstad	59.38912	13.470251	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d9036d0-ebbf-4698-b3e3-3eb0559357a1	Västerstrandsskolan	Skola i Karlstad	Karlstad	59.379593	13.470724	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c00b2a10-3570-45d2-9b31-35d98fca964d	Teaterparken	Natur/park i Karlstad	Karlstad	59.381844	13.497042	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6366c93-8342-4b31-915a-ce8156b51b28	Kvarnbergsskolan	Skola i Karlstad	Karlstad	59.376537	13.484332	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f79917b5-f85a-4738-aae7-32aeb802156b	Museiparken	Natur/park i Karlstad	Karlstad	59.384368	13.500665	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ba29055-ce4b-4444-bd2c-665cc6f0eaa7	Kronoteket	Offentlig plats i Karlstad	Karlstad	59.404241	13.571592	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0118cebd-b1d3-4801-a520-8a1a2aef3e1c	Dollarstore	Butik i Karlstad	Karlstad	59.345893	13.504199	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa1c46d5-c12a-4e8f-84bb-196dbc15128e	Färjestadsskolan	Skola i Karlstad	Karlstad	59.404825	13.514157	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f266ec01-9164-4bcc-9172-7778bd28fb05	Mio	Butik i Arvika	Arvika	59.669782	12.595213	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
98dc1459-49c8-440e-98fe-44f446c107eb	Solstadens sportcenter	Sport & fritid i Karlstad	Karlstad	59.398201	13.492686	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
14037529-7af6-4db2-aead-5872676f94b1	Älvbrinken	Natur/park i Karlstad	Karlstad	59.380195	13.489618	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e849daf5-c465-4dc2-9064-63ab01d03bea	Rosendalsparken	Natur/park i Karlstad	Karlstad	59.405692	13.542822	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
70c6af55-c687-42a0-83c1-abdcaead670c	Aspdungen	Natur/park i Karlstad	Karlstad	59.406852	13.544857	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b4d5b00-26ea-4a01-98f1-49e6d2b1b9e2	Aldungen	Natur/park i Karlstad	Karlstad	59.405769	13.552664	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
8549410a-b45b-4f52-b592-88cb4396fbe2	Lorensbergsparken	Natur/park i Karlstad	Karlstad	59.407028	13.536386	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
78ec46c6-e6bb-473e-b02e-4fd4ed0ac7c4	Gröna plan	Natur/park i Karlstad	Karlstad	59.399596	13.540577	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0bfb2a1a-aa38-4c31-bf03-033988bb2938	Nolbyplan	Natur/park i Karlstad	Karlstad	59.39086	13.518278	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
086f53b5-744a-43ba-8ca1-b5796d8c8f78	Lignellsparken	Natur/park i Karlstad	Karlstad	59.394587	13.513169	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
a0b12199-b658-48d5-8484-acbb4024a15f	Solhagen	Natur/park i Karlstad	Karlstad	59.407595	13.512176	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d451145-8bc1-4420-806f-3d07aedee5d4	Torslunden	Natur/park i Karlstad	Karlstad	59.403357	13.494572	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
893eaafe-d7b0-4e70-9123-04bc907f86fb	Stockfallets skola	Skola i Karlstad	Karlstad	59.416585	13.550577	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f797a9b9-ffe6-41aa-89e2-74f73e785064	Västerstrands idrottsplats	Sport & fritid i Karlstad	Karlstad	59.378628	13.469274	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf2f531e-a7e5-4ab0-9d50-b9ba5d6cc0fa	Thoren Framtid Karlstad	Skola i Karlstad	Karlstad	59.388052	13.489011	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
cced5674-efdf-4071-a523-2b3874969d3c	Montessorifriskolan Stellatus	Skola i Karlstad	Karlstad	59.371703	13.476412	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0ac97a9-0a98-4895-afa9-ee508ed6b9f2	Strandgården	Sevärdhet i Karlstad	Karlstad	59.382064	13.479932	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d5db770-c53f-4273-929b-051b4ca9417b	Karlstads Globala Gymnasium	Skola i Karlstad	Karlstad	59.38236	13.484425	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2ef4487f-75a6-482f-8079-37e5175cacd5	Karlstads Curling Arena	Sport & fritid i Karlstad	Karlstad	59.388455	13.484227	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
29ddd4ff-1133-4047-b4cb-7395b60b366e	24Food Stockfallet	Butik i Karlstad	Karlstad	59.411705	13.546643	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
83fcab31-8253-4f55-ad46-d2575b015e90	Kulturskolan	Sevärdhet i Karlstad	Karlstad	59.379386	13.489707	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
7787dc92-8aae-40df-b0a4-050cf97e679b	Lokstallsparken	Natur/park i Karlstad	Karlstad	59.383934	13.520992	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
8fdd8899-c794-4cf5-aee7-987cac13d4cb	Karlsgrundsparken	Natur/park i Karlstad	Karlstad	59.377951	13.471022	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
2cea432d-4e69-44cf-8bf2-afebda879cd9	Värmlands museum	Sevärdhet i Karlstad	Karlstad	59.385277	13.501041	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
0423ac32-82a9-4a17-9de4-b511300019a8	Löfbergs Lila Arena	Sport & fritid i Karlstad	Karlstad	59.407366	13.5014	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6377ca7-6951-4e40-b405-1a644c694ad6	Nobelgymnasiet	Skola i Karlstad	Karlstad	59.398537	13.522231	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6cea5841-22c3-47ac-af37-8e8ced01f0fb	Långholmsparken	Natur/park i Karlstad	Karlstad	59.373701	13.513386	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
31a7bbed-66a4-4bb5-a3da-408a80a313c3	Mariebergs idrottsplats	Sport & fritid i Karlstad	Karlstad	59.369287	13.479582	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9f49ce6-014d-4862-a166-ae22de800ff4	Sälgdungen	Natur/park i Karlstad	Karlstad	59.40635	13.548928	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
dedb8c0b-998f-43ba-8146-881e8c765db5	Mårbackaplatsen	Natur/park i Karlstad	Karlstad	59.390145	13.521892	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b188393b-6bc6-4123-bd69-0638f9f6f8d0	Hagalundsvägen	Gata i Karlstad	Karlstad	59.38335	13.473463	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
07a0539d-934a-40e0-b167-f49aaacd582d	Ullebergsleden	Gata i Karlstad	Karlstad	59.370032	13.45367	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4285d58-ea10-491a-86b3-18ca366a51b6	Bergviksrondellen	Gata i Karlstad	Karlstad	59.377415	13.440738	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
26814730-7d11-4698-895b-fcaa193b79f9	Bergviksvägen	Gata i Karlstad	Karlstad	59.377685	13.440209	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba5fa77d-0216-4f41-a0bd-2f7fc5039dac	Körkarlsrondellen	Gata i Karlstad	Karlstad	59.380196	13.440965	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
327a8609-1ce3-4cda-bdad-7c30b466e0f2	Hammaröleden	Gata i Karlstad	Karlstad	59.369556	13.513163	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5cd06479-e058-4a6a-b5ab-77bae7003898	Södra Klaragatan	Gata i Karlstad	Karlstad	59.383379	13.496608	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
39f07514-da13-43f0-8895-dfa1a7979f9f	Regementsgatan	Gata i Karlstad	Karlstad	59.384495	13.492897	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99d83ba0-1c46-40e4-bed5-e0df9cd1a4bf	Hybelejens gata	Gata i Karlstad	Karlstad	59.381439	13.496148	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
edf8ec46-bdfd-413b-9eb1-cba6d85f16f3	Bryggaregatan	Gata i Karlstad	Karlstad	59.38299	13.494579	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb3d1b3f-a4eb-40af-90d1-879175608e13	Körkarlsvägen	Gata i Karlstad	Karlstad	59.380271	13.440057	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
161a9f58-8721-43ec-a666-6a2f10be222e	Sundstavägen	Gata i Karlstad	Karlstad	59.393855	13.514317	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
efc53449-c2f6-4352-b10b-8fe20bae71a2	Blönduosgatan	Gata i Karlstad	Karlstad	59.396151	13.516827	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c19fcf9-aecd-4e0d-8d4e-52a06a02a5db	Färjestadsrondellen	Gata i Karlstad	Karlstad	59.398072	13.515722	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92c60dc2-d181-4a23-b27f-bc58c7347194	Rudsvägen	Gata i Karlstad	Karlstad	59.388416	13.514573	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ed686cc-2c60-4541-81e3-2dc1a1f0d189	Norra Infarten	Gata i Karlstad	Karlstad	59.403861	13.510989	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9af2d12-4c41-4625-b3b1-6616946e5d73	Pihlgrensgatan	Gata i Karlstad	Karlstad	59.378853	13.494779	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2aadab9c-6008-499f-ae70-56eae531682e	Grevgatan	Gata i Karlstad	Karlstad	59.379902	13.492477	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c347493-23a3-44ec-8cf2-f105f168dc9b	Klaraborgsgatan	Gata i Karlstad	Karlstad	59.37936	13.490866	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9305dc09-d332-4069-ab12-b669616ea3c2	Sandbäcksgatan	Gata i Karlstad	Karlstad	59.393938	13.498163	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
83515119-0cd9-4a10-9c59-5c51e1d72883	Malmtorgsgatan	Gata i Karlstad	Karlstad	59.382813	13.496044	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
96890385-b4a3-4037-b8bc-2a0912492639	Odengatan	Gata i Karlstad	Karlstad	59.384505	13.492372	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2643e57-10ae-4f93-b2e0-39613d24f962	Norra Klaragatan	Gata i Karlstad	Karlstad	59.384022	13.494065	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba332490-63b9-48b2-9d02-1bc538714917	Slättgatan	Gata i Karlstad	Karlstad	59.405455	13.511523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
376919f1-e375-4501-9a4a-63c3e617047e	Örngatan	Gata i Karlstad	Karlstad	59.406217	13.512917	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e4f6a8b-075a-4bec-91d7-ee280f7761a9	Rudsplan	Gata i Karlstad	Karlstad	59.398826	13.514251	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
49756686-3c4d-4622-9411-5763e1dfc38e	Götgatsbron	Gata i Karlstad	Karlstad	59.383018	13.508373	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c30e23bc-a608-48a6-b2c9-847c1030bc72	Norra Strandgatan	Gata i Karlstad	Karlstad	59.383102	13.50317	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f02af7b9-cb24-46f3-90a1-dd4aeb8e2622	Västra Torggatan	Gata i Karlstad	Karlstad	59.380936	13.501822	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
afc760aa-dfee-4dd4-b335-fa012b1fb9a4	Museigatan	Gata i Karlstad	Karlstad	59.381726	13.500252	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
91da1352-6c36-4d9f-8f0e-4fba10fb151e	Kungsgatan	Gata i Karlstad	Karlstad	59.381037	13.503845	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0adf5e94-9691-45ee-9e10-61ea5a0eacb5	Tage Erlandergatan	Gata i Karlstad	Karlstad	59.382848	13.510569	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e08b49ac-8df9-4bb5-a11f-b481333cf517	Västra Kanalgatan	Gata i Karlstad	Karlstad	59.380878	13.51026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc4813a7-2d24-4eff-b803-c64c69e9a214	Västra Kyrkogatan	Gata i Karlstad	Karlstad	59.38158	13.505499	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1dc88073-147a-45ff-b63b-d949d699ffe9	Norra Kyrkogatan	Gata i Karlstad	Karlstad	59.382531	13.506633	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae4b537e-c2bb-4f17-bc3d-11f4afb6d0a9	Tomtebogatan	Gata i Karlstad	Karlstad	59.394779	13.512098	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a75bcf1-0ccb-4fcf-a244-29994df00dc6	Lignellsgatan	Gata i Karlstad	Karlstad	59.394648	13.513663	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff649353-45b7-4e41-8d52-66b0a08debf0	Egnahemsgatan	Gata i Karlstad	Karlstad	59.39498	13.513703	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ca505df-fca5-4c07-bc31-3050103b1c8e	Arvidslundsgatan	Gata i Karlstad	Karlstad	59.396342	13.511689	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
08fdade4-7b2b-43ec-a011-ed66b22411a7	Viksholmsgatan	Gata i Karlstad	Karlstad	59.395761	13.509858	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a147e94-0de5-4622-9e0b-df9130577a83	Klaratjärnsgatan	Gata i Karlstad	Karlstad	59.395436	13.509173	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d0aa49f-7264-49ef-82bb-bd97944bb5f7	Älvkullegatan	Gata i Karlstad	Karlstad	59.394768	13.51014	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1f75056-3c5f-4806-9755-576e9d34d2dc	Rygatan	Gata i Karlstad	Karlstad	59.39551	13.508427	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9933d944-5fc9-4e81-a6b6-bce61f3521a9	Krokiga gatan	Gata i Karlstad	Karlstad	59.395871	13.51119	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5bfeca4-abbc-496b-9dc7-217f75e70b87	Östra Infarten	Gata i Karlstad	Karlstad	59.396848	13.534867	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
293a49cf-9d6e-4091-a369-48797da0b271	Molkomsgatan	Gata i Karlstad	Karlstad	59.399299	13.555672	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f30d3c57-77b9-49f9-a775-10056e117086	Tuvängsgatan	Gata i Karlstad	Karlstad	59.397925	13.546428	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d1a4678f-18f0-43c6-89aa-4a59d44ab402	Strandängsgatan	Gata i Karlstad	Karlstad	59.398483	13.547919	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e0d8d93-9d89-466e-9dff-37100c2c10e5	Talluddsgatan	Gata i Karlstad	Karlstad	59.399416	13.549469	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7f8cbf92-341a-4d3c-9cb6-b11187e4a09e	Kroppkärrsvägen	Gata i Karlstad	Karlstad	59.395601	13.539078	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
087bbff7-cc08-49c5-b7a3-7820c7e66183	Karlsrogatan	Gata i Karlstad	Karlstad	59.399028	13.545237	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2fd2287-2316-4f48-84d9-19f34d8171fc	Våxnäsgatan	Gata i Karlstad	Karlstad	59.381299	13.466096	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d23cb60-5e87-4fc8-af5d-b9a21f3c58d9	Skoghallsvägen	Gata i Karlstad	Karlstad	59.36933	13.458212	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b8dfe90-e841-46c8-a406-878e55db490a	6:e Villagatan	Gata i Karlstad	Karlstad	59.380942	13.475305	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7251b7dd-803b-4c2a-aa14-83e0a98de1ab	Idalagatan	Gata i Karlstad	Karlstad	59.381105	13.482861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f8d294b-de28-4ebb-aa73-e73ad73365c2	Älvviksgatan	Gata i Karlstad	Karlstad	59.376977	13.47218	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
05c3d6a5-cebe-4890-b05a-a7c13c4e23b0	Södra Karlsgrundsgatan	Gata i Karlstad	Karlstad	59.37778	13.472684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffd87d75-9545-46c2-9402-1c9e877e1abf	Västerstrandsgatan	Gata i Karlstad	Karlstad	59.375981	13.469786	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b83f66be-4b17-4e56-8c1d-2938027b4cbd	Råtorpsrondellen	Gata i Karlstad	Karlstad	59.398993	13.497292	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
affe159e-5ca8-4123-9a8d-efb925c989be	Råtorpsporten	Gata i Karlstad	Karlstad	59.40001	13.497424	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
815f360d-ef06-414b-a7fa-7dc0e05f4af5	Råtorpsvägen	Gata i Karlstad	Karlstad	59.405107	13.494328	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af9cd633-f600-4a62-bf4c-6f7669c36948	Dyevägen	Gata i Karlstad	Karlstad	59.410678	13.483348	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7939eafd-6a0c-4966-acc5-ba166f7aaea1	Ringgatan	Gata i Karlstad	Karlstad	59.403524	13.491101	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd854c6b-7ca1-424b-939c-c81186f77f78	Bågegatan	Gata i Karlstad	Karlstad	59.390548	13.471341	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea50aff7-7009-40ae-acb4-df8048571364	Säterivägen	Gata i Karlstad	Karlstad	59.39125	13.476762	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e79a812-dd7c-4492-a33f-df9af9f2f372	Ramgaterondellen	Gata i Karlstad	Karlstad	59.384191	13.479606	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6724df81-8c67-4dc3-afd2-761bc9f3e73a	Ramgatan	Gata i Karlstad	Karlstad	59.385621	13.48023	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
38bfb63a-5d83-4f1b-a415-a6dddcbef786	Bromsgatan	Gata i Karlstad	Karlstad	59.389129	13.472606	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d691e161-32e9-4ca0-9be6-5567e58ccaa6	Kolvgatan	Gata i Karlstad	Karlstad	59.389858	13.477861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a77faa1-86d1-47a4-84f4-3d065647bf1b	Spärrgatan	Gata i Karlstad	Karlstad	59.387517	13.477599	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42f78901-8fb8-477f-9e32-6bac7978298b	Rattgatan	Gata i Karlstad	Karlstad	59.386433	13.4776	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15ee5306-d4c4-4e7d-b935-c374e7255312	Blockgaterondellen	Gata i Karlstad	Karlstad	59.383854	13.475479	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9121d857-1c26-4d1c-8f60-63dae35ea9e7	Blockgatan	Gata i Karlstad	Karlstad	59.385231	13.474896	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1dbaa083-ebc9-4c2f-be3b-e80b683ca872	I2-rondellen	Gata i Karlstad	Karlstad	59.385444	13.485752	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
72bd9d02-f3dc-4d65-962a-b16ea3af51b8	Karl IX:s gata	Gata i Karlstad	Karlstad	59.383865	13.488308	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b518f73e-9a70-49f0-baa0-fb53f2ad0b3c	Åttkantsgatan	Gata i Karlstad	Karlstad	59.382024	13.513026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8e18de1-efa1-4d34-b463-d3f73c8afa12	Infanterigatan	Gata i Karlstad	Karlstad	59.394191	13.495329	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd9d1c83-682d-47e5-811f-19b21b089d26	Bernstadsgatan	Gata i Karlstad	Karlstad	59.376731	13.470908	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd7e6e0f-1a1a-4184-b0bc-38ed15c9f323	Lilla Romstadsvägen	Gata i Karlstad	Karlstad	59.374239	13.469444	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c256e42c-8a9a-41a4-99b6-f520d89c8f1a	Blomstergatan	Gata i Karlstad	Karlstad	59.375095	13.46933	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bfbede65-3fa3-460e-9e6c-4379b2131b98	Södra Karlsholmsgatan	Gata i Karlstad	Karlstad	59.375701	13.47008	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e8d43600-2747-4a98-b0fc-6de2ae7c0370	Norra Karlsholmsgatan	Gata i Karlstad	Karlstad	59.376026	13.470142	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e700def5-5996-4f12-92dc-9b502b8cb7f2	Norra Karlsgrundsgatan	Gata i Karlstad	Karlstad	59.378234	13.472649	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4d03c58-68a7-472a-8fd9-b3fef9018cb3	Västra Karlsgrundsgatan	Gata i Karlstad	Karlstad	59.377822	13.470809	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0588fd5b-d642-4c46-89a8-a2429793e562	Slåttergatan	Gata i Karlstad	Karlstad	59.377406	13.469794	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
edfef75c-9cd0-43b6-8272-699698168904	Solviksgatan	Gata i Karlstad	Karlstad	59.378774	13.473417	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
78a60c7e-7202-47b6-a231-db6ecd47a315	Stora Söderängsgatan	Gata i Karlstad	Karlstad	59.373176	13.466275	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6358aa3-e5f7-4000-8f0e-18ac90c72d4b	Lindgatan	Gata i Karlstad	Karlstad	59.372177	13.464185	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
afa9454c-4326-4cd0-b594-d13f4b437f41	Änggatan	Gata i Karlstad	Karlstad	59.373378	13.466049	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
94e451fc-0095-42cd-8c27-49f417458331	Marielundsgatan	Gata i Karlstad	Karlstad	59.373991	13.469065	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a7aa2dd-486b-4efb-b063-22cbb528cfcc	Lilla Söderängsgatan	Gata i Karlstad	Karlstad	59.373226	13.468933	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f5425938-1d0a-41e1-8442-9ce3e5f01484	Irisgatan	Gata i Karlstad	Karlstad	59.373101	13.466868	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6345382-de2c-49ae-abdf-e966babb200e	Dalagatan	Gata i Karlstad	Karlstad	59.370198	13.461946	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27e4c8aa-a10e-4048-82c4-54c26540b594	Skagersviksgatan	Gata i Karlstad	Karlstad	59.370067	13.461155	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
13356386-d461-4eb7-9682-de214d431887	Romstads Parkgata	Gata i Karlstad	Karlstad	59.370288	13.463322	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
667972f0-f526-4d08-acfb-6f6f247eec14	Bogårdsgatan	Gata i Karlstad	Karlstad	59.37058	13.46482	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
151062d2-b79a-4726-bdb1-811833e44451	Magdebogatan	Gata i Karlstad	Karlstad	59.371175	13.465462	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b28af214-4825-4a2e-819d-8d0215d4bec6	Fagerängsgatan	Gata i Karlstad	Karlstad	59.374049	13.46491	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4f528bf-9fdd-4fc5-b01b-0cfe40388bb2	Romstadsvägen	Gata i Karlstad	Karlstad	59.376864	13.473652	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
799b764b-5a81-4c85-b1dc-edcdb7d0e144	Döbelnsgatan	Gata i Karlstad	Karlstad	59.368042	13.454488	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
93e1190b-4228-460e-bb2a-5a457f9ce78c	Bellevuegatan	Gata i Karlstad	Karlstad	59.367115	13.450687	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a288596-a103-43a4-8854-48742c29b0e7	Sandelsgatan	Gata i Karlstad	Karlstad	59.368718	13.455069	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
933aa948-97be-42b7-90e3-dc485b94810d	Drottninggatan	Gata i Karlstad	Karlstad	59.379254	13.500414	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
440a098a-e02c-4c51-9f6b-08656dc1a565	Ransätersgatan	Gata i Karlstad	Karlstad	59.391895	13.519657	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4aaa7afe-84a8-4204-bb9d-fbd5c924ce77	Norrstrandsgatan	Gata i Karlstad	Karlstad	59.391096	13.520568	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
98d7beaf-f8cd-44a1-8085-bebec260d6a2	Alstersgatan	Gata i Karlstad	Karlstad	59.392962	13.528351	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a233828-ccf4-46d3-9d69-3d9a05940d12	Lagmansgatan	Gata i Karlstad	Karlstad	59.390393	13.527876	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d96cdaf4-51ab-4a6a-9693-e80f1cdc8d6d	Örsholmsleden	Gata i Karlstad	Karlstad	59.389424	13.532272	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5937bd9-0209-4496-aa4d-6849955d3dab	Lantvärnsgatan	Gata i Karlstad	Karlstad	59.382635	13.527045	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61dfaba8-b8ff-4e01-b62a-eb7f5117c587	Bilanrondellen	Gata i Karlstad	Karlstad	59.378844	13.508719	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4dea4f8-33f4-4054-9050-9bc45998bc9c	Hamngatan	Gata i Karlstad	Karlstad	59.378572	13.491452	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
adf71130-9a52-42d0-a9d8-e3dd0d86c0a8	Hagaleden	Gata i Karlstad	Karlstad	59.38197	13.517005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92d76149-7ccc-43fe-9748-fad4e01dba74	Södra Ljungbygatan	Gata i Karlstad	Karlstad	59.388097	13.526947	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58f244e3-6327-45a8-bc28-5799f6463012	Norra Ljungbygatan	Gata i Karlstad	Karlstad	59.38878	13.527378	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
de27206d-f13b-472e-ae09-17451f937da0	Kartåsgatan	Gata i Karlstad	Karlstad	59.38915	13.528305	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a202910-face-4f77-9d40-07ebbbc1ccbf	Älvrosgatan	Gata i Karlstad	Karlstad	59.389573	13.528658	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7c8ab970-2cee-4930-ae61-08f70881eb62	Björkhagsvägen	Gata i Karlstad	Karlstad	59.390249	13.530116	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
17ac1791-1f39-4493-a107-48fc12c95d62	Horsensgatan	Gata i Karlstad	Karlstad	59.409729	13.526755	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
17f165b2-0ec2-4fb6-872e-81e7c55af371	Vårgatan	Gata i Karlstad	Karlstad	59.403026	13.562965	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2b0a36f-29a5-4430-88c1-b16be155c102	Triogatan	Gata i Karlstad	Karlstad	59.41286	13.569607	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
25dea0f1-f10e-4000-8b11-0066c6d44f59	Duettgatan	Gata i Karlstad	Karlstad	59.41178	13.572211	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5fce94b7-81a7-4ab9-b499-f0f3208fb0b3	Banjogatan	Gata i Karlstad	Karlstad	59.410249	13.570865	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
044eabe8-46b7-4323-b6a1-27efa26ad951	Kantelegatan	Gata i Karlstad	Karlstad	59.41004	13.569223	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2be5c9a-a67b-4053-8034-f6ae43843c3f	Klasmossevägen	Gata i Karlstad	Karlstad	59.408679	13.573345	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ca1fc4c-37d7-475c-9e19-f6b8bb225563	Signalhornsgatan	Gata i Karlstad	Karlstad	59.404919	13.57273	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ead6efe-df37-4799-a97d-3fb3fa135355	Välsviksleden	Gata i Karlstad	Karlstad	59.388684	13.562704	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d91fd32-f8d4-48c8-a2d9-ec7e642b4aa0	Västanvindsgatan	Gata i Karlstad	Karlstad	59.384483	13.535106	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
adb6b0fc-16a1-4d18-9045-1987fcb26668	Lambergsrondellen	Gata i Karlstad	Karlstad	59.378833	13.543031	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5da2415-3086-4cfd-b3f1-1a62ceaaf5dd	Elverumsbron	Gata i Karlstad	Karlstad	59.379044	13.543805	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
271b3ec6-bf26-44ce-8eeb-acee969e9ef5	Elverumsgatan	Gata i Karlstad	Karlstad	59.378353	13.541164	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
16621546-e1d5-413b-92bd-8e6aba7e2393	Sågverksgatan	Gata i Karlstad	Karlstad	59.380955	13.538029	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
588d0270-fdc4-4564-80a8-6a703088e127	Magasinsgatan	Gata i Karlstad	Karlstad	59.381805	13.515683	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7d4e0ed-323b-4c6e-bd61-aafe4c01023c	Rosenborgsgatan	Gata i Karlstad	Karlstad	59.372386	13.479621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
830b2552-3f09-4243-942e-c713576025d0	Råtorpsbågen	Gata i Karlstad	Karlstad	59.402127	13.486869	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a524df54-afed-4f9b-86ee-1458c34deaf0	Sanna Allé	Gata i Karlstad	Karlstad	59.40009	13.491578	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0380357-79cc-4e3d-ad1c-878625a7eadf	Råtorps Allé	Gata i Karlstad	Karlstad	59.400667	13.491494	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ef70b88-7033-4674-aee3-90a27058ed49	Galoppstigen	Gata i Karlstad	Karlstad	59.401675	13.492106	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f797cd2-f69a-4d0a-b108-dbb029caf28d	Rosenbadsgatan	Gata i Karlstad	Karlstad	59.376511	13.500399	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2670a15-2b59-48a9-8065-e01ff3f2a554	Konduktörsgatan	Gata i Karlstad	Karlstad	59.376385	13.497058	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bebb9de8-b1ce-4485-b4d1-bca3f671cb5b	Vikengatan	Gata i Karlstad	Karlstad	59.377237	13.492783	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48e97961-89ee-4e39-8f98-14d78427932e	Stinsgatan	Gata i Karlstad	Karlstad	59.376286	13.4987	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f12639db-4572-4dd0-9692-1eb0cd2fcc4c	Orrholmsplan	Gata i Karlstad	Karlstad	59.369168	13.498861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aab28781-3de6-4f77-86ed-6b2d3edea9ca	Älvgatan	Gata i Karlstad	Karlstad	59.379813	13.4866	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb986a2a-3e11-476e-97a9-9fc4a8cb9f46	5:e Villagatan	Gata i Karlstad	Karlstad	59.380994	13.477377	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc9905ca-2c67-4087-b2c5-f5d2f516e6f4	Strands Tvärgata	Gata i Karlstad	Karlstad	59.381154	13.476317	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f7fe23c-4641-418d-bc33-c432e0384a9c	4:e Villagatan	Gata i Karlstad	Karlstad	59.381101	13.479166	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da5b4657-a367-41a1-bfe4-18f5dc81a04d	3:e Villagatan	Gata i Karlstad	Karlstad	59.380563	13.479899	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
79062559-963c-4d56-a479-2de3735e9690	2:a Villagatan	Gata i Karlstad	Karlstad	59.381226	13.480742	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd25f74d-d5b7-4c32-a56d-acadbdd62017	1:a Villagatan	Gata i Karlstad	Karlstad	59.381251	13.481939	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5278b9fb-0739-4846-9b41-f2687b97822e	Tingvallagatan	Gata i Karlstad	Karlstad	59.380482	13.50448	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
13f02cdc-b552-4b7e-8524-cef25ec250c4	Nygatan	Gata i Karlstad	Karlstad	59.381959	13.512177	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4b031d8-c51e-46dc-b53e-e6dc7ab6012a	Bjurbäcksgatan	Gata i Karlstad	Karlstad	59.385934	13.505739	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eebef1b0-8edf-433e-9f58-b49bf3ec07bf	Dalgrensgatan	Gata i Karlstad	Karlstad	59.386339	13.508914	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0cdacb78-c275-459c-9a5a-aa0997c98d47	Källgatan	Gata i Karlstad	Karlstad	59.386999	13.510461	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a31a845-c331-44ee-8a30-e8f6ff48fa18	Mejerigatan	Gata i Karlstad	Karlstad	59.381632	13.464393	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4afba6b8-923c-4c5b-9fd9-59480ddbd757	Södra Kyrkogatan	Gata i Karlstad	Karlstad	59.379428	13.506225	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
deec8802-236f-4d9a-88a8-c48c7dbec4cb	Brogatan	Gata i Karlstad	Karlstad	59.38675	13.507333	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92bdab18-d66b-4c85-af39-72050778c122	Skogaholmsvägen	Gata i Karlstad	Karlstad	59.41534	13.485366	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
96fc5627-f142-402e-830c-c44e6b72d385	Lagergrens gata	Gata i Karlstad	Karlstad	59.372674	13.507488	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd45c07d-8e96-488c-be82-fa3990cee05a	Kanikenäset	Gata i Karlstad	Karlstad	59.370076	13.510984	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e693450-64c7-48e9-b49b-a0e35d50b93d	Kanikenäsbanken	Gata i Karlstad	Karlstad	59.37089	13.512091	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9de5e53d-4b6b-4c72-8780-65a42b422790	Karlagatan	Gata i Karlstad	Karlstad	59.377437	13.514209	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab44da6d-8037-4816-92d8-d308e34b658e	Verkstadsgatan	Gata i Karlstad	Karlstad	59.380319	13.515962	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e5e7be5-f3fe-420c-a79d-3e600a86f6a9	Herrhagsgatan	Gata i Karlstad	Karlstad	59.379447	13.518662	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
946a176b-8565-4ed4-9299-483a64b6efb8	Filaregatan	Gata i Karlstad	Karlstad	59.37956	13.517139	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5eb32cb-c6bc-4454-be49-a8a7a942c2fa	Sveagatan	Gata i Karlstad	Karlstad	59.377574	13.520548	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7a9abeb-d603-4f59-9812-d504fbdeec7e	Långgatan	Gata i Karlstad	Karlstad	59.378564	13.520423	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9107a6f-3765-4929-b812-b0cdac71b1de	Bergslagsgatan	Gata i Karlstad	Karlstad	59.379803	13.521092	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1199f1c0-5ff0-4e8c-9241-c40b4fd4bf60	Sundbergsgatan	Gata i Karlstad	Karlstad	59.378518	13.516703	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fcb08536-3213-432e-9fe2-ff749535d4c0	Noreengatan	Gata i Karlstad	Karlstad	59.388648	13.504569	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c0c48d0-1a1b-444b-b113-16a8e77aadbb	Agardhsgatan	Gata i Karlstad	Karlstad	59.38806	13.504393	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1a87e00-62de-42b6-a5b9-40b478d1af82	Wibeligatan	Gata i Karlstad	Karlstad	59.390843	13.506521	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e3211d8-7d21-43cf-9cc9-63386cf9eb61	Pilgatan	Gata i Karlstad	Karlstad	59.390001	13.505003	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
115fe61a-d451-4e64-bd7d-8bed87819b00	Elfdaliusgatan	Gata i Karlstad	Karlstad	59.387475	13.504007	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
213633bf-55bc-4dc0-a485-0efc03069bd5	Millénsgatan	Gata i Karlstad	Karlstad	59.391857	13.507326	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b5fafc0-23d3-45fe-9218-b3c750b0ed42	Fahlgrensgatan	Gata i Karlstad	Karlstad	59.379197	13.515936	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
221fcf83-7760-477e-b7ab-6251baa72c9e	Mellqvistgatan	Gata i Karlstad	Karlstad	59.379329	13.5152	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d208787a-5dfb-4eb4-8a81-06e70d2e9c61	Fabriksgatan	Gata i Karlstad	Karlstad	59.383623	13.51466	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8a58543-0760-4161-b8a1-880129dba9f1	Hagagatan	Gata i Karlstad	Karlstad	59.383179	13.512629	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
159df67f-6958-4ffd-b04d-33d1888ae13b	Jägartorpsvägen	Gata i Karlstad	Karlstad	59.415277	13.492194	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
463da64e-5d13-4acd-9d5c-988d641a5952	Svanågatan	Gata i Karlstad	Karlstad	59.382288	13.478326	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a767a327-d093-4b94-bdcf-444a7874dc1f	Fagottgatan	Gata i Karlstad	Karlstad	59.400747	13.568395	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2943ab6-97d7-427f-a597-692fd845f8eb	Edebäcksgatan	Gata i Karlstad	Karlstad	59.395533	13.536294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
895da5c9-a73c-45a5-afaa-3e213b2af40e	Fredsgatan	Gata i Karlstad	Karlstad	59.37882	13.496804	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
600ab718-da42-4137-a602-60cc1944afec	Stadionvägen	Gata i Karlstad	Karlstad	59.392054	13.483303	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c857758-93a0-4e56-a357-9a7ea555ea9a	Nya Depåvägen	Gata i Karlstad	Karlstad	59.390007	13.485356	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
00511e68-7d0e-4bb8-bba2-84ff6c9db1ba	Gustaf Anders gata	Gata i Karlstad	Karlstad	59.381915	13.48566	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b7040ac-e486-4bb6-886a-3059aae5c61c	Prästängsgatan	Gata i Karlstad	Karlstad	59.368921	13.469026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99116a22-d3e4-4826-9462-e0c067a17c1e	Södra Sommarrovägen	Gata i Karlstad	Karlstad	59.367756	13.469675	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
83eb221d-2fc3-4ffc-91cf-d80711b37f0a	Klövervägen	Gata i Karlstad	Karlstad	59.368653	13.469747	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
59d8d881-c250-42be-bdde-1145c76b26f2	Apelvägen	Gata i Karlstad	Karlstad	59.369893	13.470193	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
02380ae5-cf63-4785-a21e-669a868e2287	Bellisgatan	Gata i Karlstad	Karlstad	59.372143	13.472976	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d11f5985-f126-406c-a6fc-02a0a0896805	Rosenborgsallén	Gata i Karlstad	Karlstad	59.372543	13.474403	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ee7f673-7008-41a9-bd8c-b81069a1586f	Syréngatan	Gata i Karlstad	Karlstad	59.371607	13.472079	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e63ce7aa-7f90-41a2-98af-cdbf5b101c06	Landerivägen	Gata i Karlstad	Karlstad	59.369735	13.473344	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
56fc7b79-169f-435d-bc32-05f2607178b6	Oldevigsgatan	Gata i Karlstad	Karlstad	59.371239	13.475964	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e6caf34-a067-4888-ba65-cb5f49684a1f	Fågelsångsvägen	Gata i Karlstad	Karlstad	59.369373	13.474947	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d643f7e9-9807-46fd-bce9-badfd12df52e	Hellbergsvägen	Gata i Karlstad	Karlstad	59.370925	13.479457	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d5c7573-f859-47a5-9830-02353590ba6b	John Ericssonsgatan	Gata i Karlstad	Karlstad	59.377512	13.521693	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
debb46b5-b496-419a-9757-b956de53aac6	Karlstadsvägen	Gata i Karlstad	Karlstad	59.354494	13.483605	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8e0780a-84b5-45a3-883f-07acf3ecafa5	Sannavägen	Gata i Karlstad	Karlstad	59.397078	13.481301	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf1866a1-fab4-4c51-bec5-e97d7d3628a9	Karmgatan	Gata i Karlstad	Karlstad	59.384771	13.472209	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
047043bc-d398-42ae-9244-5e5a1ae640df	Plintgatan	Gata i Karlstad	Karlstad	59.388757	13.46476	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e63192fa-b9f5-4db9-99d3-c83f368606c6	Hemvägen	Gata i Karlstad	Karlstad	59.388059	13.463572	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
00df9f5f-1953-4946-a1d9-75d70add4350	Petersbergsgatan	Gata i Karlstad	Karlstad	59.385484	13.466861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d45536d0-ed0f-4ef8-b49d-4e13fd51f1ae	Sixbacken	Gata i Karlstad	Karlstad	59.383214	13.463868	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c312456f-ea25-49a6-a146-a2e918ab01fb	Backgatan	Gata i Karlstad	Karlstad	59.384018	13.464789	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2efb49eb-ae7e-47c9-880f-0f7cf4389fb6	Stenhagsgatan	Gata i Karlstad	Karlstad	59.383955	13.468698	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2be1e2f7-ab69-442c-ac44-6b44b0edfbdf	Låglandsgatan	Gata i Karlstad	Karlstad	59.38413	13.471362	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82949706-874d-41a6-aaa2-644a4bc2f830	Inlandsgatan	Gata i Karlstad	Karlstad	59.385678	13.470712	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ffe3465-2067-40c9-acfd-cc247975cac1	Rådjursvägen	Gata i Karlstad	Karlstad	59.405024	13.549384	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
73922767-5f82-4af8-bc4c-9c95acf4c5d6	Lekattsvägen	Gata i Karlstad	Karlstad	59.406316	13.547033	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a27aebbc-941c-47cb-8992-a2d10fd602a4	Björnvägen	Gata i Karlstad	Karlstad	59.405297	13.548056	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
645c0c1e-5127-40af-96b5-85d01cb7b06a	Jonsbygatan	Gata i Karlstad	Karlstad	59.405347	13.536966	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a8f4624-013b-4551-bcf0-a0a7a63161cb	Bäntebygatan	Gata i Karlstad	Karlstad	59.405066	13.536143	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
60bf3341-4cd0-4693-a87d-f61b13398608	Björbygatan	Gata i Karlstad	Karlstad	59.40458	13.536497	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f91103d3-1b66-47a0-b184-7b1b3c889d00	Hjortvägen	Gata i Karlstad	Karlstad	59.405451	13.550548	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f5fc787-58de-4a8e-9520-c228b3403576	Hasselbolsgatan	Gata i Karlstad	Karlstad	59.406571	13.537077	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f32b3ec6-43e7-44a7-8b9b-92b0902c9ce0	Kronoskogsgatan	Gata i Karlstad	Karlstad	59.409249	13.538474	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
237bb89f-0410-456f-98ae-c5ea936aed18	Öjenäsgatan	Gata i Karlstad	Karlstad	59.409497	13.534243	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
13d6edf8-e080-4b96-b284-524c6e61a629	Spelnäsgatan	Gata i Karlstad	Karlstad	59.40876	13.535294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ffe7f20-a48b-49e1-be6f-196183790098	Fogdemyrsgatan	Gata i Karlstad	Karlstad	59.40731	13.533226	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
57889a32-468d-410b-b6ab-2badd79d8e3a	Inkörsvägen	Gata i Karlstad	Karlstad	59.403737	13.547074	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b03af3a-616a-4f26-829c-0f99bd739e4a	Geijersgatan	Gata i Karlstad	Karlstad	59.375518	13.517197	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
21504a99-a3e3-45c5-9e74-caa8416a2b9b	Parkgatan	Gata i Karlstad	Karlstad	59.3791	13.522901	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
54f8c8e4-a55f-44fc-a5b5-6971e4ff0803	Granhultsliden	Gata i Karlstad	Karlstad	59.410901	13.563381	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f406eba-c151-453c-bd98-9cb238927716	Slånbärsliden	Gata i Karlstad	Karlstad	59.410924	13.561719	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43953d98-b1ed-4ce7-8a76-461c327c484e	Tranbärsliden	Gata i Karlstad	Karlstad	59.409788	13.562257	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fbcba8cd-7149-462a-bdc4-131bd4b38c91	Hjortronliden	Gata i Karlstad	Karlstad	59.411579	13.564235	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
685e9876-4f1e-441c-b12b-a14edcb3d6bb	Kråkbärsliden	Gata i Karlstad	Karlstad	59.412245	13.564554	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
45a013f6-c226-4ce7-aff1-da3101e8b550	Garvaregatan	Gata i Karlstad	Karlstad	59.382908	13.516202	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7825a18-1399-4354-b9da-1073d26e274b	Åttkantslunden	Gata i Karlstad	Karlstad	59.381468	13.520207	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e2db9f3-f9c5-45ee-9c58-d7a2ba3f9469	Långenäsvägen	Gata i Karlstad	Karlstad	59.414032	13.562858	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a5ce7ce5-9528-4132-ba7a-89d6ce434c89	Hedvägen	Gata i Karlstad	Karlstad	59.389054	13.555994	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fefbb54-ce14-4223-ad5e-03d6596d1118	Sjöstadsvägen	Gata i Karlstad	Karlstad	59.386747	13.529931	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1fcdeeab-ad0d-4250-abe1-d7f496a2833a	Brännmyrsgatan	Gata i Karlstad	Karlstad	59.41302	13.552147	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
02c2894e-e6a4-41f5-af60-6f314ec785e3	Dalmyrsgatan	Gata i Karlstad	Karlstad	59.415046	13.550217	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
71eef34e-40ef-4852-a95c-8e61c58cc564	Granmyrsgatan	Gata i Karlstad	Karlstad	59.415625	13.54839	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ddc95cf2-0892-475b-b323-06e2c7cf1556	Getmyrsgatan	Gata i Karlstad	Karlstad	59.415087	13.548866	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c706e2e2-4b69-40c3-8237-5055ed24d421	Finnmyrsgatan	Gata i Karlstad	Karlstad	59.41453	13.549533	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
21642a72-7b9a-4f13-980f-64ebaa562980	Enmyrsgatan	Gata i Karlstad	Karlstad	59.41406	13.550046	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5bcc329-2885-43fb-bcfb-2c01103d03a2	Källmyrsgatan	Gata i Karlstad	Karlstad	59.416114	13.547774	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f16c1126-be04-4269-9162-14ce45489536	Mossgatan	Gata i Karlstad	Karlstad	59.407815	13.530557	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c35f737d-2dfe-4afe-9734-046f6d71d0eb	Kyrkogårdsallén	Gata i Karlstad	Karlstad	59.399558	13.527686	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
abd3cd4c-76a2-4e9f-953f-5e5162689cdc	Lägatan	Gata i Karlstad	Karlstad	59.380142	13.54801	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f70fa25-3143-4e19-9047-9d1debead636	Gitarrgatan	Gata i Karlstad	Karlstad	59.407508	13.5673	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
33790d3a-61af-43d0-bdc9-f2abce25d1a8	Häljebolsgatan	Gata i Karlstad	Karlstad	59.408124	13.537858	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8994b0a8-66fd-40e0-84c5-d244f70f6a65	Kyrkebolsgatan	Gata i Karlstad	Karlstad	59.408722	13.537406	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5eb14065-9b41-4425-88f4-44cbb615989e	Klässbolsgatan	Gata i Karlstad	Karlstad	59.408394	13.53669	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe7092bc-9855-4126-a1e9-7d084de9d5c3	Munkebolsgatan	Gata i Karlstad	Karlstad	59.409359	13.537165	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
23daffd1-255f-42a0-bcb3-bcc998d27b46	Tjusbolsgatan	Gata i Karlstad	Karlstad	59.410015	13.53707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd66c55a-f253-4c42-944b-43c97971ad41	Osebolsgatan	Gata i Karlstad	Karlstad	59.409675	13.53645	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ea61e80-7b13-4a27-ab30-2ef4b9ad7e1e	Gaperudsgatan	Gata i Karlstad	Karlstad	59.411358	13.54332	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ea89e52-fada-45d7-8901-ca0d7cbb307b	Högerudsgatan	Gata i Karlstad	Karlstad	59.411178	13.544177	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4a61002-f86b-4521-87df-b748461c4de4	Mosserudsgatan	Gata i Karlstad	Karlstad	59.410844	13.547493	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c1bcee7-1b6d-4ce7-9159-cb3f845e9302	Blombackagatan	Gata i Karlstad	Karlstad	59.414444	13.542863	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d38d887-8c73-4d36-863a-6c3488658b52	Bergsbackagatan	Gata i Karlstad	Karlstad	59.412778	13.544136	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bce00293-fd0d-4d3e-a69e-1d8ffdf02038	Dalbackagatan	Gata i Karlstad	Karlstad	59.414354	13.544493	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
145cfbef-771a-4b06-9f48-76821c8e3ebe	Bybackagatan	Gata i Karlstad	Karlstad	59.413468	13.545425	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
661c7c25-5b31-4740-b2ad-1c929f8134af	Enbackagatan	Gata i Karlstad	Karlstad	59.414149	13.542005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a516fd0-9c3a-4bc2-abc7-fcc2fac02c8d	Finnbackagatan	Gata i Karlstad	Karlstad	59.415389	13.542311	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86dd22fa-243e-498a-bbac-e0b4ae2b55dc	Högbackagatan	Gata i Karlstad	Karlstad	59.415674	13.542603	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffb5fec8-6968-43f2-bd3f-62f4c8fe132f	Gräsbackagatan	Gata i Karlstad	Karlstad	59.415515	13.540663	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5c79b59-bfcf-4080-a76a-dbc837d89f81	Bävervägen	Gata i Karlstad	Karlstad	59.406798	13.551768	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
65602763-ffcc-4d88-8479-ac6a9b8d6ada	Flöjtgatan	Gata i Karlstad	Karlstad	59.400171	13.573034	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
28d6322e-cbac-4940-805e-807b3f37da14	Basungatan	Gata i Karlstad	Karlstad	59.402165	13.563384	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c1a73ef-dfe4-44d2-a260-5b7e28918dfd	Jakthornsgatan	Gata i Karlstad	Karlstad	59.405279	13.566769	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e2f1fae-a0b3-470c-8982-31d291aa6b46	Sillerudsgatan	Gata i Karlstad	Karlstad	59.410911	13.548413	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
207ed4f3-3790-48ef-a941-10203d7ffd3a	Kvarnbergsgatan	Gata i Karlstad	Karlstad	59.377007	13.48956	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5798a93-5681-4ecc-977d-109f2a3707bf	Fryksdalsgatan	Gata i Karlstad	Karlstad	59.37523	13.486384	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
230914e9-f97f-47f4-a6b7-88db27b05b39	Sannagatan	Gata i Karlstad	Karlstad	59.404152	13.48682	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
361f8b82-9aa4-4280-90f9-79908a5fd977	Norra Fjärstadsgatan	Gata i Karlstad	Karlstad	59.408319	13.4875	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
38d4febc-4316-4e86-94f4-ce8ffdd11d35	Hertig Carls väg	Gata i Karlstad	Karlstad	59.390307	13.514319	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a559fd16-8918-4e98-af8f-20cbd7e547df	Långserudsgatan	Gata i Karlstad	Karlstad	59.410855	13.545784	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6bbe5a77-a91d-4324-b35b-610985e8f562	Tullhusgatan	Gata i Karlstad	Karlstad	59.375369	13.504156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d9a1359-060d-43e6-938b-f86be1ddc95f	Hedjämnan	Gata i Karlstad	Karlstad	59.388443	13.566022	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
95373006-6e03-4ad8-bc7d-a41a0c715d90	Östra Klarälvsgatan	Gata i Karlstad	Karlstad	59.383914	13.530113	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c19f8d10-d3c3-4e42-ac8e-e24aaf669bdb	Torparegatan	Gata i Karlstad	Karlstad	59.3835	13.529139	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74a1e4ab-7c84-4331-b504-de0a9b59ce2a	Pumpgatan	Gata i Karlstad	Karlstad	59.383038	13.523459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87f6229a-5a28-427a-9bb2-0cdd62611627	Örsholmsgatan	Gata i Karlstad	Karlstad	59.383411	13.525425	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
24a0379e-54fb-477b-9ea0-c99795d07d19	Föreningsgatan	Gata i Karlstad	Karlstad	59.383815	13.526319	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ce05ccf-8451-4bb8-a518-259d83ffd053	Gräsdalsgatan	Gata i Karlstad	Karlstad	59.378465	13.45126	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d95ece5-1c1d-46e6-b1fa-aa7d8ce9dd36	Frögatan	Gata i Karlstad	Karlstad	59.376808	13.446281	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
677e7399-5a7b-4bdb-af69-b1d836f0a326	Strågatan	Gata i Karlstad	Karlstad	59.377652	13.450643	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2062edf8-cd2d-413d-8ecd-8c0c1161a1b5	Axgatan	Gata i Karlstad	Karlstad	59.374763	13.445872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5805af7e-819d-4825-a8e7-ff511a1f8929	Eriksborgsgatan	Gata i Karlstad	Karlstad	59.393091	13.517662	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92b21774-e7e8-4a08-aecf-e10b4fc3562d	Västra Rosenlundsgatan	Gata i Karlstad	Karlstad	59.39781	13.538532	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
606480de-7ca3-4f9d-a351-143d0fac3507	Kärrängsgatan	Gata i Karlstad	Karlstad	59.397181	13.544265	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f63a004-3ffa-41b3-a1e2-a1bfe65c4173	Fridhemsgatan	Gata i Karlstad	Karlstad	59.398636	13.544311	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c92fd9d4-2ffd-4321-801b-1c18996205fb	Åshammargatan	Gata i Karlstad	Karlstad	59.399206	13.546254	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b47df936-7e20-4f4c-adbd-8cb8321d1ad7	Skraggegatan	Gata i Karlstad	Karlstad	59.387235	13.532691	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
96c375b4-23dd-4df8-ac24-be2cbe68d372	Västra Sjöstadsgatan	Gata i Karlstad	Karlstad	59.387337	13.531673	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4d91053-dac9-417f-9758-aac7cdf743aa	Västra Fjellstedtsgatan	Gata i Karlstad	Karlstad	59.386909	13.530092	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3694bb84-bdd7-4de7-9688-808fdefcaf12	Laxågatan	Gata i Karlstad	Karlstad	59.387084	13.529066	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
daf5771d-df8c-4d72-abc7-92205e194f6a	Mimergatan	Gata i Karlstad	Karlstad	59.386669	13.536353	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
55461256-cfb0-4d93-b9f5-2e8b4e00fa33	Magnegatan	Gata i Karlstad	Karlstad	59.386782	13.539533	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a5c8bcf-6f2a-4bab-808d-a2cc2df41151	Modegatan	Gata i Karlstad	Karlstad	59.387011	13.538718	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4abf4dca-a152-4f24-a5a2-67b31cc8de04	Baldersgatan	Gata i Karlstad	Karlstad	59.387127	13.537578	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
89ad1e0b-8bdd-45d0-b1b5-436d1e6f5412	Frejgatan	Gata i Karlstad	Karlstad	59.387306	13.536445	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e95ed374-a0cc-4dfe-a458-b14221a6f92e	Ymergatan	Gata i Karlstad	Karlstad	59.38734	13.535211	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f59b9216-d1aa-4e5e-9624-3a051fc60a34	Östra Sjöstadsgatan	Gata i Karlstad	Karlstad	59.38708	13.53362	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ace826b-4e52-471f-b44e-2fc104741012	Östra Fjellstedtsgatan	Gata i Karlstad	Karlstad	59.387746	13.534487	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
81e338b7-e042-4ab3-8946-0847e22d1d30	Bivägen	Gata i Karlstad	Karlstad	59.346931	13.503524	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5167934b-7d01-4dc3-af51-2f3bf45eb0a0	Skoghemsgatan	Gata i Karlstad	Karlstad	59.402581	13.513677	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d300ddf5-fd70-488e-814c-f2483d48a5f4	Gunnebogatan	Gata i Karlstad	Karlstad	59.404709	13.492477	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3bb84403-b74a-4208-9147-0fda4431f7cf	Fagerstagatan	Gata i Karlstad	Karlstad	59.405293	13.490152	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
424c187a-35ae-4429-af9e-d1eb2fe84f7c	Dalhemsgatan	Gata i Karlstad	Karlstad	59.405299	13.492269	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
88070375-fb21-465e-ba77-2323f367521d	Södra Fjärstadsgatan	Gata i Karlstad	Karlstad	59.407841	13.489828	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6141a44-a459-4e0b-85cd-b3337d3b2472	Lillgatan	Gata i Karlstad	Karlstad	59.3732	13.487583	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b43d296b-20cf-4b10-ba4c-9a0d1255659a	Treffenbergsvägen	Gata i Karlstad	Karlstad	59.370931	13.48619	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d89bc73-0bb7-4302-a869-c7d31cda77b6	Granliden	Gata i Karlstad	Karlstad	59.397988	13.542583	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
60043d84-d8bc-47ff-9cf7-2e68ca27a477	Skidbacksvägen	Gata i Karlstad	Karlstad	59.391872	13.531615	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e61ccf7-da7a-4355-932c-1861f71216dd	Malménsgatan	Gata i Karlstad	Karlstad	59.387223	13.512573	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
951b8bf8-d40d-4f65-b8d4-c1649930cbcf	Drottning Kristinas väg	Gata i Karlstad	Karlstad	59.388879	13.513146	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e992577-e6fb-4892-a2b3-fbb7cf144cb3	Köpmannagatan	Gata i Karlstad	Karlstad	59.376028	13.503389	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3e68fc6-45c7-48c2-8ac1-595f3f047d90	Båtmansgatan	Gata i Karlstad	Karlstad	59.376579	13.492609	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7cdb7d97-7481-4720-964e-decc07d399e3	Pilgården	Gata i Karlstad	Karlstad	59.376484	13.494261	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
29702a81-611e-4af9-9356-56ceb8bea070	Vänernsgatan	Gata i Karlstad	Karlstad	59.375599	13.498481	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd33534b-74b6-45e3-a7da-033b1063ff38	Seminariegatan	Gata i Karlstad	Karlstad	59.372183	13.486669	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
073259d3-7c31-4aef-82c0-24220a0ee617	Selma Lagerlöfsgatan	Gata i Karlstad	Karlstad	59.387892	13.44076	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bfb4b0d7-d0ef-4ec0-bc25-e0ff8a52b38c	Kavaljersvägen	Gata i Karlstad	Karlstad	59.388224	13.4382	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8074fe4-4868-4e11-84d9-aa9cbacc032e	Anemongatan	Gata i Karlstad	Karlstad	59.381104	13.442945	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7cc2b77-1dba-4a8f-a662-b66c6cdb752a	Brunörtsgatan	Gata i Karlstad	Karlstad	59.381101	13.443985	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fda77d69-50f3-4d65-a84e-85c2f98d44e8	Duvkullegatan	Gata i Karlstad	Karlstad	59.380927	13.445073	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
62fece02-2980-46bd-86d9-fe33ae3bb581	Floxgatan	Gata i Karlstad	Karlstad	59.380809	13.446224	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2aa3cf2b-b99d-4c53-aa07-35770eaf3d45	Jättens väg	Gata i Karlstad	Karlstad	59.388533	13.456829	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1ea761a-521b-4d2f-b85b-85528ec42db6	Kevenhüllers väg	Gata i Karlstad	Karlstad	59.388664	13.439293	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fc4e357-dce0-4d41-8f03-a57e3eaafa99	Trollets väg	Gata i Karlstad	Karlstad	59.39049	13.455679	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0409369b-a40e-4719-8c1a-c6546c256edb	Näckens väg	Gata i Karlstad	Karlstad	59.389802	13.455639	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
72327756-7d8b-4177-91d3-a70db6e2e131	Huldrans väg	Gata i Karlstad	Karlstad	59.388197	13.455121	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
17ae0429-0673-4ac2-baac-b2264a472d58	Alfens väg	Gata i Karlstad	Karlstad	59.387507	13.454914	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
494dc65b-944c-4797-bf06-58491e9aaf79	Vasagatan	Gata i Karlstad	Karlstad	59.376411	13.518377	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92804e85-8f5a-464d-afe3-b75b0e6250c6	Flygfältsvägen	Gata i Karlstad	Karlstad	59.360025	13.472755	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2236332d-ea6d-48df-9c3f-fefebf15b336	Blekegatan	Gata i Karlstad	Karlstad	59.373658	13.556877	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0f03503-b6a5-4ff8-ae4c-24d56d844e2b	Lovartsgatan	Gata i Karlstad	Karlstad	59.377004	13.560228	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8c00b1c-79ef-4d2a-8622-b58a50bd96ce	Östra Tyevägen	Gata i Karlstad	Karlstad	59.354366	13.569684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99c5c742-2625-4109-8d31-5242e91ae1f5	Handelsgatan	Gata i Karlstad	Karlstad	59.375917	13.50392	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad8f1b58-ce25-4897-8c87-5295abe263da	Orrholmsgatan	Gata i Karlstad	Karlstad	59.373149	13.499169	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bcbfbb71-b699-4d85-979e-61791056d738	Zakrisdalsvägen	Gata i Karlstad	Karlstad	59.365539	13.439372	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d42d06a8-a86b-4395-945c-18c9d0cc8df5	Tvärvägen	Gata i Karlstad	Karlstad	59.367427	13.447104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a72a4c0-e2b8-4be4-b8af-419480d76a51	Lillkullegatan	Gata i Karlstad	Karlstad	59.367641	13.449888	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
17eccccf-75c6-4b40-b93a-21b74c4737c7	Rundelgatan	Gata i Karlstad	Karlstad	59.368148	13.448376	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d95285a-5c75-4f93-9bb3-55dff104dcc2	Storkullegatan	Gata i Karlstad	Karlstad	59.367803	13.444675	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb777085-bed9-40c4-be32-b82589b09281	Ullebergsvägen	Gata i Karlstad	Karlstad	59.372178	13.455375	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eaf35a6a-00d6-4da8-90a1-ef8bee2f864c	Prästbergsvägen	Gata i Karlstad	Karlstad	59.407375	13.474909	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9814ec0e-96e3-4aea-a6a2-04244bd42d83	Vänsbergsvägen	Gata i Karlstad	Karlstad	59.41151	13.440893	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3e8383b-3849-4a38-93b5-f8fc96abb5aa	Faktorigatan	Gata i Karlstad	Karlstad	59.380379	13.52647	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e72b1d5f-e2b2-492e-ab0a-208a9e9ca025	Genvägen	Gata i Karlstad	Karlstad	59.390514	13.531812	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
66deeab8-ec7d-4187-92b8-a28c2f39d5d1	Lyckhemsgatan	Gata i Karlstad	Karlstad	59.397379	13.539906	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d9d2e6c-98cd-441a-a1f5-2bf7e06e12b8	Hedåsgatan	Gata i Karlstad	Karlstad	59.403212	13.538889	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aed9cfb2-1bc0-40b3-99ab-776809a250c3	Tegnérsgatan	Gata i Karlstad	Karlstad	59.374504	13.517817	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9c9bf4a-bf84-4018-87d4-313b0028ab11	Rådmansgatan	Gata i Karlstad	Karlstad	59.388325	13.523747	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b066fdeb-7a8c-4c98-ae64-b9b8e389684b	Smedjegatan	Gata i Karlstad	Karlstad	59.373953	13.516041	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a1352c81-db32-4a2e-8e45-19a7a4958ff5	Strandvägen	Gata i Karlstad	Karlstad	59.3726	13.51612	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a3fa1682-5611-49cd-89ae-d9a861266ec5	Rydalsvägen	Gata i Karlstad	Karlstad	59.404598	13.44885	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c5c77759-e61e-4c77-81f9-744e43dd3267	Rönningsvägen	Gata i Karlstad	Karlstad	59.408752	13.442701	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
feeb5809-6858-4369-a016-7f9b776eaf33	Tranelundsvägen	Gata i Karlstad	Karlstad	59.401037	13.442065	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0fa1e35c-3392-4d52-ba05-568955b39de3	Kroppkärrsallén	Gata i Karlstad	Karlstad	59.397992	13.553025	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
32106c63-aa13-4377-af33-6270fc70378d	Bergendorffsgatan	Gata i Karlstad	Karlstad	59.377119	13.509333	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b89f586-63b2-41ac-92dc-73bd4206b8bd	Ahlmarksgatan	Gata i Karlstad	Karlstad	59.37709	13.510462	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
65822807-3b1e-4843-8102-cb100d423b1a	Olovsgatan	Gata i Karlstad	Karlstad	59.381071	13.520007	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46ea52ce-963c-4f3f-a8b3-4b0f70eef5a2	Industrigatan	Gata i Karlstad	Karlstad	59.38183	13.528863	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2ee539c9-031d-413d-932d-4c6172f0795b	Engholmsgatan	Gata i Karlstad	Karlstad	59.377482	13.529602	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7204d4e-4c2a-486a-adc3-fce292e27b19	Stagnellsgatan	Gata i Karlstad	Karlstad	59.377917	13.513545	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca659dfe-00bf-47a5-8522-b600fed88062	Lambergsgatan	Gata i Karlstad	Karlstad	59.377336	13.530829	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e39537a-f4da-412f-91e3-e46699bd82d6	Tulegatan	Gata i Karlstad	Karlstad	59.37867	13.532689	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4952c9d-65b3-486c-8ed9-de897baee901	Högalidsgatan	Gata i Karlstad	Karlstad	59.378095	13.534006	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc20d169-bfcd-4e18-80bd-364d57b1eea0	Lundgrensgatan	Gata i Karlstad	Karlstad	59.378237	13.53455	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
afc00bd4-2b38-4ce4-8c17-d7ea14dd4ae8	Björkstigen	Gata i Karlstad	Karlstad	59.376753	13.530183	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e2fc61e-8b28-4fad-979e-e11a5683ccbc	Lambergsstigen	Gata i Karlstad	Karlstad	59.376882	13.53121	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0592ebd-cf73-42ea-a73c-1d39b846ca96	Lisebergsstigen	Gata i Karlstad	Karlstad	59.377148	13.530546	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c22905f8-af5f-4b49-b82b-231fd1edee03	Hamnpirsgatan	Gata i Karlstad	Karlstad	59.373564	13.524772	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b169961-7377-4d33-baa8-ec0ba5e946d9	Götgatan	Gata i Karlstad	Karlstad	59.382575	13.513382	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
64e5e307-7ebd-4849-b8ab-21d129345b76	Förgränd	Gata i Karlstad	Karlstad	59.366669	13.496582	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
05599eaa-daeb-415e-88f4-42cc9a8ccf60	Babordsgatan	Gata i Karlstad	Karlstad	59.367693	13.497936	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
640f6a77-2626-4bbe-944d-afe3bb7807c4	Hästhovsgatan	Gata i Karlstad	Karlstad	59.381731	13.458209	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6550d538-98a3-44e6-a203-99a7df49e84f	Blåklintsgatan	Gata i Karlstad	Karlstad	59.382527	13.455283	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3426e9d8-5bbe-4667-895d-da2a5c294a98	Konvaljegatan	Gata i Karlstad	Karlstad	59.383424	13.456057	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2f840ef-04a9-4056-9f68-d00f72ce14f6	Sydvärnsgatan	Gata i Karlstad	Karlstad	59.38335	13.468225	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f578835d-fc8c-4941-b5b8-8f18d28cc642	Näckrosgatan	Gata i Karlstad	Karlstad	59.384516	13.453239	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d1c4d93e-a237-4c7b-938e-49e87565b920	Kaprifolgatan	Gata i Karlstad	Karlstad	59.384091	13.446846	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
146b47de-a12e-4f69-bddd-811b71789c6e	Lavendelgatan	Gata i Karlstad	Karlstad	59.382716	13.445216	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
134531a4-0f73-4691-988c-b02a689f06d4	Gulsporregatan	Gata i Karlstad	Karlstad	59.381053	13.447965	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0510a050-8ed6-42a0-ad84-68e1d9c206bb	Piongatan	Gata i Karlstad	Karlstad	59.382969	13.456295	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c316e25a-961b-4235-93be-9cddc9efb4e6	Källarstugevägen	Gata i Karlstad	Karlstad	59.379869	13.461442	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
94177d3a-8038-4999-a185-f6addd859dfc	Gruvlyckevägen	Gata i Karlstad	Karlstad	59.377958	13.461885	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b633931f-22a5-476d-9156-872dcc84d524	Resedagatan	Gata i Karlstad	Karlstad	59.385216	13.4542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
68052a29-8769-4587-aeee-7c818ed0ca8e	Svalörtsgatan	Gata i Karlstad	Karlstad	59.385145	13.457316	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ae6893a-e90c-48a0-bf82-11939c0bbb2b	Vitsippsgatan	Gata i Karlstad	Karlstad	59.384741	13.455681	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
060b051c-5602-4f31-bb8a-251fcb5086b3	Blåeldsgatan	Gata i Karlstad	Karlstad	59.384293	13.451554	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
90beab82-44ef-49c6-88db-4065a07a5449	Fackelrosgatan	Gata i Karlstad	Karlstad	59.384125	13.450573	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1c1a2dc-ae36-4d79-89c5-6d32d6de36a9	Kamomillgatan	Gata i Karlstad	Karlstad	59.38359	13.448572	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9cec7ae-05f5-49fa-8ba0-7b0c9f3c55eb	Nolgårdsvägen	Gata i Karlstad	Karlstad	59.347479	13.499671	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb8fe4f7-7744-4139-9740-fc63b67eba9a	Gruvgången	Gata i Karlstad	Karlstad	59.37688	13.454875	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5289478b-fd09-4b16-96db-55428ab895e1	Västra Gustavsbergsvägen	Gata i Karlstad	Karlstad	59.387372	13.451016	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
404e1487-ff12-4e03-9bda-d6ecca48944a	Norra Gustavsbergsvägen	Gata i Karlstad	Karlstad	59.390492	13.45337	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bffbdacf-6a7c-4349-8ee9-89b67ab0e4fb	Nymfens väg	Gata i Karlstad	Karlstad	59.38888	13.455406	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
588f8420-9784-43ab-9dab-2e2faabbab2b	Ölmegatan	Gata i Karlstad	Karlstad	59.376916	13.484303	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0cfa1d5b-a5ef-4ef5-8aaa-3c518effc90e	Älvdalsgatan	Gata i Karlstad	Karlstad	59.37601	13.486187	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
79aabc04-c88b-425c-8f45-bfd0e4bbacdd	Gillbergsgatan	Gata i Karlstad	Karlstad	59.377089	13.485806	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
73aedd24-2b4c-4649-8406-94c83f329963	Nordmarksgatan	Gata i Karlstad	Karlstad	59.378495	13.485282	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
31a5dbc7-258c-4427-855b-5cb8e31d626b	Rödboksgatan	Gata i Karlstad	Karlstad	59.379078	13.48636	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
668ac528-e225-4348-8cc3-661ad01c01ac	Poppelgatan	Gata i Karlstad	Karlstad	59.378878	13.485533	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58e22c9e-5bb6-4adb-a78e-71d0167404d5	Videgatan	Gata i Karlstad	Karlstad	59.378374	13.483218	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
60ba9122-9350-4712-943f-8f67af8e2e5c	Nyedsgatan	Gata i Karlstad	Karlstad	59.378074	13.484981	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a81688a-8991-4bb8-8efb-bb74cd7d2a96	Gelinsgatan	Gata i Karlstad	Karlstad	59.375977	13.483512	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c20bbaa8-0e8e-42bb-a1aa-56844a69cd90	Färnebogatan	Gata i Karlstad	Karlstad	59.377248	13.48423	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
437d7260-ebce-40c1-a488-c82aeb34cd82	Mamsell Dillners väg	Gata i Karlstad	Karlstad	59.39133	13.44626	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1083d7b7-be6c-4323-968d-72f234f8f99b	Dunungevägen	Gata i Karlstad	Karlstad	59.391339	13.441814	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
20f992e8-49f7-4abe-9325-5801dafbaacf	Ebba Dohnas väg	Gata i Karlstad	Karlstad	59.386704	13.441271	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ed9baeee-7009-410e-9caf-552a6a55a66a	Kaptens Ugglas väg	Gata i Karlstad	Karlstad	59.388196	13.436275	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ef199d9-4407-4b65-bbe3-fcde0ab7068f	Nåsvägen	Gata i Karlstad	Karlstad	59.383201	13.435888	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bdf9156d-e07a-4598-be6d-45e27730f9c9	Liljecronas väg	Gata i Karlstad	Karlstad	59.387758	13.435444	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fdc234dd-dd7a-4eb0-bbff-4b0cfe4ca5b2	Brobyvägen	Gata i Karlstad	Karlstad	59.384031	13.438083	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b8c5177-a042-411f-8ef7-eb7edcb2a88d	Borgvägen	Gata i Karlstad	Karlstad	59.383449	13.438792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
73dd3f53-0ec7-4e15-8826-1a734bf238d8	Gurlittavägen	Gata i Karlstad	Karlstad	59.383454	13.437645	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7051552-71f4-4d25-a8fe-afd5b96201a0	Forsvägen	Gata i Karlstad	Karlstad	59.383035	13.438222	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d4f607c-86fc-48a4-a997-1643a9afdbfd	Fru Gustavas väg	Gata i Karlstad	Karlstad	59.385457	13.440911	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd528b8b-c009-4f71-af25-368c9d4cb191	Morbror Rubens väg	Gata i Karlstad	Karlstad	59.386438	13.438705	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0732d7be-1c1a-4414-8ae0-a8dd905cb4a1	Lövdalavägen	Gata i Karlstad	Karlstad	59.384597	13.43872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
628a5283-2518-498a-aad1-0fdec726fcc1	Klara Gullas väg	Gata i Karlstad	Karlstad	59.391883	13.441837	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2422b3df-f79a-4f59-84d4-311c9c8e3352	Maja Råds väg	Gata i Karlstad	Karlstad	59.390832	13.445958	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c899ee6c-8b70-4f8a-8fc5-5764f9978711	Syster Edits väg	Gata i Karlstad	Karlstad	59.391307	13.446943	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
51b34481-c0c4-47fe-8c8e-a95f3b7d4988	Jungfru Fabens väg	Gata i Karlstad	Karlstad	59.388438	13.443571	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0bd58722-0e80-4b3f-ae2d-004b18fa7bf4	Anna Stjärnhöks väg	Gata i Karlstad	Karlstad	59.388315	13.44261	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7baaa1f3-4ec8-4a07-b1d5-2e8f56c89e1f	Majorskans väg	Gata i Karlstad	Karlstad	59.387196	13.442296	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
330c6223-7ad3-43b5-bf7a-177503297a8d	Lille Rusters väg	Gata i Karlstad	Karlstad	59.387777	13.439492	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
395194f8-02ed-4498-abab-39750103e26f	Patron Julius väg	Gata i Karlstad	Karlstad	59.388041	13.438323	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
160cdd9b-7269-4b3c-9627-30124c2175a8	Löwenborgs väg	Gata i Karlstad	Karlstad	59.387066	13.438916	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
165066d3-ef2c-4078-8335-419321b654e1	Zakrisdalsudden	Gata i Karlstad	Karlstad	59.365215	13.439678	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
558baa4a-f452-43e0-b05b-1d6198924820	Lindåsvägen	Gata i Karlstad	Karlstad	59.362509	13.45744	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c1a59dc-9b66-4d97-95f9-c6cf19676185	Ekåsvägen	Gata i Karlstad	Karlstad	59.362372	13.455265	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
64aa2349-ac7c-4945-b066-02ecc8e6cbdc	Artillerigatan	Gata i Karlstad	Karlstad	59.367077	13.452138	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aaefdb02-210b-41c6-b3b2-f599b4765b5b	Vidövägen	Gata i Karlstad	Karlstad	59.346311	13.466949	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fd0ea48-3e70-4cd5-b6b0-c3a8093af8c8	Styrmansgatan	Gata i Karlstad	Karlstad	59.375754	13.490148	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8aabdac9-3d16-46cc-9ca3-50307f965e6b	Tingbergsgatan	Gata i Karlstad	Karlstad	59.37452	13.489104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3304940a-f33e-484d-9e78-f4d82e135b2f	Mariebergsvägen	Gata i Karlstad	Karlstad	59.373757	13.485776	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
520cf9ad-1ace-4ad2-beec-e78bce8f35bf	Sunnanvindsgatan	Gata i Karlstad	Karlstad	59.377386	13.555559	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea67048b-8b82-4d83-83f3-82bf7967aaad	Östanvindsgatan	Gata i Karlstad	Karlstad	59.38325	13.5571	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
806c0113-f8f0-44de-8e6a-2f0c369c4b86	Nordvärnsgatan	Gata i Karlstad	Karlstad	59.384568	13.468195	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1cc169da-676f-4bfb-822d-808a2fddbbab	Vättarnas väg	Gata i Karlstad	Karlstad	59.388684	13.452903	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
05bff790-d8e1-4a39-b545-77ac20f2cbf2	Carl Crispins väg	Gata i Karlstad	Karlstad	59.377534	13.454691	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
512ff50c-6d09-4fa0-9d6e-1d14f4676c9b	Kulinggatan	Gata i Karlstad	Karlstad	59.387118	13.55531	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2201af8-f404-416f-b211-500367379373	Östra Gustavsbergsvägen	Gata i Karlstad	Karlstad	59.388512	13.453029	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e895336b-5311-4f86-8b75-b6773f138d65	Vittrans väg	Gata i Karlstad	Karlstad	59.39131	13.455571	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a85ef46a-0296-4bbf-9ca7-8a94132b8117	Dagvindsgatan	Gata i Karlstad	Karlstad	59.370706	13.552434	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
41f0bf6f-500b-4311-a9c1-61ef8e3dc015	Fallvindsgatan	Gata i Karlstad	Karlstad	59.369427	13.551915	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b91f2d3f-8d82-4353-a082-98eba91591da	Bidevindsgatan	Gata i Karlstad	Karlstad	59.369232	13.5546	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2558f39-a7a4-4559-85d9-f20e51ba848c	Kvällsvindgatan	Gata i Karlstad	Karlstad	59.368081	13.552622	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6ee932c-8043-4d7f-b03b-5ee3ef529478	Nygårdsvägen	Gata i Karlstad	Karlstad	59.383629	13.434976	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e27b02f5-8a5f-449d-9921-0ca886251ed2	Anna Svärds väg	Gata i Karlstad	Karlstad	59.39186	13.439785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb77e26d-f49e-4754-b7ca-43a64911b951	Brisgatan	Gata i Karlstad	Karlstad	59.376249	13.55514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a338e090-ae13-4bb4-910b-533d2b04ee15	Edsgatevägen	Gata i Karlstad	Karlstad	59.407328	13.558912	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
981a7240-1c72-408a-83d0-b75e80a53e65	Sommargatan	Gata i Karlstad	Karlstad	59.405254	13.561576	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5ebea9a-6c0b-4890-aff1-a8c9c5a4b3e5	Styrbordsgatan	Gata i Karlstad	Karlstad	59.367821	13.497275	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
304fb681-b542-4edc-96ce-0629eb7612d3	Björksjövägen	Gata i Karlstad	Karlstad	59.382858	13.442075	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cac65328-b030-4105-b751-58e6224efe4e	Krokusgatan	Gata i Karlstad	Karlstad	59.382207	13.453913	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
464a77cc-e048-4620-aab2-fe6eadb7e607	Snödroppsgatan	Gata i Karlstad	Karlstad	59.384244	13.454036	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7500da87-68e0-4de0-b176-66ea073ec18e	Tulpangatan	Gata i Karlstad	Karlstad	59.384321	13.457259	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
333e30ce-f182-4c74-b77a-ec90ab34526f	Gulsippsgatan	Gata i Karlstad	Karlstad	59.384687	13.454394	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
718ca7db-6d84-4098-bfd5-000091585fde	Violgatan	Gata i Karlstad	Karlstad	59.383758	13.456706	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d98f1662-7220-4c7c-a8c5-e57d03e54aec	Gullrisgatan	Gata i Karlstad	Karlstad	59.382253	13.457171	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc7fb2b8-749e-4f33-a655-e54f96c1af86	Husbyggaregatan	Gata i Karlstad	Karlstad	59.37359	13.527226	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
941629af-7f04-4ed6-a2e1-2cf1100143f7	Hedenbron	Gata i Karlstad	Karlstad	59.38968	13.563566	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
462b22e2-8984-49ac-9404-0d427698bb31	Timmergatan	Gata i Karlstad	Karlstad	59.372098	13.502564	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f6df39b-c994-4de8-89c8-9c65ac44aabd	Mariedalsbron	Gata i Karlstad	Karlstad	59.379732	13.512179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b690027-754c-41b8-9c22-e54ce63a8dac	Jungmansgatan	Gata i Karlstad	Karlstad	59.376202	13.49076	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7085bc40-cf9a-4946-a93d-a2eb220d3e8b	Redaretorget	Gata i Karlstad	Karlstad	59.375454	13.510789	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d1d39dc2-8462-49d8-b6f7-a6bc685cb123	Östra Torggatan	Gata i Karlstad	Karlstad	59.380433	13.504322	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
535a1ca2-b241-427c-98fa-764ff23dba9f	Posthornsgatan	Gata i Karlstad	Karlstad	59.405269	13.56979	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f98156f-b401-402a-9051-010d76b31ac2	Sjöängsgatan	Gata i Karlstad	Karlstad	59.396858	13.544544	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
276e4ff6-d223-48d2-a0bc-d6037b568d17	Rönngatan	Gata i Karlstad	Karlstad	59.378665	13.484644	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e4c0b7d-2439-4d2c-904a-eb71c96e2b88	Algatan	Gata i Karlstad	Karlstad	59.378998	13.483091	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3876b698-8f49-427b-9243-01eb3131b8ba	Gustaf Lovéns gata	Gata i Karlstad	Karlstad	59.375167	13.506116	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac28bd9a-a863-41af-822f-47666b708c6f	Sandgrundsgatan	Gata i Karlstad	Karlstad	59.383677	13.500154	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d05e8a6-4830-46d6-9df3-677200ea965a	Järnvägsgatan	Gata i Karlstad	Karlstad	59.379887	13.499318	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5a7e880-2e5d-47ca-816f-738bf56da207	Östra Kyrkogatan	Gata i Karlstad	Karlstad	59.381514	13.50724	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6509ad14-d620-446d-8013-9b07ff8c40ec	Hööksgatan	Gata i Karlstad	Karlstad	59.374314	13.486603	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e22487a8-db36-44ef-86db-a2066ad63963	Traktorgatan	Gata i Karlstad	Karlstad	59.380174	13.466	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ab0315c-9bf8-40f1-9057-1cfebf8e753b	Montörsgatan	Gata i Karlstad	Karlstad	59.379934	13.467813	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df9eb47e-8fe3-4ed2-bf19-d9f7f98b04a8	Spårgatan	Gata i Karlstad	Karlstad	59.380555	13.466927	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a656f66-58cc-4569-9bed-4f5f03e9e1d1	Tyggårdsgatan	Gata i Karlstad	Karlstad	59.376938	13.508921	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f741259f-160c-4d37-b0b4-c66a3c49169a	Rederigatan	Gata i Karlstad	Karlstad	59.377046	13.509821	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f29c2588-fb66-41ef-b6dd-ee66d06017ab	Muraregatan	Gata i Karlstad	Karlstad	59.377352	13.487982	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e53c285d-cdf6-4f8d-99ba-425727141949	Rektorsgatan	Gata i Karlstad	Karlstad	59.374308	13.484267	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
88955af5-9e3b-4e46-a984-94e398e35278	Färjestadsvägen	Gata i Karlstad	Karlstad	59.403396	13.508217	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3d7a4b3-6af7-4c10-b70b-086c49653252	Lillgränd	Gata i Karlstad	Karlstad	59.389153	13.529596	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
21200010-d64c-48b3-8ff8-59589adde0b7	Vinkelgatan	Gata i Karlstad	Karlstad	59.377429	13.486418	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6cb8b2be-e24c-4309-aa4b-749b04a1a80c	Jössegatan	Gata i Karlstad	Karlstad	59.376898	13.485433	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
414b1bfa-0d98-49dd-9ae1-7d85a084f3be	Kasernhöjden	Gata i Karlstad	Karlstad	59.38993	13.491747	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd7b0c7f-982a-4485-bedf-998f7d8158f2	Norrbogatan	Gata i Karlstad	Karlstad	59.397251	13.513542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9892ed19-6b4c-4e3a-b19c-7d7b44d78259	Rämensgatan	Gata i Karlstad	Karlstad	59.391996	13.528153	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6e52245-3ebd-4c15-a494-a1f4cfd401c3	Nolbygatan	Gata i Karlstad	Karlstad	59.391154	13.518141	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b1bf1ed-120c-438a-9287-790bc53436af	Mölnbackagatan	Gata i Karlstad	Karlstad	59.39224	13.517396	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a31e708f-676f-41f5-af14-e4cf4d4a2342	Ringervägen	Gata i Karlstad	Karlstad	59.387701	13.512457	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
acdc4759-bd6f-44e5-9a50-ade919a63841	Stormgatan	Gata i Karlstad	Karlstad	59.379652	13.560241	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
506707d5-d4d6-405e-9c96-1aa53b15db3f	Regnvindsgatan	Gata i Karlstad	Karlstad	59.36966	13.553192	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d24bb3fb-7bfa-4e7f-a346-c39f5d75020f	Axel Johnsons väg	Gata i Karlstad	Karlstad	59.373273	13.529547	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b2c7f5c-50a4-4eb7-a77c-3c9a9e76f8dc	Kalvholmsgatan	Gata i Karlstad	Karlstad	59.371475	13.546539	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
519c2fd2-2933-41bb-aca1-e43bdea8f385	Gjuterigatan	Gata i Karlstad	Karlstad	59.382104	13.532522	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e41674e9-8356-4f7b-9ba7-bfeee2a6d3a0	Wallbergsgatan	Gata i Karlstad	Karlstad	59.379941	13.533083	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6231c2a1-cb4e-44aa-a341-6d27cbddccca	Mariedalsgatan	Gata i Karlstad	Karlstad	59.380944	13.511546	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf5409d7-a351-4b82-bb8f-3d83d1e41e53	Trekantsgatan	Gata i Karlstad	Karlstad	59.382015	13.510864	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
817c9177-5e3e-4545-957d-b9a5b0bd50a6	Fryxellsgatan	Gata i Karlstad	Karlstad	59.377396	13.516139	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
102ae636-cbab-4c52-9dab-29e5e76a901b	Castorplan	Gata i Karlstad	Karlstad	59.38671	13.506025	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6e436ea-3c06-4e84-a1dc-c8a7ccc4b037	Norrmalmsgatan	Gata i Karlstad	Karlstad	59.39761	13.512982	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a464b28-b8e2-4218-80a2-621f9092afaa	Tyringegatan	Gata i Karlstad	Karlstad	59.397751	13.512978	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab6c8373-de7f-4b9f-95be-aae138c9fa41	Nylandsgatan	Gata i Karlstad	Karlstad	59.399569	13.509533	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6e3300e-3aa4-495c-aca2-0c7b308b5879	Grindstugegatan	Gata i Karlstad	Karlstad	59.399094	13.511669	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ac9775e-28f1-437b-a87a-3b2e72824f34	Polluxgatan	Gata i Karlstad	Karlstad	59.386253	13.508345	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
90304527-50cb-4b6d-a3b3-b513cdc6e69a	Solhemsgatan	Gata i Karlstad	Karlstad	59.399622	13.510581	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1bab3542-009c-4e60-9883-c3473cb1f438	Skogsbogatan	Gata i Karlstad	Karlstad	59.400213	13.508927	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3373d3a-26ab-436f-96cc-ce7bdc6156e6	Älvstigen	Gata i Karlstad	Karlstad	59.399958	13.506821	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d063342-635c-47a1-8764-e4244888dcd3	Granegatan	Gata i Karlstad	Karlstad	59.400967	13.50792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8746158c-a90b-4519-a4ba-e3fe8888370c	Råtorps Parkgata	Gata i Karlstad	Karlstad	59.402273	13.488239	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ece5ab75-a4e3-47c5-9f21-e473103597f0	Nokiagatan	Gata i Karlstad	Karlstad	59.399961	13.520717	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f5f1be6-0007-4798-a0b2-f35fd704f4ac	Munkforsgatan	Gata i Karlstad	Karlstad	59.382799	13.517132	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4256b91b-fc96-4af3-9de1-1e6b6d444606	Bäckebogatan	Gata i Karlstad	Karlstad	59.401764	13.507311	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f1492c4-c172-4d04-b11c-c18ddc4fc0b6	Varvsgatan	Gata i Karlstad	Karlstad	59.367695	13.513555	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
09c4d3b9-cff2-4d7e-9dd2-ff393dfba5f6	Bäckelidsgatan	Gata i Karlstad	Karlstad	59.402345	13.508065	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c03bc674-2e3f-48ba-aaeb-e293e0b637d3	Humlegatan	Gata i Karlstad	Karlstad	59.403618	13.505715	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc59a048-fd6c-4504-af6a-82a91774febd	Skogstigen	Gata i Karlstad	Karlstad	59.368602	13.471972	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
edb05b20-c09b-4e27-b6e7-30ad85fb1c92	Svalgången	Gata i Karlstad	Karlstad	59.404094	13.503933	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
35e2f869-3c32-4d97-9e1a-d3040bc9660e	Valhallagatan	Gata i Karlstad	Karlstad	59.402971	13.494312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
455ff41c-0f9a-49b0-839d-4609ddafef3b	Charlottenbergsgatan	Gata i Karlstad	Karlstad	59.405685	13.484024	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5a9abd69-3915-4567-b65a-ec58c0473df4	Sveaborgsgatan	Gata i Karlstad	Karlstad	59.407121	13.484792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5bef6a1-b5f9-47a8-8a40-eb39fc528f6f	Skogstorpsgatan	Gata i Karlstad	Karlstad	59.400037	13.51258	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12ec374f-475c-45a1-9acc-252d8d69020d	Höstgatan	Gata i Karlstad	Karlstad	59.410501	13.571655	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6659ba47-6ab3-4ee1-bb7b-894281799ce4	Morkullevägen	Gata i Karlstad	Karlstad	59.402536	13.557143	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e450e9f-c3a6-4e57-8036-5b2c4e038473	Tjäderstigen	Gata i Karlstad	Karlstad	59.40367	13.555794	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
239b65a8-49cf-44e1-8da9-403c8a70b35a	Starrängsgatan	Gata i Karlstad	Karlstad	59.397367	13.544906	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa2356a0-454e-4541-9331-965a8ffb072e	Klarälvsgatan	Gata i Karlstad	Karlstad	59.403685	13.493701	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0808cfdc-416e-4094-91c0-134b23d2a9ee	Björkhultsgatan	Gata i Karlstad	Karlstad	59.404194	13.488714	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46b51508-3a10-4cbb-a00d-3c0871cf32e9	Lundegatan	Gata i Karlstad	Karlstad	59.405961	13.487169	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8961929-701a-4065-b01f-52db5589d647	Viktoriagatan	Gata i Karlstad	Karlstad	59.406202	13.486515	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c5d705eb-1d28-4ab1-bd72-5527849782de	Fredriksdalsgatan	Gata i Karlstad	Karlstad	59.40651	13.485057	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9aae7981-9df9-4c8b-ab7b-62dac21f0ffb	Herdegatan	Gata i Karlstad	Karlstad	59.407136	13.511215	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d83b0f02-147d-464c-8575-66777b4a1968	Sidvallsgatan	Gata i Karlstad	Karlstad	59.409521	13.506823	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
85379725-9c9d-400a-ae27-ba7ee845884d	Fältgatan	Gata i Karlstad	Karlstad	59.403765	13.513068	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5be1af4c-b744-4437-ade8-51e6452088bf	Skansgatan	Gata i Karlstad	Karlstad	59.401023	13.511307	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
31dd7726-4c92-4bd1-b635-b4f3600d68bb	Annebergsslingan	Gata i Karlstad	Karlstad	59.410816	13.508786	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
80a8d526-d059-4f59-a566-330505693807	Annebergsvägen	Gata i Karlstad	Karlstad	59.411849	13.508154	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dbb742db-0dd4-4abb-90b2-ff4e9247eb4c	Ågatan	Gata i Karlstad	Karlstad	59.40379	13.508432	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44733099-37d1-4227-875b-9e2a64fd5502	Ljunggatan	Gata i Karlstad	Karlstad	59.400329	13.515104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ed76b93-50c9-4801-8c09-9f488b2507e0	Bondegatan	Gata i Karlstad	Karlstad	59.407513	13.513374	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8986da7a-b906-40ec-972b-751c5efdbe00	Hårdvallsgatan	Gata i Karlstad	Karlstad	59.408648	13.509352	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
51ccb655-f013-4e59-a35b-2145419967bf	Gläntgatan	Gata i Karlstad	Karlstad	59.404325	13.512544	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f785490-cbda-4d85-89f8-215c65f5f96c	Karlslundsgatan	Gata i Karlstad	Karlstad	59.40197	13.511912	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
00299c97-80bb-4a9d-85ed-219f10ad3312	Åringsgatan	Gata i Karlstad	Karlstad	59.406665	13.510795	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
224846c1-1fb2-46e3-86a8-f548a1bc14b4	Allmogegatan	Gata i Karlstad	Karlstad	59.407785	13.510745	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e94ef802-c991-4d49-8ffe-ccc080ce77bf	Markgatan	Gata i Karlstad	Karlstad	59.404857	13.511846	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0286f2e5-fd43-47e1-8bda-a167de0ce182	Skyttegatan	Gata i Karlstad	Karlstad	59.403044	13.50993	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a129926-5248-45a9-97a0-f80a50e62341	Ripstigen	Gata i Karlstad	Karlstad	59.407511	13.556817	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a7d2000-c178-4ce6-9585-b23307bd1028	Gökstigen	Gata i Karlstad	Karlstad	59.40775	13.555787	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
97191e92-d75a-4713-b9d0-43c26243f73f	Drivhusgatan	Gata i Karlstad	Karlstad	59.399835	13.545501	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd7c1f8e-e90e-49aa-9f02-17fd9b81c782	Svinbäcksbacken	Gata i Karlstad	Karlstad	59.396385	13.53364	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a3a89550-0fe7-40b4-8905-f521f8ac0382	Kvistrumsgatan	Gata i Karlstad	Karlstad	59.407175	13.49117	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
227cfd40-9171-4421-96d1-516d87239aee	Dyeparksvägen	Gata i Karlstad	Karlstad	59.409917	13.486097	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
68a01f66-e9fe-423e-8d88-96c0c7adf63e	Granhultsgatan	Gata i Karlstad	Karlstad	59.406269	13.490727	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b883d7d-4098-43c5-8983-06b6de1fef69	Vintergatan	Gata i Karlstad	Karlstad	59.413826	13.573791	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4feb8ccd-9f02-448b-9504-4b3c9c3fea41	Kvintettgatan	Gata i Karlstad	Karlstad	59.414401	13.570677	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb3da252-dad0-4b26-a4ff-552931dc6ee9	Svennebogatan	Gata i Karlstad	Karlstad	59.411847	13.487119	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
486bee97-0319-4f98-aa74-c8666e727e21	Stöpaforsgatan	Gata i Karlstad	Karlstad	59.413801	13.484796	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d614601-ca05-4387-a36f-7b4fb9b8bbd0	Frykforsgatan	Gata i Karlstad	Karlstad	59.411101	13.485118	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d153e92-c892-4c42-a563-f6837e5ce3c7	Brättnegatan	Gata i Karlstad	Karlstad	59.411873	13.484061	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1642d460-4368-4f3e-b709-53d2f2b2891f	Högforsgatan	Gata i Karlstad	Karlstad	59.412691	13.485391	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b0105a8-218f-417d-b65d-bb5fb2c315e1	Orkangatan	Gata i Karlstad	Karlstad	59.37898	13.550304	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b86c147f-19d6-4698-828e-d872ece153db	Trangärdstorpsvägen	Gata i Karlstad	Karlstad	59.415419	13.48464	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
75a2c47a-437a-4b7b-8cd4-62bd467492bd	Stömnegatan	Gata i Karlstad	Karlstad	59.414501	13.485642	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b2ca8bf-3b51-4c6e-9620-075f45d96059	Söljegatan	Gata i Karlstad	Karlstad	59.414489	13.483145	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d94b7899-6c60-49ff-9fe9-e2f90e4f1022	Letaforsgatan	Gata i Karlstad	Karlstad	59.4149	13.484617	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
02745e33-ef85-4cac-ae4a-472afc6694a2	Östra Kanalgatan	Gata i Karlstad	Karlstad	59.381109	13.511154	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7fbd522-f6eb-427e-88b1-f6a3f425ec5f	Hagabron	Gata i Karlstad	Karlstad	59.380987	13.510736	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5314e7a-f8c2-439d-b2ae-2e6e4c2dec42	Tolvmansgatan	Gata i Karlstad	Karlstad	59.387209	13.524542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0bb83dc1-0e8f-42ed-9cbd-5e3d48f8b426	Fadderortsgatan	Gata i Karlstad	Karlstad	59.40525	13.517972	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3d2230d6-a60f-4e7b-b020-d5e5c895f183	Vänortsgatan	Gata i Karlstad	Karlstad	59.405537	13.519523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fbc838b-9f66-425c-b24e-ac889c95fa4d	Rudstorget	Gata i Karlstad	Karlstad	59.405445	13.519109	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48985e7e-a6e6-444e-9caf-979d3c1540a9	Falkgatan	Gata i Karlstad	Karlstad	59.403257	13.514159	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
29ae4b3d-5fe5-4a2b-881b-0adcc519a576	Hantverkaregatan	Gata i Karlstad	Karlstad	59.3874	13.516345	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef504e1a-ea4c-4421-bb51-3d14e76546a9	Stallplatsvägen	Gata i Karlstad	Karlstad	59.412037	13.497005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e0673e9-d3d9-466a-9a56-123ccdaccd5d	Margårdsvägen	Gata i Karlstad	Karlstad	59.36047	13.437424	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
98863783-8dc0-44e2-ba45-59d56b9fe211	Ulvsbygatan	Gata i Karlstad	Karlstad	59.395607	13.523497	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d2efc12-7cbc-457b-9097-a45c15ff212c	Norra Allén	Gata i Karlstad	Karlstad	59.393339	13.520095	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7ad1d14-fbf2-4b04-b1b6-08e829721ba8	Griftevägen	Gata i Karlstad	Karlstad	59.397135	13.533299	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c54f56f4-9251-4523-886e-e0812c9dcd41	Polhemsgatan	Gata i Karlstad	Karlstad	59.396069	13.53605	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
91d42139-2327-4005-8b27-4cbe4325b54f	Gränsgatan	Gata i Karlstad	Karlstad	59.39407	13.525594	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12a429f1-c6a0-4b0e-ac67-c1baf5906218	Hagtornsgatan	Gata i Karlstad	Karlstad	59.379155	13.48528	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1b03078-34c1-46aa-be6e-1fbe6f601bdd	Barrvägen	Gata i Karlstad	Karlstad	59.397273	13.537114	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f8f2c8f-2a1a-4e43-933d-8678d3eab1fe	Tallbacken	Gata i Karlstad	Karlstad	59.398714	13.543398	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7ba5982c-eacd-4c67-86d3-4cd4097c3509	Vallgatan	Gata i Karlstad	Karlstad	59.369375	13.46963	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c17b6204-38f4-469a-9e9e-3888a5c42f5e	Sommarrovägen	Gata i Karlstad	Karlstad	59.371143	13.474593	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
671030d4-0592-4c4d-97f1-538b5fcfd92c	Näbbgatan	Gata i Karlstad	Karlstad	59.371572	13.499833	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4707655-3ee9-4e02-80f4-273bd1d688eb	Landgången	Gata i Karlstad	Karlstad	59.37026	13.501722	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e731eb6d-8f43-4b54-b8d7-cd7e7a5744ff	Västra bron	Gata i Karlstad	Karlstad	59.381515	13.498973	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc998413-3f5e-4ee8-a4ba-cb11f71f755d	Ängbackevägen	Gata i Karlstad	Karlstad	59.39487	13.433629	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
537c3038-076a-4f79-beb6-74f4da972f34	Värmlandsgatan	Gata i Karlstad	Karlstad	59.378855	13.520817	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4487d677-90e6-45ed-bbe5-c5cc85b3d93d	Jungfru Stavas väg	Gata i Karlstad	Karlstad	59.389609	13.444844	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff9d541d-bbd2-4e77-8409-90c7fa388852	Redaregatan	Gata i Karlstad	Karlstad	59.376144	13.50999	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3234107b-7e55-4d05-bd53-111bfa099a36	Herr Arnes väg	Gata i Karlstad	Karlstad	59.389099	13.440834	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cfaf9535-afdf-40ed-9a4e-db204bc76527	Gunnar Hedes väg	Gata i Karlstad	Karlstad	59.389207	13.441218	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
011531e2-ee8e-42b0-9453-898e36906b32	Gylleniusgatan	Gata i Karlstad	Karlstad	59.391081	13.50503	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6471e22c-b2d6-4780-a142-a8859ae4ea6e	Kapten Lennarts väg	Gata i Karlstad	Karlstad	59.387544	13.434949	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
507ffcbe-0ce0-412e-aeba-90ec28dcede5	Uvgatan	Gata i Karlstad	Karlstad	59.398998	13.515871	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc34e289-2552-4ed5-b496-e7c0ccc23732	Kapten Kristians väg	Gata i Karlstad	Karlstad	59.386903	13.434527	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9025eb1e-b30e-445a-bdf2-60bcd12eae52	Mor Karins väg	Gata i Karlstad	Karlstad	59.38392	13.441183	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7adb1b6e-3e40-450a-ae4d-d6afcc237548	Mor Stinas väg	Gata i Karlstad	Karlstad	59.384532	13.443545	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
13edafa8-115e-4d4e-bcd5-4e1e4c1c71bb	Lövsjövägen	Gata i Karlstad	Karlstad	59.384887	13.437094	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b58b094-9d66-4104-bbc4-fc1d22505ac6	Skrolyckevägen	Gata i Karlstad	Karlstad	59.383173	13.4347	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8bc8d67e-653c-495c-8f64-c2276cc26fd7	Skördegatan	Gata i Karlstad	Karlstad	59.406952	13.512408	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
01c03af2-45ce-430d-b104-767374479ff9	Skiftesgatan	Gata i Karlstad	Karlstad	59.40459	13.508301	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8cf97d8c-ced0-439c-808b-99eb5a93f2b9	Mor Märtas väg	Gata i Karlstad	Karlstad	59.383444	13.443845	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa275640-cb02-46de-9b16-ae8c8c3349e4	Hyacintgatan	Gata i Karlstad	Karlstad	59.380844	13.44536	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e70b9597-372f-44e6-80e8-82e2020ebd41	Petersbergsgaterondellen	Gata i Karlstad	Karlstad	59.382925	13.463123	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
59a4d14b-07cb-4cfd-88b6-073195fc5ef6	Gökärtsgatan	Gata i Karlstad	Karlstad	59.383872	13.449603	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9472a0c6-d2dc-4338-b3b5-784833e01d92	Tureborgsgatan	Gata i Karlstad	Karlstad	59.400406	13.511565	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
add079ca-87ad-4cb9-aa43-8471eaf675ab	Stormyrsgatan	Gata i Karlstad	Karlstad	59.410474	13.556097	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f93dd895-04d8-422b-9db2-b91d0ab58892	Lupingatan	Gata i Karlstad	Karlstad	59.385716	13.455996	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e097901-e475-4a22-befb-8ef0ca3898e1	Knappstadsvägen	Gata i Karlstad	Karlstad	59.36747	13.454231	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6a699d8-5538-46c3-a443-8fdc2c9284ce	Katrinebergsvägen	Gata i Karlstad	Karlstad	59.365986	13.443395	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c899a7f-49bb-4966-8bc3-e267f2829ba0	Bergkantsgatan	Gata i Karlstad	Karlstad	59.366105	13.450959	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3396963a-3990-4031-9aac-a25693a90b41	Trädgårdsgatan	Gata i Karlstad	Karlstad	59.377171	13.502708	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa33866b-a1c2-4684-a66c-6373d5b884a2	Tolagsgatan	Gata i Karlstad	Karlstad	59.378377	13.509164	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f5d1ff1-463c-4612-afd4-9954db346c76	Löfbergsrondellen	Gata i Karlstad	Karlstad	59.377219	13.50523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6267b22b-f052-4121-ab7b-6044d0702f2c	Dammgatan	Gata i Karlstad	Karlstad	59.404639	13.505591	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
33cf48c6-a6b9-404b-92b8-0ccc31172d1c	Tingvallabron	Gata i Karlstad	Karlstad	59.384686	13.505651	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3d64494-843c-4469-bb3e-8cc67fc58143	Mellangatan	Gata i Karlstad	Karlstad	59.387967	13.506616	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0fa63677-af0b-4402-996a-ed40c1f9e9a6	Östra Bron	Gata i Karlstad	Karlstad	59.384517	13.513162	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a8c4caa-90cb-41c0-85e3-c0e118279f68	Eneströmsgatan	Gata i Karlstad	Karlstad	59.38049	13.508356	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a4fc25a-4b50-41bc-a60f-8d04fa7cc4c5	Yttersvängen	Gata i Karlstad	Karlstad	59.403472	13.552357	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0fec03f4-8d1b-4957-aae4-a9a99f42098b	Agnesbergsstigen	Gata i Karlstad	Karlstad	59.377874	13.532232	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bfbd129b-6ece-4b6d-8914-3033184db3e2	Basvägen	Gata i Karlstad	Karlstad	59.407208	13.548116	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9869d2c6-8233-48a1-a984-3810bc198962	Bergerudsgatan	Gata i Karlstad	Karlstad	59.410886	13.539811	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c917823-1ec3-4fe1-98ef-0404cc3325cd	Björnbärsliden	Gata i Karlstad	Karlstad	59.411923	13.561751	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47415453-b168-4873-acd2-06b571ca9ce8	Björneborgsvägen	Gata i Karlstad	Karlstad	59.392414	13.518599	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eabb35de-94cc-4fba-ba43-2310852822e6	Blåbärsstigen	Gata i Karlstad	Karlstad	59.407947	13.546066	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
08b80c25-1c3c-427d-a9a0-4927e314acf3	Brunnsgatan	Gata i Karlstad	Karlstad	59.387108	13.510863	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61fb1485-8bfa-47e0-8895-8161bcba1513	Dalbygatan	Gata i Karlstad	Karlstad	59.404883	13.539104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9506ac6-455f-43c3-a3d3-29c8a0f53209	Duvstigen	Gata i Karlstad	Karlstad	59.406696	13.556015	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dfbadab1-003c-42f5-8d47-a6af7541f977	Ekallén	Gata i Karlstad	Karlstad	59.370468	13.470417	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e88de175-cac8-4f89-853d-aca79e656401	Ekenäsgatan	Gata i Karlstad	Karlstad	59.403727	13.534115	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fafd0542-22ff-418d-9b1b-2befddb326c6	Ekorrvägen	Gata i Karlstad	Karlstad	59.405781	13.548555	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a4c774b-e44b-4240-bd52-076ebf8d7271	Eriksdalsgatan	Gata i Karlstad	Karlstad	59.390496	13.522349	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
700d7248-3079-4d99-b18c-dc95e20cc050	Fasanstigen	Gata i Karlstad	Karlstad	59.404193	13.555901	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4625b533-5728-42c8-87dd-a336f8abc65c	Fogdegatan	Gata i Karlstad	Karlstad	59.389775	13.521523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
911382a7-7557-45ca-adad-4788411fccbc	Folkebogatan	Gata i Karlstad	Karlstad	59.406718	13.539775	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c5c9edaa-e9f1-44f3-b013-b7e305336a60	Getebolsgatan	Gata i Karlstad	Karlstad	59.406035	13.537377	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af34d919-2bdc-4491-ac2c-2cf06d8dd7d5	Gröna Gatan	Gata i Karlstad	Karlstad	59.393928	13.521411	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a33ce6e-f781-40ed-8a26-d47398409422	Gärdesgatan	Gata i Karlstad	Karlstad	59.392814	13.527303	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fd3d347-f5cb-452a-aab7-0d62e40229ff	Hagaborgsgatan	Gata i Karlstad	Karlstad	59.388178	13.514876	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48b4329c-7ff7-47cb-84b7-2487dddd2316	Hallonstigen	Gata i Karlstad	Karlstad	59.408386	13.544947	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82c1e246-49ca-48fd-b8af-e9607814ff6b	Herrgårdsgatan	Gata i Karlstad	Karlstad	59.382181	13.501226	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5029c18a-d228-4fca-9d40-4d3f7dd32cb1	Hyggesvägen	Gata i Karlstad	Karlstad	59.407385	13.54822	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5562e82-6be3-46d2-94c7-058b488335ea	Innersvängen	Gata i Karlstad	Karlstad	59.405593	13.550195	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99e83dbb-685c-490b-a038-e613e4577057	Kanikenäsgatan	Gata i Karlstad	Karlstad	59.373225	13.517471	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee0f4c67-f2de-4e54-81ab-443ea8e09c1a	Kroppkårrsbågen	Gata i Karlstad	Karlstad	59.39562	13.53878	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f7204806-f96c-4ae3-8af1-7e5d917f923b	Lingonstigen	Gata i Karlstad	Karlstad	59.40798	13.543601	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4037f390-ac27-4927-b909-73bcfd9bf2aa	Likenäsgatan	Gata i Karlstad	Karlstad	59.404985	13.534544	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d95309df-28ac-414c-915f-9d2024ed1a32	Lorensbergsgatan	Gata i Karlstad	Karlstad	59.40368	13.538715	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2252b2cc-8914-4fc0-8a80-9ffe5614bf60	Lyckebovägen	Gata i Karlstad	Karlstad	59.370786	13.472622	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
027d2667-d92b-48aa-8d88-89a72c220d3d	Länsmansgatan	Gata i Karlstad	Karlstad	59.389203	13.520841	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
00368925-328c-438d-b22e-76e30415d045	Långbansgatan	Gata i Karlstad	Karlstad	59.394013	13.52035	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc111f49-0a47-4d79-8d73-4702f1d783e8	Lövedsstigen	Gata i Karlstad	Karlstad	59.402133	13.536673	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e23ed35-edec-4159-8d96-18d9bf94dc6e	Mjönäsgatan	Gata i Karlstad	Karlstad	59.406194	13.534165	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7ad4410-a9b9-4746-a3f4-047890f6a899	Mårbackagatan	Gata i Karlstad	Karlstad	59.391704	13.523876	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
09fdd60e-5762-458b-acf1-0427a8ae78dc	Mårdvägen	Gata i Karlstad	Karlstad	59.405146	13.547056	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
41ffd055-c1ab-48e3-a529-f997cee5fa21	Nyponstigen	Gata i Karlstad	Karlstad	59.409069	13.545129	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0ad36f9-1af2-4df5-9983-01caa4a69629	Olsätersgatan	Gata i Karlstad	Karlstad	59.403523	13.539907	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87faa459-1fb0-4d23-8e7d-195c3557fc98	Orrstigen	Gata i Karlstad	Karlstad	59.406058	13.555922	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7a22ab1-266c-4616-80f9-a103fe871753	Skepparegatan	Gata i Karlstad	Karlstad	59.389379	13.51659	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bba1f6b8-f13c-4783-a508-019c350597b3	Skinnargatan	Gata i Karlstad	Karlstad	59.391829	13.519296	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2086b4c3-d74c-4b44-8091-06d5e29d6ead	Skivedsgatan	Gata i Karlstad	Karlstad	59.401306	13.538342	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fc41d7e-fcdf-42a4-90c2-c6529718ac9f	Skolvägen	Gata i Karlstad	Karlstad	59.389346	13.523111	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9737b5d0-8d74-43f6-a6b0-123cb57064e8	Skymnäsgatan	Gata i Karlstad	Karlstad	59.40827	13.5343	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6a4ffaed-4736-46e0-8f8e-dac19b0240eb	Stavnäsgatan	Gata i Karlstad	Karlstad	59.408906	13.53411	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
34b45271-ce2e-4d94-b178-a88abff96aae	Storsvängen	Gata i Karlstad	Karlstad	59.40695	13.554523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
95dfaec0-3264-46f1-bd0f-59903d96f120	Sunnegatan	Gata i Karlstad	Karlstad	59.392139	13.526537	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b2095c6-4f59-4970-864d-845c626eeff5	Svampstigen	Gata i Karlstad	Karlstad	59.407725	13.545712	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6c53892-d53f-4c53-8485-6f361553dd62	Svarvaregatan	Gata i Karlstad	Karlstad	59.38869	13.516389	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87adb538-73c2-4b06-8604-ae89c672ee37	Televägen	Gata i Karlstad	Karlstad	59.404094	13.559138	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd68cf57-ae01-400f-85f8-e28971919baf	Torsbygatan	Gata i Karlstad	Karlstad	59.391672	13.527959	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d5f8432-ec54-4311-8e53-ca08c189d387	Transtigen	Gata i Karlstad	Karlstad	59.407229	13.553892	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
165d85b0-ab11-48e5-89fd-3095c25ea961	Tysta gatan	Gata i Karlstad	Karlstad	59.386644	13.513212	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f903ae7f-b9b6-480e-9be5-52621318d894	Ugglestigen	Gata i Karlstad	Karlstad	59.403034	13.556873	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
315cf49a-7c82-428d-b79e-996cc868a667	Uttervägen	Gata i Karlstad	Karlstad	59.403902	13.549095	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e21e65e3-27fe-4aed-a7de-2c3f0d26733a	Vävaregatan	Gata i Karlstad	Karlstad	59.389931	13.517293	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e001e277-fd00-47cd-9053-c21611f906b8	Kroppkärrsrondellen	Gata i Karlstad	Karlstad	59.399723	13.539025	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74096cb4-0d9d-4798-bed0-1a8c92102e3a	Älgvägen	Gata i Karlstad	Karlstad	59.405676	13.5517	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7c58a8ae-7f02-4eeb-b35f-306381b0567a	Östra Rosenlundsgatan	Gata i Karlstad	Karlstad	59.397734	13.54018	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
59fe8418-bb60-4ebb-bd35-a0db31974cde	Kadriljvägen	Gata i Karlstad	Karlstad	59.346589	13.497428	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f8bc544-140b-4fdb-93ce-a41559c09350	Menuettvägen	Gata i Karlstad	Karlstad	59.34843	13.496869	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92dd1911-f6ba-497c-a696-fbd48b078d8a	Oxdansvägen	Gata i Karlstad	Karlstad	59.348506	13.497129	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5af38f3d-b184-4925-acaf-5d53582b1b65	Wennbergsgatan	Gata i Karlstad	Karlstad	59.376669	13.491949	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a0bd4715-2076-4d08-998d-a034df643d90	Trumslagarens gata	Gata i Karlstad	Karlstad	59.400599	13.492344	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f5c4982-dfef-4757-9198-38838111806f	Piparens gata	Gata i Karlstad	Karlstad	59.401271	13.490077	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b4a337e-15fb-4898-a1eb-bdd3d9b870ef	Zakrisdalsgången	Gata i Karlstad	Karlstad	59.365403	13.435978	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f95599c-d754-4a9a-92fd-9da68680e8c3	Björkåsvägen	Gata i Karlstad	Karlstad	59.363805	13.453684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c05bedfe-4a01-450a-a1d9-0d83d1cc996b	Kartbergsslingan	Gata i Karlstad	Karlstad	59.364955	13.457103	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5189b99-1576-47e1-8865-0beaa425aa75	Kartbergsvägen	Gata i Karlstad	Karlstad	59.365697	13.455507	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da606fd2-981d-44f6-b877-7bb1cf118573	Aspåsvägen	Gata i Karlstad	Karlstad	59.364782	13.456314	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a8bd618-374d-4295-b931-3c392d543f36	Lusthusvägen	Gata i Karlstad	Karlstad	59.366507	13.457689	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a8ba295-0110-480b-b833-35480a4c38e2	Kartbergsbacken	Gata i Karlstad	Karlstad	59.364854	13.457469	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af096afa-bcde-46c9-beeb-719de16d7b6d	Pråmvägen	Gata i Karlstad	Karlstad	59.378937	13.511891	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b8c7b66-be6d-4f49-8e15-aa5c67da299e	Serenadgången	Gata i Karlstad	Karlstad	59.413972	13.572928	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11540b83-1391-40fd-82db-01b7ff2cf3a8	Sextettgatan	Gata i Karlstad	Karlstad	59.414961	13.571025	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a0cf744-7d2c-405c-a806-f66a23279154	Älvåkersgatan	Gata i Karlstad	Karlstad	59.417239	13.481941	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4be984bc-6528-4f99-90fd-ff79d6d8307a	Sätergatan	Gata i Karlstad	Karlstad	59.408221	13.509282	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f08d6410-f472-492b-bed6-91f348c07b79	Ankargatan	Gata i Karlstad	Karlstad	59.372265	13.526799	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
79c499d3-64e9-4034-9f87-2cadf87575dd	Lambergskajen	Gata i Karlstad	Karlstad	59.372054	13.527966	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
23bc42cd-d54f-4c43-a711-8de1d2e0c95d	Klaraborgsbron	Gata i Karlstad	Karlstad	59.379946	13.488537	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06a2c9d2-1451-488a-a29d-719491c32227	Husbyggargatan	Gata i Karlstad	Karlstad	59.374885	13.523534	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df1353fe-59e3-4194-bb51-bb5c3be57f8c	Packhusallén	Gata i Karlstad	Karlstad	59.371422	13.509198	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f8d0675-7349-438f-bac5-1b585a4f25c2	Kompassen	Gata i Karlstad	Karlstad	59.37025	13.51129	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74515a72-477c-4403-9472-38d4640e38a0	Höjdgatan	Gata i Karlstad	Karlstad	59.400197	13.533298	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5ba8c90-0bfa-4acb-bcfe-aa389ae0389b	Stormyrsvägen	Gata i Karlstad	Karlstad	59.414862	13.551208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4ad7c1f-3463-4a4c-9ab6-c5a82d65276b	Tingvallarondellen	Gata i Karlstad	Karlstad	59.383148	13.504522	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f1ee2a1-fe52-4bf4-bb3c-b6f0c77c53e5	Packhusrondellen	Gata i Karlstad	Karlstad	59.372504	13.507186	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f01a66d-a794-46af-a830-2fa1d30ad51b	Nattviolgatan	Gata i Karlstad	Karlstad	59.367545	13.466804	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd7a0adb-d56e-4e80-bf54-35a30d54ace2	Svingelgatan	Gata i Karlstad	Karlstad	59.367692	13.467547	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
347f3387-c558-4d01-9ff3-26554f9bc03d	Timotejgatan	Gata i Karlstad	Karlstad	59.36812	13.46778	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3ebf85a-6771-4684-b18b-ac6953fce902	Vippgatan	Gata i Karlstad	Karlstad	59.375607	13.444634	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
28d85442-e712-4b8d-8abe-038f23363a56	Bogsprötsgatan	Gata i Karlstad	Karlstad	59.371405	13.510999	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0dfc7087-24e9-4df9-bb8f-2d6b7a898b4a	Karlbergsgatan	Gata i Karlstad	Karlstad	59.379694	13.509074	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c744069d-0199-416f-8948-f7ac4b017aed	Visterudsgatan	Gata i Karlstad	Karlstad	59.410518	13.549743	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
560a57d2-4fca-4c09-a0d8-3aaa2338ef7f	Kastmans plan	Gata i Karlstad	Karlstad	59.372459	13.488331	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb50d531-a768-4ec3-bd4c-987de005fe65	Segersteds plan	Gata i Karlstad	Karlstad	59.371324	13.487425	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffc30a19-c2b3-43fe-88cd-98d3cc4489ca	Silveruddsvägen	Gata i Karlstad	Karlstad	59.352314	13.496067	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0d40109-20d3-4d50-ad9f-f45caf911c0f	Sundvägen	Gata i Karlstad	Karlstad	59.352463	13.495444	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
726a0ca9-8146-4cb8-acb0-ec79d8c744db	Hadar Grudes Gata	Gata i Karlstad	Karlstad	59.374513	13.507392	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9abdddde-39f4-4111-8deb-aed79799c8ed	Rudsbergsvägen	Gata i Karlstad	Karlstad	59.399116	13.519206	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5fc9f144-745c-47e4-a7c5-96f971880d0a	Nobelplan	Gata i Karlstad	Karlstad	59.393954	13.516391	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7a4f2db-8ee0-402e-9212-de215b8884e0	Stapelgatan	Gata i Karlstad	Karlstad	59.378168	13.510535	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
775a0ede-b6bc-4bca-9e38-c6ed4694fc35	Furustigen	Gata i Karlstad	Karlstad	59.378095	13.530274	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
905a96da-13e2-4fa3-ba9f-ba52d1e0d6bc	Långövägen	Gata i Karlstad	Karlstad	59.372804	13.489306	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
65cbb26c-c9ba-49ea-9518-dacaa4c382db	Tymans väg	Gata i Karlstad	Karlstad	59.350303	13.562026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
79426fb0-8812-436f-be75-b6bf9bc14ddd	Rågvägen	Gata i Karlstad	Karlstad	59.348816	13.560306	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2220d0f-1547-407d-8f13-e952a9590866	Tybergs väg	Gata i Karlstad	Karlstad	59.348943	13.557182	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2123325f-da6a-4b79-a852-92bc894440d4	Rösvägen	Gata i Karlstad	Karlstad	59.354971	13.566667	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
059b1b93-a4e5-4fc1-b1ac-fd3ca7e09d5c	Tullholmsrondellen	Gata i Karlstad	Karlstad	59.374263	13.502662	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
77492c3f-e73b-4ce5-8f69-51e4355b71de	Sjömansgatan	Gata i Karlstad	Karlstad	59.374561	13.500194	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
01459907-49a9-4c37-8674-da0ed358cc19	Johan Richters gata	Gata i Karlstad	Karlstad	59.364154	13.476572	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43b009c9-4c80-4a9b-b950-84759f662311	Jakobsbergsgatan	Gata i Karlstad	Karlstad	59.364026	13.476736	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5650625f-6941-432f-bf35-a8f3d7cc66f4	Knud Dahls gata	Gata i Karlstad	Karlstad	59.364955	13.476186	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7dabb522-883f-4fbc-b309-223cf1b00b92	Smålandsgatan	Gata i Karlstad	Karlstad	59.383721	13.527725	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9313045-47eb-463b-9b08-0486d52c8546	Sävegatan	Gata i Karlstad	Karlstad	59.393279	13.515724	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2d6b3b9-aa25-4ada-be97-c861b8a6a9f9	Kvarnbergsrondellen	Gata i Karlstad	Karlstad	59.377233	13.489708	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aad9f7a7-d8fd-42bd-8940-5fde8b8f2a2e	Kanikenästorget	Gata i Karlstad	Karlstad	59.376026	13.506481	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e390af8-12a2-49cd-9fa2-80da09a4a6ab	Vikenrondellen	Gata i Karlstad	Karlstad	59.375317	13.491816	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5388521e-2b14-4abf-be2f-3f2b32573479	Wittstocksslingan	Gata i Karlstad	Karlstad	59.397789	13.493942	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc8ab3e9-5e2d-4db3-8a67-94f7e8fb4b34	Repslagaregatan	Gata i Karlstad	Karlstad	59.380303	13.51327	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
19dbbd0f-c545-422e-a763-4edd02069a27	Tegelbruksvägen	Gata i Karlstad	Karlstad	59.350234	13.499156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
53a1edb7-b3a1-4614-901c-045c0931eb3e	Konditorigatan	Gata i Karlstad	Karlstad	59.372597	13.502206	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d0a31ea-4607-4ccd-8ce9-22213d8934b4	Terminalgatan	Gata i Karlstad	Karlstad	59.367413	13.531816	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d9bcab8-61a1-497c-a07d-b79a676963fa	Blomstigen	Gata i Karlstad	Karlstad	59.375348	13.467296	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8f14e1e-4b7c-49f2-a9be-42cf6b8eef94	Östra Stationsgatan	Gata i Karlstad	Karlstad	59.383188	13.518742	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a20ea076-d108-40ef-989f-58d6b9e2aa42	Avenboksvägen	Gata i Karlstad	Karlstad	59.398043	13.558062	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce963194-946c-4208-ac6c-67e29157cf35	Lagerhusgatan	Gata i Karlstad	Karlstad	59.3732	13.502835	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
987dd4b7-59cc-4170-8944-24e7f23a6e36	Guldalmsvägen	Gata i Karlstad	Karlstad	59.398428	13.55588	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
55a9dc0a-b9d5-4661-b10e-60b66b67435c	Kopparlönnsvägen	Gata i Karlstad	Karlstad	59.398939	13.557985	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2f63a1b-2679-462b-8792-4eee57f31553	Trädgårdsmästaregatan	Gata i Karlstad	Karlstad	59.398462	13.556446	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5122687-a90e-449f-a700-fff0b0250d6d	Glasbjörksvägen	Gata i Karlstad	Karlstad	59.397819	13.55927	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d90e5c24-b17f-48b9-b1ec-625d2c76021c	Lorentz Ljungdahls gata	Gata i Karlstad	Karlstad	59.397828	13.555542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba0a63ab-7cae-445c-b008-e7c893caa863	Mullbärsgatan	Gata i Karlstad	Karlstad	59.397169	13.558279	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d073943-a358-4c40-ac31-b3df1e14d3d2	Dalgångsvägen	Gata i Karlstad	Karlstad	59.352007	13.485907	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7b40447-e85d-4c76-91b3-c00417e0c810	Kullvägen	Gata i Karlstad	Karlstad	59.352882	13.488001	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f016232-3195-4238-95b5-c3551983812c	Färjevägen	Gata i Karlstad	Karlstad	59.352294	13.488864	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce63a1ba-f894-4a5c-88f0-94e838c20d45	Klippvägen	Gata i Karlstad	Karlstad	59.352712	13.489937	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1519ea03-128c-4c48-a654-1564f92ad51e	Åsvägen	Gata i Arvika	Arvika	59.642218	12.617713	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7c29217f-d047-4812-8dab-e25aac0193ab	Kaserngatan	Gata i Karlstad	Karlstad	59.386292	13.495038	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
10c9633d-70e8-40f2-9eea-7e2a6e9ffef1	Bagerigatan	Gata i Karlstad	Karlstad	59.371983	13.501541	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48747171-da34-4a88-9d3d-4b16185c2862	Stenvägen	Gata i Karlstad	Karlstad	59.352682	13.489245	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a29c5fbc-b178-4f4d-8d03-1c394eac3d97	Ekebogatan	Gata i Karlstad	Karlstad	59.399414	13.543055	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
80c3edc4-84da-461c-a702-4a76fcda0287	Branäsgatan	Gata i Karlstad	Karlstad	59.40295	13.533907	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2bceeb3c-5029-4475-a18c-011ff78248d0	Båtnäsgatan	Gata i Karlstad	Karlstad	59.403205	13.535045	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
916f673f-31c8-4c54-b93a-67283ad186a1	Forsnäsgatan	Gata i Karlstad	Karlstad	59.404655	13.533684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0e09fb6-1b95-4572-92b2-11f7a86cadcf	Ljusnäsgatan	Gata i Karlstad	Karlstad	59.405412	13.533754	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
829f0135-8a85-47c6-86c7-138911ba4fe9	Månäsgatan	Gata i Karlstad	Karlstad	59.406505	13.535521	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce70c8c7-0451-4b55-9c26-deaedd73bbfd	Rotnäsgatan	Gata i Karlstad	Karlstad	59.406957	13.534444	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a21038c7-96bc-454a-ad5a-256af6cbdfe4	Rondell	Gata i Karlstad	Karlstad	59.378161	13.504148	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9d91437-6d75-425f-b998-537cf2dadfa4	Ventilgatan	Gata i Karlstad	Karlstad	59.382696	13.463123	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
228938d3-5d23-4a4a-ad2b-ba63dfb88a08	Leopold Nygrens plats	Gata i Karlstad	Karlstad	59.373685	13.503591	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c805812e-0a12-4e95-9ba0-bbde99d323db	Guldlistgatan	Gata i Karlstad	Karlstad	59.38313	13.511502	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
603c631a-8fe6-4cea-a0d7-d34ee19fe660	Haga ängsväg	Gata i Karlstad	Karlstad	59.358452	13.436476	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d556c58-845f-4545-8c17-8f8c501dcd63	Haga skogsväg	Gata i Karlstad	Karlstad	59.358556	13.440219	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8fecde9-ad69-4ec4-8279-ab23ae1425de	Segelgatan	Gata i Karlstad	Karlstad	59.373452	13.509576	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a107adc-852a-41fc-8311-c3795af14778	Älvstrandstorget	Gata i Karlstad	Karlstad	59.383494	13.518363	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9c4be00-830b-4478-9fa4-dbd4dc57707f	St1	Butik i Arvika	Arvika	59.64772	12.617403	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3ee7156-2d2e-4729-b479-5eeb9698c5f0	Tanka-Arvika	Butik i Arvika	Arvika	59.660139	12.61013	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
253ac715-bae4-43de-b3a1-47bb6f8524ad	Arvika	Offentlig plats i Arvika	Arvika	59.653509	12.591341	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a70642c9-fd01-49c5-854e-45af2b2057b2	Arvika kommunhus	Offentlig plats i Arvika	Arvika	59.653902	12.596041	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2cf0eb9d-8af3-4df6-93c5-7a988bfe1b65	Kockikiosken	Café/restaurang i Arvika	Arvika	59.66176	12.606487	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
119e40fc-3de0-433f-bf45-10ce7e0c91bc	Nordells Konditori	Café/restaurang i Arvika	Arvika	59.654216	12.592479	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
912ccb63-4610-4c2c-93a3-751fa995ae4d	O'Learys	Café/restaurang i Arvika	Arvika	59.655771	12.589133	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7602003-24b8-4d44-8582-176acd193bc2	Apotek ICA	Offentlig plats i Arvika	Arvika	59.654529	12.592365	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2a596da-4388-43bf-b4f5-ca875a57161e	Scandic Arvika	Sevärdhet i Arvika	Arvika	59.65566	12.592489	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
896d4299-c2d5-4792-8c6d-3d8075fca9e9	Citykonditoriet	Café/restaurang i Arvika	Arvika	59.655119	12.588047	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b2573fb-6e6c-4780-a323-002034e1eaf1	Ingo	Butik i Arvika	Arvika	59.647271	12.616914	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8863cc7d-92bb-4ff0-bfcf-871499ef8616	Jennys Hotell och restaurang	Sevärdhet i Arvika	Arvika	59.657031	12.585425	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
bee775ac-961c-4222-86db-f1c2d9e9c340	McDonald's	Café/restaurang i Arvika	Arvika	59.661143	12.614197	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
27d6ec5b-739d-4ffd-a96e-6a5d68bb5f12	Arvika Fordonsmuseum	Sevärdhet i Arvika	Arvika	59.661221	12.591386	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
828bd36c-05b8-4bb5-92f3-1ee2bf06c6dc	Arvika Stadsbibliotek	Offentlig plats i Arvika	Arvika	59.656033	12.588041	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7af327ca-4ff6-443f-a96b-646f8c85998d	Vårdcentralen Verkstaden	Offentlig plats i Arvika	Arvika	59.654257	12.601581	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
af1f406d-5122-4ad6-aca9-a56874b5e6bd	Fågelmannen	Sevärdhet i Arvika	Arvika	59.654503	12.591743	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
715c8a55-ad3b-4212-911b-0d0525886642	Rajjens Bowling & Pub	Café/restaurang i Arvika	Arvika	59.653412	12.594891	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f7342022-be46-49a2-8975-1ea4a5737b30	Pa Enns Thai Restaurang	Café/restaurang i Arvika	Arvika	59.653835	12.592156	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
db01df4f-2fb9-4d3c-b519-095754f8711a	Sjökanten	Café/restaurang i Arvika	Arvika	59.652111	12.592368	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a0504c4-b455-4496-85a4-1c519cb796bc	Bakfickan	Café/restaurang i Arvika	Arvika	59.655625	12.592468	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a62ae657-7000-4e9f-8056-a84050db948d	Palladium Bio	Sevärdhet i Arvika	Arvika	59.655443	12.595587	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e21b161-2d38-4a6c-9550-28896d38f006	Busstation	Offentlig plats i Arvika	Arvika	59.655544	12.587058	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
17dcfa14-b3d0-4bc4-b6f1-9494167bea70	Timmy's	Café/restaurang i Arvika	Arvika	59.654933	12.595003	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
20644a73-5412-4f1f-88df-ca1b3a2c4af5	Simhall	Sport & fritid i Arvika	Arvika	59.657453	12.591804	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
24302387-780a-4510-9e34-be0c6cb51273	Svea	Sevärdhet i Arvika	Arvika	59.657443	12.590406	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
599c33d8-674e-43d2-9f4f-799ceda03fad	Stora Coop Palmviken Arvika	Butik i Arvika	Arvika	59.656818	12.586827	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab983f75-2be5-43fb-a042-1912a480a66c	Sporthallen	Sport & fritid i Arvika	Arvika	59.657314	12.592878	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce14fab8-a6e8-4a14-b23d-45ca29fa8215	Polisen Arvika	Offentlig plats i Arvika	Arvika	59.653755	12.6026	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f6d3225-2f10-49aa-be6f-70f3067800ad	ICA Kvantum	Butik i Arvika	Arvika	59.657131	12.586702	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3282e5f3-a359-49b0-aa7e-cedcdde25424	Systembolaget	Butik i Arvika	Arvika	59.654155	12.59368	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4cadc128-a2f5-467d-a75f-d120159de024	Stora Coop Styckåsen	Butik i Arvika	Arvika	59.659602	12.605306	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4524859-a1ea-424b-8190-39e875eb674b	Elis i Tasere	Sevärdhet i Arvika	Arvika	59.655231	12.592249	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
0799e775-5527-4b18-b4d9-4e8d0ff275ab	Noiz	Butik i Arvika	Arvika	59.655558	12.588976	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
48dc01f1-50c2-4005-84db-745b80c0414e	OKQ8 Arvika	Butik i Arvika	Arvika	59.669323	12.593401	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae766835-8536-41f2-bacb-78e351a7f260	Mekonomen	Butik i Arvika	Arvika	59.660428	12.613707	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6067b377-0c71-4e53-9cd8-dd09df0a47d4	Amigo Pizza	Café/restaurang i Arvika	Arvika	59.657345	12.58321	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
74acd222-8058-4add-8b96-30f7fa59076d	Godishuset	Butik i Arvika	Arvika	59.657308	12.583429	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4c5de65-4b82-4126-9992-daf478b3e60f	Estetiska skolan - Stage & Perform	Skola i Arvika	Arvika	59.653085	12.602732	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f12ce9eb-80ca-46f5-ade4-b721159ca803	GoBanana	Butik i Arvika	Arvika	59.65373	12.595913	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8fc3b515-2ed0-4d0e-8d08-8949b9968a65	JYSK Arvika	Butik i Arvika	Arvika	59.655173	12.589139	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5c504cca-69c0-4bea-9659-4a566d15df05	Häll Restaurang & Bar	Café/restaurang i Arvika	Arvika	59.655416	12.592095	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f0a137d-15ab-47d0-b6e1-9312a54e2859	Hotel Arkaden	Sevärdhet i Arvika	Arvika	59.654697	12.596329	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3a8df5f-9a1f-4773-b5ff-2b063a091d41	Nippon Ramen	Café/restaurang i Arvika	Arvika	59.655505	12.589338	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cda919f7-a570-4ca4-bafd-7aa25d3760d7	Thai Kök	Café/restaurang i Arvika	Arvika	59.655768	12.590158	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
36fc8bc0-5463-4170-be90-097e1edb3f91	La Vita	Café/restaurang i Arvika	Arvika	59.653767	12.591005	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9c6cdf7-94ee-493c-8bf0-e5038a260928	Bristol Pizzeria & Steakhouse	Café/restaurang i Arvika	Arvika	59.655	12.593612	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b224180-836a-4e2b-8a6c-086a5bad4ab6	The Oven	Café/restaurang i Arvika	Arvika	59.654812	12.595681	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8c37771-6e8f-4f2a-93ac-7931a9633615	Galleri pi	Sevärdhet i Arvika	Arvika	59.655695	12.590614	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
7870787f-e429-440c-934a-b04ef320847e	Hantverksmagasinet	Sevärdhet i Arvika	Arvika	59.65224	12.592476	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
ddcb60bf-edc3-4213-b912-5b49c4df1f4a	Nytomta	Offentlig plats i Arvika	Arvika	59.670813	12.6089	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae05a969-04ca-4b77-8b91-33953e488b48	Hello India Restaurant & Bar	Café/restaurang i Arvika	Arvika	59.655667	12.58991	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ec0960e-9fff-4328-93f4-4a4d381fe300	Nippon Sushi	Café/restaurang i Arvika	Arvika	59.655818	12.58988	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
85b4a703-cb2f-4bc6-bbb0-bbee09d674d0	Regi	Café/restaurang i Arvika	Arvika	59.655355	12.595534	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fdc5ef7a-3ba4-4a2b-8507-9f1da5befabf	Restaurant Skeppet	Café/restaurang i Arvika	Arvika	59.654704	12.582913	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1240a91-7032-4f2b-a520-41caf7ff4a69	Kronans Apotek	Offentlig plats i Arvika	Arvika	59.659325	12.605495	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c868f2c2-5238-47db-89bd-c045ff76bf85	OKQ8	Butik i Arvika	Arvika	59.659614	12.607499	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c2f49c8-2412-4435-9222-2f72e81c72bc	7-Eleven	Butik i Arvika	Arvika	59.660738	12.613326	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd505688-7ec7-4b22-bcd5-a54b03a2d253	Euronics	Butik i Arvika	Arvika	59.656773	12.58533	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5fdbe641-3f1e-402f-b43d-4dfad3a78aa0	Milano	Café/restaurang i Arvika	Arvika	59.662064	12.605379	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac591711-5658-4c1a-a978-ff9bf5aff481	Dotteviks Pizzeria	Café/restaurang i Arvika	Arvika	59.638105	12.615711	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
20c39553-e3c8-4c47-83d8-d48aeebaeb0b	Akademibokhandeln	Butik i Arvika	Arvika	59.654211	12.593353	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
12fcb8cf-9ed5-43f6-900d-aa2957239c69	Strandhallen	Sport & fritid i Arvika	Arvika	59.654529	12.581167	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
acf31f24-e7d7-437b-a169-841887d0a5aa	Arvika Tvätt AB	Butik i Arvika	Arvika	59.659412	12.588913	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
891a1778-2df5-4639-9aa6-b987304a6222	Victors Pizzeria	Café/restaurang i Arvika	Arvika	59.656156	12.58931	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d36d237b-f7b3-45da-bea9-636a1002ab97	Lekhörnan	Butik i Arvika	Arvika	59.656039	12.58913	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc001ecb-c46b-461c-a71b-923d56680f2d	Virveln	Butik i Arvika	Arvika	59.655416	12.591336	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
63898609-514c-4678-aac0-3f92d67e46ba	Intersport	Butik i Arvika	Arvika	59.655457	12.591097	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d0527b9-1be5-4b6d-adbe-b66719387261	Kort i Kubik	Butik i Arvika	Arvika	59.657015	12.588356	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ae7db47-ba06-48f7-8f52-770226d30c3e	Krigargraven	Historisk plats i Arvika	Arvika	59.662936	12.548824	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
57cc38ba-aba7-49a9-a609-bc9c6685f82a	Espresso House	Café/restaurang i Arvika	Arvika	59.654634	12.590936	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
71b4f627-35b6-4163-a486-ae8f328fbad4	Önska	Butik i Arvika	Arvika	59.655471	12.592808	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
08b60111-e5ae-478b-8b54-4fbf928659e3	Kappahl	Butik i Arvika	Arvika	59.655313	12.592993	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6814e652-b0c0-4688-9632-e1cc66d74ae2	Lindex	Butik i Arvika	Arvika	59.655362	12.592738	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
daf2f6da-7b3a-4ad6-b61e-154feee4b604	Audio Video	Butik i Arvika	Arvika	59.655488	12.593132	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
34040cc3-599f-4592-ab29-dcf2756b6959	Noomis Blommor	Butik i Arvika	Arvika	59.655393	12.593984	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
009d00e3-7792-46b5-b3d3-16c73b795d0f	Lilla Kråkan	Butik i Arvika	Arvika	59.655477	12.594039	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f99e412-5d20-4bf0-a7d8-1438c64682cd	Arvika Begravningsbyrå	Butik i Arvika	Arvika	59.655876	12.5896	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d375ce7-8f5b-4a2e-a9ca-cca80eb1eb89	Järnvägskiosken	Butik i Arvika	Arvika	59.653624	12.591765	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ed0e47db-2f5f-412b-bf11-e1c8e31c1366	Proffs	Butik i Arvika	Arvika	59.654646	12.592042	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
79caca51-04d4-4f04-9372-7a91a9b7cdb5	Motor Trend - Arvika	Butik i Arvika	Arvika	59.65864	12.614572	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf9f829d-98a9-4e8c-88ff-d170883e40bb	Home Hotel Bristol	Sevärdhet i Arvika	Arvika	59.65502	12.59329	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
03d2adb2-da32-4eb6-a8a8-b3ceb16c51e5	Arvika stadshus	Offentlig plats i Arvika	Arvika	59.653948	12.596114	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf29c3f2-3fdf-4dcf-b765-e9bbdd5870a8	Bilbolaget	Butik i Arvika	Arvika	59.66248	12.62526	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
726c1770-324c-44f2-9044-f62dec4f6d62	Helmia	Butik i Arvika	Arvika	59.660715	12.611516	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8dc034b-1468-4c1c-8eda-06d76588f0e4	Pronto Pizza	Café/restaurang i Arvika	Arvika	59.657696	12.60486	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f7675cd4-9bca-45bd-abbc-dbf0459af200	Din Salong	Butik i Arvika	Arvika	59.654751	12.595137	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9301b90-e2f0-4d20-91af-a91b97ba8350	Dressmann	Butik i Arvika	Arvika	59.654273	12.593019	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
92faeda1-32b2-4178-8144-dc8abff35803	Be True	Butik i Arvika	Arvika	59.655213	12.592487	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
30acd6c7-1a66-4e20-9c71-57d592fbfff2	Lokal	Butik i Arvika	Arvika	59.655233	12.593242	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa69a79f-5158-4f6b-8220-f3fc5993acee	Te-affair'n	Butik i Arvika	Arvika	59.655198	12.593406	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
68f619a5-4180-4a48-b94a-c093ac4fc860	Elon	Butik i Arvika	Arvika	59.655013	12.594863	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0765ed64-3f18-4d60-8724-4f05aaed277a	Bruket	Butik i Arvika	Arvika	59.655037	12.588617	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a737dec-d88e-443c-b2ba-bc4c02659500	Salong Färg och Form	Butik i Arvika	Arvika	59.65495	12.59395	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c706821-214b-44e4-b6e0-017c94cbbd55	Langnese	Café/restaurang i Arvika	Arvika	59.654368	12.592198	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffa377e4-a240-4b28-bcce-c6796dc152ce	Mr. Barber Arvika	Butik i Arvika	Arvika	59.654536	12.59226	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
06cc9efd-0d9e-44c0-a42a-e996d27b844f	Brie och bekanta	Butik i Arvika	Arvika	59.655532	12.590695	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba145e59-8433-4101-8ad1-a16b31b2f8c4	Stadsparken	Natur/park i Arvika	Arvika	59.653189	12.598592	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
773a7209-ad5a-43d0-b7d1-ebd96fa75c3c	Lidl	Butik i Arvika	Arvika	59.670257	12.593343	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d610d15b-dfb2-41e1-a86d-a4242527788d	Sparbanken Arena	Sport & fritid i Arvika	Arvika	59.651405	12.621656	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
02167ccc-a549-4437-b857-5f9f1bc66539	Arvika travbana	Sport & fritid i Arvika	Arvika	59.656999	12.625063	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
2946b501-d164-4707-809a-16ef51741f9d	Tennishallen	Sport & fritid i Arvika	Arvika	59.654208	12.608255	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
10002e2a-f693-4ce8-b961-099b226fa96f	Oppstuhage	Sevärdhet i Arvika	Arvika	59.67064	12.61246	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2faf18e-079b-4d88-8ff0-5f7d3705c6d1	Rackstadmuseet	Sevärdhet i Arvika	Arvika	59.671635	12.611737	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
08ee3955-5b3b-48f3-b2ce-c6ed8c73eead	Taserudshallen	Sport & fritid i Arvika	Arvika	59.663555	12.610499	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0179546e-d0fc-4c8b-b846-2a9aa92f96d9	Mikaeligården	Offentlig plats i Arvika	Arvika	59.644234	12.611015	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
262b90c4-610d-4368-b308-de0e87c4f9aa	Bikenation Cykelexperten	Butik i Arvika	Arvika	59.659782	12.590284	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
07178f3a-c9c3-46c4-b5f0-82bb4bae4746	Trefaldighetskyrkan	Kyrka i Arvika	Arvika	59.657989	12.594399	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
10d5b6a9-3494-4588-a650-3e6764f3975b	Mikaelikyrkan	Kyrka i Arvika	Arvika	59.654093	12.56928	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ef654ed-5d5d-48b2-8f64-37f37a531904	Olssons Brygga	Café/restaurang i Arvika	Arvika	59.652063	12.594942	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ec1868a-8187-4365-9f2c-003cc728a7f1	Bristol	Sevärdhet i Arvika	Arvika	59.65491	12.593338	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ce973ae-f623-4efa-9668-cdeed608e26a	Shalom	Café/restaurang i Arvika	Arvika	59.657843	12.588357	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d3b4b8f-b6b4-49b0-9128-14bc15053a0f	Pingstkyrkan	Kyrka i Arvika	Arvika	59.657148	12.590147	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
b78284d6-fd76-4dc5-b72e-e10eb0d6ca94	Lecab	Butik i Arvika	Arvika	59.656293	12.581861	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c637ca84-c9ba-49b9-8657-97edba7c2abf	Kyrkebyhallen	Sport & fritid i Arvika	Arvika	59.664144	12.572601	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a1e2c5f-170a-49a4-8f07-addc4bff8124	Räddningstjänsten Arvika	Offentlig plats i Arvika	Arvika	59.661749	12.593874	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b92e279c-e799-426b-9235-9fd1edb2d746	Jem & Fix	Butik i Arvika	Arvika	59.674755	12.596643	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4f6f741-0ac1-4ee8-9146-0630d0f0f070	Kafé Nystuga	Café/restaurang i Arvika	Arvika	59.650056	12.605145	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f084afec-7223-4dde-a189-45210e752143	Sjukhuset Arvika	Offentlig plats i Arvika	Arvika	59.66542	12.615888	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
695abd2f-d67e-4775-b23d-93590a877e41	Solbergagymnasiet	Skola i Arvika	Arvika	59.656939	12.59486	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1992506-631f-425e-913d-c37cae260789	Minnebergsskolan	Skola i Arvika	Arvika	59.65884	12.592559	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f26eb792-7924-4509-bd39-e7462888e365	Dotteviksskolan	Skola i Arvika	Arvika	59.63984	12.610513	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
362e9e8c-aecd-43de-8d8d-8b8431bf6a47	Folkets Park	Natur/park i Arvika	Arvika	59.649735	12.620141	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
12a0701a-7915-48e1-bcab-0d23ca0129a3	Fotbollshallen	Sport & fritid i Arvika	Arvika	59.653502	12.622232	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f5308d9a-9e2b-427b-b63a-156646762475	Preem	Butik i Arvika	Arvika	59.662761	12.626146	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8f37ec0-1f5b-4c32-abb1-828a88c340b1	Gate Gästgiveri	Café/restaurang i Arvika	Arvika	59.662871	12.615166	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
250ff0b9-d53b-4b6a-8d01-a7a9009ad3f9	Arvika Konsthall	Sevärdhet i Arvika	Arvika	59.654345	12.594272	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4350c218-3e87-47ba-8a06-fd8b1c3c021b	Palmviksesplanaden (Slagfältet)	Natur/park i Arvika	Arvika	59.659206	12.587355	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ebc605c-9345-4f2b-b1f2-d0613fdedd38	Elins Bakgård	Café/restaurang i Arvika	Arvika	59.654769	12.588843	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6fd2c3dd-e97c-4f5e-aa5b-ba0f4aed65db	Såguddens hembygdsgård	Sevärdhet i Arvika	Arvika	59.6502	12.605346	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a21706d-2841-4bd7-b809-0f868f0f4a27	Strandparken	Natur/park i Arvika	Arvika	59.65302	12.584848	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f767794-afb3-4162-a5e5-4ee1348cc176	Storbondegården	Sevärdhet i Arvika	Arvika	59.650766	12.603297	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4404bd7e-51e8-4ebd-92fd-46ed00e2c2a6	Tangenstugan	Sevärdhet i Arvika	Arvika	59.650915	12.602668	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b143369-bcb2-4420-9fa0-54177744c314	Visthusbod	Sevärdhet i Arvika	Arvika	59.651001	12.603155	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
24df308c-bda8-455f-b1fa-a0621d93ca8a	Stolpbod	Sevärdhet i Arvika	Arvika	59.650481	12.603135	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8912544c-d398-4ab7-96f3-59de5da63af9	Loftskjul	Sevärdhet i Arvika	Arvika	59.650531	12.603454	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1349f51-26b7-4a56-aecd-e9df80b5bbc7	Soldattorp	Sevärdhet i Arvika	Arvika	59.65027	12.60369	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c545629-eb0a-4693-877b-92bbf7f2e221	Olle Rökares Stuga	Sevärdhet i Arvika	Arvika	59.65006	12.603669	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
de2dc40a-5aea-41ff-a05b-4eba10d80f7d	Skogsfinsk rökstuga	Sevärdhet i Arvika	Arvika	59.650473	12.604389	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c478024-5850-4cee-91d9-835381226a4e	Troll-Mattes Smedja	Sevärdhet i Arvika	Arvika	59.650362	12.605031	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f4a6be4-b728-4ebf-9357-2f5e815aa577	Byggmax	Butik i Arvika	Arvika	59.67417	12.593136	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
68ce33d8-4181-48b7-b2b2-1ab850ae7ba7	Promenadplatsen	Natur/park i Arvika	Arvika	59.654926	12.587174	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
62f0eb65-19c2-4ac2-8353-3796d070f2c6	Taserudsgymnasiet	Skola i Arvika	Arvika	59.662585	12.610319	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1092d491-3059-4754-be51-68a8877ff741	Gateskolan	Skola i Arvika	Arvika	59.660957	12.608779	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
207ecd1e-06cf-40da-8793-acbed7a4d145	Agnetebergsskolan	Skola i Arvika	Arvika	59.662731	12.572476	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac4953f8-96f1-4f8b-a635-b5164f1c7e0b	Kyrkebyskolan	Skola i Arvika	Arvika	59.665089	12.573851	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
90500953-d2ea-4dc7-bde0-a58975fa20d2	Graningegården	Skola i Arvika	Arvika	59.672996	12.603909	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b289e0b1-3856-4ffd-a58d-97130bc0f67c	Höjdangivelse vattennivå	Gata i Arvika	Arvika	59.653423	12.598166	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ab89207-aa32-4128-be34-efcd21cc1df8	Rackstavägen	Gata i Arvika	Arvika	59.670414	12.61755	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ec5e8acd-d042-4d70-967d-65e4b713c3cc	Styckåsvägen	Gata i Arvika	Arvika	59.650115	12.608651	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b02b6c3d-d386-43ac-b345-4f3d0a8c88b0	Kyrkogatan	Gata i Arvika	Arvika	59.654774	12.595317	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
04c96a5f-4cf5-41c8-b0cf-ca458be05d7e	Ingesundsvägen	Gata i Arvika	Arvika	59.638422	12.612854	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca16e721-5cdb-4a7d-93d4-ffb826a90729	Styckåsgatan	Gata i Arvika	Arvika	59.65663	12.603948	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e17fdcb4-b32e-40fe-8e61-61b6ef4faf5f	Karlstadsvägen	Gata i Arvika	Arvika	59.661354	12.612527	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
07f0b143-e7d9-43ce-b424-33274b0ae19f	Hamngatan	Gata i Arvika	Arvika	59.658444	12.597325	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
33e94d74-dc96-4c3e-bf7b-427177ddf3cf	Järnvägsgatan	Gata i Arvika	Arvika	59.655312	12.584345	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
155f5682-78fa-4795-92d9-77aceb4c58a5	Storgatan	Gata i Arvika	Arvika	59.654748	12.590743	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cdf68ff5-e7be-46e1-98e7-d9392d155f9d	Taserudsgatan	Gata i Arvika	Arvika	59.661219	12.604986	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
94f1359a-5405-4f2c-b3b1-516bba097f2c	Jägargatan	Gata i Arvika	Arvika	59.661325	12.606924	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
23d5d234-354f-4445-a579-b217760a4a29	Nyckelgatan	Gata i Arvika	Arvika	59.661747	12.602826	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c67a51f-1a80-4e94-ad00-3ef627310fb1	Västra Kyrkogatan	Gata i Arvika	Arvika	59.657279	12.580388	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
febdca4c-37c9-4474-aafc-accc2d495596	Palmviksgatan	Gata i Arvika	Arvika	59.655622	12.585323	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15e2d8f7-e657-4235-a0bb-88ae2ed31a3a	Fabriksgatan	Gata i Arvika	Arvika	59.655606	12.595371	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c654d85-add1-4c6d-879d-d3f03de2fbf7	Solbergagatan	Gata i Arvika	Arvika	59.656802	12.5792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
55399bd2-cd6d-4726-8c75-26a162212116	Industrigatan	Gata i Arvika	Arvika	59.657084	12.581341	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a0745f4d-fa43-476c-9bf7-122d8f26b0f4	Tvärgatan	Gata i Arvika	Arvika	59.656597	12.579294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb628a3b-cfc1-401b-acc3-08d054645797	Hörngatan	Gata i Arvika	Arvika	59.658797	12.580523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06110363-f1a5-45a2-8a3d-52c2c5d3397b	Hantverksgatan	Gata i Arvika	Arvika	59.656124	12.594634	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d2a73a9-1970-4a40-9e33-48bdf05222a9	Repslagaregatan	Gata i Arvika	Arvika	59.658833	12.589323	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f9541d51-272f-4b29-a8e0-539fd42808f4	Högåsvägen	Gata i Arvika	Arvika	59.664071	12.594829	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb791848-7e65-48f4-bb6d-f828dcf9dbb6	Roos väg	Gata i Arvika	Arvika	59.649262	12.625102	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4ca0e68-f65a-452f-9068-912cef4c31c9	Liljebjörns väg	Gata i Arvika	Arvika	59.649469	12.625501	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
13bf5847-2288-4bde-9dcf-17cd2aa8cc14	Stålhandskes väg	Gata i Arvika	Arvika	59.649535	12.626684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c16fccf-48c0-43b9-8797-07d38c0946f3	Bryntes väg	Gata i Arvika	Arvika	59.649583	12.627872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58aea914-7079-4003-9c60-f7f17f572344	Solviksvägen	Gata i Arvika	Arvika	59.649078	12.617383	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c4682a8-25c6-4c40-92ea-17e166298242	Lagerlöfsgatan	Gata i Arvika	Arvika	59.657252	12.578005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad6b764d-e1e5-4964-bc4b-4ff17097d2dd	Torggatan	Gata i Arvika	Arvika	59.656422	12.593194	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d2f861a-4107-4c4a-b6c1-62b314192894	Strandvägen	Gata i Arvika	Arvika	59.654203	12.584516	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bdeea290-a9dc-4330-b026-4cd43140d4db	Spårgatan	Gata i Arvika	Arvika	59.653105	12.589012	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e8848ac-1e6a-4d96-ad26-8d0252658e21	Solbergsgränd	Gata i Arvika	Arvika	59.655641	12.58833	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99263ca0-1942-4aa4-9207-530938b5c718	Östra Torggatan	Gata i Arvika	Arvika	59.654074	12.592163	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
acd4e288-82c5-4253-bdd0-da62be416a4b	Norra Esplanaden	Gata i Arvika	Arvika	59.658856	12.60117	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a43c59bf-e3a0-4177-8a8f-54e975ab2502	Nygatan	Gata i Arvika	Arvika	59.657251	12.60085	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ad00787-faeb-4bdc-a26b-a222847b95ce	Skolgatan	Gata i Arvika	Arvika	59.656093	12.59734	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
50b2b16d-b65a-47bf-badf-00ac515c7c49	Köpmangatan	Gata i Arvika	Arvika	59.65557	12.590872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e4e61f8-d771-4526-9c72-b4a4894d6b6c	Östra Esplanaden	Gata i Arvika	Arvika	59.656836	12.59869	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd462bb2-85eb-4a63-836b-914b621ce84c	Palmviksrondellen	Gata i Arvika	Arvika	59.65532	12.585237	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
93e1afad-25d6-40df-8e69-835168e808fb	Henrik Schröders Gata	Gata i Arvika	Arvika	59.659093	12.595156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb52bf76-5e1a-47b4-bdb3-1b6f3f38b383	Minnebergsgatan	Gata i Arvika	Arvika	59.660322	12.593419	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d60ab3c8-d2eb-4297-b08a-9ac9f73f35aa	Tingsgatan	Gata i Arvika	Arvika	59.657692	12.593027	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92c61530-58a6-4d04-a7b9-709ca7a9de55	Nordgatan	Gata i Arvika	Arvika	59.656724	12.603102	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
caa3156a-5bb9-4ef2-989d-191bdd004131	Cisterngatan	Gata i Arvika	Arvika	59.659719	12.59758	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f37be5b-8488-4380-94ec-c8132747236e	Harald Halléns gata	Gata i Arvika	Arvika	59.659373	12.593645	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b208f920-cc6a-45ad-9fff-874c21492883	Magasinsgatan	Gata i Arvika	Arvika	59.658067	12.591029	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b2353ac-b682-4c1f-bc21-bffd25d5df61	Jakobsgatan	Gata i Arvika	Arvika	59.659031	12.595149	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bad6a8a0-f4dd-476b-b5e2-4d8a669732d6	Volvogatan	Gata i Arvika	Arvika	59.645132	12.627978	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e144112-2344-442e-ac02-aca8acd2461d	Mötterudsvägen	Gata i Arvika	Arvika	59.646873	12.622346	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92c1b500-bff2-4257-81dc-b53aa6972da1	Korpralsvägen	Gata i Arvika	Arvika	59.644222	12.627098	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c146d68c-ffd0-49f0-8a15-cf28f8854e24	Sälgvägen	Gata i Arvika	Arvika	59.670153	12.619812	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
31794cda-8f48-4a1a-ba85-ed22b1807820	Svampstigen	Gata i Arvika	Arvika	59.671185	12.621368	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c72f8712-ca21-4d5c-9d59-e23a843a5902	Enstigen	Gata i Arvika	Arvika	59.670702	12.620986	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5511d28e-e3e2-483a-8f89-b5ff2dcff2ad	Gesällvägen	Gata i Arvika	Arvika	59.67543	12.602679	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
757f89ff-cec3-430c-ac11-6282dadd9f13	Graningevägen	Gata i Arvika	Arvika	59.672669	12.597997	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb04ddd7-f7c6-40b0-913e-b89473dd4d55	Kungsvägen	Gata i Arvika	Arvika	59.673677	12.609736	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
575964bf-2f12-48c9-abda-f67a14f529ab	Kardarevägen	Gata i Arvika	Arvika	59.673727	12.603596	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7247feb2-cb19-4507-8fb8-af69ccce17a1	Fjaestads väg	Gata i Arvika	Arvika	59.669525	12.609208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ec7998c-7377-4bb4-b219-24f4efa8b5ea	Prästgårdsvägen	Gata i Arvika	Arvika	59.656682	12.558929	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab45ba4f-df99-42fa-84a4-f9f7b394f226	Mikaeligatan	Gata i Arvika	Arvika	59.655027	12.570351	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2a1fcd5-6634-431b-9f28-a447bfedc2ec	Hyvelgatan	Gata i Arvika	Arvika	59.672754	12.609414	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
807ea007-8d29-482c-ad66-8ce5b9a9e96c	Västerleden	Gata i Arvika	Arvika	59.671996	12.606613	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d997051-83c4-4274-bc35-bfd24a6fe4a5	Tranbärsvägen	Gata i Arvika	Arvika	59.66637	12.573618	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
887fe4e1-f0b3-42ed-ada9-6870c7e41ecc	Björnbärsvägen	Gata i Arvika	Arvika	59.668202	12.577081	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fda3e353-0ea7-411b-96f8-e520c93b142b	Slåttervägen	Gata i Arvika	Arvika	59.667144	12.576864	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3c57232-9f1d-40c0-ac5a-064ebb7a1282	Odonvägen	Gata i Arvika	Arvika	59.667228	12.574851	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
441ecf7a-247a-4e73-a012-f347007e0237	Solrosvägen	Gata i Arvika	Arvika	59.667465	12.573567	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
431a45b7-e657-45fa-9b4c-9ba376880180	Rosendalsvägen	Gata i Arvika	Arvika	59.663691	12.58163	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
57ef64c0-d36d-401e-bc26-0ddebcf60ef7	Sävsjövägen	Gata i Arvika	Arvika	59.663907	12.571461	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86f9ef30-3cd4-48bd-8386-d0006d4183f7	Hjortronvägen	Gata i Arvika	Arvika	59.668352	12.57798	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef94d4c0-18c7-4f6f-962a-f9df4da68e33	Alvägen	Gata i Arvika	Arvika	59.669313	12.621736	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f2b3c85-a5ee-4c01-ba74-9891a57bf0bf	Mellangatan	Gata i Arvika	Arvika	59.660901	12.575156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e2976e4-8de4-4220-825d-02ccf73aca5c	Spelmansvägen	Gata i Arvika	Arvika	59.658288	12.573807	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
787d9459-2fd2-47c7-8cd3-6124d44009cf	Edgrensgatan	Gata i Arvika	Arvika	59.661472	12.574393	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6239d81a-177f-47e1-bc37-f7d09c91d658	Västergatan	Gata i Arvika	Arvika	59.6582	12.570387	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dca00897-f25b-41a2-a90f-67f965bea056	Bäckstigen	Gata i Arvika	Arvika	59.658877	12.567312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e77f640-dab6-426a-8167-7b0cbe8f8bbe	Valdemar Dahlgrens gata	Gata i Arvika	Arvika	59.65966	12.571944	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8aa14cc5-dd17-4add-81b1-f4f95122b366	Kyrkebyvägen	Gata i Arvika	Arvika	59.660137	12.568336	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c57ca661-b05a-464e-bdbe-fbc1354ca8f9	Vinkelvägen	Gata i Arvika	Arvika	59.664682	12.574754	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c86f1f61-ab67-49ca-8b5e-5308daab197d	Lofotsvägen	Gata i Arvika	Arvika	59.6617	12.573363	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
89481b91-54fb-4dff-aec4-ba9bd2be5270	Agnetebergsallén	Gata i Arvika	Arvika	59.657229	12.576636	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6a36083f-72e7-4767-8572-1eaeb4978f51	Mor Stinas väg	Gata i Arvika	Arvika	59.668791	12.610884	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d751580-d53c-483a-bdc5-dfa861effecc	Mäster Elis väg	Gata i Arvika	Arvika	59.668582	12.612612	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d2bb6d5-47b8-4228-8a55-33a77c2ad8d7	Mäster Olas väg	Gata i Arvika	Arvika	59.669408	12.613294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
49552d06-dc6b-4a0f-bf7e-aaaeb231dbda	Slöjdvägen	Gata i Arvika	Arvika	59.674494	12.601607	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f2a702b-1673-4271-a152-ca04b0d4a548	Vävarevägen	Gata i Arvika	Arvika	59.671271	12.601401	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
70f89174-2f8d-4d4f-b71d-899753a957ef	Spinnarevägen	Gata i Arvika	Arvika	59.670498	12.601865	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3fe10211-bd19-4d20-a72f-c6a18fdbf639	Sommarvägen	Gata i Arvika	Arvika	59.672878	12.606292	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f44f88da-5791-4b7e-919d-41b74a383b1a	Bror Sahlströms väg	Gata i Arvika	Arvika	59.671531	12.606587	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58260b58-ad2d-4f43-ad95-81924997549d	Ahlgrenssons väg	Gata i Arvika	Arvika	59.67094	12.605092	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5eec1894-4579-403f-bd04-8adebec91911	Fader Eriks väg	Gata i Arvika	Arvika	59.670633	12.607752	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4731a3bc-8d60-4596-9922-7deec9e29ca2	Bror Linds väg	Gata i Arvika	Arvika	59.670222	12.60526	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b918039-efb1-4777-9f16-fcd486a978d1	Myrsmedens väg	Gata i Arvika	Arvika	59.669674	12.606918	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0851c24-4b32-409c-8981-69faa2e91232	Madame Jeannes väg	Gata i Arvika	Arvika	59.667663	12.609196	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f9264ae-b7f7-4690-b8d4-d2a19527bd2a	Arvés väg	Gata i Arvika	Arvika	59.675328	12.603936	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d46dab49-a837-4cee-a70f-61d8112ee776	Ekvägen	Gata i Arvika	Arvika	59.668952	12.616585	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d0a0fab3-a559-45de-a4c0-d2bc6f1543a1	Mäster Kalles väg	Gata i Arvika	Arvika	59.669767	12.614389	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9cb61975-7e16-426e-a07a-61f7d0fa0314	Liljeplan	Gata i Arvika	Arvika	59.666736	12.602402	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
be8d1bd7-fe4b-4a2b-aec7-af2f8af46221	Tjäderstigen	Gata i Arvika	Arvika	59.664776	12.592796	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
75f1cbf4-f2a3-4781-83e1-375e1765c0a8	Thermiavägen	Gata i Arvika	Arvika	59.662039	12.591035	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
65975bb9-2bfa-4232-89c0-b7cf6602f788	Karlsborgsvägen	Gata i Arvika	Arvika	59.661393	12.588975	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
153822a0-8c09-4c2f-be68-d208d13d499f	Liljevägen	Gata i Arvika	Arvika	59.666352	12.60206	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a3f4376a-c3c3-45d2-b8dd-92158adea897	Fågelvägen	Gata i Arvika	Arvika	59.66126	12.602257	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ecea4882-8f8c-4234-b247-31ea7453c6d9	Degerängsvägen	Gata i Arvika	Arvika	59.66309	12.602707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3d2299d1-fdce-4ffc-a564-4025e75a1806	Björkvägen	Gata i Arvika	Arvika	59.663431	12.59348	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb702057-da9c-4ea7-abeb-d583cb94247d	Brante backe	Gata i Arvika	Arvika	59.663085	12.59796	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
62dbbb65-b1b0-450c-8d95-8f4515bc3bed	Källgatan	Gata i Arvika	Arvika	59.661683	12.593185	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
70128fed-ef4c-4876-9421-811d8bd5eb03	Kopparvägen	Gata i Arvika	Arvika	59.663084	12.595407	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f985af5-e230-4c40-b08e-b3c9706e7f32	Sollidsvägen	Gata i Arvika	Arvika	59.663274	12.595476	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5541e26-2f0f-475d-b5c6-20b84ed7c836	Nämndemansvägen	Gata i Arvika	Arvika	59.663823	12.606724	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe543db8-6aab-47e1-b89d-6d33527ec154	Christan Erikssons väg	Gata i Arvika	Arvika	59.667155	12.598179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad9b2354-8060-4fc6-8ee9-a85682982f53	Hagbergsvägen	Gata i Arvika	Arvika	59.665475	12.603928	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
617d0c5e-ca82-4ff1-80bb-eb3e56885fa5	Polerargatan	Gata i Arvika	Arvika	59.673377	12.600351	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d73f6ef-436e-40c2-a00c-2292c206e487	Länsmansvägen	Gata i Arvika	Arvika	59.668698	12.599288	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12232039-7180-4adc-b8e4-8fd3ff6f870a	Videvägen	Gata i Arvika	Arvika	59.666756	12.599104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
952432e5-eb9e-4763-8fdb-1bae05ffbf78	Kullaplatsen	Gata i Arvika	Arvika	59.667853	12.597678	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d1fb19c-bc72-4de1-9851-bec32853a85e	Blockaplatsen	Gata i Arvika	Arvika	59.668	12.599586	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3bb06f7a-4864-4085-8bb2-fa65e5dfc4c1	Tapetserargatan	Gata i Arvika	Arvika	59.673247	12.598745	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
51f61f08-f2db-455b-8c1e-0ecdabbe1b2e	Domarevägen	Gata i Arvika	Arvika	59.666289	12.605804	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
770e7e1b-1073-4218-aaca-0715c502a102	Tallstigen	Gata i Arvika	Arvika	59.663194	12.601472	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b06dc906-5eef-4468-ac4c-b161810dcd31	Mebiusvägen	Gata i Arvika	Arvika	59.664763	12.600792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47bb85eb-e7f4-4a9a-a7b3-c5490f51bd87	Lärkvägen	Gata i Arvika	Arvika	59.663398	12.606854	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e67cf66-e401-48a3-9b7e-c1472dc5f1b6	Fältgatan	Gata i Arvika	Arvika	59.660617	12.598456	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ead178d1-d700-4460-b5a7-6e4f259ee3f7	Bältaplatsen	Gata i Arvika	Arvika	59.66614	12.603388	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e49011b3-0d72-4702-beb1-a375171684f0	Parkgatan	Gata i Arvika	Arvika	59.653001	12.603083	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47acf3bd-1e86-419e-bab5-01801c08c0a5	Viksgatan	Gata i Arvika	Arvika	59.656121	12.601826	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f2b6168-f682-4f1f-b21d-913c81fb0976	Årjängsvägen	Gata i Arvika	Arvika	59.659509	12.557521	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e24ad15b-f4b1-4e51-96e3-81a0f12bc4f2	Agnetebergsleden	Gata i Arvika	Arvika	59.66953	12.587112	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ff967d3-571d-4a10-a176-9fe8caf33286	Prästängsrondellen	Gata i Arvika	Arvika	59.659972	12.56047	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
483c0546-d99e-4fd2-9457-974b9ec31bdc	Hästhovsgatan	Gata i Arvika	Arvika	59.661842	12.559073	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
09a718f3-0f63-4164-8a15-8d27d2940fc5	Brunnshusvägen	Gata i Arvika	Arvika	59.662978	12.568785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc09232d-1f9d-48fc-968b-7fa7b94b2153	Ljungåsgatan	Gata i Arvika	Arvika	59.666569	12.579016	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f04b778c-3b21-4182-bb37-a150cfffb880	Höjdgatan	Gata i Arvika	Arvika	59.662217	12.586435	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd31c1f2-8f06-4029-a5e4-a9c2bedbc252	Norrskensgatan	Gata i Arvika	Arvika	59.661001	12.585279	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a53a519-c7ac-4421-9d13-04ee81d869d1	Skyttegatan	Gata i Arvika	Arvika	59.662188	12.584846	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe36a4a0-e59a-4877-81ae-ce9c37c7645a	Jössehärsgatan	Gata i Arvika	Arvika	59.659103	12.582465	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e0371a8-1db7-4436-94d0-d4c58a9a89c0	Sibeliusgatan	Gata i Arvika	Arvika	59.662563	12.580268	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd103c65-6455-4126-ab68-18634f0c7b80	Glashyttegatan	Gata i Arvika	Arvika	59.661029	12.579813	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3363aae9-9eb3-4381-93e1-c5ad5984baa6	Nypongatan	Gata i Arvika	Arvika	59.666016	12.581076	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
551fe3d4-2e57-49a4-b132-865a46301e2b	Kastanjegatan	Gata i Arvika	Arvika	59.664185	12.578389	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da26332f-7f4d-4d5a-b299-d248d24b8c05	Bergsgatan	Gata i Arvika	Arvika	59.660668	12.583086	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0d2b336-1756-42b3-b73b-ee769bee0ae7	Kolonigatan	Gata i Arvika	Arvika	59.6602	12.57104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1279470f-7fc6-41c2-a152-a2514ab57a04	Pilgrensvägen	Gata i Arvika	Arvika	59.658857	12.578836	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d4eeb2c-b9e0-4e4f-bf6b-5e83b376ee9f	Ugglas gränd	Gata i Arvika	Arvika	59.658565	12.578102	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3234a4eb-378b-4d82-b548-6c82dbebe1fc	Erik Norelius gata	Gata i Arvika	Arvika	59.663173	12.57048	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
72909066-cc2b-4233-8409-c1654462b528	Olle rökares gränd	Gata i Arvika	Arvika	59.659223	12.583649	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7945ce28-66ac-469a-b6bd-8e4c219b63b6	Trekantsgatan	Gata i Arvika	Arvika	59.66071	12.580048	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fbf22036-53f0-4bd8-8abd-e2236f0ffeb1	Nordmarksgatan	Gata i Arvika	Arvika	59.66043	12.584567	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
205d4e46-7ad6-4a8b-ad0c-9b472ecb3b66	Allégatan	Gata i Arvika	Arvika	59.657024	12.582885	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7842cf9a-5f7d-45c3-8f12-64ccf0527953	Trädgårdsgatan	Gata i Arvika	Arvika	59.656713	12.584434	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5aaf7c34-ce7a-4a92-b386-919bcce682ed	Lilla Kvarngatan	Gata i Arvika	Arvika	59.664441	12.586817	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
26db9410-bb98-4539-8de5-eca7489b1c83	Karlavägen	Gata i Arvika	Arvika	59.662106	12.585472	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6646223-138c-420f-a1f5-5f58a3e6099e	Gärdesgatan	Gata i Arvika	Arvika	59.664475	12.58195	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f4246cc-cd5e-4a3d-9ab8-624e2388eb28	Ingmansvägen	Gata i Arvika	Arvika	59.663932	12.58167	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
52f039fd-c744-4ab1-b8a7-2af9136760e8	Boställsvägen	Gata i Arvika	Arvika	59.664128	12.585782	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe615c68-42d9-4ea4-a8bf-336842cbb7de	Soldatgatan	Gata i Arvika	Arvika	59.663331	12.587562	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
965ce117-858d-4cbe-ba9b-bddfe7d84fa2	Smultrongatan	Gata i Arvika	Arvika	59.666934	12.579991	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4bb8456a-33f7-46f2-b114-a3c5f2dcda26	Brunnsvägen	Gata i Arvika	Arvika	59.661426	12.570816	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aeb7caa2-9604-4b3b-8698-edf2c03a393e	Lilla tingsgatan	Gata i Arvika	Arvika	59.658567	12.588262	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff7c79a8-ca37-47c2-8ed3-c8f775a6fc9e	Lilla skolgatan	Gata i Arvika	Arvika	59.657847	12.587756	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12dbb348-5f13-4138-942b-54a49462a046	Fredsgatan	Gata i Arvika	Arvika	59.659309	12.588773	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e8f69a7c-feb0-4fb0-bb01-6119cf550e3b	Flodquists Backe	Gata i Arvika	Arvika	59.655899	12.58403	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d2de5a2-0ef2-49b9-af66-7d038615143f	Kvarngatan	Gata i Arvika	Arvika	59.663753	12.586623	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c51b588a-812c-4e16-9049-e83fe9a5c257	Genvägen	Gata i Arvika	Arvika	59.659965	12.581243	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f822ce8f-8ffd-4999-9eae-a2f03a042302	Blästervägen	Gata i Arvika	Arvika	59.668719	12.590156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a218be12-3cb4-4411-87d1-f6685140a0a1	Höviksgatan	Gata i Arvika	Arvika	59.659358	12.604398	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
49ef6438-ecea-4d84-97dc-28086bb636fd	Lilla Viksgatan	Gata i Arvika	Arvika	59.659742	12.604517	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc72d86c-c7c7-4f43-9f44-afd081d2dfbc	Lilla Nygatan	Gata i Arvika	Arvika	59.660062	12.602842	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
49cd19e4-f85d-40ce-8a11-2380dc4ffadc	Förrådsgatan	Gata i Arvika	Arvika	59.659934	12.608348	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
317b2e9a-271c-4b81-b5db-54aa98fd528d	Åkaregatan	Gata i Arvika	Arvika	59.659716	12.613588	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
859d2b59-0d22-4ade-a125-4e033ead24b9	Mejerigatan	Gata i Arvika	Arvika	59.666225	12.594482	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2f84023-c74f-4adc-9547-6240baa698e4	Myråsvägen	Gata i Arvika	Arvika	59.665903	12.586621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42b89cd3-8248-4c61-b826-a1a041e7fc9e	Gästgivarvägen	Gata i Arvika	Arvika	59.663984	12.590619	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
907c2e36-3441-48d9-ac8b-1b7ad76a27d4	Triangelvägen	Gata i Arvika	Arvika	59.662888	12.593043	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2f91fa7-1e1f-4011-96cb-65384b085f9b	Långvaksvägen	Gata i Arvika	Arvika	59.663359	12.625495	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8ec2027b-70ac-491c-b1de-451146fdd76e	Fallängsvägen	Gata i Arvika	Arvika	59.667507	12.593453	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e0777c5-b9cb-49e0-9abf-9ba679305f80	Silovägen	Gata i Arvika	Arvika	59.675789	12.591437	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
889d50b1-85ca-4954-9b3f-de72954669f1	Myrstacksvägen	Gata i Arvika	Arvika	59.671137	12.617798	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f57f566a-f205-44a0-8b10-325773450ddc	Moster Skuggas väg	Gata i Arvika	Arvika	59.673054	12.616435	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
faf1803d-edf5-430a-bdfc-9e280f256734	Stränggatan	Gata i Arvika	Arvika	59.675899	12.59784	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d120d3b1-e805-4ed2-9da4-4732d1aac357	Ljungåsen	Gata i Arvika	Arvika	59.670682	12.579179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44c1577c-f1f6-4475-84fc-55882cdb9538	Sofielundsvägen	Gata i Arvika	Arvika	59.666705	12.590104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
824c5d93-3147-4ce0-838a-25f1e475299c	Jenny Nilssons gata	Gata i Arvika	Arvika	59.656044	12.586204	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
678c7d43-1443-4fc8-91f8-5b86ffe3d623	Blankenfjeldsgatan	Gata i Arvika	Arvika	59.652725	12.619737	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0d2e8ea-5c84-42ff-8d13-43f0ee2278d4	Fallebergsvägen	Gata i Arvika	Arvika	59.656828	12.621389	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3a04559-fa01-4660-b2c0-689744845421	Friskyttevägen	Gata i Arvika	Arvika	59.660438	12.626915	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d1d7148-644b-4256-92e2-5d23f83f5ea8	Kvarntorpsvägen	Gata i Arvika	Arvika	59.661012	12.624035	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f93cde41-d167-4316-a95c-dc97a4490b53	Fritidsgatan	Gata i Arvika	Arvika	59.650866	12.62156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
29477bd0-8e31-407a-95b4-8cfe5dd6015e	Snickaregatan	Gata i Arvika	Arvika	59.657202	12.629061	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
885e9ebd-4986-4338-83d0-2359fbd95c3a	Charlottenbergsvägen	Gata i Arvika	Arvika	59.671743	12.595208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba52c57c-0972-4fe6-b4e1-26c343141927	Graningerondellen	Gata i Arvika	Arvika	59.671224	12.594704	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5af20c5-ebd8-4c3f-8ec5-a4a3f9d662f7	Frykdalsvägen	Gata i Arvika	Arvika	59.663829	12.601072	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2e8162d-f9e7-4b6e-9147-933afb71ab0d	Nytomtavägen	Gata i Arvika	Arvika	59.641347	12.617127	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7cf6faf-8982-47d2-a6b3-26b3764788ee	Tornstigen	Gata i Arvika	Arvika	59.641441	12.620284	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a65f901-456a-4dba-bd97-88c0db6878bd	Båtgatan	Gata i Arvika	Arvika	59.642471	12.613068	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f2ec370-de07-4abe-9dd9-f8c859237c19	Muraregatan	Gata i Arvika	Arvika	59.642692	12.614683	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
016322c1-2194-457a-888b-0b21a93c6213	Holmströms väg	Gata i Arvika	Arvika	59.638931	12.610201	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
674cdee7-8dd2-46be-b761-f4e92f038dc7	Lövstigen	Gata i Arvika	Arvika	59.636313	12.606404	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e310d25b-39ec-4a92-8cde-53efe10102ac	Nerstugevägen	Gata i Arvika	Arvika	59.642099	12.612267	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5cedaddf-ab21-463b-84d1-a174f613efb4	Utblicksvägen	Gata i Arvika	Arvika	59.635021	12.606958	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
08df5c04-64e2-49f3-a865-5a7655a2658a	Fridhemsvägen	Gata i Arvika	Arvika	59.637201	12.60627	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ce2c6b6-ca03-48d0-b323-6558d305d447	Villavägen	Gata i Arvika	Arvika	59.635711	12.602512	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8fb031e1-0157-416e-835d-0c67b3040a02	Varvsgatan	Gata i Arvika	Arvika	59.641999	12.611371	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dbb4b7d9-6dd7-4598-9048-2070dc3035cc	Skogsviolgatan	Gata i Arvika	Arvika	59.66573	12.565025	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
34f956ff-2412-446d-9ae0-6edc4cde1b3f	Tallörtsgatan	Gata i Arvika	Arvika	59.66722	12.566852	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c1c9a39-5bd6-4938-884a-8885a2db0ba0	Vildrosgatan	Gata i Arvika	Arvika	59.663254	12.561906	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d86828f-bbc1-4b47-b772-79ad8062e449	Porsgatan	Gata i Arvika	Arvika	59.661038	12.560865	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e77ef53-101e-49ff-9df7-40ddf8e32dab	Kamomillgatan	Gata i Arvika	Arvika	59.662897	12.563129	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
338a84b4-8087-4582-9255-b60339a1a3e6	Baldersbrågatan	Gata i Arvika	Arvika	59.66413	12.564345	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e8da8f3-a3ea-45f8-9e31-dddfdc53fc0a	Fiskaregatan	Gata i Arvika	Arvika	59.656046	12.574684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a0fef52-b2b8-49ea-9643-bda9f208bf25	Matrosgatan	Gata i Arvika	Arvika	59.655486	12.571643	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7dd952bc-8947-451c-90ed-e5de1aa7b3cf	Styrmansgatan	Gata i Arvika	Arvika	59.654307	12.578618	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4da006c8-61ed-4239-8c82-f75d2fc84275	Sjögatan	Gata i Arvika	Arvika	59.65577	12.57311	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9bece8d-9c8e-46cf-a60e-e5926121afc3	Skepparegatan	Gata i Arvika	Arvika	59.655458	12.574899	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b43b8773-97a8-4a2e-936c-e18650d4dda0	Klockaregatan	Gata i Arvika	Arvika	59.656422	12.569948	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e33f548f-f78d-4d8e-a382-ab2c98a2f2ac	Arviksgatan	Gata i Arvika	Arvika	59.656667	12.569958	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab79b03d-83dd-4fe7-a534-0c7f55cc802f	Prostgatan	Gata i Arvika	Arvika	59.656649	12.568602	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f7d21057-8321-4e03-8853-e3de6ab07497	Tivoligatan	Gata i Arvika	Arvika	59.65267	12.603168	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b0f865d-321b-4219-a254-1f426b92be7b	Landsvägsgatan	Gata i Arvika	Arvika	59.652222	12.604697	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ebdc2d5b-2468-448b-8020-e3fa25e99c81	Lilla Jakobsgatan	Gata i Arvika	Arvika	59.660447	12.587493	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7b8fe34-7e2c-473b-a7de-e21e296d968e	Borggatan	Gata i Arvika	Arvika	59.658754	12.590806	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d65f9b72-8314-4abf-b434-6b74233794c3	Förvaltargatan	Gata i Arvika	Arvika	59.644777	12.616853	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef86f405-a689-41bf-9349-5cd2e7520b4c	Bangårdsgatan	Gata i Arvika	Arvika	59.652984	12.591099	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc8b41b4-814d-4455-b134-bc647b8344df	Fritz Lindströms väg	Gata i Arvika	Arvika	59.669395	12.606909	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b406af0-cd43-42a3-a426-a0301db83d1a	Gullrisgatan	Gata i Arvika	Arvika	59.663786	12.563491	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2de8872-25f5-4d36-9b0b-cc3e100cb61c	Hagagatan	Gata i Arvika	Arvika	59.658877	12.5845	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e366e3a-681d-4a2f-8bc3-30fe9151856e	Kolgränd	Gata i Arvika	Arvika	59.652771	12.587428	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c2e8204-3b0f-4763-ae44-f875a91cd966	Lilla glashyttegatan	Gata i Arvika	Arvika	59.659919	12.584529	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cfe0298d-8a88-4aaf-a7f6-c9c37521ac34	Museigatan	Gata i Arvika	Arvika	59.651945	12.605039	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
498ce129-3160-4ee3-8ac0-3d62924b44e3	Möbelgatan	Gata i Arvika	Arvika	59.672528	12.598809	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef48f302-bc1c-4a63-ac80-fa9faa6aecf4	Pensionärsvägen	Gata i Arvika	Arvika	59.664034	12.601717	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2067367-84f6-449a-901f-ddd84b502a9e	Solvändsgatan	Gata i Arvika	Arvika	59.666186	12.60069	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dafbd92c-e482-43b1-b969-f5bedbe53832	Stefans väg	Gata i Arvika	Arvika	59.670345	12.61471	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
037416a7-c206-471b-90a8-b00561b8a65d	Gamla vägen	Gata i Arvika	Arvika	59.64266	12.613766	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6416a2f-a093-4569-9063-2602bc420947	Bandgatan	Gata i Arvika	Arvika	59.654003	12.604458	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e459d67-5775-4197-aff4-bb250d314ca1	Per Anderssons gata	Gata i Arvika	Arvika	59.658677	12.592317	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6532d3f-75e1-462e-a523-163eecb30e5f	Ridstigen	Gata i Arvika	Arvika	59.658149	12.617996	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
29fe3ae3-3542-41dd-86b7-9144b06406d5	Kanotvägen	Gata i Arvika	Arvika	59.637206	12.605027	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
54409060-f980-4dd7-9dc5-66798c69a8fa	Nylandsbacken	Gata i Arvika	Arvika	59.637567	12.615108	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
261fdd38-e0f7-40e7-a941-f224e444a1de	Gunnarskogs gränd	Gata i Arvika	Arvika	59.657963	12.596401	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d73cd8dd-14ef-43da-8dbd-8610a05e9f03	Västra Torggatan	Gata i Arvika	Arvika	59.654393	12.591015	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c344bdf-df59-4ab1-b38c-e39f5d4527c9	Bältagatan	Gata i Arvika	Arvika	59.665846	12.603295	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ec19303f-1dc9-40dc-888e-21002d16f62e	Daléns väg	Gata i Arvika	Arvika	59.66272	12.568493	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cac765bf-f304-4075-a7fc-848837bf9647	Blåbärsbacken	Gata i Arvika	Arvika	59.669039	12.580231	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d5544e0-04c4-4ed8-9c3b-ab428f413d9e	Skogsstjärnegatan	Gata i Arvika	Arvika	59.665938	12.566676	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3a3c50d-776f-4e19-8c5e-e5978cb3210f	Skönviksvägen	Gata i Arvika	Arvika	59.640243	12.610262	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a24b93e8-236f-4c0d-816f-cf4362b01957	Dotteviksvägen	Gata i Arvika	Arvika	59.643865	12.613473	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5341e8ee-bd70-4612-81ca-7d6cd62488d5	Rönnvägen	Gata i Arvika	Arvika	59.669261	12.617085	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
72721b26-f135-4113-b82d-2eead34f306d	Backavägen	Gata i Arvika	Arvika	59.635109	12.610719	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d943be4a-19c9-4af9-8753-a2094572a8b7	Skogsstigen	Gata i Arvika	Arvika	59.663982	12.597645	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74edaf8b-a98c-4a66-8f21-8b877bb6b0cf	Skogsbacken	Gata i Arvika	Arvika	59.651176	12.555405	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4938ef3b-8935-422f-a431-8f89b99436d4	S 873	Gata i Arvika	Arvika	59.693327	12.63125	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
68f60cde-a7ae-4941-ad4c-c50a3a653322	Lillgatan	Gata i Arvika	Arvika	59.658672	12.585868	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48b5fa34-ca61-41cd-8944-58dc5aea6767	St1	Butik i Hagfors	Hagfors	60.042845	13.704444	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
db3eef70-6a3e-48bc-9546-69475cd9cb35	OKQ8 Hagfors	Butik i Hagfors	Hagfors	60.020034	13.692127	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
877c30f8-f785-41d4-aa41-3d03f5424179	PremiX Matcentrum	Butik i Hagfors	Hagfors	60.034355	13.695641	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a84daf66-ac14-4b01-b9d3-b54f3d9aaea4	Coop	Butik i Hagfors	Hagfors	60.035058	13.69593	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e2e4daa-cc10-4793-83ed-4523a4eef311	Lidl	Butik i Hagfors	Hagfors	60.04291	13.698696	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f736ea73-46e8-4dec-b794-54c4d92ff6a0	Pekås	Butik i Hagfors	Hagfors	60.042788	13.705057	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
df373566-f939-45c0-b393-68e08b1b2afc	Hotell Monica	Sevärdhet i Hagfors	Hagfors	60.041776	13.693522	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a260e99-7ecd-43d1-90b7-8119bf6ccff1	Hotell & Café Uvån	Café/restaurang i Hagfors	Hagfors	60.035643	13.697462	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f0cb08e-c911-4b68-a6e1-1903b9d06418	Pizzeria Hagfors	Café/restaurang i Hagfors	Hagfors	60.035309	13.69466	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
69baafef-326d-480a-a9a1-9e95131e848e	Apotek Hjärtat	Offentlig plats i Hagfors	Hagfors	60.034173	13.695876	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
68f10405-b925-4290-a3db-010e3d8b7467	Systembolaget	Butik i Hagfors	Hagfors	60.034649	13.6953	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc5b325c-a775-408c-b9e0-a6b2105b9aae	Coloseum	Café/restaurang i Hagfors	Hagfors	60.030462	13.699931	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2b838a57-9f0b-43ba-874a-97cd235d082d	Pizzeria Milano	Café/restaurang i Hagfors	Hagfors	60.029396	13.702379	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f8a9c6c0-d2ac-4db0-9d42-71c7c4c97d34	Värmullen	Café/restaurang i Hagfors	Hagfors	60.032348	13.699785	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ae719b9-a0a4-4836-92a4-318b20d67f45	Gräsbergs bil	Butik i Hagfors	Hagfors	60.023357	13.692331	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6afc630-7717-4400-a733-4ec48b48ad66	Kaffestugans konditori	Café/restaurang i Hagfors	Hagfors	60.031623	13.700669	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
35240803-e632-432b-872c-224959671e71	Nice Inn	Café/restaurang i Hagfors	Hagfors	60.032525	13.703209	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
94b746c3-5b74-46fb-b613-8b0985c07e6e	Älvstrandshallen	Sport & fritid i Hagfors	Hagfors	60.037225	13.701118	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f70125e8-f9f4-4b99-997d-7d1d31cbec17	Bowlinghall	Sport & fritid i Hagfors	Hagfors	60.036664	13.700934	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
47fceb2a-44b6-4457-9c0f-aca5f2539eb4	Hagfors bibliotek	Offentlig plats i Hagfors	Hagfors	60.036291	13.701347	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b2ed819-be18-446b-9bc4-1f038e24ec5b	Järnvägsmuseum	Sevärdhet i Hagfors	Hagfors	60.022819	13.692144	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f23a341-a6c6-4988-8540-0188ea047dca	Nacks Thaikök	Café/restaurang i Hagfors	Hagfors	60.034462	13.695567	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6fc94cc5-8edc-4c93-ba40-d2b83577736b	Vikingen	Butik i Hagfors	Hagfors	60.044262	13.679508	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd482254-7a05-4238-87df-9b7f3c967259	Helmia	Butik i Hagfors	Hagfors	60.023584	13.691216	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f71a826-bb80-4871-98f6-98b26111ef97	Polisen Hagfors	Offentlig plats i Hagfors	Hagfors	60.030375	13.701226	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a625366-75ce-481a-b785-bf7c1192c7a6	Hagfors stadshus	Offentlig plats i Hagfors	Hagfors	60.031411	13.702085	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d050f4b-4a19-4d74-bf2b-eb72865c7da1	Folktandvården	Offentlig plats i Hagfors	Hagfors	60.03064	13.701544	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0558e2f3-72b7-48f3-814c-813b44f93f29	Hembygdsgård	Sevärdhet i Hagfors	Hagfors	60.025665	13.676961	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
93a9fcc5-5de2-4cb2-870b-aa03aacf30ef	Hagfors vårdcentral	Offentlig plats i Hagfors	Hagfors	60.032978	13.71055	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d6b2ccd-59cd-4bb4-9266-87ce39823e78	Värmullsåsen (currently non-operational)	Sport & fritid i Hagfors	Hagfors	60.03	13.712973	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
992ed696-5555-4fc2-a926-4e8244b9030e	Brukshotellet	Café/restaurang i Hagfors	Hagfors	60.027351	13.693521	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
385e331f-ffa2-4c8b-bad9-affe92179fe8	Monica Zetterlund Museet	Sevärdhet i Hagfors	Hagfors	60.027073	13.693329	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a4b46c8-399d-4429-888d-ed0a851e07dc	Hagfors pappershandel	Butik i Hagfors	Hagfors	60.030858	13.698999	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cbc4f26c-fc6f-44e1-a464-ebef3f46db7b	Zolboo's Sushi & Thai	Café/restaurang i Hagfors	Hagfors	60.030938	13.698546	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d2e572e-c24a-4f35-8838-d5b1fbbe3102	Saras livs	Butik i Hagfors	Hagfors	60.030997	13.6982	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c42d7b3-4157-4607-9c6f-151866c1f5eb	Dollarstore	Butik i Hagfors	Hagfors	60.043822	13.698457	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
93ac3b45-c76c-4dd4-b7af-80f8fc1a4c00	JYSK	Butik i Hagfors	Hagfors	60.043875	13.699004	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
89325bef-d16e-46a7-8a01-c97e17c974ea	Sportbutiken Klarälvdalen	Butik i Hagfors	Hagfors	60.020712	13.697451	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1160d007-645a-4df1-b394-40e78260538f	Carglass	Butik i Hagfors	Hagfors	60.023168	13.692362	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
388a6030-ba02-42ea-8af0-3a9e0d533988	Synoptik	Butik i Hagfors	Hagfors	60.03491	13.6962	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8accb2e4-e145-4c45-9939-46b7c2b9eb5c	Bjarnes	Butik i Hagfors	Hagfors	60.036304	13.706501	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb9f689b-e822-4490-9e7f-de888e6f32f8	Colorama	Butik i Hagfors	Hagfors	60.042173	13.704367	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fce6a65-bb37-4ee4-a831-b89fb3baa2d7	DHL	Offentlig plats i Hagfors	Hagfors	60.0429	13.704247	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e3d97cf-4fbc-47ec-b825-c9e61ac1dd00	Elektrolux	Butik i Hagfors	Hagfors	60.042333	13.705088	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
66563b7f-3524-49e6-9755-9e992c96a5fb	Destinode	Butik i Hagfors	Hagfors	60.030798	13.699517	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a54c4386-2bf4-4a9a-9c0e-941baea4dd25	Myskin & me	Butik i Hagfors	Hagfors	60.031044	13.699052	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
af8e34b7-4026-4a7b-8cc3-92895b8ecc99	Mode Boden	Butik i Hagfors	Hagfors	60.031591	13.698656	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
50fa178a-6c7a-4fd2-8836-518f3df83abc	Molkers Däck	Butik i Hagfors	Hagfors	60.041588	13.704049	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c19e938f-a8c8-49ef-92e8-876a8ba8b4a0	Klaran Tandvård	Offentlig plats i Hagfors	Hagfors	60.031335	13.700878	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c475e797-0c6a-4379-b0e5-5d1093534c0c	Fasaden	Sevärdhet i Hagfors	Hagfors	60.032333	13.702108	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe87936d-51dd-48d9-975b-db8ab0ce7a04	Kronan	Café/restaurang i Hagfors	Hagfors	60.031517	13.69978	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4798596c-107c-4c89-a415-98ba64cd4cc5	Röda Korset	Butik i Hagfors	Hagfors	60.03068	13.700078	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9beff623-be17-425e-bbbb-d8c0a9ef367c	Frendo	Butik i Hagfors	Hagfors	60.042909	13.704428	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
81ab9598-87fa-45ef-99ba-0d0ab8fa43e0	Hagfors kyrka	Kyrka i Hagfors	Hagfors	60.032195	13.696963	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
37a52257-5d49-4871-a73a-9b76e43215e7	Hagforsparken	Café/restaurang i Hagfors	Hagfors	60.043198	13.693402	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d82498c3-0190-4738-97e1-638e2b9c95d4	Blinkenbergsparken	Natur/park i Hagfors	Hagfors	60.037673	13.694567	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
5eeb03c3-0023-45c0-ba92-7d72c5531c13	Asplundshallen	Sport & fritid i Hagfors	Hagfors	60.035787	13.707558	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b653b97e-8222-4b3e-a6ec-193738e47f1d	Hagforsvallen	Sport & fritid i Hagfors	Hagfors	60.039372	13.715846	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
a588f9bb-23d1-4215-a7ba-5df4bf704637	Valhall	Sport & fritid i Hagfors	Hagfors	60.038847	13.716096	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
625733c7-9f7d-4c62-bbea-a85a03ad954f	Skidstadion	Sport & fritid i Hagfors	Hagfors	60.04126	13.714627	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
787da6ea-017d-4116-a008-1e3192407a1b	Forsskolan	Skola i Hagfors	Hagfors	60.033334	13.693927	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
21d51b72-f5ae-4639-91ef-9ab38e709358	Blinkenbergskyrkan	Kyrka i Hagfors	Hagfors	60.038844	13.696199	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
76903e30-7d50-4c21-99e3-343ab9a9d20c	Hagfors kapell	Kyrka i Hagfors	Hagfors	60.039021	13.707252	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f28e202-fc8e-4c06-9639-9b9fbe2fbd67	Sättraskolans gymnastiksal	Sport & fritid i Hagfors	Hagfors	60.041971	13.689852	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
adfef04b-a826-46fe-96b3-23563c5c51cc	Hagfors brandstation	Offentlig plats i Hagfors	Hagfors	60.034261	13.689153	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
025078a4-322e-4722-b978-abe5fca6b582	Älvstrandens bildningscenter	Skola i Hagfors	Hagfors	60.036239	13.700764	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2310bcb5-58df-42e6-9086-ebfb1b482e3c	Uddeholm Arena	Sport & fritid i Hagfors	Hagfors	60.037585	13.701481	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d4cf9c2-1e0d-4c68-80a4-9d8af76655e4	Hagfors Busstationen	Offentlig plats i Hagfors	Hagfors	60.035198	13.694214	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
088bc861-9bf7-47a6-87da-b2b8e293805e	Mana-Örbäcken	Natur/park i Hagfors	Hagfors	60.034168	13.711847	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
5cac1b77-6661-4360-9a7c-4c6820fa27e4	Dalavägen	Gata i Hagfors	Hagfors	60.04224	13.703312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
80bcb9d9-14ae-4b89-88b8-97391f1c685d	Uddeholmsvägen	Gata i Hagfors	Hagfors	60.023651	13.696647	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7753463c-c69a-4cae-80ad-68bb43e2f832	Parkvägen	Gata i Hagfors	Hagfors	60.040655	13.690792	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce565ce5-6d59-4bee-ae2f-bd9bc6dd6cc7	Storgatan	Gata i Hagfors	Hagfors	60.040304	13.690542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
80f9a9b0-48ad-424d-8da5-40150a6e0dc8	Hagälvsvägen	Gata i Hagfors	Hagfors	60.022382	13.681565	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61f78fe1-d338-4f79-8949-234d7942a301	Uvedsvägen	Gata i Hagfors	Hagfors	60.025211	13.694813	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a58dd6c0-a6ec-49e0-bd30-c5ec3c35b2e9	Engkvists väg	Gata i Hagfors	Hagfors	60.033082	13.70184	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f72d5e2-e2ec-43cc-934d-6612beec06f2	Gjutarevägen	Gata i Hagfors	Hagfors	60.03523	13.693682	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c6aa9e3-8619-4070-b84e-e2d15915c7fa	Atterbergsvägen	Gata i Hagfors	Hagfors	60.034895	13.694278	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eded1614-7463-41ce-bd00-e6fee3653067	Karléns väg	Gata i Hagfors	Hagfors	60.041266	13.676285	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
506cef61-8cf7-4c60-a469-a1f0ef4b395c	Stjärnsnäsvägen	Gata i Hagfors	Hagfors	60.043427	13.674455	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7540524d-5748-4534-a5c2-caf471af6c7d	Skålviksvägen	Gata i Hagfors	Hagfors	60.040106	13.681865	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
01cc7a4f-9b3b-4359-8ffa-15054fb79b71	Blåklintsvägen	Gata i Hagfors	Hagfors	60.046245	13.67311	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c9d09b5-375c-41e2-8941-5efd6ccf9fb6	Timotejvägen	Gata i Hagfors	Hagfors	60.042981	13.676048	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd983d3d-07f6-4856-a00d-dd0fe10a7ad3	Törnrosvägen	Gata i Hagfors	Hagfors	60.043269	13.675385	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5fa450e-b20b-4bf5-97f4-5310c856f2b8	Bäckvägen	Gata i Hagfors	Hagfors	60.044229	13.677771	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e3dce6d-a99c-4614-95a3-29d4378e1b20	Värmullsvägen	Gata i Hagfors	Hagfors	60.046725	13.67359	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d1e97c4-27e0-4993-bbab-852882ba1431	Köpmangatan	Gata i Hagfors	Hagfors	60.032351	13.700587	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
551f7b16-019d-4750-817c-128c4fa0af38	Ekendals väg	Gata i Hagfors	Hagfors	60.016522	13.679398	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
581c9c8a-369b-42e8-84ac-127a0bb809c0	Björnängsvägen	Gata i Hagfors	Hagfors	60.029227	13.701739	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee25f92b-0351-44f3-9540-bb8a37cae017	Bäckelidsvägen	Gata i Hagfors	Hagfors	60.02968	13.705074	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
334fedc3-6b38-46d6-bb88-f844680104b6	Sjukhusvägen	Gata i Hagfors	Hagfors	60.032522	13.708594	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
340f9a34-9349-4349-9cf4-f7640d3c9d9c	Bäcketorpsvägen	Gata i Hagfors	Hagfors	60.031104	13.706448	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c877979d-8752-4b13-95af-1729aa3cb4f2	Petter Fridmans väg	Gata i Hagfors	Hagfors	60.036514	13.707107	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9063527c-a71e-436f-b450-479b4d099c90	Geijersholmsvägen	Gata i Hagfors	Hagfors	60.034809	13.700952	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3a5ee8c-5501-41c9-9f42-1e11723a6726	Enlunds väg	Gata i Hagfors	Hagfors	60.034152	13.704639	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9bff6b3-ad19-4020-a42b-59dede25b55f	Lovisebergsvägen	Gata i Hagfors	Hagfors	60.033729	13.702307	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb871757-e18e-4030-8750-6b421eaf406a	Föskeforsvägen	Gata i Hagfors	Hagfors	60.034234	13.702735	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d858e111-3dc9-48f1-8b11-bcd55afc6dce	Tutemovägen	Gata i Hagfors	Hagfors	60.034709	13.703459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb814c98-c437-4c53-a6d2-a7f9fd74153d	Tranebergsvägen	Gata i Hagfors	Hagfors	60.035245	13.703869	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4662005f-ee77-40fb-a2c6-1dd06ca22ddc	Gustafsforsvägen	Gata i Hagfors	Hagfors	60.035781	13.704244	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bbfc58c9-2692-41d1-b500-b995b065ebd6	Monica Zetterlunds väg	Gata i Hagfors	Hagfors	60.036925	13.703729	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
540a3150-1d8f-4a59-a72c-71d3a276d508	Såger-Olles väg	Gata i Hagfors	Hagfors	60.031608	13.697621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
41d0ef29-dce9-4a6e-8612-26f42f5fc600	Kyrkogatan	Gata i Hagfors	Hagfors	60.031681	13.699506	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43182c66-6d22-4a4f-9722-e54520e2f052	Skolgatan	Gata i Hagfors	Hagfors	60.030943	13.69909	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bfb1050f-5b01-41d4-8b14-9030fc38ef55	Nybovägen	Gata i Hagfors	Hagfors	60.021615	13.678534	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3399992d-01d7-4359-8770-30bbeb1bcfc7	Hantverksvägen	Gata i Hagfors	Hagfors	60.024986	13.692141	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
64b4dca5-0286-4087-8def-c5dd403b5cb0	Örbäcksvägen	Gata i Hagfors	Hagfors	60.025631	13.696198	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2560ce82-de4b-4e5b-86fd-f23c3b13ce9e	Järnvägsgränd	Gata i Hagfors	Hagfors	60.028131	13.697779	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ad83da3-08c7-4724-89de-4e4f1dbf8532	Klövervägen	Gata i Hagfors	Hagfors	60.044529	13.673917	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e2924a3-d2b4-4f1c-8774-dead15057d4b	Norrings väg	Gata i Hagfors	Hagfors	60.03569	13.69679	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1faf5ee6-5985-4fd8-8dac-8f800b9f5b3b	Filarevägen	Gata i Hagfors	Hagfors	60.044058	13.690769	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87da1465-cee6-4019-8fb3-24106d902e3f	Smedsvägen	Gata i Hagfors	Hagfors	60.036136	13.696003	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e826f99-5247-4869-a6a8-359a5cad2bec	Getarevägen	Gata i Hagfors	Hagfors	60.039277	13.684251	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3c026af-79b9-4285-a839-fb89dd9a62f4	Rallvägen	Gata i Hagfors	Hagfors	60.034011	13.688327	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c030fd0-90ab-45ac-8d28-bccc94da1d1d	Jan Månsas väg	Gata i Hagfors	Hagfors	60.04075	13.682901	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4944ebaa-2a4c-4908-897b-4ec430692951	Violvägen	Gata i Hagfors	Hagfors	60.043459	13.679036	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f1d84ae-0e93-41d0-8887-502c709926f8	Rysktorpsvägen	Gata i Hagfors	Hagfors	60.035993	13.666523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
31f38a71-71db-4ffa-afd2-55a08c3a004f	Asplings väg	Gata i Hagfors	Hagfors	60.038908	13.682922	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e7b2c3e-ff9e-4cb8-aa0c-0df0cc369ffd	Villavägen	Gata i Hagfors	Hagfors	60.040039	13.681709	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
670dad5b-fb3c-4a4a-b667-d319a33145d5	Vällarevägen	Gata i Hagfors	Hagfors	60.04171	13.684861	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9abb4042-3907-49a8-bcc9-d2c2320b38fa	Klättervägen	Gata i Hagfors	Hagfors	60.042918	13.683755	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d63be2bb-1f65-4abb-90af-5708e552375d	Lillstugevägen	Gata i Hagfors	Hagfors	60.041334	13.687895	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b99622a-b98d-4330-a9d1-138127775b70	Rostbrännarevägen	Gata i Hagfors	Hagfors	60.0404	13.687839	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
97dc63cc-74d9-4702-b246-fabdabe9c119	Blinkenbergsvägen	Gata i Hagfors	Hagfors	60.036074	13.690926	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1e0038a-466c-44a2-984d-d54c982b00de	Hagforsvägen	Gata i Hagfors	Hagfors	60.03927	13.695929	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c5d3cbf-b5ed-49ed-beeb-87d7c5d2cde6	Sättravägen	Gata i Hagfors	Hagfors	60.037194	13.687898	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c8c8089-785f-4496-8f0a-38da816df081	Milfallsvägen	Gata i Hagfors	Hagfors	60.042611	13.690234	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43669c37-0e04-4a42-88c5-8cc764e4734f	Postgränd	Gata i Hagfors	Hagfors	60.03128	13.700574	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87300b86-9c9d-4e27-b121-7a685ae123a1	Troiligatan	Gata i Hagfors	Hagfors	60.030338	13.698372	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba9907f9-6c45-40a9-8ab1-01ed6cc8d3d1	Nordvalls väg	Gata i Hagfors	Hagfors	60.029842	13.697995	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc0b6a8c-cbe3-4c0d-aa73-43d4adf11a1a	Lokmannavägen	Gata i Hagfors	Hagfors	60.024602	13.689435	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ad8bddc-c160-402f-9a9a-8d5848be21b7	Görsjövägen	Gata i Hagfors	Hagfors	60.04054	13.712959	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5647356-9ce7-49d8-b1d1-5926d793cc35	Abborrtorpsvägen	Gata i Hagfors	Hagfors	60.047293	13.695189	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5aec30d3-f9e9-4dc0-8649-072614cd3c7c	Harboevägen	Gata i Hagfors	Hagfors	60.031463	13.69845	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef69ceeb-308b-4584-a33a-e4e42eaeaec5	Sommarvägen	Gata i Hagfors	Hagfors	60.045433	13.687698	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e6a2167-f19b-4d4f-88dc-676d7b821e28	Bybergsvägen	Gata i Hagfors	Hagfors	60.044091	13.687353	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca38968a-0373-4c58-bd8a-6451b936e14e	Vintervägen	Gata i Hagfors	Hagfors	60.045801	13.69028	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
17951288-1b07-4907-bfdb-f6bd4793162d	Folkets väg	Gata i Hagfors	Hagfors	60.042357	13.693672	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c77699b-2f88-4929-9279-ead74476ec8f	Rullstensvägen	Gata i Hagfors	Hagfors	60.043889	13.687981	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99e5d1bd-1afe-456d-975c-ebaa0524a01a	Bergsstigen	Gata i Hagfors	Hagfors	60.04477	13.684971	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f5d305ac-75fa-440b-9d07-e19bd6ff6b4d	Granitvägen	Gata i Hagfors	Hagfors	60.043584	13.686114	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6bfee9c-ae57-465c-a869-2ddb54119bdc	Lyckostigen	Gata i Hagfors	Hagfors	60.044584	13.682782	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9930fb8b-27cb-4fbd-9025-ac20548015bf	Källvägen	Gata i Hagfors	Hagfors	60.046253	13.685379	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f99663dd-d161-4625-b9e3-56733d46dd44	Sjövägen	Gata i Hagfors	Hagfors	60.045961	13.667523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a5d9f4d6-5aa6-48bb-aff2-bdbe031c5b40	Nils Johans väg	Gata i Hagfors	Hagfors	60.047708	13.669258	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea0a00e6-095e-4eaf-9552-07670a4e0f7d	Havrevägen	Gata i Hagfors	Hagfors	60.048839	13.667331	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e06f1356-da63-488a-8e36-d0bdccba89a3	Kornvägen	Gata i Hagfors	Hagfors	60.048691	13.669266	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0dec98fd-1531-4fda-8853-15dd2ec7fafb	Rågvägen	Gata i Hagfors	Hagfors	60.048035	13.670783	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
455d04cb-d33e-42ff-9269-b709fac9216f	Vetevägen	Gata i Hagfors	Hagfors	60.047211	13.671875	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
860c37f2-f19f-4536-8c0a-39e1b033be75	Timmervägen	Gata i Hagfors	Hagfors	60.047786	13.667714	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
435e9684-5c5e-4c06-b4d7-fe548e7d49ec	Såningsvägen	Gata i Hagfors	Hagfors	60.046388	13.669685	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb85732f-aa6b-4029-8067-9a97b3aa9207	Slåttervägen	Gata i Hagfors	Hagfors	60.047046	13.669329	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac22e6f2-e78b-4e5e-afdb-089f0c5e293c	Åkervägen	Gata i Hagfors	Hagfors	60.045319	13.669151	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dcc56843-c724-47e6-bfa4-1ebf14db6e1e	Älvstrandsvägen	Gata i Hagfors	Hagfors	60.038895	13.70266	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3527692-4867-4b12-9fd0-fbcb1f91b600	Kyrkogårdsvägen	Gata i Hagfors	Hagfors	60.040059	13.705523	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
465f21bc-e35f-4dd2-98e1-ceee52664d7d	Bryggarevägen	Gata i Hagfors	Hagfors	60.044697	13.711524	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a0ad1fd-0ab7-461f-a9c4-efc7cce7dea9	Sundsfallsvägen	Gata i Hagfors	Hagfors	60.050607	13.684582	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
542830ea-b180-46f0-951d-8390c68d05d6	Ängfallhedsvägen	Gata i Hagfors	Hagfors	60.046983	13.704718	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b35b87f5-699c-497e-b731-22a1f71f6bce	Kvarnströms väg	Gata i Hagfors	Hagfors	60.044736	13.706727	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
39c982d9-1bda-434a-bbd9-ef4ab320c2e0	Nävervägen	Gata i Hagfors	Hagfors	60.047021	13.706066	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8250ca21-c8c1-4a0d-a344-76ad5bc5144d	Lastarevägen	Gata i Hagfors	Hagfors	60.048889	13.70778	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
864e4071-faf0-434d-a4a7-3d9b59631065	Bengtssons väg	Gata i Hagfors	Hagfors	60.049461	13.709809	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb438840-221e-4a2a-b7a4-08e3a3bf9458	Hermelinvägen	Gata i Hagfors	Hagfors	60.048855	13.709	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f075817e-b1dd-44b4-8d47-42cac531a66b	Bastvägen	Gata i Hagfors	Hagfors	60.047244	13.708267	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d871b28a-ad35-4abf-9f91-c74e57943bb0	Vinbärsvägen	Gata i Hagfors	Hagfors	60.048957	13.681485	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4986fed3-ab4f-4a1f-8b7d-a847a0d7b67e	Krusbärsvägen	Gata i Hagfors	Hagfors	60.047493	13.684342	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4ecb8c5-38e2-4330-b72e-ff4d2f7e8fb6	Enbärsvägen	Gata i Hagfors	Hagfors	60.047402	13.681796	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
68130031-4f60-41ed-8c66-33ae952d5a53	Hjortronvägen	Gata i Hagfors	Hagfors	60.047797	13.681537	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8fef61a-6949-4695-b803-2a76c6c47e80	Tallhultsvägen	Gata i Hagfors	Hagfors	60.053482	13.706582	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1fc0609-4b28-420d-9825-4a7a86d87cb7	Björklundsvägen	Gata i Hagfors	Hagfors	60.052315	13.706772	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca754303-4e5f-4d34-9df9-2a5cffbadae8	Bomans väg	Gata i Hagfors	Hagfors	60.053408	13.708209	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d453d0bc-c332-4a15-a09e-506455e82311	Hästbergsvägen	Gata i Hagfors	Hagfors	60.05214	13.70885	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f906071-34d5-4d33-9d91-27479f0ea710	Tjärnevägen	Gata i Hagfors	Hagfors	60.026825	13.673574	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
69af8c56-dc23-4d3e-9037-61dca86a4fbe	Källsåsvägen	Gata i Hagfors	Hagfors	60.025448	13.674319	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3fa2c5f-39b4-4360-8b30-bf8ae2025730	Olaus väg	Gata i Hagfors	Hagfors	60.024983	13.67242	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2dda7212-0771-4668-b966-e2f3c055be91	Krokvägen	Gata i Hagfors	Hagfors	60.0247	13.678325	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8945f296-f510-4d0a-8d7e-8eb8cd2c6f23	Bofinkvägen	Gata i Hagfors	Hagfors	60.019658	13.678344	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
32b7c421-d3a4-4d4b-bdc1-29161693bbc5	Annickevägen	Gata i Hagfors	Hagfors	60.018683	13.680873	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
909eafa1-716b-4ce7-b758-f9934d5b4345	Anders Ersas väg	Gata i Hagfors	Hagfors	60.021396	13.681325	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9aca77ea-a011-4b39-ae2b-bd0208c108f9	Blåmesvägen	Gata i Hagfors	Hagfors	60.014538	13.676475	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
954f10a7-64b8-4f52-85c3-b40805c8fd3a	Hackspettsvägen	Gata i Hagfors	Hagfors	60.014428	13.675824	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a26a3f15-a2ed-4f8f-80fb-3f438872fa99	Orrspelsvägen	Gata i Hagfors	Hagfors	60.01689	13.679252	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d497347-dfee-4534-88bf-029dd7730de9	Gökvägen	Gata i Hagfors	Hagfors	60.017255	13.679627	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a1b9a35d-7c10-46c0-8156-e1ba803dfa82	Starevägen	Gata i Hagfors	Hagfors	60.019184	13.682301	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
090879a8-6ac8-41af-a791-10b3df8ba1cc	Sparvvägen	Gata i Hagfors	Hagfors	60.019898	13.68178	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab2e4046-820b-4ced-865b-689e8e09ed5f	Jonas Jonssons väg	Gata i Hagfors	Hagfors	60.018329	13.678931	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4834c1f-e52b-428e-8f0a-4c4d03845cf3	Hammarvägen	Gata i Hagfors	Hagfors	60.013114	13.671603	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
914b9ecd-6a6d-471b-bbd1-910907bccf4f	Hoggstervägen	Gata i Hagfors	Hagfors	60.013623	13.679384	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a30ce69d-d5e3-4c0a-80df-0e1d6d330b48	Lärarvägen	Gata i Hagfors	Hagfors	60.037538	13.705795	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
05f19213-1825-49d1-ae6d-30943b8f309a	Blomvägen	Gata i Hagfors	Hagfors	60.020112	13.69244	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ec35eae6-92a8-43a4-b509-f4d335f240a8	Pallins väg	Gata i Hagfors	Hagfors	60.026345	13.693476	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b37a6f98-4937-46f0-ae03-f1124a152926	Ullenvägen	Gata i Hagfors	Hagfors	60.022273	13.698382	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
843516e6-a870-42e3-930b-fdbda03cae8d	Granstigen	Gata i Hagfors	Hagfors	60.021161	13.697378	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
83729ebe-b39c-47f7-8dd4-50b00e4ffb0d	Enstigen	Gata i Hagfors	Hagfors	60.022318	13.698753	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
66c93eea-83f3-456d-aa6c-d1454df596fc	Tallstigen	Gata i Hagfors	Hagfors	60.023093	13.700515	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
749482a2-a812-48a2-940b-fe927891ebf6	Aspvägen	Gata i Hagfors	Hagfors	60.023221	13.700264	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffb7dea2-a10c-406a-82b1-9c4ee80fdec7	Alstigen	Gata i Hagfors	Hagfors	60.025314	13.702471	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
966ba199-c7d4-44f6-94dc-eeeccbaa886c	Lindvägen	Gata i Hagfors	Hagfors	60.026147	13.701393	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d84be305-7cd0-43d1-9b4d-5a33c32cf467	Björklidsvägen	Gata i Hagfors	Hagfors	60.023806	13.700469	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
979bf542-7432-4207-9b0d-c151b5649e91	Järnvägsgatan	Gata i Hagfors	Hagfors	60.027695	13.697277	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1710156-5b6b-46fd-adad-e92a86ce13d6	Gångtorpsvägen	Gata i Hagfors	Hagfors	60.021854	13.69486	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6948c3e9-9b30-419a-9415-126701bd4cde	Hagfors torg	Gata i Hagfors	Hagfors	60.034577	13.696334	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
94be5494-e108-46a2-bbb1-88168102a935	Värmullsåsen	Gata i Hagfors	Hagfors	60.012764	13.728619	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
71ee3a02-d421-47df-9fca-fc86d02f289a	Smultronvägen	Gata i Hagfors	Hagfors	60.046979	13.681219	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
41e9c742-d968-4832-85ba-823266f5e6d9	Slalomvägen	Gata i Hagfors	Hagfors	60.034822	13.717847	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1721ce1-577d-4650-83d2-cc881573b57a	Hedvägen	Gata i Hagfors	Hagfors	60.012683	13.674611	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
75ff3521-f5ab-459c-a228-1538c8631edc	Ljungvalls väg	Gata i Hagfors	Hagfors	60.035814	13.68665	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe652344-65cd-4e5a-a596-c3075abf6cb9	Lars Dalgrens väg	Gata i Hagfors	Hagfors	60.042202	13.684068	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc05fef4-6c89-4133-873d-2a7399eab4d5	Forshaga vårdcentral	Offentlig plats i Forshaga	Forshaga	59.528023	13.484544	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1752da6-f632-4080-817c-5a7fd33d0c0b	Polisen Forshaga	Offentlig plats i Forshaga	Forshaga	59.530714	13.479803	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dff89b82-b188-43f0-ae9d-3fcace645f3f	Dyvelstens Flottningsmuseum	Sevärdhet i Forshaga	Forshaga	59.518267	13.446167	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
76f29f1d-54f2-421d-a4ce-891ab09409c9	Forshaga bibliotek	Offentlig plats i Forshaga	Forshaga	59.529145	13.480266	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd7d9a05-a645-43b8-90a6-e6b6f5f56d77	Folktandvården Forshaga	Offentlig plats i Forshaga	Forshaga	59.528132	13.485503	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5318e1bd-0060-4bdb-a06c-4beddbae609a	Solbergamonumentet	Historisk plats i Forshaga	Forshaga	59.516276	13.499728	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe52ef74-0542-401e-9e6e-59f5860eb768	Minnessten	Historisk plats i Forshaga	Forshaga	59.517021	13.499306	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f64bcfb-0835-4397-8f7a-3b848b15f140	St1	Butik i Forshaga	Forshaga	59.537948	13.482867	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4094945-17c7-4aeb-ac78-065791d15ae5	OKQ8	Butik i Forshaga	Forshaga	59.526948	13.473009	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4dd540f5-eca9-4d4d-9c2b-fd800d0d3e83	Forshagaakademin	Skola i Forshaga	Forshaga	59.529319	13.494121	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c5e3bbbc-6246-4c0d-842b-35b0fed73ea1	Farmors place	Café/restaurang i Forshaga	Forshaga	59.531715	13.486888	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
afdc29cd-eee8-49d4-8019-fea4da70e7c6	Värmlandspizza	Café/restaurang i Forshaga	Forshaga	59.531808	13.485799	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
96d44f53-bf66-4016-b7c0-e7ae60655fd0	Restaurang Soya	Café/restaurang i Forshaga	Forshaga	59.533648	13.481168	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
db3ca15c-15da-49c1-8063-36c52bfc606c	Saras godisbutik	Butik i Forshaga	Forshaga	59.532187	13.480254	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
95612a1b-8c83-4b87-b520-21adeba5bc8c	Apotek	Offentlig plats i Forshaga	Forshaga	59.532295	13.480371	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2c7ea1b-5308-4b64-8874-2e3c3e2aa973	Roots kläder	Butik i Forshaga	Forshaga	59.532033	13.480088	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e1436ad-bf19-4061-976f-fa675fe9857d	Spelbutik	Butik i Forshaga	Forshaga	59.532363	13.480821	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c18d6f31-1cf0-4ed6-8e51-286adfc1665a	Draken	Sevärdhet i Forshaga	Forshaga	59.527998	13.480281	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
1de743ed-53d7-4b1b-8cab-1853928b2fbb	Colorama	Butik i Forshaga	Forshaga	59.53174	13.479132	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2941ddff-255d-4364-ab64-6da22a4b49fb	Lundhags Hund- och Katt	Butik i Forshaga	Forshaga	59.531831	13.479222	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e935dcf7-5126-4b77-b55d-4295a178016e	Cvea Media	Butik i Forshaga	Forshaga	59.531511	13.479448	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2902406-1d76-4c81-9e09-6e0c2356c232	Salong Soraya	Butik i Forshaga	Forshaga	59.53158	13.479517	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
78f136ae-8940-4b59-8537-0a79bd07f835	Salong Josef	Butik i Forshaga	Forshaga	59.53149	13.478988	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d30565ce-1173-42c8-813e-8333463f7207	Bam Tattoo	Butik i Forshaga	Forshaga	59.531439	13.478932	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7eb5ac81-ef47-48ac-94b5-c0b899e51c16	BJ's Urlur	Butik i Forshaga	Forshaga	59.531073	13.478549	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
60dcb628-83d1-426c-bc4f-7dfb097e7935	Ingelas Dam- och Herrsalong	Butik i Forshaga	Forshaga	59.530541	13.47784	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6e8f924-3c2c-4d86-9008-1c902eeb0e59	Studio Bläck	Butik i Forshaga	Forshaga	59.530471	13.477737	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d48f36f-23ce-4383-885a-2401af1715fe	Forshaga begravningsbyrå	Butik i Forshaga	Forshaga	59.534906	13.482046	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
019ac75b-44f8-4800-be7e-81194d719f05	Pingstkyrkans Second hand	Butik i Forshaga	Forshaga	59.535603	13.483031	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
63cb1f39-5ee5-4520-933a-d5124eeaf551	Carl-Erics Sportcenter	Butik i Forshaga	Forshaga	59.535465	13.483985	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
00b933a5-19b1-4592-be92-40f1b413ddaa	Forshaga Car Care	Butik i Forshaga	Forshaga	59.537024	13.482414	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
34d5190f-88ea-4a88-babf-1addc44c991e	Skolmuseet	Sevärdhet i Forshaga	Forshaga	59.516375	13.500492	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
d23d106a-5af7-4d9a-98e9-3ce62fbf8b62	Handelsbodsmuseet	Sevärdhet i Forshaga	Forshaga	59.516522	13.499646	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
76b5c112-57cd-47c9-a414-f8aee1ea07d3	Stenåldersbåten	Sevärdhet i Forshaga	Forshaga	59.516416	13.500723	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
4faed284-289d-4657-9525-119d5f6dc989	NKlJ Järnvägar	Historisk plats i Forshaga	Forshaga	59.530117	13.480331	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e11c870-b099-46d1-aefd-a8d06c5acb6e	Postombud	Offentlig plats i Forshaga	Forshaga	59.5324	13.480695	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
209a31af-5652-4924-9c68-20066139da6b	Dallas pizzeria och pub	Café/restaurang i Forshaga	Forshaga	59.530473	13.479259	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f3dbaedc-267a-4d7a-bc8c-c9a71e1101f8	Forshaga skid- och pulkabacke	Sport & fritid i Forshaga	Forshaga	59.535199	13.473393	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c2fb67c-834b-4260-a8e7-91b4860d2e11	Forshaga Yrkeshögskola	Skola i Forshaga	Forshaga	59.528864	13.480662	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0f736f4-4098-4e36-bbe8-de9d8d25bc40	Forshaga Vuxenutbildning	Skola i Forshaga	Forshaga	59.528958	13.480455	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
19303d57-5153-46c4-b362-9d2dc49048fe	Forshaga Lärcenter	Skola i Forshaga	Forshaga	59.528861	13.480348	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4184773-1bb1-40fd-8eba-1e10dfc76399	Sjövikens antik	Butik i Forshaga	Forshaga	59.52758	13.489669	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0032b069-a170-4e89-ada9-490b2ff1d8d3	Coop	Butik i Forshaga	Forshaga	59.531719	13.480162	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d82305e-03f8-4ad9-a05a-f8bd319c59eb	Bilskadeteknik i Värmland AB	Butik i Forshaga	Forshaga	59.536984	13.483332	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d24a6ed-1738-4afe-bd08-3545ed97b206	Skivedsskolan	Skola i Forshaga	Forshaga	59.520906	13.486174	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2fd104c-b206-4e4d-bc3f-e6510ab452b5	Forshaga kyrka	Kyrka i Forshaga	Forshaga	59.526091	13.482342	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c5a24aa-f22d-4045-afff-2c5a92360136	Sisu-gården	Sport & fritid i Forshaga	Forshaga	59.539475	13.460325	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b314978-4740-4999-96df-3d893dac4028	Ängevi ishall	Sport & fritid i Forshaga	Forshaga	59.525864	13.471883	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f5f8595-3358-4df6-bfe4-6bc026df7877	Ängevi idrottsplats	Sport & fritid i Forshaga	Forshaga	59.525305	13.471845	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
60f9d646-fe02-4f0a-ab36-045b4f0ae8d4	Slottsparken	Natur/park i Forshaga	Forshaga	59.527624	13.490019	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
56f39d66-18c0-40b5-b947-0dc108e3fbcc	Coop Konsum Forshaga	Butik i Forshaga	Forshaga	59.531727	13.480091	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1fdbc35b-5722-4ce8-8ecd-928f532ece7f	Coop Skived	Butik i Forshaga	Forshaga	59.520995	13.482573	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
265d97b6-8519-4084-9379-ae737a7d592f	Forshaga Hembygdförening	Sevärdhet i Forshaga	Forshaga	59.516551	13.499981	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
6a944ae1-2363-4bc1-8a55-0e896906b346	Gammelstugan	Sevärdhet i Forshaga	Forshaga	59.517084	13.499318	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2c9a459-f5c3-4b7e-9193-c4d6ca8434cd	Loftboden	Sevärdhet i Forshaga	Forshaga	59.516897	13.499199	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5fe0f1a-a2c9-41e0-ab19-90346ddc5396	Grossbolsmagasinet	Sevärdhet i Forshaga	Forshaga	59.516732	13.499225	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf21e07b-6d13-40f0-b04e-a21a03469fc4	Myrastugan	Sevärdhet i Forshaga	Forshaga	59.516589	13.499391	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
416aa4b4-7870-437e-9366-d03f51aba8f4	Klarälvsrummet	Sevärdhet i Forshaga	Forshaga	59.526495	13.49259	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
2646d625-a643-42fe-9f8e-5a7944be42bd	ICA Supermarket Forshaga	Butik i Forshaga	Forshaga	59.532447	13.480883	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4eba5b21-d095-4d30-80e4-d4fa0100cc64	Equmeniakyrkan	Kyrka i Forshaga	Forshaga	59.532843	13.481101	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
f695db9e-e061-498f-b291-19fdbfe8b97f	Systembolaget	Butik i Forshaga	Forshaga	59.530367	13.480452	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7170cf6-bb30-49c4-91da-dee1bc3e5168	Pingstkyrkan	Kyrka i Forshaga	Forshaga	59.535111	13.477086	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
024cb24e-65a2-4c0d-acc2-20da3b80fc1d	Grossbolshallen	Sport & fritid i Forshaga	Forshaga	59.536448	13.47889	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
a426b969-bc7b-43eb-92da-8f015dbb7e0e	Grossbolsskolan	Skola i Forshaga	Forshaga	59.537235	13.479334	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
48771992-ad99-4697-8bf9-707c32f0641c	Forshaga Folkets Park	Natur/park i Forshaga	Forshaga	59.526461	13.468592	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e869fc0-5ad7-4339-a532-5b9a450ba0ef	Scenen	Sevärdhet i Forshaga	Forshaga	59.526718	13.468393	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
aae26268-3f92-4cf9-8a3a-037d54de19f4	Lintjärnsparken	Natur/park i Forshaga	Forshaga	59.52758	13.48534	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4171aa59-5df8-47e0-9483-4d5434b4427a	Berghagsparken	Natur/park i Forshaga	Forshaga	59.530567	13.491847	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
daa0596b-0cb6-40b8-9830-0d2fb1a6ef51	Petruskiosken	Café/restaurang i Forshaga	Forshaga	59.528029	13.475005	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b1d30ea3-5d26-4f0a-8398-07514a3d9b83	Forshaga Folkets Hus	Offentlig plats i Forshaga	Forshaga	59.533724	13.482706	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dc5e4c3f-d6a9-4429-9164-6d6e6e3efc48	Kommunhuset	Offentlig plats i Forshaga	Forshaga	59.53421	13.482329	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ffaa2a00-e0bc-44f9-9c2c-c24d22307961	Bergsgården vandrarhem & ridanläggning	Sevärdhet i Forshaga	Forshaga	59.51739	13.454497	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
1879c0bc-cf2b-4115-8861-c9e636dc4e37	Sound Connection	Butik i Forshaga	Forshaga	59.531495	13.487917	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e14b8abf-4cc4-434f-8b86-a0e93e47995a	Forshaga sporthall	Sport & fritid i Forshaga	Forshaga	59.528457	13.481621	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f697403-973f-4b5d-a09f-39d227e0f54f	Håkans bilar	Butik i Forshaga	Forshaga	59.537438	13.483372	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7915824a-1da6-4256-8c17-200646cd5456	Däckmäster Forshaga	Butik i Forshaga	Forshaga	59.537533	13.486061	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0eec9de8-03ec-42df-baef-2b8c880a2036	Forshaga brandstation	Offentlig plats i Forshaga	Forshaga	59.537926	13.484011	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d1eae01-881e-4ef8-b0b5-5b6f2882f4a4	Lilla scenen Lintjärnsparken	Sevärdhet i Forshaga	Forshaga	59.527615	13.483644	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
2aa3d579-c75c-47cf-b945-7af8b0695ec7	Grafittivägg	Sevärdhet i Forshaga	Forshaga	59.528284	13.481974	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
a1c70e75-ad45-4abd-a988-3e807545c119	Neighbors	Sevärdhet i Forshaga	Forshaga	59.528172	13.481562	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
98514b92-450c-4531-9361-ce3ecf012b2a	Karlstadsgatan	Gata i Forshaga	Forshaga	59.52034	13.479886	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2d57f42-2853-4bb3-ad4e-01b7d7cee00c	Ringgatan	Gata i Forshaga	Forshaga	59.523246	13.488169	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
badc2198-b56f-4bf0-bbc7-a2b172f298a8	Nybacksgatan	Gata i Forshaga	Forshaga	59.522951	13.489085	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7c7b5809-7f5a-4f02-8f26-9cc7a01ac000	Ängbacksgatan	Gata i Forshaga	Forshaga	59.522504	13.489954	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d4be6e7-4453-40c3-823e-db9f774b0a2c	Lövgatan	Gata i Forshaga	Forshaga	59.521803	13.484697	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
90ce576e-9096-4978-bda2-d511622d69b7	Rudskogsvägen	Gata i Forshaga	Forshaga	59.513675	13.481625	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8f214ece-5d4d-438c-94bd-829bb51c0ab2	Laxgatan	Gata i Forshaga	Forshaga	59.519909	13.46769	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
adcee9a1-82e7-4d8c-bc3e-05ed99892ec7	Forellgatan	Gata i Forshaga	Forshaga	59.520658	13.472954	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
657594a9-ced3-48a8-ae95-761f55821ece	Skivetorpsgatan	Gata i Forshaga	Forshaga	59.521706	13.472596	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5a1ccc10-444e-460b-b364-c627124faede	Virvelgatan	Gata i Forshaga	Forshaga	59.521387	13.457969	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0936c1fe-90ea-4532-acb0-9798f93d941f	Forsgatan	Gata i Forshaga	Forshaga	59.522592	13.461075	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f23e5f88-884e-4df5-85c2-9a1687e8035c	Bävergatan	Gata i Forshaga	Forshaga	59.522038	13.46374	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61b23f89-9cf2-4e13-8b25-5f22d43528e5	Strömgatan	Gata i Forshaga	Forshaga	59.522385	13.466125	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4f48aeb-390c-408c-beb5-14b5b563235d	Storgatan	Gata i Forshaga	Forshaga	59.528483	13.475299	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b17e38a7-4db4-4200-89b8-4b8fb2345e2f	Bergstigen	Gata i Forshaga	Forshaga	59.531005	13.476611	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
18f243b6-9269-4c28-bc75-f80c66394bcf	Järnvägsgatan	Gata i Forshaga	Forshaga	59.530389	13.479777	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9314dd99-f51b-419c-9c5c-49d312cd18af	Skivedsleden	Gata i Forshaga	Forshaga	59.523879	13.483324	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0390a4a7-ce9f-4d26-8469-bc6dadbbc6b7	Industrileden	Gata i Forshaga	Forshaga	59.528923	13.495266	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7a318f9-ae27-40f0-b9fc-383dde95347e	Grossbolstorpsvägen	Gata i Forshaga	Forshaga	59.540007	13.480291	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4fed7c83-8fba-43ff-8543-2933f5606425	Grossbolsgatan	Gata i Forshaga	Forshaga	59.538034	13.475581	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8cae6e71-ccf7-4406-ba1c-93b4ea21cc22	Slättvägen	Gata i Forshaga	Forshaga	59.536082	13.473806	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9ff77ad-35a6-45d5-ad3e-06f95f977096	Fältgatan	Gata i Forshaga	Forshaga	59.537403	13.478439	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1da00dc5-7e6a-44cf-89b5-53e5a452c909	Lingonstigen	Gata i Forshaga	Forshaga	59.540643	13.478116	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
14177c1e-c4bd-4e5d-a2f5-3446828cc6c5	Stackvägen	Gata i Forshaga	Forshaga	59.543845	13.479373	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aecda351-6fc4-4e22-80b1-da1c3e5c91f1	Blåbärsstigen	Gata i Forshaga	Forshaga	59.542655	13.478635	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c490fad0-0ea1-4d8a-be69-f3b1584c95d0	Klockstigen	Gata i Forshaga	Forshaga	59.543399	13.475575	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
96b4e295-2e7a-46ab-b6b7-1040fc8852fe	Slingerstigen	Gata i Forshaga	Forshaga	59.541822	13.475059	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f39e1c80-5f17-45f4-b42c-fcd75e2b0ca0	Smultronstigen	Gata i Forshaga	Forshaga	59.540903	13.479359	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4c3030d-d3e5-4101-a767-497e2f1ff7d2	Norrliden	Gata i Forshaga	Forshaga	59.541491	13.482035	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d3e714d-abc3-4893-879f-0e6e4779ac44	Hagagatan	Gata i Forshaga	Forshaga	59.540811	13.481735	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e8ccc49-ecfc-4310-ac50-a432b1fa9eb0	Solbergsvägen	Gata i Forshaga	Forshaga	59.545164	13.482262	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
181c693f-48de-4be7-9405-1a158381b167	Trädgårdsgatan	Gata i Forshaga	Forshaga	59.533878	13.475137	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6af48588-f282-4845-bcb9-bb2f748d975c	Thoreliusgatan	Gata i Forshaga	Forshaga	59.533321	13.479942	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
394630fe-67cd-4b51-a770-0968807aa966	Larmgatan	Gata i Forshaga	Forshaga	59.533888	13.479589	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0d5bc99-2359-4780-8ade-019d283f981e	Björkstigen	Gata i Forshaga	Forshaga	59.5324	13.476758	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
25910fd1-8af8-4f72-8dae-2aa609e7db65	Skogsstigen	Gata i Forshaga	Forshaga	59.531775	13.477427	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b6e2004-ea05-4e42-ba0a-d575c1ccb174	Norra Ravingatan	Gata i Forshaga	Forshaga	59.530507	13.477197	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
33c5d160-0b27-4e90-800d-91ee567384ae	Skyttestigen	Gata i Forshaga	Forshaga	59.529398	13.474248	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fab28e1b-53d6-4dd8-ab0d-4f2a81182a08	Södra Ravingatan	Gata i Forshaga	Forshaga	59.528805	13.47355	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
679caedd-1e1f-49f5-974f-4a71cd3024fd	Furustigen	Gata i Forshaga	Forshaga	59.528008	13.472826	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f6d2648-6634-4d16-92fe-804d28f3f7d2	Kvarngatan	Gata i Forshaga	Forshaga	59.526877	13.476258	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf5d36ff-3bd2-43ea-963d-aa4f4d3725c4	Rygatan	Gata i Forshaga	Forshaga	59.525463	13.476294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46fdb33b-8728-4d6b-8786-1f4659e260c2	Bäckgatan	Gata i Forshaga	Forshaga	59.524599	13.476815	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
34fa8b55-6df8-4df4-ad44-9590d78b15c8	Lisasandsgatan	Gata i Forshaga	Forshaga	59.523923	13.477096	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea1e5563-9f97-4434-ab41-82ab9e878447	Kyrkogatan	Gata i Forshaga	Forshaga	59.525296	13.479703	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d027bca9-bb56-4c01-a079-99b82901aa06	Skivstagatan	Gata i Forshaga	Forshaga	59.525569	13.477386	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42b27066-43c3-4f28-b6aa-3de3dc4d487c	Nygatan	Gata i Forshaga	Forshaga	59.528713	13.477231	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b21c8ea-1d95-4a21-a87f-9d4d733deea7	Köpmannagatan	Gata i Forshaga	Forshaga	59.529392	13.477956	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
03b0ef8e-0a49-4da2-8b87-6846a57d266d	Djäknegatan	Gata i Forshaga	Forshaga	59.53076	13.481594	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
81ade901-48fa-4f73-91a6-14beaf2c4cd0	Bruksgatan	Gata i Forshaga	Forshaga	59.530113	13.493685	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d90b8c34-d302-432d-9da8-ec007c32c391	Slottsvägen	Gata i Forshaga	Forshaga	59.528371	13.490934	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
67947254-63fe-4030-8b45-dfbcf1410ece	Västra Allén	Gata i Forshaga	Forshaga	59.529402	13.489907	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a2d4364-d0fb-4580-8773-1baa584eee18	Kråkåsgatan	Gata i Forshaga	Forshaga	59.52986	13.48773	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f127a864-01af-477a-9cf2-17583e263403	Södra Parkgatan	Gata i Forshaga	Forshaga	59.53038	13.484536	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af57f495-e0fe-4534-bf7f-c97d7e7af025	Södra Lundgatan	Gata i Forshaga	Forshaga	59.530895	13.482811	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
23c3296e-c9ab-48d7-864a-eb9422b4c7a0	Armégatan	Gata i Forshaga	Forshaga	59.530945	13.485954	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf738a33-8473-4636-9e60-7096cbca27a9	Europavägen	Gata i Forshaga	Forshaga	59.530155	13.489228	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac764b35-4039-4b5e-8f4e-ca4132912d69	Vinkelgatan	Gata i Forshaga	Forshaga	59.536162	13.484065	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9781aa4-61c6-4708-9b20-dd3f3aef197e	Smedjegatan	Gata i Forshaga	Forshaga	59.537524	13.485068	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
39bd1713-41d8-460f-ac79-3e699b2f77fe	Tryckerigatan	Gata i Forshaga	Forshaga	59.536881	13.483751	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
804672a1-f75d-4737-ba9b-048062cc7f11	Skolgatan	Gata i Forshaga	Forshaga	59.53203	13.490392	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
20e7c4aa-fb8c-4f17-9a95-23d486ed73e1	Åsmyrsbrinken	Gata i Forshaga	Forshaga	59.533661	13.488263	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46c10c33-9dd9-4d61-a36e-b9220efd5de9	Norra Parkgatan	Gata i Forshaga	Forshaga	59.533054	13.490406	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
906c7dfc-ef0a-4e02-a417-77cd8710a0d4	Floragatan	Gata i Forshaga	Forshaga	59.533062	13.485117	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7f02541-785b-4865-9668-eb7e183a7d37	Varvsgatan	Gata i Forshaga	Forshaga	59.52893	13.492955	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e5676f9-ca3a-4373-ad59-37a01ecbd39d	Östra Allén	Gata i Forshaga	Forshaga	59.528464	13.491613	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9623987-243b-49e1-8f2e-257628da8b3f	Flisgatan	Gata i Forshaga	Forshaga	59.531333	13.499073	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a4d4d49-364a-4bd1-9e88-ddc48090ddc8	Lundagårdsgatan	Gata i Forshaga	Forshaga	59.516621	13.467476	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0ce34a70-b55f-47b8-b1d8-7067b0ccdd82	Skördegatan	Gata i Forshaga	Forshaga	59.517292	13.465434	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d7ece92c-6eb5-4854-b9d2-151e853551a1	Åkergatan	Gata i Forshaga	Forshaga	59.51683	13.466398	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
55386c8d-9d57-401d-95e9-35da701b564a	Harvgatan	Gata i Forshaga	Forshaga	59.51627	13.46722	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c03a59cb-86c7-44e1-8885-6a17358bc212	Stallgatan	Gata i Forshaga	Forshaga	59.515683	13.467862	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a957279-5b68-482e-b4ae-7b036f231de7	Bindaregatan	Gata i Forshaga	Forshaga	59.514471	13.465475	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c33c4fbb-2255-4cd9-926d-8d98e16583fb	Liegatan	Gata i Forshaga	Forshaga	59.515071	13.46443	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3748de28-fd54-46cc-b5e4-b8fa0351bb21	Slåttergatan	Gata i Forshaga	Forshaga	59.515984	13.46278	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61248ded-0df2-4bf3-b0d9-c4b1469e957b	Nygårdsgatan	Gata i Forshaga	Forshaga	59.516703	13.469853	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
67e8eaa6-542c-484c-8ab6-95054c1c10d8	Rönnliden	Gata i Forshaga	Forshaga	59.517808	13.482154	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b70f8d8-51e0-499a-8aef-f14fbeac819a	Granliden	Gata i Forshaga	Forshaga	59.516656	13.481661	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
24a1729b-2ec5-459e-8fbc-8f53f041a0c3	Bokliden	Gata i Forshaga	Forshaga	59.516525	13.479131	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e589789-1544-4b5b-a27c-d4a922a4ebfd	Aspliden	Gata i Forshaga	Forshaga	59.514417	13.482588	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f2f27182-a5ab-4b6b-88a2-b9cfc722d660	Ekliden	Gata i Forshaga	Forshaga	59.512821	13.48453	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e03b7bb4-d8eb-4f57-85c5-7d8077c8f124	Trollstigen	Gata i Forshaga	Forshaga	59.519694	13.48365	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4840f50-be16-4798-a5a4-20d9927071da	Rosenlundsgatan	Gata i Forshaga	Forshaga	59.520742	13.489921	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c391734-7146-40e4-a2aa-c558f8f83321	Myggstigen	Gata i Forshaga	Forshaga	59.52134	13.489593	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7280dd05-60fb-4187-aff4-6e4bed6bb991	Sandviksvägen	Gata i Forshaga	Forshaga	59.520609	13.482996	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3747915-b0d5-47cc-96db-197d69afdf0b	Storåsgatan	Gata i Forshaga	Forshaga	59.519872	13.498294	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4c1f28d-dc36-4914-81e5-10fe7c9fab4d	Lillåsgatan	Gata i Forshaga	Forshaga	59.521196	13.501087	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca90d203-f615-48c9-abf4-1d41b361918d	Högåsgatan	Gata i Forshaga	Forshaga	59.520678	13.500141	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
351eb667-7ee0-4488-92f7-7f02dbf61b35	Solgatan	Gata i Forshaga	Forshaga	59.518074	13.500644	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
88365a44-aaa9-435c-9b2c-36440ac1c631	Tegelvägen	Gata i Forshaga	Forshaga	59.522523	13.498532	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c63bed22-53dd-4153-967f-d7aefe59490e	Högbrogatan	Gata i Forshaga	Forshaga	59.524164	13.508136	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43d9d5c0-d1cb-469f-8dcd-b6b91ea2b691	Bengtsbolsvägen	Gata i Forshaga	Forshaga	59.522612	13.509972	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c20b9ca4-957e-4d34-a9ed-9875fb224b24	Lyckebogatan	Gata i Forshaga	Forshaga	59.523014	13.493979	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb971748-6f13-4dd8-8d62-19480fb529de	Södergatan	Gata i Forshaga	Forshaga	59.537226	13.480812	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8bf3e30b-2e01-4259-9472-88bd7cbd97e1	Lövnäsvägen	Gata i Forshaga	Forshaga	59.517514	13.44239	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
305eb649-8f66-4c68-b355-6291e25e8cc9	Dyvelstensvägen	Gata i Forshaga	Forshaga	59.514865	13.438735	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3762ef3-c55a-4696-8afe-63cc636b065d	Hantverksgatan	Gata i Forshaga	Forshaga	59.534633	13.482856	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5611a007-666e-41a4-aa21-0974b32c4d08	Annebergsgatan	Gata i Forshaga	Forshaga	59.537744	13.469724	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bca18dbe-fc56-411c-a933-f0124bbc6401	Ängbråtsgatan	Gata i Forshaga	Forshaga	59.541115	13.467934	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3be4889e-d2f8-4dbc-85aa-0959d5134bcf	Ljungstigen	Gata i Forshaga	Forshaga	59.54205	13.479318	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa480c16-1601-40dc-ab22-846dc19bed01	Moängsvägen	Gata i Forshaga	Forshaga	59.520103	13.491421	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f80e7dda-77e5-4415-9525-0b434f28637a	Framgårdsvägen	Gata i Forshaga	Forshaga	59.541584	13.485051	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb9f88bc-17ad-48eb-b02e-75f21f76ff7b	Gärdesgatan	Gata i Forshaga	Forshaga	59.539051	13.481328	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9bf800de-b896-42a1-bb93-4dddeb9cfe5f	Nyckelstigen	Gata i Forshaga	Forshaga	59.520004	13.485612	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3a34a15-908a-4026-bf55-606455b7bbd8	Blomstervägen	Gata i Forshaga	Forshaga	59.537838	13.479296	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b56f1b19-837d-45e6-b038-e00408d5f7f1	Bråtvägen	Gata i Forshaga	Forshaga	59.542822	13.477026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b84d26e-3b82-4f4a-ae8b-d971c25a31d1	Geijersgatan	Gata i Forshaga	Forshaga	59.535187	13.479274	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44cef5b6-2d93-4692-a7af-e8fb1df7c58f	Djupdalsbrinken	Gata i Forshaga	Forshaga	59.525312	13.475012	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
766bf2b2-30c1-4b6b-8b20-0f7eabbc98c4	Stråvägen	Gata i Forshaga	Forshaga	59.536633	13.47722	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
81fa6bac-e978-4d69-bc21-256950db11db	Ordenshusgatan	Gata i Forshaga	Forshaga	59.533348	13.488872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af47d631-5952-4634-8d91-280e86ee93dd	Norra Lundgatan	Gata i Forshaga	Forshaga	59.534516	13.485348	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d0aea8d-65c1-43d9-b20e-21bc519d5827	Lindåsgatan	Gata i Forshaga	Forshaga	59.539947	13.469378	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
576b9b35-82ab-4a63-9a3c-575e33e87cc2	Humlevägen	Gata i Forshaga	Forshaga	59.521419	13.487284	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47f28fb5-513a-475d-b2c7-c45695e40e84	Hockeygatan	Gata i Forshaga	Forshaga	59.531096	13.491414	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a99647ab-ffc2-4b9d-bdd1-e6ea1dd24c01	Poppelgränd	Gata i Forshaga	Forshaga	59.527528	13.476125	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0805e44c-0155-40dd-9466-8a2fef34da07	Älvgatan	Gata i Forshaga	Forshaga	59.524489	13.479881	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e573706-d59f-437a-91d8-bade0d02bb9e	Enåsgatan	Gata i Forshaga	Forshaga	59.522781	13.50118	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48fa9501-3d01-4e91-aca8-d10deaf6f215	Högbergsgatan	Gata i Forshaga	Forshaga	59.518703	13.500274	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9d019f3-c548-4537-8e56-507c09112eed	Kullagatan	Gata i Forshaga	Forshaga	59.522419	13.506994	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4043626-5e68-436c-8fab-877796e76aa9	Tallstigen	Gata i Forshaga	Forshaga	59.518313	13.501472	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0128c6f2-dcd8-40f3-92a1-b04df2dec5e0	Bergviksvägen	Gata i Forshaga	Forshaga	59.516757	13.49433	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42010a00-d6fb-4f69-9d12-8bf49eb9aeb7	Ängåsgatan	Gata i Forshaga	Forshaga	59.523102	13.51069	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f408b543-af1b-4269-a224-b26e94ecdd73	Hjortmyrsgatan	Gata i Forshaga	Forshaga	59.522931	13.491866	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
223f2ca2-afcf-4d73-a85a-64ea32ce1945	Fågelgatan	Gata i Forshaga	Forshaga	59.529761	13.485061	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f3e0f0e-f7d9-4416-8e70-38fbeb029a00	Malmgatan	Gata i Forshaga	Forshaga	59.528838	13.482804	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ef74e59-3739-4bab-bbc2-3a48db760825	Mellangatan	Gata i Forshaga	Forshaga	59.530965	13.482224	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27ebefcc-4ae4-48c6-ad75-d606cc265fdc	Vattugatan	Gata i Forshaga	Forshaga	59.532956	13.49312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eec3d7f5-8aee-4995-93d8-ba3da7257d6a	Bangatan	Gata i Forshaga	Forshaga	59.526132	13.479351	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3fdfa88c-f101-46e9-9f9b-c443412e7342	Smedbacken	Gata i Forshaga	Forshaga	59.54062	13.47179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2bf0bc5-0460-446f-b8b5-3a5eb0d6a30a	Flottarevägen	Gata i Forshaga	Forshaga	59.513507	13.44072	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e4010f7-88b2-4d8d-b028-c1c1097d1a76	Piskenhusvägen	Gata i Forshaga	Forshaga	59.535013	13.438971	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0224c4d6-d95d-4211-8bc3-b4120d11b037	Stenåsvägen	Gata i Forshaga	Forshaga	59.517659	13.44189	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
131dc094-b040-4836-85e8-d1d173cf810a	Slättavägen	Gata i Forshaga	Forshaga	59.539021	13.455822	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba7f4319-f943-4430-8193-4e40e9c97441	Klarälvsvägen	Gata i Forshaga	Forshaga	59.526921	13.453479	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8a1b0c5-7329-4968-865f-3c997dbaa75d	Solvändan	Gata i Forshaga	Forshaga	59.542569	13.468761	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
85661bb4-8c58-4ced-808c-7e5e92d6eea4	Bergsgårdsvägen	Gata i Forshaga	Forshaga	59.518215	13.454084	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c6e331f-101b-4dc4-b0df-94e961b898bc	Nergårdsvägen	Gata i Forshaga	Forshaga	59.518926	13.472717	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a40fad2-f59a-4247-ba14-02f76c894f1f	Lövedsvägen	Gata i Forshaga	Forshaga	59.524147	13.451697	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc0ace6c-c789-42aa-a8ab-bd53cd20c010	Södra Lagerlöfsgatan	Gata i Forshaga	Forshaga	59.516542	13.501591	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f0cc8f0-9a8c-486f-94c3-9e070958a672	Norra Lagerlöfsgatan	Gata i Forshaga	Forshaga	59.522691	13.500542	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f16ad1d3-cd24-475b-bd0f-eda735b4c8cd	Thyras väg	Gata i Forshaga	Forshaga	59.538644	13.48547	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9b1828f-e7a9-4d0b-a4f3-fa932998c301	Eriksbergsvägen	Gata i Forshaga	Forshaga	59.520587	13.503554	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1bb80e96-f821-4514-8ec1-e70891a8cb01	Snickargatan	Gata i Forshaga	Forshaga	59.517355	13.45922	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
43ed76e7-8155-4004-ab0f-e4856826f8d6	Ladugatan	Gata i Forshaga	Forshaga	59.516133	13.464925	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a668431-5f71-40f9-b79a-0ca8c69c7c82	Torggatan	Gata i Forshaga	Forshaga	59.532896	13.487296	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e79dbc1a-6cc5-4b97-89d9-5c95153301d7	Noragatan	Gata i Forshaga	Forshaga	59.525775	13.502266	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d07ae0f-df54-46a4-aeeb-dd4b677715ef	Viragatan	Gata i Forshaga	Forshaga	59.530796	13.50163	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
acc92e63-c8a5-42fe-9e74-3ea91f7fd97f	Ängsstigen	Gata i Forshaga	Forshaga	59.533122	13.471942	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a43194f-0dee-4907-9f75-3f7d6f29632a	Esplanaden	Gata i Forshaga	Forshaga	59.530654	13.479297	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
95b29c38-ee59-4fa6-89c7-0466fb998601	Älvkullevägen	Gata i Forshaga	Forshaga	59.540449	13.484677	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df6a4bf6-1a96-47e7-b96a-979eb7bf15f5	Stinsgatan	Gata i Forshaga	Forshaga	59.521263	13.50298	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8b2516a-dda5-4f1a-bdc7-8095a267a303	Långgatan	Gata i Forshaga	Forshaga	59.524413	13.502171	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87c1fb33-ed35-4abf-99ea-f9be447bf66b	Stockgatan	Gata i Forshaga	Forshaga	59.531627	13.495923	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3524d0ad-b25c-40ee-b066-eebf25ee2c26	Lövedsbacken	Gata i Forshaga	Forshaga	59.525313	13.449033	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d76c227-c0df-442a-b703-3fc2239cd455	Älvnäsgatan	Gata i Forshaga	Forshaga	59.53919	13.486865	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a0215f4-c08a-43d1-85ca-a89e43123194	Sambråten	Gata i Forshaga	Forshaga	59.512223	13.484829	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a05866a7-9f10-40b1-b7ba-3b5d8d961381	Villagatan	Gata i Forshaga	Forshaga	59.530302	13.484256	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5f684234-3f3c-4f48-a61d-d1b89fc8c46f	Tennisgatan	Gata i Forshaga	Forshaga	59.531064	13.492218	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1295e86b-ca40-4872-90d4-6821fe12db9e	Öjenäsvägen	Gata i Forshaga	Forshaga	59.512352	13.4397	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e18d2f5-b00d-4f79-b558-3038f8e22f2d	Preem	Butik i Säffle	Säffle	59.14207	12.94488	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
29c9d736-154f-412c-8b0f-db831d7907ab	Tanka-Säffle	Butik i Säffle	Säffle	59.141394	12.944533	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e1d315e-c3f7-4be2-8e02-08527beecd7c	McDonald's	Café/restaurang i Säffle	Säffle	59.13521	12.917771	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
10abbf3a-1211-4851-b8ad-89e333ac510b	OKQ8 Säffle	Butik i Säffle	Säffle	59.135256	12.918693	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
020c55a7-b261-4b0f-93d1-75f9856fd829	Allékiosken	Café/restaurang i Säffle	Säffle	59.134126	12.935919	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
67ea8b7f-fe03-4eed-a3b9-76709160f15f	Gulf	Butik i Säffle	Säffle	59.138844	12.943037	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a90b1aaf-6c9f-4b34-b13a-2cdb1dc74fdd	Säffle Vårdcentral	Offentlig plats i Säffle	Säffle	59.135905	12.933354	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e37cb1d2-3ac9-4f42-8e5c-6c2da0bcba9d	Lugnadalsskolan	Skola i Säffle	Säffle	59.136044	12.91022	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ac138ca-1831-4c13-b6d1-18275b7e3f73	Annelundsskolan	Skola i Säffle	Säffle	59.139192	12.910014	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf614c9d-190c-411d-a7de-4d8ec6aa5bbc	Coop Säffle	Butik i Säffle	Säffle	59.134751	12.920079	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b38a456a-30b7-411c-b3fd-edcab3776da6	Apoteket	Offentlig plats i Säffle	Säffle	59.131939	12.929512	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5bdfda50-5d4a-47f7-a6ed-c6741b1c82be	Handlarn	Butik i Säffle	Säffle	59.133008	12.92049	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
36dc41e2-3c2b-4f22-9e40-0239e5e8fe39	Nya Galna Tuppen	Café/restaurang i Säffle	Säffle	59.131346	12.931522	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f68c367-6e8c-42da-956a-8ad7468d6a84	Höglundaskolan	Skola i Säffle	Säffle	59.130364	12.901791	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2e2c70b-98ed-49e4-83a4-0a2b73a52ae1	Säffle brandstation	Offentlig plats i Säffle	Säffle	59.140648	12.934557	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
50bf26f7-d5e0-45d1-b97a-d78af5c54629	Svea Vårdcentral	Offentlig plats i Säffle	Säffle	59.136295	12.933793	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4737b30-82f2-4ef1-94eb-7c4b5c1803d1	StigAllan	Historisk plats i Säffle	Säffle	59.127819	12.931067	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
31358981-07d7-4df3-9d33-ecc6b3cb4dc7	Hobbykällaren	Butik i Säffle	Säffle	59.13321	12.931658	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6e82333c-5e61-40a9-8b33-2b7a14fe0fbb	Lindgrens Frukt & Grönt AB	Butik i Säffle	Säffle	59.138073	12.927843	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b88d99be-d761-4b1a-b665-55e248670e02	Bella Rosa	Café/restaurang i Säffle	Säffle	59.132438	12.930155	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7927af1-1d65-4af6-a59f-4d6a161af5ee	Blueberry Sushi	Café/restaurang i Säffle	Säffle	59.133143	12.920499	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
531de0c6-849c-4c3d-a75e-80a6995b13c5	Hejdi Restaurang och Pizza	Café/restaurang i Säffle	Säffle	59.13264	12.921249	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
91d7b1f8-3592-4011-9f04-a8da07b99974	Holgers Konditori	Butik i Säffle	Säffle	59.132208	12.929898	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9dc5a04-2745-485c-9738-be04b3ab7d93	Pizzeria Montreal	Café/restaurang i Säffle	Säffle	59.132131	12.931857	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4387a27-b339-41b0-bd60-87b5231b3397	Nok´s Thai To Go	Café/restaurang i Säffle	Säffle	59.132392	12.916596	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
42c44c3c-ce2b-4c64-acec-8cd8961ed313	Sir William Wallace Pub	Café/restaurang i Säffle	Säffle	59.132698	12.930918	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
94a65a6b-796a-4320-b8c0-2b19fe537e78	Restaurang Afrodite	Café/restaurang i Säffle	Säffle	59.13269	12.930516	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c9b7403-5146-4acc-9b86-8a27bcd194cc	Westra Sjuan	Café/restaurang i Säffle	Säffle	59.132481	12.923214	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d8bb0db1-b34c-44c7-8278-95e0f83d63a4	Säffle gästhamn	Sport & fritid i Säffle	Säffle	59.127729	12.923705	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6a50f22-5fa7-4d0f-80de-6ca0ea38f572	Kanalstenen	Historisk plats i Säffle	Säffle	59.132809	12.926411	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
1cbcc2ce-ac53-479b-bcc3-6e44b0057292	Säffle moskén	Kyrka i Säffle	Säffle	59.13458	12.913591	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0169bd7-2cc5-4af2-a6c5-7287f5fb0c93	Dilans Grill & Pizzeria	Café/restaurang i Säffle	Säffle	59.133017	12.929961	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
83596d87-ba97-4d24-80dc-50bb990fcfc7	Tegnérskolan	Skola i Säffle	Säffle	59.129286	12.940022	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
49b89e16-3032-489b-9f05-325dfa20daca	Säfflebåtar	Butik i Säffle	Säffle	59.13546	12.927038	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3399717-0663-4675-b180-54ea9a2a5001	Villa Billerud B&B	Sevärdhet i Säffle	Säffle	59.144523	12.916435	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d8977dbb-1239-4440-8526-151ad03bbe0c	Sunds Bed & Breakfast	Sevärdhet i Säffle	Säffle	59.125022	12.933558	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5ab51604-9b07-4afe-ab97-213fcd186c0b	Kronans Apotek	Offentlig plats i Säffle	Säffle	59.134747	12.919395	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a47fc512-b142-4a6a-8b03-ff2257f5a2d8	Coop Förbutik	Butik i Säffle	Säffle	59.134775	12.919574	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b8beed6-f6c4-4474-a7a5-af4f2fdf3611	Bike Nation	Butik i Säffle	Säffle	59.134962	12.919537	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a312d452-3b38-4c7e-9236-34bd9de78a85	Team Sportia	Butik i Säffle	Säffle	59.134972	12.919176	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b8d2e9af-ff8f-47a5-bdd3-ae0bf2d24dc3	KappAhl	Butik i Säffle	Säffle	59.134783	12.919147	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
73b8a935-5bea-44b7-a862-fcf34ef60079	Snåljåpen Second Hand	Butik i Säffle	Säffle	59.133302	12.928104	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa59cfe2-3879-4a66-9d4e-e6936796b49f	Systembolaget	Butik i Säffle	Säffle	59.131854	12.931454	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f956318a-5c95-4c81-a466-d86e3c922f6e	Polisen	Offentlig plats i Säffle	Säffle	59.132957	12.923631	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
26deb85f-fdda-4924-8d5f-2331d792ca00	Säffle	Offentlig plats i Säffle	Säffle	59.132333	12.916287	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1dec688-38be-4790-9ec7-f6a954590ae8	Äppelparken	Natur/park i Säffle	Säffle	59.132663	12.934378	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
604ea2d3-03a4-4d9e-ad3f-61796a0e58dc	Granngården	Butik i Säffle	Säffle	59.136119	12.924679	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4709672-821e-4de5-9098-58d8624330f1	Royal Hotel	Sevärdhet i Säffle	Säffle	59.130446	12.922359	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
dba70e08-e23f-4a72-a689-83b5559f9f2a	Pekås	Butik i Säffle	Säffle	59.132109	12.932813	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9927aafd-8318-49b3-a194-b3a8f238fe78	Lidl	Butik i Säffle	Säffle	59.13515	12.913275	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
71a9f08f-8ffc-4013-b278-f7642bea7bd6	St1	Butik i Säffle	Säffle	59.129532	12.916547	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4beb691-d052-455c-8785-d0aaa96e0bcf	Kanalkafeet	Café/restaurang i Säffle	Säffle	59.131491	12.92509	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c190a66f-85bd-4ca7-badb-ad4226438189	ICA Nära Säffle	Butik i Säffle	Säffle	59.132941	12.933116	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d15bc754-0270-47a4-a405-3266b39333e2	Willys Hemma Säffle Station	Butik i Säffle	Säffle	59.130878	12.916497	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
34a0668f-3b17-4968-8c5f-e198729774cf	Tingvallaskolan	Skola i Säffle	Säffle	59.136999	12.931188	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c2ab7cb-561b-4c2f-a16f-7a6052d40274	Sagasalongen	Sevärdhet i Säffle	Säffle	59.132278	12.923941	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
432fb913-17a8-4aa1-989a-e79112663c02	Stenmagasinet	Café/restaurang i Säffle	Säffle	59.131629	12.925679	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe03f839-b30e-416e-b41f-628771e98654	Södra Sifhällaparken	Natur/park i Säffle	Säffle	59.129241	12.927566	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d66777c-bcf3-44b6-9be9-4ee4b60a68c5	Odd Fellow Orden	Offentlig plats i Säffle	Säffle	59.13187	12.919689	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae539936-81e8-45f8-ac69-66996a4a0ce7	Medborgarhuset	Offentlig plats i Säffle	Säffle	59.134848	12.92197	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0ffff47c-36d4-48d6-8c3e-f9655a0d18fc	Silvénska Villan	Natur/park i Säffle	Säffle	59.131771	12.927779	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e79ca6d4-11dc-4664-866d-3cdd1938f3dc	Sporthälla idrottsplats	Sport & fritid i Säffle	Säffle	59.13854	12.937922	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
df0c34d1-341d-438d-939e-789631efcacf	Kungsparken	Natur/park i Säffle	Säffle	59.13132	12.922832	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f31c4f48-02c0-4a21-a8c2-ab9c00991a6e	Solparken	Natur/park i Säffle	Säffle	59.127708	12.925817	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
15af9ead-1537-4a24-b751-092f14581214	Kvarnparken	Natur/park i Säffle	Säffle	59.126644	12.927773	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
d538d35c-dc9c-4cf6-ba3b-7869e0fd13cb	Sundsborgsskolan	Skola i Säffle	Säffle	59.131359	12.935101	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
653b0661-f22d-40d2-8304-93fc7d37b927	Sveavägs Parken	Natur/park i Säffle	Säffle	59.138415	12.941942	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ecf29d9-4993-4b8f-a2a1-b76d9d3f482b	Tegnérhallen	Sport & fritid i Säffle	Säffle	59.128947	12.941831	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
cb2099bb-5cd1-4ef2-a6f2-1c03cd0d7803	Kanalparken	Natur/park i Säffle	Säffle	59.130282	12.923626	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
cfd24437-eeb5-45d0-8f1a-545f1df818b6	Furuskogsparken	Natur/park i Säffle	Säffle	59.134772	12.938216	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
d25f9a36-abfc-4682-9387-e2e76c03329a	Kvistvägen	Gata i Säffle	Säffle	59.139652	12.957979	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7f0fe9ca-2569-40a6-8578-fdaec51443c9	Nävervägen	Gata i Säffle	Säffle	59.141515	12.957837	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0664d99-5fc2-4b27-b01a-63e81ecde1b8	Stockvägen	Gata i Säffle	Säffle	59.138513	12.955941	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f481afda-6109-4ac8-9651-1b3e3dfb2893	Stamvägen	Gata i Säffle	Säffle	59.141947	12.944712	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7ff2d27a-410f-4f3d-ad8a-197eb9d6038f	Tallvägen	Gata i Säffle	Säffle	59.141204	12.950654	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b49a55d6-4c22-42b6-b374-c81605566ed2	Västra Storgatan	Gata i Säffle	Säffle	59.132636	12.922638	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
db853954-266f-415d-92d7-b4554e17b7c8	Källegatan	Gata i Säffle	Säffle	59.133261	12.916495	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
829893bc-9653-44e6-aa9d-7c8a58838080	Bryggerigatan	Gata i Säffle	Säffle	59.133941	12.928597	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b918bf1-d15e-4a19-a16e-5f98d564a239	Östra Storgatan	Gata i Säffle	Säffle	59.132591	12.930651	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c86addda-e352-454c-91a5-05ac12f6a24b	Sommarovägen	Gata i Säffle	Säffle	59.142537	12.941288	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15547b2d-0e54-4fb8-8b24-596b0d2a05e5	Vädursgatan	Gata i Säffle	Säffle	59.125152	12.895695	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
035c466c-a3de-4a06-bf14-6bbcbafad6b0	Järnvägsgatan	Gata i Säffle	Säffle	59.136044	12.919186	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1509344c-eeaf-44b0-a7c3-8feec0ec2c32	Skolgatan	Gata i Säffle	Säffle	59.13169	12.921757	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9f1883e1-9bd2-465e-950c-8ea08c9a099e	Magasinsgatan	Gata i Säffle	Säffle	59.134275	12.920474	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c993c3eb-01f5-4a0f-a60e-571bbe808262	Rampvägen	Gata i Säffle	Säffle	59.136754	12.915473	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0940aa0-3ed6-437f-8626-a4f31a9b1201	Granbäcksvägen	Gata i Säffle	Säffle	59.139577	12.926312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea8aaa59-5acd-49d6-86b1-1ee1da994164	Fogdegatan	Gata i Säffle	Säffle	59.131536	12.932207	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af4e1d06-f510-46a4-bab5-7faec19c444f	Stenhusgatan	Gata i Säffle	Säffle	59.134594	12.932562	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff8c0fbe-c68e-4aed-b275-b64c6b36daa6	Tingvallastrand	Gata i Säffle	Säffle	59.138139	12.923743	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82248420-ee8b-46fa-937f-8c7fa0bc46c3	Norrlandsvägen	Gata i Säffle	Säffle	59.138866	12.929949	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a3e523dc-8e90-4b82-952e-5d1c36c79533	Industrigatan	Gata i Säffle	Säffle	59.124572	12.906959	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ebd1aadd-3183-497a-814f-6ce831ab01f8	Olof Trätäljagatan	Gata i Säffle	Säffle	59.128882	12.920971	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
afa0ca46-e43e-4824-a6c0-50da1b164d45	Hantverkaregatan	Gata i Säffle	Säffle	59.123497	12.914149	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
82a2d616-8466-4d0a-a151-4f2e931a9622	Metallgatan	Gata i Säffle	Säffle	59.12216	12.915553	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e84293ab-456c-4c36-b954-1490649cf19b	Säterivägen	Gata i Säffle	Säffle	59.122779	12.90991	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d1ebd42-bcee-4692-ab94-a82e02b057b7	Enbärsvägen	Gata i Säffle	Säffle	59.140181	12.951666	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d8bcdf8b-3cbd-4f30-8b1f-62852966897f	Treabacksvägen	Gata i Säffle	Säffle	59.14025	12.949408	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6fff47a7-7487-4f11-b677-7304c8c2d6b0	Gräshoppsvägen	Gata i Säffle	Säffle	59.142035	12.949911	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ad8bbb1a-c375-46ae-8b72-672d366e6ac8	Arvikavägen	Gata i Säffle	Säffle	59.141286	12.941381	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8e4253de-6086-4939-92ec-77645fb7dcc7	Billerudsgatan	Gata i Säffle	Säffle	59.134185	12.92055	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c34a8e1f-87dd-45e3-9619-f96d5f34603e	Tingsgatan	Gata i Säffle	Säffle	59.136915	12.926321	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2121448e-cc18-4137-95ed-6ac85ddfba72	Fiskaregatan	Gata i Säffle	Säffle	59.138903	12.924978	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d2a1b75-b591-4846-8979-910b7e15725e	Kilplan	Gata i Säffle	Säffle	59.138776	12.924003	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a07e993-9608-4ba3-9d81-6e52a7cf1deb	Styrmansgatan	Gata i Säffle	Säffle	59.139824	12.926082	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5754df8-f8fc-4f77-87f7-17bca40268c6	Älvhagsgatan	Gata i Säffle	Säffle	59.141279	12.923466	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
60bcc8b2-7481-4077-beb3-da7316ceb9e5	Kockgatan	Gata i Säffle	Säffle	59.142642	12.923035	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
10696c0c-8b34-413b-95ce-ca1e300d99ff	Åmålsvägen	Gata i Säffle	Säffle	59.128369	12.911812	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e3cd4f6-8dd0-4778-9fc4-118c94e21881	Lövstigen	Gata i Säffle	Säffle	59.140389	12.95145	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a6b28000-d93a-4d50-95c1-72df5a719230	Skalbaggvägen	Gata i Säffle	Säffle	59.14025	12.947073	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc76a598-b882-4b3f-b4dc-9183a4e0ff41	Karlstadsvägen	Gata i Säffle	Säffle	59.133386	12.934106	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cefcf81e-ead9-4200-be6a-b0810ab6d8f5	Törnrosvägen	Gata i Säffle	Säffle	59.138219	12.944353	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c95b67e9-0954-46c8-8bbc-910d33eef11e	Vallgatan	Gata i Säffle	Säffle	59.134926	12.943408	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0796f8ae-b386-4495-bd30-c63f2f12617e	Sundstorpsvägen	Gata i Säffle	Säffle	59.134754	12.943153	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e07df53b-68a5-4fff-96d4-1f93ffda3863	Linnévägen	Gata i Säffle	Säffle	59.136294	12.946135	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5a95c49d-79f7-48c5-bfff-ed4070c161c7	Björkvägen	Gata i Säffle	Säffle	59.13667	12.94804	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
505ee892-6ac4-4d52-9161-56f24570a3b9	Skogsvägen	Gata i Säffle	Säffle	59.136687	12.941922	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f572297-b146-4ff1-9454-cd5c8aac71bc	Solrosvägen	Gata i Säffle	Säffle	59.136673	12.942504	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e71d1ae-eeaf-48cd-ace1-9617124e34c0	Klövervägen	Gata i Säffle	Säffle	59.135419	12.94388	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7ec71c78-44c7-46f4-8da3-2d0ec74a259c	Aspvägen	Gata i Säffle	Säffle	59.135149	12.946841	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
92468a47-fe2c-4a66-8e7e-bdb6a35b948a	Ekvägen	Gata i Säffle	Säffle	59.133261	12.947646	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1387d1ea-e84e-45f2-bda7-ae03ae301259	Alvägen	Gata i Säffle	Säffle	59.133483	12.948443	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac0d300c-04b8-4769-aae1-ca3144c786b1	Oxelgatan	Gata i Säffle	Säffle	59.133098	12.949285	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6b54554-56ae-4529-8b56-01a8e866ee71	Sundsborgsgatan	Gata i Säffle	Säffle	59.13264	12.936128	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d3ba2b6-dd4b-4322-a872-c36d8028133f	Högalidsgatan	Gata i Säffle	Säffle	59.132318	12.941718	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac848f5b-f045-4df5-bbd0-7b49a2d2ce97	Åsgatan	Gata i Säffle	Säffle	59.133944	12.940652	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
70f5d588-e4fa-4e60-89a6-e91f894e063c	Granvägen	Gata i Säffle	Säffle	59.130811	12.939362	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e446054-04d9-4c88-ae73-ccdea6ea8f30	Trädgårdsgatan	Gata i Säffle	Säffle	59.129143	12.931401	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0c91887-108a-40cc-863e-d7587a2a6a08	Myrgatan	Gata i Säffle	Säffle	59.132391	12.937456	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f23c8d76-72a0-4574-9983-4890fa0186f8	Rönngatan	Gata i Säffle	Säffle	59.130186	12.941769	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8be1af9b-381c-43b0-a4b8-86d1e348afd0	Nypongatan	Gata i Säffle	Säffle	59.130522	12.943808	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb760976-1d4a-4591-b076-838afe01473f	Hasselgatan	Gata i Säffle	Säffle	59.130961	12.942941	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eae79fe0-c117-4647-98cb-0a2b26e4658e	Stenhusallén	Gata i Säffle	Säffle	59.134117	12.933703	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
05a5785b-7c0a-4de8-8665-a9c085d9c37b	Malmgatan	Gata i Säffle	Säffle	59.134854	12.930358	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0e72776-3f06-40c2-ad26-a5be0e745bfb	Nygatan	Gata i Säffle	Säffle	59.133392	12.934202	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ce45961d-aea0-49f6-91b0-d1388757ff31	Sifhällagatan	Gata i Säffle	Säffle	59.130466	12.931145	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0fc414d0-b9f9-492b-89b8-459e8b6a18cd	Hyttegatan	Gata i Säffle	Säffle	59.130909	12.929779	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd1243b8-53a6-4dcc-b445-add1a30c6b25	Parkgatan	Gata i Säffle	Säffle	59.128029	12.927638	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
341e225e-01fe-489e-923f-6f8dc7afeb9b	Ängsgatan	Gata i Säffle	Säffle	59.126965	12.929434	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5794e12a-600c-471f-b464-8cc4ad8a6f22	Tuvagatan	Gata i Säffle	Säffle	59.127736	12.931464	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f32607f9-149e-4c25-ad7a-668da2fe2982	Grengatan	Gata i Säffle	Säffle	59.128704	12.935664	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
992c319f-c91b-4848-aba7-f2479989bb29	Olstorpsvägen	Gata i Säffle	Säffle	59.127444	12.937076	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7532f48b-9cde-465d-9fba-9f89672cbaa7	Hagtornsgatan	Gata i Säffle	Säffle	59.128343	12.930662	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba5b4ed4-9f27-4a2e-80a8-26709eab2dc4	Sundsgatan	Gata i Säffle	Säffle	59.132061	12.931649	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1db6e94-0f8d-4770-848c-5230cd332a25	Sifhällaparken	Gata i Säffle	Säffle	59.12952	12.928406	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a192e85a-62fc-457a-8c85-cc22cc1d7b66	Trålgatan	Gata i Säffle	Säffle	59.139059	12.93278	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
734fb50a-3afd-489e-a65a-ffc2d94769e7	Södra Rolferudsvägen	Gata i Säffle	Säffle	59.138929	12.929265	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b14251cb-5f40-4647-9cd4-6c51b1856733	Notgatan	Gata i Säffle	Säffle	59.139087	12.928198	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5de99330-01e0-4e52-b751-0c4532479e3e	Ankargatan	Gata i Säffle	Säffle	59.139888	12.929713	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c09540f-53e8-425f-b569-ff0b00206d8c	Långrevsgatan	Gata i Säffle	Säffle	59.139642	12.931179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
494617cf-0bf9-4543-98d2-d4c9f3739cc4	Norra Rolfserudsvägen	Gata i Säffle	Säffle	59.143118	12.922816	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d13e9db-46e8-4cfa-80b5-5f6e7c7b9bf5	Kaptensgatan	Gata i Säffle	Säffle	59.133532	12.921958	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0ff9c986-6ab4-4228-943d-fbf5c3a99f00	Kyrkogatan	Gata i Säffle	Säffle	59.136631	12.928751	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
993bb330-400b-4e1f-a3e4-24cebdf14c6f	Tegnérgatan	Gata i Säffle	Säffle	59.131848	12.933727	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b9fd885-9369-4d86-946a-fb601da03cab	Stationsgatan	Gata i Säffle	Säffle	59.13211	12.918764	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58d2635e-77c7-4196-b3bf-6c6d584ae7ae	Bergsgatan	Gata i Säffle	Säffle	59.130848	12.918413	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bbe37741-d9f2-411d-8db9-c402825f6aca	Verkstadsgatan	Gata i Säffle	Säffle	59.129453	12.920514	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2ea71a25-5ee6-4769-8bd9-dc155dcc9689	Frejavägen	Gata i Säffle	Säffle	59.129088	12.918405	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a3d9708-432d-4454-ba63-7183202d5005	Torsgatan	Gata i Säffle	Säffle	59.128721	12.920068	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c739c38-1f04-4980-96ac-d11353658d7f	Villagatan	Gata i Säffle	Säffle	59.127972	12.918703	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
48912e5e-c9a7-4aeb-a6e0-bcf2a9888d37	Odenplan	Gata i Säffle	Säffle	59.128507	12.919023	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
01747c05-29ed-4c37-882e-21c2550496ee	Örngatan	Gata i Säffle	Säffle	59.126907	12.918852	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6a7189a-542a-4e77-9868-7d40723736b8	Odengatan	Gata i Säffle	Säffle	59.127421	12.917693	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
750e183a-0cff-44b3-a07c-1c688c34a88b	Fågelvägen	Gata i Säffle	Säffle	59.125449	12.916733	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e020ebb1-6a86-442a-9a49-272bbc8c2352	Herrgårdsvägen	Gata i Säffle	Säffle	59.126105	12.917286	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f062537-cec4-461a-a483-b1ad85a64cd2	Smältaregatan	Gata i Säffle	Säffle	59.121607	12.908649	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3348055-5fe4-4ac8-a95c-5568e123b8b3	Flåvägen	Gata i Säffle	Säffle	59.119121	12.91813	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e18e991d-ac23-417b-83e0-46799ae2aa4f	Pressaregatan	Gata i Säffle	Säffle	59.118687	12.910282	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06482cd8-5273-47dc-a4e0-921dfb151e51	Mångatan	Gata i Säffle	Säffle	59.122611	12.888533	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4a38c24-69b6-4f85-93db-b582286327cb	Oriongatan	Gata i Säffle	Säffle	59.125633	12.888843	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
348bddc2-42f1-415c-9ba0-95f006139e61	Herkulesgatan	Gata i Säffle	Säffle	59.124062	12.889583	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
044ced62-0ebc-42cc-a97e-078dd3ebff77	Atlasgatan	Gata i Säffle	Säffle	59.12542	12.890398	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b30a89d-c337-436a-b132-50e2c64e26ec	Pilgatan	Gata i Säffle	Säffle	59.123739	12.894624	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
45cb2f6a-7eb0-402b-9a86-99cbdbac4710	Jungfrugatan	Gata i Säffle	Säffle	59.126848	12.892024	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
585b040c-d730-4692-ad22-bc9d231cb039	Stenbocksgatan	Gata i Säffle	Säffle	59.126523	12.897112	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a6801426-f88b-44be-9016-978f4f982a71	Jupitergatan	Gata i Säffle	Säffle	59.12849	12.895957	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7084dc01-7aaf-4c3e-aa6c-848047819d48	Stjärngatan	Gata i Säffle	Säffle	59.132272	12.90472	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a182ff6b-25bf-40b6-9cd4-480dfb9a632b	Vegagatan	Gata i Säffle	Säffle	59.124827	12.903841	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
98e42944-b6d1-45a4-8dcb-ce64700dcc5b	Södra Höglundavägen	Gata i Säffle	Säffle	59.131189	12.91498	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
98f7d533-d37f-4866-82f8-08ca7f66b552	Norelundsvägen	Gata i Säffle	Säffle	59.128404	12.913037	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6b6d2ab8-dd02-4998-b571-4feb75c4872c	Vintergatan	Gata i Säffle	Säffle	59.133773	12.90967	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f648eac5-5614-444e-81f2-0238d05e57c1	Fristadsgatan	Gata i Säffle	Säffle	59.136443	12.912099	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11230b0d-66b5-486b-a511-9121be4e6c2e	Krokstigen	Gata i Säffle	Säffle	59.136584	12.913783	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
118eabe0-3f15-488b-9c32-7e9b02e5df15	Siriusgatan	Gata i Säffle	Säffle	59.126802	12.900025	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0de53551-3235-4a35-8c65-7876ce590934	Fabriksgatan	Gata i Säffle	Säffle	59.12633	12.91458	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9fbb7c1-4cc6-43b2-8fa1-5a3ac9406f28	Holländaregatan	Gata i Säffle	Säffle	59.138276	12.912496	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9c676370-45a8-4bb2-b40f-b36f5768bbe8	Annevigatan	Gata i Säffle	Säffle	59.14157	12.906621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
57a9d7cc-d40a-4f76-8caf-44f9eabe484d	Svingvägen	Gata i Säffle	Säffle	59.139559	12.906512	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
76c48dde-a179-43ef-b214-bab4c2a06bff	Follinsgatan	Gata i Säffle	Säffle	59.141518	12.909046	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd9f7bf9-fff9-4cda-a434-79de96b1a104	Calvertsgatan	Gata i Säffle	Säffle	59.140453	12.909072	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a199901-0cfb-4319-8e08-46b28e069d6e	Backgatan	Gata i Säffle	Säffle	59.144322	12.901431	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
940bb5fc-737b-411c-ab69-c29bebc8f9ac	Kyrkmyrsvägen	Gata i Säffle	Säffle	59.141931	12.903062	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d076ea01-c456-4101-a763-131ec3f295e8	Älvängsgatan	Gata i Säffle	Säffle	59.144496	12.908142	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0c396911-7bda-4a2a-80c4-c58980118f43	Lindstedtsgatan	Gata i Säffle	Säffle	59.143827	12.904451	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
089331e7-484c-4e2d-9ace-2ca7ce64b853	Klättgatan	Gata i Säffle	Säffle	59.143144	12.903251	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
95f2000c-09ae-4b41-8df8-5acc0df3536a	Högåsgatan	Gata i Säffle	Säffle	59.149023	12.898903	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
361119c8-3140-49eb-b65d-297095ec9d94	Vändstigen	Gata i Säffle	Säffle	59.146977	12.8992	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
28b60a0c-ff4a-4056-a90d-43e62ee39a0b	Degermossgatan	Gata i Säffle	Säffle	59.143518	12.899121	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e6c7199-ce45-46e7-b2b3-6edb90c0bf59	Stubbmyrsgatan	Gata i Säffle	Säffle	59.140165	12.900936	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b86d0164-8a8e-42b4-8b09-04d8b5d54cf2	Börstorpsgatan	Gata i Säffle	Säffle	59.141363	12.899728	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
be0684b3-bead-4538-94a1-15e705c3f5e4	Annebergsgatan	Gata i Säffle	Säffle	59.140215	12.90434	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
85f92f18-e558-43a5-99e7-87023d6ce96f	Alfhemsgatan	Gata i Säffle	Säffle	59.140736	12.903257	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d89cff54-83a4-4c4d-a256-f53da32fdb5c	Lillstigen	Gata i Säffle	Säffle	59.138248	12.90417	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4cc2e3d6-57bc-495b-9749-59035c5494a6	Lugnadalsgatan	Gata i Säffle	Säffle	59.136934	12.906683	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
acf7aac3-b275-48c7-8e85-0cb5f5070d25	Gläntstigen	Gata i Säffle	Säffle	59.137856	12.907764	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ae4f487a-f4d5-4c80-adef-de1bfe1216d0	Huldrastigen	Gata i Säffle	Säffle	59.136291	12.9045	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
083d3243-b752-445f-9565-3e0e879b707c	Mullestigen	Gata i Säffle	Säffle	59.137131	12.90104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d9faa3d-a179-4612-95b4-95675c1c5f29	Tomtegatan	Gata i Säffle	Säffle	59.138461	12.901096	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
925a1245-5eaf-4deb-a1eb-2947f0d5d05e	Annelundsvägen	Gata i Säffle	Säffle	59.140177	12.90704	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6eba38cf-6141-478f-b6f2-d8bc539c91cf	Kilavägen	Gata i Säffle	Säffle	59.143531	12.895755	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cc957d2d-adea-450d-b185-5b65268d7096	Timmergatan	Gata i Säffle	Säffle	59.144069	12.898159	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c1113497-b6e8-4b6d-b000-b5ddf314a5bf	Bondevägen	Gata i Säffle	Säffle	59.125383	12.937173	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
59ac7dbc-f399-4d0b-9bac-44d303bea618	Harvvägen	Gata i Säffle	Säffle	59.124513	12.940641	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c91dfd86-e65f-4669-b499-813a0090ccae	Plogvägen	Gata i Säffle	Säffle	59.125686	12.938775	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c672dbfe-9b0e-44f7-aa63-3ee4471e1e6d	Storjohansgatan	Gata i Säffle	Säffle	59.143746	12.908893	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58b0944b-9729-408c-86d8-9fa11f6317d0	Fältgatan	Gata i Säffle	Säffle	59.144679	12.90802	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6d056fe-1474-408b-96d9-c48f16922654	Återslöpsvägen	Gata i Säffle	Säffle	59.143626	12.909953	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8816bfc-cf48-4701-8737-dfc5f300a31f	Trollstigen	Gata i Säffle	Säffle	59.13567	12.906336	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4bd4cf16-ab76-4181-8772-b36de1e923e1	Forskningsvägen	Gata i Säffle	Säffle	59.144077	12.914444	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27863cac-f0f1-4fc9-ac8f-ea90d7667483	Hamngatan	Gata i Säffle	Säffle	59.133514	12.923234	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
88357d7d-f95a-4350-aa4a-95c1b39bc11a	Kungsgatan	Gata i Säffle	Säffle	59.130924	12.92019	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c9e39d1-81d0-44fb-b4d2-e37d416e5978	Angelgatan	Gata i Säffle	Säffle	59.138315	12.930463	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87ddb8a8-bf0e-4088-9bdf-b0182a4816be	Norra Höglundavägen	Gata i Säffle	Säffle	59.134085	12.914947	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
142d069b-eb73-46b8-93c9-c801ae22e202	Furuvägen	Gata i Säffle	Säffle	59.131836	12.937488	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
51ba0be0-4cbb-4651-8c3a-276249faaacb	Björkbacksgatan	Gata i Säffle	Säffle	59.1284	12.936568	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fdce63e5-0b0c-44b2-ba09-1e57c2db33f9	Skogstvären	Gata i Säffle	Säffle	59.1374	12.903055	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
659b4810-e886-4173-a134-e270f7a112f2	Lugnadalsparken	Gata i Säffle	Säffle	59.137002	12.906628	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0481dd5a-c607-411f-ae70-d458079d8181	Klippgatan	Gata i Säffle	Säffle	59.146501	12.900467	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8d31af3d-7fdd-445a-b13f-da927459bfe3	Dalgatan	Gata i Säffle	Säffle	59.141134	12.899183	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc4be17a-f7a1-4e47-bb2a-1f9fa058f842	Brucegatan	Gata i Säffle	Säffle	59.134913	12.926658	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b27e9b7-31dd-44ad-ba5b-fdf237355a94	Näsvägen	Gata i Säffle	Säffle	59.131543	12.933901	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
602f2188-f930-45df-a365-1300dfdae827	Sveavägen	Gata i Säffle	Säffle	59.139523	12.942179	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4048279e-6774-4475-9778-ed9d1baeef10	Rotvägen	Gata i Säffle	Säffle	59.143917	12.947142	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f23b0500-9c9a-4b48-8340-53e50b981aa1	Dungvägen	Gata i Säffle	Säffle	59.136777	12.930324	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4904eeec-9d11-4593-8eb8-3d6813d63ccf	Solvägen	Gata i Säffle	Säffle	59.135647	12.932785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
67097c25-345a-41af-b628-f67a386bb08e	Tingvallagatan	Gata i Säffle	Säffle	59.136027	12.930855	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1ae84811-b644-4907-8a80-f92a0d69c597	Skepparegatan	Gata i Säffle	Säffle	59.140749	12.928009	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2f87a68-75e2-43a6-8455-5fc8baca41f7	Torpstigen	Gata i Säffle	Säffle	59.137158	12.90338	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3307c85a-5a65-4d37-9f1a-e1130d6bc0d5	Jungmansgatan	Gata i Säffle	Säffle	59.142877	12.926486	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da4c8ca8-885d-4474-bd2a-bd723489f464	Sjömansgatan	Gata i Säffle	Säffle	59.141954	12.927806	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5cce4a48-c9d1-49bc-9a10-d95a829902ee	Hesselbomsvägen	Gata i Säffle	Säffle	59.128362	12.926252	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4b0529f-2e02-42b0-982a-1e874189e022	Båtsmansgatan	Gata i Säffle	Säffle	59.140706	12.929886	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2248f56-7c1a-46d0-8889-13345fd2b4f0	Kronvägen	Gata i Säffle	Säffle	59.14361	12.932467	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d02386e-361b-4c59-b8a2-4dde43aa5ceb	Blomvägen	Gata i Säffle	Säffle	59.136141	12.945599	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11a0ddd3-35b5-43de-86af-a38000d7d314	Götavägen	Gata i Säffle	Säffle	59.13678	12.946236	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d1d85ae-358b-4127-8ccd-3ae863b18ad5	Folkparksvägen	Gata i Säffle	Säffle	59.130658	12.9133	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e8b4e6bd-c517-4e92-b7c9-0939fe6418c3	Höglundavägen	Gata i Säffle	Säffle	59.130324	12.913804	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
db75ffa5-feca-41b6-bdba-b16674f6c99d	Karlsborgsgatan	Gata i Säffle	Säffle	59.126925	12.920566	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b5a204b-b67f-442e-b313-78b0eaaa3b5c	Hålvägen	Gata i Säffle	Säffle	59.127224	12.922146	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb899360-5ee2-40e6-acea-c02deeabd3d2	Älvstigen	Gata i Säffle	Säffle	59.127918	12.921908	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15d5fa07-fd8e-4de7-982f-f8ca596f423d	Jättegatan	Gata i Säffle	Säffle	59.138842	12.899093	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b1ea07b-beff-4dae-a715-941a1a7beb72	Lilliehööks väg	Gata i Säffle	Säffle	59.12145	12.933656	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
187ace12-75f2-4a7a-bfff-a39ab91a33b0	Torggatan	Gata i Säffle	Säffle	59.131477	12.933555	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cac7285e-e586-4b54-8eca-0b110b9bae1c	Näsgränd	Gata i Säffle	Säffle	59.130724	12.932612	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
41d72ff4-4556-4263-83fc-1e87678ba429	Perssons gränd	Gata i Säffle	Säffle	59.133076	12.929664	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
88125ebd-775e-4d8e-aa7c-c443172c1040	Kanaltorget	Gata i Säffle	Säffle	59.133452	12.924239	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f213f5ef-c305-41c6-93df-6526835ebe5d	Nytorgsgatan	Gata i Säffle	Säffle	59.130171	12.934612	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2f029f25-048c-4f56-ba7b-dd5b1e914b67	Billerud	Gata i Säffle	Säffle	59.13899	12.913793	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d1fb9b22-e21e-4841-985b-576e0771bc5b	Tanka-Filipstad	Butik i Filipstad	Filipstad	59.714719	14.174043	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
150b4fe2-28cf-4b7d-8747-ff975b3bd2f5	Museet Kvarnen Filipstad	Sevärdhet i Filipstad	Filipstad	59.712274	14.160721	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c73cec9-947e-4cd4-b9b7-8461dd2345f8	Wasa och Barilla fabriksbutik	Butik i Filipstad	Filipstad	59.712957	14.170818	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e7f0fa1d-0c56-4902-8f3d-5ced5501d9ce	Filipstads gästhamn	Sport & fritid i Filipstad	Filipstad	59.711918	14.174288	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
bab1d214-d25c-42d3-8e6a-a80b347745ed	John Ericssons mausoleum	Historisk plats i Filipstad	Filipstad	59.709043	14.177753	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e170eb4-690e-4c2c-a2eb-cc4a53f22768	Kanonudden	Sevärdhet i Filipstad	Filipstad	59.711489	14.176908	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b92df2e4-ec67-4708-8e6a-bb16f8335ba4	Spångbergskällan	Sevärdhet i Filipstad	Filipstad	59.710429	14.167348	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c33aa90-bda0-4899-8278-3151d97cff8f	Polisen Filipstad	Offentlig plats i Filipstad	Filipstad	59.712729	14.170665	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b95d3b43-3360-43a1-ab17-84be1b6944db	Vikings Hamncafé	Café/restaurang i Filipstad	Filipstad	59.712485	14.175586	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2cfd0ce1-dde0-4972-8b31-e9e50a4858df	Apoteket	Offentlig plats i Filipstad	Filipstad	59.712972	14.171018	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
667b1a8d-ea9d-450b-97d8-c577d3bfcc84	La Strada Filipstad	Café/restaurang i Filipstad	Filipstad	59.712834	14.164703	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca07e34b-4647-4363-87c1-cd0eddbe2655	Filipstad sportsby	Sevärdhet i Filipstad	Filipstad	59.704878	14.141201	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7be66b54-b8c5-4b28-80c8-7d3142d24c02	Filipstad livsmedel	Butik i Filipstad	Filipstad	59.71272	14.169216	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
eae5bd5b-f9cc-4528-b9d2-846a1170f9a0	Torgets Godis & Tobak i Filipstad	Butik i Filipstad	Filipstad	59.712031	14.1683	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
19bb839b-9b7d-402c-b77d-68b4c031922b	Taverna Agora	Café/restaurang i Filipstad	Filipstad	59.712216	14.168462	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
67827716-d230-4ac6-8a77-bc35b16700b0	Folktandvården Filipstad	Offentlig plats i Filipstad	Filipstad	59.711983	14.168502	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
83ead34f-ed0e-4ea7-9724-de943c7e1167	Circle K	Butik i Filipstad	Filipstad	59.713283	14.17426	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d99d1af7-7ef0-4ec0-ac84-d204ff3f0e0b	Energifabriken	Butik i Filipstad	Filipstad	59.717068	14.183502	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
12c8ea9c-efc2-4890-abdd-139b14beea5c	Filipstad Kultur & Konferens FKK	Offentlig plats i Filipstad	Filipstad	59.712802	14.171926	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8b6781f-b8fc-4113-86a3-5747ab333875	Nils Ferlin	Sevärdhet i Filipstad	Filipstad	59.712418	14.167482	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9c028a3-cf73-4b52-921f-0f3dfc3f66dc	Victor Rosendahl	Sevärdhet i Filipstad	Filipstad	59.714624	14.169397	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2dd92e6-cf24-4021-995e-5a7087a30345	Gunde Johansson	Sevärdhet i Filipstad	Filipstad	59.7124	14.165813	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
075960a8-0907-4a6b-8317-7578a189d2c1	Franz von Schéele	Sevärdhet i Filipstad	Filipstad	59.711019	14.168093	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8bc5bae-7111-4603-9a33-5d427cfb9fda	Salong bedoire	Butik i Filipstad	Filipstad	59.712819	14.167353	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
69888eaa-9e10-4c53-b2dd-f0ceec77c22d	Galleria Näktergalen	Butik i Filipstad	Filipstad	59.713082	14.168855	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
0bec2f2b-f8c7-4376-8024-09f938e72b2b	Filipstads bergslags bibliotek	Offentlig plats i Filipstad	Filipstad	59.712747	14.17247	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
97a24237-d08c-4abb-bae5-e35d43f638ab	Café Huset	Café/restaurang i Filipstad	Filipstad	59.712384	14.168744	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
33eca8c9-df21-4b12-b785-a858045b9963	Röda korset	Butik i Filipstad	Filipstad	59.711677	14.16907	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fffd81b2-030b-4011-bf9c-9a647195f70b	OLW Snacksbutiken	Butik i Filipstad	Filipstad	59.712987	14.171526	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf867f62-393e-4ae3-8a2a-ab2d13e96bf4	Alwafaa Livs	Butik i Filipstad	Filipstad	59.713411	14.169203	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
352d8ac5-262d-4c35-bf10-69b0ed22baa1	Filipstads Blomsterhandel	Butik i Filipstad	Filipstad	59.712636	14.166377	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3140e717-4308-4411-b300-ecfcd75e5a08	Salong Hårtussen	Butik i Filipstad	Filipstad	59.71275	14.166069	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba29d25b-23e8-4ad9-b25b-33a8de7995da	Bagges	Café/restaurang i Filipstad	Filipstad	59.712556	14.166869	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8234b963-ca57-4ac3-b39c-5f96421b0783	Salong Fröken Fin	Butik i Filipstad	Filipstad	59.713785	14.1692	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d3ba9fc6-14be-47eb-9cf3-65b338e6db2b	Fenix Second Hand	Butik i Filipstad	Filipstad	59.71383	14.16916	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
75654b74-c6cb-49b4-8538-d0979630ce5e	Pierres Däckservice	Butik i Filipstad	Filipstad	59.696486	14.16365	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc791825-9606-468e-acae-e7eba63040b2	Zolboo Sushi	Café/restaurang i Filipstad	Filipstad	59.712042	14.169906	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
03bcd8b9-3641-48ed-acdc-4175d14114e8	Systembolaget	Butik i Filipstad	Filipstad	59.712974	14.171186	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6708ebc-78bf-459a-a41b-af8fe776aaa4	Flügger färg, Filipstads Golv & Måleri AB	Butik i Filipstad	Filipstad	59.714678	14.169029	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a160b382-9785-40f7-bebc-c5e0bcc4d8fb	Pizzeria Amore	Café/restaurang i Filipstad	Filipstad	59.713892	14.165137	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
594f7fc4-04b7-4e78-b8a1-8c18df270266	Wasahallen	Sport & fritid i Filipstad	Filipstad	59.703568	14.170727	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
0e8b6160-83ea-4d19-a9a7-cf96b988e940	Spångbergshallen	Sport & fritid i Filipstad	Filipstad	59.708709	14.165214	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
dcee2e67-2374-46b4-a70b-1448c70320d5	Filipstads kommunhus	Offentlig plats i Filipstad	Filipstad	59.711597	14.166105	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
635ebead-fe22-4deb-acba-995c063ce1fb	Möjligheternas trädgård	Natur/park i Filipstad	Filipstad	59.712892	14.159127	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
20ad8be5-d6e2-44b2-8d64-4ed24dacb7b2	Filipstads brandstation	Offentlig plats i Filipstad	Filipstad	59.714598	14.173076	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2fb090cc-77dc-4dd4-a186-97103c012759	Pizzeria Palermo	Café/restaurang i Filipstad	Filipstad	59.714834	14.174166	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9a6aea67-f297-4bfc-874d-773bf0fcca57	Helmia AB	Butik i Filipstad	Filipstad	59.714536	14.174997	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
20602cd1-b004-499a-ba68-884df7459a29	Mekonomen Filipstad	Butik i Filipstad	Filipstad	59.71441	14.172137	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f863425d-7008-4abd-bde5-4746bf4153e9	Coop Filipstad	Butik i Filipstad	Filipstad	59.713185	14.170082	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d146da28-5b31-4134-b671-1ad0e3ed6b32	Köket	Café/restaurang i Filipstad	Filipstad	59.713112	14.172657	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
619c16d6-fa44-47df-b7de-fc96aedab0fc	Glasögonhuset	Butik i Filipstad	Filipstad	59.712436	14.172505	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
38f6a3b5-29da-4d9a-b176-b207c546715d	Filipstad vårdcentral	Offentlig plats i Filipstad	Filipstad	59.712138	14.178457	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa044748-a60b-4e0c-9822-5e08ed4d0289	Hertig Karl	Sevärdhet i Filipstad	Filipstad	59.711839	14.169881	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d86dcea3-70d8-4fbc-9a24-9e4f29307461	Kyrkans hus	Kyrka i Filipstad	Filipstad	59.711416	14.168316	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
056a6c4d-2dab-48a2-9663-5c2bc84a9d0c	Filipstads Motortjänst	Butik i Filipstad	Filipstad	59.714949	14.1858	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d550454-e3a2-4924-9c9a-1bb09d7b6bd2	Bergskolan	Skola i Filipstad	Filipstad	59.711111	14.158216	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
40cd5b0b-4777-4e00-8ae6-e468bf745a1e	Filipstads kyrka	Kyrka i Filipstad	Filipstad	59.711077	14.171881	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
0a7fd199-4548-45a1-b84b-673020146c11	Ferlinhallen	Sport & fritid i Filipstad	Filipstad	59.714067	14.162623	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4d8c9cc-2c76-4b88-9661-f09fbb013ccd	Spångbergsgymnasiet	Skola i Filipstad	Filipstad	59.708314	14.167248	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2ad69f9-f3c5-4c5f-a7a6-95202b052526	Strandvägsskolan	Skola i Filipstad	Filipstad	59.709136	14.169222	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d6fda34-4ef3-4ab7-bcbf-4c20091e0342	Lidl Filipstad	Butik i Filipstad	Filipstad	59.714368	14.15491	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6f4a327-94eb-4956-84d5-6a4490803a93	ICA Kvantum Filipstad	Butik i Filipstad	Filipstad	59.713001	14.156749	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
68e6ec39-bc12-4140-b9e7-a406666fc976	OKQ8 Filipstad	Butik i Filipstad	Filipstad	59.713175	14.153845	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7420fb44-8dc3-4993-b239-5fd0dcb7070a	Pekås Filipstad	Butik i Filipstad	Filipstad	59.712149	14.147544	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf552b9d-a0e5-47ac-a6f3-e2936aae16d9	AB Karl Hedin	Butik i Filipstad	Filipstad	59.712333	14.153589	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
79e51c0f-73b6-4177-a1b2-bad6074b9353	Bad och värme	Butik i Filipstad	Filipstad	59.710537	14.156912	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
371426e1-a6b6-426a-993e-4f9b6b36f945	Munkebergs camping	Natur/park i Filipstad	Filipstad	59.720996	14.159178	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
eaf01f1b-54b6-4ff3-8e69-205d0eb1f9b4	Pizzeria Babylon	Café/restaurang i Filipstad	Filipstad	59.705098	14.165649	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fc7b4e6-7083-4c01-befc-41fe8667f6c6	Rikets sal	Kyrka i Filipstad	Filipstad	59.71526	14.183267	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
87f848d6-123f-45a0-be49-92e33bf4a935	Storbrohyttan	Historisk plats i Filipstad	Filipstad	59.720341	14.155877	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
81e42e91-f216-4cfc-a3bb-870f9bf6259f	Vasakyrkan	Kyrka i Filipstad	Filipstad	59.714999	14.166289	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba563ab6-542b-4970-b42b-e39d21e2c30c	Big Hill Lodge	Café/restaurang i Filipstad	Filipstad	59.731522	14.197999	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
53f467f7-dbf0-4a2b-bfda-7bde48087533	Dollarstore	Butik i Filipstad	Filipstad	59.7129	14.150081	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d2d22f11-b478-49cf-9c51-cfab8088e9fa	Stjärnskolan	Skola i Filipstad	Filipstad	59.7103	14.165741	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
04890216-fc81-404f-95e0-54734b24fc77	Filipstads Sporthall	Sport & fritid i Filipstad	Filipstad	59.709211	14.164712	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
1da221cf-7052-408f-b303-f0b25093d023	John Ericssonparken	Natur/park i Filipstad	Filipstad	59.712148	14.175042	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
c465819a-8cd7-4e5a-b365-57a952bac02e	Sibylla	Café/restaurang i Filipstad	Filipstad	59.71283	14.174706	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
265d880e-3363-44c2-acad-109ccc66a12e	Filipstads busstation	Offentlig plats i Filipstad	Filipstad	59.713365	14.173053	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
d535d2f2-eead-4659-8344-133c009db999	Åsenskolan	Skola i Filipstad	Filipstad	59.718469	14.175117	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e9c2a05-bbb3-43f6-bc90-349c0f7ca719	Nykroppavägen	Gata i Filipstad	Filipstad	59.71165	14.177109	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3938d83e-0e14-469b-bed6-e7fc92df9377	Scheelegatan	Gata i Filipstad	Filipstad	59.71671	14.173342	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
175e9591-022b-4ea7-a13e-2866e51d26f1	Allégatan	Gata i Filipstad	Filipstad	59.710515	14.165027	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f80e5c2-ada4-4b0e-aadd-013c30d659e0	Färnebogatan	Gata i Filipstad	Filipstad	59.704471	14.164035	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06ed7779-a0c8-4b8a-8dbc-d13232c67066	Konsul Lundströms väg	Gata i Filipstad	Filipstad	59.711005	14.1548	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
66bccd04-b527-4940-8f75-30dd30a7edb0	Åsenleden	Gata i Filipstad	Filipstad	59.715786	14.183497	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d8b82ecd-905d-40a6-a405-e2599170116c	Sotluggsvägen	Gata i Filipstad	Filipstad	59.72302	14.175575	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4e289fd9-3537-42f8-8d80-528d04a5c8fe	Storhöjdsvägen	Gata i Filipstad	Filipstad	59.726755	14.20361	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3bc30b9d-939f-41b8-a4f9-29d2d129de5b	Kärleksvägen	Gata i Filipstad	Filipstad	59.712496	14.18586	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dcefcde5-58d4-499c-9bde-31b2075ba7da	Åkaregatan	Gata i Filipstad	Filipstad	59.717396	14.145616	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b772d413-b5ec-4023-b92b-4488cc01e029	Karlstadsvägen	Gata i Filipstad	Filipstad	59.711605	14.152813	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb16ae59-e7f6-4adc-890d-e7dcba73a984	Flottuvevägen	Gata i Filipstad	Filipstad	59.692899	14.170201	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9b8edee-97b8-4660-9501-cc95075d21ff	Radhusgatan	Gata i Filipstad	Filipstad	59.697413	14.16698	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
23bfac66-4005-4bff-9a80-2f55a4220ba6	Gruvgatan	Gata i Filipstad	Filipstad	59.701278	14.163876	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11fe0b3e-ab20-406e-b9ed-51299a5a7ab5	Hyttgatan	Gata i Filipstad	Filipstad	59.699001	14.166145	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44e394cc-0f2c-4846-9660-f1410375a13b	Götgatan	Gata i Filipstad	Filipstad	59.700666	14.161779	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15e19c5e-1ed2-4b4b-b081-a4b9cd31a67e	Blombackavägen	Gata i Filipstad	Filipstad	59.705427	14.162307	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
59adc6b3-9f36-404e-a572-b48099d96600	Lövängsvägen	Gata i Filipstad	Filipstad	59.701806	14.162092	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
171260ee-5d20-4f36-9f84-0fdcd8bf52d9	Assensgatan	Gata i Filipstad	Filipstad	59.699633	14.165867	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
49d60211-5e12-41de-9fce-e080b74c5661	Korsgatan	Gata i Filipstad	Filipstad	59.702478	14.16187	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7fdf2dcc-565e-47f6-81d7-2043f0c2f793	Stigaregatan	Gata i Filipstad	Filipstad	59.705714	14.162074	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e394ca1-c09f-47f7-9313-fe2887ff5193	Västerliden	Gata i Filipstad	Filipstad	59.705316	14.161171	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5b9432ab-a724-4e53-ac2d-953c2a270c8f	Bergsgatan	Gata i Filipstad	Filipstad	59.704737	14.161264	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47de9629-28a3-45b7-91b3-3f1d3c45b7fd	Ängsbacken	Gata i Filipstad	Filipstad	59.70415	14.161308	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d35964ea-733c-484a-864a-ab9dd0acf434	Jonstorpsvägen	Gata i Filipstad	Filipstad	59.704624	14.157778	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2d7f13fb-f5ef-4d2b-931d-18f08fcb084b	Bergslagsgatan	Gata i Filipstad	Filipstad	59.708288	14.162263	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1473228c-e3f6-47cd-ac82-58c7c0f33aa6	Spångbergsvägen	Gata i Filipstad	Filipstad	59.707739	14.164684	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f682e87-e69d-42d4-a309-2bc817160c72	Bergslagstorget	Gata i Filipstad	Filipstad	59.705214	14.164902	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
53f01450-cfd0-48db-ab9a-96e7708724e3	Fagerbergsvägen	Gata i Filipstad	Filipstad	59.702302	14.169241	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c1feea0-25a5-430c-879b-d30cf0710420	Asphyttegatan	Gata i Filipstad	Filipstad	59.711174	14.162616	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4147fa59-cbf1-4d52-a30b-bc78e9109d6c	Västra Malmgatan	Gata i Filipstad	Filipstad	59.71888	14.160295	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b050a030-5f38-471f-b37c-15e8fe164dd8	Kalhyttevägen	Gata i Filipstad	Filipstad	59.706474	14.138763	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a0adc7cc-e12c-484a-b53e-24985f8cea36	Industrivägen	Gata i Filipstad	Filipstad	59.692725	14.163991	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
663b099a-cdee-451d-8651-1d60342ba636	Härlingsängsvägen	Gata i Filipstad	Filipstad	59.696381	14.172721	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
90a65fd6-f39f-4fb9-a07e-5fed2a6ff6d5	Sommarrovägen	Gata i Filipstad	Filipstad	59.697885	14.174964	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ed787d9-b3d3-4151-8ba8-975300a52601	Knutsängsvägen	Gata i Filipstad	Filipstad	59.698543	14.171494	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c40c674d-d535-4f24-ada9-f7c02a05ce34	Lundagårdsvägen	Gata i Filipstad	Filipstad	59.699177	14.171817	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8549dbce-8f54-4ac7-95d1-3eba40c4fe79	Spelmansvägen	Gata i Filipstad	Filipstad	59.704299	14.167336	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab4bbc86-5ac3-4837-9dba-8f0f6aee22ad	Jonny Nilssons väg	Gata i Filipstad	Filipstad	59.703826	14.169417	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a469154e-c49e-4934-9070-e65845678ee3	Smedsgatan	Gata i Filipstad	Filipstad	59.70572	14.169622	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ecad17c3-9cdd-47ba-9f2d-e8d3a73854d6	Hagliden	Gata i Filipstad	Filipstad	59.707372	14.166727	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
40c2eee2-c645-4245-a001-a9e1b0e1cf8b	Bergsliden	Gata i Filipstad	Filipstad	59.70756	14.166232	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
215e8e98-e018-4bdd-9b63-982740f1c98a	John Ericssonsgatan	Gata i Filipstad	Filipstad	59.712658	14.173325	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b01a8457-fba4-4698-878e-be19bd068254	Fogdevägen	Gata i Filipstad	Filipstad	59.707815	14.167749	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bb4b1f2d-23e9-48c7-8b1b-3f27dced3940	Sparbanksgatan	Gata i Filipstad	Filipstad	59.711173	14.166836	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
49014975-35bf-4fce-a151-8e83b33fac68	Drottninggatan	Gata i Filipstad	Filipstad	59.71212	14.169278	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06a5cd25-10ff-4b8c-8ec7-739d861c24b8	Magasinsgatan	Gata i Filipstad	Filipstad	59.710952	14.168796	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b72143e0-1494-4a3f-8859-87b50c852400	Stora Torget	Gata i Filipstad	Filipstad	59.712278	14.168142	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58f1c3bf-3ec4-4d6f-a1fb-10b6749e1285	Älvgatan	Gata i Filipstad	Filipstad	59.711469	14.16872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
674453fe-3cb6-44ce-bb08-456f9c994044	Kyrkogatan	Gata i Filipstad	Filipstad	59.711484	14.169427	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
738a9aa9-7688-4c48-bbed-276bd774ce9e	Bryggaregatan	Gata i Filipstad	Filipstad	59.711196	14.169599	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f918ca7-605e-48d7-b030-2241b5011011	Tegnergatan	Gata i Filipstad	Filipstad	59.713867	14.164682	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa91ebb0-ebf4-4054-8bd7-8dc97f220512	Järnvägsgatan	Gata i Filipstad	Filipstad	59.706692	14.160396	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac892bb1-df83-408e-944a-36fdadc889e2	Kvarnbron	Gata i Filipstad	Filipstad	59.712041	14.160424	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b7d4582-276c-419b-ba6a-5aa5d7abea2d	Hötorget	Gata i Filipstad	Filipstad	59.71286	14.161476	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6bf311f2-c418-4b9b-ae96-6cd7fdaf6bd9	Hertig Filipsgatan	Gata i Filipstad	Filipstad	59.714072	14.16934	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f18305a8-abf9-4cf1-86de-4fdfb0d670da	Bronellsgatan	Gata i Filipstad	Filipstad	59.713485	14.168026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9bed0607-fc66-4cb4-990e-ce750bbeba84	Vikgatan	Gata i Filipstad	Filipstad	59.712497	14.172761	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab989d52-cbd8-4c50-8a74-3b72e4672e57	Lövlundsgatan	Gata i Filipstad	Filipstad	59.711431	14.155753	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
798d1313-5e37-444e-a90c-7c6057c41a30	Bagaregatan	Gata i Filipstad	Filipstad	59.711178	14.157261	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a4df553-6dd1-4a91-8eeb-bafaada85dec	Tingshusgatan	Gata i Filipstad	Filipstad	59.710778	14.15805	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c1a2228-264a-43ad-9bb7-c83a3d6f6ed0	Kungsgatan	Gata i Filipstad	Filipstad	59.712693	14.166054	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cadfc1c1-02a1-422b-a418-8fb713cd4041	Telegatan	Gata i Filipstad	Filipstad	59.713133	14.163156	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
329acfca-59c9-46d9-819c-551ef02eb2db	Hennickehammarvägen	Gata i Filipstad	Filipstad	59.695961	14.205026	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e77c555-0610-45a2-a1fe-dda3a0c1ee27	Mossvägen	Gata i Filipstad	Filipstad	59.721829	14.173846	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
50cd898c-58f7-413f-bec7-dbcd855da2cb	Parkvägen	Gata i Filipstad	Filipstad	59.709019	14.168165	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
74d91562-893a-45a5-9273-cf44b2e71e7e	Viktoriagatan	Gata i Filipstad	Filipstad	59.712841	14.170833	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
32242d07-ba6b-4a38-bdd1-193621cc0732	Hantverksgatan	Gata i Filipstad	Filipstad	59.711289	14.165487	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac101933-2b61-46b9-8508-33a6e56fc488	Färnsjövägen	Gata i Filipstad	Filipstad	59.709329	14.154522	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
196ce0b2-8934-4cda-b0ae-33bd396e8ef9	Lasarettsgatan	Gata i Filipstad	Filipstad	59.713748	14.179947	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7ad0fc3-2265-40e0-ab34-2f25ccf3fa92	Hertig Karlsgatan	Gata i Filipstad	Filipstad	59.713783	14.165133	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2ca411d2-85c5-41ad-a7e1-381f630d7023	Östra vägen	Gata i Filipstad	Filipstad	59.7148	14.189123	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4ff9fc5-df04-4572-9711-ef286bfa26ef	Patron Bergströms väg	Gata i Filipstad	Filipstad	59.7184	14.161987	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
176ad1db-edc0-4a4c-8844-dd752cc3dca4	Kasinovägen	Gata i Filipstad	Filipstad	59.718492	14.158698	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df329be6-34b1-40e0-8548-0e2a4667d7ed	Norrbrovägen	Gata i Filipstad	Filipstad	59.715749	14.159439	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bebbbb5f-b1a6-4b1b-b2de-7940ec36f70d	Älvstigen	Gata i Filipstad	Filipstad	59.716214	14.158453	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0228edee-6a24-4f0f-bab9-f5dcf7b2e5ab	Älvkullevägen	Gata i Filipstad	Filipstad	59.716951	14.158102	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b42c813-3e11-4cdf-bca6-e1a8fe0fd85d	Finnshyttegatan	Gata i Filipstad	Filipstad	59.718971	14.163696	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f7e76a0-a00b-466d-b209-40319fe0a9ef	Ringvägen	Gata i Filipstad	Filipstad	59.715918	14.170898	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9cdcf0d9-c7d4-4ab6-ad76-f70e7cd6570a	Västra Villagatan	Gata i Filipstad	Filipstad	59.71877	14.167432	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff02998c-7803-4226-9871-ffc7fb0a94cf	Frejagatan	Gata i Filipstad	Filipstad	59.720839	14.165458	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6332b77e-8ed6-449e-ab24-fd8ed14f128e	Munkvägen	Gata i Filipstad	Filipstad	59.719469	14.160981	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
75508b24-2d88-432d-99c9-da1856c7032f	Lundkvistvägen	Gata i Filipstad	Filipstad	59.721303	14.16864	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b38fd1a-cab5-4924-be0c-85b7c977aa74	Albanogatan	Gata i Filipstad	Filipstad	59.71455	14.170662	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7d6d0e4a-18a1-452f-910e-894b13338cf4	Polhemsgatan	Gata i Filipstad	Filipstad	59.716405	14.175088	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
30a3e6b0-e115-4acc-ae0f-8e63539ea426	Timmervägen	Gata i Filipstad	Filipstad	59.721257	14.17039	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47f221f2-5e83-4d9e-802f-afe979422a6b	Höglundavägen	Gata i Filipstad	Filipstad	59.717847	14.178348	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cef23b5b-675b-4912-bfa0-17dd27c381ab	Aspåsvägen	Gata i Filipstad	Filipstad	59.722462	14.169146	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
64ec36df-87ed-46bf-a1dc-4e4f1f264f9d	Engelbrektsgatan	Gata i Filipstad	Filipstad	59.715877	14.171623	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9e808eff-cbd3-4f64-a02b-112db67ecd7e	Kalle Knopares väg	Gata i Filipstad	Filipstad	59.716779	14.179806	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3e531899-6e70-4932-ad33-a92cd9d7fd70	Björkvägen	Gata i Filipstad	Filipstad	59.721351	14.17231	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f754de1-4185-48fd-ab51-b82051987f6d	Artistvägen	Gata i Filipstad	Filipstad	59.717649	14.17948	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a7354ae2-eb63-4a88-a6d3-876920fb4e6f	Bäckvägen	Gata i Filipstad	Filipstad	59.720225	14.174287	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c55cac9-255b-4f35-aecd-d6c951573587	Sturegatan	Gata i Filipstad	Filipstad	59.718094	14.171928	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b65576bd-9ed8-479e-bffb-b9df02e91fa8	Rönnvägen	Gata i Filipstad	Filipstad	59.72094	14.173323	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
85237d3c-57fd-4807-9e90-59e23216f266	Solhemsvägen	Gata i Filipstad	Filipstad	59.71786	14.180853	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca170fca-62e3-40d0-8750-794195ca99d3	Åsgatan	Gata i Filipstad	Filipstad	59.721446	14.175228	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
80bdc42e-693a-4007-b24d-55c278881160	Apelvägen	Gata i Filipstad	Filipstad	59.720012	14.171681	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c6a86a7f-0ffd-46d3-8f8e-44f0de14c3c5	Finnshytteåsen	Gata i Filipstad	Filipstad	59.724282	14.16652	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27223077-e1b9-4e1a-a02c-b20c00d15140	Storbrovägen	Gata i Filipstad	Filipstad	59.717509	14.159886	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
64ba49d9-b0db-4b2b-a922-0df3e28830fd	Linluggsvägen	Gata i Filipstad	Filipstad	59.722394	14.175801	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
47539760-4204-45ce-9ef7-ceb7f8080cef	Trollstigen	Gata i Filipstad	Filipstad	59.722557	14.176521	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4686980f-8e2d-4484-a6c5-04f4721df805	Tranvägen	Gata i Filipstad	Filipstad	59.715894	14.178722	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c37fc54-1abc-419a-9592-30fbafb16826	Byströmsgatan	Gata i Filipstad	Filipstad	59.716412	14.176472	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5a75624-e457-4d34-8a5e-1be6f1562901	Mjölnaregatan	Gata i Filipstad	Filipstad	59.706653	14.152393	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5b3eae6-c523-4801-9f09-027a39fd81b6	S:t Mickelsgatan	Gata i Filipstad	Filipstad	59.700112	14.167717	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
45687928-d7ab-4cb9-8872-708b28387e7e	Ringebugatan	Gata i Filipstad	Filipstad	59.700141	14.166248	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
65d1e99c-865b-4b77-acec-c386542192a2	Strandkullevägen	Gata i Filipstad	Filipstad	59.710359	14.14946	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e4f1ccf5-6161-4fd3-a7b9-09a0b4b457b0	Rektor Furuskogs gata	Gata i Filipstad	Filipstad	59.715022	14.163083	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f1cb154e-f4f8-445f-a8b0-55b0cac6f853	Malmgatan	Gata i Filipstad	Filipstad	59.716978	14.165506	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b7d647f-e273-47e0-875a-7ddf0d676194	Olof trätäljagatan	Gata i Filipstad	Filipstad	59.718196	14.165868	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ac8021bd-375e-4c83-84f8-792956674ffb	Frödinggatan	Gata i Filipstad	Filipstad	59.718021	14.166909	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
922c58b2-0256-4ba2-8b43-d56bb116166d	Nordmarksgatan	Gata i Filipstad	Filipstad	59.720023	14.16547	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
41742be2-a51d-468a-b7ab-6f41153b8c8d	Furudalsgatan	Gata i Filipstad	Filipstad	59.721497	14.16515	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cdf99e00-3262-4fb9-9cb5-4cde17739b30	Nylundsgatan	Gata i Filipstad	Filipstad	59.722253	14.164721	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8a4fa28c-a153-4926-9c4c-a7eb33a0ea8e	Östra Villagatan	Gata i Filipstad	Filipstad	59.717166	14.171226	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
16ceb78e-c002-4b07-8dd7-3fa5cc4b5b45	Vikhyttegatan	Gata i Filipstad	Filipstad	59.712268	14.17832	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
10c997ca-421d-4458-8d45-7e584ef722cc	Nils Ferlins väg	Gata i Filipstad	Filipstad	59.710578	14.18289	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8bec3e9c-33ff-4753-8f67-270bad3895e9	Tallvägen	Gata i Filipstad	Filipstad	59.711827	14.185403	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27d4dd02-5842-44a3-b282-a424bfc99308	Porsvägen	Gata i Filipstad	Filipstad	59.712846	14.184723	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe1fd5e0-8d65-4dcf-8c18-10f3bf796a16	Pålandsvägen	Gata i Filipstad	Filipstad	59.708957	14.180392	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a9143bb6-890b-4bc6-b648-06d84863ef98	Gnisterfallet	Gata i Filipstad	Filipstad	59.702782	14.183524	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f5009508-2be3-4afd-a2d6-60bbb922402b	Myrängsvägen	Gata i Filipstad	Filipstad	59.708081	14.183106	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7809fe08-f526-4298-af2f-a0facf4555c7	Selma Lagerlöfs väg	Gata i Filipstad	Filipstad	59.709603	14.181921	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb112d0b-bdf0-495c-b693-dbc1dba2a8fd	Vasagatan	Gata i Filipstad	Filipstad	59.71485	14.171437	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0745281-cfb9-4b82-a223-2532e18d2e7d	Fågelvägen	Gata i Filipstad	Filipstad	59.71559	14.181318	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d45b7504-2051-4fb2-8fae-b701da9bc4a1	Eriksdal	Gata i Filipstad	Filipstad	59.720168	14.18019	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0edc0c42-b742-4d02-aabc-2e6578fe61ea	Storbron	Gata i Filipstad	Filipstad	59.72049	14.151747	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4f5db411-8c85-45f1-9297-7a6a99d932b8	Oscarsgatan	Gata i Filipstad	Filipstad	59.714388	14.166436	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86e1d426-6636-4912-8b62-f34c4b4b583a	Berzeliegatan	Gata i Filipstad	Filipstad	59.714323	14.163087	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ea451c1-9c6e-4dcd-82eb-b14072224dcf	Nybacka	Gata i Filipstad	Filipstad	59.716538	14.191459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
993775ea-53e3-4db7-838e-047f651f0a28	Kalhyttebacken	Gata i Filipstad	Filipstad	59.709968	14.135597	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
38101f4a-35e2-4c31-aeb5-1a7eb3c33f16	Lilltorget	Gata i Filipstad	Filipstad	59.713168	14.16922	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4524289d-917e-44cb-978e-a52c0ae6db93	Sörängsvägen	Gata i Filipstad	Filipstad	59.689188	14.153254	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c8d849a6-007c-494f-9873-bee1e821fa78	Granvägen	Gata i Filipstad	Filipstad	59.709891	14.18347	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
18d2e588-5140-4eff-b882-14cc4234e8e2	Förrådsgatan	Gata i Filipstad	Filipstad	59.696323	14.165148	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
22e8ccd5-735c-4d19-b44f-db247fdb6a42	Kvarntorget	Gata i Filipstad	Filipstad	59.712363	14.160727	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f37fba25-0a38-4842-8d9d-cd1b30f78cbb	Strandkullen	Gata i Filipstad	Filipstad	59.710975	14.148432	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
efb20a27-21ed-47b4-b483-92bcf8447f3e	Nybackavägen	Gata i Filipstad	Filipstad	59.714899	14.195255	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bc965252-788f-4d56-b7ae-167905bd5146	Mörtenberg	Gata i Filipstad	Filipstad	59.711415	14.191608	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aae4d6fd-edb6-4db0-9433-a355788d4ed6	Klippgatan	Gata i Filipstad	Filipstad	59.716066	14.16348	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
478f4d3e-51ba-4291-8b0d-88441343c98c	Pershöjdvägen	Gata i Filipstad	Filipstad	59.708767	14.187376	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
165c1e40-4f5b-4dae-83e1-3675f45d48c3	Bergsskolegatan	Gata i Filipstad	Filipstad	59.711377	14.157996	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d5f35d69-8f4b-4f11-8dae-34e672fd3fc1	Piludden	Gata i Filipstad	Filipstad	59.699579	14.183647	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9c71d6a-f4d7-4d46-83bc-c5e7640f6e8c	Gamla Långlia	Gata i Filipstad	Filipstad	59.730792	14.191811	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1eeb222c-4011-46d8-98e4-80b7a0e6fbb5	Södra Piludden	Gata i Filipstad	Filipstad	59.697196	14.184111	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4885613-7840-4c3e-8232-988303da9c96	Pilgrensgatan	Gata i Filipstad	Filipstad	59.698364	14.183414	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6177ec6c-3f2c-4419-976e-25bcfde0008d	Värmlandsgatan	Gata i Filipstad	Filipstad	59.709683	14.163451	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
14c6cddc-727c-4a55-a23c-457069a00933	St1	Butik i Årjäng	Årjäng	59.394939	12.134697	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
935ddeef-3e4e-437e-9008-2bfc0f5f4d25	Coop Årjäng	Butik i Årjäng	Årjäng	59.392748	12.132555	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
11ef3f92-8c08-4fe0-bb2d-d99d7c4a0672	Hotell Årjäng	Sevärdhet i Årjäng	Årjäng	59.394053	12.13408	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
3dcb5e29-2404-47b1-bf02-9f91ed445288	Cafe Broms	Café/restaurang i Årjäng	Årjäng	59.392109	12.133005	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
29632ab4-9b62-453c-9f47-ceb0999e4971	Restaurang Bamboo	Café/restaurang i Årjäng	Årjäng	59.392765	12.134293	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1a2e4c00-797f-47c9-adc4-b881b047eee4	Oriental	Café/restaurang i Årjäng	Årjäng	59.391135	12.132292	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
df6448ca-c8ea-4526-8b46-fa33c3bc08f1	Pizzeria Venedig	Café/restaurang i Årjäng	Årjäng	59.39058	12.132164	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b630678-b035-4eef-991a-75610db3cd7b	City Pizzeria	Café/restaurang i Årjäng	Årjäng	59.393183	12.13292	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ac18888-4e81-45d3-82fc-eecadbda7b59	Kirl XXLs Källare Bed & Breakfast	Sevärdhet i Årjäng	Årjäng	59.392189	12.134557	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e1f389c-da84-4f3f-a131-5513cfb69c40	Årjängs Trollet	Sevärdhet i Årjäng	Årjäng	59.393828	12.133348	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
3be32b4c-e0c4-447f-a05c-3dc0c393d07b	Årjängs Slalombacke	Sport & fritid i Årjäng	Årjäng	59.402051	12.125609	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
42d4574a-c347-4a51-bafd-cfd640b9dcd6	ICA Supermarket	Butik i Årjäng	Årjäng	59.393337	12.132186	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6ecec820-d44c-47dd-b4c4-dbf52bfb161b	Systembolaget	Butik i Årjäng	Årjäng	59.391632	12.133079	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4de6e344-c87b-4b11-8aa5-d0daeb733a22	Apoteket	Offentlig plats i Årjäng	Årjäng	59.391769	12.133196	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f69b29c2-4292-4f4d-9017-fa3d246685ea	Färg & Kakelbutiken	Butik i Årjäng	Årjäng	59.394703	12.140808	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f4f7216-bd32-43f1-8b01-b0b26e048776	ÖoB	Butik i Årjäng	Årjäng	59.394241	12.139407	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3eb673c6-c650-4768-ae15-cf7b6ace325a	XL-Bygg	Butik i Årjäng	Årjäng	59.397622	12.131706	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9773484e-0b28-4049-8662-d6073eff960a	Vårdcentralen Årjäng	Offentlig plats i Årjäng	Årjäng	59.388464	12.130154	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
88aa5911-10c1-4310-b154-31bfcef0d789	Årjängs Bad & Friskvårdscenter	Sport & fritid i Årjäng	Årjäng	59.394374	12.132971	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f11889f1-8392-4c14-9cb8-d423d23a084c	Restaurang Rincon	Café/restaurang i Årjäng	Årjäng	59.392387	12.133128	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
30b62b62-8026-4eb3-b405-2aeb67d5ae3c	Årjängstravet	Sport & fritid i Årjäng	Årjäng	59.390582	12.156158	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
3b85c69e-86c9-4400-bb5c-3d4df3c0a7a2	Möbelmästarna	Butik i Årjäng	Årjäng	59.389324	12.130328	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3a1ee86e-f355-4b14-a59a-38b9b02c9b22	Krogeriet	Café/restaurang i Årjäng	Årjäng	59.392491	12.134018	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
981f6346-57bc-4cb1-8a42-f7bf822cda01	Tim Livs	Butik i Årjäng	Årjäng	59.390891	12.13239	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3d06e25-6851-4df3-8931-989d61aa56c3	Silbodals gamla kyrkplats	Kyrka i Årjäng	Årjäng	59.382932	12.122796	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
d988a4ed-0ad3-4724-940b-c5b92b214496	dressin station	Sevärdhet i Årjäng	Årjäng	59.375169	12.102462	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
7224a4f6-e7bc-4725-804b-fa2c6218947f	Årjängs båtsällskap	Sport & fritid i Årjäng	Årjäng	59.380948	12.122005	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
e6a68c87-f028-4fe5-9b2c-6988c6aeb0b2	Silbodals kyrka	Kyrka i Årjäng	Årjäng	59.385979	12.124169	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3147ad6-5e73-4f74-a5c1-94b268984eb8	Kyrkeruds folkhögskola	Skola i Årjäng	Årjäng	59.375122	12.104916	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
b9b30eb0-bb77-46d9-b943-92abe29f204d	Årjäng Busstationen	Offentlig plats i Årjäng	Årjäng	59.394443	12.131608	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea64bf76-2780-49af-a8bf-ab2984cf85e8	Circle K	Butik i Årjäng	Årjäng	59.39433	12.136652	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
eabc764c-cc20-4ebe-9daf-47a5e5d64980	OKQ8	Butik i Årjäng	Årjäng	59.394719	12.137102	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
003d07a2-b771-403b-9742-d429f8605f05	Café Broms	Café/restaurang i Årjäng	Årjäng	59.392073	12.132929	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a76e8d17-ab58-4cb3-956e-386f4e61ef85	Götes Grill	Café/restaurang i Årjäng	Årjäng	59.395001	12.138305	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c28be854-49fb-441b-9375-4999581e8c76	Nordmarkens skola	Skola i Årjäng	Årjäng	59.385345	12.122048	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
0b000d0c-382a-4148-910a-1299263e3357	Årjängs gymnasieskola	Skola i Årjäng	Årjäng	59.384824	12.126359	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
165fb21a-c5b9-417d-a60c-2db4102862ce	Silbodals Hembygdsgård	Sevärdhet i Årjäng	Årjäng	59.381225	12.126369	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c54a56f1-0079-47ab-9bd0-44f16b0cbd83	Nordiska Travmuseet	Sevärdhet i Årjäng	Årjäng	59.391177	12.15582	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
843d705b-a13d-426e-830c-a81eb1dd57eb	Pingstkyrkan	Kyrka i Årjäng	Årjäng	59.390212	12.132719	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
a22669e1-a061-4395-ae19-f25f3750b67c	Arvikavägen	Gata i Årjäng	Årjäng	59.39742	12.13872	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4a4a372-a57a-4c59-89f3-6e74b63c316d	Hantverksgatan	Gata i Årjäng	Årjäng	59.396246	12.135612	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b08d8569-161b-45a8-84b8-cb19dee6b17f	Storgatan	Gata i Årjäng	Årjäng	59.390479	12.13153	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
75970820-60ff-4020-87e9-8eaafd892a67	Sillegårdsedsvägen	Gata i Årjäng	Årjäng	59.375375	12.132727	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
374add98-4606-43e5-8f4c-b265d79b4be2	Sjövägen	Gata i Årjäng	Årjäng	59.385042	12.114524	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b02b84d7-294d-43c6-be68-f4a2ec275e36	Sveavägen	Gata i Årjäng	Årjäng	59.392384	12.138028	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c4ed4116-0d00-43ac-b89e-103b3d4e7eed	Högdalsvägen	Gata i Årjäng	Årjäng	59.384479	12.131234	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27c81490-6a27-4d81-bb16-0cc420d35bce	Fodgevägen	Gata i Årjäng	Årjäng	59.385134	12.132914	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf58dd75-727d-42be-bffe-199ad7c7283d	Högerudsvägen	Gata i Årjäng	Årjäng	59.390965	12.134201	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af1d99b3-ed7b-4c10-a3e1-100b7b1ed348	Korpvägen	Gata i Årjäng	Årjäng	59.383838	12.1372	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2419e356-60c7-463d-97ff-095f1b062886	Industrigatan	Gata i Årjäng	Årjäng	59.397157	12.133044	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
84d12c0a-e2e3-4f79-9846-8cb88c59ea98	Kvarnåsgatan	Gata i Årjäng	Årjäng	59.393879	12.131447	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b0974b1b-755f-447b-a9cf-39fd19e35ce0	Västanåsvägen	Gata i Årjäng	Årjäng	59.387674	12.117742	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
149d89f7-a257-4528-9acd-2f3423c24dbe	Järnvägsgatan	Gata i Årjäng	Årjäng	59.38899	12.128517	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
321ac1dc-fdac-4a5c-9af1-4a5639c6f112	Kyrkerudsvägen	Gata i Årjäng	Årjäng	59.380853	12.108501	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3162ce7-bc2a-4fa6-9a19-9fdbbfd13f82	Strandvägen	Gata i Årjäng	Årjäng	59.385159	12.135926	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b67d474-4810-4574-86c6-1fc7895f226c	Tingsgatan	Gata i Årjäng	Årjäng	59.38995	12.132935	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e21d60fe-fc35-463e-aa82-e0136b3d608b	Blomstervägen	Gata i Årjäng	Årjäng	59.388555	12.119538	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11567fec-0e9d-4971-a58b-37443cea2126	Bugatan	Gata i Årjäng	Årjäng	59.386463	12.133498	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1b0ee275-4d7a-446a-9d0e-48f20f67c660	Södra Ringvägen	Gata i Årjäng	Årjäng	59.380431	12.133133	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
36be68c7-81f7-40a1-be4a-e508b3b4638c	Ängsvägen	Gata i Årjäng	Årjäng	59.385359	12.113112	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
09e73823-a189-4132-a6b6-2fc92bc64c8a	Marknadsvägen	Gata i Årjäng	Årjäng	59.391826	12.14856	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b027da4d-89f0-4c43-9b8c-e1e535ce9f70	Gamla Riksvägen	Gata i Årjäng	Årjäng	59.390586	12.150831	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
956ddc43-7dd7-48eb-a17d-96bcfe8ddd57	Gamla vägen	Gata i Årjäng	Årjäng	59.391548	12.140439	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
69adfbda-4d17-4b5a-b5ed-b73181f999aa	Engatan	Gata i Årjäng	Årjäng	59.389528	12.140257	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9454d1d1-5063-4e9b-844c-c9ac0ccd1033	Videgatan	Gata i Årjäng	Årjäng	59.389564	12.142131	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c49a4f5c-3adf-4081-bd4f-3d8e5cb749df	Bäckvägen	Gata i Årjäng	Årjäng	59.390826	12.136974	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
474744d1-cdb6-444e-8b03-f2f9545906d0	Östtomtvägen	Gata i Årjäng	Årjäng	59.391183	12.137658	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e77bdc82-2f56-4233-bfc2-a232485fa1c7	Travvägen	Gata i Årjäng	Årjäng	59.390814	12.150493	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9505c492-98d5-4a0c-a164-0da2d03f55ae	Tallbackavägen	Gata i Årjäng	Årjäng	59.387234	12.14439	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
61c2d944-235a-48dc-8fc3-7b73507775ba	Gärdesgatan	Gata i Årjäng	Årjäng	59.392539	12.129809	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2392724b-97fa-47a7-ac17-14db80648e9f	Apoteksvägen	Gata i Årjäng	Årjäng	59.392173	12.131254	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2201cdb2-bcf9-4625-82b6-2c7b18f2ea39	Erik Trells väg	Gata i Årjäng	Årjäng	59.391301	12.130513	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2e6b3399-543e-4da2-9f58-ff999624f7c7	Nyponvägen	Gata i Årjäng	Årjäng	59.392114	12.121208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d19f7796-c705-4e51-b4a4-6203aeca44cc	Pionvägen	Gata i Årjäng	Årjäng	59.39186	12.119654	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6227a2c-41b3-4252-8805-ab43704f61f1	Rosenvägen	Gata i Årjäng	Årjäng	59.390623	12.120263	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
08035b73-389b-4e7b-81d9-46b9d6408e37	Violvägen	Gata i Årjäng	Årjäng	59.387768	12.116784	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46c69920-ae93-4e14-9494-b6365d8bb4ab	Kyrkåsvägen	Gata i Årjäng	Årjäng	59.381014	12.12575	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3007c646-2f52-4abd-83d8-6db881f9c5d1	Katjärnsvägen	Gata i Årjäng	Årjäng	59.382007	12.108819	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7856c2ba-d8b0-4dfe-a3be-09f83dfe4a7a	Lundegatan	Gata i Årjäng	Årjäng	59.379014	12.133312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fef4a6f6-56a0-4b18-a3d6-12bdf99c0c77	Viktor Sjöströms väg	Gata i Årjäng	Årjäng	59.382566	12.123229	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4a3fa788-31f8-4091-af27-97475ef2e48d	Hamngatan	Gata i Årjäng	Årjäng	59.383843	12.123368	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7eb9d15d-1e95-45d5-a300-ef89c0faddfa	Tallstigen	Gata i Årjäng	Årjäng	59.378579	12.132224	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cf740e2a-869d-4358-9913-cae60c826761	Kulstigen	Gata i Årjäng	Årjäng	59.377971	12.132603	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
debcfda4-e792-401d-a0f7-264210b48273	Norra Åkerstigen	Gata i Årjäng	Årjäng	59.381104	12.136244	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ed269515-ede3-480d-8ca8-40c842b8db10	Klockarvägen	Gata i Årjäng	Årjäng	59.384515	12.118621	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5bd5418b-ebd7-4f1e-a3ce-a49a27d515b2	Brostigen	Gata i Årjäng	Årjäng	59.379886	12.132312	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15f39eca-769f-489e-a728-3a6e53684552	Sjötorpsvägen	Gata i Årjäng	Årjäng	59.380753	12.107766	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc6e07fd-1303-4478-9c2e-e01221c216c8	Myrstigen	Gata i Årjäng	Årjäng	59.379235	12.132159	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
11a4fcca-ab81-48bc-8db5-9c39441a0932	Prästgårdsvägen	Gata i Årjäng	Årjäng	59.385071	12.117491	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
af7e4d56-c61a-4fdf-a7c1-3ef5deb5ab77	Nygatan	Gata i Årjäng	Årjäng	59.384877	12.120051	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0f778853-f9cd-47f0-8576-e2d959a3cdcf	Kornvägen	Gata i Årjäng	Årjäng	59.380806	12.139757	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e540efee-8fad-4234-b28f-b38221608c65	Södra Åkerstigen	Gata i Årjäng	Årjäng	59.380251	12.136129	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ba32f8e7-b424-42e6-b9e5-143a956fa5e2	Norra Villagatan	Gata i Årjäng	Årjäng	59.398836	12.142743	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
42ff1c78-343e-472a-9251-351e426b8717	Rönnfors väg	Gata i Årjäng	Årjäng	59.379527	12.128136	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e671a441-a471-45fc-b809-94361bdcb2a1	Backavägen	Gata i Årjäng	Årjäng	59.398692	12.144505	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d9eb7f9-bcd3-4a78-8cd0-d69d4e46cc17	Tornvägen	Gata i Årjäng	Årjäng	59.387241	12.131785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
78fb99d4-5bbd-4c37-b4f2-212009805655	Rågvägen	Gata i Årjäng	Årjäng	59.382886	12.13992	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87fcefb0-fba2-4aa6-8cb6-e54bb1c3e4ab	Bergsstigen	Gata i Årjäng	Årjäng	59.379326	12.135154	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4484348a-81cb-40b1-94b9-b905ad7be7b4	Smedgatan	Gata i Årjäng	Årjäng	59.397401	12.136344	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
95cfed58-721b-47aa-960b-77f6f42142d3	Skolvägen	Gata i Årjäng	Årjäng	59.385688	12.120063	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
66a0aedf-66ec-4fa0-addb-2ec35bdc6261	Kärrstigen	Gata i Årjäng	Årjäng	59.379319	12.13667	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b57e3c96-12d2-4797-8930-29a20462820e	Sileniusvägen	Gata i Årjäng	Årjäng	59.381889	12.124975	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ff50ec5-3a95-4fda-8688-659919f27a23	Höjdvägen	Gata i Årjäng	Årjäng	59.387622	12.130615	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e11c0038-49c3-4f85-8f0f-4cbc291b18b9	Brunnsvägen	Gata i Årjäng	Årjäng	59.386575	12.130143	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a70600c1-fa5c-46c0-8aa9-347345a63ced	Lärkstigen	Gata i Årjäng	Årjäng	59.385661	12.130461	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
560198f0-fd1b-455a-8fdb-7bfa4d705a54	Lärktorget	Gata i Årjäng	Årjäng	59.385698	12.13118	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0906e719-8580-4e42-b706-d9b4c6d8d0a7	Holmströms väg	Gata i Årjäng	Årjäng	59.390505	12.153378	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
87dc6bec-c3a9-4c7a-a14a-843c18beda29	Björnstigen	Gata i Årjäng	Årjäng	59.390217	12.130044	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6c5377e3-2bf4-406f-8b5b-ed0a5c87b6aa	Forsbackegatan	Gata i Årjäng	Årjäng	59.398576	12.129946	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ef66714d-0ab0-4ef9-b6cf-9f3778828398	Hagvägen	Gata i Årjäng	Årjäng	59.39596	12.144264	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fd32847b-1935-483f-80c3-6552f08d9a81	Rönnvägen	Gata i Årjäng	Årjäng	59.38849	12.142208	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d4d9f1a4-423e-4ab1-9ed9-48dd9e27ff36	Aspvägen	Gata i Årjäng	Årjäng	59.388685	12.141124	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
56a0cc6e-441a-4811-bd4c-5dbe01b09f12	Backmansvägen	Gata i Årjäng	Årjäng	59.393219	12.13741	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
072c6d21-79ef-4114-b03b-2a91d2c8cfff	Åhmans väg	Gata i Årjäng	Årjäng	59.388849	12.144034	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
39056d89-51e1-4f89-8b92-977e12cdef32	Skomakarvägen	Gata i Årjäng	Årjäng	59.390414	12.151915	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b523c478-f24a-4d5e-8a85-226893a4ae1a	Södra Villagatan	Gata i Årjäng	Årjäng	59.397729	12.139706	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
738ce103-7d60-4baa-a6f3-e2d66f3c10ef	Västtomtvägen	Gata i Årjäng	Årjäng	59.392158	12.132036	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fe72a6f-3efc-413d-8bc4-74853f3e11f3	Torget	Gata i Årjäng	Årjäng	59.392768	12.133011	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f8c50217-0406-4690-a001-f587d694c1c3	Kungsvägen	Gata i Årjäng	Årjäng	59.392442	12.134939	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
138694bc-9b5f-444b-bbc8-876bafb4f04f	Trollstigen	Gata i Årjäng	Årjäng	59.393826	12.129664	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d11e547-0562-4811-8539-af9329a7274a	Skogsvägen	Gata i Årjäng	Årjäng	59.389888	12.143364	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e76a85e5-76cb-4d4e-a02e-bf485ae21804	Almgatan	Gata i Årjäng	Årjäng	59.390668	12.139641	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
852133cc-4881-4c9a-9d59-d819e8c66645	Snickargatan	Gata i Årjäng	Årjäng	59.39395	12.139571	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ea6a38df-4e64-4b0d-ac76-deea33786523	Apoteksgruppen	Offentlig plats i Skoghall	Skoghall	59.324365	13.467222	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7e03b20b-51e3-4a86-bfe6-4133cef837b3	Koleragrav	Historisk plats i Skoghall	Skoghall	59.337568	13.431316	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4c6a70a-5802-4b47-8b7a-b19293fc1d4c	Vårdcentralen Skoghall	Offentlig plats i Skoghall	Skoghall	59.32457	13.465252	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
187badca-5332-408a-a403-1604e647accf	Skoghalls Folkets Hus	Offentlig plats i Skoghall	Skoghall	59.324	13.467885	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
da1deb76-3591-4d3b-b545-1daf41b974d6	Värmlandsblommor	Butik i Skoghall	Skoghall	59.333076	13.471291	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3fd9e96d-ffb1-49eb-8c9e-80e329f4c348	Qstar	Butik i Skoghall	Skoghall	59.324502	13.47504	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3c36c57d-a402-48a7-89ce-7c2c62f1da74	OKQ8	Butik i Skoghall	Skoghall	59.324217	13.477564	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
95759600-654d-4285-a91b-72aa35654073	Pizzeria City	Café/restaurang i Skoghall	Skoghall	59.324775	13.469088	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
089c1b2e-9c79-4ec8-a767-f6b96b93a1c8	Arianns	Butik i Skoghall	Skoghall	59.324857	13.468155	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3402b473-da1b-448b-8b1c-24cb7c937fc2	Pizzeria Ceylan	Café/restaurang i Skoghall	Skoghall	59.323521	13.466376	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
16e6b4e4-55a9-4478-9c06-e332617c0298	Hammarö polisstation	Offentlig plats i Skoghall	Skoghall	59.32319	13.466558	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
ccfd2f85-7ef2-49b0-a074-026cb348b650	Biblioteket	Offentlig plats i Skoghall	Skoghall	59.324071	13.468265	offentligt	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
75019f9d-229f-44a5-b34a-c3ebaf4ffbfd	Folkets Hus biograf	Sevärdhet i Skoghall	Skoghall	59.323875	13.468221	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d1e0a56-d414-473e-9954-59a0f33c6cf3	Skoghalls Folktandvård	Offentlig plats i Skoghall	Skoghall	59.324513	13.465567	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
4cf5ccb8-0b76-4fbc-8308-bedf63938f41	Nettans blommor	Butik i Skoghall	Skoghall	59.324769	13.46872	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
636f5546-3ccb-4870-b24b-edc5abc6bbdf	Millas Skrädderi	Butik i Skoghall	Skoghall	59.322356	13.488904	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
aee1eba2-7002-4c13-b761-e4bbab0f8c55	Sankt Olofs gryta	Historisk plats i Skoghall	Skoghall	59.316781	13.454493	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
6478e676-644d-4df0-838a-4cc89fe99df1	Sofias Salong	Butik i Skoghall	Skoghall	59.330709	13.485446	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
8dcb186e-6487-4e98-8733-18bb07213828	Glada Saxen	Butik i Skoghall	Skoghall	59.324234	13.467086	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
e9a38f34-e644-44e3-901b-8db2d5fa77ca	Aztur	Butik i Skoghall	Skoghall	59.324292	13.467146	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
958bf885-9d4d-414a-bcb7-83c2c2513380	Fritidsbanken	Butik i Skoghall	Skoghall	59.323599	13.466455	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
a00b3d3e-9f02-4dc8-90ee-ee7cf2b22fd3	MyWay	Butik i Skoghall	Skoghall	59.323671	13.466523	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
cacf8c24-c0e8-4a6a-a080-697c627f3801	Restaurang Long	Café/restaurang i Skoghall	Skoghall	59.324886	13.467967	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1705700b-61c1-46dd-a135-7b5cefe0c060	Sanny Nails & Beauty	Butik i Skoghall	Skoghall	59.324675	13.469492	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
2488be19-6b70-4c09-99be-5f96f71bb890	Hårstudion Hammarö	Butik i Skoghall	Skoghall	59.324703	13.469322	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
dab5da85-39d4-4841-b059-a6a4f3afe69c	Skoghall Barbershop	Butik i Skoghall	Skoghall	59.324691	13.469397	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f4380e81-e6f6-4d60-9adf-3f24845971ed	Skoghall-Hammarö begravningsbyrå	Butik i Skoghall	Skoghall	59.324829	13.468331	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
252a4d57-0ab6-499a-82ad-eb799e843de9	Sax S	Butik i Skoghall	Skoghall	59.324815	13.468421	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fb14226f-23e1-4a3c-a3d2-8d3807551a65	Continental	Butik i Skoghall	Skoghall	59.324794	13.468555	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9580650f-3355-4dfa-ac38-c5bb0109dc7a	Bowe	Butik i Skoghall	Skoghall	59.325124	13.46975	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4adeeca6-37b6-4d16-93b3-a60848d22945	Röda Korset	Butik i Skoghall	Skoghall	59.323912	13.466816	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
c04f262d-9497-45c2-901a-6d84b9bfa569	Tod Sushi	Café/restaurang i Skoghall	Skoghall	59.324084	13.466979	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
663f15ab-950a-4cba-aa01-43609e5d6a80	GLG Lysåsen	Café/restaurang i Skoghall	Skoghall	59.321481	13.441261	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
198c8417-34f9-4f0b-8b08-b79239f940c8	Capri Pizzeria	Café/restaurang i Skoghall	Skoghall	59.3226	13.487753	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
902686fa-6c85-4816-95f0-818bcb695b4e	Allis	Butik i Skoghall	Skoghall	59.324001	13.466902	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
30b08531-091c-4cdc-8388-3983aad868b9	ICA Kvantum Hammarö	Butik i Skoghall	Skoghall	59.342591	13.504383	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
eb73d1ac-2257-4f99-a551-e32bd090bc2a	Apotek Hjärtat	Offentlig plats i Skoghall	Skoghall	59.342634	13.505104	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
f49c4098-1c01-4fca-bb6d-ec2847795692	Eurotents Tältvärlden	Butik i Skoghall	Skoghall	59.342908	13.50064	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
6728a0db-d62c-4990-b9ea-56b329860c70	Husvagnspoolen i Värmland AB	Butik i Skoghall	Skoghall	59.342706	13.500782	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5fddca2-b23c-42b0-9558-8923d7a6f1b7	Baccaria	Café/restaurang i Skoghall	Skoghall	59.342714	13.505119	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4c7185df-d1cf-41ad-9830-6c69b4101c5c	Marguertie's	Butik i Skoghall	Skoghall	59.318046	13.463684	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
d088d135-9fd5-45ae-889d-9c4fa53e0ba8	Spice n' Rice	Café/restaurang i Skoghall	Skoghall	59.34281	13.505527	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
f435d7e5-5134-4573-b626-8c3b518b9729	Däck-Johnny	Butik i Skoghall	Skoghall	59.339877	13.50333	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
df84f603-40fd-4097-9fe5-9784a70c6215	Triwo AB	Butik i Skoghall	Skoghall	59.32483	13.470356	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
572eb48f-4bf9-493f-b138-2113f85a2753	ICA Supermarket Skoghall	Butik i Skoghall	Skoghall	59.325103	13.467269	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
24bc471d-c8ba-4913-be97-52cf86c68d8a	Systembolaget	Butik i Skoghall	Skoghall	59.325346	13.466475	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa28ebaa-87b4-4fc1-acf4-11c61db6e4f4	Mörmo idrottshall	Sport & fritid i Skoghall	Skoghall	59.325557	13.480379	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
873947e1-9c23-4141-aa98-4b43c970583e	Vision Healthcare Nordic AB	Butik i Skoghall	Skoghall	59.343025	13.498936	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
bf1ad63b-28b4-4741-9b8d-70cc3201e02b	Hammarö Ishall	Sport & fritid i Skoghall	Skoghall	59.325458	13.484686	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
1523017a-b06f-4cfa-b39f-7af6961e624d	Möruddens Brygga	Café/restaurang i Skoghall	Skoghall	59.312018	13.497144	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
b55e320e-e855-4bc4-99ac-8d67f7781222	Rackethallen	Sport & fritid i Skoghall	Skoghall	59.333382	13.473651	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
728033bf-8b86-47d3-8ae4-434bb8767c8b	Djupsundshallen	Sport & fritid i Skoghall	Skoghall	59.331811	13.472498	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
b5d0d011-3238-4698-a089-8fc4ef158308	Skoghalls kyrka	Kyrka i Skoghall	Skoghall	59.322895	13.463919	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
a6cf014c-921a-423d-9373-43899e4a29e2	Skoghalls pizzeria	Café/restaurang i Skoghall	Skoghall	59.322925	13.46563	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
14085d1b-6a68-4bed-8303-39bcdbf4c5c6	Pekås	Butik i Skoghall	Skoghall	59.32597	13.466615	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d4234e2-a82f-4913-8006-7b705ac2d6a2	Karins fotvård	Butik i Skoghall	Skoghall	59.323321	13.483738	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
3935d488-e49e-43a2-a386-54b75581dedb	Möruddens småbåtshamn	Sport & fritid i Skoghall	Skoghall	59.314725	13.49614	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
62b48c5f-fa93-4931-814e-48649ebb31aa	Lunnaparken	Natur/park i Skoghall	Skoghall	59.328161	13.468909	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
f6f3beeb-8bcc-4c7f-8c99-25984dd334dd	Mörudden	Natur/park i Skoghall	Skoghall	59.311819	13.495952	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
08d23277-5bf8-4980-b138-36be908950da	Hagagrillen	Café/restaurang i Skoghall	Skoghall	59.3243	13.47545	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
77df8b87-a56b-4b9d-8701-0c1f39cd454d	Lillängshamnens fiskrökeri	Café/restaurang i Skoghall	Skoghall	59.316501	13.466925	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
1608e07c-a6cc-46d7-ac51-5fe04a1e2e84	First Camp Mörudden	Natur/park i Skoghall	Skoghall	59.313252	13.498984	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7d33a83-0667-42b4-aa3c-1508289d5c77	Värmlandsskärgårdens naturreservat	Natur/park i Skoghall	Skoghall	59.234364	13.594721	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
3ca4eae3-a470-42c1-9d7d-0830c7962b34	Mörmo idrottsplats	Sport & fritid i Skoghall	Skoghall	59.325711	13.477985	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
4bb13601-e46d-4ec0-a35f-4159f517b519	Himlabacken	Natur/park i Skoghall	Skoghall	59.322586	13.46759	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
16a01798-5952-41c1-bc66-76ca12014555	Trekantsparken	Natur/park i Skoghall	Skoghall	59.32361	13.469534	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
13792411-6805-459c-b102-a36ac21c5acc	Skoghallsparken	Natur/park i Skoghall	Skoghall	59.324637	13.482887	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
fbb637fb-11d4-46b4-92a4-ce96686a9de3	Götetorps skola	Skola i Skoghall	Skoghall	59.331043	13.473016	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
93d84204-1b3c-4ecf-95b1-b689503b2e55	Lillängshamnen	Sport & fritid i Skoghall	Skoghall	59.316598	13.464891	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
ebb21f7a-4940-4c52-a7c1-586ed731b51f	Jonsbolsparken	Natur/park i Skoghall	Skoghall	59.33767	13.501835	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
60b62737-e853-4fe2-b037-4965d10d9ad8	Dingelsundsvägen	Gata i Skoghall	Skoghall	59.327346	13.45501	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
745db10a-9b47-4a2a-9134-b9433db6f0da	Industrileden	Gata i Skoghall	Skoghall	59.32811	13.466657	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44540213-41e5-46f0-90e4-1c5588718080	Cirkulationsplats Mörmon	Gata i Skoghall	Skoghall	59.3298	13.477053	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7cd8edbd-f53b-4679-9ce6-fee4a6223c9b	Skoghallsleden	Gata i Skoghall	Skoghall	59.336692	13.492203	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3268a934-e175-4be4-9706-076664a8c545	Lövnäsleden	Gata i Skoghall	Skoghall	59.342303	13.503441	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e81299ec-a372-4055-adfe-3c2642a1fc7b	Gunnarskärsleden	Gata i Skoghall	Skoghall	59.334039	13.496944	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
084ef159-a15e-4180-aa92-7252beafa4d2	Klöverudsvägen	Gata i Skoghall	Skoghall	59.319238	13.497091	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
114bd026-fc51-481d-b2ce-48b2d6b4affd	Floravägen	Gata i Skoghall	Skoghall	59.323843	13.498029	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ad3e134-3d25-4426-9a93-1f8b6fccad51	Norra Domarevägen	Gata i Skoghall	Skoghall	59.323182	13.494815	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
eaf2affa-83c6-4ea4-bf87-2277ab421d79	Axelssonsvägen	Gata i Skoghall	Skoghall	59.326196	13.499084	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
35486975-0303-4f7d-9889-14b27a4d27f3	Baldersvägen	Gata i Skoghall	Skoghall	59.322327	13.501203	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c89b1027-cb17-4089-a5b7-abe5148bdfdd	Guntavägen	Gata i Skoghall	Skoghall	59.324771	13.496897	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3d10b2be-effd-474b-92db-345e3a8a38c2	Gunnarskärsvägen	Gata i Skoghall	Skoghall	59.326428	13.494539	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5a313c50-70d4-42bc-9e08-5e38e94c04cb	Götetorpsvägen	Gata i Skoghall	Skoghall	59.329831	13.48022	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e42faf8a-3429-4915-a758-bc8f7413f695	Nätvägen	Gata i Skoghall	Skoghall	59.333696	13.504427	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
50ad8277-7b43-49e2-997d-addd1944d36b	Abborrvägen	Gata i Skoghall	Skoghall	59.331048	13.50503	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
250a7155-3712-4d94-a88c-aa12c9a873a4	Karlavägen	Gata i Skoghall	Skoghall	59.327748	13.48539	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ca9f2dc1-e4ab-44fb-93d1-ab521c8511d8	Gårdsvägen	Gata i Skoghall	Skoghall	59.335366	13.494139	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c998b639-fe20-4b93-a826-dc28cf3b652d	Hambovägen	Gata i Skoghall	Skoghall	59.341277	13.494459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
71eb8222-b72d-4d46-bf93-88312b78106f	Nolgårdsvägen	Gata i Skoghall	Skoghall	59.341539	13.499244	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1bcdc8fa-717f-4fb2-8b6c-f3f5cd928526	Båtvägen	Gata i Skoghall	Skoghall	59.326723	13.506974	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
038e5c7e-65c7-4132-88fa-2104ba16306a	Åråsvägen	Gata i Skoghall	Skoghall	59.325151	13.466177	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1beedf72-7d48-46ac-86cd-75c641fd68a1	Mörmovägen	Gata i Skoghall	Skoghall	59.323902	13.471691	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2aebde8b-5486-4ecb-b3c9-a6a7ec366a8b	Lunserudsvägen	Gata i Skoghall	Skoghall	59.321853	13.470918	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a99e3c7a-0872-4d18-836b-957d970405c0	Möruddsvägen	Gata i Skoghall	Skoghall	59.316809	13.499277	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
52ee715a-f192-47aa-8dbd-d42cdff6aa3c	Vidövägen	Gata i Skoghall	Skoghall	59.33911	13.453652	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa09086d-f08c-4e52-860b-269c2a991246	Gamla Hovlandavägen	Gata i Skoghall	Skoghall	59.324031	13.477345	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
12351ce1-b0ba-49dc-962e-6a0da7043071	Södra Domarevägen	Gata i Skoghall	Skoghall	59.319096	13.492071	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4af14e33-aca6-4da3-a9e0-6c44fbf7b930	Gyllenflyktsvägen	Gata i Skoghall	Skoghall	59.323724	13.495874	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ff07a61e-1f59-4aa5-8a3d-d327a36bda5d	Börjessonsvägen	Gata i Skoghall	Skoghall	59.321528	13.495475	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b6676ce2-c9dc-4bb0-b733-11e2bd299fe9	Frödingsvägen	Gata i Skoghall	Skoghall	59.32635	13.490367	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c65c5c73-64c6-4ec1-b72d-120b59a8f899	Egnahemsvägen	Gata i Skoghall	Skoghall	59.323183	13.492397	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fa032b0c-d48d-47f7-8082-d6d1c1143f71	Trädgårdsvägen	Gata i Skoghall	Skoghall	59.323532	13.48679	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee790a8c-077f-464d-9e88-e33e40c2f0d3	Lagerlöfsvägen	Gata i Skoghall	Skoghall	59.327716	13.492785	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
57154b2c-3b0f-4f2b-9ed6-0a269b9b9ae2	Turessons väg	Gata i Skoghall	Skoghall	59.327127	13.501239	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7f123fc-a3b9-47e2-9276-6a6205989e7b	Tegnérvägen	Gata i Skoghall	Skoghall	59.328242	13.495251	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
37c71ed9-7ab5-4cf6-b688-8566203633d0	Jonsbolsvägen	Gata i Skoghall	Skoghall	59.324538	13.491962	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4ea73357-1678-4969-9196-2a2a88b86513	Fredsvägen	Gata i Skoghall	Skoghall	59.323749	13.49403	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
507e6a84-fd67-4b72-8e3d-f8f640797d29	Boqvistvägen	Gata i Skoghall	Skoghall	59.325355	13.497968	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df4f9eb7-99b9-422e-a25a-97f857e05289	Vikingavägen	Gata i Skoghall	Skoghall	59.321652	13.48814	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f022fc95-4558-420c-8783-50bd1b75e014	Odenvägen	Gata i Skoghall	Skoghall	59.320288	13.485568	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a6f7cc84-8c75-4c55-b0ec-65e05c6bc10a	Furuvägen	Gata i Skoghall	Skoghall	59.342675	13.455332	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a4628471-0f68-4b64-adda-226823d64f63	Trollvägen	Gata i Skoghall	Skoghall	59.343423	13.45604	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c011bf7-1f6c-4e55-891f-e1a5745a2385	Granvägen	Gata i Skoghall	Skoghall	59.341891	13.453181	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
586b18af-0273-41aa-a77d-92b8f92edbc0	Åsvägen	Gata i Skoghall	Skoghall	59.34134	13.455137	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e3770bf3-c403-4907-a7b2-264a646ac677	Strandvägen	Gata i Skoghall	Skoghall	59.342207	13.451152	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
723fd238-3bbd-466a-be80-16f322292245	Segelvägen	Gata i Skoghall	Skoghall	59.324657	13.504932	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c7a307d3-9a74-48e3-9cac-88cbf4f6aa2b	Karlstadsvägen	Gata i Skoghall	Skoghall	59.333355	13.474285	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2237e39b-395e-41de-ac46-e926704602ca	Rösgärdsvägen	Gata i Skoghall	Skoghall	59.331724	13.44297	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
bd49e2dc-8191-4ab2-a26b-4145eb5df2ee	Prästängsvägen	Gata i Skoghall	Skoghall	59.334234	13.443193	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
70cea223-da5b-4d9a-b084-ebadc0030c09	Rosenborgsvägen	Gata i Skoghall	Skoghall	59.337995	13.504455	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
623b6dbf-2e8d-4969-ba3c-72a7bea49b6e	Vattenverksvägen	Gata i Skoghall	Skoghall	59.320511	13.463381	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8b5d17d5-4fd7-4fab-bcd5-e70a39b7cae7	Wennbergsvägen	Gata i Skoghall	Skoghall	59.322543	13.455626	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
152a1ce1-a5d4-4ef6-98ac-998d8cd62f0f	Edsviksvägen	Gata i Skoghall	Skoghall	59.321095	13.456247	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3bf21876-675c-4296-a165-fe72e2b3646e	Lillstigen	Gata i Skoghall	Skoghall	59.322017	13.456687	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ddcd6c43-924a-409e-911f-91abffefb604	Rölovägen	Gata i Skoghall	Skoghall	59.322506	13.459866	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
46e144a7-235b-4de6-b663-41e855f01062	Gnejsvägen	Gata i Skoghall	Skoghall	59.322019	13.462608	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
26995496-653d-4c31-a6cf-79cc5b88b9f3	Apelstigen	Gata i Skoghall	Skoghall	59.321586	13.459445	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e066d743-2bdb-4a20-8a64-7a5c83c9dd5e	Gröna vägen	Gata i Skoghall	Skoghall	59.320197	13.457433	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86475544-da0e-4219-93d7-ee2acd038195	Bergviksvägen	Gata i Skoghall	Skoghall	59.318849	13.456744	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9b8785fe-9cc7-42e0-8084-84a22ce35bce	Ljungstigen	Gata i Skoghall	Skoghall	59.321077	13.456435	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e617b3c2-6542-4c18-99d3-4ec2e0c8047e	Skolvägen	Gata i Skoghall	Skoghall	59.331137	13.494797	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e277ff3-b7f6-4a30-851f-180d83f94dd9	Bruksgatan	Gata i Skoghall	Skoghall	59.323446	13.459964	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ea0d4a9-4494-47b7-bb48-e9725b816556	Stjärnsforsvägen	Gata i Skoghall	Skoghall	59.319212	13.459618	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15f1e961-d60c-47bc-9c00-c6e074ed56a7	Solgatan	Gata i Skoghall	Skoghall	59.324538	13.47151	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f08a7285-3e8b-4371-ac83-51efb39ba686	Grytuddsvägen	Gata i Skoghall	Skoghall	59.321102	13.459576	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
64c96302-a86e-40b4-b6a5-bd70c5b11f65	Mörtvägen	Gata i Skoghall	Skoghall	59.328119	13.504038	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e86dcc88-0ff7-4040-aa00-9e1e4d76e9ca	Ekebovägen	Gata i Skoghall	Skoghall	59.317672	13.475926	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1c45a2e9-f275-48c3-8ca6-24e40e717bb7	Herleniusvägen	Gata i Skoghall	Skoghall	59.321828	13.475891	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b95184f9-993f-4926-9b8c-07b67f6407e3	Prästgårdsvägen	Gata i Skoghall	Skoghall	59.320972	13.472571	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7bf88d38-c4b1-41c3-b8c6-a7b5b9779006	Spelvägen	Gata i Skoghall	Skoghall	59.328322	13.471945	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
324c058e-5df5-48e4-8b52-92c0c12d2a09	Granitvägen	Gata i Skoghall	Skoghall	59.32112	13.461151	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d78675b-b9f1-4d10-845b-e80ddd1b25b7	Sörviksvägen	Gata i Skoghall	Skoghall	59.320499	13.495261	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8658d4a3-8e75-4b1d-9b65-ec7efe7453d2	Ringvägen	Gata i Skoghall	Skoghall	59.318441	13.495909	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b0112af-d6b9-4ab4-9da6-f2c894e1a021	Gösvägen	Gata i Skoghall	Skoghall	59.33318	13.504719	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
faf2dd70-ac7d-43e3-96d5-c0399e938767	Kvarnvägen	Gata i Skoghall	Skoghall	59.340701	13.503927	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6d48a24e-2d52-4603-b04e-08456102aa78	Badhusgatan	Gata i Skoghall	Skoghall	59.326681	13.465964	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
899c5da6-f2f5-4a2e-a6b2-7bc8d7465c7e	Trätäljavägen	Gata i Skoghall	Skoghall	59.330438	13.484953	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da9d3b14-86db-402c-b1cc-3e97c0f42ebf	Clevevägen	Gata i Skoghall	Skoghall	59.32457	13.469274	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
acdce55f-8931-435b-a563-bcf7326f9bf2	John Erikssonsvägen	Gata i Skoghall	Skoghall	59.324362	13.492217	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
df1a6aa0-ac3c-4b2d-8813-ab27a5dffb31	Flaggvägen	Gata i Skoghall	Skoghall	59.325056	13.493434	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b7b483d8-fa71-48e2-8266-f99af88aff93	Vändgatan	Gata i Skoghall	Skoghall	59.32046	13.471343	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f76a3897-78aa-42d5-b4cd-6562657475ee	Ålkärrsvägen	Gata i Skoghall	Skoghall	59.320972	13.480595	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e1a55aea-03be-4fcd-92d9-fce6fc7ad514	Skoghemsvägen	Gata i Skoghall	Skoghall	59.32161	13.478438	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99cdc7e6-2c62-4db7-b875-1d6feb3bd676	Hesselbomsvägen	Gata i Skoghall	Skoghall	59.325004	13.492764	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f7b9db10-8995-4edf-a28b-1d52facc9d6d	Trumvägen	Gata i Skoghall	Skoghall	59.319593	13.479611	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2eaeeb9-2fdf-460e-abeb-0388d6d7c721	Folkungavägen	Gata i Skoghall	Skoghall	59.321938	13.487338	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
078dfc30-0da6-49c6-b67c-d195ea1cb2eb	Brattvägen	Gata i Skoghall	Skoghall	59.322772	13.476122	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9ec8201a-11e4-49a0-9b60-2b8095843d26	Göterstavägen	Gata i Skoghall	Skoghall	59.324527	13.486876	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c5f48e1e-b82a-4467-9bd7-db2dead2f88e	Torsvägen	Gata i Skoghall	Skoghall	59.321703	13.482834	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c9804d38-022a-4042-ae7a-8224263d7123	Frejvägen	Gata i Skoghall	Skoghall	59.322805	13.481991	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
25076ffe-636f-486c-853c-5ec8042a0ecd	Nygatan	Gata i Skoghall	Skoghall	59.325907	13.464235	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b05be7c8-7b3f-4298-a783-9ba8834f21fa	Hagavägen	Gata i Skoghall	Skoghall	59.321915	13.474681	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7b1b3ff1-f23d-42fc-9a5c-6429d4bb682e	Skogsvägen	Gata i Skoghall	Skoghall	59.319141	13.493198	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4d5af95f-f3bf-49f9-a96e-f13dadfcc8ab	Bergsvägen	Gata i Skoghall	Skoghall	59.319288	13.493707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1db1b406-d87f-483f-8b64-b36ada876f0d	Almquists väg	Gata i Skoghall	Skoghall	59.330154	13.494849	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0dc81f3c-11e3-4885-9b79-57f4ebd0ec3a	Olofsvägen	Gata i Skoghall	Skoghall	59.329289	13.482891	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
683d61b8-5e5b-4995-ac8a-10f0590e2fef	Ferlinvägen	Gata i Skoghall	Skoghall	59.329868	13.499169	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
07020181-6ec8-4673-b701-00e09d724f26	Södra vägen	Gata i Skoghall	Skoghall	59.340647	13.44999	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
4705d1a1-3bba-4897-880b-484b0c3d285c	Fryxellsvägen	Gata i Skoghall	Skoghall	59.330712	13.487056	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
db017558-73e9-4612-9ff1-16803f06b48e	Geijersvägen	Gata i Skoghall	Skoghall	59.33221	13.48827	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd20f740-da95-471c-a297-3e81746e4d52	Gränsvägen	Gata i Skoghall	Skoghall	59.332302	13.488986	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
66e98ae4-4db0-469c-be7d-a0fadf874739	Götavägen	Gata i Skoghall	Skoghall	59.331516	13.495767	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
06738670-2eb4-4a82-ab88-535f5a672496	Hälltorpsvägen	Gata i Skoghall	Skoghall	59.332675	13.490186	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5134553f-120a-447a-a5d1-dbec5c94bc41	Kraftverksvägen	Gata i Skoghall	Skoghall	59.331844	13.497734	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9644f0d0-0149-4352-a3af-0558ea9c6a5a	Mellqvistsvägen	Gata i Skoghall	Skoghall	59.331213	13.491602	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d9942916-8768-4055-81ca-b76e72046b4c	Stjernes väg	Gata i Skoghall	Skoghall	59.332714	13.488987	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7a921b81-8816-443e-8045-2d0efa7988a5	Dahlgrensvägen	Gata i Skoghall	Skoghall	59.328232	13.486834	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd241d67-89dc-4e75-ab6f-d8212a7ae371	Skogåsvägen	Gata i Skoghall	Skoghall	59.323783	13.468411	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1589ea05-4fcd-46d0-b688-fea2a3eafb65	Blommerudsvägen	Gata i Skoghall	Skoghall	59.338478	13.489155	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ab4f0138-2460-46c1-9721-8d54e232ebf3	Malvavägen	Gata i Skoghall	Skoghall	59.337564	13.489789	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
da262ddd-1f88-4329-a556-c6f7acbdfb2d	Tallvägen	Gata i Skoghall	Skoghall	59.319365	13.468962	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c62ad1e-e0c7-44cc-8603-cc51b45b9734	Dahliavägen	Gata i Skoghall	Skoghall	59.339335	13.491564	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e61c422-f112-46fc-86a1-7bcbdf60c489	Nystedts väg	Gata i Skoghall	Skoghall	59.336531	13.50236	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a00c7821-54c1-4bdd-8bd3-b486d55aa41c	Snoavägen	Gata i Skoghall	Skoghall	59.34292	13.497332	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f9d6225-72c4-4d48-8a39-3696119208a7	Mazurkavägen	Gata i Skoghall	Skoghall	59.342186	13.497095	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
02b70344-f237-41ca-aa26-14e04bd1039c	Åkervägen	Gata i Skoghall	Skoghall	59.335672	13.500005	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0fb7452b-921e-447e-bacf-334d4a3befc4	Djupsundsvägen	Gata i Skoghall	Skoghall	59.33774	13.484459	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
3f617c96-343e-4b84-958d-129a4424ec1b	Astervägen	Gata i Skoghall	Skoghall	59.338822	13.487333	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
fe866f74-e269-4b05-9ab3-8ac4d7f99338	Parkvägen	Gata i Skoghall	Skoghall	59.326757	13.483383	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
27fca24a-1e8f-489d-bcee-fd70e11e8153	Solrosvägen	Gata i Skoghall	Skoghall	59.337723	13.488564	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e5c87afd-4023-4329-a935-bbe2fa1ffee1	Vallmovägen	Gata i Skoghall	Skoghall	59.337258	13.486819	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a042718e-3d1f-4890-8602-0e5b1bdad2a6	Pommernvägen	Gata i Skoghall	Skoghall	59.337282	13.49819	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f0fd42bf-deee-4f7a-bbb9-6192b1f09812	Jonsfeltvägen	Gata i Skoghall	Skoghall	59.33616	13.496675	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
cd512ee2-2615-405c-a165-6ed23897d6c5	Fallvägen	Gata i Skoghall	Skoghall	59.336102	13.496041	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7118da22-eb2d-4d37-95cd-06f1bdb7bc60	Gäddvägen	Gata i Skoghall	Skoghall	59.329229	13.504855	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
542012e4-43d6-4dac-bfa4-0649a174889b	Hantverksvägen	Gata i Skoghall	Skoghall	59.333221	13.4735	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1d49621c-769c-4fb0-8c42-83d3c239b77d	Björkhagsgatan	Gata i Skoghall	Skoghall	59.325608	13.467707	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b3306a8f-e5a5-4a2a-9920-5953cdd057fc	Mellanvägen	Gata i Skoghall	Skoghall	59.32131	13.470781	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1e5e3193-46f1-4bbb-b43b-6740f55c4bf9	Södra Killingvägen	Gata i Skoghall	Skoghall	59.331055	13.458245	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6f9a1b9f-c9d4-4a99-9556-7535a77b16a0	Norra Killingvägen	Gata i Skoghall	Skoghall	59.33109	13.454685	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
5128cd3a-2c0c-484e-bfc8-174083a120ce	Schottisvägen	Gata i Skoghall	Skoghall	59.341502	13.492831	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
99168d06-eef5-40a6-901a-2219886530e2	Liljevägen	Gata i Skoghall	Skoghall	59.338889	13.49055	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2c8e67dd-5a63-4826-9bcc-93dd55fe3b8c	Otters väg	Gata i Skoghall	Skoghall	59.336748	13.504287	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b77df86e-676a-4de2-9a1c-dc2db8767cc6	Leglers väg	Gata i Skoghall	Skoghall	59.337399	13.500875	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2dd42585-fdae-4986-b5ce-8a9eddd75cec	Vedspelsvägen	Gata i Skoghall	Skoghall	59.33026	13.473452	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
51583705-9056-4e41-a8f2-4c16279784eb	Slängomvägen	Gata i Skoghall	Skoghall	59.337611	13.491358	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e115b276-b6a3-4022-acaa-7ead5e8eaedd	Lärkvägen	Gata i Skoghall	Skoghall	59.333713	13.450658	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9820dcf6-aae9-4ffa-93df-2fcf1bde0114	Hybelejvägen	Gata i Skoghall	Skoghall	59.335598	13.45076	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f184a00e-6c5d-44bb-903e-cdf1bb27bc4c	Gärdesvägen	Gata i Skoghall	Skoghall	59.323989	13.461358	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2a154453-68c5-4ba5-915b-9ed7a00dbad3	Cederroths väg	Gata i Skoghall	Skoghall	59.327011	13.498429	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c7203e3-1804-4457-aead-5ddb27554b7a	Trumberget	Gata i Skoghall	Skoghall	59.318333	13.47916	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2ebf169a-e432-466b-8105-3213b0bdc8f4	Runavägen	Gata i Skoghall	Skoghall	59.320992	13.490262	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
93edec7c-5a7b-4ae5-bc9b-12e3ba146026	Hamnvägen	Gata i Skoghall	Skoghall	59.317946	13.466449	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
38f16aec-1007-439d-a2a2-811d5a0d83dc	Lunnavägen	Gata i Skoghall	Skoghall	59.323464	13.476199	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
edeae8ec-0856-4d54-a5ea-90216ff84c8e	Rögrindsvägen	Gata i Skoghall	Skoghall	59.326344	13.465175	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9d349615-0c5f-4a8f-9913-25a62ae70f22	Lillängsvägen	Gata i Skoghall	Skoghall	59.321737	13.464275	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
1f9ab094-60da-4623-bbfd-945165bb52e8	Hovlandavägen	Gata i Skoghall	Skoghall	59.322205	13.490298	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
e2c8d816-d805-4c76-9b2b-ed10173f4e24	Åstorpsvägen	Gata i Skoghall	Skoghall	59.326155	13.481331	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
03345fed-4194-47c9-9837-ea578455ce2c	Tangovägen	Gata i Skoghall	Skoghall	59.339473	13.493711	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a2c8082b-bf6f-4150-a9ae-9f1db9f45a34	Villavägen	Gata i Skoghall	Skoghall	59.323337	13.487976	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
726c7517-78d3-4b2b-b280-3dfeec484431	Valsvägen	Gata i Skoghall	Skoghall	59.343365	13.494177	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c5c466c7-e0df-4fe5-87e2-90e0c4b3368f	Skogsparken	Gata i Skoghall	Skoghall	59.318727	13.49043	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0898c521-9204-4cfe-8359-a7316ae78c57	Sturevägen	Gata i Skoghall	Skoghall	59.33078	13.497572	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
545bfb53-9d9d-4e16-bd75-23f2b87c7f32	Linnévägen	Gata i Skoghall	Skoghall	59.321767	13.451963	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
81210b26-838f-4647-aebd-7ef5aa935de1	Sveavägen	Gata i Skoghall	Skoghall	59.330821	13.495138	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
35e0b8c1-3b23-4662-b7a0-7c0a280bc9db	Lysvik	Offentlig plats i Lysvik	Lysvik	60.015846	13.137735	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
7ad3f633-db2c-4e88-97f7-e0b881de3085	Coop Nära	Butik i Lysvik	Lysvik	60.014855	13.133277	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
4b73a2d5-a91d-491d-b39d-762b10353d47	Mormors Glasscafé	Café/restaurang i Lysvik	Lysvik	60.013069	13.133472	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
48a46ce5-7918-4aa2-8424-7533a02ac6bb	Frykens Pärla	Café/restaurang i Lysvik	Lysvik	60.014683	13.125379	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
beb9a0fb-c936-4f9f-ba97-1b464da240ec	Berga gård	Sevärdhet i Lysvik	Lysvik	60.024588	13.12367	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
e553eb15-84cd-4c68-b452-bb9c5c8f2a77	Lysviks kyrka	Kyrka i Lysvik	Lysvik	60.014512	13.132567	kyrka	12	70	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
c0a132e5-c220-48b0-8475-41412ae4a0a5	Lysviks camping	Natur/park i Lysvik	Lysvik	60.014131	13.128229	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
fc924ff8-b05f-423d-aa23-66f861ab0752	Gamla vägen	Gata i Lysvik	Lysvik	60.015646	13.131672	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f591650b-1a89-4cc0-95ef-9c13f0bd5762	Myringbyvägen	Gata i Lysvik	Lysvik	60.01789	13.135019	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
2bae3868-f145-4912-b68a-c620aaf79e34	Stationsvägen	Gata i Lysvik	Lysvik	60.016392	13.13473	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ecb8ea7e-25ce-424d-a909-c461657faa31	Mejerivägen	Gata i Lysvik	Lysvik	60.009974	13.140091	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
0d20fad6-53af-41bd-9cfd-1e3c669acc57	Högbyvägen	Gata i Lysvik	Lysvik	60.016384	13.140104	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
86f3e92c-f56d-4fcc-b02e-b83863b346d4	Ordensvägen	Gata i Lysvik	Lysvik	60.012724	13.137539	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
865ccac4-aa50-47a1-a61d-331746ebe354	Smedstigen	Gata i Lysvik	Lysvik	60.015704	13.128492	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d6aa001d-aadd-4c26-81f7-2e83cbe675f4	Sjöviksvägen	Gata i Lysvik	Lysvik	60.018585	13.134828	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a8cebf77-8479-425d-a602-a5ede2663f72	Klockarevägen	Gata i Lysvik	Lysvik	60.016632	13.134385	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
9fdadc79-826f-43fc-a6ac-dde53e37ca60	Strandvägen	Gata i Lysvik	Lysvik	60.014945	13.129549	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f5bb2200-f0ea-4a3a-8b22-f8975a9f85d8	Kyrkbyvägen	Gata i Lysvik	Lysvik	60.015743	13.142283	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
8c2b2f77-664d-4980-bcbd-db2327010bc5	Blomvägen	Gata i Lysvik	Lysvik	60.011631	13.13773	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
58257a11-f781-4994-bf8b-2b424b719165	Genvägen	Gata i Lysvik	Lysvik	60.013759	13.136843	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
068245b7-a83a-43da-b9db-f3f8c18accb3	Eriksbergsvägen	Gata i Lysvik	Lysvik	60.018806	13.137935	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
db417e19-984d-4add-a2d7-362ed1ed8a2e	Holmtjärnsvägen	Gata i Lysvik	Lysvik	60.078951	13.212437	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
7615a0ce-30bb-4d95-8fce-4f9e7c734792	Prostvägen	Gata i Lysvik	Lysvik	60.020222	13.134943	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c04305c8-5795-42ef-9b17-d6904dbf8e29	Eriksbergsbacken	Gata i Lysvik	Lysvik	60.018643	13.138739	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
71a6491e-4762-442a-aed0-4b6e3769dc2f	Sågstigen	Gata i Lysvik	Lysvik	60.017318	13.128884	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
15414a19-fc2a-4a02-8c71-47cd5c3c7477	Barnens väg	Gata i Lysvik	Lysvik	60.015546	13.136893	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
44e58a38-83aa-4b85-8be3-76a40193218d	Rottneros herrgård	Historisk plats i Rottneros	Rottneros	59.798314	13.127699	historisk	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2c19d65-0049-4961-9f1d-a80133b91f56	Berättarladan	Sevärdhet i Rottneros	Rottneros	59.801571	13.127097	landmärke	12	60	50	vanlig	f	t	2026-10-06 18:07:57.653545+00
ee658ccc-e72f-4bc8-a779-758fb1dbe750	Rottneros	Offentlig plats i Rottneros	Rottneros	59.795141	13.128724	offentligt	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
5e1a9650-a052-4e05-9f2b-e7a3d3a58338	Stamfrändemonumentet	Sevärdhet i Rottneros	Rottneros	59.807592	13.126565	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d21c89c-539e-485b-b1d6-96df002d7d2e	Värdshuset Nils Holgersson	Café/restaurang i Rottneros	Rottneros	59.807555	13.127241	mat	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
5d8fa000-578d-40cf-a4c7-9bcce12fca4b	Golf Store	Butik i Rottneros	Rottneros	59.807437	13.127079	butik	8	40	30	vanlig	f	t	2026-10-06 18:07:57.653545+00
92393af3-e973-4e6c-a379-492dbf53b7d8	Ominne Hide A Way Exclusive	Sevärdhet i Rottneros	Rottneros	59.782167	13.127982	landmärke	10	60	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
70756157-055a-48a8-a372-dfaab70d3595	Sånebyklätten	Natur/park i Rottneros	Rottneros	59.776224	13.113266	natur	10	100	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
d66bd83d-8c84-4ec5-b306-e1046f61d18a	Rottneros Park	Sevärdhet i Rottneros	Rottneros	59.798007	13.127398	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
c2878a52-4942-4940-9972-bb211395671c	Orfeusgruppen	Sevärdhet i Rottneros	Rottneros	59.79926	13.126277	landmärke	15	70	60	vanlig	f	t	2026-10-06 18:07:57.653545+00
65e28b07-6ecd-47de-9fa9-d639335affb3	Rottneros skola	Skola i Rottneros	Rottneros	59.790691	13.10087	skola	10	70	40	vanlig	f	t	2026-10-06 18:07:57.653545+00
40f858f0-0e7a-44c1-8e7e-9bcafde175c6	Sunne GK	Sport & fritid i Rottneros	Rottneros	59.80975	13.127706	sport	10	80	45	vanlig	f	t	2026-10-06 18:07:57.653545+00
31de1a45-e0d1-4c9a-9445-29f962260adf	Parkvägen	Gata i Rottneros	Rottneros	59.792881	13.111937	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
96cdd964-c8a8-48b1-bd71-30364407bccf	Rottnavägen	Gata i Rottneros	Rottneros	59.791943	13.113923	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
aa2ff815-ce0f-4e71-a616-dc716f2720e6	Höglundavägen	Gata i Rottneros	Rottneros	59.792916	13.115767	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
a1bedd2b-c56f-4393-9ce3-a6d8f03c2153	Lindvägen	Gata i Rottneros	Rottneros	59.790939	13.106646	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd0b8c03-6b32-4695-9a2d-9cd2968a6ae4	Linbanevägen	Gata i Rottneros	Rottneros	59.793345	13.1205	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
6a54a19e-35b1-4e3b-9584-10d3453cab14	Frykenvägen	Gata i Rottneros	Rottneros	59.79031	13.110443	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
f8d4e397-1df5-4bf4-99e0-02c51fd1717b	Bergvägen	Gata i Rottneros	Rottneros	59.79078	13.112033	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b2572ac3-f99e-4113-abc5-6aa7b857fe99	Kvarnvägen	Gata i Rottneros	Rottneros	59.79082	13.108772	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
dd24c0ee-709c-406a-97ef-b974608818f9	Skogsvägen	Gata i Rottneros	Rottneros	59.790492	13.114394	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
b4a31b5b-4eed-4fcb-83ad-be3f5a9bbee7	Egnahemsvägen	Gata i Rottneros	Rottneros	59.790545	13.109248	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
713444a0-b128-4e58-ad3b-0048138c142f	Öjerdalsvägen	Gata i Rottneros	Rottneros	59.789827	13.11096	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
d31dbd19-a404-44ca-8fd0-5d71cf2a42b5	Arnebyvägen	Gata i Rottneros	Rottneros	59.784008	13.106136	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
c3b40516-9d4e-4f8b-9765-45fed7e1508c	Skolvägen	Gata i Rottneros	Rottneros	59.790796	13.102951	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
ec9e80e3-8e65-4d57-ab2a-3c319c04c6f5	Ekebyvallen	Gata i Rottneros	Rottneros	59.791063	13.092301	gata	5	40	25	vanlig	f	t	2026-10-06 18:07:57.653545+00
\.


ALTER TABLE public.locations ENABLE TRIGGER ALL;

--
-- Data for Name: discoveries; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.discoveries DISABLE TRIGGER ALL;

COPY public.discoveries (id, user_id, location_id, created_at) FROM stdin;
\.


ALTER TABLE public.discoveries ENABLE TRIGGER ALL;

--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.events DISABLE TRIGGER ALL;

COPY public.events (id, title, description, city, sponsor, lat, lng, radius_m, xp_reward, coin_reward, starts_at, ends_at, active, created_at) FROM stdin;
\.


ALTER TABLE public.events ENABLE TRIGGER ALL;

--
-- Data for Name: event_checkins; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.event_checkins DISABLE TRIGGER ALL;

COPY public.event_checkins (event_id, user_id, created_at) FROM stdin;
\.


ALTER TABLE public.event_checkins ENABLE TRIGGER ALL;

--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.friendships DISABLE TRIGGER ALL;

COPY public.friendships (id, requester, addressee, status, created_at) FROM stdin;
d551340a-f3a6-4ad9-9421-2754e789b1a6	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	1230ab95-18da-454f-9058-83978e7fa478	accepted	2026-10-06 17:44:49.629499+00
\.


ALTER TABLE public.friendships ENABLE TRIGGER ALL;

--
-- Data for Name: game_config; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.game_config DISABLE TRIGGER ALL;

COPY public.game_config (key, value, label) FROM stdin;
parcel_min_level	1	Lägsta nivå för att ta mark
parcel_coins_per_hour	1	Coins per timme per mark
parcel_max_hours	24	Max timmar att samla i taget
parcel_claim_radius_m	150	Avstånd för att ta mark (m)
discovery_gps_buffer_m	30	GPS-marginal vid upptäckt (m)
daily_reward_coins	20	Daglig belöning (coins)
daily_reward_xp	10	Daglig belöning (XP)
max_speed_kmh	200	Max hastighet mellan handlingar (km/h)
invite_reward_coins	100	Coins till båda vid inbjudan
challenge_reward_coins	75	Coins till vinnaren av en utmaning
challenge_days	7	Längd på utmaningar (dagar)
team_max_members	20	Max medlemmar per lag
parcel_claim_cost	50	Kostnad för att ta mark (coins)
parcel_claim_xp	15	XP för att ta mark
max_discoveries_per_day	60	Max upptäckter per dag (fusk-skydd)
max_qr_per_day	10	Max QR-skanningar per dag
payments_enabled	0	Betalningar (avstängt i v1 – ändra ej)
\.


ALTER TABLE public.game_config ENABLE TRIGGER ALL;

--
-- Data for Name: shop_items; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.shop_items DISABLE TRIGGER ALL;

COPY public.shop_items (id, name, kind, value, price, active, sort) FROM stdin;
8e051346-a957-4498-b073-6e3ad7afa30c	Räv	avatar	🦊	150	t	1
530ffbb0-aa5c-4ef5-a693-17f4bb86834e	Älg	avatar	🫎	250	t	2
a2df531e-082e-4a0b-8a12-206201b2e6b5	Varg	avatar	🐺	300	t	3
89b3500c-6475-4211-8df0-aa660c1d688b	Uggla	avatar	🦉	200	t	4
4c3e317e-6478-4dd4-90c4-e9d2843e4c5b	Norrsken	avatar	🌌	500	t	5
2f9816f5-acd4-4db1-9f8f-5be42eda82b1	Krona	avatar	👑	1000	t	6
24bc3cbf-cdf1-47b4-9feb-76f184307d56	Upptäckare	title	Upptäckare	200	t	10
0c381bc0-d7bd-4ca3-a69b-20c3b448043f	Värmlänning	title	Värmlänning	300	t	11
15126fcd-015e-4e60-aea3-ae127de1eb1c	Stigfinnare	title	Stigfinnare	400	t	12
43c010f2-6f07-406f-87e8-ca2db7d73859	Kartmästare	title	Kartmästare	800	t	13
fcdc5c83-8910-4436-a0b6-176eb08f9142	Legend	title	Legend	2000	t	14
\.


ALTER TABLE public.shop_items ENABLE TRIGGER ALL;

--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.inventory DISABLE TRIGGER ALL;

COPY public.inventory (user_id, item_id, created_at) FROM stdin;
\.


ALTER TABLE public.inventory ENABLE TRIGGER ALL;

--
-- Data for Name: missions; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.missions DISABLE TRIGGER ALL;

COPY public.missions (id, title, description, period, metric, target, xp_reward, coin_reward, active) FROM stdin;
64d33c66-2fab-4d3a-90c9-8de294f56e9d	Dagens upptäckt	Upptäck 1 plats idag	daily	discover	1	40	10	t
6707ed0d-abec-4c21-9a3a-d2e0b8176b24	Hämta skörden	Samla in coins från din mark	daily	collect	1	20	5	t
c6ba1aaf-7e51-44eb-89d8-fde27fef1067	Logga in	Hämta din dagliga belöning	daily	daily	1	15	5	t
d53150d9-4e25-4fc2-a0df-fe787af6055c	Veckans utforskare	Upptäck 5 platser denna vecka	weekly	discover	5	200	50	t
ff29d0f0-96ca-473c-98da-f728f9e90538	Markägare	Ta 3 bitar spelmark denna vecka	weekly	claim	3	150	40	t
\.


ALTER TABLE public.missions ENABLE TRIGGER ALL;

--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.notifications DISABLE TRIGGER ALL;

COPY public.notifications (id, user_id, title, body, read, created_at) FROM stdin;
a8265933-271b-4249-b14f-b164a9ad0425	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	QR-bonus!	Tack för att du spelar: +25 coins	f	2026-10-06 18:43:41.421974+00
\.


ALTER TABLE public.notifications ENABLE TRIGGER ALL;

--
-- Data for Name: parcels; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.parcels DISABLE TRIGGER ALL;

COPY public.parcels (cell_id, owner_id, lat, lng, level, claimed_at, last_collected_at) FROM stdin;
59803:6552	1230ab95-18da-454f-9058-83978e7fa478	59.8035	13.105	1	2026-10-06 17:35:01.449732+00	2026-10-06 18:40:21.413737+00
59804:6552	1230ab95-18da-454f-9058-83978e7fa478	59.8045	13.105	1	2026-10-06 18:11:47.767315+00	2026-10-06 18:40:21.413737+00
59804:6553	1230ab95-18da-454f-9058-83978e7fa478	59.8045	13.107	1	2026-10-06 18:12:54.445825+00	2026-10-06 18:40:21.413737+00
59803:6553	1230ab95-18da-454f-9058-83978e7fa478	59.8035	13.107	1	2026-10-06 18:13:00.844571+00	2026-10-06 18:40:21.413737+00
59802:6552	1230ab95-18da-454f-9058-83978e7fa478	59.8025	13.105	1	2026-10-06 18:13:18.074057+00	2026-10-06 18:40:21.413737+00
\.


ALTER TABLE public.parcels ENABLE TRIGGER ALL;

--
-- Data for Name: player_achievements; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.player_achievements DISABLE TRIGGER ALL;

COPY public.player_achievements (user_id, code, unlocked_at) FROM stdin;
1230ab95-18da-454f-9058-83978e7fa478	first_parcel	2026-10-06 17:35:01.449732+00
\.


ALTER TABLE public.player_achievements ENABLE TRIGGER ALL;

--
-- Data for Name: player_missions; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.player_missions DISABLE TRIGGER ALL;

COPY public.player_missions (id, user_id, mission_id, period_key, progress, claimed) FROM stdin;
a394eccf-5979-4666-868b-73ddeed60ef5	1230ab95-18da-454f-9058-83978e7fa478	c6ba1aaf-7e51-44eb-89d8-fde27fef1067	2026-10-06	1	t
bae15deb-f1b9-4644-a987-da68737b7cac	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	c6ba1aaf-7e51-44eb-89d8-fde27fef1067	2026-10-06	1	f
799b3264-5155-4186-a8c9-cca15ccda0f6	1230ab95-18da-454f-9058-83978e7fa478	ff29d0f0-96ca-473c-98da-f728f9e90538	2026-W41	3	f
b1ab08f1-e067-4148-a387-11d00c91eca4	1230ab95-18da-454f-9058-83978e7fa478	6707ed0d-abec-4c21-9a3a-d2e0b8176b24	2026-10-06	1	f
\.


ALTER TABLE public.player_missions ENABLE TRIGGER ALL;

--
-- Data for Name: qr_codes; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.qr_codes DISABLE TRIGGER ALL;

COPY public.qr_codes (id, code, label, xp_reward, coin_reward, max_uses, uses, active, created_at) FROM stdin;
44f59763-d0a5-4b26-98eb-00db26cb314b	TJENNAA	Tack för att du spelar	50	25	500	1	t	2026-10-06 18:42:50.432761+00
\.


ALTER TABLE public.qr_codes ENABLE TRIGGER ALL;

--
-- Data for Name: qr_redemptions; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.qr_redemptions DISABLE TRIGGER ALL;

COPY public.qr_redemptions (code_id, user_id, created_at) FROM stdin;
44f59763-d0a5-4b26-98eb-00db26cb314b	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	2026-10-06 18:43:41.421974+00
\.


ALTER TABLE public.qr_redemptions ENABLE TRIGGER ALL;

--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.teams DISABLE TRIGGER ALL;

COPY public.teams (id, name, emoji, owner_id, created_at) FROM stdin;
\.


ALTER TABLE public.teams ENABLE TRIGGER ALL;

--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.team_members DISABLE TRIGGER ALL;

COPY public.team_members (team_id, user_id, joined_at) FROM stdin;
\.


ALTER TABLE public.team_members ENABLE TRIGGER ALL;

--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.user_roles DISABLE TRIGGER ALL;

COPY public.user_roles (id, user_id, role) FROM stdin;
a81a9a6f-e765-4a23-85da-b88a045f3edf	1230ab95-18da-454f-9058-83978e7fa478	user
38b03ec4-599d-4d3e-92b1-7089d83235fd	1230ab95-18da-454f-9058-83978e7fa478	admin
648c40c5-ad47-49b7-97d1-a2953eb254f7	1230ab95-18da-454f-9058-83978e7fa478	founder
b04092c6-f11d-45f7-aa87-8c9f5d956fd6	386fdfc8-2396-4407-b5e5-0b4baa5b58b6	user
\.


ALTER TABLE public.user_roles ENABLE TRIGGER ALL;

--
-- Name: cheat_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cheat_flags_id_seq', 1, false);


--
-- Name: coin_ledger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coin_ledger_id_seq', 11, true);


--
-- PostgreSQL database dump complete
--

\unrestrict gKZrMLvAueALExrZODKxyfQTvo1LnrT2NfkQeOIes6hhnDdyqxKv3HzOaFWlF6t

set session_replication_role = origin;

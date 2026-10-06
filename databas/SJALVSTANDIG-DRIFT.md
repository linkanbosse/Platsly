# PLATSLY utan Lovable – gratis, steg för steg

Du behöver tre gratiskonton: **GitHub** (koden), **Supabase** (databas + inloggning), **Vercel** (webbadressen).

## 1. Koden till GitHub
1. Skapa konto på github.com.
2. I Lovable: **+**-menyn i chatten → **GitHub** → **Connect project** → **Create repository**.
   Nu ligger all kod i ditt GitHub-repo och uppdateras automatiskt.

## 2. Egen databas (Supabase, gratis)
1. Skapa konto på supabase.com → **New project** (region: Stockholm/EU). Spara lösenordet.
2. Öppna **SQL Editor** → klistra in hela `platsly-schema.sql` → **Run**.
3. Ny fråga → klistra in `platsly-data.sql` → **Run** (platser, inställningar, butik, uppdrag m.m.).
4. **Authentication → Providers**: E-post är på. För Google: slå på Google och följ Supabase-guiden (Google Cloud → OAuth-klient, gratis).
5. **Authentication → URL Configuration**: Site URL = din Vercel-adress (steg 3).
6. **Project Settings → API**: kopiera *Project URL*, *publishable/anon key* och *service_role key*.

> Spelarkonton (lösenord) kan inte flyttas härifrån. Spelare skapar nytt konto en gång.
> Vill du flytta konton också: i Lovable, **Cloud → Advanced settings → Export data**.
> Admin åt dig efter att du registrerat dig: i SQL Editor kör
> `insert into user_roles (user_id, role) select id,'admin' from auth.users where email='DIN@MAIL';`

## 3. Webbadress (Vercel, gratis)
1. Skapa konto på vercel.com med ditt GitHub-konto → **Add New → Project** → välj repot.
2. **Build Command:** `bun run build:standalone`  **Install Command:** `bun install`
3. **Environment Variables:**
   - `VITE_SUPABASE_URL` och `SUPABASE_URL` = Project URL
   - `VITE_SUPABASE_PUBLISHABLE_KEY` och `SUPABASE_PUBLISHABLE_KEY` = publishable/anon key
   - `VITE_SUPABASE_PROJECT_ID` = projekt-id (delen före .supabase.co)
   - `SUPABASE_SERVICE_ROLE_KEY` = service_role key (hemlig!)
4. **Deploy**. Du får t.ex. `platsly.vercel.app`.

(Cloudflare Pages fungerar också: sätt env-variabeln `NITRO_PRESET=cloudflare_pages`.)

## 4. Android-appen
I Android-projektet (CodeAssist/Capacitor), byt adressen `szwproduktion.lovable.app` mot din nya Vercel-adress och bygg om.

## Bra att veta
- Allt ovan ryms i gratisnivåerna för ett litet/medelstort spel.
- Supabase gratisprojekt pausas efter 7 dagar utan aktivitet – öppna appen så vaknar det (eller logga in på supabase.com).

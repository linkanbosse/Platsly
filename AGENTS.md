<!-- LOVABLE:BEGIN -->
> [!IMPORTANT]
> This project is connected to [Lovable](https://lovable.dev). Avoid rewriting
> published git history — force pushing, or rebasing/amending/squashing commits
> that are already pushed — as it rewrites history on Lovable's side and the
> user will likely lose their project history.
>
> Commits you push to the connected branch sync back to Lovable and show up in
> the editor, so keep the branch in a working state.
<!-- LOVABLE:END -->

## Architecture rules
- Game economy changes (discover, claim, collect, daily, missions) run only in security-definer SQL functions executable by service_role, called from auth-checked server functions in src/lib/game.functions.ts — the browser never writes balances.
- Sweden geofence lives in src/lib/sweden.ts and is checked both client-side and in server functions; SQL re-checks distance and travel speed.
- Parcels are grid cells keyed "latIdx:lngIdx" (lat step 0.001, lng step 0.002), matching between src/lib/game.ts and SQL game_claim.
- Tunable game values live in the game_config table, not in code.
- Social actions (friends, teams, challenges, invites) run only in security-definer social_* SQL functions called from auth-checked server functions in src/lib/social.functions.ts — same server-authoritative rule as the game economy.
- Category symbols share the browser-safe CategoryIcon component between map markers and lists so location types stay visually consistent.
- Leaflet markers use shared SVG geometry and DOM nodes, never react-dom/server in client code; late server-renderer optimization can split React dispatchers in the preview.
- Admin views use existing auth-checked actions and RLS-protected reads; presentation changes must not introduce direct browser writes or bypass role checks.
- Live content (events, QR, shop, notifications) and admin live/analytics actions run in security-definer live_*/shop_*/admin_* SQL functions called from src/lib/live.functions.ts; admin role is re-checked in SQL.
- QR codes are deep links to /live?kod=CODE so any phone camera works without an in-app scanner.
- PWA is manifest-only (no service worker) to avoid stale caches in the preview.
- Android APK is a Capacitor 7 wrapper (appId com.swz.production.platsly, remote WebView loading the stable production URL project--9683755e-28f6-424e-b671-79f3e1afffa4.lovable.app, location permissions + runtime request in MainActivity); the wrapper project lives outside the repo and is rebuilt per https://capacitorjs.com docs with Java 21, not stored in /tmp-persistent state.

- Standalone hosting uses vite.config.standalone.ts (no Lovable packages) via `bun run build:standalone`; Google sign-in falls back to plain Supabase OAuth off Lovable hosts. Why: lets the game run from GitHub on free hosting.

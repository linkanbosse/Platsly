# PLATSLY 🇸🇪

PLATSLY är ett fristående svenskt plats- och utforskningsspel byggt med TanStack Start, React, TypeScript, Tailwind CSS och Supabase.

## Utveckling

```sh
bun install
bun run dev
```

## Produktion

```sh
bun run build
```

## Supabase

Sätt följande miljövariabler i deploymentmiljön:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_PUBLISHABLE_KEY`

För serverfunktioner kan motsvarande `SUPABASE_URL` och `SUPABASE_PUBLISHABLE_KEY` användas. Använd aldrig en secret/service-role-nyckel i webbläsaren.

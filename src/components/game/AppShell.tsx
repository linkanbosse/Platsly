import { Link } from "@tanstack/react-router";
import { Home, Map, Target, Trophy, User } from "lucide-react";
import type { ReactNode } from "react";

const tabs = [
  { to: "/hem", label: "Hem", icon: Home },
  { to: "/karta", label: "Karta", icon: Map },
  { to: "/uppdrag", label: "Uppdrag", icon: Target },
  { to: "/topplista", label: "Topplista", icon: Trophy },
  { to: "/profil", label: "Profil", icon: User },
] as const;

export function AppShell({ children, flush = false, wide = false }: { children: ReactNode; flush?: boolean; wide?: boolean }) {
  return (
    <div className={`mx-auto flex min-h-dvh flex-col ${wide ? "max-w-5xl" : "max-w-md"}`}>
      <main className={flush ? "relative flex-1" : "flex-1 px-4 pt-safe pb-28"}>{children}</main>
      <nav aria-label="Huvudmeny" className="game-navigation fixed inset-x-0 bottom-0 z-[1000] mx-auto max-w-md pb-safe">
        <ul className="grid grid-cols-5 px-2 pt-2">
          {tabs.map(({ to, label, icon: Icon }) => (
            <li key={to}>
              <Link
                to={to}
                className="game-nav-link flex min-h-14 flex-col items-center justify-center gap-1 text-[10px] font-bold text-muted-foreground transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring"
                activeProps={{ className: "game-nav-selected text-primary", "aria-current": "page" }}
              >
                <span className="game-nav-symbol"><Icon className="size-5" strokeWidth={1.8} /></span>
                {label}
              </Link>
            </li>
          ))}
        </ul>
      </nav>
    </div>
  );
}

export function PageTitle({ children, sub }: { children: ReactNode; sub?: ReactNode }) {
  return (
    <header className="mb-5 animate-rise">
      <h1 className="text-3xl font-bold">{children}</h1>
      {sub && <p className="mt-1 text-muted-foreground">{sub}</p>}
    </header>
  );
}

export function Card({ children, className = "" }: { children: ReactNode; className?: string }) {
  return <section className={`glass rounded-3xl p-4 animate-rise ${className}`}>{children}</section>;
}

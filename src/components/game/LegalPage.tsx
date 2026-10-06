import { Link } from "@tanstack/react-router";
import type { ReactNode } from "react";

export function LegalPage({ title, children }: { title: string; children: ReactNode }) {
  return (
    <div className="mx-auto max-w-md px-5 pt-safe pb-16">
      <Link to="/" className="text-sm font-semibold text-primary">← PLATSLY</Link>
      <h1 className="mt-4 mb-6 text-3xl font-bold">{title}</h1>
      <div className="space-y-4 leading-relaxed text-muted-foreground [&_h2]:mt-6 [&_h2]:text-lg [&_h2]:font-bold [&_h2]:text-foreground">
        {children}
      </div>
      <nav className="mt-10 flex gap-4 text-sm text-primary">
        <Link to="/villkor">Villkor</Link>
        <Link to="/integritet">Integritet</Link>
        <Link to="/spelvaluta">Spelvaluta</Link>
      </nav>
    </div>
  );
}

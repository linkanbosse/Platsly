import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { useEffect } from "react";
import { Bell } from "lucide-react";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { useGameAction } from "@/components/game/useGameAction";
import { readAllNotifications } from "@/lib/live.functions";
import { notificationsQuery } from "@/lib/queries";

export const Route = createFileRoute("/_authenticated/notiser")({
  head: () => ({ meta: [
    { title: "Notiser — PLATSLY" },
    { name: "description", content: "Dina senaste händelser och belöningar i PLATSLY." },
    { property: "og:title", content: "Notiser — PLATSLY" },
    { property: "og:description", content: "Händelser och belöningar." },
    { property: "og:type", content: "website" }, { name: "twitter:card", content: "summary_large_image" },
  ] }),
  component: Notices,
});

function Notices() {
  const { data } = useQuery(notificationsQuery);
  const { run } = useGameAction();
  const readAll = useServerFn(readAllNotifications);
  const unread = data?.some((n) => !n.read);
  useEffect(() => { if (unread) void run(() => readAll()); }, [unread]); // eslint-disable-line react-hooks/exhaustive-deps
  return (
    <AppShell>
      <PageTitle sub="Senaste händelserna">Notiser</PageTitle>
      <div className="space-y-2">
        {data?.length === 0 && <Card><p className="text-center text-muted-foreground">Inga notiser än.</p></Card>}
        {data?.map((n) => (
          <Card key={n.id} className={n.read ? "" : "border border-primary/40"}>
            <div className="flex gap-3">
              <span className="icon-well shrink-0 text-primary"><Bell /></span>
              <div>
                <p className="font-bold">{n.title}</p>
                {n.body && <p className="text-sm text-muted-foreground">{n.body}</p>}
                <p className="mt-1 text-xs text-muted-foreground">{new Date(n.created_at).toLocaleString("sv-SE", { dateStyle: "short", timeStyle: "short" })}</p>
              </div>
            </div>
          </Card>
        ))}
      </div>
    </AppShell>
  );
}

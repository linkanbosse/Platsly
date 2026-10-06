import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useServerFn } from "@tanstack/react-start";
import { Coins, Check } from "lucide-react";
import { toast } from "sonner";
import { AppShell, Card, PageTitle } from "@/components/game/AppShell";
import { useGameAction } from "@/components/game/useGameAction";
import { Button } from "@/components/ui/button";
import { supabase } from "@/integrations/supabase/client";
import { buyItem, equipItem } from "@/lib/live.functions";
import { profileQuery } from "@/lib/queries";
import { fmt } from "@/lib/game";

export const Route = createFileRoute("/_authenticated/butik")({
  head: () => ({ meta: [
    { title: "Butik — PLATSLY" },
    { name: "description", content: "Lås upp avatarer och titlar med spelmynt." },
    { property: "og:title", content: "Butik — PLATSLY" },
    { property: "og:description", content: "Kosmetiska föremål för dina coins." },
    { property: "og:type", content: "website" }, { name: "twitter:card", content: "summary_large_image" },
  ] }),
  component: Shop,
});

function Shop() {
  const { data: p } = useQuery(profileQuery);
  const { run, busy } = useGameAction();
  const buy = useServerFn(buyItem), equip = useServerFn(equipItem);
  const items = useQuery({ queryKey: ["shop"], queryFn: async () => {
    const [{ data: it }, { data: inv }] = await Promise.all([
      supabase.from("shop_items").select("*").eq("active", true).order("sort"),
      supabase.from("inventory").select("item_id"),
    ]);
    const owned = new Set((inv ?? []).map((i) => i.item_id));
    return (it ?? []).map((i) => ({ ...i, owned: owned.has(i.id) }));
  } });
  const groups = [{ kind: "avatar", label: "Avatarer" }, { kind: "title", label: "Titlar" }];
  return (
    <AppShell>
      <PageTitle sub={<span className="flex items-center gap-1"><Coins className="size-4 text-gold" />{fmt(p?.coins ?? 0)} coins</span>}>Butik</PageTitle>
      {groups.map((g) => (
        <section key={g.kind} className="mb-6">
          <h2 className="mb-3 font-bold">{g.label}</h2>
          <div className="grid grid-cols-2 gap-3">
            {items.data?.filter((i) => i.kind === g.kind).map((i) => {
              const active = i.kind === "avatar" ? p?.avatar_emoji === i.value : p?.title === i.value;
              return (
                <Card key={i.id} className="flex flex-col items-center gap-2 text-center">
                  <span className={i.kind === "avatar" ? "text-4xl" : "rounded-full bg-primary/10 px-3 py-1 text-sm font-bold text-primary"}>{i.value}</span>
                  <span className="text-sm font-semibold">{i.name}</span>
                  {i.owned ? (
                    <Button size="sm" variant={active ? "secondary" : "outline"} className="w-full" disabled={busy || active}
                      onClick={() => run(() => equip({ data: { id: i.id } }), () => toast.success("Använder " + i.name))}>
                      {active ? <><Check />Används</> : "Använd"}
                    </Button>
                  ) : (
                    <Button size="sm" className="w-full" disabled={busy || (p?.coins ?? 0) < i.price}
                      onClick={() => run(() => buy({ data: { id: i.id } }), () => toast.success(i.name + " upplåst!"))}>
                      <Coins />{fmt(i.price)}
                    </Button>
                  )}
                </Card>
              );
            })}
          </div>
        </section>
      ))}
    </AppShell>
  );
}

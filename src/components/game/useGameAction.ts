import { useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { toast } from "sonner";

type Result = { ok: true; data?: unknown } | { ok: false; error: string };

export function useGameAction() {
  const qc = useQueryClient();
  const [busy, setBusy] = useState(false);
  async function run<T extends Result>(fn: () => Promise<T>, onOk?: (r: T) => void) {
    if (busy) return;
    setBusy(true);
    try {
      const r = await fn();
      if (!r.ok) toast.error(r.error);
      else onOk?.(r);
      await qc.invalidateQueries();
    } catch (e) {
      toast.error(e instanceof Error ? e.message : "Något gick fel. Försök igen.");
    } finally {
      setBusy(false);
    }
  }
  return { run, busy };
}

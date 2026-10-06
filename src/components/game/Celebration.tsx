import { Button } from "@/components/ui/button";

export type CelebrationData = { title: string; subtitle?: string; xp?: number; coins?: number; icon?: string };

export function Celebration({ data, onClose }: { data: CelebrationData | null; onClose: () => void }) {
  if (!data) return null;
  return (
    <div className="fixed inset-0 z-[2000] flex items-center justify-center bg-background/80 p-6 backdrop-blur-md" onClick={onClose}>
      <div className="glass w-full max-w-sm rounded-[2rem] p-8 text-center shadow-glow animate-pop" onClick={(e) => e.stopPropagation()}>
        <div className="mb-3 text-6xl">{data.icon ?? "🎉"}</div>
        <h2 className="bg-aurora bg-clip-text text-3xl font-extrabold text-transparent">{data.title}</h2>
        {data.subtitle && <p className="mt-2 text-lg font-semibold">{data.subtitle}</p>}
        <div className="mt-5 flex justify-center gap-3">
          {!!data.xp && <span className="rounded-full bg-primary/15 px-4 py-2 font-bold text-primary">+{data.xp} XP</span>}
          {!!data.coins && <span className="rounded-full bg-gold/15 px-4 py-2 font-bold text-gold">+{data.coins} 💰</span>}
        </div>
        <Button className="mt-6 h-12 w-full rounded-2xl text-base font-bold" onClick={onClose}>
          Fortsätt
        </Button>
      </div>
    </div>
  );
}

'use client'
import type { Paper, PaperScore } from '@/types'
import clsx from 'clsx'

interface Props {
  papers: Paper[]
  scores: PaperScore[]
  onScoreChange: (paperId: string, value: number | null) => void
}

export default function PaperInputs({ papers, scores, onScoreChange }: Props) {
  const getScore = (id: string) =>
    scores.find((s) => s.paperId === id)?.score ?? null

  return (
    <div className="flex flex-col gap-3">
      {papers.map((paper) => {
        const score = getScore(paper.id)
        const pct = score !== null ? (score / paper.maxScore) * 100 : null

        return (
          <div key={paper.id} className="flex flex-col gap-1.5">
            <div className="flex items-center justify-between">
              <label
                htmlFor={`paper-${paper.id}`}
                className="text-xs"
                style={{ color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}
              >
                {paper.label}
              </label>
              <span className="text-xs" style={{ color: 'var(--text-3)' }}>
                {paper.weightPercent}% weight
              </span>
            </div>

            <div className="flex items-center gap-3">
              <div className="relative flex-1">
                <input
                  id={`paper-${paper.id}`}
                  type="number"
                  min={0}
                  max={paper.maxScore}
                  value={score ?? ''}
                  onChange={(e) => {
                    const v = e.target.value
                    if (v === '') {
                      onScoreChange(paper.id, null)
                      return
                    }
                    const n = Math.min(Number(v), paper.maxScore)
                    onScoreChange(paper.id, Math.max(0, n))
                  }}
                  placeholder="—"
                  className={clsx(
                    'w-full rounded-lg px-3 py-2.5 text-sm text-right transition-all duration-150',
                    'border bg-[var(--bg-3)]',
                    score !== null
                      ? 'border-[var(--accent-border)] text-[var(--text-1)]'
                      : 'border-[var(--border)] text-[var(--text-3)]'
                  )}
                  style={{
                    fontFamily: 'var(--font-mono)',
                    outline: 'none',
                  }}
                />
              </div>

              <span
                className="text-xs w-14 text-right shrink-0"
                style={{ color: 'var(--text-3)', fontFamily: 'var(--font-mono)' }}
              >
                / {paper.maxScore}
              </span>

              <div
                className="w-14 h-1.5 rounded-full overflow-hidden shrink-0"
                style={{ background: 'var(--bg-3)', border: '1px solid var(--border)' }}
              >
                {pct !== null && (
                  <div
                    className="h-full rounded-full transition-all duration-300"
                    style={{
                      width: `${pct}%`,
                      background:
                        pct >= 80
                          ? 'var(--grade-7)'
                          : pct >= 60
                          ? 'var(--grade-5)'
                          : 'var(--grade-3)',
                    }}
                  />
                )}
              </div>
            </div>
          </div>
        )
      })}
    </div>
  )
}

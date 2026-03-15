'use client'
import type { CalculationResult, Timezone, Session } from '@/types'
import { getGradeLabel } from '@/lib/calculator'

interface Props {
  result: CalculationResult
  year: number
  session: Session
  timezone: Timezone
}

export default function ResultCard({ result, year, session, timezone }: Props) {
  const { grade, totalRaw, maxTotal, percentage, pctToNextGrade, boundary } = result

  const gradeColors: Record<number, string> = {
    7: 'var(--grade-7)', 6: 'var(--grade-6)', 5: 'var(--grade-5)',
    4: 'var(--grade-4)', 3: 'var(--grade-3)', 2: 'var(--grade-2)', 1: 'var(--grade-1)',
  }
  const color = gradeColors[grade]
  const sessionLabel = session === 'M' ? 'May' : 'Nov'

  const boundaries = [
    { grade: 7, min: boundary.grade7 },
    { grade: 6, min: boundary.grade6 },
    { grade: 5, min: boundary.grade5 },
    { grade: 4, min: boundary.grade4 },
    { grade: 3, min: boundary.grade3 },
    { grade: 2, min: boundary.grade2 },
    { grade: 1, min: 0 },
  ]

  return (
    <div className="rounded-xl p-5 flex flex-col gap-4 animate-scale-in"
      style={{ background: 'var(--bg-card)', border: `1px solid ${color}30` }}>

      <div className="flex items-start justify-between">
        <div>
          <p className="text-xs mb-1" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
            {year} · {sessionLabel} · {timezone}
          </p>
          <div className="flex items-baseline gap-3">
            <span className="font-bold leading-none animate-pulse-glow rounded-lg px-3 py-1"
              style={{ fontSize: '3.5rem', color, fontFamily: 'var(--font-display)', background: `${color}14` }}>
              {grade}
            </span>
            <div>
              <p className="text-sm font-semibold" style={{ color, fontFamily: 'var(--font-display)' }}>
                {getGradeLabel(grade)}
              </p>
              <p className="text-xs mt-0.5" style={{ color: 'var(--text-3)' }}>
                {totalRaw} / {maxTotal} pts ({percentage}%)
              </p>
            </div>
          </div>
        </div>

        <svg width="56" height="56" viewBox="0 0 56 56" className="shrink-0">
          <circle cx="28" cy="28" r="22" fill="none" stroke="var(--bg-3)" strokeWidth="4" />
          <circle cx="28" cy="28" r="22" fill="none" stroke={color} strokeWidth="4"
            strokeLinecap="round"
            strokeDasharray={`${2 * Math.PI * 22}`}
            strokeDashoffset={`${2 * Math.PI * 22 * (1 - percentage / 100)}`}
            transform="rotate(-90 28 28)"
            style={{ transition: 'stroke-dashoffset 0.6s ease' }} />
          <text x="28" y="28" textAnchor="middle" dominantBaseline="central"
            style={{ fill: color, fontSize: '11px', fontFamily: 'var(--font-mono)', fontWeight: 500 }}>
            {percentage}%
          </text>
        </svg>
      </div>

      {pctToNextGrade !== null && (
        <div className="rounded-lg px-3 py-2 text-xs"
          style={{ background: 'var(--bg-3)', color: 'var(--text-2)' }}>
          <span style={{ fontFamily: 'var(--font-display)', color: 'var(--text-1)' }}>
            +{pctToNextGrade}%
          </span>
          {' '}to reach grade {grade + 1}
        </div>
      )}

      <div className="flex flex-col gap-1">
        <p className="text-xs mb-1" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
          Grade boundaries ({sessionLabel} {year} {timezone})
        </p>
        {boundaries.map(({ grade: g, min }) => (
          <div key={g}
            className="flex items-center justify-between px-2 py-1 rounded-md text-xs transition-all"
            style={g === grade
              ? { background: `${color}18`, color }
              : { color: 'var(--text-3)' }}>
            <span style={{ fontFamily: 'var(--font-display)' }}>Grade {g}</span>
            <span style={{ fontFamily: 'var(--font-mono)' }}>≥ {min === 0 ? '0' : min}%</span>
          </div>
        ))}
      </div>
    </div>
  )
}

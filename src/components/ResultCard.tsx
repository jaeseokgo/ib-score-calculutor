'use client'

import type { CalculationResult, Timezone, Session } from '@/types'
import { getGradeLabel } from '@/lib/calculator'

interface Props {
  result: CalculationResult
  year: number
  session: Session
  timezone: Timezone
  maxTotal: number
}

export default function ResultCard({ result, year, session, timezone, maxTotal }: Props) {
  const { grade, totalRaw, percentage, pctToNextGrade, boundary } = result

  const gradeColors: Record<number, string> = {
    7: 'var(--grade-7)',
    6: 'var(--grade-6)',
    5: 'var(--grade-5)',
    4: 'var(--grade-4)',
    3: 'var(--grade-3)',
    2: 'var(--grade-2)',
    1: 'var(--grade-1)',
  }
  const color = gradeColors[grade]
  const sessionLabel = session === 'M' ? 'May' : 'Nov'

  // 원형 게이지용 진행 색상 (7/6, 5, 4, 3, 2/1)
  const gaugeColorByGrade: Record<number, string> = {
    7: '#00e5a0',
    6: '#00e5a0',
    5: '#6ee7b7',
    4: '#fbbf24',
    3: '#f97316',
    2: '#ef4444',
    1: '#ef4444',
  }
  const gaugeColor = gaugeColorByGrade[grade]
  const GAUGE_SIZE = 170
  const GAUGE_CX = GAUGE_SIZE / 2
  const GAUGE_CY = GAUGE_SIZE / 2
  const GAUGE_STROKE = 12
  const GAUGE_R = GAUGE_CX - GAUGE_STROKE / 2
  const circumference = 2 * Math.PI * GAUGE_R
  const strokeDashoffset = circumference * (1 - percentage / 100)

  // Grade 7까지 필요한 raw score 계산
  const rawToGrade7 = grade < 7
    ? Math.ceil((boundary.grade7 / 100) * maxTotal) - totalRaw
    : null

  // 다음 grade까지 필요한 raw score
  const nextGradeMinPct = grade < 7
    ? [boundary.grade7, boundary.grade6, boundary.grade5, boundary.grade4, boundary.grade3, boundary.grade2][6 - grade - 1]
    : null
  const rawToNext = nextGradeMinPct !== null
    ? Math.ceil((nextGradeMinPct / 100) * maxTotal) - totalRaw
    : null

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
    <div
      className="rounded-xl p-5 flex flex-col gap-4 animate-scale-in"
      style={{ background: 'var(--bg-card)', border: `1px solid ${color}30` }}
    >
      <p className="text-xs text-center" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
        {year} · {sessionLabel} · {timezone}
      </p>

      {/* 원형 게이지 카드 중앙 배치 */}
      <div className="flex flex-col items-center gap-3">
        <svg width={GAUGE_SIZE} height={GAUGE_SIZE} viewBox={`0 0 ${GAUGE_SIZE} ${GAUGE_SIZE}`} className="shrink-0">
          <circle
            cx={GAUGE_CX}
            cy={GAUGE_CY}
            r={GAUGE_R}
            fill="none"
            stroke="#1f2937"
            strokeWidth={GAUGE_STROKE}
          />
          <circle
            cx={GAUGE_CX}
            cy={GAUGE_CY}
            r={GAUGE_R}
            fill="none"
            stroke={gaugeColor}
            strokeWidth={GAUGE_STROKE}
            strokeLinecap="round"
            strokeDasharray={circumference}
            strokeDashoffset={strokeDashoffset}
            transform={`rotate(-90 ${GAUGE_CX} ${GAUGE_CY})`}
            style={{ transition: 'stroke-dashoffset 0.8s ease' }}
          />
          <text
            x={GAUGE_CX}
            y={GAUGE_CY - 8}
            textAnchor="middle"
            dominantBaseline="central"
            style={{ fill: color, fontSize: '3.5rem', fontFamily: 'var(--font-display)', fontWeight: 800 }}
          >
            {grade}
          </text>
          <text
            x={GAUGE_CX}
            y={GAUGE_CY + 22}
            textAnchor="middle"
            dominantBaseline="central"
            style={{ fill: 'var(--text-3)', fontSize: '0.72rem', fontFamily: 'var(--font-number)' }}
          >
            {percentage}%
          </text>
        </svg>
        <div className="text-center">
          <p className="text-base font-semibold" style={{ color, fontFamily: 'var(--font-display)' }}>
            {getGradeLabel(grade)}
          </p>
          <p className="text-xs mt-1" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-number)' }}>
            {totalRaw} / {maxTotal} pts ({percentage}%)
          </p>
        </div>
      </div>

      {/* 다음 grade / grade 7 까지 정보 */}
      {grade < 7 && (
        <div className="flex flex-col gap-2">
          {rawToNext !== null && rawToNext > 0 && (
            <div className="rounded-lg px-3 py-2 text-xs" style={{ background: 'var(--bg-3)', color: 'var(--text-2)' }}>
              <span style={{ fontFamily: 'var(--font-display)', color: 'var(--text-1)' }}>
                +{rawToNext} pts
              </span>
              {' '}({pctToNextGrade !== null ? `+${pctToNextGrade}%` : ''}) to reach grade {grade + 1}
            </div>
          )}
          {grade < 6 && rawToGrade7 !== null && rawToGrade7 > 0 && (
            <div className="rounded-lg px-3 py-2 text-xs" style={{ background: `var(--grade-7)14`, color: 'var(--text-2)', border: '1px solid var(--grade-7)30' }}>
              <span style={{ fontFamily: 'var(--font-display)', color: 'var(--grade-7)' }}>
                +{rawToGrade7} pts
              </span>
              {' '}needed for grade 7
            </div>
          )}
        </div>
      )}
      {grade === 7 && (
        <div className="rounded-lg px-3 py-2 text-xs" style={{ background: `var(--grade-7)14`, color: 'var(--grade-7)', border: '1px solid var(--grade-7)30' }}>
          <span style={{ fontFamily: 'var(--font-display)' }}>🎉 Maximum grade achieved!</span>
        </div>
      )}

      {/* Grade boundaries 미니 테이블 */}
      <div className="flex flex-col gap-1">
        <p className="text-xs mb-1" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
          Grade boundaries ({sessionLabel} {year} {timezone})
        </p>
        {boundaries.map(({ grade: g, min }) => (
          <div
            key={g}
            className="flex items-center justify-between px-2 py-1 rounded-md text-xs transition-all"
            style={g === grade ? { background: `${color}18`, color } : { color: 'var(--text-3)' }}
          >
            <span style={{ fontFamily: 'var(--font-display)' }}>Grade {g}</span>
            <span style={{ fontFamily: 'var(--font-number)' }}>≥ {min === 0 ? '0' : min}%</span>
          </div>
        ))}
      </div>
    </div>
  )
}

'use client'
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid,
  Tooltip, ReferenceLine, ResponsiveContainer, Cell,
} from 'recharts'
import type { GradeBoundary } from '@/types'

interface ChartPoint {
  year: number
  grade: number
  pct: number
}

interface Props {
  boundaries: GradeBoundary[]
  percentage: number   // user's % score
  selectedYear: number
}

export default function YearComparisonChart({ boundaries, percentage, selectedYear }: Props) {
  const data: ChartPoint[] = boundaries
    .map((b) => {
      let grade = 1
      if (percentage >= b.grade7) grade = 7
      else if (percentage >= b.grade6) grade = 6
      else if (percentage >= b.grade5) grade = 5
      else if (percentage >= b.grade4) grade = 4
      else if (percentage >= b.grade3) grade = 3
      else if (percentage >= b.grade2) grade = 2
      return { year: b.year, grade, pct: percentage }
    })
    .sort((a, b) => a.year - b.year)

  const gradeColors: Record<number, string> = {
    7: '#00c896', 6: '#4caf50', 5: '#8bc34a',
    4: '#ffc107', 3: '#ff9800', 2: '#ff5722', 1: '#f44336',
  }

  const CustomTooltip = ({ active, payload }: { active?: boolean; payload?: Array<{ payload: ChartPoint }> }) => {
    if (!active || !payload?.[0]) return null
    const d = payload[0].payload
    return (
      <div className="rounded-lg px-3 py-2 text-xs"
        style={{ background: 'var(--bg-card)', border: '1px solid var(--border-hover)', fontFamily: 'var(--font-mono)', color: 'var(--text-1)' }}>
        <p style={{ fontFamily: 'var(--font-display)', marginBottom: 4 }}>{d.year}</p>
        <p>Grade: <span style={{ color: gradeColors[d.grade] }}>{d.grade}</span></p>
        <p>Your score: {d.pct}%</p>
      </div>
    )
  }

  return (
    <div className="rounded-xl p-5 animate-fade-up"
      style={{ background: 'var(--bg-card)', border: '1px solid var(--border)' }}>
      <p className="text-xs mb-4" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
        Your {percentage}% score — grade if applied across years
      </p>
      <ResponsiveContainer width="100%" height={180}>
        <BarChart data={data} barCategoryGap="30%">
          <CartesianGrid vertical={false} stroke="var(--border)" strokeDasharray="3 3" />
          <XAxis dataKey="year" tick={{ fill: 'var(--text-3)', fontSize: 11, fontFamily: 'var(--font-mono)' }} axisLine={false} tickLine={false} />
          <YAxis domain={[0, 7]} ticks={[1, 2, 3, 4, 5, 6, 7]} tick={{ fill: 'var(--text-3)', fontSize: 11, fontFamily: 'var(--font-mono)' }} axisLine={false} tickLine={false} width={20} />
          <Tooltip content={<CustomTooltip />} cursor={{ fill: 'rgba(0,0,0,0.04)' }} />
          <ReferenceLine x={selectedYear} stroke="var(--accent)" strokeDasharray="4 4" strokeWidth={1.5} />
          <Bar dataKey="grade" radius={[4, 4, 0, 0]}>
            {data.map((entry) => (
              <Cell key={entry.year} fill={gradeColors[entry.grade]} fillOpacity={entry.year === selectedYear ? 1 : 0.5} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

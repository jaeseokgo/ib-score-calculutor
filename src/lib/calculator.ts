import type { GradeBoundary, CalculationResult } from '@/types'
import { supabase } from './supabase'
import type { SubjectKey, Level, Session, Timezone } from '@/types'

export function calculateGrade(
  totalRaw: number,
  maxTotal: number,
  boundary: GradeBoundary
): CalculationResult {
  const pct = (totalRaw / maxTotal) * 100
  const { grade7, grade6, grade5, grade4, grade3, grade2 } = boundary

  let grade = 1
  if (pct >= grade7) grade = 7
  else if (pct >= grade6) grade = 6
  else if (pct >= grade5) grade = 5
  else if (pct >= grade4) grade = 4
  else if (pct >= grade3) grade = 3
  else if (pct >= grade2) grade = 2

  const nextBoundaries: Record<number, number> = {
    1: grade2,
    2: grade3,
    3: grade4,
    4: grade5,
    5: grade6,
    6: grade7,
  }

  // convert % diff back to raw points
  const pctToNextGrade =
    grade < 7
      ? Math.ceil(((nextBoundaries[grade] - pct) / 100) * maxTotal)
      : null

  return {
    totalRaw,
    maxTotal,
    percentage: Math.round(pct * 10) / 10,
    grade,
    boundary,
    pctToNextGrade,
  }
}

function mapRowToBoundary(row: Record<string, unknown>): GradeBoundary {
  return {
    subject: row.subject as SubjectKey,
    level: row.level as Level,
    year: row.year as number,
    session: row.session as Session,
    timezone: row.timezone as Timezone,
    grade7: row.grade7 as number,
    grade6: row.grade6 as number,
    grade5: row.grade5 as number,
    grade4: row.grade4 as number,
    grade3: row.grade3 as number,
    grade2: row.grade2 as number,
  }
}

export async function fetchBoundaries(
  subject: SubjectKey,
  level: Level,
  session: Session = 'M',
  timezone: Timezone = 'TZ2'
): Promise<GradeBoundary[]> {
  const { data, error } = await supabase
    .from('grade_boundaries')
    .select('*')
    .eq('subject', subject)
    .eq('level', level)
    .eq('session', session)
    .eq('timezone', timezone)
    .order('year', { ascending: false })

  if (error) throw error

  let rows = (data ?? []).map(mapRowToBoundary)

  // November: IBO used TZ0 only for older years; fill missing years from TZ0
  if (session === 'N' && timezone !== 'TZ0') {
    const { data: tz0Data } = await supabase
      .from('grade_boundaries')
      .select('*')
      .eq('subject', subject)
      .eq('level', level)
      .eq('session', session)
      .eq('timezone', 'TZ0')
      .order('year', { ascending: false })

    const tz0Rows = (tz0Data ?? []).map(mapRowToBoundary)
    const byYear = new Map<number, GradeBoundary>()
    for (const r of tz0Rows) byYear.set(r.year, r)
    for (const r of rows) byYear.set(r.year, r)
    rows = Array.from(byYear.values()).sort((a, b) => b.year - a.year)
  }

  return rows
}

export function getGradeColor(grade: number): string {
  const colors: Record<number, string> = {
    7: '#00C896',
    6: '#4CAF50',
    5: '#8BC34A',
    4: '#FFC107',
    3: '#FF9800',
    2: '#FF5722',
    1: '#F44336',
  }
  return colors[grade] ?? '#888'
}

export function getGradeLabel(grade: number): string {
  const labels: Record<number, string> = {
    7: 'Excellent',
    6: 'Very Good',
    5: 'Good',
    4: 'Satisfactory',
    3: 'Mediocre',
    2: 'Poor',
    1: 'Very Poor',
  }
  return labels[grade] ?? ''
}

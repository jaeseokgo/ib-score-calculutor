'use client'
import { useState, useEffect, useCallback } from 'react'
import { SUBJECTS, SUBJECT_MAP, AVAILABLE_YEARS } from '@/lib/subjects'
import { fetchBoundaries, calculateGrade } from '@/lib/calculator'
import SubjectTabs from '@/components/SubjectTabs'
import PaperInputs from '@/components/PaperInputs'
import ResultCard from '@/components/ResultCard'
import YearComparisonChart from '@/components/YearComparisonChart'
import type { SubjectKey, Level, Session, Timezone, PaperScore, GradeBoundary, CalculationResult } from '@/types'
import clsx from 'clsx'

export default function Home() {
  const [subject, setSubject] = useState<SubjectKey>('math_aa')
  const [level, setLevel] = useState<Level>('HL')
  const [year, setYear] = useState<number>(2024)
  const [session, setSession] = useState<Session>('M')
  const [timezone, setTimezone] = useState<Timezone>('TZ2')
  const [scores, setScores] = useState<PaperScore[]>([])
  const [boundaries, setBoundaries] = useState<GradeBoundary[]>([])
  const [result, setResult] = useState<CalculationResult | null>(null)
  const [loading, setLoading] = useState(false)
  const [calculated, setCalculated] = useState(false)

  const subjectConfig = SUBJECT_MAP[subject]
  const papers = subjectConfig.papers[level]

  useEffect(() => {
    setScores(papers.map((p) => ({ paperId: p.id, score: null })))
    setResult(null)
    setCalculated(false)
  }, [subject, level])

  // 2025가 아닌 연도로 바꿀 때 TZ3 선택 중이면 TZ2로 전환
  useEffect(() => {
    if (year !== 2025 && timezone === 'TZ3') {
      setTimezone('TZ2')
    }
  }, [year])

  useEffect(() => {
    setLoading(true)
    fetchBoundaries(subject, level, session, timezone)
      .then(setBoundaries)
      .catch(console.error)
      .finally(() => setLoading(false))
  }, [subject, level, session, timezone])

  const handleScoreChange = useCallback((paperId: string, value: number | null) => {
    setScores((prev) =>
      prev.map((s) => (s.paperId === paperId ? { ...s, score: value } : s))
    )
    setCalculated(false)
  }, [])

  const handleCalculate = () => {
    const boundary = boundaries.find((b) => b.year === year)
    if (!boundary) return
    const totalRaw = scores.reduce((sum, s) => sum + (s.score ?? 0), 0)
    const maxTotal = papers.reduce((sum, p) => sum + p.maxScore, 0)
    const res = calculateGrade(totalRaw, maxTotal, boundary)
    setResult(res)
    setCalculated(true)
  }

  const totalRaw = scores.reduce((sum, s) => sum + (s.score ?? 0), 0)
  const maxTotal = papers.reduce((sum, p) => sum + p.maxScore, 0)
  const hasAnyScore = scores.some((s) => s.score !== null && s.score > 0)
  const allFilled = scores.every((s) => s.score !== null)
  const currentBoundary = boundaries.find((b) => b.year === year)

  return (
    <main className="min-h-dvh" style={{ background: 'var(--bg)', fontFamily: 'var(--font-body)' }}>
      {/* Header */}
      <header
        className="sticky top-0 z-50 px-4 md:px-8 py-4 flex items-center justify-between"
        style={{ background: 'rgba(245,244,240,0.9)', backdropFilter: 'blur(12px)', borderBottom: '1px solid var(--border)' }}
      >
        <div className="flex items-center gap-3">
          <div className="w-7 h-7 rounded-md flex items-center justify-center text-xs font-bold"
            style={{ background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }}>
            IB
          </div>
          <h1 className="text-sm font-semibold tracking-tight"
            style={{ fontFamily: 'var(--font-display)', color: 'var(--text-1)' }}>
            Score Calculator
          </h1>
        </div>
        <p className="text-xs hidden md:block" style={{ color: 'var(--text-3)' }}>
          Official boundaries · ibpredict.org
        </p>
      </header>

      <div className="max-w-5xl mx-auto px-4 md:px-8 py-6 md:py-10 flex flex-col gap-6">

        {/* Subject tabs */}
        <div className="flex flex-col gap-3 animate-fade-up">
          <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Select subject</p>
          <SubjectTabs selected={subject} onSelect={(k) => { setSubject(k); setLevel('HL') }} />
        </div>

        {/* Session / Timezone selector */}
        <div className="flex gap-3 flex-wrap animate-fade-up">
          {/* Session */}
          <div className="flex flex-col gap-1.5">
            <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Session</p>
            <div className="flex rounded-lg p-0.5" style={{ background: 'var(--bg-3)', border: '1px solid var(--border)' }}>
              {(['M', 'N'] as Session[]).map((s) => (
                <button key={s} onClick={() => { setSession(s); setCalculated(false) }}
                  className="px-4 py-1.5 rounded-md text-xs font-semibold transition-all duration-200"
                  style={session === s
                    ? { background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }
                    : { color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}>
                  {s === 'M' ? 'May' : 'November'}
                </button>
              ))}
            </div>
          </div>

          {/* Timezone — 2025년에만 TZ3 표시 */}
          <div className="flex flex-col gap-1.5">
            <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Timezone</p>
            <div className="flex rounded-lg p-0.5" style={{ background: 'var(--bg-3)', border: '1px solid var(--border)' }}>
              {(year === 2025 ? ['TZ1', 'TZ2', 'TZ3'] : ['TZ1', 'TZ2']).map((tz) => (
                <button key={tz} onClick={() => { setTimezone(tz as Timezone); setCalculated(false) }}
                  className="px-4 py-1.5 rounded-md text-xs font-semibold transition-all duration-200"
                  style={timezone === tz
                    ? { background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }
                    : { color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}>
                  {tz === 'TZ1' ? 'TZ1 (Americas)' : tz === 'TZ2' ? 'TZ2 (Asia/EU)' : 'TZ3 (Africa/ME)'}
                </button>
              ))}
            </div>
          </div>
        </div>

        {/* Main grid */}
        <div className="grid grid-cols-1 md:grid-cols-[1fr_320px] gap-4">

          {/* Left: Input panel */}
          <div className="rounded-xl p-5 flex flex-col gap-5 animate-fade-up"
            style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', animationDelay: '0.05s' }}>

            <div className="flex items-start justify-between gap-3 flex-wrap">
              <div>
                <h2 className="text-base font-semibold" style={{ fontFamily: 'var(--font-display)', color: 'var(--text-1)' }}>
                  {subjectConfig.name}
                </h2>
                <p className="text-xs mt-0.5" style={{ color: 'var(--text-3)' }}>
                  Group {subjectConfig.group} · {papers.length} assessments
                </p>
              </div>
              <div className="flex rounded-lg p-0.5 shrink-0" style={{ background: 'var(--bg-3)', border: '1px solid var(--border)' }}>
                {(['HL', 'SL'] as Level[]).map((l) => (
                  <button key={l} onClick={() => setLevel(l)}
                    className="px-4 py-1.5 rounded-md text-xs font-semibold transition-all duration-200"
                    style={level === l
                      ? { background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }
                      : { color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}>
                    {l}
                  </button>
                ))}
              </div>
            </div>

            <PaperInputs papers={papers} scores={scores} onScoreChange={handleScoreChange} />

            <div className="pt-3 flex items-center justify-between" style={{ borderTop: '1px solid var(--border)' }}>
              <span className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Total raw score</span>
              <span className="text-sm font-medium" style={{ color: hasAnyScore ? 'var(--text-1)' : 'var(--text-3)', fontFamily: 'var(--font-mono)' }}>
                {hasAnyScore ? totalRaw : '—'}{' '}
                <span style={{ color: 'var(--text-3)' }}>/ {maxTotal}</span>
                {hasAnyScore && (
                  <span className="ml-2 text-xs" style={{ color: 'var(--accent)' }}>
                    ({Math.round((totalRaw / maxTotal) * 100)}%)
                  </span>
                )}
              </span>
            </div>

            <div className="flex gap-3 flex-wrap">
              <div className="flex flex-col gap-1.5 flex-1 min-w-[120px]">
                <label className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Exam year</label>
                <select value={year} onChange={(e) => { setYear(Number(e.target.value)); setCalculated(false) }}
                  className="rounded-lg px-3 py-2.5 text-sm"
                  style={{ background: 'var(--bg-3)', border: '1px solid var(--border)', color: 'var(--text-1)', fontFamily: 'var(--font-mono)', outline: 'none', cursor: 'pointer' }}>
                  {AVAILABLE_YEARS.slice().reverse().map((y) => (
                    <option key={y} value={y}>{y}</option>
                  ))}
                </select>
              </div>
              <div className="flex flex-col gap-1.5 flex-1 min-w-[160px]">
                <div className="text-xs opacity-0 select-none">calc</div>
                <button onClick={handleCalculate}
                  disabled={!hasAnyScore || loading || !currentBoundary}
                  className="rounded-lg px-5 py-2.5 text-sm font-semibold transition-all duration-200 disabled:opacity-40 disabled:cursor-not-allowed active:scale-95"
                  style={{
                    background: calculated ? 'var(--accent-dim)' : 'var(--accent)',
                    color: calculated ? 'var(--accent)' : 'var(--text-on-accent)',
                    border: calculated ? '1px solid var(--accent-border)' : '1px solid transparent',
                    fontFamily: 'var(--font-display)',
                  }}>
                  {loading ? 'Loading…' : calculated ? 'Recalculate' : 'Calculate grade'}
                </button>
              </div>
            </div>

            {!currentBoundary && !loading && (
              <p className="text-xs" style={{ color: 'var(--grade-3)' }}>
                No boundary data for {session === 'M' ? 'May' : 'Nov'} {year} {timezone}. Try a different session or year.
              </p>
            )}
            {!allFilled && hasAnyScore && (
              <p className="text-xs" style={{ color: 'var(--text-3)' }}>Missing papers counted as 0.</p>
            )}
          </div>

          {/* Right: Result */}
          <div className="flex flex-col gap-4">
            {result && calculated ? (
              <ResultCard result={result} year={year} session={session} timezone={timezone} />
            ) : (
              <div className="rounded-xl p-5 flex flex-col items-center justify-center text-center gap-3 h-full min-h-[200px]"
                style={{ background: 'var(--bg-card)', border: '1px dashed var(--border)' }}>
                <div className="w-10 h-10 rounded-full flex items-center justify-center text-lg" style={{ background: 'var(--bg-3)' }}>◎</div>
                <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
                  Enter your paper scores<br />and click Calculate
                </p>
              </div>
            )}
          </div>
        </div>

        {/* Year comparison chart */}
        {result && calculated && boundaries.length > 1 && (
          <YearComparisonChart
            boundaries={boundaries}
            percentage={result.percentage}
            selectedYear={year}
          />
        )}

        {/* Boundary table */}
        {boundaries.length > 0 && (
          <div className="rounded-xl overflow-hidden animate-fade-up"
            style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', animationDelay: '0.1s' }}>
            <div className="px-5 py-3" style={{ borderBottom: '1px solid var(--border)' }}>
              <h3 className="text-xs font-semibold" style={{ fontFamily: 'var(--font-display)', color: 'var(--text-2)' }}>
                {subjectConfig.shortName} {level} · {session === 'M' ? 'May' : 'Nov'} {timezone} — Grade boundaries (%)
              </h3>
            </div>
            <div className="overflow-x-auto">
              <table className="w-full text-xs" style={{ borderCollapse: 'collapse' }}>
                <thead>
                  <tr style={{ background: 'var(--bg-3)' }}>
                    {['Year', 'Grade 7', 'Grade 6', 'Grade 5', 'Grade 4', 'Grade 3', 'Grade 2'].map((h) => (
                      <th key={h} className="px-4 py-2.5 text-left font-medium"
                        style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)', whiteSpace: 'nowrap' }}>
                        {h}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {boundaries.map((b, i) => {
                    const isSelected = b.year === year
                    const myGrade = result?.boundary.year === b.year ? result.grade : null
                    return (
                      <tr key={b.year} onClick={() => setYear(b.year)} className="cursor-pointer transition-colors"
                        style={{
                          background: isSelected ? 'rgba(0,200,150,0.1)' : i % 2 === 0 ? 'transparent' : 'rgba(0,0,0,0.03)',
                          borderLeft: isSelected ? '2px solid var(--accent)' : '2px solid transparent',
                        }}>
                        <td className="px-4 py-2.5 font-medium"
                          style={{ color: isSelected ? 'var(--accent)' : 'var(--text-1)', fontFamily: 'var(--font-display)' }}>
                          {b.year}
                          {myGrade && (
                            <span className="ml-2 px-1.5 py-0.5 rounded text-xs font-bold"
                              style={{ background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-mono)' }}>
                              {myGrade}
                            </span>
                          )}
                        </td>
                        {[b.grade7, b.grade6, b.grade5, b.grade4, b.grade3, b.grade2].map((val, j) => (
                          <td key={j} className="px-4 py-2.5"
                            style={{
                              color: result && result.percentage >= val && j < 6 ? 'var(--accent)' : 'var(--text-3)',
                              fontFamily: 'var(--font-mono)',
                            }}>
                            {val}%
                          </td>
                        ))}
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </div>
        )}

        <footer className="pt-4 pb-8 text-center">
          <p className="text-xs" style={{ color: 'var(--text-3)' }}>
            Grade boundaries sourced from <a href="https://ibpredict.org" target="_blank" rel="noopener noreferrer"
              style={{ color: 'var(--accent)', textDecoration: 'none' }}>ibpredict.org</a> (official IBO data).
            Always verify with official IBO documents.
          </p>
        </footer>
      </div>
    </main>
  )
}

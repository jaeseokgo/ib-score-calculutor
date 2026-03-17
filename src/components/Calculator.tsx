'use client'

import { useState, useEffect, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { SUBJECT_MAP, AVAILABLE_YEARS } from '@/lib/subjects'
import { fetchBoundaries, calculateGrade } from '@/lib/calculator'
import { supabase } from '@/lib/supabase'
import SubjectTabs from '@/components/SubjectTabs'
import PaperInputs from '@/components/PaperInputs'
import ResultCard from '@/components/ResultCard'
import YearComparisonChart from '@/components/YearComparisonChart'
import type { SubjectKey, Level, Session, Timezone, PaperScore, GradeBoundary, CalculationResult } from '@/types'

export default function Calculator() {
  const router = useRouter()
  const searchParams = useSearchParams()

  // URL 파라미터에서 초기값 읽기
  const initSubject = (searchParams.get('subject') as SubjectKey) || 'math_aa'
  const initLevel = (searchParams.get('level') as Level) || 'HL'
  const initSession = (searchParams.get('session') as Session) || 'M'
  const initTimezone = (searchParams.get('tz') as Timezone) || 'TZ2'
  const initYear = Number(searchParams.get('year')) || AVAILABLE_YEARS[AVAILABLE_YEARS.length - 1]

  const [subject, setSubject] = useState<SubjectKey>(
    SUBJECT_MAP[initSubject] ? initSubject : 'math_aa'
  )
  const [level, setLevel] = useState<Level>(initLevel)
  const [year, setYear] = useState<number>(initYear)
  const [session, setSession] = useState<Session>(initSession)
  const [timezone, setTimezone] = useState<Timezone>(initTimezone)
  const [scores, setScores] = useState<PaperScore[]>([])
  const [boundaries, setBoundaries] = useState<GradeBoundary[]>([])
  const [result, setResult] = useState<CalculationResult | null>(null)
  const [loading, setLoading] = useState(false)
  const [copied, setCopied] = useState(false)
  const [availableTimezones, setAvailableTimezones] = useState<Timezone[]>([])

  const subjectConfig = SUBJECT_MAP[subject]
  const papers = subjectConfig.papers[level]

  // URL 파라미터 업데이트
  useEffect(() => {
    const params = new URLSearchParams()
    params.set('subject', subject)
    params.set('level', level)
    params.set('session', session)
    params.set('tz', timezone)
    params.set('year', String(year))
    router.replace(`?${params.toString()}`, { scroll: false })
  }, [subject, level, session, timezone, year, router])

  useEffect(() => {
    setScores(papers.map((p) => ({ paperId: p.id, score: null })))
    setResult(null)
  }, [subject, level])

  // 과목/레벨/연도/세션에 대해 DB에서 사용 가능한 timezone 목록 조회
  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const { data, error } = await supabase
          .from('grade_boundaries')
          .select('timezone')
          .eq('subject', subject)
          .eq('level', level)
          .eq('session', session)
          .eq('year', year)

        if (error || cancelled) return

        const tzs = Array.from(
          new Set(
            (data ?? [])
              .map((row: any) => row.timezone as Timezone)
              .filter((tz): tz is Timezone => ['TZ0', 'TZ1', 'TZ2', 'TZ3'].includes(tz))
          )
        ).sort()

        setAvailableTimezones(tzs)

        if (tzs.length > 0 && !tzs.includes(timezone)) {
          setTimezone(tzs[0])
        }
      } catch (e) {
        console.error(e)
      }
    })()

    return () => {
      cancelled = true
    }
  }, [subject, level, year, session])

  const tz0Only = availableTimezones.length === 1 && availableTimezones[0] === 'TZ0'

  const effectiveTimezone: Timezone = tz0Only ? 'TZ0' : timezone

  useEffect(() => {
    setLoading(true)
    let cancelled = false
    fetchBoundaries(subject, level, session, effectiveTimezone)
      .then(async (data) => {
        if (cancelled) return
        setBoundaries(data)
      })
      .catch(console.error)
      .finally(() => setLoading(false))
    return () => {
      cancelled = true
    }
  }, [subject, level, session, effectiveTimezone])

  const handleScoreChange = useCallback((paperId: string, value: number | null) => {
    setScores((prev) =>
      prev.map((s) => (s.paperId === paperId ? { ...s, score: value } : s))
    )
  }, [])

  // 실시간 자동 계산
  useEffect(() => {
    const boundary = boundaries.find((b) => b.year === year)
    const hasAnyScore = scores.some((s) => s.score !== null && s.score > 0)
    if (!boundary || !hasAnyScore) {
      setResult(null)
      return
    }
    const totalRaw = scores.reduce((sum, s) => sum + (s.score ?? 0), 0)
    const maxTotal = papers.reduce((sum, p) => sum + p.maxScore, 0)
    const res = calculateGrade(totalRaw, maxTotal, boundary)
    setResult(res)
  }, [scores, boundaries, year, papers])

  const totalRaw = scores.reduce((sum, s) => sum + (s.score ?? 0), 0)
  const maxTotal = papers.reduce((sum, p) => sum + p.maxScore, 0)
  const hasAnyScore = scores.some((s) => s.score !== null && s.score > 0)
  const allFilled = scores.every((s) => s.score !== null)
  const currentBoundary = boundaries.find((b) => b.year === year)

  const handleShare = async () => {
    try {
      await navigator.clipboard.writeText(window.location.href)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // fallback
    }
  }

  return (
    <main className="min-h-dvh" style={{ background: 'var(--bg)', fontFamily: 'var(--font-body)' }}>
      {/* Header */}
      <header
        className="sticky top-0 z-50 px-4 md:px-8 py-4 flex items-center justify-between"
        style={{
          background: 'var(--bg-header, rgba(245,244,240,0.9))',
          backdropFilter: 'blur(12px)',
          borderBottom: '1px solid var(--border)',
        }}
      >
        <div className="flex items-center gap-3">
          <div
            className="w-7 h-7 rounded-md flex items-center justify-center text-xs font-bold"
            style={{ background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }}
          >
            IB
          </div>
          <h1 className="text-sm font-semibold tracking-tight" style={{ fontFamily: 'var(--font-display)', color: 'var(--text-1)' }}>
            Score Calculator
          </h1>
        </div>

        <div className="flex items-center gap-3">
          <div
            className="w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold shrink-0"
            style={{ background: '#00e5a0', color: '#000', fontFamily: 'var(--font-display)' }}
            title="KO"
          >
            KO
          </div>
          <button
            onClick={handleShare}
            className="flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-xs font-medium transition-all duration-200"
            style={{
              background: copied ? 'var(--accent-dim)' : 'var(--bg-3)',
              color: copied ? 'var(--accent)' : 'var(--text-2)',
              border: '1px solid var(--border)',
              fontFamily: 'var(--font-display)',
            }}
          >
            {copied ? (
              <>
                <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                  <path d="M2 6l3 3 5-5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
                </svg>
                Copied!
              </>
            ) : (
              <>
                <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                  <path d="M8 2H10V10H2V8" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round"/>
                  <path d="M5 2H7M7 2V4M7 2H9" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round"/>
                  <rect x="2" y="2" width="5" height="6" rx="0.5" stroke="currentColor" strokeWidth="1.2"/>
                </svg>
                Share
              </>
            )}
          </button>
        </div>
      </header>

      <div className="max-w-5xl mx-auto px-4 md:px-8 py-6 md:py-10 flex flex-col gap-6">
        <div className="flex flex-col gap-3 animate-fade-up">
          <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Select subject</p>
          <SubjectTabs selected={subject} onSelect={(k) => { setSubject(k); setLevel('HL') }} />
        </div>

        <div className="flex gap-3 flex-wrap items-end animate-fade-up">
          <div className="flex flex-col gap-1.5">
            <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Exam year</p>
            <select
              value={year}
              onChange={(e) => setYear(Number(e.target.value))}
              className="rounded-lg px-3 py-1.5 text-xs font-semibold"
              style={{
                background: 'var(--bg-3)',
                border: '1px solid var(--border)',
                color: 'var(--text-1)',
                fontFamily: 'var(--font-display)',
                outline: 'none',
                cursor: 'pointer',
                height: '34px',
              }}
            >
              {AVAILABLE_YEARS.slice().reverse().map((y) => (
                <option key={y} value={y}>{y}</option>
              ))}
            </select>
          </div>

          <div className="flex flex-col gap-1.5">
            <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Session</p>
            <div className="flex rounded-lg p-0.5" style={{ background: 'var(--bg-3)', border: '1px solid var(--border)' }}>
              {(['M', 'N'] as Session[]).map((s) => (
                <button
                  key={s}
                  onClick={() => setSession(s)}
                  className="px-4 py-1.5 rounded-md text-xs font-semibold transition-all duration-200"
                  style={session === s
                    ? { background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }
                    : { color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}
                >
                  {s === 'M' ? 'May' : 'Nov'}
                </button>
              ))}
            </div>
          </div>

          {availableTimezones.length > 1 && (
            <div className="flex flex-col gap-1.5">
              <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Timezone</p>
              <div className="flex rounded-lg p-0.5" style={{ background: 'var(--bg-3)', border: '1px solid var(--border)' }}>
                {availableTimezones.map((tz) => (
                  <button
                    key={tz}
                    onClick={() => setTimezone(tz as Timezone)}
                    className="px-4 py-1.5 rounded-md text-xs font-semibold transition-all duration-200"
                    style={timezone === tz
                      ? { background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }
                      : { color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}
                  >
                    {tz}
                  </button>
                ))}
              </div>
            </div>
          )}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-[1fr_320px] gap-4">
          <div
            className="rounded-xl p-5 flex flex-col gap-5 animate-fade-up"
            style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', animationDelay: '0.05s' }}
          >
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
                  <button
                    key={l}
                    onClick={() => setLevel(l)}
                    className="px-4 py-1.5 rounded-md text-xs font-semibold transition-all duration-200"
                    style={level === l
                      ? { background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-display)' }
                      : { color: 'var(--text-2)', fontFamily: 'var(--font-display)' }}
                  >
                    {l}
                  </button>
                ))}
              </div>
            </div>

            <PaperInputs papers={papers} scores={scores} onScoreChange={handleScoreChange} />

            <div className="pt-3 flex items-center justify-between" style={{ borderTop: '1px solid var(--border)' }}>
              <span className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>Total raw score</span>
              <span className="text-sm font-medium" style={{ color: hasAnyScore ? 'var(--text-1)' : 'var(--text-3)', fontFamily: 'var(--font-number)' }}>
                {hasAnyScore ? totalRaw : '—'}{' '}
                <span style={{ color: 'var(--text-3)' }}>/ {maxTotal}</span>
                {hasAnyScore && (
                  <span className="ml-2 text-xs" style={{ color: 'var(--accent)' }}>
                    ({Math.round((totalRaw / maxTotal) * 100)}%)
                  </span>
                )}
              </span>
            </div>

            {!currentBoundary && !loading && (
              <p className="text-xs" style={{ color: 'var(--grade-3)' }}>
                No boundary data for {session === 'M' ? 'May' : 'Nov'} {year} {effectiveTimezone}. Try a different session or year.
              </p>
            )}
            {!allFilled && hasAnyScore && (
              <p className="text-xs" style={{ color: 'var(--text-3)' }}>Missing papers counted as 0.</p>
            )}
          </div>

          <div className="flex flex-col gap-4">
            {result ? (
              <ResultCard
                result={result}
                year={year}
                session={session}
                timezone={effectiveTimezone}
                maxTotal={maxTotal}
              />
            ) : (
              <div
                className="rounded-xl p-5 flex flex-col items-center justify-center text-center gap-3 h-full min-h-[200px]"
                style={{ background: 'var(--bg-card)', border: '1px dashed var(--border)' }}
              >
                <div className="w-10 h-10 rounded-full flex items-center justify-center text-lg" style={{ background: 'var(--bg-3)' }}>◎</div>
                <p className="text-xs" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)' }}>
                  Enter your paper scores<br />to see your grade
                </p>
              </div>
            )}
          </div>
        </div>

        {result && boundaries.length > 0 && (
          <YearComparisonChart boundaries={boundaries} percentage={result.percentage} selectedYear={year} />
        )}

        {boundaries.length > 0 && (
          <div
            className="rounded-xl overflow-hidden animate-fade-up"
            style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', animationDelay: '0.1s' }}
          >
            <div className="px-5 py-3" style={{ borderBottom: '1px solid var(--border)' }}>
              <h3 className="text-xs font-semibold" style={{ fontFamily: 'var(--font-display)', color: 'var(--text-2)' }}>
                {subjectConfig.shortName} {level} · {session === 'M' ? 'May' : 'Nov'} {effectiveTimezone} — Grade boundaries (%)
              </h3>
            </div>
            <div className="overflow-x-auto">
              <table className="w-full text-xs" style={{ borderCollapse: 'collapse' }}>
                <thead>
                  <tr style={{ background: 'var(--bg-3)' }}>
                    {['Year', 'Grade 7', 'Grade 6', 'Grade 5', 'Grade 4', 'Grade 3', 'Grade 2'].map((h) => (
                      <th key={h} className="px-4 py-2.5 text-left font-medium" style={{ color: 'var(--text-3)', fontFamily: 'var(--font-display)', whiteSpace: 'nowrap' }}>
                        {h}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {boundaries.map((b, i) => {
                    const isSelected = b.year === year
                    const myGrade = result?.boundary.year === b.year ? result.grade : null
                    const prev = boundaries.find((pb) => pb.year === b.year - 1)
                    return (
                      <tr
                        key={b.year}
                        onClick={() => setYear(b.year)}
                        className="cursor-pointer transition-colors"
                        style={{
                          background: isSelected ? 'rgba(0,200,150,0.08)' : i % 2 === 0 ? 'transparent' : 'rgba(0,0,0,0.02)',
                          borderLeft: isSelected ? '2px solid var(--accent)' : '2px solid transparent',
                        }}
                      >
                        <td className="px-4 py-2.5 font-medium" style={{ color: isSelected ? 'var(--accent)' : 'var(--text-1)', fontFamily: 'var(--font-display)' }}>
                          {b.year}
                          {myGrade && (
                            <span className="ml-2 px-1.5 py-0.5 rounded text-xs font-bold" style={{ background: 'var(--accent)', color: 'var(--text-on-accent)', fontFamily: 'var(--font-number)' }}>
                              {myGrade}
                            </span>
                          )}
                        </td>
                        {[b.grade7, b.grade6, b.grade5, b.grade4, b.grade3, b.grade2].map((val, j) => {
                          const prevVal = prev ? [prev.grade7, prev.grade6, prev.grade5, prev.grade4, prev.grade3, prev.grade2][j] : null
                          const diff = prevVal !== null ? val - prevVal : null
                          return (
                            <td key={j} className="px-4 py-2.5" style={{ color: result && result.percentage >= val && j < 6 ? 'var(--accent)' : 'var(--text-3)', fontFamily: 'var(--font-number)' }}>
                              {val}%
                              {diff !== null && diff !== 0 && (
                                <span className="ml-1 text-[10px]" style={{ color: diff > 0 ? 'var(--grade-3)' : 'var(--grade-7)', opacity: 0.8 }}>
                                  {diff > 0 ? `+${diff}` : diff}
                                </span>
                              )}
                            </td>
                          )
                        })}
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
            Grade boundaries sourced from{' '}
            <a href="https://ibpredict.org" target="_blank" rel="noopener noreferrer" style={{ color: 'var(--accent)', textDecoration: 'none' }}>
              ibpredict.org
            </a>{' '}
            (official IBO data). Always verify with official IBO documents.
          </p>
        </footer>
      </div>
    </main>
  )
}

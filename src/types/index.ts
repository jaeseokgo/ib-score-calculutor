export type Level = 'HL' | 'SL'
export type Timezone = 'TZ0' | 'TZ1' | 'TZ2'
export type Session = 'M' | 'N'

export type SubjectKey =
  | 'math_aa'
  | 'english_a_lang_lit'
  | 'biology'
  | 'chemistry'
  | 'physics'
  | 'economics'
  | 'history'
  | 'psychology'
  | 'business_management'
  | 'english_b'

export interface Paper {
  id: string
  label: string
  maxScore: number
  weightPercent: number
}

export interface SubjectConfig {
  key: SubjectKey
  name: string
  shortName: string
  group: number
  papers: {
    HL: Paper[]
    SL: Paper[]
  }
}

export interface GradeBoundary {
  subject: SubjectKey
  level: Level
  year: number
  session: Session
  timezone: Timezone
  grade7: number
  grade6: number
  grade5: number
  grade4: number
  grade3: number
  grade2: number
}

export interface PaperScore {
  paperId: string
  score: number | null
}

export interface CalculationResult {
  totalRaw: number
  maxTotal: number
  percentage: number
  grade: number
  boundary: GradeBoundary
  pctToNextGrade: number | null
}

import type { SubjectConfig } from '@/types'

export const SUBJECTS: SubjectConfig[] = [
  {
    key: 'math_aa',
    name: 'Mathematics: Analysis and Approaches',
    shortName: 'Math AA',
    group: 5,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (No calc)', maxScore: 110, weightPercent: 30 },
        { id: 'paper2', label: 'Paper 2 (Calc)', maxScore: 110, weightPercent: 30 },
        { id: 'paper3', label: 'Paper 3', maxScore: 55, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 20, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (No calc)', maxScore: 80, weightPercent: 40 },
        { id: 'paper2', label: 'Paper 2 (Calc)', maxScore: 80, weightPercent: 40 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 20, weightPercent: 20 },
      ],
    },
  },
  {
    key: 'english_a_lang_lit',
    name: 'English A: Language & Literature',
    shortName: 'Eng A L&L',
    group: 1,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Guided analysis)', maxScore: 20, weightPercent: 35 },
        { id: 'paper2', label: 'Paper 2 (Comparative essay)', maxScore: 30, weightPercent: 25 },
        { id: 'io', label: 'Individual Oral', maxScore: 40, weightPercent: 20 },
        { id: 'hl_essay', label: 'HL Essay', maxScore: 20, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Guided analysis)', maxScore: 20, weightPercent: 35 },
        { id: 'paper2', label: 'Paper 2 (Comparative essay)', maxScore: 30, weightPercent: 35 },
        { id: 'io', label: 'Individual Oral', maxScore: 40, weightPercent: 30 },
      ],
    },
  },
  {
    key: 'biology',
    name: 'Biology',
    shortName: 'Biology',
    group: 4,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (MCQ)', maxScore: 40, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Data/essay)', maxScore: 72, weightPercent: 36 },
        { id: 'paper3', label: 'Paper 3 (Options)', maxScore: 45, weightPercent: 24 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 24, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (MCQ)', maxScore: 30, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Data/essay)', maxScore: 50, weightPercent: 40 },
        { id: 'paper3', label: 'Paper 3 (Options)', maxScore: 35, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 24, weightPercent: 20 },
      ],
    },
  },
  {
    key: 'chemistry',
    name: 'Chemistry',
    shortName: 'Chemistry',
    group: 4,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (MCQ)', maxScore: 40, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Short/extended)', maxScore: 72, weightPercent: 36 },
        { id: 'paper3', label: 'Paper 3 (Options)', maxScore: 45, weightPercent: 24 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 24, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (MCQ)', maxScore: 30, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Short/extended)', maxScore: 50, weightPercent: 40 },
        { id: 'paper3', label: 'Paper 3 (Options)', maxScore: 35, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 24, weightPercent: 20 },
      ],
    },
  },
  {
    key: 'physics',
    name: 'Physics',
    shortName: 'Physics',
    group: 4,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (MCQ)', maxScore: 40, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Short/extended)', maxScore: 72, weightPercent: 36 },
        { id: 'paper3', label: 'Paper 3 (Options)', maxScore: 45, weightPercent: 24 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 24, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (MCQ)', maxScore: 30, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Short/extended)', maxScore: 50, weightPercent: 40 },
        { id: 'paper3', label: 'Paper 3 (Options)', maxScore: 35, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 24, weightPercent: 20 },
      ],
    },
  },
  {
    key: 'economics',
    name: 'Economics',
    shortName: 'Economics',
    group: 3,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Extended response)', maxScore: 50, weightPercent: 30 },
        { id: 'paper2', label: 'Paper 2 (Data response)', maxScore: 40, weightPercent: 30 },
        { id: 'paper3', label: 'Paper 3 (Policy)', maxScore: 50, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 45, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Extended response)', maxScore: 50, weightPercent: 30 },
        { id: 'paper2', label: 'Paper 2 (Data response)', maxScore: 40, weightPercent: 40 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 45, weightPercent: 30 },
      ],
    },
  },
  {
    key: 'history',
    name: 'History',
    shortName: 'History',
    group: 3,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Source analysis)', maxScore: 24, weightPercent: 20 },
        { id: 'paper2', label: 'Paper 2 (Essay)', maxScore: 30, weightPercent: 25 },
        { id: 'paper3', label: 'Paper 3 (Essay)', maxScore: 45, weightPercent: 35 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 25, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Source analysis)', maxScore: 24, weightPercent: 30 },
        { id: 'paper2', label: 'Paper 2 (Essay)', maxScore: 30, weightPercent: 45 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 25, weightPercent: 25 },
      ],
    },
  },
  {
    key: 'psychology',
    name: 'Psychology',
    shortName: 'Psychology',
    group: 3,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Core)', maxScore: 44, weightPercent: 40 },
        { id: 'paper2', label: 'Paper 2 (Options)', maxScore: 22, weightPercent: 20 },
        { id: 'paper3', label: 'Paper 3 (Qualitative)', maxScore: 30, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 22, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Core)', maxScore: 44, weightPercent: 50 },
        { id: 'paper2', label: 'Paper 2 (Options)', maxScore: 22, weightPercent: 25 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 22, weightPercent: 25 },
      ],
    },
  },
  {
    key: 'business_management',
    name: 'Business Management',
    shortName: 'Bus. Mgmt',
    group: 3,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Case study)', maxScore: 50, weightPercent: 35 },
        { id: 'paper2', label: 'Paper 2 (Structured)', maxScore: 80, weightPercent: 40 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 25, weightPercent: 25 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Case study)', maxScore: 50, weightPercent: 35 },
        { id: 'paper2', label: 'Paper 2 (Structured)', maxScore: 60, weightPercent: 40 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 25, weightPercent: 25 },
      ],
    },
  },
  {
    key: 'english_b',
    name: 'English B',
    shortName: 'English B',
    group: 2,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Writing)', maxScore: 30, weightPercent: 25 },
        { id: 'paper2', label: 'Paper 2 (Reading)', maxScore: 40, weightPercent: 25 },
        { id: 'io', label: 'Individual Oral', maxScore: 30, weightPercent: 25 },
        { id: 'ia', label: 'Internal Assessment (HL Essay)', maxScore: 20, weightPercent: 25 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Writing)', maxScore: 30, weightPercent: 25 },
        { id: 'paper2', label: 'Paper 2 (Reading)', maxScore: 40, weightPercent: 50 },
        { id: 'io', label: 'Individual Oral', maxScore: 30, weightPercent: 25 },
      ],
    },
  },
]

export const SUBJECT_MAP = Object.fromEntries(
  SUBJECTS.map((s) => [s.key, s])
) as Record<string, SubjectConfig>

export const AVAILABLE_YEARS = [2021, 2022, 2023, 2024, 2025]

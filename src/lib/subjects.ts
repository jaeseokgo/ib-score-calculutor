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
    key: 'math_ai',
    name: 'Mathematics: Applications and Interpretation',
    shortName: 'Math AI',
    group: 5,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Technology)', maxScore: 110, weightPercent: 30 },
        { id: 'paper2', label: 'Paper 2 (Technology)', maxScore: 110, weightPercent: 30 },
        { id: 'paper3', label: 'Paper 3 (Investigation)', maxScore: 55, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 20, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Technology)', maxScore: 80, weightPercent: 40 },
        { id: 'paper2', label: 'Paper 2 (Technology)', maxScore: 80, weightPercent: 40 },
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
    key: 'korean_a',
    name: 'Korean A: Language & Literature',
    shortName: 'Korean A',
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
        { id: 'paper1a', label: 'Paper 1 (MCQ)', maxScore: 40, weightPercent: 20 },
        { id: 'paper1b', label: 'Paper 1B', maxScore: 35, weightPercent: 15 },
        { id: 'paper2', label: 'Paper 2', maxScore: 80, weightPercent: 35 },
        { id: 'ia', label: 'Practical Work', maxScore: 24, weightPercent: 30 },
      ],
      SL: [
        { id: 'paper1a', label: 'Paper 1 (MCQ)', maxScore: 30, weightPercent: 20 },
        { id: 'paper1b', label: 'Paper 1B', maxScore: 25, weightPercent: 15 },
        { id: 'paper2', label: 'Paper 2', maxScore: 50, weightPercent: 40 },
        { id: 'ia', label: 'Practical Work', maxScore: 24, weightPercent: 25 },
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
        { id: 'paper1a', label: 'Paper 1 (MCQ)', maxScore: 40, weightPercent: 20 },
        { id: 'paper1b', label: 'Paper 1B', maxScore: 35, weightPercent: 15 },
        { id: 'paper2', label: 'Paper 2', maxScore: 90, weightPercent: 35 },
        { id: 'ia', label: 'Practical Work', maxScore: 24, weightPercent: 30 },
      ],
      SL: [
        { id: 'paper1a', label: 'Paper 1 (MCQ)', maxScore: 30, weightPercent: 20 },
        { id: 'paper1b', label: 'Paper 1B', maxScore: 25, weightPercent: 15 },
        { id: 'paper2', label: 'Paper 2', maxScore: 50, weightPercent: 40 },
        { id: 'ia', label: 'Practical Work', maxScore: 24, weightPercent: 25 },
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
        { id: 'paper1a', label: 'Paper 1 (MCQ)', maxScore: 40, weightPercent: 20 },
        { id: 'paper1b', label: 'Paper 1B', maxScore: 20, weightPercent: 15 },
        { id: 'paper2', label: 'Paper 2', maxScore: 90, weightPercent: 35 },
        { id: 'ia', label: 'Practical Work', maxScore: 24, weightPercent: 30 },
      ],
      SL: [
        { id: 'paper1a', label: 'Paper 1 (MCQ)', maxScore: 25, weightPercent: 20 },
        { id: 'paper1b', label: 'Paper 1B', maxScore: 20, weightPercent: 15 },
        { id: 'paper2', label: 'Paper 2', maxScore: 50, weightPercent: 40 },
        { id: 'ia', label: 'Practical Work', maxScore: 24, weightPercent: 25 },
      ],
    },
  },
  {
    key: 'computer_science',
    name: 'Computer Science',
    shortName: 'Comp Sci',
    group: 4,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Theory)', maxScore: 100, weightPercent: 30 },
        { id: 'paper2', label: 'Paper 2 (Programming)', maxScore: 65, weightPercent: 20 },
        { id: 'paper3', label: 'Paper 3 (Case study)', maxScore: 30, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 34, weightPercent: 30 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Theory)', maxScore: 70, weightPercent: 40 },
        { id: 'paper2', label: 'Paper 2 (Programming)', maxScore: 45, weightPercent: 30 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 34, weightPercent: 30 },
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
    key: 'geography',
    name: 'Geography',
    shortName: 'Geography',
    group: 3,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Geographic themes)', maxScore: 60, weightPercent: 35 },
        { id: 'paper2', label: 'Paper 2 (Geographic perspectives)', maxScore: 50, weightPercent: 25 },
        { id: 'paper3', label: 'Paper 3 (HL extension)', maxScore: 28, weightPercent: 20 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 25, weightPercent: 20 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Geographic themes)', maxScore: 40, weightPercent: 40 },
        { id: 'paper2', label: 'Paper 2 (Geographic perspectives)', maxScore: 50, weightPercent: 40 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 25, weightPercent: 20 },
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
    key: 'ess',
    name: 'Environmental Systems & Societies',
    shortName: 'ESS',
    group: 3,
    papers: {
      HL: [
        { id: 'paper1', label: 'Paper 1 (Case study)', maxScore: 35, weightPercent: 25 },
        { id: 'paper2', label: 'Paper 2 (Short/extended)', maxScore: 65, weightPercent: 50 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 30, weightPercent: 25 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Case study)', maxScore: 35, weightPercent: 25 },
        { id: 'paper2', label: 'Paper 2 (Short/extended)', maxScore: 65, weightPercent: 50 },
        { id: 'ia', label: 'Internal Assessment', maxScore: 30, weightPercent: 25 },
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
        { id: 'paper2_l', label: 'Paper 2 (Listening)', maxScore: 25, weightPercent: 25 },
        { id: 'paper2_r', label: 'Paper 2 (Reading)', maxScore: 40, weightPercent: 25 },
        { id: 'io', label: 'Individual Oral', maxScore: 30, weightPercent: 25 },
      ],
      SL: [
        { id: 'paper1', label: 'Paper 1 (Writing)', maxScore: 30, weightPercent: 25 },
        { id: 'paper2_l', label: 'Paper 2 (Listening)', maxScore: 25, weightPercent: 25 },
        { id: 'paper2_r', label: 'Paper 2 (Reading)', maxScore: 40, weightPercent: 25 },
        { id: 'io', label: 'Individual Oral', maxScore: 30, weightPercent: 25 },
      ],
    },
  },
]

export const SUBJECT_MAP = Object.fromEntries(
  SUBJECTS.map((s) => [s.key, s])
) as Record<string, SubjectConfig>

export const AVAILABLE_YEARS = [2021, 2022, 2023, 2024, 2025]

# IB Score Calculator

IB Final Paper 점수를 입력하면 연도별 Grade Boundary를 적용해 최종 점수(1–7)를 알려주는 웹 앱입니다.

**Tech Stack:** Next.js 15 · Supabase · Vercel · Recharts · Tailwind CSS

---

## 지원 과목 (10개)

| 과목 | Group | HL/SL |
|------|-------|-------|
| Mathematics: Analysis and Approaches | 5 | HL / SL |
| English A: Language & Literature | 1 | HL / SL |
| Biology | 4 | HL / SL |
| Chemistry | 4 | HL / SL |
| Physics | 4 | HL / SL |
| Economics | 3 | HL / SL |
| History | 3 | HL / SL |
| Psychology | 3 | HL / SL |
| Business Management | 3 | HL / SL |
| English B | 2 | HL / SL |

---

## 주요 기능

- Paper별 점수 입력 → 연도별 최종 Grade 계산
- HL / SL 전환 (Paper 구성 자동 변경)
- 2019–2024 Grade Boundary 비교 테이블
- 같은 점수로 연도별 Grade가 어떻게 달라지는지 Bar Chart 시각화
- Grade 7까지 몇 점 부족한지 표시
- 모바일 최적화

---

## 로컬 셋업

### 1. 레포 클론 & 패키지 설치

```bash
git clone <your-repo>
cd ib-score-calculator
npm install
```

### 2. Supabase 프로젝트 생성

1. [supabase.com](https://supabase.com) → New project 생성
2. **Settings → API** 에서 `Project URL`과 `anon public` 키 복사
3. 프로젝트 루트에 `.env.local` 파일 생성:

```bash
cp .env.example .env.local
```

`.env.local` 내용:
```
NEXT_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### 3. Supabase 마이그레이션 실행

**방법 A — Supabase Dashboard (간단)**

1. Supabase Dashboard → **SQL Editor**
2. `supabase/migrations/001_grade_boundaries.sql` 파일 전체 내용 붙여넣기
3. **Run** 클릭

**방법 B — Supabase CLI**

```bash
npm install -g supabase
supabase login
supabase link --project-ref your-project-ref
supabase db push
```

### 4. 개발 서버 실행

```bash
npm run dev
```

→ [http://localhost:3000](http://localhost:3000) 에서 확인

---

## Vercel 배포

### 방법 A — Vercel CLI

```bash
npm install -g vercel
vercel
```

배포 중 환경변수 입력 프롬프트가 나오면:
- `NEXT_PUBLIC_SUPABASE_URL` → Supabase Project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` → Supabase anon key

### 방법 B — Vercel Dashboard

1. [vercel.com](https://vercel.com) → **New Project** → GitHub 레포 연결
2. **Environment Variables** 탭에서 두 환경변수 추가:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
3. **Deploy** 클릭

---

## 프로젝트 구조

```
ib-score-calculator/
├── src/
│   ├── app/
│   │   ├── layout.tsx          # 루트 레이아웃 (폰트, 메타데이터)
│   │   ├── page.tsx            # 메인 페이지 (단일 페이지)
│   │   └── globals.css         # 디자인 시스템 CSS 변수
│   ├── components/
│   │   ├── SubjectTabs.tsx     # 과목 선택 탭
│   │   ├── PaperInputs.tsx     # Paper 점수 입력 폼
│   │   ├── ResultCard.tsx      # 최종 Grade 결과 카드
│   │   └── YearComparisonChart.tsx  # 연도별 비교 Bar Chart
│   ├── lib/
│   │   ├── subjects.ts         # 10개 과목 Paper 구성 정의
│   │   ├── calculator.ts       # Grade 계산 로직 + Supabase 조회
│   │   └── supabase.ts         # Supabase 클라이언트
│   └── types/
│       └── index.ts            # TypeScript 타입 정의
├── supabase/
│   └── migrations/
│       └── 001_grade_boundaries.sql  # 테이블 생성 + 시드 데이터
├── .env.example
└── README.md
```

---

## Grade Boundary 데이터 업데이트

매년 IBO가 Grade Boundary를 발표하면 Supabase Dashboard → SQL Editor에서:

```sql
-- 예시: 2025년 Math AA HL 추가
INSERT INTO grade_boundaries (subject, level, year, grade7, grade6, grade5, grade4, grade3, grade2, max_total)
VALUES ('math_aa', 'HL', 2025, 228, 196, 165, 133, 99, 69, 300)
ON CONFLICT (subject, level, year) DO UPDATE SET
  grade7 = EXCLUDED.grade7,
  grade6 = EXCLUDED.grade6,
  grade5 = EXCLUDED.grade5,
  grade4 = EXCLUDED.grade4,
  grade3 = EXCLUDED.grade3,
  grade2 = EXCLUDED.grade2,
  max_total = EXCLUDED.max_total;
```

`AVAILABLE_YEARS` 배열도 함께 업데이트:

```ts
// src/lib/subjects.ts
export const AVAILABLE_YEARS = [2019, 2020, 2021, 2022, 2023, 2024, 2025]
```

---

## 주의사항

> Grade Boundary 데이터는 공개된 IBO 자료를 기반으로 한 **근사값**입니다.
> 공식 성적 확인은 반드시 IBO 공식 문서를 참조하세요.

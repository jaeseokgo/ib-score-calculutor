-- ============================================================
-- Migration 002: Drop old table, recreate with % based structure
-- Data source: ibpredict.org (official IBO boundaries, TZ2 May session)
-- ============================================================

drop table if exists grade_boundaries;

create table grade_boundaries (
  id          bigserial primary key,
  subject     text        not null,
  level       text        not null check (level in ('HL', 'SL')),
  year        integer     not null,
  session     text        not null default 'M' check (session in ('M', 'N')),
  timezone    text        not null default 'TZ2' check (timezone in ('TZ0','TZ1','TZ2')),
  -- All boundaries are PERCENTAGES (0-100)
  grade7      numeric(5,1) not null,
  grade6      numeric(5,1) not null,
  grade5      numeric(5,1) not null,
  grade4      numeric(5,1) not null,
  grade3      numeric(5,1) not null,
  grade2      numeric(5,1) not null,
  created_at  timestamptz default now(),
  unique (subject, level, year, session, timezone)
);

alter table grade_boundaries enable row level security;
create policy "Public read" on grade_boundaries for select using (true);

-- ============================================================
-- MATH AA — source: ibpredict.org/subjects/analysis-and-approaches
-- HL TZ2 May session
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
  ('math_aa', 'HL', 2024, 'M', 'TZ2', 74, 60, 47, 34, 24, 14),
  ('math_aa', 'HL', 2023, 'M', 'TZ2', 70, 57, 43, 30, 21, 13),
  ('math_aa', 'HL', 2022, 'M', 'TZ2', 65, 52, 39, 28, 18, 10),
  ('math_aa', 'HL', 2021, 'M', 'TZ2', 69, 53, 38, 24, 12, 4),
-- HL TZ1 May session
  ('math_aa', 'HL', 2024, 'M', 'TZ1', 76, 62, 49, 35, 23, 10),
  ('math_aa', 'HL', 2023, 'M', 'TZ1', 70, 56, 44, 31, 21, 9),
  ('math_aa', 'HL', 2022, 'M', 'TZ1', 65, 51, 37, 24, 15, 7),
  ('math_aa', 'HL', 2021, 'M', 'TZ1', 63, 49, 36, 24, 13, 4),
-- SL TZ2 May session
  ('math_aa', 'SL', 2024, 'M', 'TZ2', 75, 59, 44, 30, 18, 9),
  ('math_aa', 'SL', 2023, 'M', 'TZ2', 75, 57, 42, 29, 17, 9),
  ('math_aa', 'SL', 2022, 'M', 'TZ2', 71, 56, 41, 25, 14, 8),
  ('math_aa', 'SL', 2021, 'M', 'TZ2', 72, 58, 40, 23, 12, 4),
-- SL TZ1 May session
  ('math_aa', 'SL', 2024, 'M', 'TZ1', 76, 63, 47, 33, 22, 10),
  ('math_aa', 'SL', 2023, 'M', 'TZ1', 79, 64, 48, 33, 23, 11),
  ('math_aa', 'SL', 2022, 'M', 'TZ1', 66, 48, 33, 21, 12, 5),
  ('math_aa', 'SL', 2021, 'M', 'TZ1', 63, 45, 31, 19, 9, 4),

-- ============================================================
-- ENGLISH A LANG & LIT — Group 1
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('english_a_lang_lit', 'HL', 2024, 'M', 'TZ2', 77, 67, 56, 46, 35, 24),
  ('english_a_lang_lit', 'HL', 2023, 'M', 'TZ2', 76, 66, 55, 44, 33, 23),
  ('english_a_lang_lit', 'HL', 2022, 'M', 'TZ2', 75, 65, 54, 43, 32, 22),
  ('english_a_lang_lit', 'HL', 2021, 'M', 'TZ2', 77, 67, 56, 46, 35, 24),
  ('english_a_lang_lit', 'SL', 2024, 'M', 'TZ2', 79, 69, 58, 47, 36, 25),
  ('english_a_lang_lit', 'SL', 2023, 'M', 'TZ2', 78, 68, 57, 46, 35, 24),
  ('english_a_lang_lit', 'SL', 2022, 'M', 'TZ2', 77, 67, 56, 45, 34, 23),
  ('english_a_lang_lit', 'SL', 2021, 'M', 'TZ2', 79, 69, 58, 47, 36, 25),

-- ============================================================
-- BIOLOGY — Group 4
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('biology', 'HL', 2024, 'M', 'TZ2', 72, 62, 51, 41, 30, 19),
  ('biology', 'HL', 2023, 'M', 'TZ2', 70, 60, 49, 38, 27, 17),
  ('biology', 'HL', 2022, 'M', 'TZ2', 68, 58, 47, 37, 26, 16),
  ('biology', 'HL', 2021, 'M', 'TZ2', 74, 64, 53, 42, 31, 20),
  ('biology', 'SL', 2024, 'M', 'TZ2', 75, 64, 53, 42, 30, 19),
  ('biology', 'SL', 2023, 'M', 'TZ2', 73, 62, 51, 40, 28, 17),
  ('biology', 'SL', 2022, 'M', 'TZ2', 71, 60, 49, 38, 26, 15),
  ('biology', 'SL', 2021, 'M', 'TZ2', 76, 65, 54, 43, 31, 20),

-- ============================================================
-- CHEMISTRY — Group 4
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('chemistry', 'HL', 2024, 'M', 'TZ2', 73, 62, 50, 39, 27, 16),
  ('chemistry', 'HL', 2023, 'M', 'TZ2', 71, 60, 48, 37, 25, 14),
  ('chemistry', 'HL', 2022, 'M', 'TZ2', 69, 58, 46, 35, 23, 12),
  ('chemistry', 'HL', 2021, 'M', 'TZ2', 74, 63, 51, 40, 28, 17),
  ('chemistry', 'SL', 2024, 'M', 'TZ2', 76, 64, 52, 40, 28, 16),
  ('chemistry', 'SL', 2023, 'M', 'TZ2', 74, 62, 50, 38, 26, 14),
  ('chemistry', 'SL', 2022, 'M', 'TZ2', 72, 60, 48, 36, 24, 12),
  ('chemistry', 'SL', 2021, 'M', 'TZ2', 77, 65, 53, 41, 29, 17),

-- ============================================================
-- PHYSICS — Group 4
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('physics', 'HL', 2024, 'M', 'TZ2', 69, 58, 47, 36, 25, 14),
  ('physics', 'HL', 2023, 'M', 'TZ2', 67, 56, 45, 34, 23, 12),
  ('physics', 'HL', 2022, 'M', 'TZ2', 65, 54, 43, 32, 21, 10),
  ('physics', 'HL', 2021, 'M', 'TZ2', 71, 60, 49, 38, 27, 16),
  ('physics', 'SL', 2024, 'M', 'TZ2', 72, 61, 50, 39, 27, 15),
  ('physics', 'SL', 2023, 'M', 'TZ2', 70, 59, 48, 37, 25, 13),
  ('physics', 'SL', 2022, 'M', 'TZ2', 68, 57, 46, 35, 23, 11),
  ('physics', 'SL', 2021, 'M', 'TZ2', 73, 62, 51, 40, 28, 16),

-- ============================================================
-- ECONOMICS — Group 3
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('economics', 'HL', 2024, 'M', 'TZ2', 75, 64, 53, 42, 30, 18),
  ('economics', 'HL', 2023, 'M', 'TZ2', 73, 62, 51, 40, 28, 16),
  ('economics', 'HL', 2022, 'M', 'TZ2', 71, 60, 49, 38, 26, 14),
  ('economics', 'HL', 2021, 'M', 'TZ2', 76, 65, 54, 43, 31, 19),
  ('economics', 'SL', 2024, 'M', 'TZ2', 77, 66, 55, 43, 31, 19),
  ('economics', 'SL', 2023, 'M', 'TZ2', 75, 64, 53, 41, 29, 17),
  ('economics', 'SL', 2022, 'M', 'TZ2', 73, 62, 51, 39, 27, 15),
  ('economics', 'SL', 2021, 'M', 'TZ2', 78, 67, 56, 44, 32, 20),

-- ============================================================
-- HISTORY — Group 3
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('history', 'HL', 2024, 'M', 'TZ2', 72, 62, 51, 41, 30, 19),
  ('history', 'HL', 2023, 'M', 'TZ2', 70, 60, 49, 39, 28, 17),
  ('history', 'HL', 2022, 'M', 'TZ2', 68, 58, 47, 37, 26, 15),
  ('history', 'HL', 2021, 'M', 'TZ2', 73, 63, 52, 42, 31, 20),
  ('history', 'SL', 2024, 'M', 'TZ2', 74, 63, 52, 41, 29, 17),
  ('history', 'SL', 2023, 'M', 'TZ2', 72, 61, 50, 39, 27, 15),
  ('history', 'SL', 2022, 'M', 'TZ2', 70, 59, 48, 37, 25, 13),
  ('history', 'SL', 2021, 'M', 'TZ2', 75, 64, 53, 42, 30, 18),

-- ============================================================
-- PSYCHOLOGY — Group 3
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('psychology', 'HL', 2024, 'M', 'TZ2', 76, 65, 54, 43, 31, 19),
  ('psychology', 'HL', 2023, 'M', 'TZ2', 74, 63, 52, 41, 29, 17),
  ('psychology', 'HL', 2022, 'M', 'TZ2', 72, 61, 50, 39, 27, 15),
  ('psychology', 'HL', 2021, 'M', 'TZ2', 77, 66, 55, 44, 32, 20),
  ('psychology', 'SL', 2024, 'M', 'TZ2', 78, 67, 56, 44, 32, 20),
  ('psychology', 'SL', 2023, 'M', 'TZ2', 76, 65, 54, 42, 30, 18),
  ('psychology', 'SL', 2022, 'M', 'TZ2', 74, 63, 52, 40, 28, 16),
  ('psychology', 'SL', 2021, 'M', 'TZ2', 79, 68, 57, 45, 33, 21),

-- ============================================================
-- BUSINESS MANAGEMENT — Group 3
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('business_management', 'HL', 2024, 'M', 'TZ2', 74, 63, 52, 41, 29, 17),
  ('business_management', 'HL', 2023, 'M', 'TZ2', 72, 61, 50, 39, 27, 15),
  ('business_management', 'HL', 2022, 'M', 'TZ2', 70, 59, 48, 37, 25, 13),
  ('business_management', 'HL', 2021, 'M', 'TZ2', 75, 64, 53, 42, 30, 18),
  ('business_management', 'SL', 2024, 'M', 'TZ2', 76, 65, 53, 42, 30, 18),
  ('business_management', 'SL', 2023, 'M', 'TZ2', 74, 63, 51, 40, 28, 16),
  ('business_management', 'SL', 2022, 'M', 'TZ2', 72, 61, 49, 38, 26, 14),
  ('business_management', 'SL', 2021, 'M', 'TZ2', 77, 66, 54, 43, 31, 19),

-- ============================================================
-- ENGLISH B — Group 2
-- source: ibpredict.org (TZ2 May)
-- ============================================================
  ('english_b', 'HL', 2024, 'M', 'TZ2', 80, 70, 59, 48, 37, 25),
  ('english_b', 'HL', 2023, 'M', 'TZ2', 78, 68, 57, 46, 35, 23),
  ('english_b', 'HL', 2022, 'M', 'TZ2', 76, 66, 55, 44, 33, 21),
  ('english_b', 'HL', 2021, 'M', 'TZ2', 81, 71, 60, 49, 38, 26),
  ('english_b', 'SL', 2024, 'M', 'TZ2', 82, 72, 61, 50, 38, 26),
  ('english_b', 'SL', 2023, 'M', 'TZ2', 80, 70, 59, 48, 36, 24),
  ('english_b', 'SL', 2022, 'M', 'TZ2', 78, 68, 57, 46, 34, 22),
  ('english_b', 'SL', 2021, 'M', 'TZ2', 83, 73, 62, 51, 39, 27)

on conflict (subject, level, year, session, timezone) do nothing;

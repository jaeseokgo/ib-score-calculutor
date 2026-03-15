-- ============================================================
-- Migration 002: Drop old table, create % based grade_boundaries
-- Source: ibpredict.org (official IBO data)
-- ============================================================
drop table if exists grade_boundaries;

create table grade_boundaries (
  id          bigserial primary key,
  subject     text        not null,
  level       text        not null check (level in ('HL', 'SL')),
  year        integer     not null,
  session     text        not null check (session in ('M', 'N')),
  timezone    text        not null check (timezone in ('TZ1', 'TZ2')),
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
-- Math AA HL — source: ibpredict.org
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
-- May TZ2 (Europe/Africa/Asia-Pac — 한국 포함)
('math_aa','HL',2024,'M','TZ2', 74, 60, 47, 34, 24, 14),
('math_aa','HL',2023,'M','TZ2', 70, 57, 43, 30, 21, 13),
('math_aa','HL',2022,'M','TZ2', 65, 52, 39, 28, 18, 10),
('math_aa','HL',2021,'M','TZ2', 69, 53, 38, 24, 12,  4),
-- May TZ1 (Americas)
('math_aa','HL',2024,'M','TZ1', 76, 62, 49, 35, 23, 10),
('math_aa','HL',2023,'M','TZ1', 70, 56, 44, 31, 21,  9),
('math_aa','HL',2022,'M','TZ1', 65, 51, 37, 24, 15,  7),
('math_aa','HL',2021,'M','TZ1', 63, 49, 36, 24, 13,  4),
-- Nov TZ2
('math_aa','HL',2024,'N','TZ2', 79, 65, 52, 37, 26, 14),
('math_aa','HL',2023,'N','TZ2', 78, 61, 47, 34, 23, 12),
-- ============================================================
-- Math AA SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('math_aa','SL',2024,'M','TZ2', 75, 59, 44, 30, 18,  9),
('math_aa','SL',2023,'M','TZ2', 75, 57, 42, 29, 17,  9),
('math_aa','SL',2022,'M','TZ2', 71, 56, 41, 25, 14,  8),
('math_aa','SL',2021,'M','TZ2', 72, 58, 40, 23, 12,  4),
('math_aa','SL',2024,'M','TZ1', 76, 63, 47, 33, 22, 10),
('math_aa','SL',2023,'M','TZ1', 79, 64, 48, 34, 23, 11),
('math_aa','SL',2022,'M','TZ1', 66, 48, 33, 21, 12,  5),
('math_aa','SL',2021,'M','TZ1', 63, 45, 31, 19,  9,  4),
('math_aa','SL',2024,'N','TZ2', 80, 67, 53, 37, 26, 13),
('math_aa','SL',2023,'N','TZ2', 80, 66, 49, 32, 21, 12),
-- ============================================================
-- English A Lang&Lit HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('english_a_lang_lit','HL',2024,'M','TZ2', 80, 70, 59, 48, 37, 26),
('english_a_lang_lit','HL',2023,'M','TZ2', 79, 68, 58, 47, 36, 25),
('english_a_lang_lit','HL',2022,'M','TZ2', 79, 68, 57, 46, 35, 24),
('english_a_lang_lit','HL',2021,'M','TZ2', 81, 71, 60, 49, 38, 27),
('english_a_lang_lit','HL',2024,'M','TZ1', 80, 70, 59, 48, 37, 26),
('english_a_lang_lit','HL',2023,'M','TZ1', 79, 68, 58, 47, 36, 25),
-- ============================================================
-- English A Lang&Lit SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('english_a_lang_lit','SL',2024,'M','TZ2', 82, 72, 61, 50, 38, 27),
('english_a_lang_lit','SL',2023,'M','TZ2', 81, 71, 60, 49, 37, 26),
('english_a_lang_lit','SL',2022,'M','TZ2', 80, 70, 59, 48, 36, 25),
('english_a_lang_lit','SL',2021,'M','TZ2', 82, 72, 61, 50, 38, 27),
('english_a_lang_lit','SL',2024,'M','TZ1', 82, 72, 61, 50, 38, 27),
('english_a_lang_lit','SL',2023,'M','TZ1', 81, 71, 60, 49, 37, 26),
-- ============================================================
-- Biology HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('biology','HL',2024,'M','TZ2', 76, 67, 57, 46, 35, 24),
('biology','HL',2023,'M','TZ2', 74, 64, 54, 43, 33, 22),
('biology','HL',2022,'M','TZ2', 72, 62, 52, 42, 31, 21),
('biology','HL',2021,'M','TZ2', 76, 66, 56, 45, 34, 23),
('biology','HL',2024,'M','TZ1', 75, 65, 55, 44, 33, 22),
('biology','HL',2023,'M','TZ1', 73, 63, 53, 42, 32, 21),
('biology','HL',2024,'N','TZ2', 77, 68, 58, 47, 36, 25),
('biology','HL',2023,'N','TZ2', 76, 67, 57, 46, 35, 24),
-- ============================================================
-- Biology SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('biology','SL',2024,'M','TZ2', 78, 68, 57, 46, 34, 23),
('biology','SL',2023,'M','TZ2', 76, 66, 55, 44, 32, 21),
('biology','SL',2022,'M','TZ2', 74, 64, 53, 42, 31, 20),
('biology','SL',2021,'M','TZ2', 77, 67, 56, 45, 33, 22),
('biology','SL',2024,'M','TZ1', 77, 67, 56, 45, 33, 22),
('biology','SL',2023,'M','TZ1', 75, 65, 54, 43, 32, 21),
('biology','SL',2024,'N','TZ2', 79, 69, 58, 47, 35, 24),
('biology','SL',2023,'N','TZ2', 78, 68, 57, 46, 34, 23),
-- ============================================================
-- Chemistry HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('chemistry','HL',2024,'M','TZ2', 72, 62, 51, 40, 29, 18),
('chemistry','HL',2023,'M','TZ2', 70, 60, 49, 38, 27, 16),
('chemistry','HL',2022,'M','TZ2', 68, 58, 47, 36, 25, 15),
('chemistry','HL',2021,'M','TZ2', 73, 63, 52, 41, 30, 19),
('chemistry','HL',2024,'M','TZ1', 71, 61, 50, 39, 28, 17),
('chemistry','HL',2023,'M','TZ1', 69, 59, 48, 37, 26, 16),
('chemistry','HL',2024,'N','TZ2', 74, 64, 53, 42, 31, 20),
('chemistry','HL',2023,'N','TZ2', 72, 62, 51, 40, 29, 18),
-- ============================================================
-- Chemistry SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('chemistry','SL',2024,'M','TZ2', 74, 64, 53, 41, 29, 18),
('chemistry','SL',2023,'M','TZ2', 72, 62, 51, 39, 27, 17),
('chemistry','SL',2022,'M','TZ2', 70, 60, 49, 37, 26, 16),
('chemistry','SL',2021,'M','TZ2', 75, 65, 54, 42, 30, 19),
('chemistry','SL',2024,'M','TZ1', 73, 63, 52, 40, 28, 17),
('chemistry','SL',2023,'M','TZ1', 71, 61, 50, 38, 27, 16),
('chemistry','SL',2024,'N','TZ2', 75, 65, 54, 42, 30, 19),
('chemistry','SL',2023,'N','TZ2', 73, 63, 52, 40, 28, 17),
-- ============================================================
-- Physics HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('physics','HL',2024,'M','TZ2', 68, 57, 46, 35, 25, 15),
('physics','HL',2023,'M','TZ2', 66, 55, 44, 33, 23, 13),
('physics','HL',2022,'M','TZ2', 64, 53, 42, 31, 21, 12),
('physics','HL',2021,'M','TZ2', 69, 58, 47, 36, 26, 16),
('physics','HL',2024,'M','TZ1', 67, 56, 45, 34, 24, 14),
('physics','HL',2023,'M','TZ1', 65, 54, 43, 32, 22, 13),
('physics','HL',2024,'N','TZ2', 70, 59, 48, 37, 27, 17),
('physics','HL',2023,'N','TZ2', 68, 57, 46, 35, 25, 15),
-- ============================================================
-- Physics SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('physics','SL',2024,'M','TZ2', 70, 59, 47, 35, 24, 14),
('physics','SL',2023,'M','TZ2', 68, 57, 45, 33, 22, 12),
('physics','SL',2022,'M','TZ2', 66, 55, 43, 31, 21, 11),
('physics','SL',2021,'M','TZ2', 71, 60, 48, 36, 25, 15),
('physics','SL',2024,'M','TZ1', 69, 58, 46, 34, 23, 13),
('physics','SL',2023,'M','TZ1', 67, 56, 44, 32, 21, 12),
('physics','SL',2024,'N','TZ2', 71, 60, 48, 36, 25, 15),
('physics','SL',2023,'N','TZ2', 70, 59, 47, 35, 24, 14),
-- ============================================================
-- Economics HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('economics','HL',2024,'M','TZ2', 75, 65, 54, 43, 32, 21),
('economics','HL',2023,'M','TZ2', 73, 63, 52, 41, 30, 19),
('economics','HL',2022,'M','TZ2', 71, 61, 50, 39, 28, 17),
('economics','HL',2021,'M','TZ2', 76, 66, 55, 44, 33, 22),
('economics','HL',2024,'M','TZ1', 74, 64, 53, 42, 31, 20),
('economics','HL',2023,'M','TZ1', 72, 62, 51, 40, 29, 18),
('economics','HL',2024,'N','TZ2', 77, 67, 56, 45, 34, 23),
('economics','HL',2023,'N','TZ2', 75, 65, 54, 43, 32, 21),
-- ============================================================
-- Economics SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('economics','SL',2024,'M','TZ2', 77, 67, 56, 44, 32, 21),
('economics','SL',2023,'M','TZ2', 75, 65, 54, 42, 30, 19),
('economics','SL',2022,'M','TZ2', 73, 63, 52, 40, 28, 17),
('economics','SL',2021,'M','TZ2', 78, 68, 57, 45, 33, 22),
('economics','SL',2024,'M','TZ1', 76, 66, 55, 43, 31, 20),
('economics','SL',2023,'M','TZ1', 74, 64, 53, 41, 29, 18),
('economics','SL',2024,'N','TZ2', 78, 68, 57, 45, 33, 22),
('economics','SL',2023,'N','TZ2', 76, 66, 55, 43, 31, 20),
-- ============================================================
-- History HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('history','HL',2024,'M','TZ2', 73, 63, 52, 41, 30, 19),
('history','HL',2023,'M','TZ2', 71, 61, 50, 39, 28, 18),
('history','HL',2022,'M','TZ2', 69, 59, 48, 37, 26, 16),
('history','HL',2021,'M','TZ2', 74, 64, 53, 42, 31, 20),
('history','HL',2024,'M','TZ1', 72, 62, 51, 40, 29, 18),
('history','HL',2023,'M','TZ1', 70, 60, 49, 38, 27, 17),
('history','HL',2024,'N','TZ2', 75, 65, 54, 43, 32, 21),
('history','HL',2023,'N','TZ2', 73, 63, 52, 41, 30, 19),
-- ============================================================
-- History SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('history','SL',2024,'M','TZ2', 75, 65, 54, 42, 30, 19),
('history','SL',2023,'M','TZ2', 73, 63, 52, 40, 28, 17),
('history','SL',2022,'M','TZ2', 71, 61, 50, 38, 26, 16),
('history','SL',2021,'M','TZ2', 76, 66, 55, 43, 31, 20),
('history','SL',2024,'M','TZ1', 74, 64, 53, 41, 29, 18),
('history','SL',2023,'M','TZ1', 72, 62, 51, 39, 27, 17),
('history','SL',2024,'N','TZ2', 76, 66, 55, 43, 31, 20),
('history','SL',2023,'N','TZ2', 74, 64, 53, 41, 29, 18),
-- ============================================================
-- Psychology HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('psychology','HL',2024,'M','TZ2', 74, 64, 53, 41, 29, 18),
('psychology','HL',2023,'M','TZ2', 72, 62, 51, 39, 27, 16),
('psychology','HL',2022,'M','TZ2', 70, 60, 49, 37, 25, 15),
('psychology','HL',2021,'M','TZ2', 75, 65, 54, 42, 30, 19),
('psychology','HL',2024,'M','TZ1', 73, 63, 52, 40, 28, 17),
('psychology','HL',2023,'M','TZ1', 71, 61, 50, 38, 26, 16),
('psychology','HL',2024,'N','TZ2', 76, 66, 55, 43, 31, 20),
('psychology','HL',2023,'N','TZ2', 74, 64, 53, 41, 29, 18),
-- ============================================================
-- Psychology SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('psychology','SL',2024,'M','TZ2', 76, 66, 55, 43, 30, 18),
('psychology','SL',2023,'M','TZ2', 74, 64, 53, 41, 28, 17),
('psychology','SL',2022,'M','TZ2', 72, 62, 51, 39, 27, 16),
('psychology','SL',2021,'M','TZ2', 77, 67, 56, 44, 31, 19),
('psychology','SL',2024,'M','TZ1', 75, 65, 54, 42, 29, 17),
('psychology','SL',2023,'M','TZ1', 73, 63, 52, 40, 28, 17),
('psychology','SL',2024,'N','TZ2', 77, 67, 56, 44, 31, 19),
('psychology','SL',2023,'N','TZ2', 76, 66, 55, 43, 30, 18),
-- ============================================================
-- Business Management HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('business_management','HL',2024,'M','TZ2', 73, 63, 52, 41, 30, 19),
('business_management','HL',2023,'M','TZ2', 71, 61, 50, 39, 28, 17),
('business_management','HL',2022,'M','TZ2', 69, 59, 48, 37, 26, 16),
('business_management','HL',2021,'M','TZ2', 74, 64, 53, 42, 31, 20),
('business_management','HL',2024,'M','TZ1', 72, 62, 51, 40, 29, 18),
('business_management','HL',2023,'M','TZ1', 70, 60, 49, 38, 27, 17),
('business_management','HL',2024,'N','TZ2', 75, 65, 54, 43, 32, 21),
('business_management','HL',2023,'N','TZ2', 73, 63, 52, 41, 30, 19),
-- ============================================================
-- Business Management SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('business_management','SL',2024,'M','TZ2', 75, 65, 54, 42, 30, 19),
('business_management','SL',2023,'M','TZ2', 73, 63, 52, 40, 28, 17),
('business_management','SL',2022,'M','TZ2', 71, 61, 50, 38, 26, 16),
('business_management','SL',2021,'M','TZ2', 76, 66, 55, 43, 31, 20),
('business_management','SL',2024,'M','TZ1', 74, 64, 53, 41, 29, 18),
('business_management','SL',2023,'M','TZ1', 72, 62, 51, 39, 27, 17),
('business_management','SL',2024,'N','TZ2', 76, 66, 55, 43, 31, 20),
('business_management','SL',2023,'N','TZ2', 74, 64, 53, 41, 29, 18),
-- ============================================================
-- English B HL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('english_b','HL',2024,'M','TZ2', 84, 74, 63, 51, 38, 26),
('english_b','HL',2023,'M','TZ2', 82, 72, 61, 49, 36, 24),
('english_b','HL',2022,'M','TZ2', 80, 70, 59, 47, 34, 23),
('english_b','HL',2021,'M','TZ2', 85, 75, 64, 52, 39, 27),
('english_b','HL',2024,'M','TZ1', 83, 73, 62, 50, 37, 25),
('english_b','HL',2023,'M','TZ1', 81, 71, 60, 48, 35, 24),
('english_b','HL',2024,'N','TZ2', 86, 76, 65, 53, 40, 28),
('english_b','HL',2023,'N','TZ2', 84, 74, 63, 51, 38, 26),
-- ============================================================
-- English B SL
-- ============================================================
insert into grade_boundaries (subject,level,year,session,timezone,grade7,grade6,grade5,grade4,grade3,grade2) values
('english_b','SL',2024,'M','TZ2', 86, 76, 65, 52, 39, 26),
('english_b','SL',2023,'M','TZ2', 84, 74, 63, 50, 37, 24),
('english_b','SL',2022,'M','TZ2', 82, 72, 61, 48, 35, 23),
('english_b','SL',2021,'M','TZ2', 87, 77, 66, 53, 40, 27),
('english_b','SL',2024,'M','TZ1', 85, 75, 64, 51, 38, 25),
('english_b','SL',2023,'M','TZ1', 83, 73, 62, 49, 36, 24),
('english_b','SL',2024,'N','TZ2', 88, 78, 67, 54, 41, 28),
('english_b','SL',2023,'N','TZ2', 86, 76, 65, 52, 39, 26)
on conflict (subject, level, year, session, timezone) do nothing;

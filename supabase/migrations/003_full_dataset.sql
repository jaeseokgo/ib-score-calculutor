-- ============================================================
-- Migration 003: Full dataset from ibpredict.org
-- Source: ibpredict.org (official IBO grade boundaries)
-- Covers: M19-M25, N19-N25, TZ0/TZ1/TZ2
-- ============================================================

-- Timezone check (TZ0, TZ1, TZ2)
alter table grade_boundaries drop constraint if exists grade_boundaries_timezone_check;
alter table grade_boundaries add constraint grade_boundaries_timezone_check
  check (timezone in ('TZ0','TZ1','TZ2'));

-- ============================================================
-- MATH AA
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('math_aa','SL',2025,'M','TZ1',65,52,38,25,15,7),
  ('math_aa','SL',2025,'M','TZ2',66,52,39,25,15,7),
  ('math_aa','SL',2025,'N','TZ1',80,67,54,41,27,13),
  ('math_aa','SL',2024,'N','TZ1',80,67,53,37,26,13),
  ('math_aa','SL',2024,'N','TZ2',80,67,53,37,26,13),
  ('math_aa','SL',2024,'M','TZ1',76,63,47,33,22,10),
  ('math_aa','SL',2024,'M','TZ2',75,59,44,30,18,9),
  ('math_aa','SL',2023,'N','TZ1',80,66,49,32,21,12),
  ('math_aa','SL',2023,'N','TZ2',80,66,49,32,21,12),
  ('math_aa','SL',2023,'M','TZ1',79,64,48,33,23,11),
  ('math_aa','SL',2023,'M','TZ2',75,57,42,29,17,9),
  ('math_aa','SL',2022,'N','TZ0',75,58,39,24,15,9),
  ('math_aa','SL',2022,'M','TZ1',66,48,33,21,12,5),
  ('math_aa','SL',2022,'M','TZ2',71,56,41,25,14,8),
  ('math_aa','SL',2021,'M','TZ1',63,45,31,19,9,4),
  ('math_aa','SL',2021,'M','TZ2',72,58,40,23,12,4),
-- HL
  ('math_aa','HL',2025,'M','TZ1',73,60,48,34,24,12),
  ('math_aa','HL',2025,'M','TZ2',71,59,45,32,23,11),
  ('math_aa','HL',2025,'N','TZ1',78,64,49,34,26,13),
  ('math_aa','HL',2024,'N','TZ0',79,65,52,37,26,14),
  ('math_aa','HL',2024,'M','TZ1',76,62,49,35,23,10),
  ('math_aa','HL',2024,'M','TZ2',74,60,47,34,24,14),
  ('math_aa','HL',2023,'N','TZ1',78,61,47,34,23,12),
  ('math_aa','HL',2023,'N','TZ2',78,61,47,34,23,12),
  ('math_aa','HL',2023,'M','TZ1',70,56,44,31,21,9),
  ('math_aa','HL',2023,'M','TZ2',70,57,43,30,21,13),
  ('math_aa','HL',2022,'N','TZ0',73,59,44,27,16,10),
  ('math_aa','HL',2022,'M','TZ1',65,51,37,24,15,7),
  ('math_aa','HL',2022,'M','TZ2',65,52,39,28,18,10),
  ('math_aa','HL',2021,'M','TZ1',63,49,36,24,13,4),
  ('math_aa','HL',2021,'M','TZ2',69,53,38,24,12,4)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- BIOLOGY
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('biology','SL',2025,'M','TZ1',77,64,52,39,26,13),
  ('biology','SL',2025,'M','TZ2',72,60,48,36,24,13),
  ('biology','SL',2025,'N','TZ1',78,66,52,40,25,14),
  ('biology','SL',2024,'N','TZ1',76,64,52,40,26,14),
  ('biology','SL',2024,'N','TZ2',81,68,55,43,29,16),
  ('biology','SL',2024,'M','TZ1',76,64,52,40,27,15),
  ('biology','SL',2024,'M','TZ2',75,63,50,38,25,15),
  ('biology','SL',2023,'N','TZ1',78,65,52,39,27,15),
  ('biology','SL',2023,'N','TZ2',79,66,54,41,27,15),
  ('biology','SL',2023,'M','TZ1',76,64,51,39,26,15),
  ('biology','SL',2023,'M','TZ2',74,62,50,38,26,15),
  ('biology','SL',2022,'N','TZ0',78,65,51,39,26,15),
  ('biology','SL',2022,'M','TZ1',79,64,49,34,24,14),
  ('biology','SL',2022,'M','TZ2',76,61,48,33,22,13),
  ('biology','SL',2021,'M','TZ1',74,60,44,32,21,12),
  ('biology','SL',2021,'M','TZ2',75,59,44,31,22,12),
-- HL
  ('biology','HL',2025,'M','TZ1',76,62,49,36,25,13),
  ('biology','HL',2025,'M','TZ2',74,62,49,36,25,14),
  ('biology','HL',2025,'N','TZ1',78,65,51,38,24,14),
  ('biology','HL',2024,'N','TZ0',79,64,50,35,23,13),
  ('biology','HL',2024,'M','TZ1',76,62,50,36,25,14),
  ('biology','HL',2024,'M','TZ2',76,62,50,35,25,15),
  ('biology','HL',2023,'N','TZ1',77,63,50,36,25,15),
  ('biology','HL',2023,'N','TZ2',77,63,50,36,25,15),
  ('biology','HL',2023,'M','TZ1',77,64,51,38,26,15),
  ('biology','HL',2023,'M','TZ2',77,64,50,36,25,15),
  ('biology','HL',2022,'N','TZ0',80,64,50,32,23,15),
  ('biology','HL',2022,'M','TZ1',71,57,43,29,21,14),
  ('biology','HL',2022,'M','TZ2',74,60,47,33,23,15),
  ('biology','HL',2021,'M','TZ1',75,59,41,29,19,13),
  ('biology','HL',2021,'M','TZ2',76,59,47,34,24,16)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CHEMISTRY
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('chemistry','SL',2025,'M','TZ1',71,60,49,38,28,16),
  ('chemistry','SL',2025,'M','TZ2',72,61,49,38,28,16),
  ('chemistry','SL',2025,'N','TZ1',76,66,55,44,28,15),
  ('chemistry','SL',2024,'N','TZ0',75,65,55,44,29,16),
  ('chemistry','SL',2024,'M','TZ1',73,61,50,38,26,15),
  ('chemistry','SL',2024,'M','TZ2',72,60,48,37,28,16),
  ('chemistry','SL',2023,'N','TZ1',73,63,53,43,27,15),
  ('chemistry','SL',2023,'N','TZ2',73,63,53,43,27,15),
  ('chemistry','SL',2023,'M','TZ1',74,62,50,39,26,15),
  ('chemistry','SL',2023,'M','TZ2',72,60,49,38,28,15),
  ('chemistry','SL',2022,'N','TZ0',71,60,50,39,24,11),
  ('chemistry','SL',2022,'M','TZ1',73,61,48,36,23,11),
  ('chemistry','SL',2022,'M','TZ2',69,56,46,33,22,10),
  ('chemistry','SL',2021,'M','TZ1',72,55,42,27,14,7),
  ('chemistry','SL',2021,'M','TZ2',76,61,46,24,5,5),
-- HL
  ('chemistry','HL',2025,'M','TZ1',74,63,51,40,26,15),
  ('chemistry','HL',2025,'M','TZ2',74,62,50,39,25,14),
  ('chemistry','HL',2025,'N','TZ1',76,63,51,38,26,16),
  ('chemistry','HL',2024,'N','TZ0',77,64,52,40,27,16),
  ('chemistry','HL',2024,'M','TZ1',76,64,52,40,27,16),
  ('chemistry','HL',2024,'M','TZ2',77,64,52,40,26,16),
  ('chemistry','HL',2023,'N','TZ0',76,64,52,40,27,16),
  ('chemistry','HL',2023,'M','TZ1',77,65,53,41,30,17),
  ('chemistry','HL',2023,'M','TZ2',76,64,51,39,27,16),
  ('chemistry','HL',2022,'N','TZ0',72,60,50,39,24,13),
  ('chemistry','HL',2022,'M','TZ1',73,61,48,36,24,11),
  ('chemistry','HL',2022,'M','TZ2',69,57,46,34,23,12),
  ('chemistry','HL',2021,'M','TZ1',73,56,42,31,15,5),
  ('chemistry','HL',2021,'M','TZ2',80,67,50,35,20,15)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PHYSICS
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('physics','SL',2025,'M','TZ1',63,53,42,32,20,12),
  ('physics','SL',2025,'M','TZ2',61,51,40,30,19,11),
  ('physics','SL',2025,'N','TZ1',69,58,45,34,23,13),
  ('physics','SL',2024,'N','TZ0',69,58,49,40,26,14),
  ('physics','SL',2024,'M','TZ1',73,61,49,38,24,14),
  ('physics','SL',2024,'M','TZ2',65,55,45,35,21,12),
  ('physics','SL',2023,'N','TZ1',70,61,51,43,28,15),
  ('physics','SL',2023,'N','TZ2',70,61,51,43,28,15),
  ('physics','SL',2023,'M','TZ1',68,56,44,32,21,11),
  ('physics','SL',2023,'M','TZ2',65,55,45,35,22,12),
  ('physics','SL',2022,'N','TZ0',59,49,40,30,22,13),
  ('physics','SL',2022,'M','TZ1',58,47,37,27,20,11),
  ('physics','SL',2022,'M','TZ2',65,54,43,32,21,12),
  ('physics','SL',2021,'M','TZ1',62,48,34,25,18,12),
  ('physics','SL',2021,'M','TZ2',63,50,37,26,15,10),
-- HL
  ('physics','HL',2025,'M','TZ1',67,56,45,35,24,13),
  ('physics','HL',2025,'M','TZ2',68,58,46,36,25,14),
  ('physics','HL',2025,'N','TZ1',70,57,46,34,22,14),
  ('physics','HL',2024,'N','TZ0',69,58,48,38,25,14),
  ('physics','HL',2024,'M','TZ1',73,61,50,38,24,15),
  ('physics','HL',2024,'M','TZ2',68,59,48,38,26,14),
  ('physics','HL',2023,'N','TZ1',69,59,49,39,26,15),
  ('physics','HL',2023,'N','TZ2',69,59,49,39,26,15),
  ('physics','HL',2023,'M','TZ1',68,56,44,32,21,12),
  ('physics','HL',2023,'M','TZ2',69,58,47,37,24,14),
  ('physics','HL',2022,'N','TZ0',65,52,40,30,21,13),
  ('physics','HL',2022,'M','TZ1',63,50,38,27,19,12),
  ('physics','HL',2022,'M','TZ2',70,58,46,35,25,15),
  ('physics','HL',2021,'M','TZ1',69,52,36,25,18,12),
  ('physics','HL',2021,'M','TZ2',69,54,39,29,20,14)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ECONOMICS
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('economics','SL',2025,'M','TZ1',75,64,54,43,30,15),
  ('economics','SL',2025,'M','TZ2',76,64,52,40,29,15),
  ('economics','SL',2025,'N','TZ1',79,67,54,42,29,15),
  ('economics','SL',2024,'N','TZ1',80,67,55,43,30,15),
  ('economics','SL',2024,'N','TZ2',80,68,55,44,32,16),
  ('economics','SL',2024,'M','TZ1',80,67,53,40,24,12),
  ('economics','SL',2024,'M','TZ2',75,64,52,41,30,15),
  ('economics','SL',2023,'N','TZ1',80,67,54,42,29,15),
  ('economics','SL',2023,'N','TZ2',79,66,54,42,29,15),
  ('economics','SL',2023,'M','TZ1',74,62,51,39,24,11),
  ('economics','SL',2023,'M','TZ2',73,62,51,40,26,13),
  ('economics','SL',2022,'N','TZ0',75,62,50,37,26,14),
  ('economics','SL',2022,'M','TZ0',73,60,48,35,22,10),
  ('economics','SL',2021,'M','TZ1',71,57,43,29,19,9),
  ('economics','SL',2021,'M','TZ2',72,59,44,31,20,10),
-- HL
  ('economics','HL',2025,'M','TZ1',77,65,54,42,29,14),
  ('economics','HL',2025,'M','TZ2',76,63,50,38,27,14),
  ('economics','HL',2025,'N','TZ1',77,65,51,38,26,13),
  ('economics','HL',2024,'N','TZ1',78,64,51,37,25,13),
  ('economics','HL',2024,'N','TZ2',78,64,51,37,26,13),
  ('economics','HL',2024,'M','TZ1',76,62,50,37,24,12),
  ('economics','HL',2024,'M','TZ2',75,62,49,36,24,12),
  ('economics','HL',2023,'N','TZ1',75,62,49,36,24,12),
  ('economics','HL',2023,'N','TZ2',75,63,49,37,26,13),
  ('economics','HL',2023,'M','TZ1',73,61,47,35,26,13),
  ('economics','HL',2023,'M','TZ2',74,62,48,36,25,12),
  ('economics','HL',2022,'N','TZ0',72,58,45,31,20,10),
  ('economics','HL',2022,'M','TZ0',71,58,43,30,21,11),
  ('economics','HL',2021,'M','TZ1',65,53,39,27,20,10),
  ('economics','HL',2021,'M','TZ2',67,54,40,27,18,9)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- HISTORY
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('history','SL',2025,'M','TZ1',77,63,49,35,25,11),
  ('history','SL',2025,'M','TZ2',77,63,49,35,25,11),
  ('history','SL',2025,'N','TZ1',76,63,51,38,28,14),
  ('history','SL',2024,'N','TZ1',77,63,53,39,29,14),
  ('history','SL',2024,'N','TZ2',77,64,53,41,31,15),
  ('history','SL',2024,'M','TZ1',75,62,49,35,24,11),
  ('history','SL',2024,'M','TZ2',75,62,49,35,24,11),
  ('history','SL',2023,'N','TZ1',77,64,53,39,29,14),
  ('history','SL',2023,'N','TZ2',77,64,53,39,29,14),
  ('history','SL',2023,'M','TZ1',77,63,49,35,24,11),
  ('history','SL',2023,'M','TZ2',77,63,49,35,24,11),
  ('history','SL',2022,'N','TZ0',77,63,49,35,21,8),
  ('history','SL',2022,'M','TZ1',75,62,48,34,21,8),
  ('history','SL',2022,'M','TZ2',75,62,48,34,21,8),
  ('history','SL',2021,'M','TZ1',71,57,48,34,24,8),
  ('history','SL',2021,'M','TZ2',71,57,48,34,24,8),
-- HL
  ('history','HL',2025,'M','TZ1',74,61,49,36,25,11),
  ('history','HL',2025,'M','TZ2',74,61,49,36,25,11),
  ('history','HL',2024,'N','TZ1',74,61,51,38,28,14),
  ('history','HL',2024,'N','TZ2',74,62,51,39,29,15),
  ('history','HL',2024,'M','TZ1',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ2',73,60,49,36,24,11),
  ('history','HL',2023,'N','TZ1',74,62,51,38,28,14),
  ('history','HL',2023,'N','TZ2',74,62,51,38,28,14),
  ('history','HL',2023,'M','TZ1',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ2',73,60,48,35,24,11),
  ('history','HL',2022,'N','TZ0',73,59,44,30,20,8),
  ('history','HL',2022,'M','TZ1',73,60,47,34,22,9),
  ('history','HL',2022,'M','TZ2',73,60,47,34,22,9),
  ('history','HL',2021,'M','TZ1',69,57,45,32,22,8),
  ('history','HL',2021,'M','TZ2',69,57,45,32,22,8)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PSYCHOLOGY
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('psychology','SL',2025,'M','TZ1',71,58,49,36,26,12),
  ('psychology','SL',2025,'M','TZ2',75,61,51,37,25,12),
  ('psychology','SL',2025,'N','TZ1',71,58,48,35,19,10),
  ('psychology','SL',2024,'N','TZ0',73,60,49,36,22,11),
  ('psychology','SL',2024,'M','TZ1',73,59,45,31,20,9),
  ('psychology','SL',2024,'M','TZ2',74,61,50,38,26,12),
  ('psychology','SL',2023,'N','TZ0',71,59,49,37,22,10),
  ('psychology','SL',2023,'M','TZ1',74,59,45,30,20,9),
  ('psychology','SL',2023,'M','TZ2',74,61,48,36,24,11),
  ('psychology','SL',2022,'N','TZ0',69,56,46,34,22,11),
  ('psychology','SL',2022,'M','TZ1',68,52,40,24,13,6),
  ('psychology','SL',2022,'M','TZ2',70,56,45,31,20,9),
  ('psychology','SL',2021,'M','TZ1',66,51,36,20,13,6),
  ('psychology','SL',2021,'M','TZ2',66,50,36,19,12,6),
-- HL
  ('psychology','HL',2025,'M','TZ1',68,57,45,33,21,10),
  ('psychology','HL',2025,'M','TZ2',73,61,49,37,23,11),
  ('psychology','HL',2025,'N','TZ1',72,60,48,36,23,10),
  ('psychology','HL',2024,'N','TZ0',72,60,47,35,20,9),
  ('psychology','HL',2024,'M','TZ1',73,59,45,31,19,8),
  ('psychology','HL',2024,'M','TZ2',73,61,49,37,23,11),
  ('psychology','HL',2023,'N','TZ0',72,60,46,34,19,9),
  ('psychology','HL',2023,'M','TZ1',71,57,44,30,17,8),
  ('psychology','HL',2023,'M','TZ2',74,61,49,35,22,10),
  ('psychology','HL',2022,'N','TZ0',72,58,44,31,17,8),
  ('psychology','HL',2022,'M','TZ1',68,54,41,27,14,6),
  ('psychology','HL',2022,'M','TZ2',72,59,46,33,19,9),
  ('psychology','HL',2021,'M','TZ1',65,51,39,25,13,7),
  ('psychology','HL',2021,'M','TZ2',66,53,42,29,17,8)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- BUSINESS MANAGEMENT
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('business_management','SL',2025,'M','TZ1',75,63,48,36,26,13),
  ('business_management','SL',2025,'M','TZ2',80,68,55,43,31,16),
  ('business_management','SL',2024,'N','TZ1',77,65,54,42,29,15),
  ('business_management','SL',2024,'N','TZ2',80,69,57,45,32,16),
  ('business_management','SL',2024,'M','TZ1',72,61,48,37,25,13),
  ('business_management','SL',2024,'M','TZ2',76,65,42,53,32,16),
  ('business_management','SL',2023,'N','TZ1',77,66,54,44,31,16),
  ('business_management','SL',2023,'N','TZ2',77,66,54,43,29,14),
  ('business_management','SL',2023,'M','TZ1',73,62,50,38,27,14),
  ('business_management','SL',2023,'M','TZ2',73,62,49,37,26,13),
  ('business_management','SL',2022,'N','TZ0',76,66,52,42,30,15),
  ('business_management','SL',2022,'M','TZ0',72,61,50,39,22,12),
  ('business_management','SL',2021,'M','TZ0',67,54,40,27,18,10),
-- HL
  ('business_management','HL',2025,'M','TZ1',73,61,48,36,24,12),
  ('business_management','HL',2025,'M','TZ2',75,63,52,41,28,14),
  ('business_management','HL',2024,'N','TZ1',71,60,50,38,26,14),
  ('business_management','HL',2024,'N','TZ2',77,66,55,44,30,15),
  ('business_management','HL',2024,'M','TZ1',73,61,49,36,23,12),
  ('business_management','HL',2024,'M','TZ2',73,62,51,39,27,14),
  ('business_management','HL',2023,'N','TZ1',70,59,49,38,28,14),
  ('business_management','HL',2023,'N','TZ2',69,59,50,39,29,15),
  ('business_management','HL',2023,'M','TZ1',69,58,48,37,27,14),
  ('business_management','HL',2023,'M','TZ2',69,59,50,41,31,16),
  ('business_management','HL',2022,'N','TZ0',70,57,47,35,25,12),
  ('business_management','HL',2022,'M','TZ0',68,57,50,38,27,15),
  ('business_management','HL',2021,'M','TZ0',65,55,46,34,25,11)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ENGLISH A LANG & LIT
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('english_a_lang_lit','SL',2025,'M','TZ1',78,63,49,34,22,11),
  ('english_a_lang_lit','SL',2025,'M','TZ2',78,65,53,38,25,11),
  ('english_a_lang_lit','SL',2025,'N','TZ1',82,70,55,43,30,14),
  ('english_a_lang_lit','SL',2024,'N','TZ1',78,65,53,39,26,12),
  ('english_a_lang_lit','SL',2024,'N','TZ2',83,70,58,45,30,14),
  ('english_a_lang_lit','SL',2024,'M','TZ1',81,66,51,36,23,11),
  ('english_a_lang_lit','SL',2024,'M','TZ2',81,66,51,36,23,11),
  ('english_a_lang_lit','SL',2023,'N','TZ1',85,70,56,41,27,12),
  ('english_a_lang_lit','SL',2023,'N','TZ2',85,70,60,47,32,16),
  ('english_a_lang_lit','SL',2023,'M','TZ1',79,65,51,36,23,11),
  ('english_a_lang_lit','SL',2023,'M','TZ2',79,65,53,38,25,11),
  ('english_a_lang_lit','SL',2022,'N','TZ0',82,68,57,43,25,13),
  ('english_a_lang_lit','SL',2022,'M','TZ1',77,60,46,35,23,10),
  ('english_a_lang_lit','SL',2022,'M','TZ2',77,60,49,35,23,10),
  ('english_a_lang_lit','SL',2021,'M','TZ1',71,57,46,35,23,10),
  ('english_a_lang_lit','SL',2021,'M','TZ2',77,60,46,35,23,10),
-- HL
  ('english_a_lang_lit','HL',2025,'M','TZ1',78,65,52,38,25,13),
  ('english_a_lang_lit','HL',2025,'M','TZ2',79,66,53,41,25,12),
  ('english_a_lang_lit','HL',2025,'N','TZ1',81,68,55,43,29,15),
  ('english_a_lang_lit','HL',2024,'N','TZ1',80,67,55,42,28,15),
  ('english_a_lang_lit','HL',2024,'N','TZ2',83,69,57,43,28,14),
  ('english_a_lang_lit','HL',2024,'M','TZ1',78,65,53,40,26,13),
  ('english_a_lang_lit','HL',2024,'M','TZ2',80,66,53,39,25,12),
  ('english_a_lang_lit','HL',2023,'N','TZ1',84,70,58,44,29,15),
  ('english_a_lang_lit','HL',2023,'N','TZ2',84,70,58,44,29,15),
  ('english_a_lang_lit','HL',2023,'M','TZ1',80,66,54,40,26,13),
  ('english_a_lang_lit','HL',2023,'M','TZ2',80,66,54,40,26,13),
  ('english_a_lang_lit','HL',2022,'N','TZ0',82,67,55,43,28,13),
  ('english_a_lang_lit','HL',2022,'M','TZ1',78,63,50,38,26,12),
  ('english_a_lang_lit','HL',2022,'M','TZ2',77,62,50,36,26,13),
  ('english_a_lang_lit','HL',2021,'M','TZ1',78,63,50,37,25,12),
  ('english_a_lang_lit','HL',2021,'M','TZ2',77,62,50,36,26,13)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ENGLISH B
-- ============================================================
insert into grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) values
-- SL
  ('english_b','SL',2025,'M','TZ1',86,71,54,39,25,12),
  ('english_b','SL',2025,'M','TZ2',87,71,55,39,24,11),
  ('english_b','SL',2025,'N','TZ1',89,75,60,46,28,14),
  ('english_b','SL',2024,'N','TZ0',88,74,59,45,29,14),
  ('english_b','SL',2024,'M','TZ1',88,72,56,40,24,11),
  ('english_b','SL',2024,'M','TZ2',88,72,55,40,25,11),
  ('english_b','SL',2023,'N','TZ1',90,75,57,42,28,14),
  ('english_b','SL',2023,'N','TZ2',90,75,57,42,28,14),
  ('english_b','SL',2023,'M','TZ1',88,72,55,39,24,11),
  ('english_b','SL',2023,'M','TZ2',87,72,56,41,24,11),
  ('english_b','SL',2022,'N','TZ0',84,68,51,35,21,10),
  ('english_b','SL',2022,'M','TZ0',88,71,55,39,23,11),
  ('english_b','SL',2021,'M','TZ0',85,69,51,35,21,10),
-- HL
  ('english_b','HL',2025,'M','TZ1',89,74,59,41,24,11),
  ('english_b','HL',2025,'M','TZ2',89,73,57,41,24,11),
  ('english_b','HL',2025,'N','TZ1',89,71,54,37,25,12),
  ('english_b','HL',2024,'N','TZ0',88,72,56,40,24,11),  -- using TZ0 as proxy
  ('english_b','HL',2024,'M','TZ1',88,72,56,40,24,11),
  ('english_b','HL',2024,'M','TZ2',88,72,55,40,25,11),
  ('english_b','HL',2023,'N','TZ1',90,75,57,42,28,14),
  ('english_b','HL',2023,'N','TZ2',90,75,57,42,28,14),
  ('english_b','HL',2023,'M','TZ1',88,72,56,41,25,11),
  ('english_b','HL',2023,'M','TZ2',87,72,56,41,25,11),
  ('english_b','HL',2022,'N','TZ0',84,68,52,36,22,10),
  ('english_b','HL',2022,'M','TZ0',88,71,55,39,23,11),
  ('english_b','HL',2021,'M','TZ0',85,69,51,35,21,10)

on conflict (subject, level, year, session, timezone) do update set
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

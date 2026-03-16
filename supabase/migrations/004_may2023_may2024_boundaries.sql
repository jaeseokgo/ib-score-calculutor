-- ============================================================
-- Migration 004: May 2023 & May 2024 Full Grade Boundaries
-- Source: Official IBO Grade Boundaries PDFs
-- Extracted from:
--   - MAY 2023 Grade boundaries for Diploma programme coordinators
--   - MAY 2024 Grade boundaries for Diploma programme coordinators
-- Total entries: 465 (98 subjects)
-- ============================================================

-- Ensure TZ0 is in the allowed timezone values
ALTER TABLE grade_boundaries DROP CONSTRAINT IF EXISTS grade_boundaries_timezone_check;
ALTER TABLE grade_boundaries ADD CONSTRAINT grade_boundaries_timezone_check
  CHECK (timezone IN ('TZ0','TZ1','TZ2','TZ3'));

-- ============================================================
-- ARABIC_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('arabic_a_lang_lit','HL',2023,'M','TZ0',82,68,55,41,27,14),
  ('arabic_a_lang_lit','HL',2024,'M','TZ0',82,68,56,42,28,14),
  ('arabic_a_lang_lit','SL',2023,'M','TZ0',80,65,53,38,24,12),
  ('arabic_a_lang_lit','SL',2024,'M','TZ0',80,65,53,38,24,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ARABIC_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('arabic_a_lit','SL',2023,'M','TZ0',80,65,53,38,24,12),
  ('arabic_a_lit','SL',2024,'M','TZ0',82,67,55,40,26,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ARABIC_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('arabic_ab','SL',2023,'M','TZ0',89,73,59,43,30,15),
  ('arabic_ab','SL',2024,'M','TZ0',90,75,62,47,31,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ARABIC_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('arabic_b','HL',2023,'M','TZ0',84,73,63,52,37,19),
  ('arabic_b','HL',2024,'M','TZ0',87,75,66,54,40,20),
  ('arabic_b','SL',2023,'M','TZ0',84,69,53,37,27,13),
  ('arabic_b','SL',2024,'M','TZ0',87,73,56,42,27,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ART_HISTORY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('art_history','SL',2023,'M','TZ0',68,55,44,31,21,10),
  ('art_history','SL',2024,'M','TZ0',73,62,52,41,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ASTRONOMY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('astronomy','SL',2024,'M','TZ0',65,54,43,32,23,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- BIOLOGY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('biology','HL',2023,'M','TZ1',77,64,51,38,26,15),
  ('biology','HL',2023,'M','TZ2',77,64,50,36,25,15),
  ('biology','HL',2024,'M','TZ1',76,62,50,36,25,14),
  ('biology','HL',2024,'M','TZ2',76,62,50,35,25,15),
  ('biology','SL',2023,'M','TZ1',76,64,51,39,26,15),
  ('biology','SL',2023,'M','TZ2',74,62,50,38,26,15),
  ('biology','SL',2024,'M','TZ1',76,64,52,40,27,15),
  ('biology','SL',2024,'M','TZ2',75,63,50,38,25,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- BRAZILIAN_SOCIAL_STUDIES
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('brazilian_social_studies','SL',2023,'M','TZ0',79,66,53,40,27,13),
  ('brazilian_social_studies','SL',2024,'M','TZ0',84,72,59,47,32,16)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- BUSINESS_MANAGEMENT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('business_management','HL',2023,'M','TZ1',69,58,48,37,27,14),
  ('business_management','HL',2023,'M','TZ2',69,59,50,41,31,16),
  ('business_management','HL',2024,'M','TZ1',73,61,49,36,23,12),
  ('business_management','HL',2024,'M','TZ2',73,62,51,39,27,14),
  ('business_management','SL',2023,'M','TZ1',73,62,50,38,27,14),
  ('business_management','SL',2023,'M','TZ2',73,62,49,37,26,13),
  ('business_management','SL',2024,'M','TZ1',72,61,48,37,25,13),
  ('business_management','SL',2024,'M','TZ2',76,65,53,42,32,16)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CATALAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('catalan_a_lit','HL',2023,'M','TZ0',84,71,59,46,30,15),
  ('catalan_a_lit','HL',2024,'M','TZ0',86,74,61,48,32,16),
  ('catalan_a_lit','SL',2023,'M','TZ0',86,73,61,48,34,16),
  ('catalan_a_lit','SL',2024,'M','TZ0',88,76,64,52,38,19)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CHEMISTRY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('chemistry','HL',2023,'M','TZ1',77,65,53,41,30,17),
  ('chemistry','HL',2023,'M','TZ2',76,64,51,39,27,16),
  ('chemistry','HL',2024,'M','TZ1',76,64,52,40,27,16),
  ('chemistry','HL',2024,'M','TZ2',77,64,52,40,26,16),
  ('chemistry','SL',2023,'M','TZ1',74,62,50,39,26,15),
  ('chemistry','SL',2023,'M','TZ2',72,60,49,38,28,15),
  ('chemistry','SL',2024,'M','TZ1',73,61,50,38,26,15),
  ('chemistry','SL',2024,'M','TZ2',72,60,48,37,28,16)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CHINESE_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('chinese_a_lang_lit','HL',2023,'M','TZ2',83,70,58,45,30,16),
  ('chinese_a_lang_lit','HL',2024,'M','TZ2',81,68,57,44,29,15),
  ('chinese_a_lang_lit','SL',2023,'M','TZ2',82,70,56,44,30,15),
  ('chinese_a_lang_lit','SL',2024,'M','TZ2',78,66,55,43,29,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CHINESE_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('chinese_a_lit','HL',2023,'M','TZ2',83,70,58,45,30,16),
  ('chinese_a_lit','HL',2024,'M','TZ2',82,68,57,44,29,15),
  ('chinese_a_lit','SL',2023,'M','TZ2',82,70,56,44,30,15),
  ('chinese_a_lit','SL',2023,'M','TZ2',82,70,56,44,30,15),
  ('chinese_a_lit','SL',2024,'M','TZ2',79,67,55,43,29,14),
  ('chinese_a_lit','SL',2024,'M','TZ2',79,67,55,43,29,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CHINESE_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('chinese_b','HL',2023,'M','TZ1',83,69,54,40,24,12),
  ('chinese_b','HL',2023,'M','TZ2',85,70,57,42,27,13),
  ('chinese_b','HL',2024,'M','TZ1',78,64,52,38,22,11),
  ('chinese_b','HL',2024,'M','TZ2',82,68,55,40,24,11),
  ('chinese_b','SL',2023,'M','TZ1',78,63,48,33,20,9),
  ('chinese_b','SL',2023,'M','TZ2',79,63,49,33,20,9),
  ('chinese_b','SL',2024,'M','TZ1',78,63,48,33,20,9),
  ('chinese_b','SL',2024,'M','TZ2',79,64,48,33,20,9)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- COMPUTER_SCIENCE
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('computer_science','HL',2023,'M','TZ1',73,62,52,41,30,15),
  ('computer_science','HL',2023,'M','TZ2',73,62,52,41,30,15),
  ('computer_science','HL',2024,'M','TZ1',70,60,50,40,29,14),
  ('computer_science','HL',2024,'M','TZ2',68,58,48,37,26,13),
  ('computer_science','SL',2023,'M','TZ1',74,64,54,44,30,15),
  ('computer_science','SL',2023,'M','TZ2',74,64,54,44,30,15),
  ('computer_science','SL',2024,'M','TZ1',69,58,48,37,24,12),
  ('computer_science','SL',2024,'M','TZ2',69,58,48,37,24,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- CZECH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('czech_a_lit','HL',2023,'M','TZ0',88,74,61,47,33,17),
  ('czech_a_lit','HL',2024,'M','TZ0',88,74,63,50,36,18),
  ('czech_a_lit','SL',2023,'M','TZ0',89,76,62,49,34,17),
  ('czech_a_lit','SL',2024,'M','TZ0',89,77,65,53,41,21)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DANCE
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('dance','HL',2023,'M','TZ0',82,71,61,50,35,17),
  ('dance','HL',2024,'M','TZ0',81,69,61,50,35,17),
  ('dance','SL',2023,'M','TZ0',83,73,63,54,37,17),
  ('dance','SL',2024,'M','TZ0',81,71,61,52,37,17)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DANISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('danish_a_lit','HL',2023,'M','TZ0',85,71,59,45,30,16),
  ('danish_a_lit','HL',2024,'M','TZ0',83,69,57,43,28,15),
  ('danish_a_lit','SL',2023,'M','TZ0',86,71,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DANISH_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('danish_ab','SL',2023,'M','TZ0',85,72,57,43,26,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DANISH_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('danish_b','HL',2023,'M','TZ0',85,70,56,41,20,9),
  ('danish_b','HL',2024,'M','TZ0',83,68,54,40,20,9)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DESIGN_TECHNOLOGY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('design_technology','HL',2023,'M','TZ1',67,57,45,35,26,13),
  ('design_technology','HL',2023,'M','TZ2',69,58,47,36,27,13),
  ('design_technology','HL',2024,'M','TZ1',67,55,44,34,25,14),
  ('design_technology','HL',2024,'M','TZ2',67,55,44,34,25,14),
  ('design_technology','SL',2023,'M','TZ1',71,60,49,40,27,16),
  ('design_technology','SL',2023,'M','TZ2',73,63,51,41,28,16),
  ('design_technology','SL',2024,'M','TZ1',69,58,48,37,27,17),
  ('design_technology','SL',2024,'M','TZ2',71,59,48,36,27,17)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DIGITAL_SOCIETY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('digital_society','HL',2024,'M','TZ1',70,59,49,38,25,12),
  ('digital_society','HL',2024,'M','TZ2',70,59,49,38,25,12),
  ('digital_society','SL',2024,'M','TZ1',71,60,51,39,28,13),
  ('digital_society','SL',2024,'M','TZ2',71,60,51,39,28,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DUTCH_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('dutch_a_lang_lit','HL',2024,'M','TZ0',85,71,59,45,30,16),
  ('dutch_a_lang_lit','SL',2023,'M','TZ0',86,71,59,44,30,15),
  ('dutch_a_lang_lit','SL',2024,'M','TZ0',88,73,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DUTCH_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('dutch_ab','SL',2024,'M','TZ0',86,74,62,49,38,18)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- DUTCH_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('dutch_b','HL',2023,'M','TZ0',86,74,61,49,37,18),
  ('dutch_b','HL',2024,'M','TZ0',78,65,52,39,27,13),
  ('dutch_b','SL',2023,'M','TZ0',88,75,61,49,34,17),
  ('dutch_b','SL',2024,'M','TZ0',85,73,59,46,33,16)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ECONOMICS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('economics','HL',2023,'M','TZ1',73,61,47,35,26,13),
  ('economics','HL',2023,'M','TZ2',74,62,48,36,25,12),
  ('economics','HL',2024,'M','TZ0',75,62,49,36,24,12),
  ('economics','HL',2024,'M','TZ0',75,62,49,36,24,12),
  ('economics','HL',2024,'M','TZ1',76,62,50,37,24,12),
  ('economics','HL',2024,'M','TZ2',75,62,49,36,24,12),
  ('economics','SL',2023,'M','TZ1',74,62,51,39,24,11),
  ('economics','SL',2023,'M','TZ2',73,62,51,40,26,13),
  ('economics','SL',2024,'M','TZ0',75,64,52,41,30,15),
  ('economics','SL',2024,'M','TZ0',75,64,52,41,30,15),
  ('economics','SL',2024,'M','TZ1',80,67,53,40,24,12),
  ('economics','SL',2024,'M','TZ2',75,64,52,41,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ENGLISH_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('english_a_lang_lit','HL',2023,'M','TZ1',80,66,54,40,26,13),
  ('english_a_lang_lit','HL',2023,'M','TZ2',80,66,54,40,26,13),
  ('english_a_lang_lit','HL',2024,'M','TZ1',78,65,53,40,26,13),
  ('english_a_lang_lit','HL',2024,'M','TZ2',80,66,53,39,25,12),
  ('english_a_lang_lit','SL',2023,'M','TZ1',79,65,51,36,23,11),
  ('english_a_lang_lit','SL',2023,'M','TZ2',79,65,53,38,25,11),
  ('english_a_lang_lit','SL',2024,'M','TZ1',79,65,51,36,23,11),
  ('english_a_lang_lit','SL',2024,'M','TZ2',81,66,51,36,23,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ENGLISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('english_a_lit','HL',2023,'M','TZ1',81,66,54,39,28,14),
  ('english_a_lit','HL',2023,'M','TZ2',78,65,53,40,29,14),
  ('english_a_lit','HL',2024,'M','TZ0',80,66,52,38,27,14),
  ('english_a_lit','HL',2024,'M','TZ0',80,66,53,39,28,14),
  ('english_a_lit','HL',2024,'M','TZ1',80,66,53,39,28,14),
  ('english_a_lit','HL',2024,'M','TZ2',80,66,54,40,29,15),
  ('english_a_lit','SL',2023,'M','TZ1',78,63,49,34,21,10),
  ('english_a_lit','SL',2023,'M','TZ2',76,63,49,36,25,11),
  ('english_a_lit','SL',2024,'M','TZ0',76,63,48,35,20,10),
  ('english_a_lit','SL',2024,'M','TZ0',76,61,49,34,21,10),
  ('english_a_lit','SL',2024,'M','TZ1',76,61,49,34,21,10),
  ('english_a_lit','SL',2024,'M','TZ2',77,64,51,38,26,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ENGLISH_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('english_ab','SL',2023,'M','TZ0',81,68,56,42,27,13),
  ('english_ab','SL',2024,'M','TZ0',83,70,57,44,29,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ENGLISH_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('english_b','HL',2023,'M','TZ1',90,74,58,42,27,14),
  ('english_b','HL',2023,'M','TZ2',89,73,57,41,27,14),
  ('english_b','HL',2024,'M','TZ1',91,75,59,43,26,14),
  ('english_b','HL',2024,'M','TZ2',89,73,57,42,25,12),
  ('english_b','SL',2023,'M','TZ1',88,72,55,39,24,11),
  ('english_b','SL',2023,'M','TZ2',87,72,56,41,24,11),
  ('english_b','SL',2024,'M','TZ1',88,72,56,40,24,11),
  ('english_b','SL',2024,'M','TZ2',88,72,55,40,25,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ESS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('ess','SL',2023,'M','TZ1',67,56,44,33,20,10),
  ('ess','SL',2023,'M','TZ2',65,55,45,35,23,11),
  ('ess','SL',2024,'M','TZ1',66,55,43,33,20,10),
  ('ess','SL',2024,'M','TZ2',65,55,44,33,21,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- FILM
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('film','HL',2023,'M','TZ0',83,68,54,39,28,14),
  ('film','HL',2024,'M','TZ0',85,69,56,40,28,14),
  ('film','SL',2023,'M','TZ0',84,69,56,40,27,14),
  ('film','SL',2024,'M','TZ0',85,70,57,41,27,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- FINNISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('finnish_a_lit','HL',2023,'M','TZ0',82,68,55,41,27,14),
  ('finnish_a_lit','HL',2024,'M','TZ0',82,68,55,41,27,14),
  ('finnish_a_lit','SL',2023,'M','TZ0',81,66,50,35,24,12),
  ('finnish_a_lit','SL',2024,'M','TZ0',81,66,50,35,24,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- FRENCH_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('french_a_lang_lit','HL',2023,'M','TZ1',82,68,56,42,28,14),
  ('french_a_lang_lit','HL',2023,'M','TZ2',82,68,55,41,28,14),
  ('french_a_lang_lit','HL',2024,'M','TZ1',80,67,54,40,27,14),
  ('french_a_lang_lit','HL',2024,'M','TZ2',82,67,54,40,27,14),
  ('french_a_lang_lit','SL',2023,'M','TZ1',81,67,54,41,26,14),
  ('french_a_lang_lit','SL',2023,'M','TZ2',81,67,53,40,26,14),
  ('french_a_lang_lit','SL',2024,'M','TZ1',80,66,53,40,25,12),
  ('french_a_lang_lit','SL',2024,'M','TZ2',82,67,53,38,25,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- FRENCH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('french_a_lit','HL',2023,'M','TZ1',85,71,59,45,30,16),
  ('french_a_lit','HL',2023,'M','TZ2',85,71,58,44,30,16),
  ('french_a_lit','HL',2024,'M','TZ1',83,69,56,42,29,15),
  ('french_a_lit','HL',2024,'M','TZ2',85,70,56,41,29,15),
  ('french_a_lit','SL',2023,'M','TZ2',86,71,58,43,30,15),
  ('french_a_lit','SL',2023,'M','TZ2',86,71,58,43,30,15),
  ('french_a_lit','SL',2024,'M','TZ2',82,67,53,38,28,14),
  ('french_a_lit','SL',2024,'M','TZ2',82,67,53,38,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- FRENCH_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('french_ab','SL',2023,'M','TZ1',80,68,55,43,27,13),
  ('french_ab','SL',2023,'M','TZ2',80,68,55,43,26,12),
  ('french_ab','SL',2024,'M','TZ1',80,65,53,38,22,10),
  ('french_ab','SL',2024,'M','TZ2',79,66,53,40,21,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- FRENCH_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('french_b','HL',2023,'M','TZ1',86,73,61,47,29,14),
  ('french_b','HL',2023,'M','TZ2',85,72,60,47,27,13),
  ('french_b','HL',2024,'M','TZ1',86,73,62,48,29,15),
  ('french_b','HL',2024,'M','TZ2',86,73,60,47,31,15),
  ('french_b','SL',2023,'M','TZ1',82,67,51,36,22,10),
  ('french_b','SL',2023,'M','TZ2',82,67,51,36,22,10),
  ('french_b','SL',2024,'M','TZ1',81,67,51,37,24,12),
  ('french_b','SL',2024,'M','TZ2',81,66,52,37,23,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- GEOGRAPHY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('geography','HL',2023,'M','TZ1',73,63,52,41,26,13),
  ('geography','HL',2023,'M','TZ2',73,63,52,41,26,13),
  ('geography','HL',2024,'M','TZ1',74,64,53,42,27,13),
  ('geography','HL',2024,'M','TZ2',72,62,51,40,26,13),
  ('geography','SL',2023,'M','TZ0',75,64,51,40,24,12),
  ('geography','SL',2024,'M','TZ1',75,64,51,40,25,12),
  ('geography','SL',2024,'M','TZ2',72,61,48,37,24,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- GERMAN_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('german_a_lang_lit','HL',2023,'M','TZ0',84,70,58,44,32,16),
  ('german_a_lang_lit','HL',2024,'M','TZ0',82,68,55,41,29,15),
  ('german_a_lang_lit','SL',2023,'M','TZ0',82,67,52,37,27,13),
  ('german_a_lang_lit','SL',2024,'M','TZ0',79,65,48,33,23,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- GERMAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('german_a_lit','HL',2023,'M','TZ0',84,70,57,43,32,16),
  ('german_a_lit','HL',2024,'M','TZ0',82,69,56,43,31,16),
  ('german_a_lit','SL',2023,'M','TZ0',82,69,57,44,32,17),
  ('german_a_lit','SL',2023,'M','TZ0',82,69,57,44,32,17),
  ('german_a_lit','SL',2024,'M','TZ0',81,68,55,42,30,15),
  ('german_a_lit','SL',2024,'M','TZ0',81,68,55,42,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- GERMAN_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('german_ab','SL',2023,'M','TZ1',84,70,56,42,25,12),
  ('german_ab','SL',2023,'M','TZ2',85,71,56,42,25,12),
  ('german_ab','SL',2024,'M','TZ1',83,68,55,40,23,11),
  ('german_ab','SL',2024,'M','TZ2',83,68,56,41,25,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- GERMAN_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('german_b','HL',2023,'M','TZ1',87,71,55,39,25,12),
  ('german_b','HL',2023,'M','TZ2',86,71,56,41,26,13),
  ('german_b','HL',2024,'M','TZ1',86,69,54,37,24,12),
  ('german_b','HL',2024,'M','TZ2',85,68,54,38,23,11),
  ('german_b','SL',2023,'M','TZ1',83,67,52,36,21,10),
  ('german_b','SL',2023,'M','TZ2',83,67,52,36,21,10),
  ('german_b','SL',2024,'M','TZ1',81,66,50,35,21,10),
  ('german_b','SL',2024,'M','TZ2',81,66,50,35,21,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- GLOBAL_POLITICS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('global_politics','HL',2023,'M','TZ0',71,59,47,35,23,11),
  ('global_politics','HL',2024,'M','TZ1',70,58,47,35,23,11),
  ('global_politics','HL',2024,'M','TZ2',70,58,47,35,23,11),
  ('global_politics','SL',2023,'M','TZ0',64,54,43,33,22,10),
  ('global_politics','SL',2024,'M','TZ1',63,53,43,33,22,10),
  ('global_politics','SL',2024,'M','TZ2',63,53,43,33,22,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- HINDI_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('hindi_b','HL',2023,'M','TZ0',84,73,62,51,36,18),
  ('hindi_b','HL',2024,'M','TZ0',81,70,58,46,32,16),
  ('hindi_b','SL',2023,'M','TZ2',84,68,51,35,26,12),
  ('hindi_b','SL',2024,'M','TZ0',84,67,52,35,27,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- HISTORY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('history','HL',2023,'M','TZ1',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ1',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ1',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ1',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ2',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ2',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ2',73,60,48,35,24,11),
  ('history','HL',2023,'M','TZ2',73,60,48,35,24,11),
  ('history','HL',2024,'M','TZ1',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ1',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ1',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ1',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ2',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ2',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ2',73,60,49,36,24,11),
  ('history','HL',2024,'M','TZ2',73,60,49,36,24,11),
  ('history','SL',2023,'M','TZ1',77,63,49,35,24,11),
  ('history','SL',2023,'M','TZ2',77,63,49,35,24,11),
  ('history','SL',2024,'M','TZ1',75,62,49,35,24,11),
  ('history','SL',2024,'M','TZ2',75,62,49,35,24,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- INDONESIAN_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('indonesian_a_lang_lit','HL',2023,'M','TZ0',85,71,59,45,30,16),
  ('indonesian_a_lang_lit','HL',2024,'M','TZ0',85,71,59,45,30,16),
  ('indonesian_a_lang_lit','SL',2023,'M','TZ0',86,71,59,44,30,15),
  ('indonesian_a_lang_lit','SL',2024,'M','TZ0',86,71,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- INDONESIAN_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('indonesian_b','HL',2023,'M','TZ0',89,75,63,48,34,17),
  ('indonesian_b','HL',2024,'M','TZ0',87,73,61,46,33,17),
  ('indonesian_b','SL',2023,'M','TZ0',85,69,53,38,25,11),
  ('indonesian_b','SL',2024,'M','TZ0',85,68,53,37,24,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ITALIAN_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('italian_a_lang_lit','HL',2023,'M','TZ0',84,71,58,45,30,16),
  ('italian_a_lang_lit','HL',2024,'M','TZ0',84,71,59,45,30,16),
  ('italian_a_lang_lit','SL',2023,'M','TZ0',85,71,58,44,30,15),
  ('italian_a_lang_lit','SL',2024,'M','TZ0',86,71,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ITALIAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('italian_a_lit','HL',2023,'M','TZ0',84,71,58,45,30,16),
  ('italian_a_lit','HL',2024,'M','TZ0',85,71,59,45,30,16),
  ('italian_a_lit','SL',2023,'M','TZ0',85,71,58,44,30,15),
  ('italian_a_lit','SL',2024,'M','TZ0',86,71,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ITALIAN_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('italian_ab','SL',2023,'M','TZ0',80,65,52,37,23,11),
  ('italian_ab','SL',2024,'M','TZ0',83,68,51,35,19,9)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ITALIAN_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('italian_b','HL',2023,'M','TZ1',80,65,52,37,24,12),
  ('italian_b','HL',2023,'M','TZ2',84,69,54,39,23,12),
  ('italian_b','HL',2024,'M','TZ2',86,71,56,41,22,11),
  ('italian_b','SL',2023,'M','TZ1',85,69,54,38,22,11),
  ('italian_b','SL',2023,'M','TZ2',85,69,52,37,22,11),
  ('italian_b','SL',2024,'M','TZ1',84,69,52,37,20,9),
  ('italian_b','SL',2024,'M','TZ2',85,69,51,35,20,9)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- ITGS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('itgs','HL',2023,'M','TZ1',71,60,50,39,25,13),
  ('itgs','HL',2023,'M','TZ2',71,60,50,39,25,13),
  ('itgs','SL',2023,'M','TZ1',70,58,47,35,25,12),
  ('itgs','SL',2023,'M','TZ2',70,58,47,35,25,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- JAPANESE_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('japanese_a_lang_lit','HL',2023,'M','TZ0',81,67,55,42,28,16),
  ('japanese_a_lang_lit','HL',2024,'M','TZ0',82,69,56,43,29,15),
  ('japanese_a_lang_lit','SL',2023,'M','TZ0',83,69,56,42,30,15),
  ('japanese_a_lang_lit','SL',2024,'M','TZ0',80,68,53,41,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- JAPANESE_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('japanese_ab','SL',2023,'M','TZ1',81,66,50,36,23,11),
  ('japanese_ab','SL',2023,'M','TZ2',82,67,52,36,23,11),
  ('japanese_ab','SL',2024,'M','TZ1',78,62,48,32,22,11),
  ('japanese_ab','SL',2024,'M','TZ2',79,63,49,33,22,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- JAPANESE_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('japanese_b','HL',2023,'M','TZ0',87,74,62,49,33,17),
  ('japanese_b','HL',2024,'M','TZ0',86,73,62,49,33,17),
  ('japanese_b','SL',2023,'M','TZ1',86,68,51,34,22,10),
  ('japanese_b','SL',2023,'M','TZ2',86,68,51,34,24,11),
  ('japanese_b','SL',2024,'M','TZ1',86,69,50,33,22,10),
  ('japanese_b','SL',2024,'M','TZ2',85,68,50,34,22,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- KOREAN_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('korean_a_lang_lit','HL',2023,'M','TZ0',83,69,57,43,28,15),
  ('korean_a_lang_lit','SL',2023,'M','TZ0',84,69,57,42,28,14),
  ('korean_a_lang_lit','SL',2024,'M','TZ0',84,69,57,42,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- KOREAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('korean_a_lit','SL',2023,'M','TZ0',84,69,57,42,28,14),
  ('korean_a_lit','SL',2023,'M','TZ0',84,69,57,42,28,14),
  ('korean_a_lit','SL',2024,'M','TZ0',84,69,57,42,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- LATIN
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('latin','HL',2023,'M','TZ0',75,61,49,35,22,11),
  ('latin','HL',2024,'M','TZ0',77,66,55,44,31,15),
  ('latin','SL',2023,'M','TZ0',76,63,53,41,28,14),
  ('latin','SL',2024,'M','TZ0',68,57,47,36,21,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- LITERATURE_AND_PERFORMANCE
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('literature_and_performance','SL',2023,'M','TZ0',85,73,58,45,29,14),
  ('literature_and_performance','SL',2024,'M','TZ0',84,71,56,43,27,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- LITHUANIAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('lithuanian_a_lit','SL',2023,'M','TZ0',81,66,52,37,25,12),
  ('lithuanian_a_lit','SL',2024,'M','TZ0',83,70,56,42,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MALAY_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('malay_a_lit','SL',2023,'M','TZ0',88,73,59,44,30,15),
  ('malay_a_lit','SL',2024,'M','TZ0',90,76,63,49,32,17)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MANDARIN_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('mandarin_ab','SL',2023,'M','TZ1',75,61,48,33,17,8),
  ('mandarin_ab','SL',2023,'M','TZ2',76,61,49,34,18,8),
  ('mandarin_ab','SL',2024,'M','TZ1',72,58,44,30,17,8),
  ('mandarin_ab','SL',2024,'M','TZ2',73,59,44,30,17,8)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MARINE_SCIENCE
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('marine_science','SL',2023,'M','TZ0',70,61,52,43,32,15),
  ('marine_science','SL',2024,'M','TZ0',68,58,49,40,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MATH_AA
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('math_aa','HL',2023,'M','TZ1',70,56,44,31,21,9),
  ('math_aa','HL',2023,'M','TZ2',70,57,43,30,21,13),
  ('math_aa','HL',2024,'M','TZ1',76,62,49,35,23,10),
  ('math_aa','HL',2024,'M','TZ2',74,60,47,34,24,14),
  ('math_aa','SL',2023,'M','TZ1',79,64,48,34,23,11),
  ('math_aa','SL',2023,'M','TZ2',75,57,42,29,17,9),
  ('math_aa','SL',2024,'M','TZ1',76,63,47,33,22,10),
  ('math_aa','SL',2024,'M','TZ2',75,59,44,30,18,9)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MATH_AI
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('math_ai','HL',2023,'M','TZ1',69,57,46,34,24,11),
  ('math_ai','HL',2023,'M','TZ2',68,57,44,32,23,12),
  ('math_ai','HL',2024,'M','TZ1',74,63,51,37,26,13),
  ('math_ai','HL',2024,'M','TZ2',74,62,48,35,25,13),
  ('math_ai','SL',2023,'M','TZ1',71,58,43,30,19,9),
  ('math_ai','SL',2023,'M','TZ2',77,63,48,33,22,11),
  ('math_ai','SL',2024,'M','TZ1',77,65,51,38,25,13),
  ('math_ai','SL',2024,'M','TZ2',76,61,47,34,24,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MODERN_GREEK_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('modern_greek_a_lang_lit','SL',2023,'M','TZ0',82,68,55,41,27,12),
  ('modern_greek_a_lang_lit','SL',2024,'M','TZ0',82,68,55,41,27,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MODERN_GREEK_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('modern_greek_a_lit','SL',2023,'M','TZ0',83,70,55,41,29,14),
  ('modern_greek_a_lit','SL',2024,'M','TZ0',83,70,55,41,29,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- MUSIC
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('music','HL',2023,'M','TZ0',81,67,52,38,22,11),
  ('music','HL',2024,'M','TZ0',81,67,52,38,22,11),
  ('music','SL',2023,'M','TZ0',77,64,51,37,21,11),
  ('music','SL',2024,'M','TZ0',77,64,51,37,21,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- NORWEGIAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('norwegian_a_lit','SL',2023,'M','TZ0',86,71,59,44,30,15),
  ('norwegian_a_lit','SL',2024,'M','TZ0',86,71,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- NORWEGIAN_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('norwegian_b','HL',2023,'M','TZ0',82,67,52,37,23,12),
  ('norwegian_b','HL',2024,'M','TZ0',84,68,53,36,24,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- NOS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('nos','SL',2023,'M','TZ0',79,68,57,48,40,20),
  ('nos','SL',2024,'M','TZ0',77,66,56,46,38,19)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PHILOSOPHY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('philosophy','HL',2023,'M','TZ1',80,67,54,40,25,12),
  ('philosophy','HL',2023,'M','TZ2',76,64,52,39,25,12),
  ('philosophy','HL',2024,'M','TZ1',80,67,54,40,25,12),
  ('philosophy','HL',2024,'M','TZ2',77,65,52,39,25,12),
  ('philosophy','SL',2023,'M','TZ1',79,66,52,38,26,13),
  ('philosophy','SL',2023,'M','TZ2',77,66,56,44,30,15),
  ('philosophy','SL',2024,'M','TZ1',79,66,52,38,26,13),
  ('philosophy','SL',2024,'M','TZ2',77,66,56,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PHYSICS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('physics','HL',2023,'M','TZ1',68,56,44,32,21,12),
  ('physics','HL',2023,'M','TZ2',69,58,47,37,24,14),
  ('physics','HL',2024,'M','TZ1',73,61,50,38,24,15),
  ('physics','HL',2024,'M','TZ2',68,59,48,38,24,14),
  ('physics','SL',2023,'M','TZ1',68,56,44,32,21,11),
  ('physics','SL',2023,'M','TZ2',65,55,45,35,22,12),
  ('physics','SL',2024,'M','TZ1',73,61,49,38,24,14),
  ('physics','SL',2024,'M','TZ2',65,55,45,35,21,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- POLISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('polish_a_lit','HL',2023,'M','TZ0',84,70,58,44,29,15),
  ('polish_a_lit','HL',2024,'M','TZ0',84,70,58,44,29,15),
  ('polish_a_lit','SL',2023,'M','TZ0',84,69,57,42,28,14),
  ('polish_a_lit','SL',2024,'M','TZ0',84,69,57,42,28,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PORTUGUESE_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('portuguese_a_lang_lit','HL',2023,'M','TZ0',84,71,59,45,30,16),
  ('portuguese_a_lang_lit','HL',2024,'M','TZ0',85,71,59,45,30,16),
  ('portuguese_a_lang_lit','SL',2023,'M','TZ0',84,71,59,44,30,15),
  ('portuguese_a_lang_lit','SL',2024,'M','TZ0',84,71,57,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PORTUGUESE_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('portuguese_b','HL',2024,'M','TZ0',81,69,57,45,30,15),
  ('portuguese_b','SL',2023,'M','TZ0',77,65,53,41,28,13),
  ('portuguese_b','SL',2024,'M','TZ0',78,66,52,40,28,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- PSYCHOLOGY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('psychology','HL',2023,'M','TZ1',71,57,44,30,17,8),
  ('psychology','HL',2023,'M','TZ2',74,61,49,35,22,10),
  ('psychology','HL',2024,'M','TZ0',73,61,49,36,23,11),
  ('psychology','HL',2024,'M','TZ0',73,61,49,37,23,11),
  ('psychology','HL',2024,'M','TZ1',73,59,45,31,19,8),
  ('psychology','HL',2024,'M','TZ2',73,61,49,37,23,11),
  ('psychology','SL',2023,'M','TZ1',74,59,45,30,20,9),
  ('psychology','SL',2023,'M','TZ2',74,61,48,36,24,11),
  ('psychology','SL',2024,'M','TZ0',74,61,49,37,26,12),
  ('psychology','SL',2024,'M','TZ0',74,61,50,38,26,12),
  ('psychology','SL',2024,'M','TZ1',73,59,45,31,20,9),
  ('psychology','SL',2024,'M','TZ2',74,61,50,38,26,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- RUSSIAN_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('russian_a_lang_lit','HL',2023,'M','TZ0',83,70,57,44,29,15),
  ('russian_a_lang_lit','HL',2024,'M','TZ0',83,69,57,43,28,14),
  ('russian_a_lang_lit','SL',2023,'M','TZ0',83,70,57,43,29,14),
  ('russian_a_lang_lit','SL',2024,'M','TZ0',83,68,56,41,29,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- RUSSIAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('russian_a_lit','HL',2024,'M','TZ0',84,70,58,44,29,15),
  ('russian_a_lit','SL',2023,'M','TZ0',82,68,55,41,27,12),
  ('russian_a_lit','SL',2023,'M','TZ0',82,68,55,41,27,12),
  ('russian_a_lit','SL',2024,'M','TZ0',83,68,56,41,27,12),
  ('russian_a_lit','SL',2024,'M','TZ0',83,68,56,41,27,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- RUSSIAN_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('russian_b','SL',2023,'M','TZ0',83,69,53,38,26,13),
  ('russian_b','SL',2024,'M','TZ0',83,67,53,37,22,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SOCIAL_CULTURAL_ANTHROPOLOGY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('social_cultural_anthropology','HL',2023,'M','TZ0',75,63,53,42,27,14),
  ('social_cultural_anthropology','HL',2024,'M','TZ0',75,63,53,42,27,14),
  ('social_cultural_anthropology','SL',2023,'M','TZ0',80,66,54,41,29,13),
  ('social_cultural_anthropology','SL',2024,'M','TZ0',80,66,54,41,29,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SPANISH_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('spanish_a_lang_lit','HL',2023,'M','TZ1',79,65,52,38,25,12),
  ('spanish_a_lang_lit','HL',2023,'M','TZ2',80,66,54,40,27,13),
  ('spanish_a_lang_lit','HL',2024,'M','TZ1',78,64,51,37,25,12),
  ('spanish_a_lang_lit','HL',2024,'M','TZ2',79,65,53,39,25,12),
  ('spanish_a_lang_lit','SL',2023,'M','TZ1',80,65,50,35,23,11),
  ('spanish_a_lang_lit','SL',2023,'M','TZ2',81,66,53,38,25,12),
  ('spanish_a_lang_lit','SL',2024,'M','TZ1',79,64,51,36,23,11),
  ('spanish_a_lang_lit','SL',2024,'M','TZ2',82,67,53,38,25,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SPANISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('spanish_a_lit','HL',2023,'M','TZ1',80,67,54,40,29,14),
  ('spanish_a_lit','HL',2023,'M','TZ2',81,68,55,42,30,15),
  ('spanish_a_lit','HL',2024,'M','TZ0',80,67,54,41,29,14),
  ('spanish_a_lit','HL',2024,'M','TZ0',80,67,54,41,29,14),
  ('spanish_a_lit','HL',2024,'M','TZ1',80,67,54,41,29,14),
  ('spanish_a_lit','HL',2024,'M','TZ2',81,67,54,41,29,15),
  ('spanish_a_lit','SL',2023,'M','TZ1',80,67,54,41,26,13),
  ('spanish_a_lit','SL',2023,'M','TZ2',81,68,56,43,29,14),
  ('spanish_a_lit','SL',2023,'M','TZ2',81,68,56,43,29,14),
  ('spanish_a_lit','SL',2024,'M','TZ1',81,67,54,41,26,13),
  ('spanish_a_lit','SL',2024,'M','TZ2',82,69,54,41,27,12),
  ('spanish_a_lit','SL',2024,'M','TZ2',82,69,54,41,27,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SPANISH_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('spanish_ab','SL',2023,'M','TZ1',80,67,53,40,24,11),
  ('spanish_ab','SL',2023,'M','TZ2',80,67,54,40,26,12),
  ('spanish_ab','SL',2024,'M','TZ1',78,64,49,35,21,10),
  ('spanish_ab','SL',2024,'M','TZ2',80,66,51,36,22,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SPANISH_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('spanish_b','HL',2023,'M','TZ1',84,68,54,38,25,12),
  ('spanish_b','HL',2023,'M','TZ2',84,69,54,39,26,12),
  ('spanish_b','HL',2024,'M','TZ1',84,69,53,38,25,12),
  ('spanish_b','HL',2024,'M','TZ2',85,69,52,36,26,13),
  ('spanish_b','SL',2023,'M','TZ1',81,65,48,32,19,9),
  ('spanish_b','SL',2023,'M','TZ2',81,66,49,33,20,9),
  ('spanish_b','SL',2024,'M','TZ1',80,64,46,30,16,8),
  ('spanish_b','SL',2024,'M','TZ2',76,61,44,29,16,8)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SPORTS_EXERCISE_HEALTH_SCIENCE
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('sports_exercise_health_science','HL',2023,'M','TZ0',69,57,43,32,22,13),
  ('sports_exercise_health_science','HL',2024,'M','TZ1',72,59,46,34,23,13),
  ('sports_exercise_health_science','HL',2024,'M','TZ2',71,59,46,35,24,13),
  ('sports_exercise_health_science','SL',2023,'M','TZ0',71,60,48,38,27,14),
  ('sports_exercise_health_science','SL',2024,'M','TZ1',70,58,46,34,23,13),
  ('sports_exercise_health_science','SL',2024,'M','TZ2',73,60,49,39,27,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SWEDISH_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('swedish_a_lang_lit','SL',2023,'M','TZ0',77,63,50,37,20,11),
  ('swedish_a_lang_lit','SL',2024,'M','TZ0',79,66,51,37,22,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SWEDISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('swedish_a_lit','SL',2023,'M','TZ0',81,67,52,38,26,12),
  ('swedish_a_lit','SL',2024,'M','TZ0',79,66,51,37,26,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SWEDISH_AB
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('swedish_ab','SL',2023,'M','TZ0',82,69,56,43,31,15),
  ('swedish_ab','SL',2024,'M','TZ0',86,72,60,45,31,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- SWEDISH_B
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('swedish_b','HL',2023,'M','TZ0',88,73,60,45,30,15),
  ('swedish_b','HL',2024,'M','TZ0',85,70,56,42,27,13),
  ('swedish_b','SL',2023,'M','TZ0',84,71,56,42,29,13),
  ('swedish_b','SL',2024,'M','TZ0',84,70,54,39,25,14)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- THAI_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('thai_a_lang_lit','SL',2023,'M','TZ0',86,71,59,44,30,15),
  ('thai_a_lang_lit','SL',2024,'M','TZ0',86,71,59,44,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- THEATRE
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('theatre','HL',2023,'M','TZ0',82,65,49,33,21,10),
  ('theatre','HL',2023,'M','TZ0',82,67,52,37,21,10),
  ('theatre','HL',2024,'M','TZ0',83,68,51,36,21,10),
  ('theatre','SL',2023,'M','TZ0',81,65,48,31,20,9),
  ('theatre','SL',2024,'M','TZ0',85,69,51,35,20,10)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- TURKISH_20TH_CENTURY
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('turkish_20th_century','SL',2023,'M','TZ0',79,66,55,41,26,11),
  ('turkish_20th_century','SL',2024,'M','TZ0',78,65,55,42,26,13)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- TURKISH_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('turkish_a_lit','HL',2023,'M','TZ0',83,69,57,43,28,15),
  ('turkish_a_lit','HL',2024,'M','TZ0',84,71,58,45,30,16),
  ('turkish_a_lit','SL',2023,'M','TZ0',82,67,56,41,26,14),
  ('turkish_a_lit','SL',2024,'M','TZ0',83,72,58,47,34,17)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- UKRAINIAN_A_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('ukrainian_a_lit','SL',2024,'M','TZ0',83,70,57,43,30,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- VIETNAMESE_A_LANG_LIT
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('vietnamese_a_lang_lit','SL',2023,'M','TZ0',85,73,61,49,32,15),
  ('vietnamese_a_lang_lit','SL',2024,'M','TZ0',85,73,62,50,32,15)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- VISUAL_ARTS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('visual_arts','HL',2023,'M','TZ0',81,66,53,39,22,11),
  ('visual_arts','HL',2024,'M','TZ0',81,67,53,39,22,11),
  ('visual_arts','SL',2023,'M','TZ0',81,65,51,34,22,11),
  ('visual_arts','SL',2024,'M','TZ0',81,65,51,34,22,11)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- ============================================================
-- WORLD_RELIGIONS
-- ============================================================
INSERT INTO grade_boundaries (subject, level, year, session, timezone, grade7, grade6, grade5, grade4, grade3, grade2) VALUES
  ('world_religions','SL',2023,'M','TZ0',78,65,52,39,25,13),
  ('world_religions','SL',2024,'M','TZ0',79,66,52,40,25,12)

ON CONFLICT (subject, level, year, session, timezone) DO UPDATE SET
  grade7=EXCLUDED.grade7, grade6=EXCLUDED.grade6, grade5=EXCLUDED.grade5,
  grade4=EXCLUDED.grade4, grade3=EXCLUDED.grade3, grade2=EXCLUDED.grade2;

-- Run this in Supabase SQL Editor to create visitor_count table and allow API access.

CREATE TABLE visitor_count (
  id integer PRIMARY KEY DEFAULT 1,
  count bigint DEFAULT 0
);

INSERT INTO visitor_count (id, count) VALUES (1, 0);

-- RLS: allow anon to read and update (for Next.js API using anon key)
ALTER TABLE visitor_count ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anon read visitor_count"
  ON visitor_count FOR SELECT TO anon USING (true);

CREATE POLICY "Allow anon update visitor_count"
  ON visitor_count FOR UPDATE TO anon USING (true);

-- Run this in Supabase SQL Editor to rename visitor_count → page_views (keeps existing data).

-- 1. Rename table and column
ALTER TABLE visitor_count RENAME TO page_views;
ALTER TABLE page_views RENAME COLUMN count TO page_views;

-- 2. Drop old RLS policies (they were on visitor_count)
DROP POLICY IF EXISTS "Allow anon read visitor_count" ON page_views;
DROP POLICY IF EXISTS "Allow anon update visitor_count" ON page_views;

-- 3. Create new policies for page_views
CREATE POLICY "Allow anon read page_views"
  ON page_views FOR SELECT TO anon USING (true);

CREATE POLICY "Allow anon update page_views"
  ON page_views FOR UPDATE TO anon USING (true);

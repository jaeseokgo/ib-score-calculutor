-- Run this in Supabase SQL Editor to create page_views table (for new projects).
-- If you already have visitor_count, use migrate_visitor_count_to_page_views.sql instead.

CREATE TABLE page_views (
  id integer PRIMARY KEY DEFAULT 1,
  page_views bigint DEFAULT 0
);

INSERT INTO page_views (id, page_views) VALUES (1, 0);

ALTER TABLE page_views ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anon read page_views"
  ON page_views FOR SELECT TO anon USING (true);

CREATE POLICY "Allow anon update page_views"
  ON page_views FOR UPDATE TO anon USING (true);

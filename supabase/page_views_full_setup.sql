-- ============================================================
-- Page Views 카운터 — Supabase SQL Editor에서 전체 실행
-- ============================================================
-- 실행 방법:
-- 1. https://supabase.com/dashboard 에서 프로젝트 선택
-- 2. 왼쪽 메뉴에서 "SQL Editor" 클릭
-- 3. "New query" 버튼 클릭
-- 4. 이 파일 내용 전체 복사 후 편집기에 붙여넣기
-- 5. "Run" 버튼 클릭 (또는 Ctrl+Enter / Cmd+Enter)
-- 6. 성공 시 "Success. No rows returned" 또는 테이블 결과 표시
-- ============================================================

-- 기존 테이블 제거 후 재생성
DROP TABLE IF EXISTS visitor_count;

CREATE TABLE visitor_count (
  id integer PRIMARY KEY DEFAULT 1,
  count bigint DEFAULT 0,
  CONSTRAINT single_row CHECK (id = 1)
);

INSERT INTO visitor_count (id, count) VALUES (1, 0);

-- RLS: anon이 SELECT/UPDATE 가능 (API에서 사용)
ALTER TABLE visitor_count ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anon read visitor_count"
  ON visitor_count FOR SELECT TO anon USING (true);

CREATE POLICY "Allow anon update visitor_count"
  ON visitor_count FOR UPDATE TO anon USING (true);

-- 원자적 증가 함수 (한 번의 UPDATE로 count+1 후 단일 값 반환)
CREATE OR REPLACE FUNCTION increment_page_views()
RETURNS bigint
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  new_count bigint;
BEGIN
  UPDATE visitor_count SET count = count + 1 WHERE id = 1 RETURNING count INTO new_count;
  RETURN new_count;
END;
$$;

-- anon 역할이 RPC 호출 가능하도록 권한 부여
GRANT EXECUTE ON FUNCTION increment_page_views() TO anon;

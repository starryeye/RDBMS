-- datasource: my-rdbms-4
-- precondition:
--      sql.sub6_performance.example_1.sub1_index.sub0_precondition.sql 실행


-- 인덱스(index) 생성, 조회, 삭제


-- 생성
-- CREATE INDEX {인덱스 이름} ON {테이블 이름} ({컬럼1}, {컬럼2}, ..);
CREATE INDEX idx_items_item_name ON items (item_name);


-- 조회
SHOW INDEX FROM items;


-- 삭제
DROP INDEX idx_items_item_name ON items;


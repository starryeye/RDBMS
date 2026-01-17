-- datasource: my-rdbms-4
-- precondition:
--      sql.sub6_performance.example_1.sub1_index.sub0_precondition.sql 실행


-- 데이터베이스에서 어떤 쿼리를 실행할 때,
--      인덱스 적용 여부를 포함하여, 어떤 방법으로 옵티마이저가 실행할지를 보여주는 명령어가 있다.
-- EXPLAIN {쿼리}
-- EXPLAIN ANALYZE {쿼리}
EXPLAIN SELECT * FROM items WHERE item_name = '게이밍 노트북';
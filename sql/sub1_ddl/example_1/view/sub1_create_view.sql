-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- VIEW 가 존재하면 삭제
DROP VIEW IF EXISTS v_category_order_status;


-- VIEW 를 생성
CREATE VIEW v_category_order_status AS
SELECT -- 여기서부터는 일반적인 쿼리문이다. (해당 쿼리문은 sub4_case_and_aggregate_functions.sql 에서 가져옴)
    p.category,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.status = 'COMPLETED' THEN 1 ELSE 0 END) AS completed_count,
    SUM(CASE WHEN o.status = 'SHIPPED' THEN 1 ELSE 0 END) AS shipped_count,
    SUM(CASE WHEN o.status = 'PENDING' THEN 1 ELSE 0 END) AS pending_count
FROM
    orders o
        JOIN
    products p ON o.product_id = p.product_id
GROUP BY
    p.category;
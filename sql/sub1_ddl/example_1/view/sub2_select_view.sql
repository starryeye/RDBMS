-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- 생성된 VIEW 를 활용하여 조회해본다.
SELECT
    *
FROM
    v_category_order_status;

-- 뷰 쿼리에서도 WHERE, ORDER BY 등 뷰의 결과를 필터링하거나 정렬할 수 있다.
SELECT
    *
FROM
    v_category_order_status
WHERE
    category = '전자기기';
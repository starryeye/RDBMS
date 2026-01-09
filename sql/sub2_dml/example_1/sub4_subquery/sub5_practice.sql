-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- Example 1
-- 서울에 거주하는 모든 유저의 주문 목록 조회
-- 1. 비상관 서브쿼리 활용
SELECT
    o.*
FROM
    orders o
WHERE
    o.user_id IN (
        SELECT
            user_id
        FROM
            users
        WHERE
            address LIKE '서울%'
        );
-- 2. JOIN 활용
SELECT
    o.*
FROM
    orders o
JOIN
    users u ON o.user_id = u.user_id
WHERE
    u.address LIKE '서울%';
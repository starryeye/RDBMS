-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- 서브쿼리 결과가 "다중컬럼, 다중행"인 경우에 대해 알아본다.
-- 특징
--      결과는 리스트와 같이 여러 개의 행으로 나오므로, IN, ANY, ALL 등의 연산자와 주로 사용된다.
--      또한, 서브쿼리의 결과가 여러 컬럼이 나타나는 상황이다. 즉, 서브쿼리 SELECT 절에 두 개 이상의 컬럼이 포함됨.

-- Example 1.
-- 각 유저별로 최초 주문의..
--      orders (order_id, user_id, order_date)
--      users (name)
--      products (name) 를 조회
SELECT
    o.order_id,
    o.user_id,
    o.order_date,
    u.name AS user_name,
    p.name AS product_name
FROM
    orders o
JOIN
    users u ON o.user_id = u.user_id
JOIN
    products p ON o.product_id = p.product_id
WHERE
    (o.user_id, o.order_date) IN ( -- 유저별 최초 주문을 조회
        SELECT
            user_id,
            MIN(order_date)
        FROM
            orders
        GROUP BY
            user_id
        );
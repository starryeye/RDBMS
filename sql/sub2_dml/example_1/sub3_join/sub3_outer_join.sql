-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- 외부 조인(OUTER JOIN)에 대해 알아본다.
--      내부 조인은 두 테이블에 동일한 데이터가 존재하면 이를 연결하여 보여줬지만, 동일한 데이터가 존재하지 않는 row 의 경우 생략되었다.
--      외부 조인에서는 조인 방향에 따라 동일한 데이터가 존재하지 않는 row 도 함께 보여주도록 한다.
--      종류
--          LEFT OUTER JOIN (LEFT JOIN 으로 OUTER 생략가능)
--              FROM 절에 존재하는 모든 row + INNER JOIN 결과
--          RIGHT OUTER JOIN (RIGHT JOIN 으로 OUTER 생략가능)
--              JOIN 절에 존재하는 모든 row + INNER JOIN 결과
--              LEFT OUTER JOIN 으로 커버되므로 사용 X
--          FULL OUTER JOIN (MySQL 에서 지원하지 않으며, 실무에서 사용되지 않음)
--      특징
--          LEFT JOIN
--              1. LEFT JOIN 구문의 왼쪽(FROM)에 있는 테이블이 기준이된다.
--              2. 왼쪽 테이블의 모든 데이터를 결과에 포함시킨다.
--              3. ON 조건에 맞는 데이터를 오른쪽 테이블에서 찾아 옆에 붙인다.
--              4. 오른쪽 테이블에 짝이 맞는 데이터가 없는 왼쪽 데이터라면 그 자리는 NULL 로 채운다.


-- Example 1.
-- 한번도 주문하지 않은 유저를 조회
--      모든 유저가 존재하는 users 테이블을 기준으로(FROM, 왼쪽)
--      주문 데이터를 조인(JOIN, 오른쪽)하고 (주문 데이터에 존재하지 않은 유저를 포함시키기 위해 LEFT JOIN)
--      주문 데이터에 존재하지 않은 유저는 NULL 이므로 WHERE 에 조건 건다.
SELECT
    u.user_id,
    u.name,
    o.user_id,
    o.order_id
FROM
    users u -- 왼쪽 테이블
LEFT JOIN
    orders o -- 오른쪽 테이블
        ON u.user_id = o.user_id
WHERE
    o.user_id IS NULL;


-- Example 2.
-- 한번도 주문되지 않은 상품 조회
SELECT
    p.product_id,
    p.name,
    p.price,
    o.product_id,
    o.order_id
FROM
    products p
LEFT JOIN
    orders o
        ON p.product_id = o.product_id
WHERE
    o.product_id IS NULL;

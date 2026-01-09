-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- sub1 ~ sub2 에서는 서브쿼리를 WHERE 절 안에서 사용하여 동적인 서브쿼리 결과를 메인쿼리에서 사용해보았다..
-- 이번엔..
-- SELECT 절 안에서 서브쿼리를 사용해보겠다.




-- 1. 비상관 서브쿼리의 경우
-- SELECT 절 안에서 서브쿼리를 사용하면 그 결과는 하나의 컬럼이 되고 당연히 스칼라 서브쿼리가 되어야한다. (단일 컬럼, 단일 행)

-- Example 1
-- 모든 상품 목록을 조회하는데 각 행에는 전체 상품의 평균 가격이 있어야한다.
-- 참고: 메인쿼리1회, 서브쿼리1회 실행
SELECT
    p.*,
    (SELECT AVG(price) FROM products) AS avg_price
FROM
    products p;







-- 2. 상관 서브쿼리의 경우
--      상관 서브쿼리가 SELECT 절 안에서 사용될 때에도 단일컬럼, 단일행이 결과여야 한다.
-- Example 2
-- 모든 상품 목록을 조회하는데 각 상품별로 총 주문 횟수가 있어야한다.
-- 참고: 메인쿼리1회, 서브쿼리6회 실행(6은 메인쿼리 row 수이다.)
SELECT
    p.*,
    (SELECT COUNT(*)
     FROM orders o
     WHERE o.product_id = p.product_id) AS order_count
FROM
    products p;
-- 성능 좋은 JOIN 으로 변경
-- 참고: 메인쿼리1회 실행
SELECT
    p.*,
    COUNT(o.order_id) -- p.product_id 로 카운트 하면 주문이 없는 경우도 1로 카운트 된다.
FROM
    products p
LEFT JOIN
    orders o ON p.product_id = o.product_id
GROUP BY
    p.product_id;
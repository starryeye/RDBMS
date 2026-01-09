-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- FROM, JOIN 절에 서브쿼리가 있는 경우에 대해 알아보겠다.
-- 테이블 서브쿼리는..
--      서브쿼리의 실행 결과가 하나의 독립된 가상 테이블 처럼 사용된다.
--      따라서, 인라인 뷰라고도 불린다.


-- Example 1.
-- 각 상품 카테고리별로, 가장 비싼 상품의 이름과 가격을 조회
-- 1. 잘못된 예시
SELECT
    name, -- 이 쿼리가 동작하면 좋겠지만, GROUP BY 에서 사용된 컬럼이거나 집계함수만 SELECT 절에서 사용 가능 하므로 에러를 반환한다.
    category,
    MAX(price) AS max_price
FROM
    products p
GROUP BY
    p.category;
-- 2. 테이블 서브쿼리를 사용하여 실행가능하도록 우회
-- GROUP BY 를 사용하면 사용된 컬럼이나 집계함수만 SELECT 절에서 사용할 수 있는 제약이 있는데..
--      서브쿼리를 잘.. 활용하면 우회할 수 있다.
SELECT
    p1.*
FROM
    products p1
JOIN (
    SELECT
        category,
        MAX(price) AS max_price
    FROM
        products
    GROUP BY
        category
    ) AS p2 ON p1.category = p2.category AND p1.price = p2.max_price;
-- 3. WHERE 절에서의 비상관 서브쿼리를 이용한 방법..
SELECT
    p.*
FROM
    products p
WHERE
    (p.category, p.price) IN (
        SELECT
            category,
            MAX(price)
        FROM
            products
        GROUP BY
            category
        );
-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- 상관 서브쿼리에 대해 알아본다. 2
-- 상관 서브쿼리는 JOIN(특히 LEFT JOIN 과 GROUP BY)이나 IN 으로 대체가 가능하지만
--      EXISTS 를 활용한 방식에서는 JOIN 이나 IN 보다 효율적으로 동작하는 경우가 있다. 이 경우에 대해 알아본다.
-- IN vs EXISTS
--      IN
--          메인쿼리행이 많고 서브쿼리행이 적을때 사용
--          서브쿼리를 먼저 실행해서 결과 목록을 만든 후, 메인쿼리에서 사용하는 방식으로 동작 (비상관 서브쿼리)
--      EXISTS
--          메인쿼리행이 적고 서브쿼리행이 많을때 사용
--          메인쿼리의 각 행에 대해 서브쿼리를 실행하여 조건확인하는 방식으로 동작 (상관 서브쿼리)
--              서브쿼리 실행 중, 조건을 만족하는 첫 행만 찾으면 즉시 TRUE 반환 및 탐색 종료
-- 참고
--      EXISTS 를 사용할 수 있는 특별한 경우에만 상관 서브쿼리의 성능이 좋은 것이지..
--          대부분의 경우엔 JOIN 이나 IN 을 사용하는 방식의 성능이 훨씬 좋은 경우가 많다.
--      최신 DB 에서는 상관서브쿼리를 작성해도 옵티마이저가 자동으로 JOIN 으로 바꿔서 실행해주는 경우도 많다.

-- Example 1.
-- 한번이라도 주문된적 있는 상품들을 조회
-- EXISTS ()
--      서브쿼리의 결과 행이 1개 이상이면 TRUE, 서브쿼리의 결과 행이 0개 이면 FALSE
--      특징
--          상관 서브쿼리 특성상, 메인쿼리의 행 하나마다 상관서브쿼리가 실행되는데..
--              EXISTS 의 경우엔 서브쿼리를 수행함에 있어서 서브쿼리의 모든 행을 비교하지 않고
--              서브쿼리의 행 하나만 TRUE 이면 즉시 서브쿼리의 전체 행 탐색을 중단하고 TRUE를 반환한다.
-- NOT EXISTS () 는 반대이다.
SELECT
    *
FROM
    products p
WHERE EXISTS ( -- 주문 데이터(FK)와 상품 데이터(PK)가 일치하면 TRUE, 사실상 조인 역할을 하는 상관 서브쿼리
    SELECT
        1 -- EXISTS 는 결과 데이터가 무엇인지는 전혀 신경쓰지 않고, 행이 존재하는지만 보기 때문에 관례적으로 SELECT 1 과 같이 상수를 사용
    FROM
        orders o
    WHERE
        o.product_id = p.product_id -- 메인쿼리의 별칭을 사용
);
-- IN 을 이용한 방법, 비상관 서브쿼리
SELECT
    *
FROM
    products
WHERE product_id IN (
    SELECT
        DISTINCT product_id
    FROM
        orders
    );
-- JOIN 을 이용한 방법
SELECT
    DISTINCT p.*
FROM
    products p
JOIN
    orders o ON p.product_id = o.product_id;
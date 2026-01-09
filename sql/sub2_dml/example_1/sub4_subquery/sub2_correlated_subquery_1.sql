-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- 상관 서브쿼리에 대해 알아본다. (correlated subquery)
--      상관 서브쿼리는 메인이 되는 쿼리와 서브쿼리가 서로 연관을 맺고 동작하는 서브 쿼리를 말한다.
--      즉, 서브쿼리가 독립적으로 실행될 수 없고 메인 쿼리의 값을 참조하여 동적으로 실행되는 특징을 가진다.
--          쿼리를 보면, 메인 쿼리의 별칭이 서브쿼리에서 사용되는 것을 볼 수 있는게 큰 특징이다.
--      상관 서브커리가 포함된 전체 쿼리 실행 순서
--          1. 메인쿼리를 수행(FROM 까지)하여 첫번째 행(row)을 읽는다.
--          2. 읽혀진 행의 값을 서브쿼리에 전달하여, 서브쿼리가 실행된다.
--          3. 서브쿼리의 결과를 이용하여 메인쿼리의 조건(WHERE)을 판단
--          4. 메인쿼리를 수행(FROM 까지)한 두번째 행을 읽는다..... 반복
--          즉, 메인쿼리의 행(row)수 만큼 서브쿼리가 반복 실행된다.
--      성능
--          많은 경우, 상관 서브쿼리는 JOIN(특히 LEFT JOIN 과 GROUP BY)으로 동일한 결과를 얻도록 재작성이 가능하다.
--          JOIN 을 활용한 쿼리 작성 방식이 DB 옵티마이저가 더욱 효율적으로 처리하는 경우가 많다.
--              하지만, EXISTS 를 활용한 방식에서는 JOIN 이나 IN 보다 효율적으로 동작하는 경우가 있다. (sub2_correlated_subquery_2.sql 참고)
--              최신 DB 에서는 상관서브쿼리를 작성해도 옵티마이저가 자동으로 JOIN 으로 바꿔서 실행해주는 경우도 많다.
-- 참고
-- 비상관 서브쿼리
--      비상관 서브쿼리는 서브 쿼리가 단한번만 실행되고 그 결과를 메인쿼리에서 사용한다. (앞선 sub1_subquery_x 는 모두 비상관 서브쿼리이다.)


-- Example 1.
-- 각 카테고리의 평균가 보다 높거나 같은 상품을 조회
SELECT
    *
FROM
    products p1
WHERE
    price >= ( -- 메인쿼리 products p1 의 row 1개 마다 상관서브쿼리가 실행된다.
        SELECT
            AVG(price)
        FROM
            products p2
        WHERE
            p2.category = p1.category -- 메인쿼리의 별칭이 서브쿼리에 사용되어 상관 서브쿼리이다.
        );
-- JOIN 을 활용한 버전
-- 테이블 서브쿼리 방식 (sub4_table_subquery.sql 참고)
SELECT
    p1.*
FROM
    products p1
JOIN (
    SELECT
        category,
        AVG(price) AS avg_price
    FROM
        products
    GROUP BY
        category
) AS p2 ON p1.category = p2.category
WHERE
    p1.price >= p2.avg_price;

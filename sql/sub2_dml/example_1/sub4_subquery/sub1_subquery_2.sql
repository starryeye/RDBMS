-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- 서브쿼리 결과가 "단일컬럼, 다중행"인 경우에 대해 알아본다.
-- 특징
--      결과는 리스트와 같이 여러 개의 행으로 나오므로, IN, ANY, ALL 등의 연산자와 주로 사용된다.

-- Example 1
-- 특정 카테고리('전자기기')에 속한 모든 상품들을 주문한 주문 내역을 모두 조회
SELECT
    *
FROM
    orders
WHERE
    product_id IN (
        SELECT
            product_id
        FROM
            products
        WHERE
            category = '전자기기'
        );


-- ANY, ALL 연산자
--      > ANY ({서브쿼리})
--          서브쿼리의 반환 값들 중 최솟값보다 크면 참
--      < ANY ({서브쿼리})
--          서브쿼리의 반환 값들 중 최댓값보다 작으면 참
--      > ALL ({서브쿼리})
--          서브쿼리의 반환 값들 중 최댓값보다 크면 참
--      < ALL ({서브쿼리})
--          서브쿼리의 반환 값들 중 최솟값보다 작으면 참
--      = ANY ({서브쿼리})
--          서브쿼리의 반환 값들 중 어느 하나와 동일하면 참. (IN 과 완전히 동일한 의미이다.)

-- Example 2
-- 특정 카테고리('패션')의 어떤 상품보다도 비싼 상품 조회
--      특정 카테고리('패션')의 상품들 중 가장 비싼 상품보다 비싼 상품 조회와 같은 의미이다.
SELECT
    name,
    price
FROM
    products
WHERE
    price > ALL (
        SELECT
            price
        FROM
            products
        WHERE
            category = '패션'
    );
-- 집계함수 사용 버전 1
-- 이렇게 하면 스칼라 서브쿼리이다.
SELECT
    name,
    price
FROM
    products
WHERE
    price > (
        SELECT
            MAX(price)
        FROM
            products
        WHERE
            category = '패션'
        );
-- 집계함수 사용 버전 2
-- 다만, WHERE 를 이용하는게 더 성능상 좋다. (sub5_having.sql 참고)
--      왜냐하면, 모든 카테고리를 그룹으로 묶어놓고 패션 그룹만 사용하기 때문에 GROUP BY 의 의미가 없음..
SELECT
    name,
    price
FROM
    products
WHERE
    price > (
        SELECT
            MAX(price)
        FROM
            products
        GROUP BY
            category
        HAVING
            category = '패션'
        );
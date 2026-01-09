-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- CASE 문 중, Searched CASE Expression 에 대해 알아보겠다.
--      Java 의 if-else 문과 비슷하다.
--      가장 위의 조건문 부터 검사하여 참이면 해당 값으로 사용됨.


-- Example 1
-- 상품 가격에 따라 등급 표시
SELECT
    product_id,
    name,
    price,
    CASE
        WHEN price >= 100000 THEN '고가'
        WHEN price >= 30000 THEN '중가'
        ELSE '저가'
    END AS price_label
FROM
    products;


-- Example 2
-- 상품 가격에 따라 등급을 표시하고, 고가 > 중가 > 저가 순으로 정렬
SELECT
    product_id,
    name,
    price,
    CASE
        WHEN price >= 100000 THEN '고가'
        WHEN price >= 30000 THEN '중가'
        ELSE '저가'
    END AS price_label
FROM
    products
ORDER BY
    CASE
        WHEN price >= 100000 THEN 1
        WHEN price >= 30000 THEN 2
        ELSE 3
    END ASC, price DESC; -- 동일 등급내에서는 가격내림차순으로 정렬
-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.sub2_select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행



-- 1. GROUP BY 에 대해 알아본다.
--    GROUP BY 는 어떤 컬럼을 기준으로 row 값이 동일한 데이터들을 하나의 그룹으로 묶겠다는 뜻이다.
--    여기서의 하나의 그룹이란 하나의 대표 row 로 압축하겠다는 의미이다.

-- Example 1-1
-- 전체 table 에서(FROM) 카테고리가 동일한 데이터끼리 묶고(GROUP BY)
-- 각 카테고리의 주문 수(SELECT)를 하나의 row 로 보여줌.
SELECT
    category,
    COUNT(*) AS `카테고리별 주문 수`
FROM
    order_stat
GROUP BY
    category;

-- Example 1-2
-- 전체 table 에서(FROM) 고객 명이 동일한 데이터끼리 묶고(GROUP BY)
-- 각 고객별 주문 수, 총 구매 금액(SELECT)을 하나의 row 로 보여줌
SELECT
    customer_name,
    COUNT(*) AS `고객별 주문 수`,
    SUM(price * quantity) AS `고객별 총 구매 금액`
FROM
    order_stat
GROUP BY
    customer_name
ORDER BY
    `고객별 총 구매 금액` DESC; -- SUM(price * quantity) DESC 와 동일함. 백틱(`) 사용에 주의하자




-- 2. 중첩 GROUP BY
--      그룹핑을 하고 그안에서 한번더 그룹핑을 할 때 사용할 수 있다.

-- Example 2-1
-- 전체 table 에서(FROM) 고객 명이 동일한 데이터끼리 묶고(GROUP BY)
-- 묶인 그룹내에서 다시한번 category 가 동일한 데이터끼리 묶고
-- 각 고객 명, category, 고객-카테고리별 총 구매 금액(SELECT)을 하나의 row 로 보여줌
SELECT
    customer_name,
    category,
    SUM(price * quantity) AS `고객-카테고리별 총 구매 금액`
FROM
    order_stat
GROUP BY
    customer_name, category
ORDER BY
    customer_name, `고객-카테고리별 총 구매 금액`;




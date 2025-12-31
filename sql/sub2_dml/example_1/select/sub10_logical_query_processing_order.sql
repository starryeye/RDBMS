-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행


-- todo,
-- SQL 쿼리의 논리적 실행 순서에 대해 알아본다.
-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT
-- 6. ORDER BY
-- 7. LIMIT

SELECT
    customer_name,
    SUM(price * quantity) AS total_purchase
FROM
    order_stat
WHERE
    order_date < '2025-05-14'
GROUP BY
    customer_name
HAVING
    COUNT(*) >= 2
ORDER BY
    total_purchase DESC
LIMIT 1;
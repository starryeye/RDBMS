-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.sub2_select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행


-- 1. HAVING 에 대해 알아본다.
--      HAVING 은 GROUP BY 에 의해 그룹핑된 여러 그룹들 중에 특정 조건으로 필터링하고 싶을 때 사용한다.

-- Example 1.
-- category 가 동일한 row 들을 하나의 row 로 그룹(GROUP BY)하고
-- 각 그룹별로 SUM(price * quantity) 를 계산해서 500000 미만이면 제외시킨다.
SELECT
    category,
    SUM(price * quantity) AS `카테고리별 총 주문 금액`
FROM
    order_stat
GROUP BY
    category
HAVING
    SUM(price * quantity) >= 500000; -- 여기서 `카테고리별 총 주문 금액` 를 사용하지 말자.. SQL 은 HAVING 이후 SELECT 를 수행한다.



-- Example 2.
-- customer_name 가 동일한 row 들을 하나의 row 로 그룹(GROUP BY)하고
-- 각 그룹별로 COUNT(*) 를 계산해서 3 미만이면 제외시킨다.
SELECT
    customer_name,
    COUNT(*) AS `고객별 주문 수`
FROM
    order_stat
GROUP BY
    customer_name
HAVING
    COUNT(*) >= 3;


-- 참고
-- WHERE vs HAVING
--      WHERE
--          FROM 이후(GROUP BY 이전)에 실행
--          테이블 전체 row(FROM) 에 대해 조건 필터링
--          집계 함수 사용 불가
--      HAVING
--          GROUP BY 이후에 실행
--          GROUP BY 에 의해 그룹핑된 그룹들 대상으로 조건 필터링
--          집계 함수 사용 가능
-- 두개의 쿼리 모두로 결과를 조회 가능하다면, WHERE 를 이용하는게 실행 순서상 먼저 필터링 되므로 더 좋다
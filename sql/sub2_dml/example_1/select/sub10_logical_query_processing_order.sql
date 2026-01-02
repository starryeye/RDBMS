-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행



-- SQL 쿼리의 논리적 실행 순서에 대해 알아본다.
-- 1. FROM
--      어떤 테이블에서 데이터를 가져올지
-- 2. WHERE
--      FROM 결과에서 개별 행(row)을 필터링
-- 3. GROUP BY
--      WHERE 결과에서 그룹 형성
--          여러 개의 그룹을 만드는데 각 그룹은 여러 row 들로 만들었으며 하나의 그룹은 하나의 row가 된다.
-- 4. HAVING
--      GROUP BY 결과인 여러 그룹을 대상으로 필터링
-- 5. SELECT
--      HAVING 결과에서 원하는 컬럼을 선택
--          집계함수, 별칭(AS), 컬럼 등이 정해짐
-- 6. ORDER BY
--      HAVING 결과에서 원하는 컬럼을 대상으로 정렬
--      SELECT 이후에 실행되므로 별칭(AS) 사용가능
-- 7. LIMIT
--      ORDER BY 결과에서 최종 반환할 row 갯수 제한

SELECT
    customer_name,
    SUM(price * quantity) AS total_purchase -- 다섯번째 실행
FROM
    order_stat -- 첫번째 실행
WHERE
    order_date < '2025-05-14' -- 두번째 실행
GROUP BY
    customer_name -- 세번째 실행
HAVING
    COUNT(*) >= 2 -- 네번째 실행
ORDER BY
    total_purchase DESC -- 여섯번째 실행
LIMIT 1; -- 일곱번째 실행
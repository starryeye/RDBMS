-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- 셀프 조인에 대해 알아본다.
-- 셀프 조인이라는 특별한 기능이 있는것은 아니고 동일한 테이블에 존재하는 행(row)간 조인이다.
-- 셀프 조인은 테이블 별칭(AS)으로 수행하며,
--      하나의 테이블에 서로 다른 별칭을 부여(2개)함으로써, DB가 서로 다른 테이블인 것 처럼 인식하게 한다.

-- Example 1.
-- INNER JOIN 을 사용
SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM
    employees e
JOIN
    employees m ON e.manager_id = m.employee_id;


-- Example 2.
-- LEFT OUTER JOIN 을 사용
-- 최상위 리더의 경우 상위 직원이 없으므로 INNER JOIN 을 사용하면 결과에 포함되지 않는다.
--      따라서, LEFT JOIN 을 하면 결과에 포함된다.
SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM
    employees e
LEFT JOIN
    employees m ON e.manager_id = m.employee_id;



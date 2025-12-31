-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행



-- NULL 을 다루는 함수들을 알아본다.
-- 원본 데이터가 NULL 일 경우 조회시 NULL 을 회피하기 위한 함수들

-- 1. IFNULL(exp1, exp2)
--      exp1 의 결과가 NULL 이 아니면, exp1 의 결과를 반환하고
--      exp1 의 결과가 NULL 이면, exp2 의 결과를 반환한다.
SELECT
    name,
    IFNULL(description, '상품설명 없음') AS description
FROM
    products;



-- 2. COALESCE(exp1, exp2, exp3, ...)
--      왼쪽 표현식부터 계산하여 최초로 NULL 이 아닌 값을 반환한다.
SELECT
    name,
    COALESCE(description, '상품설명 없음') AS description
FROM
    products;
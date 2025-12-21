-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행



-- SELECT 방법 4-1, WHERE 절을 활용하여 특정 로우만 조회
--      WHERE 절에는 조건문이 들어가며, 비교연산자를 사용한다.
--          =
--          != (혹은 <>)
--          >
--          <
--          >=
--          <=
SELECT
    *
FROM
    customers
WHERE
    email = 'bbb@example.com';

SELECT
    *
FROM
    products
WHERE
    price >= 10000;


-- SELECT 방법 4-2, WHERE 절을 활용하여 특정 로우만 조회
--      WHERE 절에는 여러 조건을 조합할 수 있다.
--          AND
--          OR
--          NOT
SELECT *
FROM products
WHERE price >= 5000 AND stock_quantity >= 50;



-- SELECT 방법 4-3, WHERE 절을 활용하여 특정 로우만 조회
--      WHERE 절에는 여러 조건을 조합할 때, 더욱 편리하게 해주는 연산자가 존재한다.
--          BETWEEN, NOT BETWEEN
--          IN,      NOT IN
--          LIKE,    NOT LIKE
--          IS NULL, IS NOT NULL    NULL 에 대해서는 따로 설명(subX 에 존재)
SELECT *
FROM products
WHERE price BETWEEN 5000 AND 15000; -- WHERE price >= 5000 AND price <= 15000; 과 동일하다.

SELECT *
FROM products
WHERE price NOT BETWEEN 5000 AND 15000; -- WHERE price < 5000 OR price > 15000; 과 동일하다.

SELECT *
FROM products
WHERE name IN ('갤럭시', '아이폰', '에어팟'); -- WHERE name = '갤럭시' OR name = '아이폰' OR name = '에어팟'; 과 동일하다.

SELECT *
FROM products
WHERE name NOT IN ('갤럭시', '아이폰', '에어팟'); -- WHERE name != '갤럭시' AND name != '아이폰' AND name != '에어팟'; 과 동일하다.

SELECT *
FROM customers
WHERE email LIKE 'aa%'; -- aa 로 시작하는 모든 문자열

SELECT *
FROM customers
WHERE name NOT LIKE 'A__'; -- A 뒤에 정확히 2글자가 아닌 문자열

SELECT *
FROM products
WHERE description IS NOT NULL; -- NULL 값은 비교 연산자가 먹히지 않아서 따로 존재한다. (description != NULL 은 잘못된 문법임)

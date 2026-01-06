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
-- 참고로.. 날짜를 BETWEEN 과 함께 사용하면.. 2025-06 월을 필터링 한다면 애매할 수 있음.
--      왜냐하면, 작거나 같은 조건에서 2025-06-31 로 하면, DB 에서는 06-31 00:00:00 으로 하기 때문임..
--      그렇다고해서 06-31 24:59:59 로 하면 59초 이후에도 시간이 분명히 1초가 있으므로.. 애매함..
--      따라서, order_date >= 2025-06-01 AND order_date < 2025-07-01 로 해야함.

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

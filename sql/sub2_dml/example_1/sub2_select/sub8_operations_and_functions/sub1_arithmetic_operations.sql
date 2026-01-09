-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.sub2_select.sub1_precondition.sql 실행



-- SQL, 산술 연산
-- 원본 데이터에서 어떠한 가공(산술 연산)을 해서 결과물을 뽑아보고 싶을 때 사용한다.


-- 1. SELECT 절 안에서 사칙연산 활용
SELECT
    name,
    price,
    stock_quantity,
    price * stock_quantity AS total_stock_value -- price, stock_quantity 데이터를 산술 연산하여 새로운 데이터를 만들어 조회함
FROM
    products;

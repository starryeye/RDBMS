-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.sub2_select.sub1_precondition.sql 실행


-- SELECT 방법 5-1, ORDER BY 절을 통해 정렬을 할 수 있다.
--      SELECT 로 조회한 데이터의 순서는 DB 에 따라 전혀 다른 결과가 나올수 있음
--      따라서, 원하는 순서로 나열하고 싶다면 ORDER BY 를 이용해야한다.
--      ASC, (오름 차순, 기본값으로 생략가능)
--      DESC, (내림 차순)
SELECT *
FROM customers
ORDER BY join_date ASC; -- ASC 생략가능

SELECT *
FROM customers
ORDER BY join_date DESC;



-- SELECT 방법 5-2, ORDER BY 절을 통해 정렬을 할 수 있다.
--      정렬 기준이 여러 개일 경우(1번 조건으로 우선 정렬하고 1번 조건이 동일하다면 2번 조건으로 정렬하고 싶은 경우)에는 ORDER BY 에 조건을 나열하면 됨.
SELECT *
FROM products
ORDER BY stock_quantity DESC, price ASC; -- 재고수량에 따라 내림차순 정렬하고 재고수량이 동일하면 가격 오름차순으로 정렬


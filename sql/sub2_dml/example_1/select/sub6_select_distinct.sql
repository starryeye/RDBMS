-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행


-- SELECT 방법 7-1, 조회를 하면 중복된 데이터가 나올 수 있다. 이때 DISTINCT 를 적용한다.
--      컬럼 명 앞에 DISTINCT 키워드를 붙인다.
SELECT DISTINCT customer_id -- customer_id 컬럼에 대해 중복 제거
FROM orders;


-- SELECT 방법 7-2, 조회를 하면 중복된 데이터가 나올 수 있다. 이때 DISTINCT 를 적용한다.
--      여러 컬럼에 DISTINCT 를 적용할 수 있다.
SELECT DISTINCT customer_id, product_id -- (customer_id, product_id) 두개의 컬럼 조합에 대해 중복 제거
FROM orders;


-- DISTINCT 를 이용하면, 이용하지 않은 것 보다 당연히 성능이 저하될 수 있지만, 대부분의 경우에는 크게 문제 되지 않는 수준이다.
--      하지만, 성능 확인 작업은 꼭 해보자.

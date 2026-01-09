-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      동일 패키지내 sub1_insert.sql 실행




-- DELETE
-- WHERE 문을 까먹을 경우 모든 데이터에 대해 삭이 이루어지기 때문에 주의해야한다.
--      UPDATE 문을 실행하기 전에 SELECT 문으로 변경한 후 변경 대상을 눈으로 확인하고 DELETE 를 실행하는 습관이 중요하다.
DELETE FROM products
WHERE product_id = 1;


-- DDL 의, TRUNCATE 구문과 비슷하게 느껴지지만 많이다르다.
--      sql.sub1_ddl.example_1.drop_truncate.sql 을 참고
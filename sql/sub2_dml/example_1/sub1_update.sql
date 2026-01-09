-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      동일 패키지내 sub1_insert.sql 실행



-- UPDATE
-- WHERE 문을 까먹을 경우 모든 데이터에 대해 수정이 이루어지기 때문에 주의해야한다.
--      UPDATE 문을 실행하기 전에 SELECT 문으로 변경한 후 변경 대상을 눈으로 확인하고 UPDATE 를 실행하는 습관이 중요하다.
UPDATE products
SET price = 9800, stock_quantity = 580
WHERE product_id = 1;


-- 안전 업데이트 모드
--      UPDATE 구문을 실행할 때, 기본키 컬럼 조건이 WHERE 문에 존재하지 않으면 실행되지 않도록하는 모드이다.
--      기본적으로 MySQL 서버는 전역으로 비활성화 되어있음
--      기본적으로 Application 에서 DB 로의 connection 은 비활성화 됨
--      기본적으로 MySQL 워크벤치는 활성화 되어있음
--      기본적으로 Datagrip 은 비활성화 되어있음..
-- "SELECT @@SQL_SAFE_UPDATES;" 로 현재 안전 업데이트모드를 조회할 수 있다.
--      0: 비활성화, 1: 활성화
SELECT @@SQL_SAFE_UPDATES;
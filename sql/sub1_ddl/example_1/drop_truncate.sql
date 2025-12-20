-- datasource: my-rdbms-2



-- DROP TABLE : 테이블 존재 자체를 삭제한다.
-- orders 테이블 삭제
DROP TABLE orders;



-- TRUNCATE TABLE : 테이블의 구조는 남기고 내부 데이터만 삭제
TRUNCATE TABLE orders;
-- orders 테이블의 구조는 남기고 내부 데이터만 삭제
-- DML, "DELETE FROM orders;" 와 결과물은 동일하지만, DELETE 문은 한줄씩 지우고 TRUNCATE 는 초기화 개념이라 TRUNCATE 가 훨씬 빠름
-- AUTO_INCREMENT 값도 초기화 한다. "DELETE FROM orders;" 는 AUTO_INCREMENT 값을 초기화 하지 않음


-- 참고
-- 현재 orders 는 customers, products 테이블의 기본키를 외래키로 가지고 있어서 외래키 제약조건에 걸려있다.
-- 따라서, orders 를 지우지 않은 상태에서 customers, products 테이블을 DROP, TRUNCATE 한다면
--      orders 테이블 입장에서 참조할 수 없는 외래키를 가지게 되므로(데이터베이스 제약조건의 목적인 데이터 무결성이 깨짐), 실행할 수 없다는 에러가 발생한다.
-- 일시적으로 외래키 제약조건을 무시하고 싶다면,
--      "SET FOREIGN_KEY_CHECKS = 0;" 을 실행 후, 원하는 작업을 수행한다.
--      이후 "SET FOREIGN_KEY_CHECKS = 1;" 로 원상복구 시킨다.


-- datasource: my-rdbms-2

-- ALTER TABLE : 이미 만들어져있는 테이블의 구조를 변경할 때 사용한다.

-- 참고
-- ALTER TABLE 은 데이터베이스 버전에 맞는 메뉴얼을 확인하여
-- 라이브 상황에 사용가능할지 판단하고 사용할 것("테이블 락"이 발생할 수 있는지 등)


ALTER TABLE customers
ADD COLUMN point INT NOT NULL DEFAULT 0;
-- customers 테이블에 point 컬럼 추가


ALTER TABLE customers
DROP COLUMN point;
-- customers 테이블에 존재하는 point 컬럼 삭제


ALTER TABLE customers
MODIFY COLUMN address VARCHAR(500) NOT NULL;
-- customers 테이블에 존재하는 address 컬럼의 데이터 타입을 변경



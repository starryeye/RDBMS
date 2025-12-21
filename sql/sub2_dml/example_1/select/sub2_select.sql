-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행


-- SELECT 방법 1, 전체 조회
--      SELECT : 어떤 컬럼을 조회할 것인가
--      FROM : 어떤 테이블에서 조회할 것인가
SELECT * FROM customers;
-- * 는 모든 컬럼을 대상으로 하겠다는 의미이다.
--      성능저하, 네트워크 트래픽 낭비 발생


-- SELECT 방법 2, 특정 컬럼만 조회
--      SELECT 키워드와 FROM 키워드 사이에 원하는 컬럼명을 표기해준다.
SELECT name, email FROM customers;


-- SELECT 방법 3, 별칭(Alias) 활용
--      조회를 원하는 컬럼 리스트 뒤에 AS 키워드를 표기하여 뒤에 별칭을 붙일 수 있다.
-- 여러 테이블간 조인으로 조회할 경우, 컬럼명이 중복일 수 있으므로 alias 를 이용하여 정확히 구분해줄 수 있다.
SELECT
    name AS 이름,
    email AS '이메일 주소'
FROM
    customers;

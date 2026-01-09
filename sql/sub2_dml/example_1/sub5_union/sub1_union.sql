-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- UNION 에 대해 알아본다.
-- JOIN 은 ON 절의 연결정보를 바탕으로 데이터(row)를 수평으로 합쳐서 다양한 컬럼들을 추가로 붙이는 느낌이었다면..
-- UNION 은 컬럼은 유지하고 여러 데이터(row)를 수직으로 합쳐서 row 를 추가로 붙이는 느낌이다.
-- 특징
--      UNION 으로 연결되는 모든 SELECT 문은 컬럼 개수가 동일해야한다.
--      각 SELECT 문의 같은 위치에 있는 컬럼들은 서로 호환 가능한 데이터 타입이어야한다.
--      최종 결과의 컬럼 이름은 첫번째 SELECT 문을 따른다.
--          순서가 동일한 두 SELECT 컬럼의 이름이 다를 경우에도
--          데이터 타입 호환이 가능하다면 첫번째 SELECT 문 컬럼명에 데이터로 합쳐진다.
--      두 집합을 합친 뒤, 완전히 중복(모든 컬럼에 대한 값 동일)되는 row 는 제거한다.


-- Example 1.
-- 활성 유저 테이블과 탈퇴 유저 테이블을 합친다.
-- '션' 유저는 두군데 다 있도록 의도적으로 배치함.
--      -> 중복 제거됨을 확인 가능
SELECT name, email FROM users
UNION
SELECT name, email FROM retired_users;
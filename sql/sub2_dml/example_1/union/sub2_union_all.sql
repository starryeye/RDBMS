-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- UNION 에 이어서 UNION ALL 에 대해 알아본다.
-- UNION 은 동일 행에 대해 중복 제거된 결과가 반환되었지만, UNION ALL 은 중복 제거를 하지 않는다.
--      따라서, 성능상으로는 UNION ALL 이 좀더 좋다.


-- Example 1.
-- 활성 유저 테이블과 탈퇴 유저 테이블을 합친다.
-- '션' 유저는 두군데 다 있도록 의도적으로 배치함.
--      -> 중복 데이터가 반환됨을 확인 가능
SELECT name, email FROM users
UNION ALL
SELECT name, email FROM retired_users;
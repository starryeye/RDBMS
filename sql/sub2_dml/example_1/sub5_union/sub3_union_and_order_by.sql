-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- UNION, UNION ALL 을 사용할 때.. ORDER BY 사용 가이드..
-- 1. ORDER BY 절은 연산의 가장 마지막에 단 한번만 사용해야한다.
--      ORDER BY 절은 최종 결과 반환 직전 결과의 순서를 결정하는 의미이기 때문
-- 2. ORDER BY 절에 사용하는 컬럼 명은 첫번째 SELECT 문의 컬럼명 및 별칭만 사용가능하다.
-- 3. 두 SELECT 문에서 순서상 동일한 컬럼이 서로 컬럼명이 다를 경우 별칭으로 통일해주는 편이 가독성에 좋다.

-- Example 1
-- 활성 유저 테이블과 탈퇴 유저 테이블을 합친다.
SELECT name, email, created_at AS event_date FROM users
UNION ALL
SELECT name, email, retired_date AS event_date FROM retired_users
ORDER BY event_date DESC;
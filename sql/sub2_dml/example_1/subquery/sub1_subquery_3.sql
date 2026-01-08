-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- 서브쿼리 결과가 "다중컬럼, 단일행"인 경우에 대해 알아본다.
-- 특징
--      서브쿼리의 결과가 여러 컬럼이 나타나는 상황이다. 즉, 서브쿼리 SELECT 절에 두 개 이상의 컬럼이 포함됨.
-- 주의 사항
--      단일 행 비교 연산자들(=, >, <, >=, <=, <>)과 함께 사용되므로 서브쿼리의 결과는 반드시 단일행의 결과가 나와야한다.
--          그렇지 않으면, 에러를 발생시킬 것이다.


-- Example 1.
-- 어떤 주문 A(user_id = 2, order_id = 3)이 있다.
--      이 주문을 한 유저의 모든 주문 중, 주문 A 와 동일한 주문 상태를 가지는 모든 주문을 조회
SELECT
    *
FROM
    orders
WHERE
    (user_id, status) = (
        SELECT
            user_id,
            status
        FROM
            orders
        WHERE
            order_id = 3
        );
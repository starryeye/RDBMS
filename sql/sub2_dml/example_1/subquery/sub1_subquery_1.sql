-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- 서브쿼리 결과가 "단일컬럼, 단일행"인 경우에 대해 알아본다. (스칼라 서브쿼리)
-- 특징
--      결과가 하나의 값으로 정해지므로, 단일 행 비교 연산자들(=, >, <, >=, <=, <>)과 주로 사용된다.
-- 주의 사항
--      서브쿼리의 결과가 둘 이상 행을 반환한다면, DB 는 에러를 발생시킨다. (MySQL, Error Code: 1242)


-- Example 1
-- 특정 주문(order_id = 1)을 한 유저와 같은 도시에 사는 모든 고객을 조회
SELECT
    name,
    address
FROM
    users
WHERE
    address = ( -- order_id = 1 의 주문을 한 유저의 도시 명 조회
        SELECT
            u.address
        FROM
            users u
        JOIN
            orders o ON u.user_id = o.user_id
        WHERE
            o.order_id = 1
        );
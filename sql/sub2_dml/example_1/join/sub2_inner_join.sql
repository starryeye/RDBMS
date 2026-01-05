-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- 내부 조인(INNER JOIN)에 대해 알아본다.
--      두 테이블을 연결할 때, 양쪽 테이블에 공통적으로 존재하는 데이터가 있을 때 이를 연결해서 보여준다.
--      특징
--          교집합 성격
--              두 테이블에 공통된 데이터가 있을 때만 결과로 보여준다. 그외는 결과에서 생략된다.
--                  예를 들어, orders.user_id 에는 A, B 라는 데이터가 존재하고, users.user_id 에 B, C 가 존재한다면, 결과는 B 만 나온다.
--              교집합 이므로, 조인 방향과는 상관 없다.
--                  (FROM 에 orders, INNER JOIN 에 users) 와 (FROM 에 users, INNER JOIN 에 orders) 는 결과가 동일하다.
--          INNER 는 생략 가능하다.
--          JPQL 에서는 ON 절이 없어도 FK = PK 로 묶는다.
--          SQL 쿼리 실행 순서상 FROM 순서에서 동작한다.


-- Example 1
SELECT *
FROM orders
INNER JOIN users ON orders.user_id = users.user_id;


-- Example 2
SELECT
    users.user_id,
    users.name,
    orders.order_date -- order_date 컬럼은 orders 테이블에만 존재하여, 테이블명이 생략 가능하지만 테이블명을 항상 붙이는게 일관적이고 좋다.
FROM
    orders
INNER JOIN
    users ON orders.user_id = users.user_id
WHERE
    orders.status = 'COMPLETED';


-- Example 3
-- FROM 과 JOIN 절에 테이블 별칭을 사용하여 가독성을 향상 시킬 수 있다.
-- AS 는 생략 가능하다.
SELECT
    u.user_id,
    u.name,
    o.order_date
FROM
    orders AS o
JOIN
    users AS u ON o.user_id = u.user_id
WHERE
    o.status = 'COMPLETED';
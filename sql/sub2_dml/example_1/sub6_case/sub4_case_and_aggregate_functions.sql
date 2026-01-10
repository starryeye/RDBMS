-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)





-- 집계함수 안에서 CASE 를 사용할 수 도 있다.
-- 이를 "conditional aggregation" 조건부 집계라 부른다.


-- Example 1
-- 주문 상태별로 주문 갯수를 조회하고 동시에 전체 주문 수도 함께 조회한다.
-- 방법 1.
--      아래와 같이 status 로 그룹핑하는 순간 각 그룹별 통계만 구할수 있어서 전체 주문 수는 조회할 수 없어진다.
SELECT
    status,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    status;
-- 방법 2.
--      UNION 활용
--      컬럼명이 애매해져버림.. 아래는 status 인데 위는 total 이라 컬럼명이 애매한 category 로 정해짐..
SELECT 'total' AS category, COUNT(*) AS count FROM orders
UNION
SELECT status AS category, COUNT(*) AS count FROM orders GROUP BY status;
-- 방법 3.
--      SELECT 안에 서브쿼리를 사용
--      깔끔해보이는데 각 컬럼의 값을 얻기 위해 컬럼 수 만큼 쿼리 실행이 이루어져서 성능문제가 생긴다.
-- 참고. 아래 메인쿼리는 FROM 절이 없는데 MySQL 에서 특별 허용 쿼리이다. (SELECT 1, 1, 1; 쿼리 처럼 사용가능)
SELECT
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM orders WHERE status = 'COMPLETED') AS completed_count,
    (SELECT COUNT(*) FROM orders WHERE status = 'SHIPPED') AS shipped_count,
    (SELECT COUNT(*) FROM orders WHERE status = 'PENDING') AS pending_count;
-- 방법 4.
--      집계함수 내에서 CASE 사용
--      1회의 쿼리 실행으로 결과를 반환하여 성능 문제 없음
--          FROM 의 각 행에 대해 SELECT 각 컬럼을 수행한다.
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'COMPLETED' THEN 1 ELSE 0 END) AS completed_count,
    SUM(CASE WHEN status = 'SHIPPED' THEN 1 ELSE 0 END) AS shipped_count,
    SUM(CASE WHEN status = 'PENDING' THEN 1 ELSE 0 END) AS pending_count
FROM
    orders;


-- Example 2.
-- 주문내역에서 주문된 상품의 카테고리별로 묶고 주문의 상태로 다시 분류하여 주문 건수를 집계
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.status = 'COMPLETED' THEN 1 ELSE 0 END) AS completed_count,
    SUM(CASE WHEN o.status = 'SHIPPED' THEN 1 ELSE 0 END) AS shipped_count,
    SUM(CASE WHEN o.status = 'PENDING' THEN 1 ELSE 0 END) AS pending_count
FROM
    orders o
JOIN
    products p ON o.product_id = p.product_id
GROUP BY
    p.category;
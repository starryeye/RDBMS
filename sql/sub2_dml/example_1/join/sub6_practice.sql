-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.join.sub1_precondition.sql 실행



-- JOIN 연습


-- Example 1.
-- 2025년 6월에 서울 거주하는 고객이 주문한 모든 내역에 대해..
--      고객(이름, 이메일)
--      주문(날짜, 수량)
--      상품(이름, 금액) 을 포함하는 자료를..
--      주문 날짜 최신순으로 보여라
-- 접근 순서
-- 1. 고객이 주문한 모든 내역에 대한 것이므로 orders 테이블을 기준으로 둔다. (FROM)
-- 2. 필요한 데이터는 users, orders, products 테이블에 흩어져 있어서 3개의 테이블을 JOIN 한다.
-- 3. 2025 년 6월, 서울 거주에 대한 부분을 필터링한다. (WHERE)
SELECT
    u.user_id, u.name, u.email, u.address,
    o.order_id, o.order_date, o.quantity,
    p.product_id, p.name, p.price
FROM
    orders o
JOIN
    users u ON o.user_id = u.user_id
JOIN
    products p ON o.product_id = p.product_id
WHERE
    u.address LIKE '서울%' AND
    o.order_date >= '2025-06-01' AND
    o.order_date < '2025-07-01';
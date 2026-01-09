-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- CASE 문 중, Simple CASE Expression 에 대해 알아보겠다.
--      Java 의 Switch 문과 비슷하다.


-- Example 1
-- 주문 상태를 한글로 나타내어라
SELECT
    order_id,
    status,
    CASE status -- status 값에 따라 매핑된 값이 최종 값으로 사용된다.
        WHEN 'PENDING' THEN '주문 대기'
        WHEN 'COMPLETED' THEN '결제 완료'
        WHEN 'SHIPPED' THEN '배송'
        WHEN 'CANCELLED' THEN '주문 취소'
        ELSE '알 수 없음'
    END AS status_korean
FROM
    orders;
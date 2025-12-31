-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행







-- todo
--  아래 쿼리의 의미.. 암묵적 group by
--  최저가 최고가에 해당하는 customer_name 도 같이 출력하고 싶다면..
SELECT
    MIN(price) AS 최저가,
    MAX(price) AS 최고가
FROM
    order_stat;
-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행



-- 3. GROUP BY 를 사용할 때는..
--      SELECT 절에 GROUP BY 에 사용된 컬럼과 집계 함수만 사용할 수 있다.
--          GROUP BY 에 사용된 컬럼의 데이터가 동일한 것들 끼리 묶어서 하나의 대표 row 로 만드는 성격이므로..
--          대표할 데이터가 아닌 경우 DB 는 에러를 반환한다.

-- Example 3-1
-- 카테고리가 동일한 row 끼리 묶어서 하나의 row 로 나타낼 것인데...
--      조회 할 대상(SELECT)에서 category 는 카테고리가 동일한 row 끼리 묶었으므로 대표할 값은 하나이다.
--      조회 할 대상(SELECT)에서 COUNT(*) 는 카테고리가 동일한 row 들의 총 갯수 이므로 값은 하나이다.
--      조회 할 대상(SELECT)에서 product_name 은 카테고리가 동일한 row 들의 product_name 은 하나가 아니라 여러개로 대표할 값이 불분명하다.
--          따라서, product_name 때문에 DB 는 에러를 발생시킨다.
SELECT
    category,
    COUNT(*),
    product_name -- GROUP BY 에 사용된 컬럼도 아니고 집계함수도 아니다.
FROM
    order_stat
GROUP BY
    category;



-- todo
--  아래 쿼리의 의미.. 암묵적 group by
--  최저가 최고가에 해당하는 customer_name 도 같이 출력하고 싶다면..
SELECT
    MIN(price) AS 최저가,
    MAX(price) AS 최고가
FROM
    order_stat;
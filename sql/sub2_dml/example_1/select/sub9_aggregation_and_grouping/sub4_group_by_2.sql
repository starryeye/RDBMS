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



-- 4. 암묵적 GROUP BY
-- 아래 쿼리에는 GROUP BY 절이 없지만, SELECT 절에 집계함수만 존재하여
-- DB 는 전체 테이블 row 를 하나의 그룹(row)로 묶는다.
SELECT
    MIN(price) AS `주문 최저가`,
    MAX(price) AS `주문 최고가`
FROM
    order_stat;


-- 참고
-- 최저가 최고가에 주문한 customer_name 도 같이 출력하고 싶어서..
-- 아래와 같은 쿼리를 작성하면 에러가 발생한다.
--      우선, 아래는 GROUP BY 가 없지만, 암묵적 GROUP BY 가 적용되어 전체 테이블 row 를 하나의 row 로 묶는다.
--      따라서, customer_name 을 출력할 때는 어떤 값으로 대표할 지 결정 할 수가 없다.
-- 참고
-- 여기서 주문 최저가/최고가에 해당하는 customer_name 을 사용하면 되지 않냐라고 단순하게 생각 할 수 있는데.. 안된다...
-- 왜냐하면, 그룹 대상은 전체 테이블로 암묵적으로 되었지.. 주문 최저가/최고가 의 row 하나가 지정된게 아니기 때문이다.
--      또한, 주문 최저가/최고가가 하나의 row 로 나오지.. 두개의 row 로 나오지 않는다. 따라서 각각의 product_name 이 동일함이 보장되지도 않는다.
--      그렇다고해서.. customer_name 과 MIN(price) 두개의 컬럼만 조회하더라도 그룹 대상은 여전히 전체 테이블이므로 customer_name 의 대표 값은 DB 가 알지 못한다.
-- 그래서.. 서브 쿼리를 사용하거나, 최저가/최고가 각각 조회한다면 order by 를 사용해야한다.
SELECT
    customer_name,
    MIN(price) AS `주문 최저가`,
    MAX(price) AS `주문 최고가`
FROM
    order_stat;


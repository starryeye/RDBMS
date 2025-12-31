-- datasource: my-rdbms-2
-- precondition:
--      sql.sub2_dml.example_1.select.sub9_aggregate_and_grouping.sub1_precondition.sql 실행



-- 집계함수에 대해 알아본다.
-- 여러 row 의 값을 바탕으로 단일 결과 값을 계산하며, GROUP BY 절과 함께 자주 사용된다.
--      AVG
--      COUNT
--      MIN / MAX
--      SUM


-- 1-1. 집계 함수, COUNT
--      특정 컬럼의 row 갯수를 세는 집계 함수이다.
--      COUNT(*) 는 "NULL 값을 포함하여" 테이블의 모든 row 갯수를 반환한다.
--      COUNT({특정 컬럼}) 으로 컬럼 이름을 지정하면, "NULL 이 아닌" row 의 갯수를 반환한다.
SELECT
    COUNT(*) AS `전체 주문 건수`,                     -- NULL 포함
    COUNT(category) AS `카테고리가 등록된 주문 건수`     -- NULL 미포함
FROM
    order_stat;


-- 1-2. 집계 함수, COUNT 와 DISTINCT
--      COUNT 와 DISTINCT 를 함께 사용하면 중복 값을 제외한 갯수를 반환 받을 수 있다.
SELECT
    COUNT(customer_name) AS `주문 수(중복 포함한 주문자 수)`,
    COUNT(DISTINCT customer_name) AS `순수 주문자 수(중복 제거한 주문자 수)`
FROM
    order_stat;



-- 2. 집계 함수, SUM, AVG
--      SUM({특정 컬럼}) : 지정된 컬럼의 모든 row 값을 더하여 합산
--      AVG({특정 컬럼}) : 지정된 컬럼의 모든 row 값을 평균
--      NULL 값은 제외된다.
SELECT
    SUM(price * quantity) AS `총 매출액`,
    AVG(price * quantity) AS `평균 주문 금액`
FROM
    order_stat;



-- 3. 집계 함수, MIN, MAX
--      MIN({특정 컬럼}) : 지정된 컬럼의 모든 row 값들 중 최솟값
--      AVG({특정 컬럼}) : 지정된 컬럼의 모든 row 값들 중 최댓값
--      NULL 값은 제외된다.
SELECT
    MIN(price) AS 최저가,
    MAX(price) AS 최고가
FROM
    order_stat;
SELECT
    MIN(order_date) AS `최초 주문일`, -- 시간 날짜 데이터에서도 사용가능하다.
    MAX(order_date) AS `최근 주문일`
FROM
    order_stat;
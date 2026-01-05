-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행


-- NULL 에 대해 알아본다.
-- DB 에서는 NULL 을 값으로써 비교할 수 없다.
--      NULL 은 값이 존재하지 않는 것으로 어떠한 값으로써의 역할을 수행할 수 없다. (0 이나 '' 도 아니다.)
--      예를 들면, 아래와 같이 description = NULL 의 결과는.. 설령 실제로 NULL 인 로우가 존재하더라도
--          결과는 UNKNOWN 으로 참/거짓이 아니므로 결과의 로우에 포함되지 않는다.
--      참고
--          WHERE col IN (1, NULL) 이렇게 하면..
--              (col = 1) OR (col = NULL) 와 동일하며, 결론적으로 col = 1 인 행만 반환된다.
SELECT *
FROM products
WHERE description = NULL;


-- NULL 의 비교가 필요할 때는 비교연산자가 아닌, IS NULL / IS NOT NULL 을 이용한다.
SELECT *
FROM products
WHERE description IS NULL;



-- NULL 과 정렬에대해 알아본다.
-- DB 에 따라 NULL 을 어떻게 취급할지는 다를 수 있지만, 여기서는 MySQL 기준으로 알아본다.
-- MySQL 에서는 NULL 을 가장 작은 값으로 취급한다.
SELECT *
FROM products
ORDER BY description ASC; -- 오름차순


-- 내림차순으로 하되 NULL 이면 가장 앞쪽에 배치하려면..
SELECT *
FROM products
ORDER BY (description IS NULL) DESC, description DESC;
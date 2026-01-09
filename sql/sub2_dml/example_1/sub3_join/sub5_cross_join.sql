-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)


-- CROSS JOIN 에 대해 알아본다.
-- INNER JOIN, OUTER JOIN 의 경우는 ON 절을 통해 연결고리를 설정하여 짝을 지어주게된다.
-- CROSS JOIN 은 ON 절 없이 가능한 모든 경우의 수로 짝을 지어준다.
--      (A 테이블 row 수) * (B 테이블 row 수) 개가 반환된다.
-- 참고.
--      CROSS JOIN 은 모든 경우의 수를 만들어주기 때문에 실무에서 아주 유의해서 사용해야한다.

-- Example 1.
-- sizes 테이블 4개행 * colors 테이블 3개행
SELECT
    s.size,
    c.color
FROM
    sizes s
CROSS JOIN
    colors c;


-- Example 2.
-- 상품 명 생성해보기
SELECT
    CONCAT('{의류 상품명} - ', c.color, ' - ', s.size) AS product_name,
    s.size,
    c.color
FROM
    sizes s
        CROSS JOIN
    colors c;


-- Example 3.
-- sub2_dml.example_1.sub1_insert.sql 참고하면, CROSS JOIN SELECT 결과를 INSERT 하는 예제를 볼 수 있음.

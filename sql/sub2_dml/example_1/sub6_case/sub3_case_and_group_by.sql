-- datasource: my-rdbms-3
-- precondition:
--      sql.sub2_dml.example_1.sub3_join.sub1_precondition.sql 실행
--      sql.sub2_dml.example_1.sub5_union.sub0_precondition.sql 실행

-- 테이블간 연관관계
-- users (1) -----< orders (N) >----- products (1)
-- employees (1) -----< employees (N)



-- GROUP BY 안에 CASE 를 사용하면, CASE 로 분류한 그룹으로 분류된다.
-- 의의
--      GROUP BY 는 주로 특정 컬럼 데이터 값 그 자체로 나누는데 CASE 를 활용하면..
--          그때그때 필요한 커스텀 분류가 가능하다.

-- Example 1
-- 유저를 1990년대생, 1980년대생, 그 이전 출생으로 분류하고, 각 그룹 유저 수를 조회
SELECT
    CASE
        WHEN YEAR(birth_date) >= 1990 THEN '1990년대생'
        WHEN YEAR(birth_date) >= 1980 THEN '1980년대생'
        ELSE '그 이전 출생'
    END AS birth_decade,
    COUNT(*) AS customer_count
FROM
    users
GROUP BY
    CASE -- CASE 문의 결과 값을 바탕으로 그룹핑된다.
        WHEN YEAR(birth_date) >= 1990 THEN '1990년대생'
        WHEN YEAR(birth_date) >= 1980 THEN '1980년대생'
        ELSE '그 이전 출생'
    END;

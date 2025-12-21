-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행



-- SELECT 방법 6-1, 특정 조건에 따라 로우를 조회할 때, 상위 N 개만 필요한 경우 LIMIT 를 이용한다.
--      LIMIT 절은 ORDER BY 절과 함께 사용해야 의미가 있다.
--          DB 는 결과의 순서를 보장하지 않기 때문에 ORDER BY 로 원하는 기준으로 정렬후 사용해야한다.
SELECT
    *
FROM
    products
ORDER BY
    price DESC
    LIMIT 2;


-- SELECT 방법 6-2, 특정 조건에 따라 로우를 조회할 때, 특정 구간만 필요한 경우 LIMIT, offset 개념을 이용한다.
--      페이징 개념으로 LIMIT 뒤에 "건너뛸 로우 갯수" 그다음 "조회할 갯수" 가 들어간다.
--          바로 위 6-1 의 경우에는 LIMIT 0, 2; 에서 0 이 생략된 것임.
--      한 페이지에 몇개가 들어갈지 N 개로 정해졌고, 몇번째 페이지를 조회할 것인지 P 로 정해졌다면..
--          LIMIT {(P - 1) * N}, {N} 으로 쓸 수 있다.
SELECT *
FROM products
ORDER BY
    product_id ASC
    LIMIT 4, 2; -- 한 페이지에 2개씩 들어가고, 3번째 페이지 -> {(3 - 1) * 2}, {2}
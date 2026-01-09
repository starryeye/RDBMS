## SELECT 쿼리 실행 순서
1. FROM
   - 조회 대상 테이블 선정
   - JOIN 이 있다면, JOIN/ON 조건에 따라 가상 테이블을 선정한다.
2. WHERE
   - 대상 테이블의 전체 row 대상으로 조건 필터링
3. GROUP BY
   - 특정 컬럼의 값을 기준으로 동일한 row 끼리 하나의 그룹(row)으로 묶는다.
4. HAVING
   - GROUP BY 에 의해 그룹핑된 여러 그룹 대상으로 조건 필터링
5. SELECT
   - 조회할 컬럼을 선정
6. ORDER BY
   - 정렬
7. LIMIT
   - pagination 또는 몇개의 데이터만 원하는지..

## 서브쿼리가 포함되었다면..
- 비상관 서브쿼리의 경우
  - 서브쿼리가 메인쿼리보다 먼저 1회 수행된 후 메인쿼리가 수행된다.
- 상관 서브쿼리의 경우
  - sub2_correlated_subquery_1.sql 참고
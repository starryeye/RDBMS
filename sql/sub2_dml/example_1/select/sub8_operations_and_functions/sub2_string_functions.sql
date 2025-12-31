-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행
--      sql.sub2_dml.example_1.select.sub1_precondition.sql 실행



-- SQL, 문자열 함수
-- 원본 데이터에서 어떠한 가공(문자열 함수 적용)을 해서 결과물을 뽑아보고 싶을 때 사용한다.
--      CONCAT()
--      UPPER() / LOWER()
--      LENGTH()
--      CHAR_LENGHT()
--      SUBSTRING()
--      TRIM()
--      POSITION()


-- 1. CONCAT() 함수로 문자열 합치기
SELECT
    CONCAT(name, ' (', email, ')') AS name_and_email -- Java 로 치면, name + " (" + email + ")" 이다.
FROM
    customers;


-- 2. CONCAT_WS(separator, str1, str2, ...)
--      MySQL 전용함수로 첫번째 인자로 구분자를 받아 각 문자열 사이에 넣어준다.
SELECT
    CONCAT_WS(' - ', name, email, address)
FROM customers;



-- 3. UPPER() / LOWER()
--      문자열을 모두 대문자 / 소문자로 변경한다.
SELECT
    email,
    UPPER(email) AS upper_email
FROM customers;



-- 4. LENGTH(), CHAR_LENGHT()
--      LENGHT() : 바이트 크기 반환
--      CHAR_LENGHT() : 문자열의 길이를 반환
SELECT
    name,
    LENGTH(name) AS byte_length,        -- byte 크기, charset UTF-8 에서 한글의 경우 한 글자당 3 byte, 영어 알파벳은 1 byte
    CHAR_LENGTH(name) AS char_length    -- 문자열 길이
FROM
    customers;

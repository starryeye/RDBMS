-- datasource: my-rdbms-2
-- precondition: sql.sub1_ddl.example_1.create.sql 실행


-- INSERT 방법 1, 테이블 명과 VALUES 키워드 사이에 들어갈 컬럼명 리스트를 생략
-- 모든 컬럼에 대한 값을 기록해줘야하며 순서도 챙겨야한다.
-- AUTO_INCREMENT 컬럼의 경우 NULL 을 넣어주면 된다.
INSERT INTO customers VALUES
    (NULL, '가가가', 'aaa@example.com', 'hashed_password_1', '서울시 강남구', '2025-12-20 21:42:00');

INSERT INTO customers VALUES
    (NULL, '나나나', 'bbb@example.com', 'hashed_password_2', '서울시 서초구', '2025-12-20 21:44:00');


-- INSERT 방법 2, 컬럼 중 AUTO_INCREMENT, DEFAULT 키워드가 적용되어있으면 모든 컬럼에 대한 값을 넣지 않을 수 있음
-- 대신, 넣을 컬럼에 대한 리스트를 테이블 명과 VALUES 키워드 사이에 명시해준다.
-- customer_id, join_date 컬럼에 대한 값은 DB 에서 자동 생성해서 넣어주게 된다.
-- INSERT 방법 2 가 best practice 이다.
--      테이블 구조가 변경될 수 도 있으며, 순서를 착각한다던지 휴먼에러가 발생할 수 있기 때문..
INSERT INTO customers (name, email, password, address) VALUES
    ('다다다', 'ccc@example.com', 'hashed_password_3', '성남시 분당구');


INSERT INTO products (name, price, stock_quantity) VALUES
    ('반팔 티셔츠', 19900, 200);
INSERT INTO products (name, price, stock_quantity) VALUES
    ('긴팔 티셔츠', 30000, 50);


-- INSERT 방법 3, 여러개의 데이터를 하나의 SQL로 넣을 수 있다.
INSERT INTO products (name, price, stock_quantity) VALUES
    ('검정 양말', 5000, 100),
    ('흰색 양말', 5000, 150),
    ('회색 양말', 5000, 200);



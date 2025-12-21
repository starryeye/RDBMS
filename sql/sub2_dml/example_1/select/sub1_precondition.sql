-- datasource: my-rdbms-2
-- precondition:
--      sql.sub1_ddl.example_1.create.sql 실행


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE orders;
TRUNCATE TABLE customers;
TRUNCATE TABLE products;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO customers (name, email, password, address, join_date) VALUES
('AAA', 'aaa@example.com', 'password123', '서울특별시 강남구', '2023-01-01'),
('BBB', 'bbb@example.com', 'password456', '서울특별시 서초구', '2024-01-01'),
('CCC', 'ccc@example.com', 'password789', '성남시 분당구', '2025-01-01');

INSERT INTO products (name, description, price, stock_quantity) VALUES
('갤럭시', '가가가가', 10000, 55),
('LG 그램', '나나나나', 20000, 35),
('아이폰', '다다다다', 5000, 55),
('에어팟', '라라라라', 3000, 110),
('보급형 스마트폰', NULL, 5000, 100);

INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(1, 4, 2),
(2, 2, 1);

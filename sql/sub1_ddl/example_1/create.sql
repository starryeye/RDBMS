-- datasource: my-rdbms-2

-- 테이블간 연관관계
-- customers (1) -----< orders (N) >----- products (1)

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- DATETIME DEFAULT CURRENT_TIMESTAMP : 값을 따로 넣지 않으면 DEFAULT 설정에 따라 현재 시각이 기록됨.


CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);
-- INT NOT NULL DEFAULT 0 : 값을 따로 넣지 않으면 DEFAULT 설정에 따라 0 이 기록 된다.


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT '주문접수',
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- orders 테이블에 존재하는 customer_id, product_id 컬럼을 CONSTRAINT 이후 절과 엮어서, 외래키로 적용함(외래키 제약조건을 적용)

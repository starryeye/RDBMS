-- datasource: my-rdbms-1

-- create 명령어를 알아본다.

-- create database 는 데이터베이스를 생성하는 명령어이다.
create database my_database;



-- create table 은 데이터베이스 내에서 테이블 구조를 정의하고 생성하는 명령어이다.
-- 데이터베이스 테이블에는 기본키(여기서는 product_id)가 필수이다.
use my_database;
create table sample (
    product_id int primary key,
    name varchar(100),
    price int,
    stock_quantity int,
    release_date date
);
-- datasource: my-rdbms-1

-- show 명령어를 알아본다.

-- show databases 는 현재 서버에 있는 모든 데이터베이스 목록을 보여준다.
-- information_schema, mysql, performance_schema, sys 데이터베이스는 DBMS 운영을 위해 내부에서 사용하는 기본 데이터베이스이다.
show databases;

-- show tables 는 현재 데이터베이스에 있는 테이블 목록을 보여준다.
use my_database;
show tables;
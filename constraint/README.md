## 제약조건
- DB 에서는 DML 의 CUD(create, update, delete)의 경우 실행전 항상 제약조건을 우선 검증하여 데이터 무결성을 보장한다. 
- not null
- unique
- primary key
- foreign key
- default
- check



## MySQL 에서 각 제약조건 위배 시, 응답 에러코드
- not null
  - Error Code: 1364
- unique
  - Error Code: 1062
- primary key
- foreign key
  - Error Code: 1452
- default
- check
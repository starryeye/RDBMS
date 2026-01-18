## index
- 인덱스의 필요성
  - 정렬이 되지 않은 데이터 셋에서 특정 데이터를 찾아내려면..
    - 전체 데이터를 모두 봐야하지만.. O(N)
  - 정렬이 된 데이터 셋에서 특정 데이터를 찾아내려면..
    - 전체 데이터를 모두 보지 않고 binary search 를 사용할 수 있다. O(logN)
- 인덱스
  - 인덱스는 특정 컬럼(들)의 데이터 값을 기반으로 생성할 수 있는 balanced binary search tree 자료구조이다.
    - B tree, B+ tree 가 사용된다.
  - 인덱스는 특정 컬럼의 값(key)과 해당 데이터의 물리적 위치 주소(value)를 쌍으로 저장한다.
  - 인덱스의 데이터(key)는 항상 정렬된 상태로 유지된다.
    - 이를 통해 데이터 검색시, 데이터를 binary search 기법으로 데이터에 매우 빠르게 접근할 수 있다.
      - 검색 시, 데이블 전체를 스캔하는 대신, 정렬된 인덱스를 먼저 탐색하여 원하는 데이터의 위치로 즉시 이동할 수 있게됨.
  - 인덱스를 생성해두면, 옵티마이저가 인덱스를 사용할지 말지를 포함하여 최적의 방법으로 쿼리를 실행한다.
    - explain 명령어를 이용하면 쿼리 실행 계획을 알 수 있다.
  - MySQL 에서는..
    - 인덱스 종류
      - 클러스터 인덱스 (clustered index)
        - key: PK, value: row 그자체
      - 보조 인덱스 (secondary index)
        - key: 특정컬럼(들), value: PK
        - 보조 인덱스는 클러스터 인덱스의 포인터 역할을 한다고 볼 수 있다.
    - 자동으로 생성되는 인덱스
      - PK
        - 클러스터 인덱스로 만들어짐
      - 외래키 제약조건을 설정한 FK
        - 보조 인덱스(?)로 만들어짐
        - 조인을 할 때 빠르게 처리하기 위함
      - 유니크 제약조건을 설정한 컬럼
        - 데이터 insert 시, 동일 데이터가 존재하는지 여부를 빠르게 확인해야하므로 생성됨.


### 더 자세한 내용은..
- 학습 자료 직접 읽자
  - 인덱스가 사용되는 case
  - explain type 에 따른 실행 차이
    - all, index, const, range, ref
  - explain 의 filtered, extra 의미와 해석
    - Using filesort / Using index
  - 옵티마이저가 인덱스를 사용하는 조건
  - 커버링 인덱스
  - 복합 인덱스
  - 복합 인덱스 설계와 주의사항
  - 인덱스 설계법
  - 인덱스 주의사항

### 참고할만한 다른 예제
- [mysql-performance-optimization](https://github.com/starryeye/mysql-performance-optimization) 참고

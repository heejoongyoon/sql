


--1)
SELECT *
FROM lprod;
--2)
SELECT buyer_id, buyer_name
FROM buyer;
--3)
SELECT *
FROM cart;
--4)
SELECT mem_id, mem_pass, mem_name
FROM member;
SELECT mem_name

DESC emp;

empno : number ;
SELECT empno_plus ,empno + 10
FROM emp;

SELECT empno hi , empno + 10  empno_plus
FROM emp;

SELECT prod_id id , prod_name name
FROM prod;
SELECT lprod_gu gu , lprod_nm nm
FROM lprod;
SELECT buyer_id 바이어아이디 , buyer_name 이름
FROM buyer;

literal : 값 자체
literal 표기법 : 값을 표현하는 방법.
SELECT empno, 10 , 'Hello world'
FROM emp;

SELECT empno, ename||',world',  CONCAT(ename , ',hello')
FROM emp;
SELECT userid
FROM users;
SELECT CONCAT('아이디 : ',userid)
FROM users;
DESC emp;
SELECT table_name
SELECT 'SELECT FROM *' || 'table_name'|| ';'
SELECT CONCAT('SELECT * FROM ', table_name)||';'
FROM user_tables;

SELECT *
FROM emp
WHERE deptno = 10;
--------users 테이블에서 userid 컬럼의 값이 brown인 사용자만 조회
SELECT *
FROM users
WHERE userid = 'brown';
데이터값은 대소문자를 가린다.
---emp 테이블에서 부서번호가 20번보다 큰부서에 속한 직원 조회
SELECT *
FROM emp
WHERE deptno > 20;
----emp 테이블에서 부서번호가 20번 부서에 속하지 않은 모든 직원 조회
SELECT*
FROM emp
WHERE deptno ! = 20;
WHERE : 기술한 조건을 참 (TRUE) 으로 만족하는 행들만 조회한다(필터링)
SELECT *
FROM emp
WHERE 5=5;

SELECT empno,ename, hiredate
FROM emp 
WHERE hiredate >= TO_DATE('1981/03/01','YYYY/MM/DD');

문자열을 날짜 타입으로 변환하는 방법
TO_DATE(날짜 문자열, 날짜 문자열의 포맷팅)
TO_DATE('1981/03/01','YYYY/MM/DD')
RR은 사용하지 않는것이 좋다.
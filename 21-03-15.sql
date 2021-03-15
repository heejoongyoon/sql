---입사일자가 1982년 1월 1일 이후인 모든 직원 조회 하는 SELECT 쿼리를 작성하세요.

SELECT *
FROM emp 
WHERE hiredate >= TO_DATE('1982/01/01','YYYY/MM/DD');


--연산자 WHERE 절에서 사용 가능한 연산자
--(비교 ( - , != , > , < , )
-- + 연산자는 항이 두개가 필요하다.
-- 비교대상  BETWEEN AND  비교대상의 허용 시작값 AND 비교대상의 허용 종류값
== :부서번호가 10번에서 20번 사이의 속한 직원들만 조회.

SELECT *
FROM emp
WHERE deptno BETWEEN 10 AND 20 ;
 //emp 테이블에서 급여(1000보다 크거나 같고 2000보다 작거나 같은 직원들만 조회)
 
 SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000 ;

SELECT *
FROM emp
WHERE sal >= 1000
    AND sal <=2000
    AND deptno = 10;
    
 --ex)1
    SELECT *
    FROM emp
    WHERE hiredate BETWEEN TO_DATE('1982/01/01','YYYY/MM/DD') AND  TO_DATE('1983/01/01','YYYY/MM/DD') ;
    
    --ex)2
    SELECT *
    FROM emp
    WHERE hiredate >= TO_DATE('1982/01/01','YYYY/MM/DD') 
    AND hiredate <= TO_DATE('1983/01/01','YYYY/MM/DD') ;
    --between : 포함(이상 , 이하) 의개념이기 댸문에
    --초과 , 미만의 개념을 적용하려면 비교연산자를 사용해야한다.
    
    IN 연산자
    대상자 IN (대상자와 비교할 값 1 , 대상자와 비교할 값2 , 대상자와 비교 할 값 3 ..... )
    deptno IN ( 10, 20)  ====> deptno값이 10 이나 20번이면 TRUE ;
    
    SELECT *
    FROM emp 
    WHERE 10 IN (10,20) ;
    --10은 10과 같거나 10은 20과 같다.
    
    SELECT userid AS 아이디 , usernm AS 이름 , alias AS 별명
    FROM users
    WHERE userid IN ('brown' ,'cony' , 'sally' ) ;
    
    
    LIKE 연산자 : 문자열 매칭 조회
    게시글: 제목 검색 , 내용검색
    제목에 [맥북에어]가 들어가는 게시글만 조회.
    
        얼마 안된 멕북에어 팔아요
        맥북에어 팔아요
        팝니다 맥북에어
        
    % : 0개 이상의 문자를 의미함 
    _ : 1개 의 문자를 의미함.
    --userid가 c로 시작하는 모든 사용자
    SELECT *
    FROM users
    WHERE userid LIKE 'c%' ;
     --userid가 c로 시작하면서 e이후에 3개의 글자가 오는 사용자
       SELECT *
    FROM users
    WHERE userid LIKE 'c___' ;
    
    --userid 에 l이 들어가는 모든 사용자 조회
       SELECT *
    FROM users
    WHERE userid LIKE '%l%' ;
    SELECT  mem_id , mem_name
    FROM member
    WHERE mem_name LIKE '신%' ;
    
    SELECT mem_id , mem_name
    FROM member
    WHERE mem_name LIKE '%이%' ;
   
    --테이블 : 게시글
    제목 칼럼 : 제목
    
    SELECT *
    FROM 게시글
    WHERE 제목 LIKE '%멕북에어%' ;
    OR 내용 LIKE '%멕북에어%' ;
    
    
    ---is  , is not (NULL 비교 )
    emp 테이블에서 comm 칼럼의 값이 null 인 사람만 조회.
    SELECT *
    FROM emp
    WHERE comm IS  NULL ; 
     WHERE comm IS NOT NULL ; 
    sal = 1000
    sal  ! = 1000 ;
    
    emp 테이블에서 매니저가 없는 직원만 조회.
    SELECT *
    FROM emp
    WHERE mgr IS NULL ;
    
    AND , OR , NOT =논리연산자
    BETWEEN AND , IS ,LIKE ,IS
    AND = 두가지 조건을 동시에 만족시키는지 확인할 때
    조건1 : AND 조건 2
    OR : 두가지 조건을 하나라도 만족 시키는지 확인할 때
    조건1 : OR 조건 2
    NOT : 부정형 논리연산자 , 특정 조건을 부정
    mgr IS NULL : mgr 컬럼의 값이 NULL 인 사람만 조회.
    mgr IS NOT NULL : mgr 컬럼의 값이 NULL 이 아닌 사람만 조회.
    
    --emp 테이블에서 mgr의 사번이 7698 이면서 sal 값이 1000보다 큰 직원만 조회;
    --조건의 순서는 결과와 무관함.
   --sal 컬럼의 값이 1000보다 크거나 mgr 의 사번이 7698인 직원 조회.
    SELECT *
    FROM emp
    WHERE mgr = 7698
    OR sal > 1000 ;
    
    --AND 조건이 많아지면 : 조회되는 데이터 건수는 줄어든다.
    --OR 조건이 많아지면 : 조회되는 데이터 건수는 많아진다.
    
    
        NOT : 부정형 연산자 , 다른 연산자와 결합하여 쓰인다.
            IS NOT , NOT IN , NOT LIKE.
            
            SELECT *
            FROM emp
            WHERE deptno NOT IN (30) ; -- 부서번호가 30 에 해당되지 않는 직원들
    =
      SELECT *
            FROM emp
            WHERE deptno != 30;
            
            SELECT *
            FROM emp 
            WHERE ename NOT LIKE 'S%' ;
            
            NOT IN 연산자 사용시 주의점 : 비교값중에 NULL이 포함되면 데이터가 조회되지 않는다.
            
        SELECT *
        FROM emp
        WHERE mgr IN (7698 , 7839 , NULL )
       
    ==>
    mgr = 7698 OR mgr = 7839  OR mgr = NULL
    
      SELECT *
        FROM emp
        WHERE mgr  NOT IN (7698 , 7839 , NULL )
        ! (mgr = 7698  OR mgr = 7839  OR mgr = NULL)
        ===> mgr!= 7698 AND mgr != 7839 AND mgr != NULL
                    TRUE FALSE 의미가 없음 AND   FALSE
            mgr = 7698 =====> mgr !=7698
            OR         =====> AND
            
            --emp 테이블에서 jon이 SALESMAN 이고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회하세요.
            SELECT *
            FROM emp
            WHERE hiredate >= TO_DATE('1981/06/01','YYYY/MM/DD') 
            AND job= 'SALESMAN' ;
            
            --emp 테이블에서 부서번호가 10번이 아니고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회하세요.
            SELECT *
            FROM emp
            WHERE deptno !=10 -- =dentno not in (10)
            AND hiredate >= TO_DATE('1981/06/01','YYYY/MM/DD');
            
            ---emp 테이블에서 부서번호가 10번이 아니고 입사일자가 81 6/1 이후인 직원의 정보를 다음과 같이 조회하세요ㅕ
            --(부서는 10 , 20 ,30 만 있다고 가정하고 IN 연산자를 사용)
            SELECT *
            FROM emp
            WHERE deptno IN(20 ,30 )
            AND hiredate >= TO_DATE('1981/06/01','YYYY/MM/DD')
            
            --- emp 테이블에서 job 이 salesman 이거나 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회 하세요.
            
            SELECT *
            FROM emp
            WHERE job= 'SALESMAN'
             OR hiredate >= TO_DATE('1981/06/01','YYYY/MM/DD');
            
            ---emp 테이블에서 job 이 세일즈맨 이거나 사원번호가 78로 시작하는 직원의 정보를 다음과 같이 조회하세요
            
             
            SELECT *
            FROM emp
            WHERE empno LIKE '78%'
            OR job='SALESMAN' ;
            
            ----13 ) 12번 문제를 like 연산자 사용하지않고 풀기)..
            
               SELECT *
            FROM emp
            WHERE empno 
            OR job='SALESMAN' ;
    
    
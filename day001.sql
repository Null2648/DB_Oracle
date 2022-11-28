-- comment(주석 : 실행과 상관 없이 설명을 담을 때 사용하는 구문
/*
여러 줄에 걸쳐 주석을 담을 때 사용하는 구문
*/

show user -- 현재 접속 계정을 확인하는 sqlplus 명령어

-- 현재 접속된 계정에 포함된 테이블 확인
-- tab == tables
select * from tab;

-- 특정 테이블의 구조를 확인하는 명령
-- desc
-- desc는 두가지 의미가 있는데 하나는 구조확인, 하나는 정렬시 내림차순

desc emp
--emp는 employee의 약자로 특정 회사의 직원 정보를 담고 있는 테이블

desc DEPT --구조
select * from dept; --내용


-- sql 언어: 정의어(DDL), 조작어(DML), 제어어(DCL)
-- 정의어: create(생성), alter(변경), drop(제거)
-- 조작어: select(추출), insert(삽입), update(수정), delete(삭제)
-- 제어어: 무결성, 병행수행, 권한부여 등
--         grant, revoke, commit, rollback

alter session set nls_date_format='RR/MM/DD';

drop table emp;
drop table dept;

CREATE TABLE DEPT
       (DEPTNO number(10),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

-- scott 계정이 가지고 있는 테이블의 목록을 확인
select * from tab;

-- salgrade 테이블의 목록(내용)을 확인
select * from salgrade;

-- Q1. dept 테이블은 부서정보를 가지고 있는 테이블이다. 부서 정보의 내용을 확인 하려면?
select * from dept;

-- 부서테이블(dept)에서 부서이름(dname)만 추출
select dname from dept;

-- 부서테이블(dept)에 부서이름(dname), 위치(loc) 추출
select dname, loc from dept;

-- emp 테이블의 목록 확인, 직원수가 14명인가 확인
select * from emp;

select empno, ename, job from emp;

-- 예약어(keyword): 그 의미와 용도가 정해진 명령어로 다른 용도로 사용할 수 없음

-- 직원 테이블에서 직원 이름과 급여를 추출
select ename, sal from emp;

-- 급여를 100씩 올린걸 보고 싶을 때
select ename, sal, sal+100 from emp;

select ename, sal, sal+100 as "인상급여" from emp; -- 새로운 필드명을 만들때 as ""

-- 급여가 2500을 초과하는 직원의 목록을 추출하시오
select * from emp where sal>2500;

-- 직원 테이블의 직원 중 부서 번호가 20인 사원에 관한 정보를 추출하시오
select * from emp where deptno = 20;

-- Q2. 이름(ename)이 FORD인 사원의 사번(empno), 이름(ename), 급여(sal)을 추출하시오
select empno, ename, sal from emp where ename = 'FORD'; -- 문자 앞 뒤에 '를 넣어야 하고 대소문자를 구별한다.
-- 문자, 날짜, 시간등은 홑따옴표(' ' )안에 담아야 한다.
-- 필드명은 대소문자를 구별하지 않지만, 레코드는 반드시 대소문자를 구별해야 한다.

-- Q3. 입사일이 1982년 1월 1일 이후인 사원의 정보를 추출하시오.
select * from emp where hiredate >= '82/01/01';

-- 직원의 부서 번호가 10인 직원의 정보를 추출
select * from emp where deptno = 10;

-- 직원의 부서 번호가 10이 아닌 직원의 정보를 추출
select * from emp where not deptno = 10;
select * from emp where deptno != 10;
select * from emp where deptno <> 10;

-- 부서 번호가 10인 직원 중에서 직군(job)이 'MANAGER'인 직원의 정보를 추출
select * from emp where deptno = 10 and job = 'MANAGER';

-- 부서 번호가 10이거나 직군이 'MANAGER'인 직원의 정보를 추출
select * from emp where deptno = 10 or job = 'MANAGER';

--급여가 2000이상 3000이하인 사원의 정보를 추출
select * from emp where sal >= 2000 and sal <= 3000;

-- 관용구 between and
-- between: 숫자형, 문자형, 날짜형 모두 사용이 가능하다.
select * from emp where sal between 2000 and 3000;

-- Q4. 급여가 2000미만이거나 3000을 초과한 직원의 정보를 추출하시오.
select * from emp where not sal between 2000 and 3000;
select * from emp where sal < 2000 or sal >3000;

-- 관용구 in, not in
-- 커미션(comm)이 300 혹은 1400인 사원의 정보를 추출하시오.
select * from emp where comm = 300 or comm = 1400;
select * from emp where comm in (300, 1400);

-- 커미션(comm)이 300 혹은 1400이 아닌 사원의 정보를 추출하시오.
select * from emp where comm not in (300, 1400);
select * from emp where comm <> 300 and comm != 1400;

-- 관용구 like, ~와 같이, 처럼
-- 와일드 카드 문자 or 만능 문자: %(다른 언어에선 아세트크(?)임), _
-- 사원의 이름에 첫글자가 'C'로 시작하는 사원의 이름을 추출하시오.
-- _는 한글자 대체 %는 몇자든 상관없이
select ename from emp where ename like 'C%';
select ename from emp where ename not like 'C%';

select ename from emp where ename like '%E';
select ename from emp where ename like '%E%';

-- 사원의 이름에 두 번째 글자가 'A'인 사원의 정보를 추출하시오
select * from emp where ename like '_A%';
-- 사원의 이름에 두 번째 글자가 'A'가 아닌 사원의 정보를 추출하시오
select * from emp where ename not like '_A%';

-- NULL 의미: 미확정, 알 수 없는 값
-- NULL은 연산, 할당, 비교가 불가능
-- is null / is not null
-- is: 은, 는, 이/가
select * from emp;

-- 사원테이블의 커미션이 null인 사원의 정보를 추출하시오

select * from emp where comm is null;
select empno, ename, comm from emp where comm is not null;

-- select와 함께 확장해서 사용하는 order by 절
-- 정렬 방식: 기본형(오름차순, asc), 내림차순(desc)
-- 숫자, 문자, 날짜, NULL

-- 사원의 급열르 기준으로 오름차순 정렬하여 추출하시오.
select * from emp order by sal asc;
select * from emp order by sal;

-- 가장 최근에 입사한 사원순서로 주출

select * from emp order by hiredate desc;

-- 사원의 급여를 기준으로 오름차순 하되, 동일한 급여를 받는 사원에 이름으로 오름차숞 하시오
select * from emp order by sal, ename;
--
select * from emp order by sal, ename desc;
-- DISTINCT: 중복을 제거하고 추출할 때 사용
-- 사원테이블에서 부서번호를 추출
select deptno from emp;
select distinct deptno from emp;

-- 별칭(Nick Name): 필드 명에 별명을 부여
select ename, sal*12 as "연봉" from emp;
select ename, sal*12  "연봉" from emp;
-- 연결연산자: select 문 내부에 "||", 기존의 컬럼에 특정 문자열을 추가할 때
-- 쉬프트 원화 누르면 됨
select ename || '씨의 직군은 ' || job || '입니다.'from emp;
select ename, job from emp;

-- dual 테이블: 한 행의 결구를 출력하기 위해 사용하는 임시 테이블
-- 간단히 계산식: 30 * 50
select 39*40
from dual;

desc dual;

select sysdate
from dual;

-- 숫자 함수: 숫자 데이터를 처리하기 위해 사용하는 함수
-- abs: 절대값
select -10, abs(-10)
from dual;

-- floor: 소숫점 아래를 버리는 함수
select 42.195, floor(42.195)
from dual;

-- round: 특정 자릿수에서 반올림 하는 함수
-- round(숫자, 자릿수)
select 34.5678, round(34.5678)
from dual;

select 34.5678, round(34.5678, 1)
from dual;

select 34.5678, round(34.5678, -1)
from dual;

-- trunc: 특정 자릿수에서 잘라내는 함수
-- trunc(숫자, 자릿수)
-- 자릿수에서 2인 경우: 소숫점 이하 세 번째 자리에서 버림 연산 수행
select trunc(34.5678, 2), trunc(34.5678, -1), trunc(34.5678), trunc(34.5678, 0)
from dual;

-- mod: 나머지를 되돌려 주는 함수
-- mod(숫자, 나누는 수)
select mod(27, 2), mod(27, 5), mod(27, 7), mod(27, 3)
from dual;

-- 문자 처리 함수: 문자 데이터를 처리하는 함수, 문자열(두개 이상의 문자)
-- upper(): 대문자로 변환
select 'Welcome to Oracle' "적용전", upper('Welcome to Oracle') "upper 적용후"
from dual;
-- lower(): 소문자로 변환
select 'Welcome to Oracle' "적용전", lower('Welcome to Oracle') "lower 적용후"
from dual;
-- initcap(): 첫글자만 대문자로 변환
select 'WELCOME to oRACLE' "적용전", initcap('WELCOME to oRACLE') "initcap 적용후"
from dual;

-- length(): 문자의 길이를 구하는 함수
select length('Oracle'), length('오라클')
from dual;

-- lengthb(): 문자의 길이를 바이트 수로 알려주는 함수
select lengthb('Oracle'), lengthb('오라클')
from dual;
//* 한글은 깨질 수 있어서 유니코드로 표현되면서 1글자당 3바이트가됨 *//

-- instr(): 특정 문자의 위치를 구하는 함수(in string)
select instr('Welcome to Oracle', 'O')
from dual;

-- substr(문자열, 시작위치, 글자수): 문자열에서 시작위치 부터 글자수 만큼 추출
select substr('Welcome to Oracle', 4, 4)
from dual;

-- substrb(): 명시된 갯수 만큼의 문자가 아니라 바이트 수를 잘라낸다.
-- substr()함수는 한글/한자를 1바이트로 보지만, substrb()는 2바이트로 본다.
select substr('웰컴투오라클', 3, 4), substrb('오라클오라클', 3, 4)
from dual;

-- 사원 정보 테이블에서 사원들의 입사일에서 입사 년도와 입사한 달을 추출하시오.
-- 단 추출된 결과의 컬럼명은 직원이름, 년도, 월이 추출 되도록 하시오.

select ename, hiredate from emp;

select ename "직원이름", 19||substr(hiredate, 1, 2) "년도",
    substr(hiredate, 4, 2) "월"
from emp;

-- Q.9월에 입사한 사원의 정보를 추출 하시오.

select * from emp where substr(hiredate, 4, 2) = '09';

select ename "직원이름", 19||substr(hiredate, 1, 2) "년도",
    substr(hiredate, 4, 2) "월"
from emp
where substr(hiredate, 4, 2) = '09'; -- '09'로 안쓰고 09로 쓰면 문자가 아니라 숫자라 안된다(형통일)(문자와 문자비교)

-- trim(): 좌우 공백을 제거하는 함수
-- ltrim() / rtrim()
select ltrim('    ORACLE') from dual;

-- 단일행함수: 날짜함수, 형변환함수, 일반함수
-- 날짜함수: date(날짜데이터)
-- 날짜 + 숫자: 주어진 날짜부터 숫자의 기간 만큼 지난 날짜를 계산
-- 날짜 - 숫자: 주어진 날짜에서 숫자의 기간 만큼 이전 날짜를 계산
-- sysdate: 현재 시스템에 등록된 날짜를 반환
-- sysdate + 1: 내일
-- sysdate - 1: 어제
-- months_between: 두 날짜 사이의 개월 수를 구하는 함수
-- Q. 직원 정보 테이블의 입사 날짜를 이용하여 직원들의 근무한 개월 수를 추출
select ename, sysdate, hiredate, months_between(sysdate, hiredate) "근무 개월 수"
from emp;

-- add_months: 특정 개월 수를 더한 날짜를 구하는 함수
-- 입사날짜에서 4개월을 추가한 날짜를 추출하시오.
select ename, hiredate, add_months(hiredate, 4) from emp;

-- next_day: 해당 날짜에서부터 시작해 명시된 요일에 해당하는 날짜를 반환해 주는 함수
select sysdate, next_day(sysdate, '수요일')
from dual;

-- last_day: 해당 달의 마지막 날짜를 반환 하는 함수
-- 직원들의 입사한 달의 마지막 날을 추출
select ename, hiredate, last_day(hiredate)
from emp;
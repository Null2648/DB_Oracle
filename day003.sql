-- DDL: CREATE table - 새로운 테이블을 생성하는 SQL 명령어
create table emp01(
    empno number(4),
    ename varchar2(20),
    sal number(7, 2)
    );

-- 테이블 구조 확인: desc는 뒤에 ;를 붙이지 않는다
desc emp01

-- 새로운 테이블을 생성할 때 기존의 테이블과 동일한 구조로 이루어진 테이블 생성시
-- 구조와 내용을 함께 복사해서 새로운 테이블이 생성된다.

create table emp02 as select * from emp;

select * from emp02;

-- 기존 테이블의 일부 필드를 복사해서 새로운 테이블 생성
create table emp03 as select empno, ename from emp;
select * from emp03;

-- 기존 테이블의 구조만 이용하여 새로운 테이블 생성
-- where절: 조건절, 주어진 조건이 참인 것만
-- 1=0은 거짓조건이기에 내용은 가져오지 않고 구조만 가져오게 된다.
create table emp05 as select * from emp where 1=0;
desc emp05;
select * from emp05;

-- 부서번호가 10번인 직원의 정보를 확인
select * from emp where deptno = 10;

-- 조건에 만족하는 자료만 복사해서 테이블 생성
-- 부서 번호가 10번인 직원들에 대한 정보
create table emp04 as select * from emp where deptno = 10;
select * from emp04;

-- DDL: alter table - 테이블 구조를 변경하는 SQL 명령어
-- 컬럼의 추가, 수정, 삭제시 사용.
-- alter table ~ add: 기존 테이블에 새로운 컬럼을 추가하는 명령어
desc emp01
alter table emp01 add(job varchar2(9));


-- add(), modify()
-- alter modify: 기존 테이블에 컬럼을 수정하는 명령어
-- 수정할 컬럼에 자료가 없는 경우: 데이터 타입 변경 가능, 컬럼의 크기  변경 가능
-- 수정할 컬럼에 자료가 있는 경우: 데이터 타입 변경 불가능,
-- 자료가 있더라도 char와 varchar2 사이의 타입은 변경이 가능
select * from emp01;
desc emp01
alter table emp01 modify(job  varchar2(30));

-- alter table ~ drop column: 테이블에 존재하는 컬럼을 삭제하는 명령어
alter table emp01 drop column job;
desc emp01


-- DDL - drop table: 테이블을 제거하는 명령어
-- 한 번 제거된 테이블은 복구 할 수 없다.
desc emp01
drop table emp01;

-- 테이블 삭제시 주의할 사항
-- 무결성 제약 조건에 있는 테이블은 삭제할 수 없다.
-- 삭제하고자 하는 테이블의 기본키나 고유키를 다른 테이블에서 참조하고 있을경우
-- 삭제할 수 없다.

-- DDL - rename: 테이블명을 변경하는 명령어
-- 기존에 사용하는 테이블의 이름을 변경할 때 사용
select * from emp05;
rename emp05 to test;
select * from test;


-- DML: 조작어, 실제 일반 개발자에 의해서 사용되는 명령어 집합
-- 레코드 단위로 조작을 한다.
-- DML - select ~ from ~ where
-- DML - select: 테이블의 내용을 확인, 조건을 만족하는 레코드를 추출
-- DML - select: 테이블의 내용(레코드)을 확인, 조건에 만족하는 레코드를 추출
select *    -- *: all의 의미
from emp;

-- 조건식: 참 또는 거짓으로 판정이 되는 식
-- 참 또는 거짓: 관계식(비교식, 대소관계식), 논리식
-- 관계식: =(같다), <>(같지않다), !=(같지않다), >, >=, <, <=
-- 논리식: and(교집합, 논리곱, 모두 참일 때 참), or(합집합, 논리합, 어느것 하나라도 참이면 참)
-- not(여집합, 논리부정, 참이면 거짓으로, 거짓이면 참으로)
select *
from emp
where sal >= 2000;

select *
from emp
where job = 'MANAGER';

select *
from emp
where sal >= 2000 and job = 'MANAGER';

select empno, job, sal
from emp
where sal >= 2000 and job = 'MANAGER';




-- DML: insert into ~ 
create table sample(values()
-- 새로운 레코드를 추가할 떄 사용하는 SQL 명령어
create table dept01 as select * from dept where 1=0;
desc dept01

-- dept01 뒤에 컬럼을 지정하지 않으면 모두다 넣어야됨
insert into dept01 values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

-- 생략은 해줘도 되지만 어떤걸 가리키는진 알려줘야됨
insert into dept01(deptno, dname) values(20, 'RESEARCH');

insert into dept01(deptno, dname,loc)
values(30, 'SALES', 'CHICAGO');

    h_no number primary key,        -- 기본키(개체무결성): 비어도, 중복돼도 안됨
    h_name varchar2(10) not null,
    score number null               -- 여기선 null을 쓰나 안쓰나 비어도 된다는 의미가 같음
);

insert into sample(h_no, h_name, score) values(1234, 'aaa', 88);
insert into sample(h_no, h_name, score) values(1234, 'bbb', 99);    --h_no가 primary key라 중복되면 안돼서
insert into sample(h_no, h_name, score) values(2345, 'bbb', 89);
insert into sample(h_no, h_name, score) values(3456, 'ccc', 97);

select * from sample;

insert into sample(h_no, score) values(7777, 100); -- 무결성 제약 조건에 어긋남(h_name은 not null이라서)
insert into sample(h_no, h_name, score) values(7777, 'ddd', 100);



-- DML: update ~ set
-- 테이블에 저장된 레코드를 수정하는 SQL 명령어
-- where 절을 사용하지 않을 경우 모든 레코드의 값이 변경된다.
create table emp01 as select * from emp;

-- 모든 사원의 부서번호를 30번으로 수정
update emp01 set deptno = 30;
select * from emp01;

-- 사원의 급여를 10% 인상하는 쿼리문을 기술하시오

update emp01 set sal = sal * 1.1;

-- 모든 직원의 입사일을 오늘로 변경하시오

update emp01  set hiredate = sysdate;


-- 테이블 삭제
drop table emp01;

create table emp01 as select * from emp;

-- 부서 번호가 10번인 직원의 부서 번호를 40으로 변경하는 쿼리문
update emp01 set deptno = 40 where deptno = 10;

-- Q. job이 MANAGER인 직원만 급여를 10% 인상하는 쿼리문을 기술하시오.
update emp01 set sal = sal * 1.1 where job = 'MANAGER';

-- Q. 1981년도에 입사한 직원의 입시일을 오늘로 변경하는 쿼리문을 기술하시오
update emp01 set hiredate = sysdate where to_char(hiredate) like '81%';
update emp01 set hiredate = '20/10/10' where substr(hiredate, 1, 2) = '22';
update emp01 set hiredate = '20/12/10' where ename = 'KING';
update emp01 set hiredate = '19/11/25' where to_char(hiredate) like '___10___';

select * from emp01;

-- SCOTT 사원의 부서 번호는 20, job은 MANAGER로 변경하는 쿼리문
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SCOTT';

-- SCOTT 사원의 입사 날짜를 오늘로, 급여는 50으로, 커미션은 4000으로 변경하는 쿼리문
update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SCOTT';

-- 부서번호가 20번인 부서의 지역명을 부서번호가 40번인 부서의 지역명으로 변경
drop table dept01;
create table dept01 as select * from dept;

select loc from dept01 where deptno = 40;
update dept01 set loc = (select loc from dept01 where deptno = 40) where deptno = 20; 
select * from dept01;



-- DML: delete ~ from ~ where
-- 테이블에 저장된 레코드를 삭제하는 명령문
-- 특정 행을 삭제할 경우 where 조건절을 담는다.
-- where을 안쓰면 모든 레코드가 삭제된다.
select * from dept01;
delete from dept01;

-- 부서번호가 30번인 레코드를 삭제하는 쿼리문
delete from dept01 where deptno = 30;

drop table emp01;
create table emp01 as select * from emp;;
drop table dept01;
create table dept01 as select * from dept;

-- 사원테이블에 부서명이 'SALES'인 부서에 근무하는 모든 사원들을 삭제하는 쿼리문
select * from emp01; 사원 정보를 담고 있는 사원 테이블
select * from dept01; 부서 정보를 탐고 있는 부서 테이블
select deptno from dept01 where dname= 'SALES';
delete from emp01 where deptno = (select deptno FROM dept01 WHERE dname= 'SALES');



-- DCL - 무결성, 병행수행, 권한, 트랜잭션처리
-- commit: 변경 내용을 데이터베이스에 영구 저장
-- rollback: 되돌리는 작업
-- 자동 commit 되는 경우: DDL, DCL 명령문이 수행되는 경우, 정상 종료
-- 자동 rollback 되는 경우: 비정상 종료, 정전 혹은 컴퓨터 다운

drop table dept01;
create table dept01 as select * from dept;

delete from dept01;
select  * from dept01;
rollback;

delete from dept01 where deptno = 20;
commit;
-- 커밋하면 롤백해도 안살아남


-- 무결성 제약 조건: 유효성 검사 규칙
-- 테이블에 부적절한 자료가 입력되는 것을 방지하기 위해 테이블을 생성할 때 사용하는 규칙
-- 무결성: 정확성을 유지해야 한다
-- 제약 조건: 바람직 하지 않은 데이터의 저장을 방지 하는것
select * from emp;
desc emp;
select * from dept;
desc dept;

-- primary key(기본키): 반드시 입력, 유일한 값을 가져야 한다.
drop table dept01;
create table dept01 as select * from dept;

select * from dept01;
insert into dept01 values(10, 'TEST', 'BUSAN');  -- 원랜 삽입되면 안됨(부서 번호가 중복되니까)

drop table dept02;
create table dept02 (
    deptno number(2) primary key,
    dname varchar2(20),
    loc varchar2(20)
);

select * from dept02;
insert into dept02 values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept02 values(10, 'TEST', 'BUSAN');
insert into dept02 values(20, 'RESEARCH', 'DALLAS');
insert into dept02 values(30, 'SALES', 'CHICAGO');
insert into dept02 values(40, 'OPERATIONS', 'BOSTON');

-- 기본키와 외래키 설정
drop table emp06;
create table emp06(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2) references dept02(deptno) -- 부서 번호를 10,20,30,40만 허용하겠다.
);

insert into emp06 values(1111, 'aaa', 'a', 10);
select * from emp06;
insert into emp06 values(2222, 'aaa', 'a', 20);
insert into emp06 values(3333, 'aaa', 'a', 50); -- 부모 테이플 dept02에 50이 없어서 오류
insert into emp06 values(3333, 'bbb', 'b', 30);
update emp06 set ename = 'bbb', job = 'b' where empno = 2222;








-- 기존에 만들어진 테이블에 기본키 주기
drop table emp10;                        -- emp10 테이블 삭제
create table emp10 as select * from emp; -- emp10 테이블 생성

select *
from user_cons_columns
where table_name = 'emp10';
-- ??

select *
from user_constraints 
where table_name = 'emp10';
-- ?

desc emp10;
-- emp10 테이블 구조 확인
alter table emp10
modify(empno primary key);
-- empno에 개인키 부여

alter table emp10
modify(empno null);                      -- empno에 null 써도 되게

alter table emp10
modify(empno not null);                  -- empno에 null 못쓰게

alter table emp10
modify(ename not null);                  -- ename에 null 못쓰게

alter table emp10
modify(ename null);                      -- ename에 null 써도 되게



-- (사장과 매니저의 월급)의 평균과 (세일즈맨과 점원)의 월급의 평균의 차를 구하시오

select avg(sal)
from emp
where job in('PRESIDENT', 'MANAGER');

select avg(sal)
from emp
where job in('SALESMAN', 'CLERK');

select avg(p.sal) - avg(s.sal) as "이거 제목 어떻게 하면 길게 쓸 수 있죠"
from emp p, emp s
where p.job in('PRESIDENT', 'MANAGER') and s.job in('SALESMAN', 'CLERK');

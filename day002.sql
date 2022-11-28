-- 형(data type)변환 함수: 숫자, 문짜, 날짜 데이터형을 다른 데이터 형으로 변환하는 함수
-- 종류: to_number, to_char, to_date
-- number - character - date

-- to_char: 날짜형 또는 숫자형을 문자형으로 변환하는 함수
select sysdate from dual;

-- format(서식): yy/yyyy , mm, dd
select sysdate, to_char(sysdate, 'yyyy-mm-dd') "오늘 날짜"
from dual;

-- 사원들의 입사일을 출력하되, 요일을 함께 출력하는 쿼리문을 기술하시오.
-- day: 요일
select hiredate, to_char(hiredate, 'yyyy-mm-dd day'), to_char(hiredate, 'day')
from emp;

-- 현재 시스템의 날짜와 시간을 출력하는 쿼리문을 기술하시오.
-- 자바는 분을 월과 대문자로 구분
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

-- L: 각 지역별 통화 기호가 붙는다.)
-- 숫자 대신 사용되는 기호: 0과 9
-- 데이터의 값이 10 => 서식기호 00점 or 99점
-- 데이터의 값이 8 => 서식기호 00점: 08점, or 99점: 8점
-- 1000을 세자리 마다 ,를 찍고 싶을 때 => 0,000원: 1,000원
-- 800을 세자리 마다 ,를 찍고 싶을 때 => 0,000원: 0,800원으로 뜸
-- 즉 자릿수가 맞지 않을 경우 0은 0으로 채우고, 9는 채우지 않고 비운다.
select ename, sal, to_char(sal, '999,999L')
from emp;

-- to_date: 문자형을 날짜형으로 변환하는 함수
-- 기본 날짜 형식: yy/mm/dd
-- 날짜로 바꿀 수 없는 데이터는 변환 불가능
select ename, hiredate
from emp
where hiredate = to_date(19810220, 'yyyy/mm/dd');

-- to_number: 문자나 날짜 형식의 데이터를 숫자형으로 변환하는 함수
-- 20,000(이렇게 쉼표가 붙은건 숫자가 아니라 문자임)과 10,000 값 사이의 차를 알아보는 쿼리문
select to_number('20,000', '99,999')
from dual;

select 20000-10000
from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

select to_char((to_number('20,000', '99,999') - to_number('10,000', '99,999')), '99,999')
from dual;

-- NVL함수: NULL을 다른 값으로 변환하는 함수
select *
from emp;

-- 직원의 연봉을 계산해 출력하는 쿼리문을 기술하시오.
-- 연봉은 직원의 급여 * 12 + comm(상여금)
select ename, sal, sal * 12, sal * 12 + nvl(comm, 0) as 연봉
from emp;

-- 그룹함수(Group Function): 하나 이상의 행을 그룹으로 묶어서 연산을 하는 함수
-- sum: 해당 컬럼에 총합을 구하는 함수
-- 사원들의 급여의 총합을 출력하는 쿼리문을 기술하시오.
-- select sal, sum(sal) from emp; 는 행이 차이나서 오류가 난다.
select sum(sal)
from emp;

-- comm의 총합을 구하시오
-- 그룹함수는 다른 연산자와 달리 해당 컬럼값이 NULL인 것은 제외하고 계산한다.
select sum(comm) from emp;

-- avg: 해당 컬럼 값의 평균을 구하는 함수
-- 직원 급여의 평균을 계산하는 쿼리문을 기술하시오.
select round(avg(sal), 2) from emp;

-- max/min: 최댓값과 최솟값을 구하는 함수
-- 가장 높은 급여와 낮은 급여를 추출하는 쿼리문을 기술하시오.
select max(sal) "최대급여", min(sal) "최소급여", round(avg(sal), 2) "평균급여"
from emp;

/* -- 가장 높은 급여를 받는 직원의 이름과 급여를 추출하는 쿼리문을 기술하시오.
select ename, sal
from emp
where sal = max(sal);
이렇게 하면 오류 발생
*/

-- count: 조건에 만족하는 행의 개수를 변환하는 함수
-- count 함수에 특정 컬럼을 담으면 해당 컬럼에 값을 담고 있는 행의 개수를 반환
-- count 함수는 NULL 값에 대한 개수를 세지 않는다.
-- 직원의 수를 추출하는 쿼리문을 기술하시오.
select count(*)
from emp;

select count(ename)
from emp;

select count(comm)
from emp;

-- 직원들이 담당하는 업무의 건수를 계산하여 추출하는 쿼리문을 기술하시오.

select count(distinct job)
from emp;

-- group by 절
-- 특정 칼럼을 기준으로 그룹화 하여 해당 그룹에 존재하는 레코드를 대상하는 연산수행
-- 그룹함수를 사용하되, 특정 칼럼을 대상으로 적용할지를 기술할 때 사용
-- 직원의 급여의 합을 추출하는 쿼리문을 기술하시오.
select sum(sal) from emp;
-- 직원의 급여의 합을 출력하되 각 부서별 직원 급여의 합이 출력되도록 기술 하시오.

select deptno, sum(sal)
from emp
group by deptno;

-- 소속 부서별 급여의 총합과 평균급여를 추출하는 쿼리를 기술하시오.
-- 단 부서번호, 총급여, 평균급여 라는 컬럼명을 표시하시오.
select deptno "부서번호", sum(sal) "총급여", round(avg(sal), 2) "평균급여"
from emp
group by deptno
order by deptno;

-- 부서별 사원 수와 커미션을 받는 사람의 수를 추출하는 쿼리문을 기술하시오.
select deptno, count(*) "부서별 사원 수", count(comm)
from emp
group by deptno
order by deptno;

-- having 절: group by 절에 의해 생성된 결과 값에 원하는 조건식을 담는 절
-- 조건절: where절과 having절
-- 부서별 평균 급여를 출력하는 쿼리문을 기술하시오.
select deptno "부서 번호", round(avg(sal),2) "부서별 급여"
from emp
group by deptno
order by deptno;

-- 부서별 평균급여가 2000이 넘는 부서와 평균급여를 출력하는 쿼리문을 기술하시오,
select deptno "부서 번호", round(avg(sal),2) "부서별 급여"
from emp
group by deptno
having avg(sal) >= 2000
order by deptno;

-- group by에 ,를 넣어서 추가로 그룹지을 수 있다.
-- 부서별 직급단위 급여의 평균을 추출하는 쿼리문을 기술하시오.
select deptno, job, round(avg(sal), 2)
from emp
group by deptno, job
order by deptno, job;

select deptno, job, avg(sal)
from emp
where sal <= 3000
group by deptno, job
having avg(sal) >= 2000
order by deptno, job;


-- 조인(join): 하나 이상의 테이블을 연결하여 원하는 조건을 만족하는 자료를 추출하는 기능.
-- 직원이름, 부서번호, 부서명을 추출하는 쿼리문을 기술하시오.
select * from emp;
select * from dept;

select ename, emp.deptno, dname
from emp, dept 
where emp.deptno = dept.deptno;

-- cartesian product: 카티션 곱
-- 두 개 이상의 테이블에 존재하는 모든 데이터를 검색 결과로 갖는다.
-- 두 개 이상의 테이블에 공통된 컬럼이 존재하지 않을 경우 쓴다.
select *
from emp, dept;

-- equal join: 공통의 컬럼을 대상으로 테이블을 연결하는 기능
-- 사원정보를 출력하되, 해당 사원의 부서에 대한 상세 정보가 함께 출력 되도록 구현
select empno, ename, e.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno;

-- 이름이 SCOTT인 사원의 부서명을 찾아 이름과 부서명이 출력되도록 쿼리문을 기술하시오.

select ename, e.deptno, dname
from emp e, dept d
where ename = 'SCOTT';

--

select deptno
from emp
where ename = 'SCOTT';

select dname
from dept
where deptno = '20';

-- 서브쿼리: 쿼리 안에 또 다른 쿼리를 담아서 표현하는 것
select dname
from dept
where deptno = (select deptno
from emp
where ename='SCOTT');


-- 이렇게 하면 오류남 // 오류는 아니게 수정 했는데 결과값이 다름
select ename, dname
from emp e, dept d
where d.deptno = (select e.deptno
from emp e
where ename='SCOTT');

select ename, dname
from emp e, dept d
where d.deptno = 20;

select e.deptno
from emp e
where ename='SCOTT';

select ename, dname
from emp e, dept d
where ename = 'SCOTT' and e.deptno = d.deptno;

-- 만약 위 문장을 서브쿼리를 이용해 오류 없이 표현 하려면
select ename, dname
from emp e, dept d
where e.deptno = d.deptno and ename = 'SCOTT';

-- 급여가 2500 이하이고, 사원 번호가 9999 이하인 사원의 정보를 출력하시오.
-- 이하 처럼 하면 36개가 출력되서 제대로 된게 아니다.
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where sal <= 2500 and empno <= 9999;

-- 이하처럼 e.deptno와 d.deptno가 일치하는 것을 명시해줘야 함
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where sal <= 2500 and empno <= 9999 and e.deptno = d.deptno;

-- non-equi join: 동일 컬럼 없이 다른 조건(범위)을 사용하여 조인 할 때 사용하는 조인 기법
select * from tab;
select * from salgrade;
-- 700 ~ 1200의 월급을 받는 사람은 1등급, 1201 ~ 1400의 월급은 2등급 ...
select * from emp;
-- KING 은 5000의 월급을 받는데 salgrade의 5등급은 3001 ~ 9999의 월급을 받을 경우이다.
-- 이 때 KING은 완전 동일한 값은 없지만 5등급 범위에 속하기에 non-equi join을 사용한다.
select ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

select ename, sal, grade
from emp, salgrade
where sal >= losal and sal <= hisal;

select ename, e.deptno, dname, grade, sal
from emp e, dept d, salgrade
where sal between losal and hisal and e.deptno = d.deptno
order by grade, sal, deptno;

-- self-join: 자기 자신과 조인을 하는 기법
-- 일반적으로 조인은 여러개의 테이블을 연결하는 기법이지만 하나의 테이블 안에서
-- 조인을 해야 정보를 얻어내는 경우에 사용한다.
-- 직원 테이블을 이용 하여 해당 직원의 상사의 이름을 추출하시오.
select * from emp;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno;

-- outer join: 외부조인
-- Left outer join, Right outer join
-- 조인 조건에 맞지 않는 행도 나타내는 조인 기법
-- (+)를 쓰지 않으면 13개의 출력결과(KING 제외)가 나오는데 쓰면 포함 14개가 나온다.
-- (+)를 어디에 붙이는지에 따라 결과값이 달라질 수 있다.
-- 여기서 (+)를 오른쪽에 썼지만 왼쪽에 안나오던 값도 다 나오게 했기때문에 Left outer join이다.
-- 반대로 (+)를 왼쪽에 쓰면 오른쪽에 안나오던 결과 값이 다 나오게 하는 것이기이 Right outer join이다.
select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno(+);

-- 서브쿼리
-- 서브쿼리는 항상 오른쪽에 온다.
-- 서브쿼리는 괄호로 묶여 있어야 한다.
select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;
select dname from dept where deptno = (select deptno from emp where ename = 'SCOTT');

-- 단일행 서브 쿼리: 수행 결과가 오직 하나의 레코드(행)로만 반환하는 것
-- 단일행 비교 연산자: =(같다), <>(같지 않다), >, >=, <, <=, etc...
-- 사원들의 평균 급여 보다 더 많은 급여를 받는 사원을 추출하시오
-- select ename, sal from emp where sal > avg(sal); 로 쓰면 오류(그룹바이 함수이기 때문에
-- 이하처럼 써줘야 한다.)

select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- SCOTT의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여를 추출하시오.
select ename, sal
from emp
where sal >= (select sal from emp where ename = 'SCOTT');

-- 다중행 서브 쿼리: 서브쿼리의 결과가 두 개 이상인 것
-- 다중행 연산자: in, any(어느 것 하나라도), some, all
-- in: 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 하나라도 일치하면 참
-- 급여가 3000 이상 받는 직원의 부서와 동일한 부서에 근무하는 직원의 정보를 추출하시오
select ename, sal, deptno from emp where sal >= 3000;
select distinct(deptno) from emp where sal  >= 3000;

-- 이렇게 쓰면 서브 쿼리의 값이 하나여야 됨  deptno가 10, 20 2개가 떠서 안됨
select ename, sal, deptno
from emp
where deptno = (select distinct(deptno) from emp where sal  >= 3000);

select ename, sal, deptno
from emp
where deptno in(select distinct(deptno) from emp where sal >= 3000);

select ename, sal, deptno
from emp
where deptno in(10, 20);

select ename, sal, deptno
from emp
where deptno = 10 or deptno = 20;
-- 이상의 세 식은 모두 같지만 공정의 차이가 있다.

-- any, some: 메인 쿼리의 비교 조건이 서브 쿼리의 결과와 하나 이상 일치하면 참
-- < any: 찾은 값에 대하여 하나라도 크면 참
-- > any: 찾은 값에 대하여 하나라도 작으면 참
-- 부서 번호가 30번인 사원의 급여중 가장 작은값(950) 보다 높은 급여를 받는 사원의 정보를 추출
select ename, sal from emp where deptno = 30;

select ename, sal, deptno
from emp
where sal > any(select sal from emp where deptno = 30);

-- 됨
select ename, sal, deptno
from emp
where sal > (select min(sal) from emp where deptno = 30);

-- 안됨
select ename, sal, deptno
from emp
where sal > min(select sal from emp where deptno = 30);

-- all: 메인 쿼리의 비교 조건이 서브 쿼리의 결과와 모두 일치하면 참
-- < all: 최솟값 반환
-- > all: 최댓값 반환
-- 부서번호가 30번인 사원의 급여중 가장 많이 받는 사원 보다 더 높은 급여를 받는 사원을 추출하시오
select sal from emp where deptno = 30;

select ename, sal
from emp
where sal > all(select sal from emp where deptno = 30);
-- in과 any는 여기서 있는 값들 중 어느 하나 보다라도 크면 이라는 의미가 되서 안됨
-- all은 서브 쿼리의 값들 중 어떤 값 보다도 큰 값이어야 한다. 즉 최댓값

-- exists: 메인 쿼리의 비교 조건이 서브쿼리의 결과 중에 만족하는 값이 하나라도
-- 존재하면 참
-- in과의 차이??
-- in, any, some 은 갖고 있는 값을 대상으로 비교, exit은 존재의 여부까지 비교한다는 차이가 있다.
-- 대안적인 해결??
-- ex) 어떤 사이트를 방문했더니 not found가 뜨는것과 해당 사이트는 점검 중입니다. 라고 뜨는 것의 차이?
-- 둘다 접속이 안되지만 그 사이트값(테이블)이 존재하는지를 체크한다.
-- 유효성 검사 규칙
-- ex) 1,2,3학년만 있는 학교에 누가 실수로 5를 입력하면 안됨(유효성 검사 규칙이 없으면 5로 입력되는 불상사 발생)
-- dept 테이블에서 deptno가 10, 20인 데이터가 존재한다면, emp테이블에서 해당 컬럼을 추출
select ename, deptno
from emp
where deptno = 10 or deptno = 20;

select ename, deptno
from emp
where deptno in(10, 20);

-- 이렇게 쓰면 부서 번호가 50이 없어서 결과 값이 없음
select ename, deptno
from emp
where deptno = 50;

-- 그래서 50을 못쓰게 하려면 일단 dept에 50이 있는지 없는지 여부부터 체크하게 하는것이
-- exists의 역할이다.



-- ename이 KING인 사람과  JONES인 사람의 월급 차이를 구하시오.
-- 서브 쿼리를 배워야 한다.
-- select 절에 아래 처럼 조건을 쓰면 안됨
select sal(ename = 'KING') - sal(ename = 'JONES')
from emp;

select @a - @b
from emp
where a = (select sal from emp where ename = 'KING'),
b = (select sal from emp where ename = 'JONES');


-- a는 20 b는 10을 할당하고 a-b를 계산 하시오?????
-- 안되는게 기존의 값들을 꺼내와서 계산하는거라 안됨
select 20 - 10 from dual;


select c
from dual
where a = 20, b= 10, c = a-b;


-- 이렇게 쓰면 self join으로 계산한 것
select k.sal - j.sal
from emp k, emp j
where k.ename = 'KING'and j.ename = 'JONES';

-- 서브 쿼리를 이용해서 계산?

select sal from emp where ename= 'KING';
select sal from emp where ename= 'JONES';

select sal
from emp
where sal = (select sal from emp where ename = 'KING') - (select sal from emp where ename = 'JONES');

select ename, sal
from emp;




/*-- (사장과 매니저의 월급)의 평균과 (세일즈맨과 점원)의 월급의 평균의 차를 구하시오
이 역시 서브 쿼리를 배워야 한다.
select avg(sal???) -avg(sal???)
from emp;
*/
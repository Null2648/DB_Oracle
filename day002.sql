-- ��(data type)��ȯ �Լ�: ����, ��¥, ��¥ ���������� �ٸ� ������ ������ ��ȯ�ϴ� �Լ�
-- ����: to_number, to_char, to_date
-- number - character - date

-- to_char: ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �Լ�
select sysdate from dual;

-- format(����): yy/yyyy , mm, dd
select sysdate, to_char(sysdate, 'yyyy-mm-dd') "���� ��¥"
from dual;

-- ������� �Ի����� ����ϵ�, ������ �Բ� ����ϴ� �������� ����Ͻÿ�.
-- day: ����
select hiredate, to_char(hiredate, 'yyyy-mm-dd day'), to_char(hiredate, 'day')
from emp;

-- ���� �ý����� ��¥�� �ð��� ����ϴ� �������� ����Ͻÿ�.
-- �ڹٴ� ���� ���� �빮�ڷ� ����
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

-- L: �� ������ ��ȭ ��ȣ�� �ٴ´�.)
-- ���� ��� ���Ǵ� ��ȣ: 0�� 9
-- �������� ���� 10 => ���ı�ȣ 00�� or 99��
-- �������� ���� 8 => ���ı�ȣ 00��: 08��, or 99��: 8��
-- 1000�� ���ڸ� ���� ,�� ��� ���� �� => 0,000��: 1,000��
-- 800�� ���ڸ� ���� ,�� ��� ���� �� => 0,000��: 0,800������ ��
-- �� �ڸ����� ���� ���� ��� 0�� 0���� ä���, 9�� ä���� �ʰ� ����.
select ename, sal, to_char(sal, '999,999L')
from emp;

-- to_date: �������� ��¥������ ��ȯ�ϴ� �Լ�
-- �⺻ ��¥ ����: yy/mm/dd
-- ��¥�� �ٲ� �� ���� �����ʹ� ��ȯ �Ұ���
select ename, hiredate
from emp
where hiredate = to_date(19810220, 'yyyy/mm/dd');

-- to_number: ���ڳ� ��¥ ������ �����͸� ���������� ��ȯ�ϴ� �Լ�
-- 20,000(�̷��� ��ǥ�� ������ ���ڰ� �ƴ϶� ������)�� 10,000 �� ������ ���� �˾ƺ��� ������
select to_number('20,000', '99,999')
from dual;

select 20000-10000
from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

select to_char((to_number('20,000', '99,999') - to_number('10,000', '99,999')), '99,999')
from dual;

-- NVL�Լ�: NULL�� �ٸ� ������ ��ȯ�ϴ� �Լ�
select *
from emp;

-- ������ ������ ����� ����ϴ� �������� ����Ͻÿ�.
-- ������ ������ �޿� * 12 + comm(�󿩱�)
select ename, sal, sal * 12, sal * 12 + nvl(comm, 0) as ����
from emp;

-- �׷��Լ�(Group Function): �ϳ� �̻��� ���� �׷����� ��� ������ �ϴ� �Լ�
-- sum: �ش� �÷��� ������ ���ϴ� �Լ�
-- ������� �޿��� ������ ����ϴ� �������� ����Ͻÿ�.
-- select sal, sum(sal) from emp; �� ���� ���̳��� ������ ����.
select sum(sal)
from emp;

-- comm�� ������ ���Ͻÿ�
-- �׷��Լ��� �ٸ� �����ڿ� �޸� �ش� �÷����� NULL�� ���� �����ϰ� ����Ѵ�.
select sum(comm) from emp;

-- avg: �ش� �÷� ���� ����� ���ϴ� �Լ�
-- ���� �޿��� ����� ����ϴ� �������� ����Ͻÿ�.
select round(avg(sal), 2) from emp;

-- max/min: �ִ񰪰� �ּڰ��� ���ϴ� �Լ�
-- ���� ���� �޿��� ���� �޿��� �����ϴ� �������� ����Ͻÿ�.
select max(sal) "�ִ�޿�", min(sal) "�ּұ޿�", round(avg(sal), 2) "��ձ޿�"
from emp;

/* -- ���� ���� �޿��� �޴� ������ �̸��� �޿��� �����ϴ� �������� ����Ͻÿ�.
select ename, sal
from emp
where sal = max(sal);
�̷��� �ϸ� ���� �߻�
*/

-- count: ���ǿ� �����ϴ� ���� ������ ��ȯ�ϴ� �Լ�
-- count �Լ��� Ư�� �÷��� ������ �ش� �÷��� ���� ��� �ִ� ���� ������ ��ȯ
-- count �Լ��� NULL ���� ���� ������ ���� �ʴ´�.
-- ������ ���� �����ϴ� �������� ����Ͻÿ�.
select count(*)
from emp;

select count(ename)
from emp;

select count(comm)
from emp;

-- �������� ����ϴ� ������ �Ǽ��� ����Ͽ� �����ϴ� �������� ����Ͻÿ�.

select count(distinct job)
from emp;

-- group by ��
-- Ư�� Į���� �������� �׷�ȭ �Ͽ� �ش� �׷쿡 �����ϴ� ���ڵ带 ����ϴ� �������
-- �׷��Լ��� ����ϵ�, Ư�� Į���� ������� ���������� ����� �� ���
-- ������ �޿��� ���� �����ϴ� �������� ����Ͻÿ�.
select sum(sal) from emp;
-- ������ �޿��� ���� ����ϵ� �� �μ��� ���� �޿��� ���� ��µǵ��� ��� �Ͻÿ�.

select deptno, sum(sal)
from emp
group by deptno;

-- �Ҽ� �μ��� �޿��� ���հ� ��ձ޿��� �����ϴ� ������ ����Ͻÿ�.
-- �� �μ���ȣ, �ѱ޿�, ��ձ޿� ��� �÷����� ǥ���Ͻÿ�.
select deptno "�μ���ȣ", sum(sal) "�ѱ޿�", round(avg(sal), 2) "��ձ޿�"
from emp
group by deptno
order by deptno;

-- �μ��� ��� ���� Ŀ�̼��� �޴� ����� ���� �����ϴ� �������� ����Ͻÿ�.
select deptno, count(*) "�μ��� ��� ��", count(comm)
from emp
group by deptno
order by deptno;

-- having ��: group by ���� ���� ������ ��� ���� ���ϴ� ���ǽ��� ��� ��
-- ������: where���� having��
-- �μ��� ��� �޿��� ����ϴ� �������� ����Ͻÿ�.
select deptno "�μ� ��ȣ", round(avg(sal),2) "�μ��� �޿�"
from emp
group by deptno
order by deptno;

-- �μ��� ��ձ޿��� 2000�� �Ѵ� �μ��� ��ձ޿��� ����ϴ� �������� ����Ͻÿ�,
select deptno "�μ� ��ȣ", round(avg(sal),2) "�μ��� �޿�"
from emp
group by deptno
having avg(sal) >= 2000
order by deptno;

-- group by�� ,�� �־ �߰��� �׷����� �� �ִ�.
-- �μ��� ���޴��� �޿��� ����� �����ϴ� �������� ����Ͻÿ�.
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


-- ����(join): �ϳ� �̻��� ���̺��� �����Ͽ� ���ϴ� ������ �����ϴ� �ڷḦ �����ϴ� ���.
-- �����̸�, �μ���ȣ, �μ����� �����ϴ� �������� ����Ͻÿ�.
select * from emp;
select * from dept;

select ename, emp.deptno, dname
from emp, dept 
where emp.deptno = dept.deptno;

-- cartesian product: īƼ�� ��
-- �� �� �̻��� ���̺� �����ϴ� ��� �����͸� �˻� ����� ���´�.
-- �� �� �̻��� ���̺� ����� �÷��� �������� ���� ��� ����.
select *
from emp, dept;

-- equal join: ������ �÷��� ������� ���̺��� �����ϴ� ���
-- ��������� ����ϵ�, �ش� ����� �μ��� ���� �� ������ �Բ� ��� �ǵ��� ����
select empno, ename, e.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno;

-- �̸��� SCOTT�� ����� �μ����� ã�� �̸��� �μ����� ��µǵ��� �������� ����Ͻÿ�.

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

-- ��������: ���� �ȿ� �� �ٸ� ������ ��Ƽ� ǥ���ϴ� ��
select dname
from dept
where deptno = (select deptno
from emp
where ename='SCOTT');


-- �̷��� �ϸ� ������ // ������ �ƴϰ� ���� �ߴµ� ������� �ٸ�
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

-- ���� �� ������ ���������� �̿��� ���� ���� ǥ�� �Ϸ���
select ename, dname
from emp e, dept d
where e.deptno = d.deptno and ename = 'SCOTT';

-- �޿��� 2500 �����̰�, ��� ��ȣ�� 9999 ������ ����� ������ ����Ͻÿ�.
-- ���� ó�� �ϸ� 36���� ��µǼ� ����� �Ȱ� �ƴϴ�.
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where sal <= 2500 and empno <= 9999;

-- ����ó�� e.deptno�� d.deptno�� ��ġ�ϴ� ���� �������� ��
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where sal <= 2500 and empno <= 9999 and e.deptno = d.deptno;

-- non-equi join: ���� �÷� ���� �ٸ� ����(����)�� ����Ͽ� ���� �� �� ����ϴ� ���� ���
select * from tab;
select * from salgrade;
-- 700 ~ 1200�� ������ �޴� ����� 1���, 1201 ~ 1400�� ������ 2��� ...
select * from emp;
-- KING �� 5000�� ������ �޴µ� salgrade�� 5����� 3001 ~ 9999�� ������ ���� ����̴�.
-- �� �� KING�� ���� ������ ���� ������ 5��� ������ ���ϱ⿡ non-equi join�� ����Ѵ�.
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

-- self-join: �ڱ� �ڽŰ� ������ �ϴ� ���
-- �Ϲ������� ������ �������� ���̺��� �����ϴ� ��������� �ϳ��� ���̺� �ȿ���
-- ������ �ؾ� ������ ���� ��쿡 ����Ѵ�.
-- ���� ���̺��� �̿� �Ͽ� �ش� ������ ����� �̸��� �����Ͻÿ�.
select * from emp;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno;

-- outer join: �ܺ�����
-- Left outer join, Right outer join
-- ���� ���ǿ� ���� �ʴ� �൵ ��Ÿ���� ���� ���
-- (+)�� ���� ������ 13���� ��°��(KING ����)�� �����µ� ���� ���� 14���� ���´�.
-- (+)�� ��� ���̴����� ���� ������� �޶��� �� �ִ�.
-- ���⼭ (+)�� �����ʿ� ������ ���ʿ� �ȳ����� ���� �� ������ �߱⶧���� Left outer join�̴�.
-- �ݴ�� (+)�� ���ʿ� ���� �����ʿ� �ȳ����� ��� ���� �� ������ �ϴ� ���̱��� Right outer join�̴�.
select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno(+);

-- ��������
-- ���������� �׻� �����ʿ� �´�.
-- ���������� ��ȣ�� ���� �־�� �Ѵ�.
select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;
select dname from dept where deptno = (select deptno from emp where ename = 'SCOTT');

-- ������ ���� ����: ���� ����� ���� �ϳ��� ���ڵ�(��)�θ� ��ȯ�ϴ� ��
-- ������ �� ������: =(����), <>(���� �ʴ�), >, >=, <, <=, etc...
-- ������� ��� �޿� ���� �� ���� �޿��� �޴� ����� �����Ͻÿ�
-- select ename, sal from emp where sal > avg(sal); �� ���� ����(�׷���� �Լ��̱� ������
-- ����ó�� ����� �Ѵ�.)

select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- SCOTT�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
select ename, sal
from emp
where sal >= (select sal from emp where ename = 'SCOTT');

-- ������ ���� ����: ���������� ����� �� �� �̻��� ��
-- ������ ������: in, any(��� �� �ϳ���), some, all
-- in: ���� ������ �� ������ ���� ������ ��� �߿��� �ϳ��� ��ġ�ϸ� ��
-- �޿��� 3000 �̻� �޴� ������ �μ��� ������ �μ��� �ٹ��ϴ� ������ ������ �����Ͻÿ�
select ename, sal, deptno from emp where sal >= 3000;
select distinct(deptno) from emp where sal  >= 3000;

-- �̷��� ���� ���� ������ ���� �ϳ����� ��  deptno�� 10, 20 2���� ���� �ȵ�
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
-- �̻��� �� ���� ��� ������ ������ ���̰� �ִ�.

-- any, some: ���� ������ �� ������ ���� ������ ����� �ϳ� �̻� ��ġ�ϸ� ��
-- < any: ã�� ���� ���Ͽ� �ϳ��� ũ�� ��
-- > any: ã�� ���� ���Ͽ� �ϳ��� ������ ��
-- �μ� ��ȣ�� 30���� ����� �޿��� ���� ������(950) ���� ���� �޿��� �޴� ����� ������ ����
select ename, sal from emp where deptno = 30;

select ename, sal, deptno
from emp
where sal > any(select sal from emp where deptno = 30);

-- ��
select ename, sal, deptno
from emp
where sal > (select min(sal) from emp where deptno = 30);

-- �ȵ�
select ename, sal, deptno
from emp
where sal > min(select sal from emp where deptno = 30);

-- all: ���� ������ �� ������ ���� ������ ����� ��� ��ġ�ϸ� ��
-- < all: �ּڰ� ��ȯ
-- > all: �ִ� ��ȯ
-- �μ���ȣ�� 30���� ����� �޿��� ���� ���� �޴� ��� ���� �� ���� �޿��� �޴� ����� �����Ͻÿ�
select sal from emp where deptno = 30;

select ename, sal
from emp
where sal > all(select sal from emp where deptno = 30);
-- in�� any�� ���⼭ �ִ� ���� �� ��� �ϳ� ���ٶ� ũ�� �̶�� �ǹ̰� �Ǽ� �ȵ�
-- all�� ���� ������ ���� �� � �� ���ٵ� ū ���̾�� �Ѵ�. �� �ִ�

-- exists: ���� ������ �� ������ ���������� ��� �߿� �����ϴ� ���� �ϳ���
-- �����ϸ� ��
-- in���� ����??
-- in, any, some �� ���� �ִ� ���� ������� ��, exit�� ������ ���α��� ���Ѵٴ� ���̰� �ִ�.
-- ������� �ذ�??
-- ex) � ����Ʈ�� �湮�ߴ��� not found�� �ߴ°Ͱ� �ش� ����Ʈ�� ���� ���Դϴ�. ��� �ߴ� ���� ����?
-- �Ѵ� ������ �ȵ����� �� ����Ʈ��(���̺�)�� �����ϴ����� üũ�Ѵ�.
-- ��ȿ�� �˻� ��Ģ
-- ex) 1,2,3�г⸸ �ִ� �б��� ���� �Ǽ��� 5�� �Է��ϸ� �ȵ�(��ȿ�� �˻� ��Ģ�� ������ 5�� �ԷµǴ� �һ�� �߻�)
-- dept ���̺��� deptno�� 10, 20�� �����Ͱ� �����Ѵٸ�, emp���̺��� �ش� �÷��� ����
select ename, deptno
from emp
where deptno = 10 or deptno = 20;

select ename, deptno
from emp
where deptno in(10, 20);

-- �̷��� ���� �μ� ��ȣ�� 50�� ��� ��� ���� ����
select ename, deptno
from emp
where deptno = 50;

-- �׷��� 50�� ������ �Ϸ��� �ϴ� dept�� 50�� �ִ��� ������ ���κ��� üũ�ϰ� �ϴ°���
-- exists�� �����̴�.



-- ename�� KING�� �����  JONES�� ����� ���� ���̸� ���Ͻÿ�.
-- ���� ������ ����� �Ѵ�.
-- select ���� �Ʒ� ó�� ������ ���� �ȵ�
select sal(ename = 'KING') - sal(ename = 'JONES')
from emp;

select @a - @b
from emp
where a = (select sal from emp where ename = 'KING'),
b = (select sal from emp where ename = 'JONES');


-- a�� 20 b�� 10�� �Ҵ��ϰ� a-b�� ��� �Ͻÿ�?????
-- �ȵǴ°� ������ ������ �����ͼ� ����ϴ°Ŷ� �ȵ�
select 20 - 10 from dual;


select c
from dual
where a = 20, b= 10, c = a-b;


-- �̷��� ���� self join���� ����� ��
select k.sal - j.sal
from emp k, emp j
where k.ename = 'KING'and j.ename = 'JONES';

-- ���� ������ �̿��ؼ� ���?

select sal from emp where ename= 'KING';
select sal from emp where ename= 'JONES';

select sal
from emp
where sal = (select sal from emp where ename = 'KING') - (select sal from emp where ename = 'JONES');

select ename, sal
from emp;




/*-- (����� �Ŵ����� ����)�� ��հ� (������ǰ� ����)�� ������ ����� ���� ���Ͻÿ�
�� ���� ���� ������ ����� �Ѵ�.
select avg(sal???) -avg(sal???)
from emp;
*/
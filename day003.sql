-- DDL: CREATE table - ���ο� ���̺��� �����ϴ� SQL ��ɾ�
create table emp01(
    empno number(4),
    ename varchar2(20),
    sal number(7, 2)
    );

-- ���̺� ���� Ȯ��: desc�� �ڿ� ;�� ������ �ʴ´�
desc emp01

-- ���ο� ���̺��� ������ �� ������ ���̺�� ������ ������ �̷���� ���̺� ������
-- ������ ������ �Բ� �����ؼ� ���ο� ���̺��� �����ȴ�.

create table emp02 as select * from emp;

select * from emp02;

-- ���� ���̺��� �Ϻ� �ʵ带 �����ؼ� ���ο� ���̺� ����
create table emp03 as select empno, ename from emp;
select * from emp03;

-- ���� ���̺��� ������ �̿��Ͽ� ���ο� ���̺� ����
-- where��: ������, �־��� ������ ���� �͸�
-- 1=0�� ���������̱⿡ ������ �������� �ʰ� ������ �������� �ȴ�.
create table emp05 as select * from emp where 1=0;
desc emp05;
select * from emp05;

-- �μ���ȣ�� 10���� ������ ������ Ȯ��
select * from emp where deptno = 10;

-- ���ǿ� �����ϴ� �ڷḸ �����ؼ� ���̺� ����
-- �μ� ��ȣ�� 10���� �����鿡 ���� ����
create table emp04 as select * from emp where deptno = 10;
select * from emp04;

-- DDL: alter table - ���̺� ������ �����ϴ� SQL ��ɾ�
-- �÷��� �߰�, ����, ������ ���.
-- alter table ~ add: ���� ���̺� ���ο� �÷��� �߰��ϴ� ��ɾ�
desc emp01
alter table emp01 add(job varchar2(9));


-- add(), modify()
-- alter modify: ���� ���̺� �÷��� �����ϴ� ��ɾ�
-- ������ �÷��� �ڷᰡ ���� ���: ������ Ÿ�� ���� ����, �÷��� ũ��  ���� ����
-- ������ �÷��� �ڷᰡ �ִ� ���: ������ Ÿ�� ���� �Ұ���,
-- �ڷᰡ �ִ��� char�� varchar2 ������ Ÿ���� ������ ����
select * from emp01;
desc emp01
alter table emp01 modify(job  varchar2(30));

-- alter table ~ drop column: ���̺� �����ϴ� �÷��� �����ϴ� ��ɾ�
alter table emp01 drop column job;
desc emp01


-- DDL - drop table: ���̺��� �����ϴ� ��ɾ�
-- �� �� ���ŵ� ���̺��� ���� �� �� ����.
desc emp01
drop table emp01;

-- ���̺� ������ ������ ����
-- ���Ἲ ���� ���ǿ� �ִ� ���̺��� ������ �� ����.
-- �����ϰ��� �ϴ� ���̺��� �⺻Ű�� ����Ű�� �ٸ� ���̺��� �����ϰ� �������
-- ������ �� ����.

-- DDL - rename: ���̺���� �����ϴ� ��ɾ�
-- ������ ����ϴ� ���̺��� �̸��� ������ �� ���
select * from emp05;
rename emp05 to test;
select * from test;


-- DML: ���۾�, ���� �Ϲ� �����ڿ� ���ؼ� ���Ǵ� ��ɾ� ����
-- ���ڵ� ������ ������ �Ѵ�.
-- DML - select ~ from ~ where
-- DML - select: ���̺��� ������ Ȯ��, ������ �����ϴ� ���ڵ带 ����
-- DML - select: ���̺��� ����(���ڵ�)�� Ȯ��, ���ǿ� �����ϴ� ���ڵ带 ����
select *    -- *: all�� �ǹ�
from emp;

-- ���ǽ�: �� �Ǵ� �������� ������ �Ǵ� ��
-- �� �Ǵ� ����: �����(�񱳽�, ��Ұ����), ����
-- �����: =(����), <>(�����ʴ�), !=(�����ʴ�), >, >=, <, <=
-- ����: and(������, ����, ��� ���� �� ��), or(������, ����, ����� �ϳ��� ���̸� ��)
-- not(������, ������, ���̸� ��������, �����̸� ������)
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
-- ���ο� ���ڵ带 �߰��� �� ����ϴ� SQL ��ɾ�
create table dept01 as select * from dept where 1=0;
desc dept01

-- dept01 �ڿ� �÷��� �������� ������ ��δ� �־�ߵ�
insert into dept01 values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

-- ������ ���൵ ������ ��� ����Ű���� �˷���ߵ�
insert into dept01(deptno, dname) values(20, 'RESEARCH');

insert into dept01(deptno, dname,loc)
values(30, 'SALES', 'CHICAGO');

    h_no number primary key,        -- �⺻Ű(��ü���Ἲ): ��, �ߺ��ŵ� �ȵ�
    h_name varchar2(10) not null,
    score number null               -- ���⼱ null�� ���� �Ⱦ��� �� �ȴٴ� �ǹ̰� ����
);

insert into sample(h_no, h_name, score) values(1234, 'aaa', 88);
insert into sample(h_no, h_name, score) values(1234, 'bbb', 99);    --h_no�� primary key�� �ߺ��Ǹ� �ȵż�
insert into sample(h_no, h_name, score) values(2345, 'bbb', 89);
insert into sample(h_no, h_name, score) values(3456, 'ccc', 97);

select * from sample;

insert into sample(h_no, score) values(7777, 100); -- ���Ἲ ���� ���ǿ� ��߳�(h_name�� not null�̶�)
insert into sample(h_no, h_name, score) values(7777, 'ddd', 100);



-- DML: update ~ set
-- ���̺� ����� ���ڵ带 �����ϴ� SQL ��ɾ�
-- where ���� ������� ���� ��� ��� ���ڵ��� ���� ����ȴ�.
create table emp01 as select * from emp;

-- ��� ����� �μ���ȣ�� 30������ ����
update emp01 set deptno = 30;
select * from emp01;

-- ����� �޿��� 10% �λ��ϴ� �������� ����Ͻÿ�

update emp01 set sal = sal * 1.1;

-- ��� ������ �Ի����� ���÷� �����Ͻÿ�

update emp01  set hiredate = sysdate;


-- ���̺� ����
drop table emp01;

create table emp01 as select * from emp;

-- �μ� ��ȣ�� 10���� ������ �μ� ��ȣ�� 40���� �����ϴ� ������
update emp01 set deptno = 40 where deptno = 10;

-- Q. job�� MANAGER�� ������ �޿��� 10% �λ��ϴ� �������� ����Ͻÿ�.
update emp01 set sal = sal * 1.1 where job = 'MANAGER';

-- Q. 1981�⵵�� �Ի��� ������ �Խ����� ���÷� �����ϴ� �������� ����Ͻÿ�
update emp01 set hiredate = sysdate where to_char(hiredate) like '81%';
update emp01 set hiredate = '20/10/10' where substr(hiredate, 1, 2) = '22';
update emp01 set hiredate = '20/12/10' where ename = 'KING';
update emp01 set hiredate = '19/11/25' where to_char(hiredate) like '___10___';

select * from emp01;

-- SCOTT ����� �μ� ��ȣ�� 20, job�� MANAGER�� �����ϴ� ������
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SCOTT';

-- SCOTT ����� �Ի� ��¥�� ���÷�, �޿��� 50����, Ŀ�̼��� 4000���� �����ϴ� ������
update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SCOTT';

-- �μ���ȣ�� 20���� �μ��� �������� �μ���ȣ�� 40���� �μ��� ���������� ����
drop table dept01;
create table dept01 as select * from dept;

select loc from dept01 where deptno = 40;
update dept01 set loc = (select loc from dept01 where deptno = 40) where deptno = 20; 
select * from dept01;



-- DML: delete ~ from ~ where
-- ���̺� ����� ���ڵ带 �����ϴ� ��ɹ�
-- Ư�� ���� ������ ��� where �������� ��´�.
-- where�� �Ⱦ��� ��� ���ڵ尡 �����ȴ�.
select * from dept01;
delete from dept01;

-- �μ���ȣ�� 30���� ���ڵ带 �����ϴ� ������
delete from dept01 where deptno = 30;

drop table emp01;
create table emp01 as select * from emp;;
drop table dept01;
create table dept01 as select * from dept;

-- ������̺� �μ����� 'SALES'�� �μ��� �ٹ��ϴ� ��� ������� �����ϴ� ������
select * from emp01; ��� ������ ��� �ִ� ��� ���̺�
select * from dept01; �μ� ������ Ž�� �ִ� �μ� ���̺�
select deptno from dept01 where dname= 'SALES';
delete from emp01 where deptno = (select deptno FROM dept01 WHERE dname= 'SALES');



-- DCL - ���Ἲ, �������, ����, Ʈ�����ó��
-- commit: ���� ������ �����ͺ��̽��� ���� ����
-- rollback: �ǵ����� �۾�
-- �ڵ� commit �Ǵ� ���: DDL, DCL ��ɹ��� ����Ǵ� ���, ���� ����
-- �ڵ� rollback �Ǵ� ���: ������ ����, ���� Ȥ�� ��ǻ�� �ٿ�

drop table dept01;
create table dept01 as select * from dept;

delete from dept01;
select  * from dept01;
rollback;

delete from dept01 where deptno = 20;
commit;
-- Ŀ���ϸ� �ѹ��ص� �Ȼ�Ƴ�


-- ���Ἲ ���� ����: ��ȿ�� �˻� ��Ģ
-- ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���� ���̺��� ������ �� ����ϴ� ��Ģ
-- ���Ἲ: ��Ȯ���� �����ؾ� �Ѵ�
-- ���� ����: �ٶ��� ���� ���� �������� ������ ���� �ϴ°�
select * from emp;
desc emp;
select * from dept;
desc dept;

-- primary key(�⺻Ű): �ݵ�� �Է�, ������ ���� ������ �Ѵ�.
drop table dept01;
create table dept01 as select * from dept;

select * from dept01;
insert into dept01 values(10, 'TEST', 'BUSAN');  -- ���� ���ԵǸ� �ȵ�(�μ� ��ȣ�� �ߺ��Ǵϱ�)

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

-- �⺻Ű�� �ܷ�Ű ����
drop table emp06;
create table emp06(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2) references dept02(deptno) -- �μ� ��ȣ�� 10,20,30,40�� ����ϰڴ�.
);

insert into emp06 values(1111, 'aaa', 'a', 10);
select * from emp06;
insert into emp06 values(2222, 'aaa', 'a', 20);
insert into emp06 values(3333, 'aaa', 'a', 50); -- �θ� ������ dept02�� 50�� ��� ����
insert into emp06 values(3333, 'bbb', 'b', 30);
update emp06 set ename = 'bbb', job = 'b' where empno = 2222;








-- ������ ������� ���̺� �⺻Ű �ֱ�
drop table emp10;                        -- emp10 ���̺� ����
create table emp10 as select * from emp; -- emp10 ���̺� ����

select *
from user_cons_columns
where table_name = 'emp10';
-- ??

select *
from user_constraints 
where table_name = 'emp10';
-- ?

desc emp10;
-- emp10 ���̺� ���� Ȯ��
alter table emp10
modify(empno primary key);
-- empno�� ����Ű �ο�

alter table emp10
modify(empno null);                      -- empno�� null �ᵵ �ǰ�

alter table emp10
modify(empno not null);                  -- empno�� null ������

alter table emp10
modify(ename not null);                  -- ename�� null ������

alter table emp10
modify(ename null);                      -- ename�� null �ᵵ �ǰ�



-- (����� �Ŵ����� ����)�� ��հ� (������ǰ� ����)�� ������ ����� ���� ���Ͻÿ�

select avg(sal)
from emp
where job in('PRESIDENT', 'MANAGER');

select avg(sal)
from emp
where job in('SALESMAN', 'CLERK');

select avg(p.sal) - avg(s.sal) as "�̰� ���� ��� �ϸ� ��� �� �� ����"
from emp p, emp s
where p.job in('PRESIDENT', 'MANAGER') and s.job in('SALESMAN', 'CLERK');

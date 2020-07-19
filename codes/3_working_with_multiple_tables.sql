use sql_cook_book;

\! echo "###############--3.1Stacking One Rowset Atop Another##########################"

/*Problem
You want to return data stored in more than one table, conceptually stacking one
result set atop the other. The tables do not necessarily have a common key, but their
columns do have the same data types. For example, you want to display the name
and department number of the employees in department 10 in table EMP, along with
the name and department number of each department in table DEPT. You want the
result set to look like the following:*/


select ename,deptno from emp union all select "----------",'----------' t1 union all select dname,deptno from dept;



\! echo "###############--3.2Combining Related Rows##########################"

/*
Problem
You want to return rows from multiple tables by joining on a known common col-
umn or joining on columns that share common values. For example, you want to
display the names of all employees in department 10 along with the location of each
employee’s department, but that data is stored in two separate tables. You want the
result set to be the following:
*/

select EMPNO ENAME , JOB , MGR , HIREDATE , SAL , COMM , d.DEPTNO , DNAME , LOC from emp e, dept d where e.deptno = d.deptno;


\! echo "###############--3.3Finding Rows in Common Between Two Tables#########"

/*
Problem
-----------
You want to find common rows between two tables but there are multiple columns
on which you can join. For example, consider the following view V:

create View V as select ename,job,sal from emp where job = 'clerk';
select * V;

Only clerks are returned from view V. However, the view does not show all possible
EMP columns. You want to return the EMPNO, ENAME, JOB, SAL, and DEPTNO
of all employees in EMP that match the rows from view V. 

*/

create View V as select ename,job,sal from emp where job = 'clerk';
select * V;

select e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno 
from emp e , V 
where e.ename = V.ename and e.job = V.job and e.sal = V.sal;

#or

select e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno 
from emp e join  V 
on(e.ename = V.ename and e.job = V.job and e.sal = V.sal);


\! echo "###############--3.4 Retrieving Values from One Table That Do Not Exist in Another#########"

/*

Problem
You wish to find those values in one table, call it the source table, that do not also
exist in some target table. For example, you want to find which departments (if any)
in table DEPT do not exist in table EMP. In the example data, DEPTNO 40 from
table DEPT does not exist in table EMP,

*/

select deptno from dept d where d.deptno not in (select deptno from emp);












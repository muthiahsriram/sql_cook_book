use sql_cook_book;

\! echo "###############--Retrieving All Rows and Columns from a Table##########################"
select * from emp;


\! echo "###############--Retrieving a Subset of Rows from a Table##############################"
select * from emp where deptno = 10;

\! echo "###############--Finding Rows That Satisfy Multiple Conditions#########################"
select * from emp where deptno = 10 or comm is not null or sal <= 2000 and deptno = 20;

#--Retrieving a Subset of Columns from a Table


\! echo "###############-- assigning meaning ful names##########################################"
select empno,ename from emp where sal > 1000;



\! echo "###############--1.6 referencing an Aliased Column in the WHERE########################"
select ename as employee_name, sal as salary from emp where sal > 500;

select * from (select sal as salary,ename as emp_name from emp) d where salary > 2450;

#--1.7 Concatenating Column Values

select concat(ename ,' works as a ',job) as sentence from emp;


\! echo "###############--1.8 Using Conditional Logic in a SELECT Statement#####################"
select ename, sal, 
	case	when sal > 4000 then 'overpaid' 
		when sal < 1000 then 'underpaid' 
		else 'ok' 
	end as status 
from emp;


\! echo "###############--1.9Limiting the Number of Rows Returned################################"
select * from emp limit 10;

\! echo "###############--1.10 Returning n Random Records from a Table###########################"
select * from emp order by rand() limit 5;

\! echo "##############--1.11 Finding Null Values################################################"
select * from emp where comm is null;

\! echo "###############--1.13 Searching for Patterns############################################"
select * from emp where deptno in (10,20) and (ename like "%I%" or job like "%ER");





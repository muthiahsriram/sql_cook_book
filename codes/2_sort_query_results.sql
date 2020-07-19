use sql_cook_book;

\! echo "###############--2.1 Returning Query Results in a Specified Order##########################"

select * from emp order by sal asc;

\! echo "###############--2.2 Sorting by Multiple Fields##########################"
select * from emp order by deptno asc , sal desc;


\! echo "###############--2.3 Sorting by Substrings##########################"

#--Problem
#--You want to sort the results of a query by specific parts of a string. For example, you
#--want to return employee names and jobs from table EMP and sort by the last two
#--characters in the job field

select * from emp order by substr(job, length(job)-1);


\! echo "###############--2.5 Dealing with Nulls When Sorting##########################"

#--Problem
#--You want to sort results from EMP by COMM, but the field is nullable. You need a
#--way to specify whether nulls sort last:
#--/* NON-NULL COMM SORTED DESCENDING, ALL NULLS FIRST */

select ename,job,sal,comm
from   (select ename,job,sal,comm, case when comm is null then 1
	else 0 end as is_null_flag from emp) a 
order by is_null_flag desc,comm desc;

#--/* NON-NULL COMM SORTED ascending ALL NULLS FIRST */

select ename,job,sal,comm
from   (select ename,job,sal,comm, case when comm is null then 1
	else 0 end as is_null_flag from emp) a 
order by is_null_flag desc,comm asc;

#--/* NON-NULL COMM SORTED ascending ALL NULLS last */

select ename,job,sal,comm
from   (select ename,job,sal,comm, case when comm is null then 1
	else 0 end as is_null_flag from emp) a 
order by is_null_flag asc,comm asc;


#(or)


#--nulls first and ascending order of non null values
select * from emp order by case when comm is null then 0 else 1 end asc,comm asc; 

#--nulls last and ascending order of non null values
select * from emp order by case when comm is null then 0 else 1 end desc,comm asc; 

#--nulls first and desccending order of non null values
select * from emp order by case when comm is null then 0 else 1 end asc,comm desc; 

#--nulls last and desccending order of non null values
select * from emp order by case when comm is null then 0 else 1 end desc,comm desc; 

\! echo "###############--2.6Sorting on a Data Dependent Key##########################"


#--Problem
#--You want to sort based on some conditional logic. For example: if JOB is “SALES-
#--MAN” you want to sort on COMM; otherwise, you want to sort by SAL. You want
#--to return the following result set:

select * from 
		(select empno,ename,job,mgr,hiredate,sal,comm,deptno,case when job= "salesman" then comm else sal end as check_order from emp) a2 
	order by check_order desc;
	
	
#or

select * from emp order by case when job= "salesman" then comm else sal end; 



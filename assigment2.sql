
create database FIS2
create table dept(  
  deptno numeric(4) primary key,  
  dname varchar(15),  
  loc varchar(15),   
)


create table emp(  
  empno    numeric(4) primary key,  
  ename    varchar(10),  
  job      varchar(10),  
  mgr      numeric(4),  
  hiredate date,  
  sal      numeric(10),  
  comm     numeric(10),  
  deptno   numeric(4),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
)

select * from dept

insert into dept(DEPTNO,DNAME,LOC) values 
(10,'ACCOUNTING','NEW YORK'), 
(20,'RESEARCH','DALLAS'), 
(30,'SALES','CHICAGO'), 
(40,'OPERATIONS','BOSTON') 

select * from emp


insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values( 
7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30),
(7521,' WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),
(7566,'JONES','MANAGER',7839,'02-APR-81',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30),
(7698,'BLAKE','MANAGER',7839, '01-MAY-81' ,2850 ,NULL,30),
(7782,'CLARK','MANAGER', 7839, '09-JUN-81 ',2450,NULL,10),
(7788,'SCOTT','ANALYST', 7566 ,'19-APR-87',3000,NULL,20),
(7839,'KING','PRESIDENT',NULL, '17-NOV-81', 5000,NULL, 10),
(7844,'TURNER','SALESMAN', 7698,' 08-SEP-81' ,1500, 0, 30),
(7876,'ADAMS','CLERK', 7788, '23-MAY-87 ',1100,NULL,20),
(7900,'JAMES','CLERK', 7698, '03-DEC-81', 950 ,NULL,30),
(7902,'FORD','ANALYST', 7566,' 03-DEC-81 ',3000,NULL,20),
(7934,'MILLER','CLERK', 7782,'23-JAN-82' ,1300,NULL,10)


--List all employees whose name begins with 'A'.

Select * from emp where ename like 'A%'

 --Select all those employees who don't have a manager. 
select * from emp where mgr is NULL

--List employee name, number and salary for those employees who earn in the range 1200 to 1400.

Select ename,empno,sal from emp where sal between 1200 and 1400
 
 /*Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing 
 all their details before and after the rise.*/


 select empno,ename,dname,sal as old_S,sal+(sal*10/100) as New_S from dept,emp
 where dept.dname='research' and dept.deptno=emp.deptno

 -- Find the number of CLERKS employed. Give it a descriptive heading.

 select count(job) as no_of_Clerks from emp where job='clerk'

 --Find the average salary for each job type and the number of people employed in each job. 

 select job,avg(sal) as average_sal from emp group by job 

 --List the employees with the lowest and highest salary.

 select * from emp where sal=(select max(sal) from emp) or sal=(select min(sal) from emp)

-- List full details of departments that don't have any employees. 

select distinct dname from dept,emp where dept.deptno not in(select emp.deptno from emp) 

/*Get the names and salaries of all the analysts earning more than 1200 who are based in department 20.
Sort the answer by ascending order of name.*/

select emp.deptno,ename,sal from emp,dept where dept.deptno=emp.deptno and dept.deptno=20 and
job='analyst' order by ename

/*For each department, list its name and number together with the total salary paid to employees
in that department. */

select dname,sum(sal) as Total_Salary from dept,emp where dept.deptno=emp.deptno group by dname

 --Find out salary of both MILLER and SMITH.

 Select ename,sal from emp where ename in ('miller','smith')

 --Find out the names of the employees whose name begin with ‘A’ or ‘M’. 

 select ename from emp where ename like '[AM]%'

 --Compute yearly salary of SMITH.
Select ename,sal*12 as yearly_sal from emp where ename='smith'

  --List the name and salary for all employees whose salary is not in the range of 1500 and 2850.

Select ename,sal from emp where sal between 1500 and 2850

--display list of managers who have more than 2 employees reporting to them

Select Mgr,COUNT(Empno)as no_Of_emp from emp GROUP BY Mgr having count(*)>2
 


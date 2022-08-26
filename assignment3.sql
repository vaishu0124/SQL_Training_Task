select * from emp
select * from dept

--Retrieve a list of MANAGERS. 
 select distinct mgr from emp

 --Find out the names and salaries of all employees earning more than 1000 per month. 
 select ename,sal from emp where sal>1000
-- Display the names and salaries of all employees except JAMES. 
select ename,sal from emp where ename!='James'

--Find out the details of employees whose names begin with ‘S’.'
 select * from emp where ename like 'S%'

--Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from emp where ename like '%A%'

--Find out the names of all employees that have ‘L’ as their third character in their name. 
select ename from emp where ename like '__L%'

--Compute daily salary of JONES. 
select ename,sal/30 as daily_wage from emp where ename='jones'

--Calculate the total monthly salary of all employees. 
select sum(sal)as total_sal_emp from emp

--Print the average annual salary . 
select avg(distinct sal)as avg_sal from emp

--Select the name, job, salary, department number of all employees except SALESMAN from department number 30.
select ename,job,sal from dept,emp where dept.deptno=emp.deptno and dept.deptno!=30 and job!='salesman' 

--List unique departments of the EMP table. 
select distinct deptno from emp

--List the name and salary of employees who earn more than 1500 and are in department 10 or 30.
--Label the columns Employee and Monthly Salary respectively.
select ename as employee, sal as Monthly_salary from emp where sal>1500 and deptno=10 or deptno=30

--Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and 
--their salary is not equal to 1000, 3000, or 5000. 
select ename,job,sal from emp where job='manager' or job='analyst' and sal!=1000 or sal!=3000 or sal!=5000

--Display the name, salary and commission for all employees whose commission amount
--is greater than their salary increased by 10%.
select ename,sal,comm from emp where (sal*10/1000)>comm

--Display the name of all employees who have two Ls in their name and are in department 30 or 
--their manager is 7782. 
select ename from emp where mgr=7782 or deptno=30 and ename like '%l%l%'


--Display the names of employees with experience of over 10 years and under 20 yrs.
--Count the total number of employees. 
select ename,datediff(year,hiredate,getdate())as experience from emp where datediff(year,hiredate,getdate()) between 10 and 20 

--Retrieve the names of departments in ascending order and their employees in descending order. 
select dname,ename from dept,emp where emp.deptno=dept.deptno order by dname,ename desc 

--Find out experience of MILLER. 
select ename,datediff(year,hiredate,getdate())as expereince   from emp where ename='miller'
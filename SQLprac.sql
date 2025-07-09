 
CREATE TABLE DEPT (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT(DEPTNO)
);

CREATE TABLE SALGRADE (
    GRADE NUMBER(1) PRIMARY KEY,
    LOSAL NUMBER(7,2),
    HISAL NUMBER(7,2)
);

-- Sample Data
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, '17-DEC-1980', 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '20-FEB-1981', 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, '22-FEB-1981', 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, '02-APR-1981', 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-1981', 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, '01-MAY-1981', 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, '09-JUN-1981', 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, '19-APR-1987', 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, '17-NOV-1981', 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, '08-SEP-1981', 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, '23-MAY-1987', 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, '03-DEC-1981', 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, '03-DEC-1981', 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, '23-JAN-1982', 1300, NULL, 10);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

-- =====================================================
-- 100 INTERVIEW QUESTIONS (QUESTIONS ONLY)
-- =====================================================

-- BASIC SELECT QUERIES (1-20)
-- 1. Display all employees

select * from emp;

-- 2. Display all departments\

select * from dept;

-- 3. Display all salary grades

select * from salgrade ;

-- 4. Display employee name and salary

select ename,sal from emp;

-- 5. Display employee name, job, and department number

select ename,job,deptno from emp;

-- 6. Display unique job titles

select DISTINCT job from emp;

-- 7. Display unique department numbers

SELECT DISTINCT deptno from dept;

-- 8. Display employee name and salary in ascending order of salary

SELECT ename,sal from emp order by sal asc;

-- 9. Display employee name and salary in descending order of salary

SELECT ename,sal from emp order by sal desc;

-- 10. Display employee name and hiredate in ascending order of hiredate

SELECT ename,hiredate from emp order by hiredate;

-- 11. Display employee name and job, ordered by job first, then by name

SELECT ename,job from emp order by job,ename;

-- 12. Display employee name and salary where salary is greater than 2000;

SELECT ename,sal from emp WHERE sal>2000;

-- 13. Display employee name and job where job is 'MANAGER'

SELECT ename,job from emp WHERE job = 'MANAGER';

-- 14. Display employee name and department where department is 20

SELECT ename,deptno from emp WHERE deptno = 20;

-- 15. Display employee name and salary where salary is between 1000 and 3000

SELECT ename,sal from emp WHERE sal BETWEEN 1000 and 3000;

-- 16. Display employee name and job where job is either 'CLERK' or 'SALESMAN'

SELECT ename,job from emp WHERE job='CLERK' or job='SALESMAN';

-- 17. Display employee name where name starts with 'S'

SELECT ename FROM emp WHERE ename LIKE 'S%';

-- 18. Display employee name where name ends with 'N'

SELECT ename FROM emp WHERE ename LIKE '%N';

-- 19. Display employee name where name contains 'A'

SELECT ename FROM emp WHERE ename LIKE '%A%';

-- 20. Display employee name and commission where commission is NULL

SELECT ename,comm FROM emp WHERE comm ISNULL;

-- JOINS (21-40)
-- 21. Display employee name and department name

SELECT emp.ename,dept.dname FROM emp join dept where emp.DEPTNO=dept.DEPTNO;

-- 22. Display employee name, job, and department name
 
 SELECT emp.ename,dept.dname,emp.job FROM emp join dept where emp.DEPTNO=dept.DEPTNO;

-- 23. Display employee name, salary, and department location

SELECT emp.ename,emp.sal,dept.loc FROM emp join dept where emp.DEPTNO=dept.DEPTNO;

-- 24. Display employee name and manager name

SELECT e.ename,m.ename from emp e join emp m on e.mgr = m.EMPNO;

-- 25. Display employee name, job, and manager name

SELECT e.ename,e.job,m.ename from emp e join emp m on e.mgr = m.EMPNO;

-- 26. Display employee name, salary, and salary grade

SELECT emp.ename,emp.sal,SALGRADE.grade from emp join salgrade on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL

-- 27. Display employee name, department name, and salary grade

SELECT emp.ename,dept.dname,SALGRADE.grade from dept join emp on EMP.DEPTNO=DEPT.DEPTNO join salgrade on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL

-- 28. Display all departments and their employees (including departments with no employees)

SELECT emp.ename,dept.dname from dept LEFT join emp on EMP.DEPTNO=DEPT.DEPTNO;

-- 29. Display employee name, manager name, and department name

SELECT e.ename,m.ename,dept.dname from emp e join emp m on e.mgr = m.EMPNO join dept on e.DEPTNO=dept.DEPTNO;

-- 30. Display employee name, salary, and salary grade description

SELECT emp.ename,emp.sal,SALGRADE.GRADE,SALGRADE.LOSAL,SALGRADE.HISAL from emp join SALGRADE on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL;

-- 31. Display employee name and department name for employees in 'NEW YORK'

SELECT emp.ename,dept.dname from dept join emp on emp.DEPTNO = dept.DEPTNO WHERE dept.LOC='NEW YORK' ;

-- 32. Display employee name and manager name for employees who have managers

SELECT e.ename,m.ename from emp e join emp m on e.mgr = m.EMPNO;

-- 33. Display employee name, job, and department name for 'SALESMAN'

SELECT emp.ename,emp.job,dept.DNAME from dept join emp on emp.DEPTNO = dept.DEPTNO WHERE dept.DNAME='SALES';

-- 34. Display employee name, salary, and salary grade for grade 4 employees

SELECT emp.ename,emp.sal,SALGRADE.GRADE from emp join SALGRADE on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL where GRADE=4;

-- 35. Display employee name, department name, and location for 'RESEARCH' department

SELECT emp.ename,dept.dname,dept.LOC from emp join dept on emp.DEPTNO=dept.DEPTNO where dept.DNAME='RESEARCH';

-- 36. Display employee name, manager name, and department name for employees with salary > 2500

SELECT e.ename,m.ename,dept.dname from emp e join emp m on e.mgr = m.EMPNO join dept on e.DEPTNO=dept.DEPTNO where e.sal > 2500;

-- 37. Display employee name, job, and department name for employees hired in 1981

select emp.ename,dept.dname,emp.JOB from emp join dept on emp.DEPTNO=dept.DEPTNO where emp.HIREDATE like '%1981';

-- 38. Display employee name, salary, and salary grade for employees with commission

SELECT emp.ename,emp.sal,salgrade.grade from emp join salgrade on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL where comm is not NULL;

-- 39. Display employee name, department name, and salary for employees in 'CHICAGO'

SELECT emp.ename,emp.sal,dept.dname from emp join dept on emp.DEPTNO=dept.DEPTNO where dept.loc ='CHICAGO';

-- 40. Display employee name, manager name, and job for employees who are managers

select e.ename,m.ename,e.job from emp e join emp m on e.mgr=m.EMPNO WHERE e.empno IN (SELECT DISTINCT mgr FROM emp WHERE mgr IS NOT NULL);

-- AGGREGATE FUNCTIONS (41-60)
-- 41. Count total number of employees

select count(*) from emp;

-- 42. Count employees in each department

select count(*) from emp group by deptno;

-- 43. Count employees in each job

select count(*) from emp group by job;

-- 44. Calculate average salary

select avg(sal) as average from emp ;

-- 45. Calculate average salary by department

select deptno, avg(sal) as average from emp group by deptno ;

-- 46. Calculate average salary by job

select job, avg(sal) as average from emp group by job ;

-- 47. Find maximum salary

SELECT max(sal) as maxsalary from emp;

-- 48. Find minimum salary

SELECT min(sal) as minsalary from emp;

-- 49. Find maximum salary by department

SELECT deptno,max(sal)as maxsalary  from emp group by deptno;

-- 50. Find minimum salary by job

SELECT job,min(sal)as minsalary  from emp;

-- 51. Calculate total salary by department

SELECT sum(sal) from emp group by deptno;

-- 52. Calculate total commission by department

SELECT deptno,sum(comm) from emp where comm is not NULL group by deptno;

-- 53. Count employees by salary grade

SELECT SALGRADE.grade,count(emp.EMPNO) from emp join salgrade on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL group by SALGRADE.GRADE; 

-- 54. Calculate average salary by salary grade

SELECT SALGRADE.grade,avg(sal) from emp join salgrade on emp.sal BETWEEN SALGRADE.LOSAL and SALGRADE.HISAL group by SALGRADE.GRADE; 

-- 55. Count employees by department and job

SELECT deptno,job,count(emp.empno) from emp group by deptno,job; 

-- 56. Calculate total salary by department and job

SELECT deptno,job,sum(sal) from emp group by deptno,job; 

-- 57. Count employees hired each year

SELECT EXTRACT(YEAR FROM hiredate) AS year, COUNT(*) AS num_employees FROM emp GROUP BY EXTRACT(YEAR FROM hiredate) ORDER BY year;

-- 58. Calculate average salary for employees with commission

select avg(sal) from emp where comm is NOT NULL;

-- 59. Calculate average salary for employees without commission

select avg(sal) from emp where comm is NULL;

-- 60. Count employees by manager

select mgr,count(empno) from emp group by mgr;

-- SUBQUERIES (61-80)
-- 61. Find employees with salary greater than average salary

select ename,sal from emp where sal > (select avg(sal) from emp)

-- 62. Find employees with salary equal to maximum salary

select ename,sal from emp where sal = (select max(sal) from emp);

-- 63. Find employees with salary equal to minimum salary

select ename,sal from emp where sal = (select min(sal) from emp);

-- 64. Find employees who earn more than their manager

SELECT e.ename,m.ename from emp e join emp m on e.mgr=m.EMPNO where e.sal>m.sal;

-- 65. Find employees in the same department as 'SCOTT'

SELECT ename from emp where deptno = (SELECT deptno from emp where ename='SCOTT');

-- 66. Find employees with the same job as 'FORD'

SELECT ename from emp where job= (SELECT JOB from emp WHERE ename='FORD');

-- 67. Find employees hired after 'SCOTT'

SELECT ename FROM emp WHERE hiredate> (SELECT hiredate FROM emp WHERE ename = 'SCOTT');

-- 68. Find employees with salary greater than any employee in department 30

SELECT ename from emp where sal > (select min(sal) from emp where deptno=30);

-- 69. Find employees with salary greater than all employees in department 30

SELECT ename from emp where sal > (select max(sal) from emp where deptno=30) and deptno != 30;

-- 70. Find departments with more employees than department 10

SELECT deptno, COUNT(*) AS emp_count FROM emp GROUP BY deptno HAVING COUNT(*) > (SELECT COUNT(*) FROM emp WHERE deptno = 10);

-- 71. Find employees who have the same salary as someone else

select ename from emp where sal in (select sal from emp group by sal having count(*) > 1);

-- 72. Find employees who don't have any subordinates

SELECT empno,ename from emp where empno NOT IN (SELECT DISTINCT mgr from emp where mgr is not NULL) ;

-- 73. Find employees who have subordinates

SELECT empno,ename from emp where empno  IN (SELECT DISTINCT mgr from emp where mgr is not NULL) ;

-- 74. Find the second highest salary

select * from emp order by sal desc LIMIT 1 OFFSET 1;

-- 75. Find the third highest salary

select * from emp order by sal desc LIMIT 1 OFFSET 2;

-- 76. Find employees with salary in top 3

select * from emp order by sal desc LIMIT 3;

-- 77. Find employees who earn more than the average salary in their department

SELECT ename FROM emp e WHERE sal > ( SELECT AVG(sal) FROM emp WHERE deptno = e.deptno);

-- 78. Find employees who earn more than the average salary in their job

SELECT ename FROM emp e WHERE sal > ( SELECT AVG(sal) FROM emp WHERE job = e.job);

-- 79. Find departments where all employees earn more than 1000

SELECT deptno FROM emp group by deptno having min(sal)>1000;

-- 80. Find jobs where all employees earn less than 3000

SELECT job FROM emp group by deptno having max(sal)>3000;

-- ADVANCED QUERIES (81-100)
-- 81. Find the employee with the highest salary in each department



-- 82. Find the employee with the lowest salary in each job

-- 83. Find employees who earn more than the average salary of their department and job combined

-- 84. Find the department with the highest average salary

-- 85. Find the job with the highest average salary

-- 86. Find employees who have been with the company the longest in their department

-- 87. Find employees who have been with the company the shortest in their job

-- 88. Find the salary grade with the most employees

-- 89. Find employees who earn more than the average salary of their salary grade

-- 90. Find the department with the highest total commission

-- 91. Find employees who have the same salary as their manager

-- 92. Find employees who earn more than their manager's manager

-- 93. Find the employee with the highest salary increase (difference between current and minimum salary in their job)

-- 94. Find employees who earn more than the average salary of employees hired in the same year

-- 95. Find the department with the highest salary range (max - min)

-- 96. Find employees who have the same job as their manager

-- 97. Find the employee with the highest commission percentage (commission/salary)

-- 98. Find employees who earn more than the average salary of employees in their department and have the same job as their manager

-- 99. Find the salary grade with the highest average salary

-- 100. Find employees who earn more than the average salary of all employees and work in a department with more than 3 employees

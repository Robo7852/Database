CREATE DATABASE EMPDEPT;

USE EMPDEPT;

/*
DEPARTMENT Schema
Dno Integer No PRI NULL
Dname Varchar(50) Yes NULL
Location Varchar(50) Yes New Delhi
*/

CREATE TABLE DEPARTMENT(
    DNO INT PRIMARY KEY NOT NULL,
    DNAME VARCHAR(30) DEFAULT NULL,
    LOCATION VARCHAR(30) DEFAULT "NEW DELHI"
);

DESC DEPARTMENT;

insert into DEPARTMENT values
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON'),
(50, 'PROMOTION', 'LUCKNOW'),
(60, 'ADMINISTRATION', 'NEW DELHI'),
(70, 'MANAGEMENT', 'PUNE'),
(80, 'PRODUCTION', 'MUMBAI'),
(90, 'TRAINING', 'BHOPAL'),
(100, 'TECHNICAL', 'BANGALORE');

/*
EMPLOYEE Schema
Field Type NULL KEY DEFAULT
Eno Char(3) NO PRI NIL
Ename Varchar(50) NO NIL
Job_type Varchar(50) NO NIL
SupervisonENO Char(3) Yes FK NIL

Hire_date Date NO NIL
Dno Integer YES FK NIL
Commission Decimal(10,2) YES NIL
Salary Decimal(7,2) NO NIL
*/

CREATE TABLE EMPLOYEE (
    ENO CHAR(3) PRIMARY KEY NOT NULL,
    ENAME VARCHAR(50) NOT NULL,
    JOB_TYPE VARCHAR(50) NOT NULL,
    SUPERVISIONENO CHAR(3) DEFAULT NULL,
    HIRE_DATE DATE NOT NULL,
    DNO INT DEFAULT NULL,
    COMMISSION DECIMAL(10,2) DEFAULT NULL,
    SALARY DECIMAL(7,2) NOT NULL,
    FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO),
    FOREIGN KEY(SUPERVISIONENO) REFERENCES EMPLOYEE(ENO)
);

DESC EMPLOYEE;

INSERT INTO EMPLOYEE VALUES
( 783, 'KING', 'PRESIDENT', NULL, '1981-11-17', 10  ,0 , 5000 ),
( 769, 'BLAKE', 'MANAGER' , 783, '1981-05-01', 30 ,0 , 2850),
( 778, 'CLARK', 'MANAGER' , 783, '1981-06-09', 10  ,0 , 2450 ),
( 756, 'JONES', 'MANAGER' , 783, '1981-02-04', 20  ,0 , 2975 ),
( 750, 'SCOTT', 'ANALYST' , 756, '1987-07-13', 20  ,0 , 3000 ),
( 790, 'FORD', 'ANALYST'  , 756, '1981-03-12', 20  ,0 , 3000 ),
( 736, 'SMITH', 'CLERK'   , 790, '1980-12-17', 20  ,0 ,  800 ),
( 749, 'ALLEN', 'SALESMAN', 769, '1981-02-20', 30 , 300 ,1600),
( 752, 'WARD', 'SALESMAN' , 769, '1981-02-20', 30, 500 ,1250),
( 765, 'MARTIN', 'SALESMAN', 769, '1981-09-28', 30 ,1250, 1400 ),
( 784, 'TURNER', 'SALESMAN', 769, '1981-08-09', 30  ,0 ,1500 ),
( 787, 'ADAMS', 'CLERK', 778, '1987-07-13', 20  ,0 , 1100 ),
( 79, 'JAMES', 'CLERK', 769, '1981-03-12', 30  ,0 ,  950 ),
( 793, 'MILLER', 'CLERK', 778, '1982-01-23', 10  ,0 , 1300 )
;



-- QUERY 1
/*
Query to display Employee Name, Job, Hire Date, Employee Number; for each employee
with the Employee Number appearing first.
*/

SELECT ENO, ENAME, JOB_TYPE, HIRE_DATE 
FROM EMPLOYEE;


--QUERY 2
/*
Query to display unique Jobs from the Employee Table.
*/

SELECT DISTINCT(JOB_TYPE)
FROM EMPLOYEE;


-- QUERY 3
/*
Query to display the Employee Name concatenated by a Job separated by a comma.
*/

SELECT CONCAT(ENAME,", ",JOB_TYPE)
FROM EMPLOYEE;


-- QUERY 4
/*
Query to display all the data from the Employee Table. Separate each Column by a comma
and name the said column as THE_OUTPUT.
*/

SELECT CONCAT(ENO,", ", ENAME,", ",JOB_TYPE,", ",SUPERVISIONENO,", ",HIRE_DATE,", ",DNO,", ",COMMISSION,", ",SALARY) AS THE_OUTPUT
FROM EMPLOYEE;


-- QUERY 5
/*
Query to display the Employee Name and Salary of all the employees earning more than
$2850.
*/

SELECT ENAME , SALARY 
FROM EMPLOYEE
WHERE (SALARY + COMMISSION) > 2850;


-- QUERY 6
/*
Query to display Employee Name and Department Number for the Employee No= 79.
*/

SELECT ENAME, DNO 
FROM EMPLOYEE 
WHERE ENO = 79;


-- QUERY 7
/*
Query to display Employee Name and Salary for all employees whose salary is not in the
range of $1500 and $2850.
*/

SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1500 AND 2850;


-- QUERY 8
/*
Query to display Employee Name and Department No. of all the employees in Dept 10 and
Dept 30 in the alphabetical order by name.
*/

SELECT ENAME, DNO 
FROM EMPLOYEE
WHERE DNO=10 OR DNO=30
ORDER BY ENAME ASC;


-- QUERY 9
/*
Query to display Name and Hire Date of every Employee who was hired in 1981.
*/

SELECT ENAME, HIRE_DATE
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE)=1981;


-- QUERY 10
/*
Query to display Name and Job of all employees who have not assigned a supervisor.
*/

SELECT ENAME, JOB_TYPE
FROM EMPLOYEE
WHERE SUPERVISIONENO IS NULL;


-- QUERY 11
/*
Query to display the Name, Salary and Commission for all the employees who earn
commission.
*/

SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION > 0;


-- QUERY 12
/*
Sort the data in descending order of Salary and Commission.
*/

SELECT SALARY , COMMISSION
FROM EMPLOYEE
ORDER BY SALARY DESC, COMMISSION DESC;


-- QUERY 13
/*
Query to display Name of all the employees where the third letter of their name is ‘A’.
*/

SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE "__A%";


-- QUERY 14
/*
Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their
name and are either in Dept No = 30 or their Manger’s Employee No = 7788.
*/

SELECT ENAME
FROM EMPLOYEE
WHERE (ENAME LIKE "%R%R%" OR ENAME LIKE "%A%A%") AND (DNO = 30 OR SUPERVISIONENO = 778);


-- QUERY 15
/*
Query to display Name, Salary and Commission for all employees whose Commission
amount is greater than their Salary increased by 5%.
*/

SELECT ENAME, SALARY , COMMISSION
FROM EMPLOYEE
WHERE COMMISSION > (SALARY*(0.05));


-- QUERY 16
/*
Query to display the Current Date along with the day name.
*/

SELECT CURDATE(), DAYNAME(CURDATE());

 
-- QUERY 17
/*
Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after
six months of employment.
*/

SELECT ENAME, HIRE_DATE, DATE_ADD(DATE_ADD(HIRE_DATE, INTERVAL 6 MONTH),
INTERVAL (7-WEEKDAY(DATE_ADD(HIRE_DATE, INTERVAL 6 MONTH))) DAY) AS REVIEW_DATE
FROM EMPLOYEE;


-- QUERY 18
/*
Query to display Name and calculate the number of months between today and the date
on which employee was hired of department ‘Purchase’.
*/

SELECT E.ENAME, TIMESTAMPDIFF(MONTH, E.HIRE_DATE, CURDATE()) AS TOTAL_MONTHS
FROM EMPLOYEE AS E , DEPARTMENT AS D
WHERE E.DNO = D.DNO AND DNAME="RESEARCH";


-- QUERY 19
/*
Query to display the following for each employee <E-Name> earns < Salary> monthly
but wants < 3 * Current Salary >. Label the Column as Dream Salary.
*/

SELECT CONCAT(ENAME," EARNS ",SALARY, " MONTHLY BUT WANTS ", 3*SALARY) AS DREAM_SALARY
FROM EMPLOYEE;


-- QUERY 20
/*
Query to display Name with the 1st letter capitalized and all other letter lower case and
length of their name of all the employees whose name starts with ‘J’, ’A’ and ‘M’.
*/

SELECT CONCAT(UPPER(SUBSTRING(ENAME,1,1)), LOWER(SUBSTRING(ENAME,2))) AS NAME, LENGTH(ENAME) AS LENGTH
FROM EMPLOYEE
WHERE ENAME LIKE "J%" OR ENAME LIKE "A%" OR ENAME LIKE "M%";


-- QUERY 21
/*
Query to display Name, Hire Date and Day of the week on which the employee started.
*/

SELECT ENAME, HIRE_DATE, DAYNAME(HIRE_DATE) AS START_DAY
FROM EMPLOYEE;


-- QUERY 22
/*
Query to display Name, Department Name and Department No for all the employees.
*/

SELECT E.ENAME, D.DNAME, E.DNO 
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.DNO=D.DNO;


-- QUERY 23
/*
Query to display Unique Listing of all Jobs that are in Department number 30.
*/

SELECT DISTINCT JOB_TYPE
FROM EMPLOYEE
WHERE DNO=30;


-- QUERY 24
/*
Query to display Name, Dept Name of all employees who have an ‘A’ in their name.
*/

SELECT E.ENAME , D.DNAME 
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.DNO=D.DNO AND ENAME LIKE "%A%";


-- QUERY 25
/*
Query to display Name, Job, Department No. And Department Name for all the
employees working at the Dallas location.
*/

SELECT E.ENAME, E.JOB_TYPE, E.DNO, D.DNAME 
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.DNO=D.DNO AND D.LOCATION="DALLAS";


-- QUERY 26
/*
Query to display Name and Employee no. Along with their supervisor’s Name and the
supervisor’s employee no; along with the Employees’ Name who do not have a supervisor.
*/

SELECT E.ENO, E.ENAME, S.ENO ,S.ENAME
FROM EMPLOYEE AS E LEFT OUTER JOIN EMPLOYEE AS S
ON E.ENO=S.SUPERVISIONENO;


-- QUERY 27
/*
Query to display Name, Dept No. And Salary of any employee whose department No.
and salary matches both the department no. And the salary of any employee who earns a
commission.
*/

SELECT ENAME, DNO, SALARY
FROM EMPLOYEE
WHERE (DNO,SALARY) IN (SELECT DNO, SALARY FROM EMPLOYEE WHERE COMMISSION > 0);


-- QUERY 28
/*
Query to display Name and Salaries represented by asterisks, where each asterisk (*)
signifies $100.
*/

SELECT ENAME, REPEAT("*" ,SALARY/100) AS SALARY_ASTERISK 
FROM EMPLOYEE;


-- QUERY 29
/*
Query to display the Highest, Lowest, Sum and Average Salaries of all the employees
*/

SELECT MAX(SALARY) AS HIGHEST_SALARY, MIN(SALARY) AS LOWEST_SALARY, SUM(SALARY) AS TOTAL_SALARY, AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEE;


-- QUERY 30
/*
Query to display the number of employees performing the same Job type functions.
*/

SELECT JOB_TYPE , COUNT(*) AS TOTAL_EMPLOYEE 
FROM EMPLOYEE
GROUP BY JOB_TYPE;


-- QUERY 31
/*
Query to display the total number of supervisors without listing their names.*/

SELECT COUNT(DISTINCT SUPERVISIONENO) AS TOTAL_SUPERVISORS 
FROM EMPLOYEE;


-- QUERY 32
/*
Query to display the Department Name, Location Name, No. of Employees and the
average salary for all employees in that department.
*/

SELECT DNAME, LOCATION, COUNT(ENO) AS TOTAL_EMPLOYEE, AVG(SALARY) AS AVERAGE_SALARY 
FROM DEPARTMENT, EMPLOYEE
WHERE EMPLOYEE.DNO=DEPARTMENT.DNO
GROUP BY DNAME;


-- QUERY 33
/*
Query to display Name and Hire Date for all employees in the same dept. as Blake.
*/

SELECT ENAME, HIRE_DATE
FROM EMPLOYEE
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME="BLAKE");


-- QUERY 34
/*
Query to display the Employee No. And Name for all employees who earn more than the
average salary.
*/

SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);


-- QUERY 35
/*
Query to display Employee Number and Name for all employees who work in a
department with any employee whose name contains a ‘T’.
*/

SELECT ENO , ENAME
FROM EMPLOYEE
WHERE DNO IN (SELECT DNO FROM EMPLOYEE WHERE ENAME LIKE "%T%");


-- QUERY 36
/*
Query to display the names and salaries of all employees who report to supervisor named
‘King’
*/

SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SUPERVISIONENO=(SELECT ENO FROM EMPLOYEE WHERE ENAME="KING");


-- QUERY 37
/*
Query to display the department no, name and job for all employees in the Sales
department
*/

SELECT E.DNO, E.ENAME, E.JOB_TYPE
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.DNO=D.DNO AND D.DNAME="SALES";


-- QUERY 38
/*
Display names of employees along with their department name who have more than 20
years experience
*/

SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO=DEPARTMENT.DNO AND TIMESTAMPDIFF(YEAR, HIRE_DATE,CURDATE())>20;


-- QUERY 39
/*
Display total number of departments at each location
*/

SELECT LOCATION, COUNT(DISTINCT DNO) TOTAL_DEPARTMENTS
FROM DEPARTMENT
GROUP BY LOCATION;


-- QUERY 40
/*
Find the department name in which at least 20 employees work in.
*/

SELECT DNAME 
FROM DEPARTMENT AS D, EMPLOYEE AS E
WHERE D.DNO=E.DNO 
GROUP BY E.DNO
HAVING COUNT(*)>=5;


-- QUERY 41
/*
Query to find the employee’ name who is not supervisor and name of supervisor
supervising more than 5 employees.
*/

SELECT ENAME
FROM EMPLOYEE
WHERE ENO NOT IN (SELECT DISTINCT SUPERVISIONENO FROM EMPLOYEE WHERE SUPERVISIONENO IS NOT NULL)
UNION
SELECT E.ENAME
FROM EMPLOYEE E LEFT JOIN EMPLOYEE S
ON E.ENO=S.SUPERVISIONENO
GROUP BY E.ENO
HAVING COUNT(*)>5;



-- QUERY 42
/*
Query to display the job type with maximum and minimum employees
*/

WITH JOB_TYPE_DATA(JOB_TYPE, TOTAL_EMPLOYEES) AS
(SELECT JOB_TYPE, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE
GROUP BY JOB_TYPE)
SELECT JOB_TYPE, TOTAL_EMPLOYEES
FROM JOB_TYPE_DATA
WHERE TOTAL_EMPLOYEES = (SELECT MAX(TOTAL_EMPLOYEES) FROM JOB_TYPE_DATA)
OR TOTAL_EMPLOYEES = (SELECT MIN(TOTAL_EMPLOYEES) FROM JOB_TYPE_DATA);

15,18
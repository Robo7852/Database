create database Emp_Dep;
use Emp_Dep;

create table Department(
    Dno int primary key not null,
    Dname varchar(30) Default Null,
    location varchar(30) Default "New Delhi"
);

Desc Department;

insert into Department values
(10, "Accounting", "New York"),
(20, "Sales", "Dallas"),
(30, "Purchase", "Chicago"),
(40, "Operation", "Boston"),
(50, "Marketing", "New Delhi"),
(60, "Purchase", "Punjab"),
(70, "Operation", "Canada"),
(80, "Purchase", "Mumbai"),
(90, "Accounting", "Tokyo"),
(100, "Sales", "Goa");

SELECT * FROM Department;

create table Employee(
    Eno char(3) primary key not null,
    Ename varchar(50) not null,
    job_type varchar(50) not null,
    SuperVisionENO char(3) Default null,
    Hire_Date date not null,
    Dno int  Default null,
    commission decimal(10,2) Default null,
    salary decimal(7,2) not null,
    Foreign key(Dno) references Department(Dno),
    Foreign key(SuperVisionENO) references Employee(Eno)
);

Desc Employee;

Insert into Employee values
('783', 'King', 'President', NULL, '1981-11-17', 10, 0.00, 2950.00),
('756', 'Jones', 'Manager', '783', '1981-01-10', 20, 0.00, 2350.00),
('769', 'Blake', 'Manager', '783', '1981-07-22', 30, 0.00, 2870.00),
('778', 'Clark', 'Manager', '783', '1981-06-27', 10, 0.00, 2900.00),
('787', 'Adams', 'Clerk', '778', '1983-01-12', 20, 0.00, 1150.00),
('788', 'Scott', 'Analyst', '756', '1982-12-07', 20, 0.00, 2850.00),
('790', 'James', 'Clerk', '769', '1981-11-17', 30, 0.00, 950.00),
('792', 'Ford', 'Analyst', '756', '1981-12-03', 20, 0.00, 2600.00),
('793', 'Miller', 'Clerk', '788', '1982-01-23', 40, 0.00, 1300.00),
('736', 'Smith', 'Clerk', '790', '1981-11-17', 20, 0.00, 1000.00),
('749', 'Allan', 'Sales Man', '769', '1981-02-20', 30, 300.00, 2000.00),
('752', 'Ward', 'Sales Man', '769', '1981-02-22', 30, 500.00, 1300.00),
('784', 'Turner', 'Sales Man', '769', '1981-09-08', 30, 0.00, 1450.00),
('765', 'Martin', 'Sales Man', '784', '1981-04-22', 30, 1400.00, 1250.00),
('740', 'Avinash', 'Sales Man', '769', '2010-02-20', 30, 300.00, 2000.00),
('786', 'Ravish', 'Clerk', '769', '2011-12-20', 30, 300.00, 2000.00),
('79', 'Ram', 'Clerk', '769', '2021-12-20', 30, 300.00, 2500.00);

SELECT * FROM Employee;

-- 1. Query to display Employee Name, Job, Hire Date, Employee Number; for each employee
-- with the Employee Number appearing first.
SELECT Eno, Ename, Job_type, Hire_Date
FROM Employee;

-- 2. Query to display unique Jobs from the Employee Table.
SELECT distinct(Job_type)
FROM Employee;

-- 3. Query to display the Employee Name concatenated by a Job separated by a comma.
SELECT CONCAT(Ename,", ",Job_type) 
FROM Employee;

-- 4. Query to display all the data from the Employee Table. Separate each Column by a comma
-- and name the said column as THE_OUTPUT.
SELECT CONCAT(Eno,", ",Ename,", ",Job_type,", ",SuperVisionENO,", ",Hire_Date,", ",Dno,", ",Commission,", ",Salary) As THE_OUTPUT
FROM Employee;

-- 5. Query to display the Employee Name and Salary of all the employees earning more than
-- $2850.
SELECT Ename, Salary
FROM Employee
WHERE (Salary+Commission)>2850;

-- 6. Query to display Employee Name and Department Number for the Employee No= 79.
SELECT Ename, Dno
FROM Employee
WHERE Eno=79;

-- 7. Query to display Employee Name and Salary for all employees whose salary is not in the
-- range of $1500 and $2850.
SELECT Ename, Salary
FROM Employee
WHERE Salary NOT BETWEEN 1500 AND 2850;

-- 8. Query to display Employee Name and Department No. of all the employees in Dept 10 and
-- Dept 30 in the alphabetical order by name.
SELECT Ename, Dno 
FROM Employee
WHERE Dno=10 OR Dno=30
ORDER BY Ename ASC;

-- 9. Query to display Name and Hire Date of every Employee who was hired in 1981.
SELECT Ename, Hire_Date
FROM Employee
WHERE Hire_Date LIKE "1981%";

SELECT Ename, Hire_Date
FROM Employee
WHERE Year(Hire_Date)=1981;

-- 10. Query to display Name and Job of all employees who have not assigned a supervisor.
SELECT Ename, Job_type
FROM Employee
WHERE SuperVisionENO IS NULL;

-- 11. Query to display the Name, Salary and Commission for all the employees who earn
-- commission.
SELECT Ename, Salary, Commission
FROM Employee
WHERE Commission > 0;

-- 12. Sort the data in descending order of Salary and Commission.
SELECT Salary, Commission
FROM Employee
ORDER BY Salary DESC, Commission DESC;

-- 13. Query to display Name of all the employees where the third letter of their name is ‘A’.
SELECT Ename
FROM Employee
WHERE Ename LIKE "__A%";

-- 14. Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their
-- name and are either in Dept No = 30 or their Manger’s Employee No = 778.
SELECT Ename
FROM Employee
WHERE (Ename LIKE "%R%R%" OR Ename LIKE "%A%A%") AND (Dno=30 OR SuperVisionENO=778);

-- 15. Query to display Name, Salary and Commission for all employees whose Commission
-- amount is greater than their Salary increased by 5%.
SELECT Ename, Salary, Commission
FROM Employee
WHERE Commission > (Salary*(1.05));

-- 16. Query to display the Current Date along with the day name.
SELECT CURDATE(), DAYNAME(CURDATE());

-- 17. Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after
-- six months of employment.
SELECT Ename, Hire_Date, Date_Add(Date_Add(Hire_Date, INTERVAL 6 MONTH),
INTERVAL(7-WEEKDAY(Date_Add(Hire_Date, INTERVAL 6 MONTH))) DAY) AS REVIEW_DATE 
FROM Employee;

-- 18. Query to display Name and calculate the number of months between today and the date
-- on which employee was hired of department ‘Purchase’.
SELECT e.Ename, (12*(YEAR(CURDATE())-YEAR(e.Hire_Date))+MONTH(CURDATE())-MONTH(e.Hire_Date)) AS Total_Months
FROM Employee AS e, Department AS d
WHERE e.Dno=d.Dno AND Dname="Purchase";

SELECT e.Ename, TIMESTAMPDIFF(MONTH,e.Hire_Date, CURDATE()) AS Total_Months
FROM Employee AS e, Department AS d
WHERE e.Dno=d.Dno AND Dname="Purchase";

-- 19. Query to display the following for each employee <E-Name> earns < Salary> monthly
-- but wants < 3 * Current Salary >. Label the Column as Dream Salary.
SELECT CONCAT(Ename," earns ", Salary," monthly but wants ", 3*Salary) AS Dream_Salary 
FROM Employee;

-- 20. Query to display Name with the 1st letter capitalized and all other letter lower case and
-- length of their name of all the employees whose name starts with ‘J’, ’A’ and ‘M’.
SELECT CONCAT(Upper(Substring(Ename,1,1)), Lower(Substring(Ename,2))) AS Name, LENGTH(Ename) AS length
FROM Employee
WHERE Ename LIKE "J%" OR Ename LIKE "A%" OR Ename LIKE "M%";

-- 21. Query to display Name, Hire Date and Day of the week on which the employee started.
SELECT Ename, Hire_Date, DAYNAME(Hire_Date) AS Start_Day
FROM Employee;

-- 22. Query to display Name, Department Name and Department No for all the employees.
SELECT e.Ename, d.Dname, e.Dno
FROM Employee AS e, Department as d
WHERE e.Dno=d.Dno;

-- 23. Query to display Unique Listing of all Jobs that are in Department number 30.
SELECT Distinct Job_type 
FROM Employee
WHERE Dno=30;

-- 24. Query to display Name, Dept Name of all employees who have an ‘A’ in their name.
SELECT e.Ename, d.Dname
FROM Employee AS e, Department AS d
WHERE e.Dno=d.Dno AND Ename LIKE "%A%";

-- 25. Query to display Name, Job, Department No. And Department Name for all the
-- employees working at the Dallas location.
SELECT e.Ename, e.Job_type, e.Dno, d.Dname
FROM Employee AS e, Department AS d
WHERE e.Dno=d.Dno AND d.Location="Dallas";

-- 26. Query to display Name and Employee no. Along with their supervisor’s Name and the
-- supervisor’s employee no; along with the Employees’ Name who do not have a supervisor.
SELECT e.Eno, e.Ename, s.Eno, s.Ename
FROM Employee AS e LEFT OUTER JOIN Employee AS s
ON e.Eno=s.SuperVisionENO;


-- 27. Query to display Name, Dept No. And Salary of any employee whose department No.
-- and salary matches both the department no. And the salary of any employee who earns a
-- commission.
SELECT Ename, Dno, Salary
FROM Employee
WHERE (Dno, Salary) IN (SELECT Dno, Salary
                        FROM Employee
                        WHERE Commission>0);

-- 28. Query to display Name and Salaries represented by asterisks, where each asterisk (*)
-- signifies $100.
SELECT Ename, REPEAT("*", Salary/100) AS Salary_Asterisk
FROM Employee;

-- 29. Query to display the Highest, Lowest, Sum and Average Salaries of all the employees
SELECT MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary, SUM(Salary) AS Total_Salary, AVG(Salary) AS Average_Salary
FROM Employee;

-- 30. Query to display the number of employees performing the same Job type functions.
SELECT Job_type, Count(*) AS Total_Employee
FROM Employee
GROUP BY Job_type;

-- 31. Query to display the total number of supervisors without listing their names.
SELECT COUNT( DISTINCT SuperVisionENO) AS Total_SuperVisors
FROM Employee;

-- 32. Query to display the Department Name, Location Name, No. of Employees and the
-- average salary for all employees in that department.
SELECT Dname, Location, Count(Eno) AS Total_Employee, AVG(Salary) AS Average_Salary 
FROM Department, Employee
WHERE Employee.Dno=Department.Dno
GROUP BY Dname;

-- 33. Query to display Name and Hire Date for all employees in the same dept. as Blake.
SELECT Ename, Hire_Date
FROM Employee
WHERE Dno=(SELECT Dno
           FROM Employee
           WHERE Ename="Blake");

-- 34. Query to display the Employee No. And Name for all employees who earn more than the
-- average salary.
SELECT Eno, Ename
FROM Employee
WHERE Salary>(SELECT AVG(Salary) FROM Employee);

-- 35. Query to display Employee Number and Name for all employees who work in a
-- department with any employee whose name contains a ‘T’.
SELECT Eno, Ename
FROM Employee
WHERE Dno In (SELECT Dno
              FROM Employee
              WHERE Ename LIKE "%T%");

SELECT e1.eno, e1.ename
FROM employee e1 
WHERE e1.dno = some (SELECT e2.dno 
                     FROM employee e2 
                     WHERE e2.dno=e1.dno and e2.ename like '%T%');

-- 36. Query to display the names and salaries of all employees who report to supervisor named
-- ‘King’
SELECT Ename, Salary
FROM Employee
WHERE SuperVisionENO=(SELECT Eno 
                      FROM Employee
                      WHERE Ename="King");

-- 37. Query to display the department no, name and job for all employees in the Sales
-- department
SELECT e.Dno, e.Ename, e.Job_type
FROM Employee AS e, Department AS d 
WHERE e.Dno=d.Dno AND d.Dname="Sales";

-- 38. Display names of employees along with their department name who have more than 20
-- years experience
SELECT Ename, Dname
FROM Employee, Department
WHERE Employee.Dno=Department.Dno AND (Year(CURDATE())-YEAR(Hire_Date))>20;

SELECT Ename, Dname
FROM Employee, Department
WHERE Employee.Dno=Department.Dno AND TIMESTAMPDIFF(YEAR, Hire_Date, CURDATE())>20;

-- 39. Display total number of departments at each location
SELECT Location, COUNT(Distinct Dno) Total_Departments
FROM Department 
GROUP BY Location;

-- 40. Find the department name in which at least 20(Assume 5) employees work in.
SELECT Dname
FROM Department AS d, Employee AS e
WHERE d.Dno=e.Dno
GROUP BY e.Dno
HAVING  count(*)>=5;

-- 41. Query to find the employee’ name who is not supervisor and name of supervisor
-- supervising more than 5 employees.
SELECT Ename 
FROM Employee
WHERE Eno NOT IN (SELECT Distinct SuperVisionENO FROM Employee WHERE SuperVisionENO IS NOT NULL)
UNION
SELECT e.Ename
FROM Employee e LEFT JOIN Employee s
ON e.Eno=s.SuperVisionENO
GROUP BY e.Eno
HAVING COUNT(*)>5;

-- 42. Query to display the job type with maximum and minimum employees
WITH JOB_TYPE_DATA(Job_type, Total_Employees) AS 
(SELECT Job_type, Count(*) AS Total_Employees
FROM Employee
GROUP BY Job_type)
SELECT Job_type, Total_Employees
FROM JOB_TYPE_DATA
WHERE Total_Employees = (SELECT MAX(Total_Employees) FROM JOB_TYPE_Data) 
OR    Total_Employees = (SELECT MIN(Total_Employees) FROM JOB_TYPE_Data);


(SELECT Job_type, COUNT(Eno)
FROM Employee
GROUP BY Job_type
ORDER BY count(Eno) asc limit 1)
UNION
(SELECT Job_type, COUNT(Eno)
FROM Employee
GROUP BY Job_type
ORDER BY count(Eno) desc limit 1);

(SELECT Ename
FROM Employee
WHERE Dno=30 OR Dno=10)
Except all
(SELECT Ename
FROM Employee
WHERE Dno=30 );

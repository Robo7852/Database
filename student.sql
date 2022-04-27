Question-1
create table student
(ID int primary key,
class varchar(5),
section varchar(5),
gender varchar(6),
name varchar(20),
dob date,
marks int);

Question-2
insert into student values 
(1,"10th","A","Female","Varsha","2002-03-25",88),
(2,"11th","B","Male","Ravi","2001-03-05",27),
(3,"8th","A","Female","Nikita","2002-03-10",97),
(4,"11th","C","Female","Shradha","2002-03-15",89),
(5,"10th","A","Female","Sunita","2000-03-18",47),
(6,"12th","A","Female","Hema","2002-03-15",67),
(7,"9th","D","Male","Umesh","2002-03-15",37),
(8,"12th","A","Male","Ramesh","2002-03-15",50),
(9,"10th","E","Female","Shruti","2002-05-15",67),
(10,"12th","A","Female","Ananya","2002-09-25",97),
(11,"12th","A","Male","Ram","2003-09-18",97);

Question-3
delete from student where id=11;

Question-4
SELECT id,name,marks
FROM student
WHERE marks>50;

Question-5
SELECT id, name, marks
FROM student
ORDER BY marks;

Question-6
SELECT * from student Where name like "AN%";

Question-7
SELECT distinct name from student;

-- SELECT Ename
-- FROM Employee 
-- WHERE Eno NOT IN (Select SuperVisionENO from Employee where SuperVisionENO is not null) or Eno in(select SuperVisionENO from Employee group by SuperVisionENO having count(Eno)>5);

-- SELECT Job_type
-- FROM Employee
-- Group By Job_type
--      UNION (Select count(Eno) from Employee where Eno=(Max(Eno)) group by job_type ) UNION (Select count(Eno) from Employee where Eno=(Min(Eno));

-- select E2.Ename from employee e1 right join employee e2 on e1.supervisonEno=e2.eno group by e2.Eno having count(*)>2 union
--     select E2.Ename from employee e1 right join employee e2 on e1.supervisonEno=e2.eno where e1.eno is null;

select e1.ename,e1.eno from employee e1 
where e1.dno = some (select e2.dno from employee e2 
where e2.dno=e1.dno and e2.ename like '%T%');
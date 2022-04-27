-- PARTS(Pno, Pname, Qoh, Price, Olevel)
-- CUSTOMERS(Cno, Cname, Street, Zip, Phone)
-- EMPLOYEES(Eno, Ename, Zip, Hdate)
-- ZIP_CODES(Zip, City)
-- ORDERS(Ono, Cno, Eno, Received, Shipped)
-- ODETAILS(Ono, Pno, Qty)

create database mailorder;
use mailorder;

create table parts(Pno int primary key,
 pname varchar(30),
 Qoh varchar(10), 
 price int, 
 Olevel varchar(10));
insert into parts values(1, "keyboard","4",55,"3"),
(2, "mouse","3",19,"1");


create table ZIP_CODES(Zip varchar(30) primary key,
City varchar(30));

insert into ZIP_CODES values("abc","Delhi"),
("pqr","Wichita");


create table CUSTOMERS(cno int primary key,
Cname varchar(20),
Street varchar(20),
Zip varchar(30),
Phone varchar(30),
FOREIGN KEY (Zip) REFERENCES ZIP_CODES(zip));
insert into CUSTOMERS values(10,"Rahul","Pitam Pura","abc","9847859389"),
(20,"Sagar","Goa","pqr","9876543210"),
(30,"Ayush","Agra","pqr","9876543210");

create table EMPLOYEES(Eno int primary key,
Ename varchar(30),
Zip varchar(30),
Hdate date,
FOREIGN KEY (Zip) REFERENCES ZIP_CODES(zip));
insert into EMPLOYEES values(100,"Pooja","abc","2021-10-09"),
(200,"Deepti","pqr","2021-10-09");


create table ORDERS(Ono int primary key, 
cno int,
 Eno int, 
 Received date, 
 Shipped date,
FOREIGN KEY (cno) REFERENCES CUSTOMERS(cno));
insert into ORDERS values(1001,10,100,"2022-05-25","2022-05-20");
insert into ORDERS values(1002,20,200,"2022-08-20","2022-05-20");

 create table ODETAILS(Ono int ,
 Pno int , 
 Qty int,
 primary key (ono, pno));
 alter table ODETAILS add foreign key (pno) REFERENCES parts(pno);
 alter table ODETAILS add foreign key (ono) REFERENCES orders(ono);
 insert into ODETAILS values (1001, 1,2);
 insert into ODETAILS values (1002, 2,3);

SELECT Pname
FROM Parts
WHERE Price < 20;

SELECT Ename, City
FROM EMPLOYEES, CUSTOMERS, ZIP_CODES, ORDERS, ODETAILS, PARTS
WHERE EMPLOYEES.zip=CUSTOMERS.zip AND EMPLOYEES.zip=ZIP_CODES.zip AND 
ORDERS.cno=CUSTOMERS.cno AND ODETAILS.pno=PARTS.pno AND Parts.price>50;


SELECT distinct c1.Cno
FROM CUSTOMERS c1, CUSTOMERS c2
WHERE c1.cno<>c2.cno AND c1.zip=c2.zip;


SELECT Cname
FROM CUSTOMERS, EMPLOYEES, ZIP_CODES, ORDERS
WHERE ORDERS.cno=CUSTOMERS.cno AND ORDERS.Eno=EMPLOYEES.Eno
 AND EMPLOYEES.zip=ZIP_CODES.zip AND ZIP_CODES.city="Wichita";


SELECT Cname
FROM CUSTOMERS, PARTS, ODETAILS, ORDERS
WHERE CUSTOMERS.cno=ORDERS.cno AND PARTS.pno=ODETAILS.pno 
AND PARTS.price<20 AND ORDERS.ono=ODETAILS.ono;

SELECT Distinct Cname
FROM CUSTOMERS
WHERE CUSTOMERS.cno NOT In (SELECT cno from orders);

SELECT Cname
FROM CUSTOMERS, ODETAILS, ORDERS
WHERE CUSTOMERS.cno=ORDERS.cno AND ORDERS.ono=ODETAILS.ono AND ODETAILS.Qty=2;

create database librar
use librar

--Question-1
create table books(id int primary key,title varchar(20),author varchar(20),isbn Bigint unique,
published_date dateTime)

insert into books(id,title,author,isbn,published_date) values(1,'my first SQL book','mary parker',981483029127,'2012-02-22 12:08:17'),
(2,'My second SQL book','John mayer',857300923713,'1972-07-03 09:22:45'),
(3,'My third SQL book','cary flint',523120967812,'2015-10-18 14:05:44')

--Write a query to fetch the details of the books written by author whose name ends with er.
select * from books where author like '%er'

create table reviews(id int not null,book_id int,reviewer_name varchar(20), content varchar(30),rating numeric(4),published_date datetime,
foreign key(book_id) references books(id))
  
insert into reviews(id,book_id,reviewer_name,content,rating,published_date) values(1,1,'john smith','my first review',4,'2017-12-10 05:50:11.1'),
(2,2,'john smith','my second review',5,'2017-10-13 15:05:12.6'),
(3,2,'alice walker','another review',1,'2017-10-22 23:47:10')

select * from reviews

--Question-2
select title,author,reviewer_name from books,reviews where books.id=reviews.

--Question-3

select reviewer_name,count(*) as more_than_1_reviewed from reviews group by reviewer_name having count(*)>1



create table customer(id int primary key,cname varchar(10),age int,address varchar(10), salary int)

insert into customer(id,cname,age,address,salary)values(1,'ramesh',32,'ahmedabad',2000),
(2,'Khilan',25,'delhi',1500),(3,'khaushik',23,'kota',2000),(4,'chaitali',25,'mumbai',6500),
(5,'hardik',27,'bhopal',8500),(6,'komal',22,'MP',4500),
(7,'muffy',24,'indore',10000)

select * from customer

--Question-4
select cname,address from customer where address like '%o%'

create table orders(oid int,date datetime, customer_id int ,amount float,foreign key(customer_id)references customer(id))

insert into orders(oid,date,customer_id,amount) values(102,'2009-10-08',3,3000),
(100,'2009-10-08',3,1500),(101,'2009-11-20',2,1560),(103,'2008-05-20',4,2060)

select * from orders

--Question-5
--Write a query to display the Date,Total no of customer placed order on same Date
select date,count(customer_id)as total_customers from orders group by date

update customer set salary=null where cname='muffy'

select * from customer

--Question-6
select lower(cname)as employee from customer where salary is null



create table studentdetails(register_id int primary key,sname varchar(20),age int,qualification varchar(10),
mobile bigint,mail_id varchar(30),location varchar(20),gender varchar(4))

insert into studentdetails(register_id,sname,age,qualification,mobile,mail_id,location,gender) values(
2,'sai',22,'B.E',9952836777,'sai@gmail.com','chennai','M'),
(3,'kumar',20,'BSC',7890125648,'kumar@gmail.com','madurai','M'),
(4,'selvi',22,'B.Tech',8904567342,'selvi@gmail.com','selam','F'),
(5,'nisha',25,'M.E',7834672310,'nisha@gmail.com','theni','F'),
(6,'saisaran',21,'BA',789034578,'saran@gmail.com','madurai','F'),
(7,'tom',23,'BCA',8901234675,'tom@gmail.com','pune','M')

select * from studentdetails
--Question-8
select gender,count(gender) from studentdetails group by gender



create table coursedetails(c_id varchar(10) primary key,c_name varchar(30),start_date date,end_date date,fee int)

insert into coursedetails(c_id,c_name,start_date,end_date,fee)values ('DN003','dotnet','2018-02-01','2018-02-28',15000),
('DV004','datavisualization','2018-03-01','2018-04-15',15000),('JA002','Advanced Java','2018-01-02','2018-01-12',10000),
('JC001','corejava','2018-01-02','2018-01-12',3000)

select * from coursedetails

create table courseregistration(registorNo int,cid varchar(10),batch varchar(4),foreign key(cid) references coursedetails(c_id))

insert into courseregistration(registorNo,cid,batch) values (2,'DN003','FN'),(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','FN'),
(5,'JC001','FN')

select * from courseregistration
--Question-8
select count(*)as count_students,c_name course_name from coursedetails full join courseregistration on coursedetails.c_id=courseregistration.cid
and start_date>='2018-01-02' and end_date<='2018-02-28' group by c_name order by c_name desc




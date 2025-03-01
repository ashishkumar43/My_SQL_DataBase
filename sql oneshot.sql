-- CREATE DATABASE ASHISH; 
-- create database ASHISH;   #Sql is not case sensitive 
-- drop database ashish;     # Drop the database ashish
create database college;

-- create database if not exists college;   ## exist nhi kar rha tha jab create karo
Use college;

-- drop database if exists company;    ## if it exist then we do drop this database
drop database college;

## Create table with name student 
create table student(
 id INT primary key,
 name Varchar(50),
 age INT not null 
 );
 
 ## ADD data into the table student.
 INSERT INTO student VALUES (001,"Ashish",23);
 INSERT INTO student VALUES (002,"Rohan",22);
 INSERT INTO student VALUES (006,"kundan",22),(21,"ramu",34);
 
 
 ## If we want to insert single value then we use this command
 INSERT INTO student (id , name,age) values (004,"kishan",21);
 
 drop table student;
 ## Print the Table student 
 select * from student;       ## print the whole data in table 
 
 show databases;
 show tables;
 
 ## Question practice 1
 create database zeta;
 use zeta;
 
 create table employeeinfo (id int Primary key, name varchar(30),salary int not null);   ## the table name is case sensitive jis format mai likha hai usmi mai likhne hai  
 Insert into employeeinfo values(1,"adam",25000),(2,"bob",30000),(3,"casey",40000);
 select * from employeeinfo;
 
 ## Constraints
 create table temp(id int unique);    ## in unique we can't sent the duplicate value 
 
 create table temp1(id int ,name varchar(49),primary key(id)); ## this is the way to make the primary key another is id int primary key aaise bhi likh sakte hai.
 insert into temp values (101);
 insert into temp values (101);
 
 ## Default use
  create table temp8(id int ,salary int default 30000);
  insert into temp8 (id) values (1010);
  select * from temp8;
  
  
  # Solve a question
 --  database taken  as college,table student and store the rollno,name,marks,grade,city etc
  create database college1;
  use college1;
  create table student (rollno int primary key,name varchar (40),marks int not null,grade varchar(30),city varchar(40));
  insert into student values (104,"anil",78,"C","pune"),(106,"sonu",72,"A","rajashan"),
  (103,"sonu",42,"A","rajashan"),(100,"sonu",77,"V","nagpur");
  select * from student;
  select name,city from student;
  select distinct city,name from student;
  select * from student where marks>40 and marks<76;
  select * from student where marks between 40 and 90;   ## 40 and 90 also include isse inclusive kehte hai hum.
  select * from student where city in ("rajasthan","delhi","mumbai");
   select * from student where city not in ("rajasthan","mumbai");
   
##order by
select * from student order by marks asc;
select * from student order by marks desc;

select city, count(name) from student group by city;    ## select ke sath jitni chij likh rhe hai utni chije utni chij group by ke under hini chahiye warna error dega.
select city, name, count(name) from student group by city;   ## to correct this error we use which name we are selecting those name also come in group by statement aslo


## Practice question 
# write the query to find the avg marks in each city in ascending order.
select city,avg(marks) from student group by city order by city ;  #no need to put asc when we want in ascending order but when we want in descending order you should write.

## Having clause
# we use having to check the condition  and use with group by to check the condtion and column pe conditon lagata hai having.
# Count the no. of student in each city where max marks cross 90.
select count(name),city from student group by city having max(marks)>90;

## where and having use where use in row while having use in group. and where is before the group by and having is after the group by .

## update command
update student set grade="o" where grade="A";  ## safe mode error tells that we change the existing data then galti se koi data update na kar de isle safe mode off karna hota hai uski command hoti hai 
set sql_safe_updates=0;  # safe mode update ab update hoga 
#update marks by 1
update student set marks = marks +1; 
select * from student;

## delete command
delete  from student where marks  <90; 

# foreign key
Create table dept(
id int primary key,
name varchar(40)
);

Create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references dept(id)
);


#cascading for foreign key meaning  matlab ek jagah change hua to dusri jagah bhi change hona chahiye.

# Alter command to chnage in the schema 
-- Add column drop column rename column-- 
alter table student add column age int not null;
select * from student;
# Drop
alter table student drop column age ;
select * from student;

# truncate vs drop difference 
# truncate delete the data from table while drop delete the whole table.

## Joins
#Inner joins
create database college;
use college;
drop database college;
create table student (id int primary key ,name varchar(40));
insert into student values (101,"adam"),(102,"bob"),(103,"casey");
create table course (id int primary key ,course varchar(40));
insert into course values 
(102,"english"),(105,"math"),
(103,"science"),(107,"computer science");
Select * from student;     
select * from course;
# we use the inner join  
select * from student inner join course on student.id=course.id; # in this table if the table name is too big we use the short form like student as s and courses as c and we can use  
# in the above query if the table name is too big we use the short form like student as s and courses as c and we can use also known as alias 
select * from student as s inner join course as c on s.id=c.id;
# Left join query
select * from student as s left join course as c on s.id=c.id;
# Right join query
select * from student as s right join course as c on s.id=c.id;
# In other database like oracle ,postgresql we take the full join or full outer join  But in mys sql we use the union to take the full join.
select * from student as s left join course as c on s.id=c.id union select * from student as s right join course as c on s.id=c.id;

## Two joins that is left exclusive join and right exclusive joins 
# if we want the retrive the a data not include b and common that is used in the exclusive.
## if we want only the s table data that doesnot overlap with the data we use left exclusive and right exclusive.
## in left exclusive the common part that is not null and s wala part only c.id=null
## in digaram circle explain in c the id is taken 101 (overlap nhi kar rha hai coruse ke sath) and in common of s and c is (102 ,103) in c 105,107 (ye overlap nhi karte hai b ke under acc to prev data we have taken) 
# Left exclusive joins
select * from student as s left join course as c on s.id=c.id where c.id is Null;  
# Right exclusive Joins
select * from student as s right join course as c on s.id=c.id where s.id is Null;

#Self join (regular join) also known as inner join. for hiraracy we use self join
create table employee(id int primary key,name varchar(40),manager_id int);
insert into employee values (101,"adam",103),(102,"bob",104),(103,"casey",Null),(104,"donald",103);
#Use self join  (this query run right to left manner  <-----)
select * from employee as a join employee as b on a.id=b.manager_id; 

## Union ( it gives the unique value from both table)
select name from employee union select name from employee;

## Union All (it give the all duplicate value from both table)
select name from employee union all select name from employee;

## Sql sub queries ( in this we use the 2 select query)
## We have three method to write the subquery 
#- write the subquery inside select
#- write the subquery inside from
#- write the subquery inside where (we use mostly this method to write the subquery)
drop table student;
create table student (rollno int primary key,name varchar(50),marks int not null,grade varchar(1),city varchar(20));
insert into student 
(rollno ,name,marks,grade,city) 
values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan", 85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",92,"F","Delhi"),
(106,"farah",82,"B","Delhi");

select * from student;
select avg(marks) from student;
select name,marks from student where marks > 87.6667;  ## there is a problem here if in the table the averge marks is changed then the value change here we fix the value 87.667 to solve this problem we use the subqueries to solve this problem that is run dynamically.
#Subqueries
select name,marks from student where marks > (select avg(marks) from student); # this is dynamically solve

## find the even number in the above table
#Normal Method 
select rollno from student where rollno % 2 = 0;
select rollno,name from student where rollno in (102,104,106);

#Use Subqueries
select rollno,name from student where rollno in (select rollno from student where rollno % 2 = 0);

## Max marks find karne hai (From use)
#Normal method
select * from student where city="Delhi";
#Subquery (in from subquery we must use the alias that is as temp)
select max(marks) from (select * from student where city="Delhi") as temp;

#Subquery use with select
select (select max(marks) from student),names from student ;

## MySql views(virtual table or we can say temperary table hai) in this a small data hota hai to company see it.(account team not need to show the sales data) 
create view views1 as select rollno,name,marks from student;
select * from views1;
drop view views1;
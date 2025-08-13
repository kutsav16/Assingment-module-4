-- Q1 - Create a new database named school_db and a table called students with the following columns: student_id, student_name, age, class, and address.
create schema school_db;

create table student
(
student_id int not null unique,
student_name varchar(20) not null,
age int not null,
class int not null,
address varchar(50) not null
);

-- Q2 - Insert five records into the students table and retrieve all records using the SELECT statement.
insert into student values (101,'Parth_Vadariya',15,10,'Ahmedabad'),
(102,'Dip_Patel',16,10,'Rajkot'),
(103,'Pransu_Patel',12,8,'Mahesana'),
(104,'Mrugal_Vasoya',12,8,'Baroda'),
(105,'Dhruv_Patel',14,9,'Ahmedabad'),
(106,'Parth_Patel',10,5,'Ahmedabad'),
(107,'Partik_Kamani',9,4,'Rajkot');

select * from student; 

-- Q3 - Write SQL queries to retrieve specific columns (student_name and age) from the students table.
select student_name,age from student;

-- Q4 - Write SQL queries to retrieve all students whose age is greater than 10
select * from student where age>10;

-- Q5 - Create a table teachers with the following columns: teacher_id (Primary Key),teacher_name (NOT NULL), subject (NOT NULL), and email (UNIQUE).
-- Q6 - Implement a FOREIGN KEY constraint to relate the teacher_id from the teachers table with the students table.

create table teachers
(
teacher_id int primary key,
teacher_name varchar(25) not null,
subject varchar(10) not null,
email varchar(25) not null unique,
foreign key teachers(teacher_id) references student(student_id)
);

-- Q11 - Drop the teachers table from the school_db database.

drop table teachers;

-- Q12 - Drop the students table from the school_db database and verify that the table has been removed.

drop table student;

select * from student;
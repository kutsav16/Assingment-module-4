-- Q7 - Create a table courses with columns: course_id, course_name, and course_credits. Set the course_id as the primary key.
-- Q8 - Use the CREATE command to create a database university_db.

create schema university_db;

create table courses
(
course_id int primary key,
course_name varchar(25) not null,
course_credits float not null
);
select * from courses;

-- Q9 - Modify the courses table by adding a column course_duration using the ALTER command.

alter table courses add column course_duration varchar(15) not null after course_credits;

-- Q10 - Drop the course_credits column from the courses table.

alter table courses drop column course_credits;

-- Q13 - Insert three records into the courses table using the INSERT command.

insert into courses values (1,'Civil Engineering','3 years'),
(2,'Automobile Engineering','4 Years'),
(3,'Computer Engineering','3 Years');

-- Q14 - Update the course duration of a specific course using the UPDATE command.

update courses set course_duration = '3 Yares' where course_id = 2; 

-- Q15 - Delete a course with a specific course_id from the courses table using the DELETE command.

delete from courses where course_id = 3;

-- Q16 - Retrieve all courses from the courses table using the SELECT statement.

select course_name from courses;

-- Q17 - Sort the courses based on course_duration in descending order using ORDER BY.

select * from courses  order by course_duration desc;

-- Q18 - Limit the results of the SELECT query to show only the top two courses using LIMIT.

select * from courses limit 2;

-- Q19 - Create two new users user1 and user2 and grant user1 permission to SELECT from the courses table.

create user user1 identified by 'asd@123';
create user user2 identified by 'qwe@123';
grant select on courses to user1;
  
-- Q20 - Revoke the INSERT permission from user1 and give it to user2.

revoke select on courses from user1;
grant select on courses to user2; 

-- Q21 - Insert a few rows into the courses table and use COMMIT to save the changes.

insert into courses values (4,'Michenical_Engineering','4 Year'),
(5,'Electrical_Engineering','4 Year');
select * from courses;
commit;

-- Q22 - Insert additional rows, then use ROLLBACK to undo the last insert operation.

insert into courses values (6,'QC_Engineering','4 Year'),
(7,'IT_Engineering','4 Year');
select * from courses;
rollback;

-- Q23 - Create a SAVEPOINT before updating the courses table, and use it to roll back specific changes.
update courses set course_duration = '3 Yares' where course_id = 2;
savepoint s1;
update courses set course_duration = '4 Yares' where course_id = 3;
savepoint s2;
update courses set course_duration = '4 Yares' where course_id = 5;
select * from courses;

rollback to savepoint s1;

-- Q29 - Write a stored procedure that accepts course_id as input and returns the course details.

delimiter &&
create procedure display(in id int)
begin
select * from courses where course_id = id;
end &&

call display(1);

-- Q39 - Create a cursor to retrieve all courses and display them one by one.

DECLARE
  COU_ID COURSES.COURSE_ID%TYPE;
  COU_NAME COURSES.COURSE_NAME%TYPE;
  CURSOR COU IS SELECT COURSE_ID,COURSE_NAME FROM COURSES;
BEGIN
OPEN COU;
LOOP
FETCH COU INTO COU_ID,COU_NAME;
DBMS_OUTPUT.PUT_LINE (COU_ID||' | '|| COU_NAME);
EXIT WHEN COU%NOTFOUND;
END LOOP;
CLOSE COU;
END;
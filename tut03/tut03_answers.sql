-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 

CREATE DATABASE DBMS;
USE DBMS;

CREATE TABLE COURSES (
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
credit_hours INT NOT NULL,
instructor_id INT ,
FOREIGN KEY (instructor_id) REFERENCES INSTRUCTORS(instructor_id )
);




CREATE TABLE ENROLLMENTS (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT ,
FOREIGN KEY (course_id) REFERENCES COURSES(course_id ),
enrollment_date date,
grade varchar(4)
);


CREATE TABLE INSTRUCTORS (
instructor_id INT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40) ,
email VARCHAR(80)
);

CREATE TABLE STUDENTS (
student_id INT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40) ,
age INT,
city VARCHAR(80),
state VARCHAR(80)
);


INSERT INTO COURSES
(course_id, course_name, credit_hours, instructor_id )
VALUES
(101, "	Mathematics", 3, 1 ),
(102, "Physics", 4, 2),
(103, "History", 3, 3),
(104, "Chemistry", 4, 1),
(105, "Computer Science", 3, 2);

INSERT INTO ENROLLMENTS
(enrollment_id, student_id, course_id, enrollment_date, grade )
VALUES
(1, 1, 101, "2022-09-01", "A" ),
(2, 2, 102, "2022-09-03", "B+" ),
(3, 3, 103, "2022-09-05", "A-" ),
(4, 4, 104, "2022-09-07", "B" ),
(5, 5, 105, "2022-09-10", "A" );

INSERT INTO INSTRUCTORS
(instructor_id, first_name, last_name, email )
VALUES
(1, "Dr. Akhil", "Singh", "drsingh@example.com" ),
(2, "Dr. Neha", "Agarwal", "dragarwal@example.com" ),
(3, "DDr. Nitin", "Warrier", "drwarrier@example.com" );

INSERT INTO STUDENTS
(student_id, first_name, last_name, age, city, state )
VALUES
(1, "Rahul", "Sharma", 	21, "Delhi", "Delhi" ),
(2, "Pooja", "Patel",  20, "Mumbai", "Maharashtra" ),
(3, "Krishna", "Singh",  22, "Lucknow", "Uttar Pradesh" ),
(4, "Anjali", "Reddy",  23, "Hyderabad", "Telangana" ),
(5, "Suresh	", "Kumar",  21, "Bangalore", "TKarnataka" ),
(6, "Riya", "Gupta",  22, "Kolkata", "West Bengal" ),
(7, "Rajesh", "Mehta",  20, "Ahmedabad", "Gujarat" ),
(8, "Kavita", "Desai",  21, "Pune", "Maharashtra" ),
(9, "Arjun", "Mishra",  22, "Jaipur", "	Rajasthan" ),
(10, "Divya", "	Choudhary",  20, "Chandigarh", "Punjab" ),
(11, "Akash", "	Bansal",  21, "	Indore", "Madhya Pradesh" ),
(12, "Mohit", "	Verma",  22, "Ludhiana", "Madhya Pradesh" ),
(13, "Jyoti", "Chauhan",  20, "Nagpur", "Maharashtra" ),
(14, "Varun", "Rao",  23, "	Visakhapatnam", "Andhra Pradesh" ),
(15, "Nisha", "Tiwari",  23, "	Patna", "Bihar" );



SELECT * FROM COURSES;
SELECT * FROM ENROLLMENTS;
SELECT * FROM INSTRUCTORS;
SELECT * FROM STUDENTS;

-- qustion 1..........

SELECT first_name, last_name FROM STUDENTS;

-- QUESTION 2.................

SELECT course_name, credit_hours FROM COURSES;

-- QUESTION 3................... 

SELECT first_name, last_name, email FROM INSTRUCTORS;

-- QUESTION 4......................

SELECT student_id, course_name,grade
FROM COURSES as c
RIGHT JOIN ENROLLMENTS as e
ON c.course_id = e.course_id;

-- QUESTION 5........................

SELECT first_name, last_name, city FROM STUDENTS;

-- QUESTION 6..................................

SELECT course_name,first_name
FROM COURSES as c
RIGHT JOIN INSTRUCTORS as i
ON c.instructor_id = i.instructor_id;

-- QUESTION 7......................................

SELECT first_name, last_name, age FROM STUDENTS;

-- QUESTION 8.....................................

SELECT student_id, course_name,enrollment_date
FROM COURSES as c
RIGHT JOIN ENROLLMENTS as e
ON c.course_id = e.course_id;

-- QUESTION 9 ......................................

SELECT first_name, last_name, email FROM INSTRUCTORS;

-- QUESTION 10...........................

SELECT course_name, credit_hours FROM COURSES;

-- QUESTION 11..............................

SELECT i.first_name, i.last_name, i.email
FROM INSTRUCTORS as i
JOIN COURSES as c ON c.instructor_id = i.instructor_id
WHERE c.course_name = "Mathematics";


-- QUESTION 12..........................................

SELECT c.course_name, e.grade
FROM courses as c
JOIN enrollments as e ON c.course_id = e.course_id
WHERE e.grade = 'A';

-- QUESTION 13...........................................

SELECT s.first_name, s.last_name, s.state
FROM students as s
JOIN enrollments as e ON s.student_id = e.student_id
JOIN courses as c ON e.course_id = c.course_id
WHERE c.course_name = 'Computer Science';

-- QUESTION 14 ..............................................

SELECT c.course_name, e.enrollment_date
FROM courses as c
JOIN enrollments as e ON c.course_id = e.course_id
WHERE e.grade = 'B+';

-- QUESTION 15............................................................

SELECT i.first_name, i.last_name, i.email
FROM INSTRUCTORS as i
JOIN courses as c ON c.instructor_id = i.instructor_id
WHERE c.credit_hours > 3;









	






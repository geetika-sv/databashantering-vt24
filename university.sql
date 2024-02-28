CREATE DATABASE university;

USE university;

CREATE TABLE universities(
    university_id INT PRIMARY KEY AUTO_INCREMENT,
    university_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
);


INSERT INTO universities (university_name) VALUES ('MIT');

SELECT * FROM universities;

UPDATE universities SET 
    address='123 Main street',
    phone='555-1234-56',
    email='harvard@university.com'
WHERE university_id= 1;


UPDATE universities SET 
    address='456 Elm street',
    phone='555-1234-57',
    email='mit@university.com'
WHERE university_id= 2;

SELECT * FROM universities;

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    university_id INT NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    teacher VARCHAR(255),
	credits INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)    
);

INSERT INTO courses (university_id, course_name, teacher, credits)
VALUES (1, 'Math 101', 'Alice',3),
	   (1,'English 101', 'Bob', 3),
       (2,'Physics 101', 'Carol', 3),
       (2,'Chemistry 101', 'Dave', 3);
       
SELECT * FROM courses;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    email VARCHAR(255)
	);


INSERT INTO students (student_id, student_name, phone, email)
      VALUES (1, 'Alice', '072-123 344558', 'alice@gmail.com'),
             (2, 'Bob', '0723355455', 'bob@gmail.com');
      
SELECT * FROM  students; 

CREATE TABLE student_course_grades (
    student_course_grades_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT ,
    grade VARCHAR(255),
    start_date VARCHAR(255),
    end_date   VARCHAR(255),
	FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
	);
    

INSERT INTO student_course_grades (student_course_grades_id,student_id, course_id, grade,start_date,end_date)
VALUES (1,1,1, 'A','2024-01-01','2024-06-01' ),
	   (2,1,2, 'B','2024-01-01','2024-06-01' ),
       (3,2,3, 'C','2024-01-01','2024-06-01' ),
	   (4,2,4, 'D','2024-01-01','2024-06-01' );
       
  
  SELECT * FROM student_course_grades;
  
  SELECT s.student_name, c.course_name, scg.grade,u.university_name
  FROM student_course_grades AS scg
  INNER JOIN students AS s ON s.student_id = scg.student_id
  INNER JOIN courses AS c ON c.course_id = scg.course_id
  INNER JOIN universities AS u ON u.university_id = c.university_id;
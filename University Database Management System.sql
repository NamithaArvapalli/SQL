CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Create the Courses table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    credits INT
);

-- Create the Enrollment table
CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create the Grades table
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    grade CHAR(2),
    description VARCHAR(50)
);

-- Insert data into Students table
INSERT INTO Students (first_name, last_name, date_of_birth, gender, email, phone, address) VALUES
('John', 'Doe', '2000-01-15', 'Male', 'john.doe@example.com', '123-456-7890', '123 Main St'),
('Jane', 'Smith', '1999-03-22', 'Female', 'jane.smith@example.com', '234-567-8901', '456 Oak St'),
('Alice', 'Johnson', '2001-07-30', 'Female', 'alice.johnson@example.com', '345-678-9012', '789 Pine St');

desc students;
select * from students;
select first_name, last_name, email from Students;

-- Insert data into Courses table
INSERT INTO Courses (course_name, course_description, credits) VALUES
('Database Systems', 'Introduction to Database Management Systems', 3),
('Algorithms', 'Study of Algorithms and Data Structures', 4),
('Software Engineering', 'Principles of Software Engineering', 3);

-- Insert data into Enrollment table
INSERT INTO Enrollment (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-01-10', 'A'),
(2, 2, '2023-01-11', 'B'),
(3, 3, '2023-01-12', 'A');

SELECT 
    e.enrollment_id, 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.enrollment_date, 
    e.grade
FROM 
    Enrollment e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id;

-- Insert data into Grades table
INSERT INTO Grades (grade, description) VALUES
('A', 'Excellent'),
('B', 'Good'),
('C', 'Average'),
('D', 'Below Average'),
('F', 'Fail');

-- Update a student's email
UPDATE Students
SET email = 'jhon123.email@example.com'
WHERE student_id = 1;

-- Update a student's phone number
UPDATE Students
SET phone = '987-654-3210'
WHERE student_id = 2;

SELECT * FROM students;

-- Retrieve student performance report
SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.grade, 
    g.description
FROM 
    Enrollment e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
JOIN 
    Grades g ON e.grade = g.grade;
    
    
-- Delete an enrollment record
DELETE FROM Enrollment
WHERE enrollment_id = 1;


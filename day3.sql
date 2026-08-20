CREATE TABLE department(
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    department_id INTEGER,
    credits INTEGER,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    department_id INTEGER,
    cgpa REAL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO department (department_id, department_name) VALUES
(1, 'Computer Science Engineering'),
(2, 'Electrical Engineering'),
(3, 'AIML & Engineering');

INSERT INTO courses (course_id, course_name, department_id, credits) VALUES
(101, 'Data Structures', 1, 4),
(102, 'Circuits & Signals', 2, 3),
(103, 'Thermodynamics', 3, 4);

INSERT INTO students (student_id, name, age, department_id, cgpa) VALUES
(1, 'Aarav', 20, 1, 8.5),
(2, 'Ananya', 21, 1, 9.2),
(3, 'Rohan', 22, 2, 7.8),
(4, 'Priya', 20, 2, 8.1),
(5, 'Vikram', 21, 3, 6.9),
(6, 'Neha', 20, 1, 8.8),
(7, 'Siddharth', 22, 3, 7.4),
(8, 'Isha', 21, 2, 9.0),
(9, 'Kabir', 20, 1, 7.9),
(10, 'Diya', 21, 3, 8.3);

SELECT * FROM students;

SELECT name, cgpa FROM students;

SELECT * FROM students WHERE cgpa > 8.0;

SELECT COUNT(*) AS total_students FROM students;

SELECT AVG(cgpa) AS average_cgpa FROM students;

SELECT MAX(cgpa) AS highest_cgpa FROM students;

SELECT MIN(cgpa) AS lowest_cgpa FROM students;

SELECT SUM(cgpa) AS sum_cgpa FROM students;


SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM students s
JOIN department d ON s.department_id = d.department_id
GROUP BY d.department_name;

SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM students s
JOIN department d ON s.department_id = d.department_id
GROUP BY d.department_name;
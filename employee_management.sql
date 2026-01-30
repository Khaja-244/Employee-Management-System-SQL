-- ============================================
-- Project: Employee Management System
-- Technology: SQL (MySQL)
-- Author: Khaja Shaik
-- ============================================

DROP DATABASE IF EXISTS company_db;

CREATE DATABASE company_db;
USE company_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT CHECK (salary > 0),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (1, 'IT');
INSERT INTO departments VALUES (2, 'HR');
INSERT INTO departments VALUES (3, 'Finance');

INSERT INTO employees VALUES (101, 'Rahul', 50000, 1);
INSERT INTO employees VALUES (102, 'Anita', 42000, 2);
INSERT INTO employees VALUES (103, 'Sameer', 60000, 3);
INSERT INTO employees VALUES (104, 'Priya', 48000, 1);

SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

SELECT emp_name, salary
FROM employees
WHERE salary > 45000;

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT d.dept_name, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

UPDATE employees
SET salary = 55000
WHERE emp_id = 101;

DELETE FROM employees
WHERE emp_id = 104;

SELECT * FROM employees;

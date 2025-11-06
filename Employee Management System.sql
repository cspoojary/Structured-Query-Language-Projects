use chaitdb;

create table Departments(
dept_id varchar(50) PRIMARY KEY,
dept_name varchar(50)
);

INSERT INTO Departments(dept_id, dept_name)
VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

CREATE TABLE Employees(emp_id varchar(10) PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
hire_date date,
dept_id varchar(50),
salary DECIMAL(10,2),
FOREIGN KEY (dept_id) REFERENCES departments(dept_id));

INSERT INTO Employees(emp_id,emp_name,job_title,hire_date,dept_id,salary)
VALUES
(101, 'Alice', 'HR Manager', '2020-01-15', 1, 55000),
(102, 'Bob', 'Accountant', '2019-03-20', 2, 60000),
(103, 'Charlie', 'Software Engineer', '2021-07-10', 3, 75000),
(104, 'David', 'Marketing Executive', '2022-05-22', 4, 50000),
(105, 'Eva', 'System Analyst', '2018-09-18', 3, 72000);

CREATE TABLE Salary (Salary_id VARCHAR(10) PRIMARY KEY,
emp_id VARCHAR(10),
Bonus DECIMAL(10,2),
Total_salary DECIMAL(10,2),
FOREIGN KEY(emp_id) REFERENCES Employees(emp_id));

INSERT INTO Salary(Salary_id,emp_id,Bonus,Total_salary)
VALUES
(1, 101, 5000, 60000),
(2, 102, 4000, 64000),
(3, 103, 6000, 81000),
(4, 104, 3000, 53000),
(5, 105, 7000, 79000);

-- Basic Queries

#Display all the records from the employees table.
SELECT * FROM Employees;

#List all the department names from the departments table.
SELECT dept_name FROM Departments;

#Show the names and salaries of all employees.
SELECT emp_name, salary FROM Employees; 

#Find employees who joined after January 1, 2020.
SELECT emp_name, hire_date FROM Employees WHERE hire_date > '2020-01-01';

#Retrieve employee names and their hire dates, sorted by newest hire first.
SELECT emp_name,job_title,hire_date FROM Employees ORDER BY hire_date DESC;

-- Filtering and Conditions

#Display the details of employees whose salary is between 50,000 and 70,000.
SELECT * FROM Employees WHERE salary BETWEEN 50000 AND 70000;

#Find employees who work in the IT or Finance department.
SELECT emp_id,emp_name,job_title,dept_id,salary FROM Employees WHERE dept_id = 2 OR dept_id = 3;

#Show employees whose name starts with the letter ‘A’.
SELECT emp_name,job_title FROM Employees WHERE emp_name LIKE 'A%';

#List employees who have not received any bonus (bonus = 0).
SELECT 
	e.emp_name, e.job_title, s.Bonus 
FROM 
	Employees e , salary s 
JOIN
	Employees
ON 
	salary
WHERE
	s.Bonus = 0;

#Display employees whose total salary is greater than 75,000.
SELECT 
	emp_name,job_title,dept_id,salary
FROM 
	Employees
WHERE
	salary > 75000;

-- Joins and Relationships

#Display each employee’s name along with their department name
SELECT
	e.emp_id,e.emp_name,d.dept_id,d.dept_name 
FROM
	departments d, employees e
WHERE
	d.dept_id = e.dept_id;
    
#Show the employee name, department name, and total salary.
SELECT 
	e.emp_id,e.emp_name,d.dept_name,s.total_salary 
FROM
	Employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id;

#Find employees working in the HR department and show their total salary.
SELECT 
	e.emp_id,e.emp_name,d.dept_name,d.dept_id,s.total_salary
FROM 
	employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id
WHERE dept_name = 'HR';

#Display employees along with their bonus amounts using INNER JOIN.
SELECT 
	e.emp_id, e.emp_name, e.job_title,e.salary,s.Bonus
FROM 
	Employees e
INNER JOIN salary s ON e.emp_id = s.emp_id;

#Retrieve all departments and the employees working in them (including departments with no employees) using LEFT JOIN.
SELECT 
	d.dept_id, d.dept_name, e.emp_name
FROM 
	Employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- Aggregation and Grouping

#Find the total number of employees in each department.
SELECT 
	COUNT(e.emp_id), d.dept_name 
FROM
	departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY
	dept_name;

#Display the average salary in each department.
SELECT
	ROUND(AVG(s.total_salary),2) AS Avg_salary,
    d.dept_name
FROM 
	Employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

#Show the department with the highest average salary.
SELECT 
	ROUND(AVG(s.total_salary),2) AS AVG_SAL,
    d.dept_name
FROM 
	Employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY d.dept_name LIMIT 1;

#Find the maximum, minimum, and average salary of all employees.
SELECT 
	 e.emp_id,
    e.emp_name,
    d.dept_id,
	MAX(s.total_salary) AS MAX_SAL,
	ROUND(AVG(s.total_salary),2) AS AVG_SAL,
    MIN(s.total_salary) AS MIN_SAL
FROM 
	Employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY e.emp_name, e.emp_id, d.dept_id ;

#Display the total number of employees who joined each year (group by hire year).
SELECT
	YEAR(hire_date) As hire_year,
	COUNT(emp_id) AS total_employees
FROM employees 
GROUP BY hire_date
ORDER BY year(hire_date);
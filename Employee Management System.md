# Employee Management System (SQL Project)

This project contains SQL scripts for an **Employee Management System** — designed to manage employee records, departments, salaries, and related data efficiently.

---

## **Project Contents**

**File:** `Employee Management System.sql`

This SQL file includes:
- Database and table creation scripts  
- Data insertion statements  
- Queries for data retrieval and analysis  
- Aggregate functions (AVG, MAX, MIN, COUNT, etc.)  
- Join operations between Employees, Departments, and Salary tables  

---

## **Key SQL Concepts Used**

- **CREATE TABLE** – to define database structure  
- **INSERT INTO** – to add sample records  
- **JOIN** – to combine data from multiple tables  
- **GROUP BY** – to group records logically  
- **Aggregate Functions:**
  - `COUNT()` – to count employees per department or year  
  - `AVG()` – to find average salaries  
  - `MIN()` / `MAX()` – to get salary range  
  - `ROUND()` – to format average results  
- **ORDER BY** – to sort data  
- **WHERE** – to filter records  

---

## **Example Queries**

###  1. Average Salary by Department
```sql
SELECT 
    d.dept_name,
    ROUND(AVG(s.total_salary), 2) AS avg_salary
FROM 
    employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;
```
##  Employee Salary Statistics (SQL Query)

This project demonstrates how to retrieve **salary statistics** — such as maximum, average, and minimum salary — for each employee using SQL aggregate functions.

---

## **Concepts Covered**
- Aggregate Functions:
  - `MAX()` → Finds the **highest salary** of an employee.
  - `AVG()` → Calculates the **average salary**.
  - `MIN()` → Finds the **lowest salary**.
- `ROUND()` → Used to format the average salary to two decimal places.
- `GROUP BY` → Groups results by employee to perform calculations per person.
- `JOIN` → Combines data from multiple related tables.

---

##  **SQL Query**
```sql
SELECT 
    e.emp_id,
    e.emp_name,
    MAX(s.total_salary) AS max_sal,
    ROUND(AVG(s.total_salary), 2) AS avg_sal,
    MIN(s.total_salary) AS min_sal
FROM 
    employees e
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;
```
## Employees Joined Per Year (SQL Query)

This query displays the **total number of employees** who joined in each year, based on their hire date.

---

##  **Concepts Used**
- **`YEAR()`** → Extracts the year from the `hire_date`.
- **`COUNT()`** → Counts how many employees joined in that year.
- **`GROUP BY`** → Groups employees by year.
- **`ORDER BY`** → Sorts the results in ascending order of years.

---

##  **SQL Query**
```sql
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(emp_id) AS total_employees
FROM 
    employees
GROUP BY 
    YEAR(hire_date)
ORDER BY 
    hire_year;
```
# How It Works

The **YEAR(hire_date)** extracts the year from each employee’s hiring date.

**COUNT(emp_id)** calculates how many employees joined in that year.

The **GROUP BY** statement groups results by each unique year.

The **ORDER BY hire_year** sorts results chronologically.

---

##  Tools Used

- MySQL Workbench or any SQL editor  
- Works in most relational databases with the YEAR() function  

---

##  Author

**Chaithanya S**  
🎓 B.Sc. in Mathematics & Computer Science  
💡 Passionate about SQL, Data Analysis, and Database Management
"""
[Project file]([https://classroom.google.com/c/NzUxOTY2MDI4NTM0/m/Nzg5NDc0NDkwNTkz/details](https://github.com/cspoojary/Structured-Query-Language-Projects/blob/main/Employee%20Management%20System.sql))

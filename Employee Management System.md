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

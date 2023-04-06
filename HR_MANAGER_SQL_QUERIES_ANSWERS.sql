use sql_hr;

-- This query counts the number of rows in the employee table, which represents the number of employees in the company
SELECT COUNT(*)
FROM employees;

-- This query calculates the average salary for each job title by grouping the employees by job title and taking the average of the salary column
SELECT job_title, AVG(salary)
FROM employees
GROUP BY job_title;


-- This query counts the number of employees who report to each manager by grouping the employees by the manager's name and counting the number of employees in each group
SELECT reports_to, COUNT(*)
FROM employees
GROUP BY reports_to;


-- This query calculates the total salary budget for each team by grouping the employees by the manager's name and summing the salary column for each group
SELECT reports_to, SUM(salary)
FROM employees
GROUP BY reports_to;


-- This query counts the number of employees in each office by joining the employee and office tables on the office_id column and grouping the results by office_id
-- It then orders the results by the number of employees in each office in descending order and returns the top result
SELECT offices.office_id, COUNT(*)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY offices.office_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- This query calculates the average salary for each office by joining the employee and office tables on the office_id column and grouping the results by office_id
-- It then orders the results by the average salary in each office in descending order and returns the top result
SELECT offices.office_id, AVG(salary)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY offices.office_id
ORDER BY AVG(salary) DESC
LIMIT 1;


-- This query selects the employee_id, name, and salary of all employees and orders the results by salary in descending order
-- It then returns the top results
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 10;


-- This query counts the number of employees who are not assigned to an office by checking for null values in the office_id column
SELECT COUNT(*)
FROM employees
WHERE office_id IS NULL;


-- This query counts the number of employees in each job title by grouping the employees by job title and counting the number of employees in each group
SELECT job_title, COUNT(*)
FROM employees
GROUP BY job_title;


-- This query calculates the minimum, maximum, and average salary for each job title by grouping the employees by job title and using the MIN, MAX, and AVG functions on the salary column
SELECT job_title, MIN(salary), MAX(salary), AVG(salary)
FROM employees
GROUP BY job_title;


-- This query counts the number of employees in each office by joining the employee and office tables on the office_id column and grouping the results by office_id
SELECT offices.office_id, COUNT(*)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY offices.office_id;


-- This query selects the employee_id, name, and job_title of all employees and groups them by the manager's name
SELECT reports_to, employee_id, first_name, last_name, job_title 
FROM employees
ORDER BY reports_to;


-- This query calculates the total salary budget for each office by joining the employee and office tables on the office_id column and grouping the results by office_id
-- It then sums the salary column for each group
SELECT offices.office_id, SUM(salary)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY offices.office_id;


-- This query calculates the total salary budget for each office by joining the employee and office tables on the office_id column and grouping the results by office_id
-- It then orders the results by the total salary budget in each office in descending order and returns the top result
SELECT offices.office_id, SUM(salary)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY offices.office_id
ORDER BY SUM(salary) DESC
LIMIT 1;


-- This query selects the employee_id, name, and salary of all employees and orders the results by salary in descending order within each job title
-- It then returns the top result for each job title
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees e WHERE e.job_title = employees.job_title)
ORDER BY job_title, salary DESC;


-- This query counts the number of employees in each city by joining the employee and office tables on the office_id column and grouping the results by city
SELECT city, COUNT(*)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY city;


-- This query calculates the minimum, maximum, and average salary for employees in each city by joining the employee and office tables on the office_id column and grouping the results by city
-- It then uses the MIN, MAX, and AVG functions on the salary column for each group
SELECT city, MIN(salary), MAX(salary), AVG(salary)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY city;


-- This query selects the employee_id, name, and job_title of all employees who work in each city by joining the employee and office tables on the office_id column and grouping the results by city
SELECT city, employee_id, first_name, last_name, job_title
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY city;


-- This query counts the number of employees in each state by joining the employee and office tables on the office_id column and grouping the results by state
SELECT state, COUNT(*)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY state;


-- This query calculates the total salary budget for each state by joining the employee and office tables on the office_id column and grouping the results by state
-- It then sums the salary column for each group
SELECT state, SUM(salary)
FROM employees
JOIN offices
ON employees.office_id = offices.office_id
GROUP BY state;


-- This query calculates the total salary budget for each state by joining the employee and office tables on the office_id column and grouping the results by state
-- It then orders the results by the total salary budget in each state in descending order and returns the top result
SELECT d.state, SUM(c.salary)
FROM employees as c
JOIN offices as d
ON c.office_id = d.office_id
GROUP BY d.state
ORDER BY SUM(c.salary) DESC
LIMIT 1;


-- This query calculates the minimum, maximum, and average salary for employees in each department by grouping the employees by department and using the MIN, MAX, and AVG functions on the salary column
SELECT job_title, MIN(salary), MAX(salary), AVG(salary)
FROM employees
GROUP BY job_title;


-- This query counts the number of employees who report to each manager within each department by grouping the employees by department and manager and counting the number of employees in each group
SELECT job_title, reports_to, COUNT(*)
FROM employees
GROUP BY job_title, reports_to;


-- This query calculates the total salary budget for each team within each department by grouping the employees by department and manager and summing the salary column for each group
SELECT job_title, reports_to, sum(salary)
FROM employees
GROUP BY job_title, reports_to;

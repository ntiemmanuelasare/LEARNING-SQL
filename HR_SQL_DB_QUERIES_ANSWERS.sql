-- use the sql_hr database from the Schemas 
USE sql_hr;
-- ------------------------------------------------------------------------------------
-- a selected number of columns from the employees table.
SELECT first_name,last_name,employee_id,office_id 
FROM employees;  

-- selects all columns from the offices table 
SELECT *
FROM offices;

-- select only distinct values from the employees table 
SELECT DISTINCT *
FROM employees;

-- select the first name, last name, job title ,salary ,office_id for only VP Marketing 
SELECT last_name,first_name,job_title,salary,office_id 
FROM employees 
WHERE job_title= 'VP Marketing' ;

-- select the first name, last name, job title ,salary ,office_id for employees with office id 1 
SELECT last_name,first_name,job_title,salary,office_id 
FROM employees 
WHERE office_id= 1 ;

-- select the first name, last name, job title ,salary ,office_id for employees with office id at least 1
SELECT last_name,first_name,job_title,salary,office_id 
FROM employees 
WHERE office_id >= 1 ;

-- select the first name, last name, job title ,salary ,office_id for employees with office id between 1 and 5
SELECT last_name,first_name,job_title,salary,office_id 
FROM employees 
WHERE office_id BETWEEN 1 AND 5 ;

-- select the first name, last name, job title ,salary ,office_id for employees with first name starting with a  
SELECT last_name,first_name,job_title,salary,office_id 
FROM employees 
WHERE first_name LIKE 'a%' ;

-- select the first name, last name, job title ,salary ,where title is assistant professor or vp marketing 
SELECT last_name,first_name,job_title,salary,office_id 
FROM employees 
WHERE job_title= 'VP Marketing' OR job_title= 'Assistant Professor' ;

-- select all columns ,where title is assistant professor 0r job title is 1 , 4 ,5 
SELECT *
FROM employees 
WHERE job_title= 'VP Marketing' OR office_id IN (1,4,5) ;

-- select all columns ,where title is not assistant professor 0r job title is NOT  1 , 4 ,5 
SELECT *
FROM employees 
WHERE NOT job_title= 'VP Marketing' OR office_id IN (1,4,5) ;

-- select all columns ,where title is not assistant professor 0r job title is NOT  1 , 4 ,5 , order by first name in ascending order  
SELECT *
FROM employees 
WHERE NOT job_title= 'VP Marketing' OR office_id IN (1,4,5) 
ORDER BY first_name ASC;

-- select all columns ,where title is not assistant professor 0r job title is NOT  1 , 4 ,5 , order by first name in DEScending order  
SELECT *
FROM employees 
WHERE NOT job_title= 'VP Marketing' OR office_id IN (1,4,5) 
ORDER BY first_name DESC;

-- ------------------------------------------------------------------------------------------

-- a new employee has joined the company insert his name into the employee table 
-- with first name as Emmanuel , last name as Nti ,employee_id as 45678 office id as 1

INSERT INTO employees (last_name,first_name,employee_id,office_id,job_title,salary,reports_to)
VALUES ('Nti','Emmanuel',45678,1,'junior data analyst',2500,33391);

-- see the updated table  
SELECT *
FROM employees;

--  select all columns of employees but make sure that every employee has someone they report to 
SELECT *
FROM employees 
WHERE reports_to IS NOT NULL ;

-- -------------------------------------------------------------------------------
-- there is a problem with the salary of Nti Emmanuel . His actual salary is 3400 

UPDATE employees 
SET salary=3400 
WHERE last_name='Nti' AND first_name='Emmanuel' ;

SELECT *
FROM employees ;
-- ----------------------------------------------------------------------------------
-- Mindy Crissil quit the job , delete his name from the employee list. but becareful 
DELETE FROM employees 
WHERE first_name='Mindy' AND last_name='Crissil';

SELECT *
FROM employees ;

-- --------------------------------------------------------------------------
-- find the top 3 highest paid workers in the company 
SELECT *
FROM employees 
ORDER BY salary DESC
LIMIT 3;


-- find the 5 least paid workers  in the company 
SELECT *
FROM employees 
ORDER BY salary ASC
LIMIT 5;

-- ---------------------------------------------------------------------------------
-- WHAT IS THE LEAST PAID SALARY 
SELECT MIN(salary) AS leastpaidworker
FROM employees;

-- WHAT IS THE HIGHEST PAID SALARY 
SELECT MAX(salary) AS highestpaidworker
FROM employees;

-- ---------------------------------------------------------------------------------------
-- which represents the number of employees in the company
SELECT COUNT(*)
FROM employees; 

-- This query counts the number of employees in each job title  by grouping the employees by department and counting the number of employees in each group
SELECT job_title, COUNT(*)
FROM employees
GROUP BY job_title;

--  count the number of employees who report to each manager by grouping the employees by the manager's name and counting the number of employees in each group
SELECT reports_to AS managers , COUNT(*) AS employees
FROM employees
GROUP BY reports_to;


-- This query counts the number of employees who are not assigned to an office by checking for null values in the office_id column
SELECT COUNT(*)
FROM employees
WHERE office_id IS NULL;


-- This query counts the number of employees who are not assigned to a SUPERVISOR by checking for null values in the reports_to column
SELECT COUNT(*)
FROM employees
WHERE reports_to IS NULL;


-- This query calculates the average salary for each job title by grouping the employees by job title and taking the average of the salary column
SELECT job_title AS 'JOB POSITION' , AVG(salary) AS 'AVERAGE SALARY'
FROM employees
GROUP BY job_title;

-- This query calculates the total salary budget for each team by grouping the employees by the manager's name and summing the salary column for each group
SELECT reports_to AS 'TEAM LEADER', SUM(salary) AS 'TEAM SALARY BUDGET'
FROM employees
GROUP BY reports_to;



-- ------------------------------------------------------------------------------
-- what is the highest paid person for each job title
-- This query selects the employee_id, name, and salary of all employees and orders the results by salary in descending order within each job title
-- It then returns the top result for each job title
SELECT employee_id, first_name,last_name, salary,job_title
FROM employees
WHERE salary = (SELECT MAX(salary) AS 'HIGHEST SALARY' FROM employees e WHERE e.job_title = employees.job_title)
ORDER BY job_title, salary DESC;

-- This query calculates the minimum, maximum, and average salary for employees in each job title by grouping the employees by job title  and using the MIN, MAX, and AVG functions on the salary column
SELECT job_title, MIN(salary) AS 'LOWEST PAY', MAX(salary) AS 'HIGHEST PAY', AVG(salary) AS 'AVERAGE SALARY'
FROM employees
GROUP BY job_title;

-- ------------------------------------------------------------------------------------------------
-- select all employees whose last name start with the letter a 
SELECT *
 FROM employees
WHERE last_name LIKE 'a%';

-- select all employees whose first name ends with the letter a 
SELECT *
 FROM employees
WHERE last_name LIKE '%a';

-- --------------------------------------------------------------------------------------
-- Select the full name and job title of all employees 
SELECT  CONCAT(first_name,' ', last_name) AS 'Full Name', job_title AS 'Job Position'
 FROM employees;
 
 
 
 
 
 -- --------------------------------------------------------------------------------------
 --                                       SELECTING FROM TWO OR MORE TABLES  ( JOIN)
 -- ----------------------------------------------------------------------------------------------
 --  counts the number of employees in each office (GROUP BY)
SELECT offices.office_id, COUNT(*)           -- office_id column from offices table 
FROM employees                               -- left table is employees tables 
JOIN offices                                 -- join with offices table .  INNER JOIN, which only returns rows that have matching values in both tables.
ON employees.office_id = offices.office_id   --  based on a related column between them. ie office_id
GROUP BY offices.office_id                   -- group the employees by office_id
ORDER BY COUNT(*) DESC ;                       -- order the employees in each office in descending order 
-- LIMIT 1;                                  -- the office with the highest employees 



 --  calculates the average salary for each office (GROUP BY OFFICE)
SELECT offices.office_id, AVG(salary)           -- office_id column from offices table ,AVERAGE salary column from employee
FROM employees                               -- left table is employees tables 
JOIN offices                                 -- join with offices table .  INNER JOIN, which only returns rows that have matching values in both tables.
ON employees.office_id = offices.office_id   --  based on a related column between them. ie office_id
GROUP BY offices.office_id                   -- group the employees by office_id
ORDER BY AVG(salary) DESC;                     -- order the employees in each office in descending order 
-- LIMIT 1;                                  -- the office with the highest average salary 


-- calculates the total salary budget for each office (GROUP BY OFFICE )

SELECT offices.office_id, SUM(salary)           -- office_id column from offices table ,TOTAL salary column from employee
FROM employees                               -- left table is employees tables 
JOIN offices                                 -- join with offices table .  INNER JOIN, which only returns rows that have matching values in both tables.
ON employees.office_id = offices.office_id   --  based on a related column between them. ie office_id
GROUP BY offices.office_id                   -- group the employees by office_id
ORDER BY SUM(salary) DESC;                     -- order the employees in each office in descending order 
-- LIMIT 1;  

-- calculates the total MAX SALARY, MINIMUM SALARY AND AVERAGE for each office (GROUP BY OFFICE )

SELECT offices.office_id, MIN(salary), MAX(salary), AVG(salary)          -- office_id column from offices table ,TOTAL salary column from employee
FROM employees                               -- left table is employees tables 
JOIN offices                                 -- join with offices table .  INNER JOIN, which only returns rows that have matching values in both tables.
ON employees.office_id = offices.office_id   --  based on a related column between them. ie office_id
GROUP BY offices.office_id                   -- group the employees by office_id
ORDER BY offices.office_id DESC;                     -- order the employees in each office in descending order 
-- LIMIT 1; 



 
 
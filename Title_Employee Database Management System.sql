-- This will create a new database called 'employee_db'
CREATE DATABASE employee_db;

-- This will switch to the 'employee_db' database
USE employee_db;

-- This will create a new table called 'employees' with the specified columns
CREATE TABLE employees (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255),
  salary DECIMAL(10, 2),
  department_id INT
);
INSERT INTO employees (first_name, last_name, email, phone, salary, department_id)
VALUES
  ('John', 'Doe', 'john.doe@company.com', '555-555-5555', 70000, 1),
  ('Jane', 'Smith', 'jane.smith@company.com', '555-555-5556', 80000, 2),
  ('Bob', 'Johnson', 'bob.johnson@company.com', '555-555-5557', 60000, 3);

-- This is a simple SQL query that selects all rows from the 'employees' table
-- and orders the results by the 'last_name' column in ascending order
SELECT * FROM employees ORDER BY last_name ASC;

-- This query selects only the 'first_name', 'last_name', and 'salary' columns
-- from the 'employees' table, and filters the results to only include
-- employees with a salary greater than $50,000
SELECT first_name, last_name, salary FROM employees WHERE salary > 50000;

-- This query uses a join to retrieve data from two tables: 'employees' and 'departments'
-- It selects the 'first_name', 'last_name', and 'department_name' columns, and matches
-- rows from the two tables based on the 'department_id' column

-- Create the 'departments' table
CREATE TABLE departments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(255) NOT NULL,
  manager_id INT
);

-- Insert rows into the 'departments' table
INSERT INTO departments (department_name, manager_id)
VALUES
  ('Marketing', 1001),
  ('Sales', 1002),
  ('Support', 1003);

-- Verify that the rows were inserted correctly
SELECT * FROM departments;


SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.id;

-- This query updates the 'salary' column for a specific employee
-- It uses the 'WHERE' clause to specify which employee to update
UPDATE employees
SET salary = 55000
WHERE id = 1001;

-- This query deletes a specific employee from the 'employees' table
-- It uses the 'WHERE' clause to specify which employee to delete
DELETE FROM employees WHERE id = 1002;

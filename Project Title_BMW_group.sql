-- Project Brief:

-- The BMW Group is looking to improve its data analysis capabilities and has
 -- hired a data analyst to help with this effort. The data analyst will be responsible
 -- for creating and maintaining a database for the BMW Group, as well as creating tables 
 -- and filling in rows with data. The ultimate goal of this project is to enable the BMW 
 -- Group to better understand and analyze its data, in order to make informed business decisions.

-- SQL Coding:

-- Create a new database for the BMW Group
CREATE DATABASE bmw_group;
USE bmw_group;
-- Create a table to store information about vehicles sold by the BMW Group
CREATE TABLE vehicles (
vehicle_id INT PRIMARY KEY, -- unique identifier for each vehicle
model VARCHAR(255), -- name of the model of the vehicle
year INT, -- year the vehicle was produced
price DECIMAL(10,2) -- price of the vehicle
);

-- Insert data into the vehicles table
INSERT INTO vehicles (vehicle_id, model, year, price)
VALUES (1, '3 Series', 2020, 45000),
(2, '5 Series', 2020, 55000),
(3, 'X3', 2020, 40000),
(4, 'X5', 2020, 60000);

-- Create a table to store information about the customers of the BMW Group
CREATE TABLE customers (
customer_id INT PRIMARY KEY, -- unique identifier for each customer
name VARCHAR(255), -- name of the customer
address VARCHAR(255), -- address of the customer
phone VARCHAR(20) -- phone number of the customer
);

-- Insert data into the customers table
INSERT INTO customers (customer_id, name, address, phone)
VALUES (1, 'John Smith', '123 Main St', '123-456-7890'),
(2, 'Jane Doe', '456 Oak Ave', '456-789-0123'),
(3, 'Bob Johnson', '789 Birch St', '789-012-3456');

-- Create a table to store information about the sales of vehicles by the BMW Group
CREATE TABLE sales (
sale_id INT PRIMARY KEY, -- unique identifier for each sale
vehicle_id INT, -- foreign key referencing the vehicles table
customer_id INT, -- foreign key referencing the customers table
sale_date DATE, -- date of the sale
sale_price DECIMAL(10,2), -- price of the sale
FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into the sales table
INSERT INTO sales (sale_id, vehicle_id, customer_id, sale_date, sale_price)
VALUES (1, 1, 1, '2020-01-01', 45000),
(2, 2, 2, '2020-01-05', 55000),
(3, 3, 3, '2020-01-10', 40000),
(4, 4, 1, '2020-01-15', 60000);

-- Retrieve all data from the sales table
SELECT * FROM sales;

-- Retrieve data from the sales table with a specific sale_id
SELECT * FROM sales WHERE sale_id = 3;

DROP DATABASE bmw_group;
-- Introduction to SQL
-- SQL stands for Structured Query Language
-- SQL lets you access and manipulate databases.

-- SQL is a language that is used to communicate with relational database management systems
-- RDMS is just a sotware application which we can use to create and manage different databases.
-- examples of RDMS is mysql , 

-- What Can SQL do?
-- SQL can execute queries against a database
-- SQL can retrieve data from a database
-- SQL can insert records in a database
-- SQL can update records in a database
-- SQL can delete records from a database
-- SQL can create new databases
-- SQL can create new tables in a database
-- SQL can create stored procedures in a database
-- SQL can create views in a database
-- SQL can set permissions on tables, procedures, and views

-- they all support at least the major commands (such as SELECT, UPDATE, DELETE, INSERT, WHERE) in a similar manner.

-- To build a web site that shows data from a database, you will need:
-- An RDBMS database program (i.e. MS Access, SQL Server, MySQL)
-- To use SQL to get the data you want

-- RDBMS stands for Relational Database Management System.
-- The data in RDBMS is stored in database objects called tables. A table is a collection of related data entries and it consists of columns and rows.
-- A database most often contains one or more tables. Each table is identified by a name (e.g. "Customers" or "Orders"). Tables contain records (rows) with data.
-- A primary key is an attribute that uniquely defines the rows in the database. 

-- A foreign key is when a primary key(unique) of a table is a column in another table with its own primary key .
-- eg. branch id is the primary key in the branch table . the branch id becomes the a foreign key in the employees table with employee_id as the primary id 
-- SQL keywords are NOT case sensitive: select is the same as SELECT
-- ; Semicolon is the standard way to separate each SQL statement in database systems that allow more than one SQL statement to be executed in the same call to the server.
-- --------------------------------------------------------------------------------------
-- Single Line Comments
-- Single line comments start with --

-- Multi-line Comments
-- Multi-line comments start with /* and end with */.
-- Any text between /* and */ will be ignored.




-- -----------------------------------------------------------------------------------
-- Some of The Most Important SQL Commands
-- SELECT - extracts data from a database
-- UPDATE - updates data in a database
-- DELETE - deletes data from a database
-- INSERT INTO - inserts new data into a database
-- CREATE DATABASE - creates a new database
-- ALTER DATABASE - modifies a database
-- CREATE TABLE - creates a new table
-- ALTER TABLE - modifies a table
-- DROP TABLE - deletes a table
-- CREATE INDEX - creates an index (search key)
-- DROP INDEX - deletes an index


-- --------------------------------------------------------------------
-- The SELECT statement is used to select data from a database.
-- SELECT syntax
 
-- SELECT column1, column2, ... # specify the columns 
-- FROM table_name;
-- Example
-- SELECT CustomerName, City FROM Customers;
-- SELECT * FROM table_name;  #	selects all columns 

-- The SELECT DISTINCT statement is used to return only distinct (different) values.

-- Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

-- SELECT DISTINCT Syntax
-- SELECT DISTINCT column1, column2, ...
-- FROM table_name;


-- The WHERE clause is used to filter records
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition; # what what it filter 

-- Example
-- SELECT * FROM Customers
-- WHERE Country='Mexico';

-- Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!

-- SQL requires single quotes around text values
-- However, numeric fields should not be enclosed in quotes:
-- Example
-- SELECT * FROM Customers
-- WHERE CustomerID=1;

-- Operator	Description	Example

-- =	Equal	
-- >	Greater than	
-- <	Less than	
-- >=	Greater than or equal	
-- <=	Less than or equal	
-- <>	Not equal. Note: In some versions of SQL this operator may be written as !=	
-- BETWEEN	Between a certain range	
-- LIKE	Search for a pattern	
-- IN	To specify multiple possible values for a column


-- --------------------------------------------------------------------------------------
-- The AND operator displays a record if all the conditions separated by AND are TRUE.
-- The OR operator displays a record if any of the conditions separated by OR is TRUE.

-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition1 AND condition2 AND condition3 ...;

-- SELECT * FROM Customers
-- WHERE Country='Germany' AND City='Berlin';

-- The IN operator is a shorthand for multiple OR conditions.
-- The following SQL statement selects all customers that are located in "Germany", "France" or "UK":

-- Example
-- SELECT * FROM Customers
-- WHERE Country IN ('Germany', 'France', 'UK');

-- SELECT * FROM Products
-- WHERE Price BETWEEN 10 AND 20;



-- SELECT * FROM Customers
-- WHERE NOT Country='Germany'; # where the country is not germany

-- ------------------------------------------------------------------------------------
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.
-- ORDER BY Syntax
-- SELECT column1, column2, ...
-- FROM table_name
-- ORDER BY column1, column2, ... ASC|DESC;

-- Example
-- SELECT * FROM Customers
-- ORDER BY Country ASC, CustomerName DESC;
-- ---------------------------------------------------------------------------------------
-- The INSERT INTO statement is used to insert new records in a table.
-- 1. Specify both the column names and the values to be inserted:
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

-- Example
-- INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
-- ------------------------------------------------------------------------------------------

-- A field with a NULL value is a field with no value.
-- SELECT column_names
-- FROM table_name
-- WHERE column_name IS NOT NULL; / not empty 	

-- Example
-- SELECT CustomerName, ContactName, Address
-- FROM Customers
-- WHERE Address IS NOT NULL;

-- ----------------------------------------------------------------------------------
-- The UPDATE statement is used to modify the existing records in a table.

-- UPDATE Syntax
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;

-- Example
-- UPDATE Customers
-- SET ContactName='Juan'
-- WHERE Country='Mexico';

-- ---------------------------------------------------------------------------------
-- DELETE FROM table_name WHERE condition;
-- Note: Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. The WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in the table will be deleted!
-- Example
-- DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
-- -------------------------------------------------------------------------------------
-- The LIMIT selects the first three records from the "Customers" table
-- Example
-- SELECT * FROM Customers
-- LIMIT 3;

-- ---------------------------------------------------------------------------------------
-- MIN() Example
-- The following SQL statement finds the price of the cheapest product:

-- Example
-- SELECT MIN(Price) AS SmallestPrice
-- FROM Products;

-- SELECT MAX(Price) AS LargestPrice
-- FROM Products; / expensive price 

-- ------------------------------------------------------
-- The SQL COUNT(), AVG() and SUM() Functions
-- The COUNT() function returns the number of rows that matches a specified criterion.
-- The AVG() function returns the average value of a numeric column.
-- The SUM() function returns the total sum of a numeric column. 
-- -----------------------------------------------------------------------------------
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
-- LIKE Operator	Description
-- WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
-- WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
-- WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position

-- Example
-- SELECT * FROM Customers
-- WHERE CustomerName LIKE '%or%';

-- ------------------------------------------------------------------------------------
-- SQL aliases are used to give a table, or a column in a table, a temporary name.
-- An alias is created with the AS keyword.

-- Example
-- SELECT CustomerID AS ID, CustomerName AS Customer
-- FROM Customers;

-- The following SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):
-- SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
-- FROM Customers;

-- --------------------------------------------------
-- Alias for Tables Example
--  The following SQL statement is the same as above, but without aliases:
-- SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
-- FROM Customers, Orders
-- WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;

-- The following SQL statement is the same as above, but with aliases:
-- We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o"

-- SELECT o.OrderID, o.OrderDate, c.CustomerName
-- FROM Customers AS c, Orders AS o
-- WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

-- ------------------------------------------------------------------------------
-- SQL JOIN 
-- ---------------------------------------------------------------------------------

-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
-- THE RELATE COLUMN IN THE TABLES CANBE CUSTOMER ID, PERSONAL ID ETC ,
-- Example
-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- THERE ARE TWO TABLES ABOVE IE THE ORDER AND THE CUSTOMERS TABLE 
-- WITH THE NEW TABLE , YOU WANT ORDERID AND ORDERDATE AND CUSTOMERNAME FROM THE VARIOUS TABLE 
-- from the oders table , inner join with customers table, on the related column customerid from orders and customers 

-- Different Types of SQL JOINs
-- Here are the different types of the JOINs in SQL:

-- (INNER) JOIN: Returns records that have matching values in both tables // matching records from the related columns in both table
-- LEFT JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table


-- SELECT Customers.CustomerName, Orders.OrderID
-- FROM Customers
-- LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
-- ORDER BY Customers.CustomerName;

-- --------------------------------------------------------------------------------------------------
-- The SQL UNION Operator
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
-- Every SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order
-- The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

-- Example
-- SELECT City FROM Customers
-- UNION
-- SELECT City FROM Suppliers
-- ORDER BY City;             // combines distinct results of city in asc order from both orders and customers table 

-- Example with Alias 
-- ----------------------------------------------------------
-- SELECT 'Customer' AS Type, ContactName, City, Country
-- FROM Customers
-- UNION
-- SELECT 'Supplier' AS Type, ContactName, City, Country
-- FROM Suppliers;

-- SQL UNION ALL With WHERE
-- --------------------------------------------------------- -------
-- SELECT City, Country FROM Customers
-- WHERE Country='Germany'
-- UNION ALL
-- SELECT City, Country FROM Suppliers
-- WHERE Country='Germany'
-- ORDER BY City;

-- -----------------------------------------------------------------------------
-- The SQL GROUP BY Statement

-- The GROUP BY statement groups rows that have the same values into summary rows, 
-- like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) 
--  to group the result-set by one or more columns.
-- GROUP BY Syntax
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- ORDER BY column_name(s);

-- The following SQL statement lists the number of customers in each country:
-- SELECT COUNT(CustomerID), Country
-- FROM Customers
-- GROUP BY Country;

-- -----------------------------------------------------------------------------
-- The following SQL statement lists the number of orders sent by each shipper:
-- Example
-- SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
-- LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
-- GROUP BY ShipperName;


-- ------------------------------------------------------------------------------------
-- The SQL HAVING Clause
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

-- The following SQL statement lists the number of customers in each country, sorted high to low 
-- (Only include countries with more than 5 customers):

-- Example
-- SELECT COUNT(CustomerID), Country
-- FROM Customers
-- GROUP BY Country
-- HAVING COUNT(CustomerID) > 5
-- ORDER BY COUNT(CustomerID) DESC;

-- The following SQL statement lists the employees that have registered more than 10 orders:
-- Example

-- SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
-- FROM (Orders
-- INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
-- GROUP BY LastName
-- HAVING COUNT(Orders.OrderID) > 10;



-- The following SQL statement lists if the employees "Davolio" or "Fuller" have registered more than 25 orders:
-- Example
-- SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
-- FROM Orders
-- INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
-- WHERE LastName = 'Davolio' OR LastName = 'Fuller'
-- GROUP BY LastName
-- HAVING COUNT(Orders.OrderID) > 25;


-- ----------------------------------------------------------------------
-- having a query under a query is called sub-query 
-- if the sub-query exists or is true , then return the main query 
-- more like return this query where there the sub-query exists 

-- The SQL EXISTS Operator
-- The EXISTS operator is used to test for the existence of any record in a subquery.
-- The EXISTS operator returns TRUE if the subquery returns one or more records.

-- SELECT column_name(s)
-- FROM table_name
-- WHERE EXISTS
-- (SELECT column_name FROM table_name WHERE condition);

-- SQL EXISTS Examples
-- The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:

-- SELECT SupplierName
-- FROM Suppliers
-- WHERE EXISTS 
-- (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

-- ----------------------------------------------------------------------------------------
-- The SQL ANY and ALL Operators
-- The ANY and ALL operators allow you to perform a comparison between a single column value and a range of other values.

-- The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10 (this will return TRUE because the Quantity column has some values of 10):

-- Example
-- SELECT ProductName
-- FROM Products
-- WHERE ProductID = ANY
--   (SELECT ProductID
--  FROM OrderDetails
--  WHERE Quantity = 10);


-- ----------------------------------------------------------------------------------
-- The SQL SELECT INTO Statement
-- The SELECT INTO statement copies data from one table into a new table. Emphasis is on new table.

-- Copy all columns into a new table:
-- SELECT *
-- INTO newtable [IN externaldatabase]
-- FROM oldtable
-- WHERE condition;

-- Copy only some columns into a new table:
-- SELECT column1, column2, column3, ...
-- INTO newtable [IN externaldb]
-- FROM oldtable
-- WHERE condition;

-- The following SQL statement creates a backup copy of Customers:
-- SELECT * INTO CustomersBackup2017
-- FROM Customers;

-- The following SQL statement uses the IN clause to copy the table into a new table in another database:
-- SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
-- FROM Customers;

-- The following SQL statement copies only a few columns into a new table:
-- SELECT CustomerName, ContactName INTO CustomersBackup2017
-- FROM Customers;

-- The following SQL statement copies only the German customers into a new table:
-- SELECT * INTO CustomersGermany
-- FROM Customers
-- WHERE Country = 'Germany';

-- The following SQL statement copies data from more than one table into a new table:
-- SELECT Customers.CustomerName, Orders.OrderID
-- INTO CustomersOrderBackup2017
-- FROM Customers
-- LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- -------------------------------------------------------------------------------------
-- The INSERT INTO SELECT statement copies data from one table and inserts it into another table.

-- Copy all columns from one table to another table:
-- INSERT INTO table2
-- SELECT * FROM table1
-- WHERE condition;

-- Copy only some columns from one table into another table:
-- INSERT INTO table2 (column1, column2, column3, ...)
-- SELECT column1, column2, column3, ...
-- FROM table1
-- WHERE condition;

-- the following SQL statement copies "Suppliers" into "Customers" (the columns that are not filled with data, will contain NULL):
-- INSERT INTO Customers (CustomerName, City, Country)
-- SELECT SupplierName, City, Country 
-- FROM Suppliers;

-- The following SQL statement copies only the German suppliers into "Customers":
-- INSERT INTO Customers (CustomerName, City, Country)
-- SELECT SupplierName, City, Country 
-- FROM Suppliers
-- WHERE Country='Germany';



-- ---------------------------------------------------------------------------------------
-- The SQL CASE Expression
-- The CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.
-- If there is no ELSE part and no conditions are true, it returns NULL.
-- CASE Syntax

-- CASE
-- WHEN condition1 THEN result1
-- WHEN condition2 THEN result2
-- WHEN conditionN THEN resultN
-- ELSE result
-- END;

-- Example
-- SELECT OrderID, Quantity,
-- CASE
    -- WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    -- WHEN Quantity = 30 THEN 'The quantity is 30'
    -- ELSE 'The quantity is under 30'
-- END AS QuantityText
-- FROM OrderDetails;

-- The following SQL will order the customers by City. However, if City is NULL, then order by Country:
-- SELECT CustomerName, City, Country
-- FROM Customers
-- ORDER BY
-- (CASE
    -- WHEN City IS NULL THEN Country
    -- ELSE City
-- END);



-- -----------------------------------------------------------------------------------
-- What is a Stored Procedure?
-- A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

-- So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

-- You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

-- Stored Procedure Syntax


-- Stored Procedure Syntax
-- CREATE PROCEDURE procedure_name
-- AS
-- sql_statement
-- GO;


-- Execute a Stored Procedure
-- EXEC procedure_name;

-- CREATE PROCEDURE SelectAllCustomers
-- AS
-- SELECT * FROM Customers
-- GO;

-- EXEC SelectAllCustomers;




-- -------------------------------------------------------------------------------------
/* SQL Comparison Operators
Operator	Description	Example
=	Equal to	
>	Greater than	
<	Less than	
>=	Greater than or equal to	
<=	Less than or equal to	
<>	Not equal to 





SQL Logical Operators
Operator	Description	Example
ALL	TRUE if all of the subquery values meet the condition	
AND	TRUE if all the conditions separated by AND is TRUE	
ANY	TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	TRUE if the subquery returns one or more records	
IN	TRUE if the operand is equal to one of a list of expressions	
LIKE	TRUE if the operand matches a pattern	
NOT	Displays a record if the condition(s) is NOT TRUE	
OR	TRUE if any of the conditions separated by OR is TRUE	
SOME	TRUE if any of the subquery values meet the condition */































-- ------------------------------------------------------------------------------------------
/* The CREATE DATABASE statement is used to create a new SQL database.

CREATE DATABASE databasename; 
SHOW DATABASES; // shows databases 
DROP DATABASE databasename;  // drops a database . But be careful in using this command 

BACKUP DATABASE databasename
TO DISK = 'filepath';        // backs up an existing database into a filepath


Example
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';

---------------------------------------------------------------------------------------

The CREATE TABLE statement is used to create a new table in a database.

Syntax
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
The datatype parameter specifies the type of data the column can hold (e.g. varchar, integer, date, etc.).

Example
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

To add a column in a table, use the following syntax:

ALTER TABLE table_name
ADD column_name datatype;

The following SQL adds an "Email" column to the "Customers" table:

Example
ALTER TABLE Customers
ADD Email varchar(255);

------------------------------------------------------------------------------------------
SQL Constraints
SQL constraints are used to specify rules for the data in a table.

Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.

The following constraints are commonly used in SQL:

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly



------------------------------------------------------------------------------------
SQL NOT NULL Constraint
By default, a column can hold NULL values.

The NOT NULL constraint enforces a column to NOT accept NULL values.

-- Example
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);


Example
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

-------------------------------------------------------------------------------------
SQL UNIQUE Constraint
The UNIQUE constraint ensures that all values in a column are different. eg unique id

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

---------------------------------------------------------------------------------------
The PRIMARY KEY constraint uniquely identifies each record in a table.

Primary keys must contain UNIQUE values, and cannot contain NULL values.

A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
    
    To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

MySQL / SQL Server / Oracle / MS Access:

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);


To drop a PRIMARY KEY constraint, use the following SQL:

MySQL:

ALTER TABLE Persons
DROP PRIMARY KEY;


---------------------------------------------------------------------------------------
The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.

A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.

Notice that the "PersonID" column in the "Orders" table points to the "PersonID" column in the "Persons" table.

The "PersonID" column in the "Persons" table is the PRIMARY KEY in the "Persons" table.

The "PersonID" column in the "Orders" table is a FOREIGN KEY in the "Orders" table.

The FOREIGN KEY constraint prevents invalid data from being inserted into the foreign key column, because it has to be one of the values contained in the parent table.



The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

MySQL:

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-------------------------------------------------------------------------------------------
SQL CHECK Constraint
The CHECK constraint is used to limit the value range that can be placed in a column.

If you define a CHECK constraint on a column it will allow only certain values for this column.

SQL CHECK on CREATE TABLE
The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. The CHECK constraint ensures that the age of a person must be 18, or older:

MySQL:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

-----------------------------------------------------------------------------------------

AUTO INCREMENT Field
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);







-------------------------------------------------------------------------------------------------
SQL Date Data Types
MySQL comes with the following data types for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY


SQL CREATE VIEW Statement
In SQL, a view is a virtual table based on the result-set of an SQL statement.

Example
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);


--------------------------------------------------------------------------------------
SQL Injection
SQL injection is a code injection technique that might destroy your database.

SQL injection is one of the most common web hacking techniques.

SQL injection is the placement of malicious code in SQL statements, via web page input.



Use SQL Parameters for Protection
To protect a web site from SQL injection, you can use SQL parameters.

SQL parameters are values that are added to an SQL query at execution time, in a controlled manner.




ASP.NET Razor Example
txtUserId = getRequestString("UserId");
txtSQL = "SELECT * FROM Users WHERE UserId = @0";
db.Execute(txtSQL,txtUserId);
Note that parameters are represented in the SQL statement by a @ marker.

The SQL engine checks each parameter to ensure that it is correct for its column and are treated literally, and not as part of the SQL to be executed.

Another Example
txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
db.Execute(txtSQL,txtNam,txtAdd,txtCit);
Examples
The following examples shows how to build parameterized queries in some common web languages.

SELECT STATEMENT IN ASP.NET:

txtUserId = getRequestString("UserId");
sql = "SELECT * FROM Customers WHERE CustomerId = @0";
command = new SqlCommand(sql);
command.Parameters.AddWithValue("@0",txtUserId);
command.ExecuteReader();
INSERT INTO STATEMENT IN ASP.NET:

txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
command = new SqlCommand(txtSQL);
command.Parameters.AddWithValue("@0",txtNam);
command.Parameters.AddWithValue("@1",txtAdd);
command.Parameters.AddWithValue("@2",txtCit);
command.ExecuteNonQuery();
INSERT INTO STATEMENT IN PHP:

$stmt = $dbh->prepare("INSERT INTO Customers (CustomerName,Address,City)
VALUES (:nam, :add, :cit)");
$stmt->bindParam(':nam', $txtNam);
$stmt->bindParam(':add', $txtAdd);
$stmt->bindParam(':cit', $txtCit);
$stmt->execute();






----------------------------------------------------------------------------------------
SQL Hosting
If you want your web site to be able to store and retrieve data from a database, your web server should have access to a database-system that uses the SQL language.

If your web server is hosted by an Internet Service Provider (ISP), you will have to look for SQL hosting plans.

The most common SQL hosting databases are MS SQL Server, Oracle, MySQL, and MS Access.




MS SQL Server
Microsoft's SQL Server is a popular database software for database-driven web sites with high traffic.

SQL Server is a very powerful, robust and full featured SQL database system.

Oracle
Oracle is also a popular database software for database-driven web sites with high traffic.

Oracle is a very powerful, robust and full featured SQL database system.

MySQL
MySQL is also a popular database software for web sites.

MySQL is a very powerful, robust and full featured SQL database system.

MySQL is an inexpensive alternative to the expensive Microsoft and Oracle solutions.



--------------------------------------------------------------------------------------------


In MySQL there are three main data types: string, numeric, and date and time.

String Data Types
Data type	Description
CHAR(size)	A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
VARCHAR(size)	A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum string length in characters - can be from 0 to 65535
BINARY(size)	Equal to CHAR(), but stores binary byte strings. The size parameter specifies the column length in bytes. Default is 1
VARBINARY(size)	Equal to VARCHAR(), but stores binary byte strings. The size parameter specifies the maximum column length in bytes.
TINYBLOB	For BLOBs (Binary Large Objects). Max length: 255 bytes
TINYTEXT	Holds a string with a maximum length of 255 characters
TEXT(size)	Holds a string with a maximum length of 65,535 bytes
BLOB(size)	For BLOBs (Binary Large Objects). Holds up to 65,535 bytes of data
MEDIUMTEXT	Holds a string with a maximum length of 16,777,215 characters
MEDIUMBLOB	For BLOBs (Binary Large Objects). Holds up to 16,777,215 bytes of data
LONGTEXT	Holds a string with a maximum length of 4,294,967,295 characters
LONGBLOB	For BLOBs (Binary Large Objects). Holds up to 4,294,967,295 bytes of data
ENUM(val1, val2, val3, ...)	A string object that can have only one value, chosen from a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. The values are sorted in the order you enter them
SET(val1, val2, val3, ...)	A string object that can have 0 or more values, chosen from a list of possible values. You can list up to 64 values in a SET list



Numeric Data Types
Data type	Description
BIT(size)	A bit-value type. The number of bits per value is specified in size. The size parameter can hold a value from 1 to 64. The default value for size is 1.
TINYINT(size)	A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)
BOOL	Zero is considered as false, nonzero values are considered as true.
BOOLEAN	Equal to BOOL
SMALLINT(size)	A small integer. Signed range is from -32768 to 32767. Unsigned range is from 0 to 65535. The size parameter specifies the maximum display width (which is 255)
MEDIUMINT(size)	A medium integer. Signed range is from -8388608 to 8388607. Unsigned range is from 0 to 16777215. The size parameter specifies the maximum display width (which is 255)
INT(size)	A medium integer. Signed range is from -2147483648 Add to Citavi project by ISBN to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)
INTEGER(size)	Equal to INT(size)



Date and Time Data Types
Data type	Description
DATE	A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'
DATETIME(fsp)	A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time
TIMESTAMP(fsp)	A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. Automatic initialization and updating to the current date and time can be specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition





-----------------------------------------------------------------------------------------------
SQL Keywords
Keyword	Description
ADD	Adds a column in an existing table
ADD CONSTRAINT	Adds a constraint after a table is already created
ALL	Returns true if all of the subquery values meet the condition
ALTER	Adds, deletes, or modifies columns in a table, or changes the data type of a column in a table
ALTER COLUMN	Changes the data type of a column in a table
ALTER TABLE	Adds, deletes, or modifies columns in a table
AND	Only includes rows where both conditions is true
ANY	Returns true if any of the subquery values meet the condition
AS	Renames a column or table with an alias
ASC	Sorts the result set in ascending order
BACKUP DATABASE	Creates a back up of an existing database
BETWEEN	Selects values within a given range
CASE	Creates different outputs based on conditions
CHECK	A constraint that limits the value that can be placed in a column
COLUMN	Changes the data type of a column or deletes a column in a table
CONSTRAINT	Adds or deletes a constraint
CREATE	Creates a database, index, view, table, or procedure
CREATE DATABASE	Creates a new SQL database
CREATE INDEX	Creates an index on a table (allows duplicate values)
CREATE OR REPLACE VIEW	Updates a view
CREATE TABLE	Creates a new table in the database
CREATE PROCEDURE	Creates a stored procedure
CREATE UNIQUE INDEX	Creates a unique index on a table (no duplicate values)
CREATE VIEW	Creates a view based on the result set of a SELECT statement
DATABASE	Creates or deletes an SQL database
DEFAULT	A constraint that provides a default value for a column
DELETE	Deletes rows from a table
DESC	Sorts the result set in descending order
DISTINCT	Selects only distinct (different) values
DROP	Deletes a column, constraint, database, index, table, or view
DROP COLUMN	Deletes a column in a table
DROP CONSTRAINT	Deletes a UNIQUE, PRIMARY KEY, FOREIGN KEY, or CHECK constraint
DROP DATABASE	Deletes an existing SQL database
DROP DEFAULT	Deletes a DEFAULT constraint
DROP INDEX	Deletes an index in a table
DROP TABLE	Deletes an existing table in the database
DROP VIEW	Deletes a view
EXEC	Executes a stored procedure
EXISTS	Tests for the existence of any record in a subquery
FOREIGN KEY	A constraint that is a key used to link two tables together
FROM	Specifies which table to select or delete data from
FULL OUTER JOIN	Returns all rows when there is a match in either left table or right table
GROUP BY	Groups the result set (used with aggregate functions: COUNT, MAX, MIN, SUM, AVG)
HAVING	Used instead of WHERE with aggregate functions
IN	Allows you to specify multiple values in a WHERE clause
INDEX	Creates or deletes an index in a table
INNER JOIN	Returns rows that have matching values in both tables
INSERT INTO	Inserts new rows in a table
INSERT INTO SELECT	Copies data from one table into another table
IS NULL	Tests for empty values
IS NOT NULL	Tests for non-empty values
JOIN	Joins tables
LEFT JOIN	Returns all rows from the left table, and the matching rows from the right table
LIKE	Searches for a specified pattern in a column
LIMIT	Specifies the number of records to return in the result set
NOT	Only includes rows where a condition is not true
NOT NULL	A constraint that enforces a column to not accept NULL values
OR	Includes rows where either condition is true
ORDER BY	Sorts the result set in ascending or descending order
OUTER JOIN	Returns all rows when there is a match in either left table or right table
PRIMARY KEY	A constraint that uniquely identifies each record in a database table
PROCEDURE	A stored procedure
RIGHT JOIN	Returns all rows from the right table, and the matching rows from the left table
ROWNUM	Specifies the number of records to return in the result set
SELECT	Selects data from a database
SELECT DISTINCT	Selects only distinct (different) values
SELECT INTO	Copies data from one table into a new table
SELECT TOP	Specifies the number of records to return in the result set
SET	Specifies which columns and values that should be updated in a table
TABLE	Creates a table, or adds, deletes, or modifies columns in a table, or deletes a table or data inside a table
TOP	Specifies the number of records to return in the result set
TRUNCATE TABLE	Deletes the data inside a table, but not the table itself
UNION	Combines the result set of two or more SELECT statements (only distinct values)
UNION ALL	Combines the result set of two or more SELECT statements (allows duplicate values)
UNIQUE	A constraint that ensures that all values in a column are unique
UPDATE	Updates existing rows in a table
VALUES	Specifies the values of an INSERT INTO statement
VIEW	Creates, updates, or deletes a view
WHERE	Filters a result set to include only records that fulfill a specified condition


--------------------------------------------------------------------------------------------

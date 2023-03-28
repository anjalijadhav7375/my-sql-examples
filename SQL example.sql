CREATE DATABASE ECOMMERCE;
-- DROP DATABASE ECOMMERCE;

CREATE TABLE CUSTOMERS
(
CustomerID INT NOT NULL,
CustomerName VARCHAR(100),
ContactName	VARCHAR(100),
Address	VARCHAR(100),
City VARCHAR(100),
PostalCode INT,
Country VARCHAR(100),
PRIMARY KEY (CustomerID)
);

-- DROP TABLE CUSTOMERS; -- DELETES THE TABLE
-- DELETE FROM CUSTOMERS; -- DELETES ALL RECORDS BUT NOT TABLE
-- TRUNCATE TABLE CUSTOMERS; -- DELETES ALL RECORDS BUT NOT TABLE

-- ALTER TABLE CUSTOMERS
-- ADD MOBINE_NUM INT;

-- ALTER TABLE CUSTOMERS
-- DROP COLUMN MOBINE_NUM;

-- ALTER TABLE CUSTOMERS
-- MODIFY MOBINE_NUM LONG;

-- ALTER TABLE Orders
-- ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

-- ALTER TABLE Orders
-- DROP FOREIGN KEY FK_PersonOrder;

SELECT * FROM CUSTOMERS;

INSERT INTO CUSTOMERS
(
CustomerID,
CustomerName,
ContactName,
Address,
City,
PostalCode,
Country
)
VALUES
(
102,
"RUTUJA KAMBLE",
"RUTUJA",
"MANJARI",
"PUNE",
412307,
"INDIA"
),
(
103,
"ANJALI JADHAV",
"ANJALI",
"DADAR",
"MUMBAI",
400014,
"INDIA"
),
(
104,
"SAKSHI KASBE",
"SAKSHI",
"PARK STREET",
"LONDON",
200201,
"UK"
),
(
105,
"PRATIK SHINDE",
"PRATIK",
"DUBAI",
"DUBAI",
3003001,
"UAE"
),
(
106,
"MAHESH K",
"MAHESH",
"LA",
"LA",
1001001,
"USA"
);

DROP TABLE CUSTOMERS;

UPDATE CUSTOMERS
SET CUSTOMERNAME="MAHESH KESKAR"
WHERE CUSTOMERID IN (106,103,102,104);

SELECT * FROM CUSTOMERS WHERE COUNTRY NOT IN ("INDIA", "USA");

SELECT * FROM CUSTOMERS WHERE CustomerID BETWEEN 103 AND 105;

SELECT * FROM CUSTOMERS WHERE CustomerID=103 OR CustomerID=105;

SELECT * FROM CUSTOMERS WHERE CustomerID > 103 AND CustomerID < 106;

SELECT * FROM CUSTOMERS WHERE CustomerID >= 103 AND CustomerID <= 106;

SELECT * FROM CUSTOMERS WHERE CustomerID != 103 AND CustomerID < 105;


CREATE TABLE Supplier (
SupplierID INT	NOT NULL,
SupplierName VARCHAR(100),
ContactName VARCHAR(100),
Address VARCHAR(100),
City VARCHAR(100),
PostalCode VARCHAR(100),
Country VARCHAR(100),
Phone LONG,
PRIMARY KEY(SupplierID)
);
DROP TABLE SUPPLIER;

ALTER TABLE supplier
MODIFY Phone VARCHAR(100);


INSERT INTO Supplier( SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
VALUES ( 1, "FOX CON",	"Charlotte Cooper",	"49 Gilbert St.","Londona","EC1 4SD","UK", "(171) 555-2222");

SELECT * FROM Supplier;

DELETE FROM CUSTOMERS WHERE CUSTOMERID=101;

SELECT * FROM customers order by CustomerID DESC limit 4;

SELECT COUNT(*) AS COUNT FROM customers;
SELECT SUM(CustomerID) AS SUM FROM customers;
SELECT distinct(COUNTRY) AS DISTINCT_COUNTRIES FROM customers;

CREATE TABLE CATEGORIES
(
CategoryID INT NOT NULL,
CategoryName VARCHAR(100),
Description VARCHAR(100)
);

ALTER TABLE CATEGORIES
MODIFY CategoryID INT NOT NULL;

ALTER TABLE CATEGORIES
ADD PRIMARY KEY (CategoryID);

INSERT INTO CATEGORIES
(CategoryID,
CategoryName,
Description
)
values
(101,
"ELECTRONIC",
"FRIDGE, TV, WASH MACHINE ETC"
),
(
102,
"MOBILE",
"APPLE, ANDROID PHONES"
);

CREATE TABLE EMPLOYEES
(EmployeeID INT NOT NULL,
LastName VARCHAR(100),
FirstName VARCHAR(100),
BirthDate DATE,
Photo VARCHAR(100),
Notes VARCHAR(100),
PRIMARY KEY (EmployeeID)
);

INSERT INTO EMPLOYEES
(EmployeeID,	LastName,	FirstName,	BirthDate,	Photo,	Notes)
VALUES (1001, "SHARMA", "TOM", "1995-05-01", "TOM.PNG", "TOM HERE");

INSERT INTO EMPLOYEES
(EmployeeID,	LastName,	FirstName,	BirthDate,	Photo,	Notes)
VALUES (1002, "PATEL", "VISHAL", "1992-01-01", "VISHAL.PNG", "PATEL EVERYWHERE");


CREATE TABLE SHIPPERS
(ShipperID INT NOT NULL,
ShipperName VARCHAR(100),
Phone VARCHAR(100),
PRIMARY KEY (ShipperID)
);

INSERT INTO SHIPPERS
(ShipperID,	ShipperName,Phone)
VALUES (5000, "DELHIVERY","10101010101"),
(5001, "DROP SHIPPING", "102102102102"),
(5002, "SHIPROCKET", 103103103103);

CREATE TABLE ORDERS
(
OrderID INT NOT NULL,
CustomerID	INT NOT NULL,
EmployeeID	INT NOT NULL,
OrderDate	DATE,
ShipperID	INT NOT NULL,
PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
FOREIGN KEY (ShipperID) REFERENCES shippers(ShipperID)
);

-- Multiple rows insert in single command.
INSERT INTO ORDERS
(OrderID,	CustomerID,	EmployeeID,	OrderDate,	ShipperID)
VALUES (100011, 106, 1001, "2023-03-24", 5001), (100015, 104, 1002, "2023-03-24", 5002);


-- ################### JOINS ###############
-- JOINS --> JOIN THE ROWS FROM MULTIPLE TABLES BASED COMMON COLUMN(S)

-- 1. INNER JOIN -->  MATHCING RECORDS
SELECT ORDERS.OrderID, CUSTOMERS.CustomerName, ORDERS.OrderDate
FROM ORDERS INNER JOIN CUSTOMERS ON customers.CustomerID = ORDERS.CustomerID;

-- 2. LEFT JOIN --> MATCHING AND LEFT
SELECT ORDERS.OrderID, CUSTOMERS.CustomerName, ORDERS.OrderDate
FROM ORDERS LEFT JOIN CUSTOMERS ON customers.CustomerID = ORDERS.CustomerID;

-- 3. RIGHT JOIN --> MATCHING AND RIGHT
SELECT ORDERS.OrderID, CUSTOMERS.CustomerName, ORDERS.OrderDate
FROM ORDERS RIGHT JOIN CUSTOMERS ON customers.CustomerID = ORDERS.CustomerID;

-- 4. CROSS JOIN  --> ALL
SELECT ORDERS.OrderID, CUSTOMERS.CustomerName, ORDERS.OrderDate
FROM ORDERS CROSS JOIN CUSTOMERS;

-- 5. SELF JOIN
-- Q- Select all customers who belong to same city.
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.Country AS Country1, B.Country AS Country2
FROM Customers AS A, Customers AS B
WHERE A.CustomerName <> B.CustomerName AND A.Country = B.Country;

-- ################### SQL Constraints ###############
-- 1. NOT NULL
-- 2. UNIQUE
-- 3. PRIMARY KEY
-- 4. FOREIGN KEY
-- 5. CHECK
-- 6. DEFAULT
-- 7. INDEX

-- CHECK CONSTRAINT EXAMPLE (PRIMARY KEY AND CHECK)
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int NOT NULL,
    PRIMARY KEY (ID),
    CHECK (Age >= 18)
);

ALTER TABLE PERSONS
ADD COLUMN COUNTRY VARCHAR(100) NOT NULL;

ALTER TABLE PERSONS
DROP COLUMN COUNTRY;

ALTER TABLE PERSONS
MODIFY COUNTRY VARCHAR(100) NOT NULL;

ALTER TABLE PERSONS
MODIFY COUNTRY VARCHAR(100) DEFAULT "INDIA";

INSERT INTO PERSONS
(ID, LastName, FirstName, Age)
VALUES (1, "GUPTA", "VIKRAM", 27);

SELECT * FROM PERSONS;

INSERT INTO PERSONS
(ID, LastName, FirstName, Age)
VALUES (2, "SAKSHI", "KASBE", 22);

INSERT INTO PERSONS
(ID, LastName, FirstName, Age)
VALUES (3, "SHINDE", "PRATIK", 23);

INSERT INTO PERSONS
(ID, LastName, FirstName, Age, COUNTRY)
VALUES (4, "KESKAR", "MAHESH", 24, "NZ");

INSERT INTO PERSONS
(ID, LastName, FirstName, COUNTRY)
VALUES (5, "JADHAV", "ANJALI", "NZ");

SELECT ID, FirstName, COUNTRY FROM PERSONS;

-- ################ INDEX ###############
-- The `CREATE INDEX` statement is used to create indexes in tables. Indexes are used to retrieve data from the database more quickly than otherwise.
-- The users cannot see the indexes, they are just used to speed up searches/queries.
-- Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

CREATE INDEX CITIZEN
ON PERSONS (COUNTRY);

SELECT * FROM PERSONS USE INDEX (CITIZEN) WHERE COUNTRY="INDIA";
-- THIS COMMAND INTERNALLY USES INDEX TO PERFORM FAST SEARCHING


-- ################ INDEX ###############
-- The `CREATE INDEX` statement is used to create indexes in tables. Indexes are used to retrieve data from the database more quickly than otherwise.
-- The users cannot see the indexes, they are just used to speed up searches/queries.
-- Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

CREATE INDEX CITIZEN
ON PERSONS (COUNTRY);

SELECT * FROM PERSONS USE INDEX (CITIZEN) WHERE COUNTRY="INDIA";

-- ############ UNION AND UNION ALL #############
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
-- 1. Every SELECT statement within UNION must have the same number of columns
-- 2. The columns must also have similar data types
-- 3. The columns in every SELECT statement must also be in the same order

-- PRODUCES ONLY UNIQUE ELEMENTS
SELECT EmployeeID FROM employees
UNION
SELECT CustomerName FROM customers;

SELECT
 CustomerName FROM customers
UNION ALL
SELECT CustomerName FROM customers;


-- DISTINCT KEYWORD
SELECT COUNT(distinct( CITY)) FROM ecommerce.customers;

-- ###### GROUP BY AND HAVING CLAUSE #######
SELECT COUNT(CustomerID) AS COUNT_CUST, CITY FROM ecommerce.customers
GROUP BY CITY
HAVING COUNT_CUST >=1;

-- ##### LIKE OPERATOR  #####
-- '_' ANY SINGLE CHAR
-- '%' ANY NUMBER OF CHARS
SELECT * FROM customers WHERE CustomerName LIKE "_I%";
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100),
  Email VARCHAR(100)
);


INSERT INTO Customers (Name, Email)
VALUES ('John Doe', 'john.doe@example.com');


INSERT INTO table_name (column1, column2, column3, ...)
VALUES 
    (value1a, value2a, value3a, ...),
    (value1b, value2b, value3b, ...),
    (value1c, value2c, value3c, ...),
    ...;


CREATE TABLE Employees (
    EmployeeID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL
);


CREATE TABLE Users (
    UserID INT NOT NULL,
    Username VARCHAR(50) UNIQUE,
    Email VARCHAR(100) UNIQUE
);


CREATE TABLE Products (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) DEFAULT 0.00,
    PRIMARY KEY (ProductID)
);


CREATE TABLE Orders (
    OrderID INT NOT NULL AUTO_INCREMENT,
    OrderAmount DECIMAL(10, 2) CHECK (OrderAmount >= 0),
    PRIMARY KEY (OrderID)
);


CREATE TABLE Departments (
    DepartmentID INT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    PRIMARY KEY (DepartmentID)
);
CREATE TABLE Employees (
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


CREATE TABLE Customers (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID)
);



SELECT * 
FROM Employees
WHERE Department = 'Sales';


SELECT * 
FROM Employees
WHERE Department = 'Sales' AND Status = 'Active';

SELECT * 
FROM Employees
WHERE Department = 'Sales' OR Department = 'Marketing';


SELECT * 
FROM Products
WHERE Price > 100;



SELECT * 
FROM Products
WHERE Price BETWEEN 50 AND 150;


SELECT * 
FROM Customers
WHERE Name LIKE 'J%';


SELECT * 
FROM Orders
WHERE ShippingDate IS NULL;


SELECT * 
FROM Orders
WHERE ShippingDate IS NOT NULL;


SELECT * 
FROM Employees
WHERE Department IN ('Sales', 'Marketing', 'HR');


SELECT * 
FROM Employees
WHERE Department = 'Sales' AND Status = 'Active';


SELECT * 
FROM Employees
WHERE Department = 'Sales' OR Department = 'Marketing';


SELECT * 
FROM Employees
WHERE NOT Department = 'Sales';


SELECT * 
FROM Employees
WHERE (Department = 'Sales' OR Department = 'Marketing')
  AND Status = 'Active';


SELECT column1, column2, ...
FROM table_name
WHERE column_name IN (SELECT column_name FROM other_table WHERE condition);


SELECT SaleID, SaleAmount, SaleDate
FROM Sales
WHERE SaleAmount BETWEEN 100 AND 500;


SELECT SaleID, SaleAmount, SaleDate
FROM Sales
WHERE SaleAmount NOT BETWEEN 100 AND 500;


SELECT * 
FROM Employees
WHERE Name LIKE 'J%';


SELECT * 
FROM Products
WHERE ProductCode LIKE 'A_ _ _B';


SELECT * 
FROM Products
WHERE ProductName LIKE '[A]pple';


SELECT * 
FROM Products
WHERE ProductName LIKE '[^A]pple';



SELECT * 
FROM Products
WHERE ProductName LIKE '[a-z]%';


SELECT * 
FROM Users
WHERE Email REGEXP '\\.com$';


SELECT * 
FROM Contacts
WHERE PhoneNumber ~ '^\(\d{3}\) \d{3}-\d{4}$';


SELECT EmployeeID, EmployeeName, Salary
FROM Employees
ORDER BY Salary;


SELECT EmployeeID, EmployeeName, Department, Salary
FROM Employees
ORDER BY Department ASC, Salary DESC;


SELECT ProductID, ProductName, Price, Quantity, Price * Quantity AS TotalValue
FROM Products
ORDER BY TotalValue DESC;


SELECT DISTINCT Department
FROM Employees;
This query retrieves a list of unique departments from the Employees table.


SELECT DISTINCT EmployeeName, Department
FROM Employees;


SELECT COUNT(DISTINCT Department) AS UniqueDepartments
FROM Employees;


SELECT EmployeeID, EmployeeName
FROM Employees
WHERE PhoneNumber IS NULL;


SELECT EmployeeID, EmployeeName
FROM Employees
WHERE PhoneNumber IS NOT NULL;


SELECT EmployeeID, EmployeeName
FROM Employees
LIMIT 10;


SELECT EmployeeID, EmployeeName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 5;


SELECT EmployeeID, EmployeeName
FROM Employees
ORDER BY EmployeeID


SELECT EmployeeID, EmployeeName
FROM Employees
ORDER BY EmployeeID
LIMIT 10 OFFSET 20;


SELECT COUNT(*) AS TotalEmployees
FROM Employees;


SELECT COUNT(PhoneNumber) AS TotalPhoneNumbers
FROM Employees;


SELECT SUM(Salary) AS TotalSalary
FROM Employees;


SELECT SUM(SalesAmount) AS TotalSales
FROM Sales
WHERE Year = 2023;



SELECT MIN(Salary) AS LowestSalary
FROM Employees;

SELECT MIN(OrderDate) AS EarliestOrder
FROM Orders;


SELECT MAX(Salary) AS HighestSalary
FROM Employees;


SELECT MAX(OrderDate) AS LatestOrder
FROM Orders;


SELECT AVG(Salary) AS AverageSalary
FROM Employees;


SELECT AVG(SalesAmount) AS AverageSales
FROM Sales
WHERE Year = 2023;


UPDATE Employees
SET Salary = 60000
WHERE EmployeeID = 5;

UPDATE Employees
SET Salary = 65000, JobTitle = 'Senior Developer'
WHERE EmployeeID = 10;


UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'Sales';


UPDATE Employees
SET Salary = (SELECT AVG(Salary) FROM Employees)
WHERE Department = 'IT';


START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
COMMIT;

START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
-- Something goes wrong
ROLLBACK;


DELETE FROM employees
WHERE department = 'Sales';


DELETE FROM employees;


DELETE FROM employees
WHERE department = 'Sales' AND hire_date < '2020-01-01';


START TRANSACTION;
Perform DELETE Operation
DELETE FROM employees
WHERE department = 'Sales';


CREATE TABLE employees (
    employee_id INT NOT NULL,
    name VARCHAR(100),
    PRIMARY KEY (employee_id)
);


CREATE TABLE orders (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE,
    PRIMARY KEY (order_id, product_id)
);


CREATE TABLE departments (
    department_id INT NOT NULL,
    department_name VARCHAR(100),
    PRIMARY KEY (department_id)
);
CREATE TABLE employees (
    employee_id INT NOT NULL,
    name VARCHAR(100),
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


SELECT orders.order_id, customers.name, orders.order_date
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


SELECT customers.customer_id, customers.name, orders.order_id, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;


SELECT orders.order_id, orders.order_date, customers.name
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.customer_id;


CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50)
);


CREATE TABLE shapes (
    shape_id INT PRIMARY KEY,
    shape_name VARCHAR(50)
);


SELECT colors.color_name, shapes.shape_name
FROM colors
CROSS JOIN shapes;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);



CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_amount DECIMAL(10, 2),
    sale_date DATE
);
SELECT product_id, SUM(sale_amount) AS total_sales
FROM sales
GROUP BY product_id;


SELECT product_id, SUM(sale_amount) AS total_sales
FROM sales
GROUP BY product_id
HAVING SUM(sale_amount) > 200;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


SELECT department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


SELECT name
FROM employees_2023
UNION
SELECT name
FROM employees_2024;


DELIMITER //
CREATE PROCEDURE check_salary(IN emp_salary DECIMAL(10,2))
BEGIN
    IF emp_salary > 50000 THEN
        SELECT 'High Salary';
    ELSE
        SELECT 'Low Salary';
    END IF;
END //
DELIMITER ;


SELECT name,
       CASE department_id
           WHEN 1 THEN 'Sales'
           WHEN 2 THEN 'Marketing'
           ELSE 'Other'
       END AS department_name
FROM employees;


UPDATE employees
SET bonus = CASE
    WHEN performance_rating = 'Excellent' THEN 1000
    WHEN performance_rating = 'Good' THEN 500
    ELSE 0
END;


FROM employees
WHERE CASE
    WHEN department_id = 1 THEN salary > 60000
    WHEN department_id = 2 THEN salary > 50000
    ELSE salary > 40000
END;


SELECT PI(); -- Returns 3.14159265358979



SELECT ROUND(123.4567, 2); -- Returns 123.




SELECT CEIL(123.4567); -- Returns 124


SELECT FLOOR(123.4567); -- Returns 123



SELECT SQRT(16); -- Returns 4

SELECT RAND(); -- Returns a random number between 0 and 1


SELECT ABS(-123.4567); -- Returns 123.4567



SELECT SIGN(-5); -- Returns -1
SELECT SIGN(0);  -- Returns 0
SELECT SIGN(5);  -- Returns 1


SELECT SIN(PI()/2); -- Returns 1 (sine of 90 degrees or p/2 radians)


SELECT COS(0); -- Returns 1 (cosine of 0 radians)


SELECT TAN(PI()/4); -- Returns 1 (tangent of 45 degrees or p/4 radians)



SELECT ASIN(1); -- Returns p/2 or 1.5708 radians

SELECT ACOS(1); -- Returns 0 radians


SELECT ATAN(1); -- Returns p/4 or 0.7854 radians

SELECT ATAN2(1, 1); -- Returns p/4 or 0.7854 radians


SELECT RADIANS(90); -- Returns p/2 or 1.5708 radians

SELECT COT(PI()/4); -- Returns 1 (cotangent of 45 degrees or p/4 radians)


SELECT UPPER('hello world'); -- Returns 'HELLO WORLD'
SELECT UCASE('hello world'); -- Returns 'HELLO WORLD'




SELECT LOWER('HELLO WORLD'); -- Returns 'hello world'
SELECT LCASE('HELLO WORLD'); -- Returns 'hello world'

SELECT LENGTH('hello'); -- Returns 5


SELECT CHAR_LENGTH('hello'); -- Returns 5


SELECT CONCAT('Hello', ' ', 'World'); -- Returns 'Hello World'


SELECT LTRIM('   hello'); -- Returns 'hello'
SELECT CONCAT_WS('-', '2024', '08', '08'); -- Returns '2024-08-08'





SELECT RTRIM('hello   '); -- Returns 'hello'




SELECT TRIM('   hello   '); -- Returns 'hello'

SELECT POSITION('world' IN 'hello world'); -- Returns 7



SELECT LOCATE('world', 'hello world'); -- Returns 7


SELECT INSTR('hello world', 'world'); -- Returns 7


SELECT SUBSTRING('hello world', 7, 5); -- Returns 'world'
SELECT SUBSTR('hello world', 7, 5);   -- Returns 'world'


SELECT SUBSTRING_INDEX('one,two,three', ',', 2); -- Returns 'one,two'

SELECT LEFT('hello world', 5); -- Returns 'hello'

SELECT RIGHT('hello world', 5); -- Returns 'world'

SELECT LPAD('123', 5, '0'); -- Returns '00123'

SELECT RPAD('123', 5, '0'); -- Returns '12300'

SELECT SPACE(5); -- Returns '     ' (5 spaces)

SELECT REVERSE('hello'); -- Returns 'olleh'


SELECT REPEAT('hello ', 3); -- Returns 'hello hello hello '

SELECT REPLACE('hello world', 'world', 'MySQL'); -- Returns 'hello MySQL'

SELECT STRCMP('hello', 'world'); -- Returns a negative number

SELECT FIELD('b', 'a', 'b', 'c'); -- Returns 2

SELECT FIND_IN_SET('b', 'a,b,c'); -- Returns 2


SELECT FORMAT(1234567.89, 2); -- Returns '1,234,567.89'


SELECT HEX('hello'); -- Returns '68656C6C6F'
SELECT HEX(255);     -- Returns 'FF'

-- find all products --
 SELECT Name from products;
 
-- find all products that cost $1400

SELECT Name, Price FROM Products
WHERE Price= 1400;
 
-- find all products that cost $11.99 or $13.99

Select Name, Price FROM Products
WHERE Price = 11.99 OR Price = 13.99;
 
-- find all products that do NOT cost 11.99 - using NOT

SELECT Name, Price FROM Products
WHERE NOT Price = 11.99;
 
-- find  all products and sort them by price from greatest to least

SELECT * FROM Products
ORDER BY Price DESC;
 
-- find all employees who don't have a middle initial

SELECT * FROM employees
WHERE MiddleInitial IS NULL;
 
-- find distinct product prices

SELECT DISTINCT Price FROM Products;
 
-- find all employees whose first name starts with the letter ‘j’

SELECT * FROM Employees
WHERE FirstName LIKE '%j%';
 
-- find all Macbooks --

SELECT * FROM Products
WHERE Name = 'Macbook';
 
-- find all products that are on sale

SELECT * FROM Products
WHERE OnSale = 1;
 
-- find the average price of all products --

SELECT AVG (Price) FROM Products;

-- find all Geek Squad employees who don't have a middle initial --

SELECT * FROM Employees
WHERE Title = 'Geek Squad' and MiddleInitial Is NULL;
 
-- find all products from the products table whose stock level is in the range  -- 
-- of 500 to 1200. Order by Price from least to greatest. **Try this with the -- between keyword** 

SELECT * FROM Products
WHERE StockLevel BETWEEN 500 AND 1200 ORDER BY price ASC;

-- PART 2 ---------PART 2 -------

-- joins: select all the computers from the products table:
 -- using the products table and the categories table, return the product name and the category name
 
SELECT P.Name as Product, C.Name as Category FROM Products as P
INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5

SELECT p.Name, p.Price, r.Rating from Products as p
INNER JOIN reviews as r on r.ProductID = p.ProductID
WHERE r.Rating = 5;

-- joins: find the employee with the most total quantity sold.  use the sum() function and group by

SELECT e.firstName, e.LastName, Sum(s.Quantity) as Total FROM Sales AS s
INNER JOIN Employees AS e on e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total Desc;
 -- tim started: SELECT E.Name AS EmployeeID, Q.Name AS Quantity FROM Sales as S
 -- tim started: INNER JOIN Employee as E ON E.EmployeeID = S.EmployeeID;
 
-----------------------------------------------------------------

-- joins: find the name of the department, and the name of the category for Appliances and Games

SELECT d.Name as 'Department Name', c.Name as 'Category' FROM Departments as d
INNER JOIN Categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' or c.Name = 'Games';
-- SELECT * c.Name, c.CategoryID FROM Categories as c;
-- INNER JOIN Categories as c on n.Departments = s.Name

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()

SELECT p.Name, Sum(s.Quantity), Sum(s.Quantity * s.PricePerUnit) FROM Products as p
INNER JOIN Sales as s on s.ProductID = p.ProductID
WHERE p.ProductID = 97;

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
-- (only return for the lowest rating!)

SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM products as p
--  r.Reviewer as 'Reviewer', r.Rating as 'Rating', r.Comment as 'Comment', p.Name as 'Product' FROM reviews as r
INNER JOIN Reviews as r on r.ProductID = p.ProductID
WHERE p.ProductID = 857;


-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold, s.Date FROM Sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID, s.Date;

-- finished




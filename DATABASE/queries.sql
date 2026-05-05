--SANITY CHECKS

-- View all products
SELECT * FROM PRODUCT;

-- View all suppliers
SELECT * FROM SUPPLIER;

-- View all customers
SELECT * FROM CUSTOMER;

-- View all employees
SELECT * FROM EMPLOYEE;

-- View all transactions
SELECT * FROM transactions;

--CHECK AVAILABLE STOCK

SELECT ProductName, Quantity
FROM PRODUCT;

--FIND LOW STOCK PRODUCTS

SELECT ProductName, Quantity
FROM PRODUCT
WHERE Quantity < 10;

--FIND OUT OF STOCK PRODUCTS

SELECT ProductName
FROM PRODUCT
WHERE Quantity = 0;

--PRODUCTS NEAR EXPIRY DATE

SELECT ProductName, Expiry_Date
FROM PRODUCT
WHERE Expiry_Date IS NOT NULL
AND Expiry_Date <= CURDATE() + INTERVAL 7 DAY;

--TOTAL INVENTORY VALUE

SELECT SUM(Cost * Quantity) AS Total_Stock_Value
FROM PRODUCT;

--SALES & PURCHASE TRACKING

SELECT t.TransactionID, t.Date, t.Total_Amount, c.Name AS Customer
FROM transactions t
JOIN SALES s ON t.TransactionID = s.TransactionID
JOIN CUSTOMER c ON s.CustomerID = c.CustomerID;

--All Purchase Transactions

SELECT t.TransactionID, t.Date, t.Total_Amount, sup.Name AS Supplier
FROM transactions t
JOIN PURCHASES p ON t.TransactionID = p.TransactionID
JOIN SUPPLIER sup ON p.SupplierID = sup.SupplierID;

--Items Sold in Each Transaction

SELECT t.TransactionID, p.ProductName, ti.Quantity, ti.Cost
FROM TransactionItem ti
JOIN PRODUCT p ON ti.ProductID = p.ProductID
JOIN transactions t ON ti.TransactionID = t.TransactionID;


--Total Sales Per Day

SELECT Date, SUM(Total_Amount) AS Daily_Sales
FROM transactions
GROUP BY Date;

--Total Sales Per Product

SELECT p.ProductName, SUM(ti.Quantity) AS Total_Sold
FROM TransactionItem ti
JOIN PRODUCT p ON ti.ProductID = p.ProductID
GROUP BY p.ProductName;

--Most Sold Products

SELECT p.ProductName, SUM(ti.Quantity) AS Total_Sold
FROM TransactionItem ti
JOIN PRODUCT p ON ti.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Sold DESC;

--Revenue Generated Per Product

SELECT p.ProductName, SUM(ti.Quantity * ti.Cost) AS Revenue
FROM TransactionItem ti
JOIN PRODUCT p ON ti.ProductID = p.ProductID
GROUP BY p.ProductName;

--Employees and Their Roles

SELECT e.Name, r.RoleName
FROM EMPLOYEE e
JOIN EMPLOYEE_ROLE er ON e.EmployeeID = er.EmployeeID
JOIN ROLE r ON er.RoleID = r.RoleID;

--Transactions Handled Per Employee

SELECT e.Name, COUNT(t.TransactionID) AS Total_Transactions
FROM EMPLOYEE e
LEFT JOIN transactions t ON e.EmployeeID = t.EmployeeID
GROUP BY e.Name;

--Best Performing Employee

SELECT e.Name, SUM(t.Total_Amount) AS Total_Sales
FROM EMPLOYEE e
JOIN transactions t ON e.EmployeeID = t.EmployeeID
GROUP BY e.Name
ORDER BY Total_Sales DESC;

--Monthly Sales Trend

SELECT MONTH(Date) AS Month, SUM(Total_Amount) AS Total_Sales
FROM transactions
GROUP BY MONTH(Date);

--Most active supplier

SELECT 
    t.TransactionID,
    t.Date,
    e.Name AS Employee,
    p.ProductName,
    ti.Quantity,
    ti.Cost,
    (ti.Quantity * ti.Cost) AS Total
FROM transactions t
JOIN EMPLOYEE e ON t.EmployeeID = e.EmployeeID
JOIN TransactionItem ti ON t.TransactionID = ti.TransactionID
JOIN PRODUCT p ON ti.ProductID = p.ProductID;


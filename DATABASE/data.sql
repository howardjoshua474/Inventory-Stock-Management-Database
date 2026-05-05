-- =========================
-- ROLE
-- =========================
INSERT INTO ROLE (RoleID, RoleName) VALUES
(1, 'Manager'),
(2, 'Cashier'),
(3, 'Storekeeper');

-- =========================
-- EMPLOYEE
-- =========================
INSERT INTO EMPLOYEE(EmployeeID, Name, Contact) VALUES
(1, 'Alice Namara', '0701000001'),
(2, 'Brian Okello', '0701000002'),
(3, 'Cathy Achieng', '0701000003');

-- =========================
-- EMPLOYEEROLE
-- =========================
INSERT INTO EMPLOYEE_ROLE (EmployeeRoleID, EmployeeID, RoleID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- =========================
-- SUPPLIER
-- =========================
INSERT INTO SUPPLIER (SupplierID, Name, Contact, Address, Email) VALUES
(1, 'Fresh Foods Ltd', '0755000001', 'Kampala', 'fresh@foods.com'),
(2, 'Tech Supplies Co', '0755000002', 'Entebbe', 'tech@supplies.com');

-- =========================
-- CUSTOMER
-- =========================
INSERT INTO CUSTOMER (CustomerID, Name, Contact) VALUES
(1, 'David Ssemanda', '0788000001'),
(2, 'Esther Nanyonga', '0788000002');

-- =========================
-- PRODUCT
-- =========================
INSERT INTO PRODUCT (ProductID, ProductName, Category, Brand, Cost, Quantity, Expiry_Date) VALUES
(1, 'Milk', 'Dairy', 'Jesco', 2500.00, 100, '2026-06-01'),
(2, 'Bread', 'Bakery', 'HotLoaf', 3000.00, 50, '2026-05-10'),
(3, 'Sugar', 'Grocery', 'Kakira', 4500.00, 200, NULL),
(4, 'Laptop', 'Electronics', 'Dell', 2500000.00, 10, NULL);

-- =========================
-- TRANSACTION
-- =========================
INSERT INTO transactions (TransactionID, Date, Time, Total_Amount, EmployeeID) VALUES
(1, '2026-05-01', NOW(), 5500.00, 2),
(2, '2026-05-02', NOW(), 4500.00, 2),
(3, '2026-05-03', NOW(), 2500000.00, 1);

-- =========================
-- SALES
-- =========================
INSERT INTO SALES (TransactionID, CustomerID) VALUES
(1, 1),
(2, 2),
(3, 1);

-- =========================
-- PURCHASES
-- =========================
INSERT INTO PURCHASES (TransactionID, SupplierID) VALUES
(3, 2);

-- =========================
-- TRANSACTION ITEM
-- =========================
INSERT INTO TransactionItem (TransactionItemID, ProductID, Quantity, Cost, TransactionID) VALUES
(1, 1, 2, 2500.00, 1),
(2, 2, 1, 3000.00, 1),
(3, 3, 1, 4500.00, 2),
(4, 4, 1, 2500000.00, 3);

-- -----------------------------------------------------
-- Create Database
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS Inventory_Stock_System;
USE Inventory_Stock_System;

-- -----------------------------------------------------
-- PRODUCT
-- -----------------------------------------------------
CREATE TABLE PRODUCT (
  ProductID INT AUTO_INCREMENT PRIMARY KEY,
  ProductName VARCHAR(45) NOT NULL,
  Category VARCHAR(45) NOT NULL,
  Brand VARCHAR(45),
  Cost DECIMAL(10,2) NOT NULL,
  Quantity INT UNSIGNED NOT NULL,
  Expiry_Date DATE
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- SUPPLIER
-- -----------------------------------------------------
CREATE TABLE SUPPLIER (
  SupplierID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Contact VARCHAR(45) NOT NULL,
  Address VARCHAR(100),
  Email VARCHAR(45)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- CUSTOMER
-- -----------------------------------------------------
CREATE TABLE CUSTOMER (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(45),
  Contact VARCHAR(45)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- EMPLOYEE
-- -----------------------------------------------------
CREATE TABLE EMPLOYEE (
  EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Contact VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- ROLE
-- -----------------------------------------------------
CREATE TABLE ROLE (
  RoleID INT AUTO_INCREMENT PRIMARY KEY,
  RoleName VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- EMPLOYEE_ROLE (Junction Table)
-- -----------------------------------------------------
CREATE TABLE EMPLOYEE_ROLE (
  EmployeeRoleID INT AUTO_INCREMENT PRIMARY KEY,
  EmployeeID INT NOT NULL,
  RoleID INT NOT NULL,

  CONSTRAINT fk_emp_role_employee
    FOREIGN KEY (EmployeeID)
    REFERENCES EMPLOYEE(EmployeeID),

  CONSTRAINT fk_emp_role_role
    FOREIGN KEY (RoleID)
    REFERENCES ROLE(RoleID)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- TRANSACTION
-- -----------------------------------------------------
CREATE TABLE transactions (
  TransactionID INT AUTO_INCREMENT PRIMARY KEY,
  Date DATE NOT NULL,
  Time TIMESTAMP NOT NULL,
  Total_Amount DECIMAL(10,2) NOT NULL,
  EmployeeID INT NOT NULL,

  CONSTRAINT fk_transaction_employee
    FOREIGN KEY (EmployeeID)
    REFERENCES EMPLOYEE(EmployeeID)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- SALES
-- -----------------------------------------------------
CREATE TABLE SALES (
  TransactionID INT PRIMARY KEY,
  CustomerID INT,

  CONSTRAINT fk_sales_transaction
    FOREIGN KEY (TransactionID)
    REFERENCES transactions(TransactionID),

  CONSTRAINT fk_sales_customer
    FOREIGN KEY (CustomerID)
    REFERENCES CUSTOMER(CustomerID)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- PURCHASES
-- -----------------------------------------------------
CREATE TABLE PURCHASES (
  PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
  SupplierID INT NOT NULL,
  TransactionID INT NOT NULL,

  CONSTRAINT fk_purchase_supplier
    FOREIGN KEY (SupplierID)
    REFERENCES SUPPLIER(SupplierID),

  CONSTRAINT fk_purchase_transaction
    FOREIGN KEY (TransactionID)
    REFERENCES transactions(TransactionID)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- TRANSACTION_ITEM
-- -----------------------------------------------------
CREATE TABLE TransactionItem (
  TransactionItemID INT AUTO_INCREMENT PRIMARY KEY,
  TransactionID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  Cost DECIMAL(10,2) NOT NULL,

  CONSTRAINT fk_item_transaction
    FOREIGN KEY (TransactionID)
    REFERENCES transactions(TransactionID),

  CONSTRAINT fk_item_product
    FOREIGN KEY (ProductID)
    REFERENCES PRODUCT(ProductID)
) ENGINE=InnoDB;

# Inventory Stock Management System (Database Project)

## Overview

This project is a MySQL-based **Inventory Stock Management System** designed to manage products, suppliers, customers, employees, and transactions efficiently.

It supports:

* Product tracking (quantity, cost, expiry)
* Supplier and customer management
* Sales and purchase transactions
* Employee roles and system accountability

---

##  Database Design

The system is based on an **Enhanced Entity-Relationship (EER) model**.

### Main Entities:

* **Product**
* **Supplier**
* **Customer**
* **Employee**
* **Role**
* **Transaction**
* **TransactionItem**

### Relationships:

* Employees are assigned roles
* Transactions are linked to employees
* Sales connect customers to transactions
* Purchases connect suppliers to transactions
* Each transaction contains multiple items

---

## Technologies Used

* MySQL
* SQL (DDL & DML)
* Git & GitHub

---

##  Project Structure

```
inventory-stock-management/
│
├── database/
│   ├── schema.sql          # Table creation (DDL)
│   ├── data.sql            # Sample data (INSERT statements)
│   └── queries.sql         # Useful queries (reports, joins)
│
├── docs/
│   └── eer-diagram.png     # Database diagram
│
└── README.md
```

---

## Example Features

* Track stock levels and expiry dates
* Record purchases from suppliers
* Record sales to customers
* Generate transaction reports
* Manage employee roles

---

##  Future Improvements

* Add triggers for automatic stock updates
* Build a frontend interface
* Add authentication system
* Integrate with a web API

---

## Author

* Your RWOTOMARA JOSHUA HOWARD
* REG.NO 2025/BCS/169/PS
---

## License

This project is for educational purposes.


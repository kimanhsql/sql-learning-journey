# Database Concepts

## What is SQL?

SQL stands for **Structured Query Language**.

It is the standard language used to create, manage, retrieve, and manipulate data in relational database management systems (RDBMS).

SQL is supported by many database systems, including Microsoft SQL Server, MySQL, PostgreSQL, Oracle Database, and SQLite.

---

## What is a Database?

A database is an organized collection of related data that is stored electronically.

Its purpose is to store, organize, manage, and retrieve information efficiently.

---

## What is a DBMS?

A **Database Management System (DBMS)** is software that allows users to create, store, retrieve, update, and manage data.

It provides an interface between users and the database while ensuring data consistency and security.

---

## What is an RDBMS?

A **Relational Database Management System (RDBMS)** is a type of DBMS that stores data in related tables.

Relationships between tables are established using **Primary Keys** and **Foreign Keys**.

Examples of RDBMS include:

- Microsoft SQL Server
- MySQL
- PostgreSQL
- Oracle Database

---

## What is SQL Server?

Microsoft SQL Server is a Relational Database Management System (RDBMS) developed by Microsoft.

It uses Transact-SQL (T-SQL), an extension of the standard SQL language.

SQL Server is commonly used for developing, managing, and maintaining relational databases.

---

## What is a Table?

A table is a database object that stores related data in rows and columns.

Each table usually represents one real-world entity, such as Students, Employees, Customers, or Products.

---

## What is a Row?

A row represents a single record in a table.

Each row contains information about one specific entity.

---

## What is a Column?

A column represents an attribute of the data stored in a table.

Each column has a name and a data type.

For example:

| StudentID | FullName | Age |
|-----------|----------|-----|
| 1 | John Smith | 20 |

- StudentID
- FullName
- Age

are columns.

---

## What are Constraints?

Constraints are rules applied to table columns to ensure data integrity and accuracy.

Common constraints include:

- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- CHECK
- DEFAULT

---

## What is a Primary Key?

A Primary Key is a constraint that uniquely identifies each record in a table.

A Primary Key:

- must be unique
- cannot contain NULL values
- can consist of one or multiple columns

---

## What is a Foreign Key?

A Foreign Key is a column (or a group of columns) that references the Primary Key of another table.

It is used to create relationships between tables and maintain referential integrity.

The name of a Foreign Key does not have to be the same as the referenced Primary Key.

---

## Summary

Understanding these concepts provides the foundation for learning SQL and designing relational databases.
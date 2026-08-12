# Football Management System

This project is a database implementation and practice project based on the **Football Management System (QLBongDa)** exercises in the *Database Fundamentals* textbook.

The project is used to review and apply SQL Server knowledge through a complete database, including database creation, table design, relationships, data manipulation, queries, and advanced SQL features.

---

## 1. Project Overview

### Project Name

**Football Management System**

### Database Name

`QLBongDa`

### Source

* Document: `TH1207_GT.pdf`
* Database exercise: **Bài 1. Cơ sở dữ liệu về Quản lý giải bóng đá (QLBongDa)**
* Database design and creation: **Pages 96–99**
* Data Manipulation Language (DML): **Pages 105–108**

### Project Purpose

The project is intended to:

* Build the `QLBongDa` database in SQL Server.
* Understand the structure and relationships of the database.
* Insert and manipulate data.
* Practice SQL statements through the textbook exercises.
* Review previously learned SQL concepts in a practical database.
* Later apply advanced SQL features to the project.

---

# 2. Source Exercise Reference

The original textbook exercises are divided into two main parts.

## Part I — Database Definition

**Reference pages: 96–99**

The textbook describes the `QLBongDa` database, its tables, their meanings, and the required database structure.

### Requirements

| No. | Requirement                             | Page | Status |
| --- | --------------------------------------- | ---- | ------ |
| 1   | Create a database named `QLBongDa`      | 99   | ✅      |
| 2   | Create the required tables              | 99   | ✅      |
| 3   | Create relationships between the tables | 99   | ✅      |


---

## Part II — Data Manipulation

**Reference pages: 105–108**

The textbook introduces DML operations and then asks the learner to use the `QLBongDa` database to perform a series of operations.

### DML Topics

* INSERT
* DELETE
* UPDATE

Reference: **Page 105**.

---

# 3. Database Description

The `QLBongDa` database contains information about:

* Players
* Countries
* Football clubs
* Provinces / cities
* Stadiums
* Coaches
* Coach-club assignments
* Matches
* League standings

The database contains the following tables:

```text
QUOCGIA
SANVD
TINH
CAULACBO
CAUTHU
HUANLV
HLV_CLB
TRANDAU
BANGXH
```

## The textbook defines these tables and their meanings in the database description section on pages 96–98.

# 4. Database Requirements

## 4.1 Create Database

Create a database named:

```text
QLBongDa
```

Reference: **Page 99**

---

## 4.2 Create Tables

Create the following tables:

1. `CAUTHU`
2. `QUOCGIA`
3. `CAULACBO`
4. `TINH`
5. `HUANLV`
6. `SANVD`
7. `HLV_CLB`
8. `TRANDAU`
9. `BANGXH`

Reference: **Page 99**.

---

## 4.3 Create Relationships

Create relationships between the tables using primary keys and foreign keys.

The database structure includes relationships such as:

```text
QUOCGIA
   │
   ├── CAUTHU
   └── HUANLV

SANVD
   │
   └── CAULACBO

TINH
   │
   └── CAULACBO

CAULACBO
   │
   ├── CAUTHU
   ├── HLV_CLB
   ├── TRANDAU
   └── BANGXH

HUANLV
   │
   └── HLV_CLB
```

Reference: **Pages 96–99**

---

# 5. Original SQL Script

The original complete SQL script is stored separately:

```text
QLBongDa.sql
```

This file contains the work completed from the textbook, including:

* Database creation
* Table creation
* Primary keys
* Foreign keys
* Data insertion
* Data modification
* Data deletion
* Query verification
* DML exercises

The original script is kept as a reference before the project is reorganized into smaller files.

---

# 6. DML Exercises

Reference: **Pages 105–108**

## Exercise 1 — Insert Data

Insert the provided data into the required tables.

The textbook provides data for:

* `CAUTHU`
* `QUOCGIA`
* `CAULACBO`
* `TINH`
* `SANVD`
* `HUANLV`
* `HLV_CLB`
* `TRANDAU`
* `BANGXH`

References:

* `CAUTHU`: Page 105
* `QUOCGIA`, `CAULACBO`, `TINH`, `SANVD`, `HUANLV`: Page 106
* `HLV_CLB`, `TRANDAU`, `BANGXH`: Page 107

Status: **✅ Completed**

---

## Exercise 2 — Delete a Player

Delete the player:

```text
Nguyễn Vũ Phong
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 3 — Delete Players Over 40

Delete all players whose age is greater than 40.

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 4 — Delete Players Over 35 from BBD

Delete all players older than 35 who belong to:

```text
BBD
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 5 — Delete Players Over 35 from BECAMEX Bình Dương

Delete all players older than 35 who belong to the club:

```text
BECAMEX BÌNH DƯƠNG
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 6 — Change a Player's Position

Change the position of:

```text
Nguyễn Trường Sơn
```

to:

```text
Tiền đạo
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 7 — Update a Coach's Address

Set the address of:

```text
Lê Huỳnh Đức
```

to:

```text
TP.HCM
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 8 — Exchange Player Positions

Exchange the playing positions of:

```text
Nguyễn Công Vinh
Trần Tấn Tài
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 9 — Replace a Club's Head Coach

Replace the head coach of:

```text
GẠCH ĐỒNG TÂM LONG AN
```

with:

```text
Nguyễn Đức Thắng
```

Reference: **Page 108**

Status: **✅ Completed**

---

## Exercise 10 — Rename a Club

Change the club name:

```text
BECAMEX BÌNH DƯƠNG
```

to:

```text
BÌNH DƯƠNG
```

Reference: **Page 108**

Status: **✅ Completed**

---

# 7. Project Structure

The project will be reorganized after the original SQL work has been reviewed.

```text
Football Management System/
│
├── README.md
│
├── QLBongDa.sql
│
├── 01_Project_Overview/
│
├── 02_Requirements/
│
├── 03_Entities/
│
├── 04_Relationships/
│
├── 05_ERD/
│
├── 06_Database_Schema/
│
├── 07_Create_Tables/
│
├── 08_Insert_Sample_Data/
│
├── 09_Queries/
│
└── 10_Advanced_SQL/
    ├── Views/
    ├── Functions/
    ├── Stored_Procedures/
    ├── Triggers/
    ├── Transactions/
    └── Indexes/
```

The original `QLBongDa.sql` file will remain unchanged as the reference implementation.

The individual files will be separated only after the corresponding part has been reviewed and completed.

---

# 8. Project Development Plan

The project will be developed in the following order:

### Phase 1 — Understand the Requirement

* Read the original textbook exercise.
* Identify the purpose of the database.
* Identify the required tables.
* Identify the required relationships.
* Understand the meaning of the data.

### Phase 2 — Database Design

* Identify entities.
* Identify attributes.
* Identify primary keys.
* Identify foreign keys.
* Identify relationships.
* Create the ERD.
* Document the database schema.

### Phase 3 — Database Implementation

* Create the database.
* Create tables.
* Define primary keys.
* Define foreign keys.
* Insert sample data.
* Verify the database.

### Phase 4 — Query and DML Practice

* INSERT
* DELETE
* UPDATE
* SELECT
* Filtering
* JOINs
* Aggregate functions
* GROUP BY
* HAVING
* Subqueries
* UNION

### Phase 5 — Advanced SQL

Apply previously learned concepts to the project:

* Views
* Built-in Functions
* User-Defined Functions
* Stored Procedures
* Triggers
* Transactions
* Indexes

---

# 9. Progress

## Database Definition

| Component                  | Status |
| -------------------------- | ------ |
| Create `QLBongDa` database | ✅      |
| Create `CAUTHU`            | ✅      |
| Create `QUOCGIA`           | ✅      |
| Create `CAULACBO`          | ✅      |
| Create `TINH`              | ✅      |
| Create `HUANLV`            | ✅      |
| Create `SANVD`             | ✅      |
| Create `HLV_CLB`           | ✅      |
| Create `TRANDAU`           | ✅      |
| Create `BANGXH`            | ✅      |
| Create primary keys        | ✅      |
| Create foreign keys        | ✅      |
| Insert sample data         | ✅      |

## DML Exercises

| Exercise                                                    | Status |
| ----------------------------------------------------------- | ------ |
| Exercise 1 — Insert data                                    | ✅      |
| Exercise 2 — Delete Nguyễn Vũ Phong                         | ✅      |
| Exercise 3 — Delete players over 40                         | ✅      |
| Exercise 4 — Delete players over 35 from BBD                | ✅      |
| Exercise 5 — Delete players over 35 from BECAMEX Bình Dương | ✅      |
| Exercise 6 — Update Nguyễn Trường Sơn                       | ✅      |
| Exercise 7 — Update Lê Huỳnh Đức                            | ✅      |
| Exercise 8 — Exchange player positions                      | ✅      |
| Exercise 9 — Replace head coach                             | ✅      |
| Exercise 10 — Rename club                                   | ✅      |

## Project Documentation

| Section            | Status |
| ------------------ | ------ |
| Project Overview   | 🟨     |
| Requirements       | ⬜      |
| Entities           | ⬜      |
| Relationships      | ⬜      |
| ERD                | ⬜      |
| Database Schema    | ⬜      |
| Create Tables      | ⬜      |
| Insert Sample Data | ⬜      |
| Queries            | ⬜      |
| Views              | ⬜      |
| Functions          | ⬜      |
| Stored Procedures  | ⬜      |
| Triggers           | ⬜      |
| Transactions       | ⬜      |
| Indexes            | ⬜      |

---

# 10. Source Pages

The relevant pages from `TH1207_GT.pdf` are:

| Pages | Content                                       |
| ----- | --------------------------------------------- |
| 96    | QLBongDa database description and entities    |
| 97    | QLBongDa database description and constraints |
| 98    | Table structure and implementation notes      |
| 99    | Database creation, tables, and relationships  |
| 105   | DML introduction and QLBongDa exercise        |
| 106   | Data to insert                                |
| 107   | Data to insert                                |
| 108   | DELETE and UPDATE exercises                   |

These pages are the primary reference for this project.

---

# 11. Notes

⬜ Not started; 🟨 In progress; ✅ Completed; 🔍 Need review

The original textbook exercise is preserved as the source of the project requirements.

The SQL implementation may be reorganized into separate files later, but the original `QLBongDa.sql` file is kept as a complete reference.

Project status should reflect what has actually been implemented and reviewed, not simply what appears somewhere in the original SQL file.
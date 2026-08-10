# SQL Learning Notes

This file summarizes the key concepts, problem-solving mindset, and important things to remember throughout the SQL learning journey.

The purpose is not to memorize syntax, but to understand **what the query is trying to achieve, how SQL processes the data, and which SQL feature is appropriate for the problem**.

---

## 00. Fundamentals

### Key Things to Remember

- SQL works with relational data stored in tables.

- Understand the relationship between:
  * Database
  * Table
  * Row
  * Column
  * Primary Key
  * Foreign Key

- A primary key identifies a row uniquely.
- A foreign key represents a relationship between tables.
- Always understand the table structure before writing queries.

### Problem-Solving Mindset

Before writing SQL:

- What table contains the information I need?
- Which columns do I need?
- Is there a relationship with another table?
- What identifies each row?
- Could the result contain duplicate rows?

---

## 01. SELECT

### Key Things to Remember

- `SELECT` determines which columns or expressions appear in the result.
- `SELECT *` returns all columns, but selecting only the required columns is usually clearer.
- Column aliases can make results easier to understand.

### Problem-Solving Mindset

Ask:

- What information does the question require?
- Which columns are actually needed?
- Do I need to calculate or rename a column?

---

## 02. WHERE

### Key Things to Remember

- `WHERE` filters rows before the result is returned.
  
- Common operators:
  * `=`
  * `<>`
  * `>`
  * `<`
  * `>=`
  * `<=`
  * `AND`
  * `OR`
  * `NOT`
  * `IN`
  * `BETWEEN`
  * `LIKE`
  * `IS NULL`
  * `IS NOT NULL`

### Problem-Solving Mindset

Ask:

- Which rows should remain?
- What condition defines the required rows?
- Am I filtering rows or trying to filter an aggregate result?

---

## 03. ORDER BY

### Key Things to Remember

- `ORDER BY` controls the order of the final result.
- `ASC` sorts ascending.
- `DESC` sorts descending.
- Multiple columns can be used for sorting.

### Problem-Solving Mindset

Ask:

- Does the question require sorting?
- Which column should determine the order?
- Should the order be ascending or descending?
- Is a second sorting condition necessary?

---

## 04. Aggregate Functions

### Key Things to Remember

Main aggregate functions:

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

Aggregate functions reduce multiple rows into calculated results.

Important distinction:

- Without `GROUP BY`: calculate one result for the entire result set.
- With `GROUP BY`: calculate one result for each group.

`COUNT(*)` counts rows.

`COUNT(column)` counts non-NULL values in that column.

`SUM()`, `AVG()`, `MIN()`, and `MAX()` generally ignore NULL values.

### Problem-Solving Mindset

Ask:

- What value needs to be calculated?
- Am I counting, totaling, averaging, finding a minimum, or finding a maximum?
- Do I need one overall result?
- Do I need one result for each group?
- Can NULL values affect the result?

---

## 05. GROUP BY

### Key Things to Remember

- `GROUP BY` divides rows into groups.
- Aggregate functions can then calculate values for each group.
- Every selected non-aggregate column generally needs to be included in `GROUP BY`.

Example concept:

```sql
SELECT CLUB_ID,
        COUNT(*)
FROM PLAYER
GROUP BY CLUB_ID
```

This produces one result for each club.

### Problem-Solving Mindset

Ask:

- What defines a group?
- Do I need one result per club, position, country, or another category?
- Which column should I group by?
- Which aggregate function should be applied to each group?

---

## 06. HAVING

### Key Things to Remember

- `WHERE` filters rows.
- `HAVING` filters groups after `GROUP BY`.

Use `HAVING` when the condition depends on an aggregate result.

Example:

```sql
GROUP BY CLUB_ID
HAVING COUNT(*) > 2
```

### Problem-Solving Mindset

Ask:

- Am I filtering individual rows?
- Or am I filtering groups based on an aggregate value?

If the condition involves `COUNT()`, `SUM()`, `AVG()`, `MIN()`, or `MAX()` after grouping, think about `HAVING`.

---

## 07. JOINs

### Key Things to Remember

JOINs combine related rows from different tables.

Important types:

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`

The join condition normally connects related columns, often a primary key and foreign key.

### Problem-Solving Mindset

Ask:

- Which tables contain the information I need?
- How are those tables related?
- Which key connects them?
- Do I want only matching rows?
- Should rows from the left table remain even without a match?

Do not use `JOIN` simply because multiple tables are involved. Understand the relationship first.

---

## 08. Subqueries

### Key Things to Remember

A subquery is a query inside another query.

It can be used to:

- Compare a value with another query result.
- Filter rows.
- Provide a temporary result for another query.
- Check whether related data exists.

### Problem-Solving Mindset

Ask:

- Do I need the result of one query to answer another query?
- Should the inner query return:

  * One value?
  * Multiple values?
  * A set of rows?
- Would a `JOIN` be clearer for this problem?

---

## 09. Views

### Key Things to Remember

- A view is a saved query.
- A view does not normally store a separate copy of the underlying data.
- Views can simplify frequently used queries.
- Views can hide unnecessary complexity from users.

### Problem-Solving Mindset

Ask:

- Is this query used repeatedly?
- Would a saved query make the database easier to use?
- Should users see the underlying tables directly?

---

## 10. Built-in Functions

### Key Things to Remember

Built-in functions provide predefined operations for common tasks.

They can work with:

- Strings
- Dates
- Numbers
- NULL values
- Other SQL Server data types

### Problem-Solving Mindset

Ask:

- What type of data am I working with?
- Is there already a SQL Server function that solves this problem?
- Am I transforming, calculating, extracting, or formatting a value?

Do not memorize functions without understanding the problem they solve.

---

## 11. User-Defined Functions

### Key Things to Remember

A user-defined function allows reusable custom logic.

Important concepts:

- Input parameters
- Return values
- Scalar functions
- Table-valued functions

A function should generally represent reusable logic that produces a value or result.

### Problem-Solving Mindset

Ask:

- Is this logic reusable?
- Should the logic return one value or a table?
- What parameters does the function need?
- Can the function make the query easier to understand?

---

## 12. Stored Procedures

### Key Things to Remember

Stored procedures contain reusable SQL statements and can accept parameters.

They are useful for:

- Performing database operations
- Encapsulating business logic
- Reusing complex operations
- Controlling how database operations are executed

### Problem-Solving Mindset

Ask:

- Is this a sequence of database operations that should be executed together?
- Does it need input parameters?
- Should the procedure modify data?
- Should it return a result set?

---

## 13. Triggers

### Key Things to Remember

A trigger automatically executes when a specified database event occurs.

Common events:

- `INSERT`
- `UPDATE`
- `DELETE`

Important virtual tables:

- `inserted`
- `deleted`

Remember:

- `inserted` represents new values.
- `deleted` represents old values or deleted rows.
- A trigger must handle multiple rows.
- A trigger can prevent an operation by rolling back the transaction.

### Problem-Solving Mindset

Before writing a trigger:

- Which event should activate it?
- Should I use `inserted`, `deleted`, or both?
- Can multiple rows be affected?
- Should the operation continue or be blocked?
- Could the trigger negatively affect database performance?

Triggers should protect data consistency without making database behavior unnecessarily difficult to maintain.

---

## 14. Transactions

### Key Things to Remember

A transaction groups one or more database operations into a single unit of work.

Main commands:

- `BEGIN TRANSACTION`
- `COMMIT TRANSACTION`
- `ROLLBACK TRANSACTION`
- `SAVE TRANSACTION`

A transaction follows the ACID principles:

- Atomicity
- Consistency
- Isolation
- Durability

A savepoint allows a partial rollback without ending the entire transaction.

Advanced transaction concepts:

- `TRY...CATCH`
- `SAVE TRANSACTION`
- `@@TRANCOUNT`
- `XACT_STATE()`

`@@TRANCOUNT` shows the number of active transactions.

`XACT_STATE()` indicates whether the current transaction is:

- Committable
- Uncommittable
- Not active

### Problem-Solving Mindset

Ask:

- Which operations should belong to the same unit of work?
- Should all changes succeed together?
- Should I commit or roll back?
- Do I need a savepoint?
- Where should the savepoint be created?
- What should happen if an error occurs?
- Should the entire transaction or only part of it be rolled back?

A savepoint does not end the transaction.

---

## 15. UNION

### Key Things to Remember

`UNION` combines the results of multiple `SELECT` statements vertically.

`UNION` removes duplicate rows.

`UNION ALL` preserves duplicate rows.

The combined `SELECT` statements must have:

- The same number of columns.
- Compatible data types in corresponding positions.

The final `ORDER BY` normally applies to the combined result.

The output column names are normally determined by the first `SELECT`.

### UNION vs JOIN

Do not confuse `UNION` with `JOIN`.

- `UNION` stacks compatible result sets vertically.
- `JOIN` combines related rows horizontally.

### Problem-Solving Mindset

Ask:

- Am I combining result sets or joining related rows?
- Should duplicate rows be removed?
- Should duplicates remain?
- Do both `SELECT` statements have compatible structures?
- Should filtering happen before the `UNION`?
- Where should the final `ORDER BY` be applied?

---

## 16. Indexes

### Key Things to Remember

An index is a database structure designed to help SQL Server find data more efficiently.

Think of an index as an organized lookup structure rather than another copy of the table.

Important concepts:

- Clustered index
- Nonclustered index
- Composite index
- Included columns
- Index maintenance
- Index design

A table can have only one clustered index because the clustered index determines the physical order of the table's data.

A table can have multiple nonclustered indexes.

Included columns are stored with a nonclustered index to help cover queries without making those columns part of the index key.

Indexes can improve read performance, but they are not free.

They can:

- Require storage.
- Increase the cost of `INSERT`, `UPDATE`, and `DELETE`.
- Require maintenance.
- Become unnecessary or redundant if poorly designed.

### Problem-Solving Mindset

Before creating an index:

- Which columns are frequently searched or filtered?
- Which columns are used together?
- Which column should be the first key in a composite index?
- Should the index be clustered or nonclustered?
- Which columns should be index keys?
- Which columns should be included columns?
- Could an existing index already solve the problem?
- Will the index improve performance enough to justify its maintenance cost?

Do not create indexes simply because an index exists as a feature.

The goal is to design indexes based on actual query patterns and database workload.

---

# General SQL Problem-Solving Process

Before writing a query, try to answer these questions:

1. **What information do I need?**
2. **Which table contains it?**
3. **Do I need another table?**
4. **How are the tables related?**
5. **Which rows should be included?**
6. **Do I need grouping?**
7. **Do I need aggregation?**
8. **Do I need to filter groups?**
9. **Do I need to sort the result?**
10. **Am I combining result sets or joining related data?**
11. **Could the query return duplicate rows?**
12. **Is there a simpler SQL feature that solves the problem?**
13. **Could the query become expensive on a large dataset?**

---

# General Performance Mindset

A query that works on a small dataset may not perform well on a large database.

When thinking about performance, consider:

- How many rows are involved?
- Which columns are being filtered?
- Are appropriate indexes available?
- Is the query reading more data than necessary?
- Are joins using appropriate keys?
- Is the database doing unnecessary work?
- Could an index improve the query?
- Could an index also make writes more expensive?

The goal is not to make every query complicated.

The goal is to make the database perform the necessary work **efficiently and correctly**.

---

# Final Learning Principle

Do not start by asking:

> "What SQL syntax should I use?"

Start by asking:

> "What result do I need, and what is the most appropriate database operation to produce it?"

SQL syntax is the tool.

Understanding the data, relationships, requirements, and expected result is the actual skill.
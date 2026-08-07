# SQL Foundations - Notes

## 1. SELECT

Before writing a query, identify the data that needs to be retrieved.

* Select only the columns that are needed.
* Use the correct table and column names.
* Use aliases when they make the query easier to read.
* Avoid `SELECT *` when only specific columns are required.

---

## 2. WHERE

The `WHERE` clause filters individual rows before further processing.

* Choose the correct comparison operator.
* Common operators include `=`, `<>`, `>`, `<`, `>=`, `<=`, `IN`, `BETWEEN`, and `LIKE`.
* Use `IS NULL` or `IS NOT NULL` when working with `NULL`.
* Do not use `= NULL`.

---

## 3. ORDER BY

Before using `ORDER BY`, identify how the result should be sorted.

* `ASC` sorts values in ascending order.
* `DESC` sorts values in descending order.
* Multiple columns can be used for sorting.
* Consider the order of the columns when multiple sorting conditions are used.

---

## 4. Aggregate Functions

Aggregate functions summarize multiple rows into a result.

* `COUNT()` → counts rows or values.
* `SUM()` → calculates a total.
* `AVG()` → calculates an average.
* `MIN()` → returns the minimum value.
* `MAX()` → returns the maximum value.
* Understand the difference between `COUNT(*)` and `COUNT(column)`.
* `COUNT(column)` does not count `NULL` values.

Before using an aggregate function, determine what needs to be summarized.

---

## 5. GROUP BY

`GROUP BY` changes the way data is analyzed by creating groups of rows with the same values.

Before writing `GROUP BY`, ask:

* What should each group represent?
* Which columns define the groups?
* Which aggregate function should be used?

Remember:

* Every selected column that is not inside an aggregate function must appear in the `GROUP BY` clause.
* Multiple columns can be used to create groups.
* `GROUP BY` is commonly used with aggregate functions.

---

## 6. HAVING

`HAVING` filters groups after grouping.

The main distinction is:

* `WHERE` filters individual rows before grouping.
* `HAVING` filters groups after grouping.

Use `HAVING` when the condition depends on an aggregate result such as:

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

Before writing `HAVING`, ask whether the condition applies to individual rows or to an entire group.

---

## 7. JOINs

Before writing a `JOIN`, understand the relationship between the tables.

Ask:

* Which tables need to be combined?
* Which columns connect the tables?
* Where are the primary keys and foreign keys?
* Which table's rows must always be preserved?
* Should unmatched rows be included?

### JOIN Selection

* `INNER JOIN` → returns matching rows from both tables.
* `LEFT JOIN` → keeps all rows from the left table.
* `RIGHT JOIN` → keeps all rows from the right table.
* `FULL OUTER JOIN` → keeps all rows from both tables.
* `CROSS JOIN` → produces every possible combination of rows.
* `SELF JOIN` → joins a table with itself.

Be careful when using `LEFT JOIN` or other outer joins with `WHERE` conditions. A condition in `WHERE` can remove rows that would otherwise be preserved by the outer join.

---

## 8. Subqueries

Before writing a subquery, determine what result the inner query needs to provide.

Ask:

* Should the subquery return one value?
* Can it return multiple values?
* Do I only need to check whether matching rows exist?
* Does the subquery depend on the current row of the outer query?

### Operator Selection

* Comparison operators such as `=`, `>`, `<`, `>=`, `<=`, and `<>` can be used when comparing with a single result.
* `IN` can be used when the subquery returns multiple values.
* `EXISTS` can be used when only row existence matters.
* `ANY` and `ALL` can be used for comparisons against multiple values.

Pay attention to the difference between:

* Single-row subqueries
* Multiple-row subqueries
* Correlated subqueries

A correlated subquery depends on values from the outer query, so its execution behavior should be considered carefully.

---

## 9. Views

Before creating a view, ask:

* Is this query used frequently?
* Would a virtual table make data retrieval easier?
* Should only specific columns or data be exposed?
* Would the view simplify a complex query?

Remember:

* A view is a virtual table created from a SQL query.
* A view does not store a separate copy of the data in the same way as a normal table.
* A view retrieves data from its underlying tables.
* Changes to the underlying data are reflected when the view is queried.

Views can be useful for simplifying queries and controlling which data users can access.

---

## 10. Built-in Functions

Choose a function based on the type of operation that needs to be performed.

### Function Categories

* Aggregate functions → summarize data.
* String functions → manipulate text.
* Date and time functions → work with dates and times.
* Mathematical functions → perform mathematical operations.
* Conversion functions → convert data between data types.

Before using a function, consider:

* What is the input data type?
* What does the function return?
* Can the input contain `NULL`?
* Is the function appropriate for the required operation?

---

## 11. User-Defined Functions

Before creating a user-defined function, ask:

* Is this logic reused multiple times?
* Should the function return a single value or a table?
* Does the function need parameters?

### Function Selection

* Scalar function → returns a single value.
* Table-valued function → returns a table.

UDFs are useful when the same logic needs to be reused.

However, do not create a function simply to make a query more complicated. The function should provide a clear benefit such as reusable logic or better organization.

---

## 12. Stored Procedures

Before creating a stored procedure, ask:

* Is this operation performed repeatedly?
* Does it require parameters?
* Does it retrieve data, modify data, or perform multiple operations?
* Does it need a transaction?

Remember:

* A function is designed to return a value.
* A stored procedure is designed to perform one or more operations.
* A stored procedure can return result sets, output parameters, or no value.
* Stored procedures can contain operations such as `INSERT`, `UPDATE`, `DELETE`, and `SELECT`.

Choose a stored procedure when the main purpose is to perform a reusable database operation.

---

## 13. Triggers

Before creating a trigger, ask:

* Which event should activate the trigger?
* Is the event `INSERT`, `UPDATE`, or `DELETE`?
* Should the operation be allowed or prevented?
* Should the trigger use `inserted`, `deleted`, or both?
* Can multiple rows be affected by the statement?
* Will the trigger negatively affect database performance?

Remember:

* Triggers execute automatically.
* Triggers cannot be executed manually using `EXEC`.
* `inserted` contains the new rows.
* `deleted` contains the old or deleted rows.
* `AFTER` triggers execute after the triggering operation succeeds.
* `INSTEAD OF` triggers replace the original operation.

### Important

Never assume that a trigger affects only one row.

A single `INSERT`, `UPDATE`, or `DELETE` statement can affect multiple rows, so trigger logic should be written to handle sets of rows.

---

## 14. Transactions

Before using a transaction, ask:

* Which operations should belong to the same unit of work?
* Should all operations succeed together?
* What should happen if one operation fails?
* Should the transaction be committed or rolled back?
* Do I need a savepoint?
* Do I need `TRY...CATCH`?

### Basic Transaction

```sql
BEGIN TRANSACTION

-- operations

COMMIT TRANSACTION
```

To undo the entire transaction:

```sql
ROLLBACK TRANSACTION
```

### Savepoints

A savepoint allows part of an active transaction to be rolled back.

```sql
SAVE TRANSACTION SavepointName
```

Then:

```sql
ROLLBACK TRANSACTION SavepointName
```

Remember:

* A savepoint does not end the transaction.
* Rolling back to a savepoint removes changes made after that savepoint.
* Changes made before the savepoint remain in the transaction.
* The transaction must still be committed or fully rolled back afterward.
* A transaction can contain multiple savepoints.

### TRY...CATCH

Use `TRY...CATCH` when controlled error handling is required.

```sql
BEGIN TRY
    BEGIN TRANSACTION

    -- operations

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH
```

---

## 15. Indexes

Before creating an index, do not start by asking:

> Which column should I index?

Instead, ask:

> Which query needs to be improved?

Consider:

* Which columns are frequently used in `WHERE` conditions?
* Which columns are frequently used in `JOIN` conditions?
* Which columns are frequently used for sorting?
* Which columns are commonly used together?
* Is an existing index already sufficient?
* Could the new index be unnecessary or redundant?
* Will the index improve the target query enough to justify its maintenance cost?

### Clustered Index

A clustered index determines the physical order of the data rows according to the index key.

Remember:

* A table can have only one clustered index.
* The clustered index should be chosen carefully because the table's rows are organized according to it.

### Nonclustered Index

A nonclustered index is a separate index structure that helps SQL Server locate rows efficiently.

Remember:

* A table can have multiple nonclustered indexes.
* Nonclustered indexes do not determine the physical order of the table's data rows.
* Each additional index requires storage and maintenance.

### Composite Index

A composite index uses multiple columns as index keys.

```sql
CREATE INDEX IndexName
ON TableName (Column1, Column2)
```

The order of the key columns matters.

For example:

```text
(ColumnA, ColumnB)
```

is not equivalent to:

```text
(ColumnB, ColumnA)
```

Choose the column order based on how the target queries filter, join, or sort the data.

### INCLUDE Columns

`INCLUDE` adds non-key columns to a nonclustered index.

```sql
CREATE INDEX IX_PLAYER_CLUB
ON PLAYER (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)
```

In this example:

* `CLUB_ID` is the index key.
* `PLAYER_NAME`, `POSITION`, and `JERSEY_NUMBER` are included columns.
* The included columns are not additional search keys.
* `INCLUDE` can allow the index to provide additional requested columns without requiring another lookup to the base table in some queries.

Do not think of `INCLUDE` as a backup search area that SQL Server checks after failing to find the index key. That is not how it works.

---

# General SQL Problem-Solving Process

When solving a new SQL problem:

### 1. Understand the requirement

Identify exactly what the query or operation needs to accomplish.

### 2. Identify the tables

Determine which table or tables contain the required data.

### 3. Identify the columns

Determine which columns need to be selected, filtered, grouped, updated, or compared.

### 4. Identify relationships

If multiple tables are involved, determine how they are related before writing the `JOIN`.

### 5. Determine the filtering stage

Ask whether the condition applies to:

* Individual rows → `WHERE`
* Groups → `HAVING`

### 6. Determine whether aggregation is required

If the problem asks for totals, counts, averages, minimums, or maximums, consider aggregate functions.

### 7. Determine whether grouping is required

If the result needs to be summarized by categories or groups, use `GROUP BY`.

### 8. Determine whether a subquery is appropriate

If one query needs the result of another query, consider a subquery.

### 9. Determine whether reusable logic is required

If the same logic is used repeatedly:

* Consider a UDF when the goal is reusable function logic.
* Consider a stored procedure when the goal is to perform a reusable database operation.

### 10. Determine whether automatic behavior is required

If something should happen automatically after `INSERT`, `UPDATE`, or `DELETE`, consider a trigger.

### 11. Determine whether transaction control is required

If multiple operations must succeed or fail together, consider a transaction.

### 12. Consider performance

If a query is frequently executed or works with a large amount of data, consider whether an appropriate index could improve performance.

### 13. Check edge cases

Before considering the solution complete, think about:

* `NULL` values
* Duplicate values
* Multiple-row operations
* Missing relationships
* Empty result sets
* Invalid input
* Constraint violations
* Transaction failures

---

# Final Checklist

Before considering a SQL solution complete:

* [ ] Did I use the correct table?
* [ ] Did I select the correct columns?
* [ ] Are the table relationships correct?
* [ ] Did I choose the correct `JOIN` type?
* [ ] Should the condition use `WHERE` or `HAVING`?
* [ ] Are aggregate functions used correctly?
* [ ] Does every non-aggregated selected column appear in `GROUP BY`?
* [ ] Can the query return multiple rows when only one value is expected?
* [ ] Are `NULL` values handled correctly?
* [ ] Could the operation affect multiple rows?
* [ ] If modifying data, should it be inside a transaction?
* [ ] If an error occurs, what should happen?
* [ ] Is a trigger actually necessary?
* [ ] Is the trigger designed to handle multiple affected rows?
* [ ] Is an index actually necessary?
* [ ] Is the index designed around the target query?
* [ ] Is the index redundant with an existing index?
* [ ] Are composite index columns ordered appropriately?
* [ ] Are `INCLUDE` columns being used for the correct purpose?
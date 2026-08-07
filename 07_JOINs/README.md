# JOIN Clause

## Definition

The `JOIN` clause is used to combine data from two or more related tables based on a common column.

It allows SQL Server to retrieve related information from multiple tables in a single query.

---

## Characteristics

- Combines data from two or more tables.
- Uses related columns, typically primary keys and foreign keys.
- Supports different join types for different query requirements.
- Can be combined with `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY`.
- Is essential when working with relational databases.

---

## Types of JOIN

### INNER JOIN

Returns only the rows that have matching values in both tables.

### LEFT JOIN

Returns all rows from the left table and the matching rows from the right table.

If there is no match, `NULL` values are returned for the right table.

### RIGHT JOIN

Returns all rows from the right table and the matching rows from the left table.

If there is no match, `NULL` values are returned for the left table.

### FULL OUTER JOIN

Returns all rows from both tables.

If there is no matching row, the missing side is filled with `NULL` values.

### CROSS JOIN

Returns every possible combination of rows from both tables.

No matching condition is required.

### SELF JOIN

Joins a table with itself.

It is useful for comparing rows within the same table.

---

## Topics

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

---

## When to Use

Use the `JOIN` clause whenever you need to:

- Retrieve related data from multiple tables.
- Combine information stored in different tables.
- Build reports that require data from several entities.
- Analyze relationships between tables in a relational database.

---

## Learning Outcome

After completing this module, I will be able to combine data from multiple related tables by using different `JOIN` types.

I will understand the differences between `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`, and `SELF JOIN`, and choose the appropriate join type for different scenarios.

I will also be able to combine `JOIN` with other SQL clauses such as `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY` to write more complex SQL queries.
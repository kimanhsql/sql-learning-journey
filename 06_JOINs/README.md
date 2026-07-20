# JOINs

## Overview

JOIN is used to combine two or more tables based on related columns.

The related columns are used to connect the tables and retrieve data from multiple tables in a single query.

Without JOINs, it is difficult to retrieve related data correctly because SQL Server cannot determine how the tables are connected.

JOINs are commonly used when tables have relationships, such as primary keys and foreign keys.

## JOINs Types

1. INNER JOIN

Returns only the rows that have matching values in both tables.

2. LEFT JOIN

Returns all rows from the left table and the matching rows from the right table.

If there is no match, NULL values are returned for the right table.

3. RIGHT JOIN

Returns all rows from the right table and the matching rows from the left table.

If there is no match, NULL values are returned for the left table.

4. FULL OUTER JOIN

Returns all rows from both tables.

If there is no matching row, the missing side is filled with NULL values.

5. CROSS JOIN

Returns every possible combination of rows from both tables.

No matching condition is required.

6. SELF JOIN

Joins a table with itself.

It is useful when comparing rows within the same table.

## Topics

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

## Learning Outcome

After completing this module, I will be able to combine two or more related tables using `JOIN` clauses.

I will understand the differences between `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`, and `SELF JOIN`.

I will also know when to use `JOIN` together with other SQL clauses such as `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY`.
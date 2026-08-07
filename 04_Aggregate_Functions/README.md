# Aggregate Functions

## Definition

An aggregate function performs a calculation on multiple rows and returns a single result.

Aggregate functions are commonly used to summarize and analyze data.

They are often used together with `GROUP BY` when a separate result is required for each group.

---

## Characteristics

* Aggregate functions process multiple rows.
* They return a summarized result.
* They can be used with or without `GROUP BY`.
* They are commonly used with `GROUP BY` and `HAVING`.
* Most aggregate functions ignore `NULL` values.
* `COUNT(*)` counts rows, including rows containing `NULL` values.
* Aggregate functions can be used with `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY`.

---

## Main Aggregate Functions

### COUNT()

Counts rows or non-NULL values in a column.

```sql
COUNT(*)
COUNT(column_name)
```

### SUM()

Returns the total of numeric values.

```sql
SUM(column_name)
```

### AVG()

Returns the average of numeric values.

```sql
AVG(column_name)
```

### MIN()

Returns the smallest value.

```sql
MIN(column_name)
```

### MAX()

Returns the largest value.

```sql
MAX(column_name)
```

---

## COUNT(*) vs COUNT(column_name)

`COUNT(*)` counts all rows.

`COUNT(column_name)` counts only rows where the specified column is not `NULL`.

This difference is important when working with nullable columns.

---

## Aggregate Functions with GROUP BY

Without `GROUP BY`, an aggregate function can summarize the entire result set.

With `GROUP BY`, the data is divided into groups and the aggregate function is calculated separately for each group.

Example:

```sql
SELECT CLUB_ID,
       COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID;
```

---

## Aggregate Functions with HAVING

`HAVING` filters groups after aggregation.

Example:

```sql
SELECT CLUB_ID,
       COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID
HAVING COUNT(PLAYER_ID) > 5;
```

---

## Aggregate Functions with WHERE

`WHERE` filters rows before aggregation.

Example:

```sql
SELECT COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER
WHERE POSITION = 'Forward';
```

The order of operations matters:

1. `WHERE` filters rows.
2. `GROUP BY` creates groups.
3. Aggregate functions calculate values for each group.
4. `HAVING` filters groups.

---

## When to Use Aggregate Functions

Use aggregate functions when you need to:

* Count records
* Calculate totals
* Calculate averages
* Find minimum or maximum values
* Summarize data by category
* Analyze grouped data
* Filter groups based on calculated results

---

## Learning Outcome

After completing this module, I will be able to use aggregate functions to summarize and analyze data in SQL Server.

I will also understand how aggregate functions work with `WHERE`, `GROUP BY`, and `HAVING`, and how to choose the appropriate aggregate function for different situations.
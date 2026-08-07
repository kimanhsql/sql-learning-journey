# Syntax

## 1. UNION

```sql
SELECT column1, column2
FROM table1

UNION

SELECT column1, column2
FROM table2;
```

---

## 2. UNION ALL

```sql
SELECT column1, column2
FROM table1

UNION ALL

SELECT column1, column2
FROM table2;
```

---

## 3. UNION with ORDER BY

```sql
SELECT column1, column2
FROM table1

UNION

SELECT column1, column2
FROM table2

ORDER BY column1;
```

---

## 4. UNION with WHERE

```sql
SELECT column1, column2
FROM table1
WHERE condition

UNION

SELECT column1, column2
FROM table2
WHERE condition;
```

---

## 5. UNION with JOIN

Each individual `SELECT` statement can contain joins.

```sql
SELECT column1, column2
FROM table1
INNER JOIN table2
ON table1.id = table2.id

UNION

SELECT column1, column2
FROM table3
INNER JOIN table4
ON table3.id = table4.id;
```

---

## Notes

* Every `SELECT` must return the same number of columns.
* Corresponding columns must have compatible data types.
* Column order matters.
* The column names in the final result normally come from the first `SELECT`.
* `UNION` removes duplicates.
* `UNION ALL` keeps duplicates.
* `ORDER BY` should be applied to the final combined result.
* `UNION` combines rows vertically.
* `JOIN` combines related columns horizontally.
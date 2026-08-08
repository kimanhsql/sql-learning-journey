# Syntax

## 1. Subquery in WHERE clause (Single-row Subquery)

```sql
SELECT column_name
FROM table_name
WHERE column_name operator
(
    SELECT column_name
    FROM table_name
)
```

---

## 2. Subquery in WHERE clause (Multiple-row Subquery)

```sql
SELECT column_name
FROM table_name
WHERE column_name IN
(
    SELECT column_name
    FROM table_name
)
```

---

## 3. Subquery in FROM clause

```sql
SELECT column_name
FROM
(
    SELECT column_name
    FROM table_name
) AS alias_name
```

---

## 4. Subquery in SELECT clause

```sql
SELECT column_name,
(
    SELECT aggregate_function(column_name)
    FROM table_name
) AS alias_name
FROM table_name
```
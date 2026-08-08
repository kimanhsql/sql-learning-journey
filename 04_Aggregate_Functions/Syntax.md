# Syntax

## 1. COUNT

```sql
SELECT COUNT(*)
FROM table_name
```

```sql
SELECT COUNT(column_name)
FROM table_name
```

---

## 2. SUM

```sql
SELECT SUM(column_name)
FROM table_name
```

---

## 3. AVG

```sql
SELECT AVG(column_name)
FROM table_name
```

---

## 4. MIN

```sql
SELECT MIN(column_name)
FROM table_name
```

---

## 5. MAX

```sql
SELECT MAX(column_name)
FROM table_name
```

---

## 6. Aggregate Function with WHERE

```sql
SELECT AGGREGATE_FUNCTION(column_name)
FROM table_name
WHERE condition
```

---

## 7. Aggregate Function with GROUP BY

```sql
SELECT group_column,
        AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY group_column
```

---

## 8. Aggregate Function with HAVING

```sql
SELECT group_column,
        AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY group_column
HAVING AGGREGATE_FUNCTION(column_name) condition
```

---

## 9. Aggregate Function with ORDER BY

```sql
SELECT group_column,
        AGGREGATE_FUNCTION(column_name) AS result
FROM table_name
GROUP BY group_column
ORDER BY result
```
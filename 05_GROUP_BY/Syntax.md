# Syntax

## 1. Basic GROUP BY

```sql
SELECT column_name
FROM table_name
GROUP BY column_name
```

---

## 2. GROUP BY with COUNT()

```sql
SELECT column_name,
       COUNT(*)
FROM table_name
GROUP BY column_name
```

---

## 3. GROUP BY with SUM()

```sql
SELECT column_name,
        SUM(column_name)
FROM table_name
GROUP BY column_name
```

---

## 4. GROUP BY with AVG()

```sql
SELECT column_name,
        AVG(column_name)
FROM table_name
GROUP BY column_name
```

---

## 5. GROUP BY with MAX()

```sql
SELECT column_name,
        MAX(column_name)
FROM table_name
GROUP BY column_name
```

---

## 6. GROUP BY with MIN()

```sql
SELECT column_name,
        MIN(column_name)
FROM table_name
GROUP BY column_name
```

---

## 7. GROUP BY Multiple Columns

```sql
SELECT column1,
        column2,
        COUNT(*)
FROM table_name
GROUP BY column1,
        column2
```

---

## 8. GROUP BY with WHERE

```sql
SELECT column_name,
        COUNT(*)
FROM table_name
WHERE condition
GROUP BY column_name
```

---

## 9. GROUP BY with ORDER BY

```sql
SELECT column_name,
        COUNT(*)
FROM table_name
GROUP BY column_name
ORDER BY column_name
```
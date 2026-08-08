# Syntax

## 1. Basic WHERE

```sql
SELECT column_name
FROM table_name
WHERE condition
```

---

## 2. Comparison Operators

```sql
SELECT column_name
FROM table_name
WHERE column_name = value

SELECT column_name
FROM table_name
WHERE column_name <> value

SELECT column_name
FROM table_name
WHERE column_name > value

SELECT column_name
FROM table_name
WHERE column_name >= value

SELECT column_name
FROM table_name
WHERE column_name < value

SELECT column_name
FROM table_name
WHERE column_name <= value
```

---

## 3. AND

```sql
SELECT column_name
FROM table_name
WHERE condition1
    AND condition2
```

---

## 4. OR

```sql
SELECT column_name
FROM table_name
WHERE condition1
    OR condition2
```

---

## 5. NOT

```sql
SELECT column_name
FROM table_name
WHERE NOT condition
```

---

## 6. BETWEEN

```sql
SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2
```

---

## 7. IN

```sql
SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, value3)
```

---

## 8. LIKE

```sql
SELECT column_name
FROM table_name
WHERE column_name LIKE pattern
```

---

## 9. IS NULL

```sql
SELECT column_name
FROM table_name
WHERE column_name IS NULL
```

---

## 10. IS NOT NULL

```sql
SELECT column_name
FROM table_name
WHERE column_name IS NOT NULL
```
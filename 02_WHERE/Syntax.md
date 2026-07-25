# Syntax

## Basic WHERE

```sql
SELECT column_name
FROM table_name
WHERE condition
```

---

## Comparison Operators

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

## AND

```sql
SELECT column_name
FROM table_name
WHERE condition1
    AND condition2
```

---

## OR

```sql
SELECT column_name
FROM table_name
WHERE condition1
    OR condition2
```

---

## NOT

```sql
SELECT column_name
FROM table_name
WHERE NOT condition
```

---

## BETWEEN

```sql
SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2
```

---

## IN

```sql
SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, value3)
```

---

## LIKE

```sql
SELECT column_name
FROM table_name
WHERE column_name LIKE pattern
```

---

## IS NULL

```sql
SELECT column_name
FROM table_name
WHERE column_name IS NULL
```

---

## IS NOT NULL

```sql
SELECT column_name
FROM table_name
WHERE column_name IS NOT NULL
```
# Syntax

## 1. Basic ORDER BY

```sql
SELECT column_name
FROM table_name
ORDER BY column_name
```

---

## 2. Ascending Order

```sql
SELECT column_name
FROM table_name
ORDER BY column_name ASC
```

---

## 3. Descending Order

```sql
SELECT column_name
FROM table_name
ORDER BY column_name DESC
```

---

## 4. Multiple Columns

```sql
SELECT column1,
        column2
FROM table_name
ORDER BY column1 ASC,
        column2 DESC
```

---

## 5. Order by Alias

```sql
SELECT column_name AS alias_name
FROM table_name
ORDER BY alias_name
```

---

## 6. Order by Column Position

```sql
SELECT column1,
        column2
FROM table_name
ORDER BY 1
```
# Syntax

## 1. Create a View

```sql
CREATE VIEW view_name
AS
SELECT column1,
        column2, ...
FROM table_name
WHERE condition
```

---

## 2. Query a View

```sql
SELECT *
FROM view_name
```

---

## 3. Update a View

```sql
UPDATE view_name
SET column_name = value
WHERE condition
```

---

## 4. Alter a View

```sql
ALTER VIEW view_name
AS
SELECT column1,
        column2, ...
FROM table_name
WHERE condition
```

---

## 5. Drop a View

```sql
DROP VIEW view_name
```
# Syntax

## Basic SYNTAX

```sql
SELECT column_name,
       aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition
```

---

## HAVING with COUNT

```sql
SELECT column_name,
       COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > value
```

---

## HAVING with SUM

```sql
SELECT column_name,
       SUM(column_name)
FROM table_name
GROUP BY column_name
HAVING SUM(column_name) > value
```

---

## HAVING with AVG

```sql
SELECT column_name,
       AVG(column_name)
FROM table_name
GROUP BY column_name
HAVING AVG(column_name) >= value
```

---

## HAVING with MIN

```sql
SELECT column_name,
       MIN(column_name)
FROM table_name
GROUP BY column_name
HAVING MIN(column_name) >= value
```

---

## HAVING with MAX

```sql
SELECT column_name,
       MAX(column_name)
FROM table_name
GROUP BY column_name
HAVING MAX(column_name) <= value
```
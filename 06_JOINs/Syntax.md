# Syntax

## INNER JOIN

```sql
SELECT column_name
FROM table1 T1
INNER JOIN table2 T2
ON T1.column_name = T2.column_name
```

---

## LEFT OUTER JOIN

```sql
SELECT column_name
FROM table1 T1
LEFT OUTER JOIN table2 T2
ON T1.column_name = T2.column_name
```

---

## RIGHT OUTER JOIN

```sql
SELECT column_name
FROM table1 T1
RIGHT OUTER JOIN table2 T2
ON T1.column_name = T2.column_name
```

---

## FULL OUTER JOIN

```sql
SELECT column_name
FROM table1 T1
FULL OUTER JOIN table2 T2
ON T1.column_name = T2.column_name
```

---

## CROSS JOIN

```sql
SELECT column_name
FROM table1
CROSS JOIN table2
```

---

## SELF JOIN

```sql
SELECT column_name
FROM table1 T1
INNER JOIN table1 T2
ON T1.column_name = T2.column_name
```
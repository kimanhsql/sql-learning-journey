# Syntax

## 1. Aggregate Functions

```sql
SELECT COUNT(column_name)
FROM table_name
```

```sql
SELECT SUM(column_name)
FROM table_name
```

```sql
SELECT AVG(column_name)
FROM table_name
```

```sql
SELECT MIN(column_name)
FROM table_name
```

```sql
SELECT MAX(column_name)
FROM table_name
```

---

## 2. String Functions

```sql
SELECT LEN(column_name)
FROM table_name
```

```sql
SELECT UPPER(column_name)
FROM table_name
```

```sql
SELECT LOWER(column_name)
FROM table_name
```

```sql
SELECT LEFT(column_name, number)
```

```sql
SELECT RIGHT(column_name, number)
```

```sql
SELECT SUBSTRING(column_name, start, length)
FROM table_name
```

```sql
SELECT CONCAT(column1, column2, ...)
FROM table_name
```

---

## 3. Date and Time Functions

```sql
SELECT GETDATE()
```

```sql
SELECT YEAR(date_column)
FROM table_name
```

```sql
SELECT MONTH(date_column)
FROM table_name
```

```sql
SELECT DAY(date_column)
FROM table_name
```

```sql
SELECT DATEADD(datepart, number, date)
```

```sql
SELECT DATEDIFF(datepart, start_date, end_date)
```

---

## 4. Mathematical Functions

```sql
SELECT ABS(number)
```

```sql
SELECT CEILING(number)
```

```sql
SELECT FLOOR(number)
```

```sql
SELECT ROUND(number, decimals)
```

```sql
SELECT POWER(number, exponent)
```

---

## 5. Conversion Functions

```sql
SELECT CAST(expression AS data_type)
```

```sql
SELECT CONVERT(data_type, expression)
```
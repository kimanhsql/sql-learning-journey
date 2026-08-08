# Syntax

## 1. Scalar Function

```sql
CREATE FUNCTION function_name (@parameter data_type)
RETURNS return_data_type
AS
BEGIN
    RETURN expression
END
```

---

## 2. Table-Valued Function

```sql
CREATE FUNCTION function_name (@parameter data_type)
RETURNS TABLE
AS
RETURN
(
    SELECT column1,
            column2, ...
    FROM table_name
    WHERE condition
)
```

---

## 3. Use a Function

```sql
SELECT dbo.function_name(parameter_value)
```

---

## 4. Drop a Function

```sql
DROP FUNCTION function_name
```
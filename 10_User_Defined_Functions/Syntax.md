# Syntax

## Scalar Function

```sql
CREATE FUNCTION function_name (@parameter data_type)
RETURNS return_data_type
AS
BEGIN
    RETURN expression
END
```

---

## Table-Valued Function

```sql
CREATE FUNCTION function_name (@parameter data_type)
RETURNS TABLE
AS
RETURN
(
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)
```

---

## Use a Function

```sql
SELECT dbo.function_name(parameter_value)
```

---

## Drop a Function

```sql
DROP FUNCTION function_name
```
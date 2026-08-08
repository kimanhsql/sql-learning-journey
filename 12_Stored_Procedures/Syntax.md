# Syntax

## 1. Create a Stored Procedure

```sql
CREATE PROCEDURE procedure_name
AS
BEGIN
    -- SQL statements
END
```

---

## 2. Create a Stored Procedure with Parameters

```sql
CREATE PROCEDURE procedure_name
    @parameter1 data_type,
    @parameter2 data_type
AS
BEGIN
    -- SQL statements
END
```

---

## 3. Execute a Stored Procedure

```sql
EXEC procedure_name
```

or

```sql
EXECUTE procedure_name
```

---

## 4. Execute a Stored Procedure with Parameters

```sql
EXEC procedure_name value1, value2
```

---

## 5. Alter a Stored Procedure

```sql
ALTER PROCEDURE procedure_name
AS
BEGIN
    -- SQL statements
END
```

---

## 6. Drop a Stored Procedure

```sql
DROP PROCEDURE procedure_name
```
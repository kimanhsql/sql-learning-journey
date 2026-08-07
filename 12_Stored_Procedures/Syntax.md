# Syntax

## Create a Stored Procedure

```sql
CREATE PROCEDURE procedure_name
AS
BEGIN
    SQL statements
END
```

---

## Create a Stored Procedure with Parameters

```sql
CREATE PROCEDURE procedure_name
    @parameter1 data_type,
    @parameter2 data_type
AS
BEGIN
    SQL statements
END
```

---

## Execute a Stored Procedure

```sql
EXEC procedure_name
```

or

```sql
EXECUTE procedure_name
```

---

## Execute a Stored Procedure with Parameters

```sql
EXEC procedure_name value1, value2
```

---

## Alter a Stored Procedure

```sql
ALTER PROCEDURE procedure_name
AS
BEGIN
    SQL statements
END
```

---

## Drop a Stored Procedure

```sql
DROP PROCEDURE procedure_name
```
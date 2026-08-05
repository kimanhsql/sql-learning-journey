# Syntax

```sql
CREATE TRIGGER trigger_name
ON table_name
AFTER | INSTEAD OF
INSERT, UPDATE, DELETE
AS
BEGIN
    -- SQL Statements
END

GO
```

---

## AFTER INSERT

```sql
CREATE TRIGGER trg_AfterInsert
ON PLAYER
AFTER INSERT
AS
BEGIN
    PRINT 'Data inserted successfully.'
END

GO
```

---

## AFTER UPDATE

```sql
CREATE TRIGGER trg_AfterUpdate
ON PLAYER
AFTER UPDATE
AS
BEGIN
    PRINT 'Data updated successfully.'
END

GO
```

---

## AFTER DELETE

```sql
CREATE TRIGGER trg_AfterDelete
ON PLAYER
AFTER DELETE
AS
BEGIN
    PRINT 'Data deleted successfully.'
END

GO
```

---

## INSTEAD OF Trigger

```sql
CREATE TRIGGER trg_InsteadOfDelete
ON PLAYER
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete operation is blocked.'
END

GO
```

---

## ALTER Trigger

```sql
ALTER TRIGGER trg_AfterInsert
ON PLAYER
AFTER INSERT
AS
BEGIN
    PRINT 'Player inserted.'
END

GO
```

---

## DROP Trigger

```sql
DROP TRIGGER trg_AfterInsert

GO
```
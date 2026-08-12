# Syntax

## 1. TRIGGER BASIC

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

## 2. AFTER INSERT

```sql
CREATE TRIGGER trg_AfterInsert
ON PLAYERS
AFTER INSERT
AS
BEGIN
    PRINT 'Data inserted successfully.'
END

GO
```

---

## 3. AFTER UPDATE

```sql
CREATE TRIGGER trg_AfterUpdate
ON PLAYERS
AFTER UPDATE
AS
BEGIN
    PRINT 'Data updated successfully.'
END

GO
```

---

## 4. AFTER DELETE

```sql
CREATE TRIGGER trg_AfterDelete
ON PLAYERS
AFTER DELETE
AS
BEGIN
    PRINT 'Data deleted successfully.'
END

GO
```

---

## 5. INSTEAD OF Trigger

```sql
CREATE TRIGGER trg_InsteadOfDelete
ON PLAYERS
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete operation is blocked.'
END

GO
```

---

## 6. ALTER Trigger

```sql
ALTER TRIGGER trg_AfterInsert
ON PLAYERS
AFTER INSERT
AS
BEGIN
    PRINT 'Player inserted.'
END

GO
```

---

## 7. DROP Trigger

```sql
DROP TRIGGER trg_AfterInsert

GO
```
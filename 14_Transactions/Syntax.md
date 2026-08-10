# Syntax

## 1. BEGIN TRANSACTION

Starts a new transaction.

```sql
BEGIN TRANSACTION
```

or

```sql
BEGIN TRAN
```

---

## 2. COMMIT

Permanently saves all changes made within the current transaction.

```sql
COMMIT TRANSACTION
```

---

## 3. ROLLBACK

Undoes all changes made within the current transaction since the transaction began.

```sql
ROLLBACK TRANSACTION
```

---

## 4. SAVE TRANSACTION

Creates a savepoint inside the current transaction.

```sql
SAVE TRANSACTION SavepointName
```

A transaction can roll back to a specific savepoint:

```sql
ROLLBACK TRANSACTION SavepointName
```

---

## 5. TRY...CATCH with Transactions

Transactions can be combined with `TRY...CATCH ` to handle errors.

```sql
BEGIN TRY

    BEGIN TRANSACTION

    -- SQL statements

    COMMIT TRANSACTION

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH
```

---

## 6. Transaction Structure

A basic transaction follows this structure:

```sql
BEGIN TRANSACTION

-- SQL operations

COMMIT TRANSACTION
```

If an operation should be undone:

```sql
BEGIN TRANSACTION

-- SQL operations

ROLLBACK TRANSACTION
```

---

## 7. Transaction with Savepoint

```sql
BEGIN TRANSACTION

-- SQL operation

SAVE TRANSACTION SavepointName

-- More SQL operations

ROLLBACK TRANSACTION SavepointName

COMMIT TRANSACTION
```
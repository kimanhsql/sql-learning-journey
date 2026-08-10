# Mistakes

## 1. Using TRY and CATCH without BEGIN and END

In SQL Server, `TRY...CATCH` must use `BEGIN TRY`, `END TRY`, `BEGIN CATCH`, and `END CATCH`.

Wrong

```sql
TRY
    BEGIN TRANSACTION

    UPDATE PLAYER
    SET JERSEY_NUMBER = 16
    WHERE PLAYER_ID = 8

    COMMIT TRANSACTION

CATCH
    ROLLBACK TRANSACTION
END CATCH
```

Correct

```sql
BEGIN TRY
    BEGIN TRANSACTION

    UPDATE PLAYER
    SET JERSEY_NUMBER = 16
    WHERE PLAYER_ID = 8

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH
```

---

## 2. Creating a savepoint before the operation that should remain

A savepoint should be created after the changes that must remain.

When rolling back to a savepoint, all changes made after that savepoint are undone.

Wrong

```sql
BEGIN TRANSACTION

SAVE TRANSACTION Savepoint3

UPDATE PLAYER
SET JERSEY_NUMBER = 14
WHERE PLAYER_ID = 6

UPDATE PLAYER
SET JERSEY_NUMBER = 15
WHERE PLAYER_ID = 7

ROLLBACK TRANSACTION Savepoint3

COMMIT TRANSACTION
```

Both updates are rolled back because both operations were performed after the savepoint.

Correct

```sql
BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 14
WHERE PLAYER_ID = 6

SAVE TRANSACTION Savepoint3

UPDATE PLAYER
SET JERSEY_NUMBER = 15
WHERE PLAYER_ID = 7

ROLLBACK TRANSACTION Savepoint3

COMMIT TRANSACTION
```

The first update remains, while the second update is rolled back.

---

## 3. Rolling back unconditionally instead of handling errors

If the requirement says to roll back the transaction **when an error occurs**, the transaction should use `TRY...CATCH`.

Using `ROLLBACK TRANSACTION` directly after the operation will roll back the transaction even when no error occurs.

Wrong

```sql
BEGIN TRANSACTION

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
    CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (15, 'Emma Brown', 'Forward', '1996-02-14', '321 Birch St', 4, 1, 10),
    (16, 'Liam Wilson', 'Midfielder', '1995-08-20', '654 Cedar St', 4, 1, 11)

ROLLBACK TRANSACTION
```

Correct

```sql
BEGIN TRY
    BEGIN TRANSACTION

    INSERT INTO PLAYER
        (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
        CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
    VALUES
        (15, 'Emma Brown', 'Forward', '1996-02-14', '321 Birch St', 4, 1, 10),
        (16, 'Liam Wilson', 'Midfielder', '1995-08-20', '654 Cedar St', 4, 1, 11)

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH
```

The transaction is committed when the operations succeed and rolled back only when an error occurs.

---

## 4. Using an invalid comparison condition

A comparison condition must contain a valid comparison operator such as `=`, `<>`, `>`, `<`, `>=`, or `<=`.

Wrong

```sql
DELETE FROM PLAYER
WHERE PLAYER_ID  22
```

Correct

```sql
DELETE FROM PLAYER
WHERE PLAYER_ID = 22
```

The comparison operator is required to specify the relationship between `PLAYER_ID` and the value `22`.
# Mistakes

## 1. Using the wrong trigger syntax for SQL Server

SQL Server triggers do not use FOR EACH ROW.

The trigger syntax places the table name before the trigger event and uses AS before the trigger body.

Wrong

```sql
CREATE TRIGGER trg_after_insert_player
AFTER INSERT
ON PLAYERS
FOR EACH ROW
BEGIN
    PRINT 'A new player has been inserted.'
END
```

Correct

```sql
CREATE TRIGGER trg_after_insert_player
ON PLAYERS
AFTER INSERT
AS
BEGIN
    PRINT 'A new player has been inserted.'
END
```

---

## 2. Using PRINT instead of selecting rows from inserted or deleted

PRINT only displays a message.

When the exercise asks you to display the affected rows, use the inserted or deleted virtual table.

For DELETE, use deleted.

For UPDATE, both inserted and deleted can be used.

Wrong

```sql
CREATE TRIGGER trg_after_insert_player_display
ON PLAYERS
AFTER INSERT
AS
BEGIN
    PRINT 'Inserted row:'
END
```

Correct

```sql
CREATE TRIGGER trg_after_insert_player_display
ON PLAYERS
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM inserted
END
```

---

## 3. Using UPDATE() to check whether a column value actually changed

UPDATE(column_name) only checks whether the column was included in the UPDATE statement.

It does not check whether the column value actually changed.

To detect an actual change, compare the values in the inserted and deleted tables.

Wrong

```sql
CREATE TRIGGER trg_prevent_update_club_id
ON PLAYERS
FOR UPDATE
AS
BEGIN
    IF UPDATE(CLUB_ID)
    BEGIN
        RAISERROR('Cannot change CLUB_ID after a player is created.', 16, 1)
        ROLLBACK TRANSACTION
    END
END
```

Correct

```sql
CREATE TRIGGER trg_prevent_update_club_id
ON PLAYERS
FOR UPDATE
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        INNER JOIN deleted d
            ON d.PLAYER_ID = i.PLAYER_ID
        WHERE d.CLUB_ID <> i.CLUB_ID
    )
    BEGIN
        RAISERROR('Cannot change CLUB_ID after a player is created.', 16, 1)
        ROLLBACK TRANSACTION
    END
END
```

---

## 4. Checking duplicate values without excluding the inserted or updated row

When checking for duplicate values after an INSERT or UPDATE, the trigger may compare the row in inserted with the same row already present in the PLAYERS table.

The current row should be excluded from the comparison.

Wrong

```sql
SELECT 1
FROM inserted i
INNER JOIN PLAYERS PL
    ON PL.CLUB_ID = i.CLUB_ID
        AND PL.JERSEY_NUMBER = i.JERSEY_NUMBER
```

Correct

```sql
SELECT 1
FROM inserted i
INNER JOIN PLAYERS PL
    ON PL.CLUB_ID = i.CLUB_ID
        AND PL.JERSEY_NUMBER = i.JERSEY_NUMBER
        AND PL.PLAYER_ID <> i.PLAYER_ID
```

---

## 5. Using <> without handling NULL values

The <> operator does not return TRUE when one of the compared values is NULL.

If a column can contain NULL, changes between NULL and a non-NULL value must be handled separately.

Wrong

```sql
IF EXISTS
(
    SELECT 1
    FROM inserted i
    INNER JOIN deleted d
        ON d.PLAYER_ID= i.PLAYER_ID
    WHERE d.COUNTRY_ID <> i.COUNTRY_ID
)
```

Correct

```sql
IF EXISTS
(
    SELECT 1
    FROM inserted i
    INNER JOIN deleted d
        ON d.PLAYER_ID = i.PLAYER_ID
    WHERE
        (d.COUNTRY_ID <> i.COUNTRY_ID)
        OR (d.COUNTRY_ID IS NULL AND i.COUNTRY_ID IS NOT NULL)
        OR (d.COUNTRY_ID IS NOT NULL AND i.COUNTRY_ID IS NULL)
)
```

---

## 6. Checking whether an updated row exists in the same table

The inserted table contains the rows affected by the UPDATE.

Checking whether those rows exist in the target table does not validate whether the player existed before the update.

Wrong

```sql
IF NOT EXISTS
(
    SELECT 1
    FROM inserted i
    INNER JOIN PLAYERS PL
        ON PL.PLAYER_ID = i.PLAYER_ID
)
```

Correct

```sql
IF EXISTS
(
    SELECT 1
    FROM inserted i
    LEFT JOIN CLUB C
        ON C.CLUB_ID = i.CLUB_ID
    WHERE C.CLUB_ID IS NULL
)
```
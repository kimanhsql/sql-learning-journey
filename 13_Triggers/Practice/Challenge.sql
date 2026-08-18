 /*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating an TRIGGER, ask yourself:

1. Which event should fire the trigger?
2. Which virtual table should I use?
3. Do I need INSERTED, DELETED, or both?
4. Will multiple rows be inserted, updated, or deleted?
5. Can the trigger handle multiple affected rows correctly?
6. Should the operation continue or be blocked?
7. What data consistency rule should the trigger enforce?
8. Can the trigger logic be kept simple and maintainable?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- INSERTED and DELETED are virtual tables provided by SQL
  Server inside a trigger.
- INSERTED contains the new rows affected by the operation.
- DELETED contains the old rows affected by the operation.
- UPDATE operations can use both INSERTED and DELETED.
- A trigger must be designed to handle multiple affected
  rows, not only a single row.
- A trigger can allow an operation to continue or prevent
  it when a defined condition is not satisfied.
- Triggers can be used to enforce data consistency and
  business rules automatically.
- Keep trigger logic clear and avoid unnecessary complexity.
- Test the trigger with both single-row and multi-row
  operations.

Analyze the trigger logic before writing SQL.
Test different data scenarios to verify data consistency.
*/


-- Exercise 1
-- Prevent inserting players whose birth date is greater than today.

CREATE TRIGGER trg_prevent_future_birthdate
ON PLAYERS
AFTER INSERT
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted
        WHERE BIRTH_DATE > CAST(GETDATE() AS DATE)
    )
    BEGIN
        RAISERROR('Birth date cannot be in the future.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 2
-- Prevent deleting a club that still has players.

CREATE TRIGGER trg_prevent_delete_club_with_players
ON CLUBS
FOR DELETE
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM deleted d
        INNER JOIN PLAYERS PL
            ON PL.CLUB_ID = d.CLUB_ID
    )
    BEGIN
        RAISERROR('Cannot delete clubs that still have players.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 3
-- Prevent assigning duplicate jersey numbers within the same club.

CREATE TRIGGER trg_prevent_duplicate_jersey_numbers
ON PLAYERS
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        INNER JOIN PLAYERS PL
            ON PL.CLUB_ID = i.CLUB_ID
                AND PL.JERSEY_NUMBER = i.JERSEY_NUMBER
                AND PL.PLAYER_ID <> i.PLAYER_ID
    )
    BEGIN
        RAISERROR('Jersey number already assigned within the same club.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 4
-- Automatically display the inserted rows after every INSERT.

CREATE TRIGGER trg_display_inserted_rows
ON PLAYERS
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM inserted
END

GO


-- Exercise 5
-- Automatically display the deleted rows after every DELETE.

CREATE TRIGGER trg_display_deleted_rows
ON PLAYERS
AFTER DELETE
AS
BEGIN
    SELECT *
    FROM deleted
END

GO


-- Exercise 6
-- Prevent updating a player's country after the player is created.

CREATE TRIGGER trg_prevent_update_country
ON PLAYERS
FOR UPDATE
AS
BEGIN
    IF UPDATE(COUNTRY_ID)
    BEGIN
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
        BEGIN
            RAISERROR('Cannot update player country after creation.', 16, 1)
            ROLLBACK TRANSACTION
        END
    END
END

GO


-- Exercise 7
-- Prevent changing a player's primary key.

CREATE TRIGGER trg_prevent_update_player_id
ON PLAYERS
FOR UPDATE
AS
BEGIN
    IF UPDATE(PLAYER_ID)
    BEGIN
        RAISERROR('Cannot change PLAYER_ID after creation.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 8
-- Prevent changing the club if the player does not have a valid club.

CREATE TRIGGER trg_prevent_invalid_club_update
ON PLAYERS
FOR UPDATE
AS
BEGIN
    IF UPDATE(CLUB_ID)
    BEGIN
        IF EXISTS
        (
            SELECT 1
            FROM inserted i
            LEFT JOIN CLUBS C
                ON C.CLUB_ID = i.CLUB_ID
            WHERE C.CLUB_ID IS NULL
        )
        BEGIN
            RAISERROR('Cannot assign a player to a non-existent club.', 16, 1)
            ROLLBACK TRANSACTION
        END
    END
END

GO


-- Exercise 9
-- Prevent deleting players whose position is Captain.

CREATE TRIGGER trg_prevent_delete_captain
ON PLAYERS
FOR DELETE
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM deleted d
        WHERE d.POSITION = 'Captain'
    )
    BEGIN
        RAISERROR('Cannot delete players with the position of Captain.', 16, 1)
        ROLLBACK TRANSACTION
    END
END


GO


-- Exercise 10
-- Display both the old and new values whenever
-- a player's jersey number changes.

CREATE TRIGGER trg_display_jersey_number_change
ON PLAYERS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(JERSEY_NUMBER)
    BEGIN
        SELECT d.PLAYERS_ID,
                d.JERSEY_NUMBER AS Old_Jersey_Number,
                i.JERSEY_NUMBER AS New_Jersey_Number
        FROM deleted d
        INNER JOIN inserted i
            ON d.PLAYER_ID = i.PLAYER_ID
        WHERE d.JERSEY_NUMBER <> i.JERSEY_NUMBER
    END
END

GO
/*
Think before writing SQL.

Ask yourself:

- Should the trigger validate data?
- Should I use inserted or deleted?
- Can multiple rows be affected?
- Will this trigger prevent an operation?
- Will it affect database performance?

Analyze the trigger logic before writing SQL.
*/


-- Exercise 1
-- Prevent inserting players whose jersey number is less than 1.

CREATE TRIGGER trg_prevent_invalid_jersey_number
ON PLAYERS
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE JERSEY_NUMBER < 1)
    BEGIN
        RAISERROR('Jersey number must be greater than or equal to 1.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 2
-- Prevent updating PLAYER_NAME to NULL.

CREATE TRIGGER trg_prevent_null_player_name
ON PLAYERS
FOR UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE PLAYER_NAME IS NULL)
    BEGIN
        RAISERROR('Player name cannot be NULL.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 3
-- Prevent deleting Goalkeepers.

CREATE TRIGGER trg_prevent_delete_goalkeepers
ON PLAYERS
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE POSITION = 'Goalkeeper')
    BEGIN
        RAISERROR('Cannot delete Goalkeepers.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 4
-- Display all inserted rows after inserting multiple players.

CREATE TRIGGER trg_after_insert_player_display
ON PLAYERS
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM inserted
END

GO


-- Exercise 5
-- Display all deleted rows after deleting multiple players.

CREATE TRIGGER trg_after_delete_player_display
ON PLAYERS
AFTER DELETE
AS
BEGIN
    SELECT *
    FROM deleted
END

GO


-- Exercise 6
-- Prevent changing CLUB_ID after a player is created.

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

GO


-- Exercise 7
-- Prevent duplicate jersey numbers within the same club.

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
        RAISERROR('Duplicate jersey numbers are not allowed within the same club.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO


-- Exercise 8
-- Prevent updating a player's birth date to a future date.

CREATE TRIGGER trg_prevent_future_birth_date
ON PLAYERS
FOR UPDATE
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


-- Exercise 9
-- Prevent deleting clubs that still have players.

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


-- Exercise 10
-- Display the old and new values whenever a player's position changes.

CREATE TRIGGER trg_after_update_player_position
ON PLAYERS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(POSITION)
    BEGIN
        SELECT d.PLAYER_ID,
                d.PLAYER_NAME,
                d.POSITION AS Old_Position,
                i.POSITION AS New_Position
        FROM deleted d
        INNER JOIN inserted i
            ON i.PLAYER_ID = d.PLAYER_ID
    END
END

GO
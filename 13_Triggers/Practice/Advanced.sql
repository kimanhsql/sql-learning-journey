/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating an TRIGGER, ask yourself:

1. What event should activate the trigger?
2. Should the trigger validate data, modify data, or perform
   another action?
3. Should I use INSERTED, DELETED, or both?
4. Can multiple rows be affected?
5. How should the trigger handle multiple affected rows?
6. Do I need JOIN, GROUP BY, HAVING, subqueries, or other
   SQL logic?
7. Will the trigger prevent the original operation?
8. Could the trigger cause unexpected side effects?
9. Will the trigger affect database performance?
10. Can I simplify the trigger without changing its behavior?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A trigger is automatically executed when a specified
  database event occurs.
- INSERTED and DELETED contain the rows affected by the
  triggering statement.
- Always design the trigger to handle multiple rows, not
  only a single row.
- Use INSERTED when working with newly inserted or updated
  values.
- Use DELETED when working with deleted or previous values.
- Use both when the logic requires comparing old and new data.
- A trigger can validate data, enforce business rules, or
  perform additional database operations.
- A trigger can prevent an operation when its conditions are
  not satisfied.
- Avoid unnecessary logic inside triggers because triggers
  can affect database performance.
- Keep the trigger focused on a clear purpose and make its
  behavior predictable.
- Test the trigger with both single-row and multi-row
  operations.
- Check whether the trigger interacts with other triggers
  or database operations.

Analyze the trigger logic before writing SQL.
Test different scenarios before using the trigger in the database.
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

CREATE TRIGGER trg_after_insert_players_display
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

CREATE TRIGGER trg_after_delete_players_display
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
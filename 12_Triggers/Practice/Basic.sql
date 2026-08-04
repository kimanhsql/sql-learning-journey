/*
Think before writing SQL.

Ask yourself:

- Which event should fire the trigger?
- Should I use AFTER or INSTEAD OF?
- Which table should the trigger belong to?
- What action should happen automatically?

Remember:

- Triggers execute automatically.
- Triggers cannot be executed manually by using EXEC.
- AFTER triggers run after the SQL statement succeeds.
- INSTEAD OF triggers replace the original SQL statement.
*/


-- Exercise 1
-- Create an AFTER INSERT trigger on PLAYER.

CREATE TRIGGER trg_after_insert_player
ON PLAYER
AFTER INSERT
AS
BEGIN
    PRINT 'A new player has been inserted.'
END

GO


-- Exercise 2
-- Create an AFTER UPDATE trigger on PLAYER.

CREATE TRIGGER trg_after_update_player
ON PLAYER
AFTER UPDATE
AS
BEGIN
    PRINT 'A player has been updated.'
END

GO


-- Exercise 3
-- Create an AFTER DELETE trigger on PLAYER.

CREATE TRIGGER trg_after_delete_player
ON PLAYER
AFTER DELETE
AS
BEGIN
    PRINT 'A player has been deleted.'
END

GO


-- Exercise 4
-- Create an INSTEAD OF DELETE trigger on PLAYER.

CREATE TRIGGER trg_instead_of_delete_player
ON PLAYER
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete operation has been intercepted.'
END

GO


-- Exercise 5
-- Display the inserted rows after an INSERT.

CREATE TRIGGER trg_after_insert_player_display
ON PLAYER
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM inserted
END

GO


-- Exercise 6
-- Display the deleted rows after a DELETE.

CREATE TRIGGER trg_after_insert_player_display
ON PLAYER
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM deleted
END

GO


-- Exercise 7
-- Display both inserted and deleted rows after an UPDATE.

CREATE TRIGGER trg_after_insert_player_display
ON PLAYER
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM inserted

    SELECT *
    FROM deleted
END

GO


-- Exercise 8
-- Modify an existing trigger.

ALTER TRIGGER trg_after_insert_player_display
ON PLAYER
AFTER INSERT
AS
BEGIN
    PRINT 'Inserted row.'
END

GO


-- Exercise 9
-- Drop an existing trigger.

DROP TRIGGER trg_after_delete_player_display

GO


-- Exercise 10
-- Create a trigger that prints a message after inserting data.

CREATE TRIGGER trg_after_insert_player_message
ON PLAYER
AFTER INSERT
AS
BEGIN
    PRINT 'A new player has been inserted.'
END

GO
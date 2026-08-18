/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating a TRIGGER, ask yourself:

1. Which event should fire the trigger?
2. Should I use AFTER or INSTEAD OF?
3. Which table should the trigger belong to?
4. What action should happen automatically?
5. What SQL statements are required inside the trigger?
6. Should the trigger respond to INSERT, UPDATE, or DELETE?
7. Can the trigger logic be kept simple and easy to maintain?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A trigger is automatically executed when a specified
  database event occurs.
- Triggers cannot be executed manually by using EXEC.
- AFTER triggers run after the triggering SQL statement
  succeeds.
- INSTEAD OF triggers replace the original SQL statement.
- A trigger can be defined for INSERT, UPDATE, or DELETE
  operations.
- The trigger should belong to the table where the relevant
  database event occurs.
- Keep the trigger focused on one clear automatic action.
- Test the triggering operation to verify that the trigger
  behaves as expected.

Understand the triggering event before writing SQL.
Test the trigger with the corresponding INSERT, UPDATE,
or DELETE statement.
*/


-- Exercise 1
-- Create an AFTER INSERT trigger on PLAYERS.

CREATE TRIGGER trg_after_insert_player
ON PLAYERS
AFTER INSERT
AS
BEGIN
    PRINT 'A new player has been inserted.'
END

GO


-- Exercise 2
-- Create an AFTER UPDATE trigger on PLAYERS.

CREATE TRIGGER trg_after_update_player
ON PLAYERS
AFTER UPDATE
AS
BEGIN
    PRINT 'A player has been updated.'
END

GO


-- Exercise 3
-- Create an AFTER DELETE trigger on PLAYERS.

CREATE TRIGGER trg_after_delete_player
ON PLAYERS
AFTER DELETE
AS
BEGIN
    PRINT 'A player has been deleted.'
END

GO


-- Exercise 4
-- Create an INSTEAD OF DELETE trigger on PLAYERS.

CREATE TRIGGER trg_instead_of_delete_player
ON PLAYERS
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete operation has been intercepted.'
END

GO


-- Exercise 5
-- Display the inserted rows after an INSERT.

CREATE TRIGGER trg_after_insert_player_display
ON PLAYERS
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
ON PLAYERS
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
ON PLAYERS
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
ON PLAYERS
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
ON PLAYERS
AFTER INSERT
AS
BEGIN
    PRINT 'A new player has been inserted.'
END

GO
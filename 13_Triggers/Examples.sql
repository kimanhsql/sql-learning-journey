-- Example 1
-- Print a message after inserting a player.

CREATE TRIGGER trg_InsertPlayer
ON PLAYER
AFTER INSERT
AS
BEGIN
    PRINT 'Player inserted.'
END

GO


-- Example 2
-- Print a message after updating player information.

CREATE TRIGGER trg_UpdatePlayer
ON PLAYER
AFTER UPDATE
AS
BEGIN
    PRINT 'Player updated.'
END

GO


-- Example 3
-- Print a message after deleting a player.

CREATE TRIGGER trg_DeletePlayer
ON PLAYER
AFTER DELETE
AS
BEGIN
    PRINT 'Player deleted.'
END

GO


-- Example 4
-- Prevent deleting players.

CREATE TRIGGER trg_PreventDelete
ON PLAYER
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete operation is not allowed.'
END

GO


-- Example 5
-- Display inserted rows.

CREATE TRIGGER trg_ShowInserted
ON PLAYER
AFTER INSERT
AS
BEGIN
    SELECT *
    FROM inserted
END

GO


-- Example 6
-- Display deleted rows.

CREATE TRIGGER trg_ShowDeleted
ON PLAYER
AFTER DELETE
AS
BEGIN
    SELECT *
    FROM deleted
END

GO


-- Example 7
-- Display updated rows.

CREATE TRIGGER trg_ShowUpdated
ON PLAYER
AFTER UPDATE
AS
BEGIN
    SELECT *
    FROM inserted

    SELECT *
    FROM deleted
END

GO
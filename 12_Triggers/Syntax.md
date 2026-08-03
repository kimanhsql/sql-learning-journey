# Syntax

/*
CREATE TRIGGER trigger_name
ON table_name
AFTER | INSTEAD OF
INSERT, UPDATE, DELETE
AS
BEGIN

    -- SQL Statements

END

GO
*/


-- AFTER INSERT

CREATE TRIGGER trg_AfterInsert
ON PLAYER
AFTER INSERT
AS
BEGIN

    PRINT 'Data inserted successfully.'

END

GO


-- AFTER UPDATE

CREATE TRIGGER trg_AfterUpdate
ON PLAYER
AFTER UPDATE
AS
BEGIN

    PRINT 'Data updated successfully.'

END

GO


-- AFTER DELETE

CREATE TRIGGER trg_AfterDelete
ON PLAYER
AFTER DELETE
AS
BEGIN

    PRINT 'Data deleted successfully.'

END

GO


-- INSTEAD OF Trigger

CREATE TRIGGER trg_InsteadOfDelete
ON PLAYER
INSTEAD OF DELETE
AS
BEGIN

    PRINT 'Delete operation is blocked.'

END

GO


-- ALTER Trigger

ALTER TRIGGER trg_AfterInsert
ON PLAYER
AFTER INSERT
AS
BEGIN

    PRINT 'Player inserted.'

END

GO


-- DROP Trigger

DROP TRIGGER trg_AfterInsert

GO
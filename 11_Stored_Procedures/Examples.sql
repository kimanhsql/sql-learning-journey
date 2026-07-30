-- Example 1
-- Create a stored procedure to display all players.

GO

CREATE PROCEDURE GetAllPlayers
AS
BEGIN
    SELECT *
    FROM PLAYER
END

GO


-- Example 2
-- Execute the stored procedure.

EXEC GetAllPlayers

GO


-- Example 3
-- Create a stored procedure with one parameter.

GO

CREATE PROCEDURE GetPlayerByClub
    @ClubID INT
AS
BEGIN
    SELECT *
    FROM PLAYER
    WHERE CLUB_ID = @ClubID
END

GO


-- Example 4
-- Execute the stored procedure with one parameter.

EXEC GetPlayerByClub 1

GO


-- Example 5
-- Create a stored procedure with two parameters.

GO

CREATE PROCEDURE GetPlayerByPosition
    @Position VARCHAR(50),
    @JerseyNumber INT
AS
BEGIN
    SELECT *
    FROM PLAYER
    WHERE POSITION = @Position
        AND JERSEY_NUMBER >= @JerseyNumber
END

GO


-- Example 6
-- Execute the stored procedure.

EXEC GetPlayerByPosition 'Forward', 10

GO


-- Example 7
-- Modify a stored procedure.

GO

ALTER PROCEDURE GetAllPlayers
AS
BEGIN
    SELECT PLAYER_NAME,
           POSITION
    FROM PLAYER
END

GO


-- Example 8
-- Delete a stored procedure.

DROP PROCEDURE GetAllPlayers

GO
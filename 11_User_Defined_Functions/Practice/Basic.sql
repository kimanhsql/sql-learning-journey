/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating a USER-DEFINED FUNCTION, ask yourself:

1. What should the function return?
2. Does the function need parameters?
3. What parameters should the function receive?
4. Should I create a scalar function or a table-valued function?
5. Which data type should the function return?
6. Can the function solve the problem by itself?
7. Does the function need to query any table?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A user-defined function is created to perform a specific
  reusable task.
- Scalar functions return a single value.
- Table-valued functions return a result set.
- Every function must specify RETURNS.
- Scalar functions use RETURN to return one value.
- Parameters allow a function to receive values from the
  calling statement.
- Choose the return type based on the result the function
  needs to provide.
- Keep a simple function focused on one clear purpose.
- Test the function with simple inputs before using it
  in a more complex query.

Choose the correct function type before writing the function.
*/


-- Exercise 1
-- Create a function that returns the length of a player name.

GO

CREATE FUNCTION dbo.GetPlayerNameLength (@PlayerName NVARCHAR(100))
RETURNS INT
AS
BEGIN
    RETURN LEN(@PLayerName)
END

GO


-- Exercise 2
-- Create a function that returns
-- the lowercase version of a club name.

CREATE FUNCTION dbo.GetLowercaseClubName (@ClubName NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN LOWER(@CLubName)
END

GO


-- Exercise 3
-- Create a function that returns the current year.

CREATE FUNCTION dbo.GetCurrentYear ()
RETURNS INT
AS
BEGIN
    RETURN YEAR(GETDATE())
END

GO


-- Exercise 4
-- Create a function that returns
-- the number of players in a given club.

CREATE FUNCTION dbo.GetNumOfPlayersInClub (@ClubName NVARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @PlayerCount INT

    SELECT @PlayerCount = COUNT(*)
    FROM PLAYERS
    WHERE CLUB_NAME = @ClubName

    RETURN @PlayerCount
END

GO


-- Exercise 5
-- Create a function that returns
-- the average jersey number of a given position.

CREATE FUNCTION dbo.GetAvgJerseyNumByPosition (@Position NVARCHAR(20))
RETURNS FLOAT
AS
BEGIN
    DECLARE @AverageJerseyNum FLOAT

    SELECT @AVERAGEJerseyNum = AVG(JERSEY_NUMBER)
    FROM PLAYERS
    WHERE POSITION = @Position

    RETURN @AverageJerseyNum
END

GO


-- Exercise 6
-- Create a function that returns all players from a given country.

CREATE FUNCTION dbo.GetPlayersByCountry (@Country NVARCHAR(60))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM PLAYERS
    WHERE COUNTRY_NAME = @Country
)

GO


-- Exercise 7
-- Create a function that returns the players
-- whose jersey number is greater than 10.

CREATE FUNCTION dbo.GetPlayersWithJerseyNum ()
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM PLAYERS
    WHERE JERSEY_NUMBER > 10
)

GO


-- Exercise 8
-- Create a function that returns the birth year of a player
-- based on the birth date.

CREATE FUNCTION dbo.GetBirthYear (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    RETURN YEAR(@BirthDate)
END

GO


-- Exercise 9
-- Create a function that returns the highest jersey number
-- in the PLAYERS table.

CREATE FUNCTION dbo.GetHighestJerseyNum ()
RETURNS INT
AS
BEGIN
    DECLARE @HighestJerseyNum INT

    SELECT @HighestJerseyNum = MAX(JERSEY_NUMBER)
    FROM PLAYERS

    RETURN @HighestJerseyNum
END

GO


-- Exercise 10
-- Create a function that returns the player name together
-- with the jersey number for all players.

CREATE FUNCTION dbo.GetPlayerNameAndJerseyNum ()
RETURNS TABLE
AS
RETURN
(
    SELECT PLAYER_NAME,
            JERSEY_NUMBER
    FROM PLAYERS
)

GO
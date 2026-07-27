/*
Before writing SQL, think about the following questions:

- What should the function return?
- Does the function need parameters?
- Should I create a scalar function or a table-valued function?
- Which table contains the required data?
- Can the same logic be reused many times?

Read the requirement carefully before writing SQL.
Choose the correct function type first.
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
-- Create a function that returns the lowercase version of a club name.

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
-- Create a function that returns the number of players in a given club.

CREATE FUNCTION dbo.GetNumOfPlayersInClub (@ClubName NVARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @PlayerCount INT

    SELECT @PlayerCount = COUNT(*)
    FROM PLAYER
    WHERE ClubName = @ClubName

    RETURN @PlayerCount
END

GO


-- Exercise 5
-- Create a function that returns the average jersey number of a given position.

CREATE FUNCTION dbo.GetAvgJerseyNumByPosition (@Position NVARCHAR(20))
RETURNS FLOAT
AS
BEGIN
    DECLARE @AverageJerseyNum FLOAT

    SELECT @AVERAGEJerseyNum = AVG(JerseyNumber)
    FROM PLAYER
    WHERE Position = @Position

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
    FROM PLAYER
    WHERE Country = @Country
)

GO


-- Exercise 7
-- Create a function that returns the players whose jersey number is greater than 10.

CREATE FUNCTION dbo.GetPlayersWithJerseyNum ()
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM PLAYER
    WHERE JerseyNumber > 10
)

GO


-- Exercise 8
-- Create a function that returns the birth year of a player based on the birth date.

CREATE FUNCTION dbo.GetBirthYear (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    RETURN YEAR(@BirthDate)
END

GO


-- Exercise 9
-- Create a function that returns the highest jersey number in the PLAYER table.

CREATE FUNCTION dbo.GetHighestJerseyNum ()
RETURNS INT
AS
BEGIN
    DECLARE @HighestJerseyNum INT

    SELECT @HighestJerseyNum = MAX(JerseyNumber)
    FROM PLAYER

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
    SELECT PlayerName,
            JerseyNumber
    FROM PLAYER
)

GO
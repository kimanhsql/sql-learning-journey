/*
Think before writing SQL.

Ask yourself:

- Can I combine multiple SQL statements inside the function?
- Should I declare local variables?
- Will the function query one table or multiple tables?
- Should I return a scalar value or a table?
- Can the function be reused in other SQL statements?

Write the function step by step.
Verify the logic before creating the function.
*/


-- Exercise 1
-- Create a function that returns the age of a player from the birth date.

CREATE FUNCTION dbo.GetPlayerAge (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    RETURN YEAR(GETDATE()) - YEAR(@BirthDate)
END

GO


-- Exercise 2
-- Create a function that returns
-- the total number of players in a given country.

CREATE FUNCTION dbo.GetPlayerCountByCountry (@CountryID INT)
RETURNS INT
AS
BEGIN
    DECLARE @PlayerCount INT

    SELECT @PlayerCount = COUNT(*)
    FROM PLAYER
    WHERE COUNTRY_ID = @CountryID

    RETURN @PlayerCount
END

GO


-- Exercise 3
-- Create a function that returns the highest jersey number in a given club.

CREATE FUNCTION dbo.GetHighestJerseyByClub (@ClubID INT)
RETURNS INT
AS
BEGIN
    DECLARE @HighestJersey INT

    SELECT @HighestJersey = MAX(JERSEY_NUMBER)
    FROM PLAYER
    WHERE CLUB_ID = @ClubID

    RETURN @HighestJersey
END

GO


-- Exercise 4
-- Create a function that returns all players from a given club.

CREATE FUNCTION dbo.GetPlayersByClub (@ClubID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT PLAYER_ID,
            PLAYER_NAME,
            POSITION
    FROM PLAYER
    WHERE CLUB_ID = @ClubID
)

GO


-- Exercise 5
-- Create a function that returns all players born after a given year.

CREATE FUNCTION dbo.GetPlayersBornAfter (@Year INT)
RETURNS TABLE
AS
RETURN
(
    SELECT PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYER
    WHERE YEAR(BIRTH_DATE) > @Year
)

GO


-- Exercise 6
-- Create a function that returns
-- the average jersey number in a given country.

CREATE FUNCTION dbo.GetAverageJerseyByCountry (@CountryID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Average FLOAT

    SELECT @Average = AVG(JERSEY_NUMBER)
    FROM PLAYER
    WHERE COUNTRY_ID = @CountryID

    RETURN @Average
END

GO


-- Exercise 7
-- Create a function that returns clubs having
-- more than a given number of players.

CREATE FUNCTION dbo.GetBusyClubs (@PlayerCount INT)
RETURNS TABLE
AS
RETURN
(
    SELECT CLUB_ID,
            COUNT(*) AS NumberOfPlayers
    FROM PLAYER
    GROUP BY CLUB_ID
    HAVING COUNT(*) > @PlayerCount
)

GO


-- Exercise 8
-- Create a function that returns player names in uppercase.

CREATE FUNCTION dbo.GetUpperPlayerName (@PlayerName NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN UPPER(@PlayerName)
END

GO


-- Exercise 9
-- Create a function that returns the earliest birth date in a club.

CREATE FUNCTION dbo.GetOldestBirthDate (@ClubID INT)
RETURNS DATE
AS
BEGIN
    DECLARE @Oldest DATE

    SELECT @Oldest = MIN(BIRTH_DATE)
    FROM PLAYER
    WHERE CLUB_ID = @ClubID

    RETURN @Oldest
END

GO


-- Exercise 10
-- Create a function that returns the player name and country name.

CREATE FUNCTION dbo.GetPlayerCountry ()
RETURNS TABLE
AS
RETURN
(
    SELECT PL.PLAYER_NAME,
            COUNTRY_NAME
    FROM PLAYER PL
    INNER JOIN COUNTRY CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
)

GO
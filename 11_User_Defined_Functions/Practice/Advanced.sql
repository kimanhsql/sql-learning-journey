/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating a USER-DEFINED FUNCTION, ask yourself:

1. What problem should the function solve?
2. Should the function return a scalar value or a table?
3. What parameters does the function need?
4. Should I declare local variables?
5. Will the function query one table or multiple tables?
6. Do I need to combine multiple SQL statements inside
   the function?
7. Can the function be reused in other SQL statements?
8. Does the function return the data type or table structure
   that I expect?
9. Can I simplify the function without changing its result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A user-defined function is created by the developer to
  perform a specific reusable task.
- A scalar-valued function returns a single value.
- A table-valued function returns a table that can be used
  in SQL statements.
- Parameters allow a function to receive values from the
  calling statement.
- Local variables can be used when intermediate values are
  needed.
- A function can query one or multiple tables depending
  on the required logic.
- Keep the function focused on one clear purpose so that
  it can be reused easily.
- Test the function logic before using it in a larger query.
- Make sure the returned value or table structure matches
  what the calling query expects.

Write the function step by step.
Verify the logic before creating the function.
*/


-- Exercise 1
-- Create a function that returns the age of a player
-- from the birth date.

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
    FROM PLAYERS
    WHERE COUNTRY_ID = @CountryID

    RETURN @PlayerCount
END

GO


-- Exercise 3
-- Create a function that returns
-- the highest jersey number in a given club.

CREATE FUNCTION dbo.GetHighestJerseyByClub (@ClubID INT)
RETURNS INT
AS
BEGIN
    DECLARE @HighestJersey INT

    SELECT @HighestJersey = MAX(JERSEY_NUMBER)
    FROM PLAYERS
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
    FROM PLAYERS
    WHERE CLUB_ID = @ClubID
)

GO


-- Exercise 5
-- Create a function that returns all players
-- born after a given year.

CREATE FUNCTION dbo.GetPlayersBornAfter (@Year INT)
RETURNS TABLE
AS
RETURN
(
    SELECT PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYERS
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
    FROM PLAYERS
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
    FROM PLAYERS
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
    FROM PLAYERS
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
    FROM PLAYERS PL
    INNER JOIN COUNTRIES CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
)

GO
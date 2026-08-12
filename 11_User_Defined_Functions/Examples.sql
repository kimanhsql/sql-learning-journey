-- Example 1
-- Create a function that returns the age of a player
-- based on the birth date.

GO

CREATE FUNCTION dbo.GetAge (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @BirthDate, GETDATE())
END

GO


-- Example 2
-- Use the function to display player names and ages.

SELECT PLAYER_NAME,
        dbo.GetAge(BIRTH_DATE) AS Age
FROM PLAYERS

GO


-- Example 3
-- Create a function that returns the total number of players in a club.

CREATE FUNCTION dbo.GetPlayerCountByClub (@ClubID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalPlayers INT

    SELECT @TotalPlayers = COUNT(*)
    FROM PLAYERS
    WHERE CLUB_ID = @ClubID

    RETURN @TotalPlayers
END

GO


-- Example 4
-- Use the function to display club IDs and
-- the number of players in each club.

SELECT CLUB_ID,
        dbo.GetPlayerCountByClub(CLUB_ID) AS TotalPlayers
FROM CLUBS

GO


-- Example 5
-- Create a table-valued function that returns players
-- from a specific country.

CREATE FUNCTION dbo.GetPlayersByCountry (@CountryID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT PLAYER_NAME,
            BIRTH_DATE,
            POSITION
    FROM PLAYERS
    WHERE COUNTRY_ID = @CountryID
)

GO


-- Example 6
-- Use the table-valued function to display players from country 1.

SELECT *
FROM dbo.GetPlayersByCountry(1)

GO


-- Example 7
-- Create a function that returns the uppercase version of a player name.

CREATE FUNCTION dbo.GetUpperPlayerName (@PlayerName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN UPPER(@PlayerName)
END

GO


-- Example 8
-- Use the function to display player names in uppercase.

SELECT PLAYER_NAME,
        dbo.GetUpperPlayerName(PLAYER_NAME) AS UpperPlayerName
FROM PLAYERS

GO
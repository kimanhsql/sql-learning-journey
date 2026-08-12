/*
Before writing SQL, think about the following questions:

- What task should the stored procedure perform?
- Does it need parameters?
- Should the procedure display data or modify data?
- Can this logic be reused?
- Which SQL statements should be placed inside the procedure?

Remember:

- CREATE PROCEDURE is used to create a new procedure.
- EXEC is used to execute a procedure.
- ALTER PROCEDURE modifies an existing procedure.
- DROP PROCEDURE removes a procedure.
*/


-- Exercise 1
-- Create a stored procedure that displays all players.

GO

CREATE PROCEDURE prd_display_all_players
AS
BEGIN
    SELECT *
    FROM PLAYERS
END

GO


-- Exercise 2
-- Execute the stored procedure created in Exercise 1.

EXECUTE prd_display_all_players

GO


-- Exercise 3
-- Create a stored procedure that displays all clubs.

CREATE PROCEDURE prd_display_all_clubs
AS
BEGIN
    SELECT *
    FROM CLUB
END

GO


-- Exercise 4
-- Create a stored procedure that displays players from a given club.

CREATE PROCEDURE prd_display_players_by_club
    @ClubID INT
AS
BEGIN
    SELECT *
    FROM PLAYERS
    WHERE CLUB_ID = @ClubID
END

GO


-- Exercise 5
-- Execute the stored procedure using CLUB_ID = 1.

EXECUTE prd_display_players_by_club @ClubID = 1

GO


-- Exercise 6
-- Create a stored procedure that displays players from a given position.

CREATE PROCEDURE prd_display_players_by_position
    @Position NVARCHAR(20)
AS
BEGIN
    SELECT *
    FROM PLAYERS
    WHERE POSITION = @Position
END

GO


-- Exercise 7
-- Create a stored procedure that displays players whose jersey number
-- is greater than a given value.

CREATE PROCEDURE prd_display_players_by_jerey_number
    @JerseyNumber INT
AS
BEGIN
    SELECT *
    FROM PLAYERS
    WHERE JERSEY_NUMBER > @JerseyNumber
END

GO


-- Exercise 8
-- Modify the stored procedure created in Exercise 1 so that
-- it displays only player names and positions.

ALTER PROCEDURE prd_display_all_players
AS
BEGIN
    SELECT PLAYER_NAME,
            POSITION
    FROM PLAYERS
END

GO


-- Exercise 9
-- Delete the stored procedure created in Exercise 3.

DROP PROCEDURE prd_display_all_clubs

GO


-- Exercise 10
-- Create a stored procedure that displays players from a given country.

CREATE PROCEDURE prd_display_players_by_country
    @Country NVARCHAR(60)
AS
BEGIN
    SELECT *
    FROM PLAYERS
    WHERE COUNTRY = @Country
END

GO
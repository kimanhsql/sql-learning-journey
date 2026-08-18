/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a STORED PROCEDURE, ask yourself:

1. What task should the stored procedure perform?
2. Does the procedure need parameters?
3. Should the procedure return data or modify data?
4. Which SQL statements are required to perform the task?
5. Can the procedure be reused with different inputs?
6. Can the SQL logic be simplified without changing the result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- CREATE PROCEDURE is used to create a new stored procedure.
- EXEC is used to execute a stored procedure.
- ALTER PROCEDURE is used to modify an existing stored procedure.
- DROP PROCEDURE is used to remove an existing stored procedure.
- Parameters allow a procedure to receive values from the
  calling statement.
- A stored procedure can return data, modify data, or perform
  both depending on its purpose.
- Stored procedures can contain one or multiple SQL statements.
- Reusable procedures should use parameters when different
  inputs may be required.
- Keep the procedure focused on one clear task so that it is
  easier to understand, test, and maintain.
- Test the SQL logic before creating the stored procedure.

Write the procedure step by step.
Verify the logic before executing the procedure.
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
    FROM CLUBS
END

GO


-- Exercise 4
-- Create a stored procedure that
-- displays players from a given club.

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
-- Create a stored procedure that
-- displays players from a given position.

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
-- Create a stored procedure that displays players
-- whose jersey number is greater than a given value.

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
-- Create a stored procedure that
-- displays players from a given country.

CREATE PROCEDURE prd_display_players_by_country
    @Country NVARCHAR(60)
AS
BEGIN
    SELECT *
    FROM PLAYERS
    WHERE COUNTRY = @Country
END

GO
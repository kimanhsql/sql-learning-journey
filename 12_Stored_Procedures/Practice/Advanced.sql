/* 
============================================================ 
THINK BEFORE WRITING SQL 
============================================================ 
 
Before creating a STORED PROCEDURE, ask yourself: 
 
1. What problem should the procedure solve? 
2. What SQL statements are required to solve the problem? 
3. What parameters does the procedure need? 
4. Will the procedure return data or modify data? 
5. Will the procedure query one table or multiple tables? 
6. Do I need JOIN, GROUP BY, HAVING, or a subquery? 
7. Do I need local variables or conditional logic? 
8. Can the procedure be reused with different inputs? 
9. Can I simplify the procedure without changing its result? 
10. Does the procedure handle the input and output as expected? 
 
------------------------------------------------------------ 
REMEMBER 
------------------------------------------------------------ 
 
- A stored procedure is a precompiled set of SQL statements 
  created to perform a specific task. 
- Parameters allow a procedure to receive values from the 
  calling statement and make it reusable with different inputs. 
- A procedure can return data, modify data, or perform both 
  depending on the required task. 
- A procedure can contain one or multiple SQL statements. 
- JOIN, GROUP BY, HAVING, and subqueries can be used when 
  they are required by the business logic. 
- Local variables can be used when intermediate values or 
  additional processing are needed. 
- Keep the procedure focused on one clear purpose so that 
  it is easier to understand, test, and maintain. 
- Write and test the SQL logic before placing it inside 
  the stored procedure. 
- Make sure the parameters, returned data, and modified data 
  match what the calling statement expects. 
 
Write the procedure step by step. 
Verify the SQL logic before creating the procedure. 
*/


-- Exercise 1
-- Create a stored procedure that displays player names together
-- with their club names.

GO

CREATE PROCEDURE prd_display_players_with_club_names
AS
BEGIN
    SELECT PLAYER_NAME,
            CLUB_NAME
    FROM PLAYERS PL
    INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
END

GO


-- Exercise 2
-- Create a stored procedure that
-- displays players from a given country name.

CREATE PROCEDURE prd_display_players_by_country
    @CountryName NVARCHAR(60)
AS
BEGIN
    SELECT PLAYER_NAME,
            COUNTRY_NAME
    FROM PLAYERS PL
    INNER JOIN COUNTRIES CT
        ON CT.COUNTRY_ID = PL.COUNTRY_ID
    WHERE COUNTRY_NAME = @CountryName
END

GO


-- Exercise 3
-- Create a stored procedure that
-- displays the total number of players in each club.

CREATE PROCEDURE prd_display_total_players_per_club
AS
BEGIN
    SELECT CLUB_NAME,
            COUNT(PLAYER_ID) AS TOTAL_PLAYERS
    FROM PLAYERS PL
    INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
    GROUP BY CLUB_NAME
END

GO


-- Exercise 4
-- Create a stored procedure that
-- displays the average jersey number for each position.

CREATE PROCEDURE prd_display_avg_jersey_num_per_position
AS
BEGIN
    SELECT POSITION,
            AVG(JERSEY_NUMBER) AS AVG_JERSEY_NUMBER
    FROM PLAYERS
    GROUP BY POSITION
END

GO


-- Exercise 5
-- Create a stored procedure that displays players
-- whose jersey number is greater than the average jersey number.

CREATE PROCEDURE prd_display_players_above_avg_jersey_num
AS
BEGIN
    SELECT PLAYER_NAME,
            JERSEY_NUMBER
    FROM PLAYERS
    WHERE JERSEY_NUMBER >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYERS
    )
END

GO


-- Exercise 6
-- Create a stored procedure that
-- displays all players born after a given year.

CREATE PROCEDURE prd_display_players_born_after_year
    @Year INT
AS
BEGIN
    SELECT PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYERS
    WHERE YEAR(BIRTH_DATE) > @Year
END

GO


-- Exercise 7
-- Create a stored procedure that
-- displays clubs having more than a given number of players.

CREATE PROCEDURE prd_display_clubs_with_more_than_n_players
    @NumPlayers INT
AS
BEGIN
    SELECT CLUB_NAME,
            COUNT(PLAYER_ID) AS TOTAL_PLAYERS
    FROM PLAYERS PL
    INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
    GROUP BY CLUB_NAME
    HAVING COUNT(PLAYER_ID) > @NumPlayers
END

GO


-- Exercise 8
-- Create a stored procedure that
-- displays players together with their club and country names.

CREATE PROCEDURE prd_display_players_with_club_and_country_names
AS
BEGIN
    SELECT PLAYER_NAME,
            CLUB_NAME,
            COUNTRY_NAME
    FROM PLAYERS PL
    INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
    INNER JOIN COUNTRIES CT
        ON CT.COUNTRY_ID = PL.COUNTRY_ID
END

GO


-- Exercise 9
-- Create a stored procedure that
-- displays the oldest player in each position.

CREATE PROCEDURE prd_display_oldest_player_per_position
AS
BEGIN
    SELECT POSITION,
            PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYERS
    WHERE BIRTH_DATE IN
    (
        SELECT MIN(BIRTH_DATE)
        FROM PLAYERS
        GROUP BY POSITION
    )
END

GO


-- Exercise 10
-- Create a stored procedure that displays all clubs,
-- including clubs without any players.

CREATE PROCEDURE prd_display_all_clubs_with_or_without_players
AS
BEGIN
    SELECT CLUB_NAME,
            PLAYER_NAME
    FROM CLUBS C
    LEFT JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
END

GO
/*
Think before writing SQL.

Ask yourself:

- What is the main task of the procedure?
- Which SQL statements are required to solve the problem?
- Should I use parameters?
- Do I need JOIN, GROUP BY, HAVING, or a subquery?
- Will the procedure return data or modify data?
- Can the procedure be reused with different inputs?

Remember:

- Write and test the SQL query first.
- Then place the SQL inside the stored procedure.
- Keep the procedure reusable by using parameters whenever possible.
- Make the procedure simple, readable, and easy to maintain.
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
    FROM PLAYER PL
    INNER JOIN CLUB C
        ON C.CLUB_ID = PL.CLUB_ID
END

GO


-- Exercise 2
-- Create a stored procedure that displays players
-- from a given country name.

CREATE PROCEDURE prd_display_players_by_country
    @CountryName NVARCHAR(60)
AS
BEGIN
    SELECT PLAYER_NAME,
            COUNTRY_NAME
    FROM PLAYER PL
    INNER JOIN COUNTRY CT
        ON CT.COUNTRY_ID = PL.COUNTRY_ID
    WHERE COUNTRY_NAME = @CountryName
END

GO


-- Exercise 3
-- Create a stored procedure that displays
-- the total number of players in each club.

CREATE PROCEDURE prd_display_total_players_per_club
AS
BEGIN
    SELECT CLUB_NAME,
            COUNT(PLAYER_ID) AS TOTAL_PLAYERS
    FROM PLAYER PL
    INNER JOIN CLUB C
        ON C.CLUB_ID = PL.CLUB_ID
    GROUP BY CLUB_NAME
END

GO


-- Exercise 4
-- Create a stored procedure that displays
-- the average jersey number for each position.

CREATE PROCEDURE prd_display_avg_jersey_num_per_position
AS
BEGIN
    SELECT POSITION,
            AVG(JERSEY_NUMBER) AS AVG_JERSEY_NUMBER
    FROM PLAYER
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
    FROM PLAYER
    WHERE JERSEY_NUMBER >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYER
    )
END

GO


-- Exercise 6
-- Create a stored procedure that displays all players
-- born after a given year.

CREATE PROCEDURE prd_display_players_born_after_year
    @Year INT
AS
BEGIN
    SELECT PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYER
    WHERE YEAR(BIRTH_DATE) > @Year
END

GO


-- Exercise 7
-- Create a stored procedure that displays clubs
-- having more than a given number of players.

CREATE PROCEDURE prd_display_clubs_with_more_than_n_players
    @NumPlayers INT
AS
BEGIN
    SELECT CLUB_NAME,
            COUNT(PLAYER_ID) AS TOTAL_PLAYERS
    FROM PLAYER PL
    INNER JOIN CLUB C
        ON C.CLUB_ID = PL.CLUB_ID
    GROUP BY CLUB_NAME
    HAVING COUNT(PLAYER_ID) > @NumPlayers
END

GO


-- Exercise 8
-- Create a stored procedure that displays players
-- together with their club and country names.

CREATE PROCEDURE prd_display_players_with_club_and_country_names
AS
BEGIN
    SELECT PLAYER_NAME,
            CLUB_NAME,
            COUNTRY_NAME
    FROM PLAYER PL
    INNER JOIN CLUB C
        ON C.CLUB_ID = PL.CLUB_ID
    INNER JOIN COUNTRY CT
        ON CT.COUNTRY_ID = PL.COUNTRY_ID
END

GO


-- Exercise 9
-- Create a stored procedure that displays
-- the oldest player in each position.

CREATE PROCEDURE prd_display_oldest_player_per_position
AS
BEGIN
    SELECT POSITION,
            PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYER PL
    WHERE BIRTH_DATE IN
    (
        SELECT MIN(BIRTH_DATE)
        FROM PLAYER
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
    FROM CLUB C
    LEFT JOIN PLAYER PL
        ON PL.CLUB_ID = C.CLUB_ID
END

GO
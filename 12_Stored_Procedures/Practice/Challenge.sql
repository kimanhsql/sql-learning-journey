/*
Think before writing SQL.

Ask yourself:

- What task should the stored procedure perform?
- Which SQL statements are required?
- Do I need parameters?
- Should I use JOIN, GROUP BY, HAVING, or a subquery?
- Can I divide the problem into smaller SQL queries first?
- Is the procedure reusable for different inputs?

Remember:

- Focus on solving the SQL problem first.
- Then place the SQL inside the stored procedure.
- Test the SQL before creating the procedure.
- Keep the procedure reusable and easy to maintain.
*/


-- Exercise 1
-- Create a stored procedure that displays the top N players
-- with the highest jersey numbers.

CREATE PROCEDURE prd_top_n_players
    @top_n INT
AS
BEGIN
    SELECT TOP (@top_n)
            PLAYER_NAME,
            JERSEY_NUMBER
    FROM PLAYER
    ORDER BY JERSEY_NUMBER DESC
END

GO


-- Exercise 2
-- Create a stored procedure that searches players
-- by a keyword in their names.

CREATE PROCEDURE prd_search_players
    @keyword VARCHAR(100)
AS
BEGIN
    SELECT PLAYER_ID,
            PLAYER_NAME,
            POSITION,
            JERSEY_NUMBER
    FROM PLAYER
    WHERE PLAYER_NAME LIKE '%' + @keyword + '%'
END

GO


-- Exercise 3
-- Create a stored procedure that displays the number of players
-- in each country, sorted from highest to lowest.

CREATE PROCEDURE prd_players_by_country
AS
BEGIN
    SELECT COUNTRY_ID,
            COUNT(*) AS NumberOfPlayers
    FROM PLAYER
    GROUP BY COUNTRY_ID
    ORDER BY NumberOfPlayers DESC
END

GO


-- Exercise 4
-- Create a stored procedure that displays clubs
-- whose average jersey number is greater than a given value.

CREATE PROCEDURE prd_clubs_by_average_jersey
    @average_jersey DECIMAL(10, 2)
AS
BEGIN
    SELECT CLUB_ID,
            AVG(JERSEY_NUMBER) AS AverageJerseyNumber
    FROM PLAYER
    GROUP BY CLUB_ID
    HAVING AVG(JERSEY_NUMBER) > @average_jersey
END

GO


-- Exercise 5
-- Create a stored procedure that displays all players
-- belonging to clubs located in a given stadium.

CREATE PROCEDURE prd_players_by_stadium
    @stadium_name VARCHAR(100)
AS
BEGIN
    SELECT PL.PLAYER_ID,
            PL.PLAYER_NAME,
            POSITION,
            JERSEY_NUMBER,
            PL.CLUB_ID
    FROM PLAYER PL
    INNER JOIN CLUB C
        ON PL.CLUB_ID = C.CLUB_ID
    INNER JOIN STADIUM ST
        ON C.STADIUM_ID = ST.STADIUM_ID
    WHERE ST.STADIUM_NAME = @stadium_name
END

GO


-- Exercise 6
-- Create a stored procedure that displays players
-- whose jersey number is greater than the average jersey number.

CREATE PROCEDURE prd_players_above_average_jersey
AS
BEGIN
    SELECT PLAYER_ID,
            PLAYER_NAME,
            POSITION,
            JERSEY_NUMBER
    FROM PLAYER
    WHERE JERSEY_NUMBER >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYER
    )
END

GO


-- Exercise 7
-- Create a stored procedure that displays
-- the oldest player in each club.

CREATE PROCEDURE prd_oldest_player_each_club
AS
BEGIN
    SELECT PL.CLUB_ID,
            PL.PLAYER_ID,
            PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYER PL
    WHERE BIRTH_DATE =
    (
        SELECT MIN(P2.BIRTH_DATE)
        FROM PLAYER P2
        WHERE P2.CLUB_ID = PL.CLUB_ID
    )
END

GO


-- Exercise 8
-- Create a stored procedure that displays
-- the number of players in each position
-- whose total players are greater than a given value.

CREATE PROCEDURE prd_positions_with_min_players
    @minimum_players INT
AS
BEGIN
    SELECT POSITION,
            COUNT(*) AS NumberOfPlayers
    FROM PLAYER
    GROUP BY POSITION
    HAVING COUNT(*) > @minimum_players
END

GO


-- Exercise 9
-- Create a stored procedure that displays
-- all coaches together with the clubs they manage.

CREATE PROCEDURE prd_coaches_with_clubs
AS
BEGIN
    SELECT CH.COACH_ID,
            CH.COACH_NAME,
            C.CLUB_ID,
            C.CLUB_NAME
    FROM COACH CH
    INNER JOIN CLUB C
        ON CH.CLUB_ID = C.CLUB_ID
END

GO


-- Exercise 10
-- Create a stored procedure that displays
-- the club having the highest average jersey number
-- together with its stadium name.

CREATE PROCEDURE prd_club_highest_average_jersey
AS
BEGIN
    SELECT TOP 1
        C.CLUB_ID,
        CLUB_NAME,
        STADIUM_NAME,
        AVG(PL.JERSEY_NUMBER) AS AverageJerseyNumber
    FROM CLUB C
    INNER JOIN PLAYER PL
        ON C.CLUB_ID = PL.CLUB_ID
    INNER JOIN STADIUM ST
        ON C.STADIUM_ID = ST.STADIUM_ID
    GROUP BY
        C.CLUB_ID,
        C.CLUB_NAME,
        STADIUM_NAME
    ORDER BY AverageJerseyNumber DESC
END

GO
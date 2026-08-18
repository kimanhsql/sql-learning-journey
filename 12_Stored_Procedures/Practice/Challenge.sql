/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a STORED PROCEDURE, ask yourself:

1. What is the main problem that the stored procedure
   should solve?
2. Can I break the problem into smaller SQL queries first?
3. Which SQL statements are required to solve each part?
4. Do I need parameters to make the procedure reusable?
5. Do I need JOIN, GROUP BY, HAVING, subqueries, or CTEs?
6. Do I need multiple SQL statements inside the procedure?
7. Do I need local variables or conditional logic?
8. Should the procedure return data, modify data, or perform
   multiple operations?
9. Can the procedure handle different inputs correctly?
10. Can I simplify the logic without changing the result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Focus on understanding and solving the SQL problem first.
- Break complex problems into smaller SQL queries before
  combining them into the stored procedure.
- Use parameters when the procedure needs to work with
  different inputs.
- Use JOIN, GROUP BY, HAVING, subqueries, or CTEs only when
  they are required by the problem.
- Multiple SQL statements can be combined when the procedure
  requires multiple steps to complete its task.
- Local variables and conditional logic can be used when
  intermediate values or decisions are required.
- Test each part of the SQL logic before creating the
  stored procedure.
- Make sure the procedure produces the expected result for
  different inputs and edge cases.
- Keep the procedure focused, readable, reusable, and easy
  to maintain.

Solve the SQL problem step by step.
Test each part of the logic before combining it.
Then place the complete solution inside the stored procedure.
*/


-- Exercise 1
-- Create a stored procedure that
-- displays the top N players with the highest jersey numbers.

CREATE PROCEDURE prd_top_n_players
    @top_n INT
AS
BEGIN
    SELECT TOP (@top_n)
            PLAYER_NAME,
            JERSEY_NUMBER
    FROM PLAYERS
    ORDER BY JERSEY_NUMBER DESC
END

GO


-- Exercise 2
-- Create a stored procedure that
-- searches players by a keyword in their names.

CREATE PROCEDURE prd_search_players
    @keyword VARCHAR(100)
AS
BEGIN
    SELECT PLAYER_ID,
            PLAYER_NAME,
            POSITION,
            JERSEY_NUMBER
    FROM PLAYERS
    WHERE PLAYER_NAME LIKE '%' + @keyword + '%'
END

GO


-- Exercise 3
-- Create a stored procedure that displays
-- the number of players in each country,
-- sorted from highest to lowest.

CREATE PROCEDURE prd_players_by_country
AS
BEGIN
    SELECT COUNTRY_ID,
            COUNT(*) AS NumberOfPlayers
    FROM PLAYERS
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
    FROM PLAYERS
    GROUP BY CLUB_ID
    HAVING AVG(JERSEY_NUMBER) > @average_jersey
END

GO


-- Exercise 5
-- Create a stored procedure that displays
-- all players belonging to clubs located in a given stadium.

CREATE PROCEDURE prd_players_by_stadium
    @stadium_name VARCHAR(100)
AS
BEGIN
    SELECT PL.PLAYER_ID,
            PLAYER_NAME,
            POSITION,
            JERSEY_NUMBER,
            PL.CLUB_ID
    FROM PLAYERS PL
    INNER JOIN CLUBS C
        ON PL.CLUB_ID = C.CLUB_ID
    INNER JOIN STADIUMS ST
        ON C.STADIUM_ID = ST.STADIUM_ID
    WHERE ST.STADIUM_NAME = @stadium_name
END

GO


-- Exercise 6
-- Create a stored procedure that displays
-- players whose jersey number is greater than
-- the average jersey number.

CREATE PROCEDURE prd_players_above_average_jersey
AS
BEGIN
    SELECT PLAYER_ID,
            PLAYER_NAME,
            POSITION,
            JERSEY_NUMBER
    FROM PLAYERS
    WHERE JERSEY_NUMBER >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYERS
    )
END

GO


-- Exercise 7
-- Create a stored procedure that
-- displays the oldest player in each club.

CREATE PROCEDURE prd_oldest_player_each_club
AS
BEGIN
    SELECT PL.CLUB_ID,
            PL.PLAYER_ID,
            PLAYER_NAME,
            BIRTH_DATE
    FROM PLAYERS PL
    WHERE BIRTH_DATE =
    (
        SELECT MIN(P2.BIRTH_DATE)
        FROM PLAYERS P2
        WHERE P2.CLUB_ID = PL.CLUB_ID
    )
END

GO


-- Exercise 8
-- Create a stored procedure that
-- displays the number of players in each position
-- whose total players are greater than a given value.

CREATE PROCEDURE prd_positions_with_min_players
    @minimum_players INT
AS
BEGIN
    SELECT POSITION,
            COUNT(*) AS NumberOfPlayers
    FROM PLAYERS
    GROUP BY POSITION
    HAVING COUNT(*) > @minimum_players
END

GO


-- Exercise 9
-- Create a stored procedure that
-- displays all coaches together with the clubs they manage.

CREATE PROCEDURE prd_coaches_with_clubs
AS
BEGIN
    SELECT CH.COACH_ID,
            COACH_NAME,
            C.CLUB_ID,
            CLUB_NAME
    FROM COACHES CH
    INNER JOIN CLUBS C
        ON CH.CLUB_ID = C.CLUB_ID
END

GO


-- Exercise 10
-- Create a stored procedure that displays the club having
-- the highest average jersey number together with its stadium name.

CREATE PROCEDURE prd_club_highest_average_jersey
AS
BEGIN
    SELECT TOP 1
        C.CLUB_ID,
        CLUB_NAME,
        STADIUM_NAME,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
    FROM CLUBS C
    INNER JOIN PLAYERS PL
        ON C.CLUB_ID = PL.CLUB_ID
    INNER JOIN STADIUMS ST
        ON C.STADIUM_ID = ST.STADIUM_ID
    GROUP BY
        C.CLUB_ID,
        CLUB_NAME,
        STADIUM_NAME
    ORDER BY AverageJerseyNumber DESC
END

GO
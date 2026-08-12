/*
Think before writing SQL.

Ask yourself:

- Why should I create a view instead of writing a SELECT statement?
- Which columns should the view contain?
- Should the view filter any records?
- Will the view simplify future queries?
- Which statement should I use: CREATE VIEW, ALTER VIEW, or DROP VIEW?
*/


-- Exercise 1
-- Create a view that displays player names and birth dates.

CREATE VIEW V_PLAYERS_BIRTH
AS
SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS

GO


-- Exercise 2
-- Create a view that displays all clubs and their stadium names.

CREATE VIEW V_CLUBS_STADIUM_NAME
AS
SELECT CLUB_NAME,
        STADIUM_NAME
FROM CLUBS
INNER JOIN STADIUMS
        ON CLUB.STADIUM_ID = STADIUM.STADIUM_ID

GO


-- Exercise 3
-- Create a view that displays players from Brazil.

CREATE VIEW V_PLAYERS_BRAZIL
AS
SELECT *
FROM PLAYERS PL
INNER JOIN COUNTRIES CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
WHERE COUNTRY_ID = 'BRA'

GO


-- Exercise 4
-- Display all records from the view created in Exercise 3.

CREATE VIEW V_RECORDS_BRAZIL
AS
SELECT *
FROM V_PLAYERS_BRAZIL

GO


-- Exercise 5
-- Create a view that displays player names together with their club names.

CREATE VIEW V_PLAYERS_CLUBS
AS
SELECT PLAYER_NAME,
        CLUB_NAME
FROM PLAYERS PL
INNER JOIN CLUBS C
        ON PL.CLUB_ID = C.CLUB_ID

GO


-- Exercise 6
-- Create a view that displays players whose jersey numbers
-- are greater than 15.

CREATE VIEW V_JERSEY_GT_15
AS
SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER > 15

GO


-- Exercise 7
-- Modify the view created in Exercise 6 so that
-- it displays players whose jersey numbers are greater than 10.

UPDATE V_JERSEY_GT_15
SET JERSEY_NUMBER = 10
WHERE JERSEY_NUMBER > 10

GO


-- Exercise 8
-- Delete the view created in Exercise 6.

DROP VIEW V_JERSEY_GT_15

GO


-- Exercise 9
-- Create a view that displays country names and
-- the number of players in each country.

CREATE VIEW V_COUNTRIES_PLAYERS_COUNT
AS
SELECT COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NUMBER_OF_PLAYERS
FROM COUNTRIES CT
INNER JOIN PLAYERS PL
        ON CT.COUNTRY_ID = PL.COUNTRY_ID

GO


-- Exercise 10
-- Create a view that displays club names and
-- the average jersey number of their players.

CREATE VIEW V_CLUB_AVG_JERSEY
AS
SELECT CLUB_NAME,
        AVG(JERSEY_NUMBER) AS AVERAGE_JERSEY_NUM
FROM CLUBS C
INNER JOIN PLAYERS
        ON C.CLUB_ID = PL.CLUB_ID

GO
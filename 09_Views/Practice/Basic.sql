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

CREATE VIEW V_PL_BIRTH
AS
SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYER

GO


-- Exercise 2
-- Create a view that displays all clubs and their stadium names.

CREATE VIEW V_CL_STADIUM
AS
SELECT CLUB_NAME,
        STADIUM_NAME
FROM CLUB
INNER JOIN STADIUM
        ON CLUB.STADIUM_ID = STADIUM.STADIUM_ID

GO


-- Exercise 3
-- Create a view that displays players from Brazil.

CREATE VIEW V_PL_BRAZIL
AS
SELECT *
FROM PLAYER
INNER JOIN COUNTRY
        ON PLAYER.COUNTRY_ID = COUNTRY.COUNTRY_ID
WHERE COUNTRY_ID = 'BRA'

GO


-- Exercise 4
-- Display all records from the view created in Exercise 3.

CREATE VIEW V_RECORDS_BRAZIL
AS
SELECT *
FROM V_PL_BRAZIL

GO


-- Exercise 5
-- Create a view that displays player names together with their club names.

CREATE VIEW V_PL_CLUB
AS
SELECT PLAYER_NAME,
        CLUB_NAME
FROM PLAYER
INNER JOIN CLUB
        ON PLAYER.CLUB_ID = CLUB.CLUB_ID

GO


-- Exercise 6
-- Create a view that displays players whose jersey numbers
-- are greater than 15.

CREATE VIEW V_JERSEY_GT_15
AS
SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
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

CREATE VIEW V_COUNTRY_PLAYER_COUNT
AS
SELECT COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NUMBER_OF_PLAYERS
FROM COUNTRY
INNER JOIN PLAYER
        ON COUNTRY.COUNTRY_ID = PLAYER.COUNTRY_ID

GO


-- Exercise 10
-- Create a view that displays club names and
-- the average jersey number of their players.

CREATE VIEW V_CLUB_AVG_JERSEY
AS
SELECT CLUB_NAME,
        AVG(JERSEY_NUMBER) AS AVERAGE_JERSEY_NUM
FROM CLUB
INNER JOIN PLAYER
        ON CLUB.CLUB_ID = PLAYER.CLUB_ID

GO
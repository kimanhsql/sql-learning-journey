-- Example 1
-- Groups with more than 5 records

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING COUNT(*) > 5


-- Example 2
-- Clubs with an average jersey number greater than 15

SELECT CLUB_ID,
       AVG(JERSEY_NUMBER) AS AverageJersey
FROM PLAYER
GROUP BY CLUB_ID
HAVING AVG(JERSEY_NUMBER) > 15


-- Example 3
-- Countries with at least 10 players

SELECT COUNTRY_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY COUNTRY_ID
HAVING COUNT(*) >= 10
/*
Challenge Practice

Solve the following problems without referring to previous examples.

Before writing SQL, ask yourself:

- What exactly needs to be measured?
- Should I count, total, average, or compare values?
- Do I need GROUP BY?
- Should I filter rows with WHERE?
- Should I filter groups with HAVING?
- Do I need DISTINCT?
*/


-- Challenge 1
-- Find the total number of players.

SELECT COUNT(*) AS TotalPlayers
FROM PLAYER


-- Challenge 2
-- Find the average jersey number of all players.

SELECT AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER


-- Challenge 3
-- Find the club with the highest number of players.

SELECT TOP 1
       CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID
ORDER BY COUNT(*) DESC


-- Challenge 4
-- Find the club with the lowest average jersey number.

SELECT TOP 1
       CLUB_ID,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID
ORDER BY AVG(JERSEY_NUMBER)


-- Challenge 5
-- Find all positions with more than 2 players.

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING COUNT(*) > 2


-- Challenge 6
-- For each club, display the number of players
-- and the average jersey number.

SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID


-- Challenge 7
-- Find the number of different positions in PLAYER.

SELECT COUNT(DISTINCT POSITION) AS NumberOfPositions
FROM PLAYER


-- Challenge 8
-- Find the club with the highest jersey number.

SELECT TOP 1
       CLUB_ID,
       MAX(JERSEY_NUMBER) AS HighestJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID
ORDER BY MAX(JERSEY_NUMBER) DESC


-- Challenge 9
-- Find clubs where the maximum jersey number
-- is greater than 20.

SELECT CLUB_ID,
       MAX(JERSEY_NUMBER) AS MaximumJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID
HAVING MAX(JERSEY_NUMBER) > 20


-- Challenge 10
-- For each position, display:
-- the number of players,
-- the minimum jersey number,
-- the maximum jersey number,
-- and the average jersey number.

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers,
       MIN(JERSEY_NUMBER) AS MinimumJerseyNumber,
       MAX(JERSEY_NUMBER) AS MaximumJerseyNumber,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER
GROUP BY POSITION
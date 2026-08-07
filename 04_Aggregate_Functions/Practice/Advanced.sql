/*
Before writing SQL, ask yourself:

- Do I need one result or one result per group?
- Which column should I GROUP BY?
- Should I filter rows with WHERE or groups with HAVING?
- Do I need DISTINCT?
- Which aggregate function answers the question?
*/


-- Exercise 1
-- Count the number of players in each club.

SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID


-- Exercise 2
-- Calculate the average jersey number for each club.

SELECT CLUB_ID,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID


-- Exercise 3
-- Find the minimum jersey number for each club.

SELECT CLUB_ID,
       MIN(JERSEY_NUMBER) AS MinimumJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID


-- Exercise 4
-- Find the maximum jersey number for each club.

SELECT CLUB_ID,
       MAX(JERSEY_NUMBER) AS MaximumJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID


-- Exercise 5
-- Calculate the total jersey numbers for each club.

SELECT CLUB_ID,
       SUM(JERSEY_NUMBER) AS TotalJerseyNumbers
FROM PLAYER
GROUP BY CLUB_ID


-- Exercise 6
-- Count the players in each position.

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY POSITION


-- Exercise 7
-- Find clubs that have more than 2 players.

SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID
HAVING COUNT(*) > 2


-- Exercise 8
-- Find positions that have more than 2 players.

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING COUNT(*) > 2


-- Exercise 9
-- Count the number of different clubs represented in PLAYER.

SELECT COUNT(DISTINCT CLUB_ID) AS NumberOfClubs
FROM PLAYER


-- Exercise 10
-- For each club, display:
-- the number of players,
-- the minimum jersey number,
-- the maximum jersey number,
-- and the average jersey number.

SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers,
       MIN(JERSEY_NUMBER) AS MinimumJerseyNumber,
       MAX(JERSEY_NUMBER) AS MaximumJerseyNumber,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID
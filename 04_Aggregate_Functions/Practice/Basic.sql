/*
Before writing SQL, ask yourself:

- What value do I need to calculate?
- Do I need COUNT, SUM, AVG, MIN, or MAX?
- Am I calculating one value for the whole table?
- Should NULL values be considered?
*/


-- Exercise 1
-- Count the total number of players.

SELECT COUNT(*) AS Total_Players
FROM PLAYERS


-- Exercise 2
-- Count the number of PLAYER_NAME values.

SELECT COUNT(PLAYER_NAME) AS Number_Of_Player_Names
FROM PLAYERS


-- Exercise 3
-- Calculate the total of all jersey numbers.

SELECT SUM(JERSEY_NUMBER) AS Total_Jersey_Numbers
FROM PLAYERS


-- Exercise 4
-- Calculate the average jersey number.

SELECT AVG(JERSEY_NUMBER) AS Average_Jersey_Number
FROM PLAYERS


-- Exercise 5
-- Find the smallest jersey number.

SELECT MIN(JERSEY_NUMBER) AS Minimum_Jersey_Number
FROM PLAYERS


-- Exercise 6
-- Find the largest jersey number.

SELECT MAX(JERSEY_NUMBER) AS Maximum_Jersey_Number
FROM PLAYERS


-- Exercise 7
-- Count the players who belong to CLUB_ID 1.

SELECT COUNT(*) AS Number_Of_Players
FROM PLAYERS
WHERE CLUB_ID = 1


-- Exercise 8
-- Calculate the average jersey number of players
-- who belong to CLUB_ID 1.

SELECT AVG(JERSEY_NUMBER) AS Average_Jersey_Number
FROM PLAYERS
WHERE CLUB_ID = 1


-- Exercise 9
-- Find the minimum and maximum jersey numbers.

SELECT MIN(JERSEY_NUMBER) AS Minimum_Jersey_Number,
        MAX(JERSEY_NUMBER) AS Maximum_Jersey_Number
FROM PLAYERS


-- Exercise 10
-- Calculate the total number of players,
-- the minimum jersey number, and the maximum jersey number.

SELECT COUNT(*) AS Total_Players,
        MIN(JERSEY_NUMBER) AS Minimum_Jersey_Number,
        MAX(JERSEY_NUMBER) AS Maximum_Jersey_Number
FROM PLAYERS
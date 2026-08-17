/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing an aggregate query, ask yourself:

1. Do I need one result or one result per group?
2. Which column should I GROUP BY?
3. Should I filter rows with WHERE or groups with HAVING?
4. Do I need DISTINCT?
5. Which aggregate function answers the question?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Aggregate functions perform calculations on multiple rows
  and return a single result for each group.
- Common aggregate functions include COUNT, SUM, AVG, MIN,
  and MAX.
- Use GROUP BY when the result needs to be calculated
  separately for each group.
- Without GROUP BY, aggregate functions normally return
  one result for the entire filtered result set.
- WHERE filters rows before grouping and aggregation.
- HAVING filters groups after GROUP BY and aggregation.
- Use COUNT when the question asks for the number of rows
  or values.
- Use SUM to calculate a total.
- Use AVG to calculate an average.
- Use MIN and MAX to find the smallest and largest values.
- Be careful with NULL values because aggregate functions
  may handle NULL differently from ordinary values.
- Use DISTINCT inside an aggregate function when the question
  requires unique values.
- Make sure every non-aggregated column in the SELECT list
  is properly included in GROUP BY.
============================================================
*/


-- Exercise 1
-- Count the number of players in each club.

SELECT CLUB_ID,
        COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 2
-- Calculate the average jersey number for each club.

SELECT CLUB_ID,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 3
-- Find the minimum jersey number for each club.

SELECT CLUB_ID,
        MIN(JERSEY_NUMBER) AS MinimumJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 4
-- Find the maximum jersey number for each club.

SELECT CLUB_ID,
        MAX(JERSEY_NUMBER) AS MaximumJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 5
-- Calculate the total jersey numbers for each club.

SELECT CLUB_ID,
        SUM(JERSEY_NUMBER) AS TotalJerseyNumbers
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 6
-- Count the players in each position.

SELECT POSITION,
        COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY POSITION


-- Exercise 7
-- Find clubs that have more than 2 players.

SELECT CLUB_ID,
        COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY CLUB_ID
HAVING COUNT(*) > 2


-- Exercise 8
-- Find positions that have more than 2 players.

SELECT POSITION,
        COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY POSITION
HAVING COUNT(*) > 2


-- Exercise 9
-- Count the number of different clubs represented in PLAYERS.

SELECT COUNT(DISTINCT CLUB_ID) AS NumberOfClubs
FROM PLAYERS


-- Exercise 10
-- For each club, display:
-- the number of players,
-- the minimum jersey number,
-- the maximum jersey number, and the average jersey number.

SELECT CLUB_ID,
        COUNT(*) AS NumberOfPlayers,
        MIN(JERSEY_NUMBER) AS MinimumJerseyNumber,
        MAX(JERSEY_NUMBER) AS MaximumJerseyNumber,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID
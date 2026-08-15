/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing an aggregate query, ask yourself:

1. What exactly needs to be measured?
2. Should I count, total, average, or compare values?
3. Do I need GROUP BY?
4. Should I filter rows with WHERE?
5. Should I filter groups with HAVING?
6. Do I need DISTINCT?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- COUNT, SUM, AVG, MIN, and MAX can be combined with
  GROUP BY to calculate values for each group.
- Use WHERE to filter individual rows before aggregation.
- Use HAVING to filter groups after aggregation.
- Do not use HAVING when WHERE can perform the required
  row-level filtering.
- Every non-aggregated column in SELECT must be included
  in GROUP BY.
- Use DISTINCT when the question requires unique values
  to be counted or aggregated.
- Be careful when combining multiple aggregate functions
  because each function may handle NULL values differently.
- Check whether the question asks for a result for the
  entire table or a separate result for each group.
- When comparing groups, make sure the grouping column
  represents the correct category.
- Read the result carefully to make sure the aggregation
  matches the meaning of the question.

============================================================
*/


-- Exercise 1
-- Find the total number of players.

SELECT COUNT(*) AS TotalPlayers
FROM PLAYERS


-- Exercise 2
-- Find the average jersey number of all players.

SELECT AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS


-- Exercise 3
-- Find the club with the highest number of players.

SELECT TOP 1
       CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY CLUB_ID
ORDER BY COUNT(*) DESC


-- Exercise 4
-- Find the club with the lowest average jersey number.

SELECT TOP 1
       CLUB_ID,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID
ORDER BY AVG(JERSEY_NUMBER)


-- Exercise 5
-- Find all positions with more than 2 players.

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY POSITION
HAVING COUNT(*) > 2


-- Exercise 6
-- For each club, display the number of players
-- and the average jersey number.

SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 7
-- Find the number of different positions in PLAYERS.

SELECT COUNT(DISTINCT POSITION) AS NumberOfPositions
FROM PLAYERS


-- Exercise 8
-- Find the club with the highest jersey number.

SELECT TOP 1
       CLUB_ID,
       MAX(JERSEY_NUMBER) AS HighestJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID
ORDER BY MAX(JERSEY_NUMBER) DESC


-- Exercise 9
-- Find clubs where the maximum jersey number is greater than 20.

SELECT CLUB_ID,
       MAX(JERSEY_NUMBER) AS MaximumJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID
HAVING MAX(JERSEY_NUMBER) > 20


-- Exercise 10
-- For each position, display:
-- the number of players,
-- the minimum jersey number,
-- the maximum jersey number, and the average jersey number.

SELECT POSITION,
       COUNT(*) AS NumberOfPlayers,
       MIN(JERSEY_NUMBER) AS MinimumJerseyNumber,
       MAX(JERSEY_NUMBER) AS MaximumJerseyNumber,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY POSITION
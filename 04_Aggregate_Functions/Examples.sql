/*
Think before writing SQL.

Ask yourself:

- What do I need to calculate?
- Should I count rows or a specific column?
- Do I need the total, average, minimum, or maximum?
- Do I need to calculate the result for the entire table or for each group?
- Should I filter rows before aggregation?
- Should I filter groups after aggregation?
*/


-- Example 1
-- Count all players.

SELECT COUNT(*) AS NumberOfPlayers
FROM PLAYER

GO


-- Example 2
-- Count players with a PLAYER_ID.

SELECT COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER

GO


-- Example 3
-- Calculate the average jersey number.

SELECT AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER

GO


-- Example 4
-- Find the smallest jersey number.

SELECT MIN(JERSEY_NUMBER) AS MinimumJerseyNumber
FROM PLAYER

GO


-- Example 5
-- Find the largest jersey number.

SELECT MAX(JERSEY_NUMBER) AS MaximumJerseyNumber
FROM PLAYER

GO


-- Example 6
-- Calculate the total of all jersey numbers.

SELECT SUM(JERSEY_NUMBER) AS TotalJerseyNumbers
FROM PLAYER

GO


-- Example 7
-- Count players for each club.

SELECT CLUB_ID,
        COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID

GO


-- Example 8
-- Calculate the average jersey number for each club.

SELECT CLUB_ID,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID

GO


-- Example 9
-- Find the highest jersey number for each club.

SELECT CLUB_ID,
        MAX(JERSEY_NUMBER) AS MaximumJerseyNumber
FROM PLAYER
GROUP BY CLUB_ID

GO


-- Example 10
-- Count forwards.

SELECT COUNT(PLAYER_ID) AS NumberOfForwards
FROM PLAYER
WHERE POSITION = 'Forward'

GO


-- Example 11
-- Count players for each position.

SELECT POSITION,
        COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER
GROUP BY POSITION

GO


-- Example 12
-- Display clubs with more than five players.

SELECT CLUB_ID,
        COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER
GROUP BY CLUB_ID
HAVING COUNT(PLAYER_ID) > 5

GO
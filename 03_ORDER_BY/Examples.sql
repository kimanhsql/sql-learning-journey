-- Example 1
-- Sort players alphabetically by their names.

SELECT *
FROM PLAYERS
ORDER BY PLAYER_NAME


-- Example 2
-- Sort players from the youngest to the oldest
-- based on their birth dates.

SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
ORDER BY BIRTH_DATE DESC


-- Example 3
-- Sort players by their jersey numbers in ascending order.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
ORDER BY JERSEY_NUMBER


-- Example 4
-- Sort players first by position, then by player name
-- within each position.

SELECT PLAYER_NAME,
        POSITION
FROM PLAYERS
ORDER BY POSITION,
        PLAYER_NAME


-- Example 5
-- Sort the result using a column alias.

SELECT PLAYER_NAME AS Name
FROM PLAYERS
ORDER BY Name
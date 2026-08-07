-- Example 1
-- Count the number of players.

SELECT COUNT(*)
FROM PLAYER


-- Example 2
-- Find the average jersey number.

SELECT AVG(JERSEY_NUMBER)
FROM PLAYER


-- Example 3
-- Display player names in uppercase.

SELECT UPPER(PLAYER_NAME)
FROM PLAYER


-- Example 4
-- Display the length of each player name.

SELECT PLAYER_NAME,
       LEN(PLAYER_NAME) AS NameLength
FROM PLAYER


-- Example 5
-- Display the first three characters of each player name.

SELECT PLAYER_NAME,
       LEFT(PLAYER_NAME, 3) AS FirstThreeCharacters
FROM PLAYER


-- Example 6
-- Display the current date and time.

SELECT GETDATE() AS CurrentDateTime


-- Example 7
-- Display the year of each player's birth date.

SELECT PLAYER_NAME,
       YEAR(BIRTH_DATE) AS BirthYear
FROM PLAYER


-- Example 8
-- Display the jersey number as text.

SELECT PLAYER_NAME,
       CAST(JERSEY_NUMBER AS VARCHAR(10)) AS JerseyText
FROM PLAYER


-- Example 9
-- Round the average jersey number for each position.

SELECT POSITION,
       ROUND(AVG(JERSEY_NUMBER), 0) AS RoundedAverageJersey
FROM PLAYER
GROUP BY POSITION


-- Example 10
-- Combine player name and position into one string.

SELECT CONCAT(PLAYER_NAME, ' - ', POSITION) AS PlayerInfo
FROM PLAYER
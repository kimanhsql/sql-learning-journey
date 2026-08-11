-- Example 1
-- Count the number of players in each position.

SELECT POSITION,
        COUNT(*)
FROM PLAYERS
GROUP BY POSITION


-- Example 2
-- Count the number of players from each country.

SELECT COUNTRY_ID,
        COUNT(*)
FROM PLAYERS
GROUP BY COUNTRY_ID


-- Example 3
-- Count the number of players in each club.

SELECT CLUB_ID,
        COUNT(*)
FROM PLAYERS
GROUP BY CLUB_ID


-- Example 4
-- Calculate the average jersey number for each position.

SELECT POSITION,
        AVG(JERSEY_NUMBER)
FROM PLAYERS
GROUP BY POSITION


-- Example 5
-- Display the most recent birth date in each country.

SELECT COUNTRY_ID,
        MAX(BIRTH_DATE)
FROM PLAYERS
GROUP BY COUNTRY_ID


-- Example 6
-- Count the number of players in each position, excluding Goalkeepers,
-- and sort the result by position.

SELECT POSITION,
        COUNT(*)
FROM PLAYERS
WHERE POSITION <> 'Goalkeeper'
GROUP BY POSITION
ORDER BY POSITION
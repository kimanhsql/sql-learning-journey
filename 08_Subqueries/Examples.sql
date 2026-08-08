-- Example 1
-- Find players whose jersey number is greater than
-- the average jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYER
)


-- Example 2
-- Find players from the same country as Messi.

SELECT PLAYER_NAME
FROM PLAYER
WHERE COUNTRY_ID =
(
    SELECT COUNTRY_ID
    FROM PLAYER
    WHERE PLAYER_NAME = 'Messi'
)


-- Example 3
-- Find clubs that have players.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
)


-- Example 4
-- Display the average jersey number together with every player.

SELECT PLAYER_NAME,
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYER
) AS AverageJersey
FROM PLAYER
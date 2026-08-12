-- Example 1
-- Find players whose jersey number is greater than
-- the average jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYERS
)


-- Example 2
-- Find players from the same country as Messi.

SELECT PLAYER_NAME
FROM PLAYERS
WHERE COUNTRY_ID =
(
    SELECT COUNTRY_ID
    FROM PLAYERS
    WHERE PLAYER_NAME = 'Messi'
)


-- Example 3
-- Find clubs that have players.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
)


-- Example 4
-- Display the average jersey number together with every player.

SELECT PLAYER_NAME,
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYERS
) AS AverageJersey
FROM PLAYERS
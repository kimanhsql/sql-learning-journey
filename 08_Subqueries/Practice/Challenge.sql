/*
Think before writing SQL.

Ask yourself:

- Can I combine JOIN and a subquery?
- Should I use an aggregate function inside the subquery?
- Do I need multiple subqueries?
- Can I simplify the query?
- Am I comparing the correct values?
- Would EXISTS or IN be a better choice?

Always understand what the subquery returns before writing the main query.
*/


-- Challenge 1
-- Display players who belong to clubs having more than five players.

SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
    GROUP BY CLUB_ID
    HAVING COUNT(*) > 5
)


-- Challenge 2
-- Display clubs whose average jersey number is greater than
-- the overall average jersey number.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
    GROUP BY CLUB_ID
    HAVING AVG(JERSEY_NUMBER) >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYER
    )
)


-- Challenge 3
-- Display countries whose average jersey number is greater
-- than the average jersey number of all players.

SELECT COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYER
    GROUP BY COUNTRY_ID
    HAVING AVG(JERSEY_NUMBER) >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYER
    )
)


-- Challenge 4
-- Display players whose jersey number is equal to
-- the highest jersey number in their club.

SELECT PLAYER_NAME,
        CLUB_ID,
        JERSEY_NUMBER
FROM PLAYER PL
WHERE JERSEY_NUMBER =
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYER
    WHERE CLUB_ID = PL.CLUB_ID
)


-- Challenge 5
-- Display clubs that have players older than the average player.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
    WHERE BIRTH_DATE <
    (
        SELECT AVG(BIRTH_DATE)
        FROM PLAYER
    )
)


-- Challenge 6
-- Display countries whose players have an average jersey number greater than 12.

SELECT COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYER
    GROUP BY COUNTRY_ID
    HAVING AVG(JERSEY_NUMBER) > 12
)


-- Challenge 7
-- Display players whose birth date is the earliest in their club.

SELECT PLAYER_NAME,
        CLUB_ID,
        BIRTH_DATE
FROM PLAYER PL
WHERE BIRTH_DATE =
(
    SELECT MIN(BIRTH_DATE)
    FROM PLAYER
    WHERE CLUB_ID = PL.CLUB_ID
)


-- Challenge 8
-- Display clubs that do not have any player wearing jersey number 10.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID NOT IN
(
    SELECT CLUB_ID
    FROM PLAYER
    WHERE JERSEY_NUMBER = 10
)


-- Challenge 9
-- Display countries that have at least one player playing for CLUB_ID = 1.

SELECT COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYER
    WHERE CLUB_ID = 1
)


-- Challenge 10
-- Display players whose jersey number is above their club's average jersey number.

SELECT PLAYER_NAME,
        CLUB_ID,
        JERSEY_NUMBER
FROM PLAYER PL
WHERE JERSEY_NUMBER >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYER
    WHERE CLUB_ID = PL.CLUB_ID
)
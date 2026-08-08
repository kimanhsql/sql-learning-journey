/*
Think before writing SQL.

Ask yourself:

- What is the main query?
- What information should the subquery return?
- Will the subquery return one value or multiple values?
- Which comparison operator should I use?
- Does the subquery belong in WHERE?

Remember:

- The subquery runs first.
- The main query uses the result returned by the subquery.
- A single-row subquery usually works with =, >, <, >=, <=, or <>.
*/


-- Exercise 1
-- Display players whose jersey number is greater than
-- the average jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYER
)


-- Exercise 2
-- Display players whose jersey number is less than
-- the average jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER <
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYER
)


-- Exercise 3
-- Display players from the same country as "Messi".

SELECT PLAYER_NAME
FROM PLAYER
WHERE COUNTRY_ID =
(
    SELECT COUNTRY_ID
    FROM PLAYER
    WHERE PLAYER_NAME = 'Messi'
)


-- Exercise 4
-- Display players from the same club as "Cristiano Ronaldo".

SELECT PLAYER_NAME
FROM PLAYER
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM PLAYER
    WHERE PLAYER_NAME = 'Cristiano Ronaldo'
)


-- Exercise 5
-- Display clubs that have at least one player.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
)


-- Exercise 6
-- Display clubs that do not have any players.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID NOT IN
(
    SELECT CLUB_ID
    FROM PLAYER
)


-- Exercise 7
-- Display countries that have at least one player.

SELECT COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYER
)


-- Exercise 8
-- Display players whose birth date is earlier than the average birth date.

SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYER
WHERE BIRTH_DATE <
(
    SELECT AVG(BIRTH_DATE)
    FROM PLAYER
)


-- Exercise 9
-- Display players whose jersey number is the highest in the table.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER =
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYER
)


-- Exercise 10
-- Display players who play for the club with CLUB_ID = 1.

SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM PLAYER
    WHERE CLUB_ID = 1
)
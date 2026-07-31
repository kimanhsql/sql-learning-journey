/*
Think before writing SQL.

Ask yourself:

- Does the subquery return one row or many rows?
- Should I use IN instead of =?
- Should I compare with MIN(), MAX(), AVG(), or COUNT()?
- Can the subquery return NULL?
- Will the subquery be executed once or for every row?

Build the subquery first, then write the main query.
*/


-- Exercise 1
-- Display players whose jersey number is equal to the minimum jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER =
(
    SELECT MIN(JERSEY_NUMBER)
    FROM PLAYER
)


-- Exercise 2
-- Display players who play for the same club as player ID = 5.

SELECT PLAYER_NAME
FROM PLAYER
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM PLAYER
    WHERE PLAYER_ID = 5
)


-- Exercise 3
-- Display clubs whose club ID appears in the PLAYER table.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
)


-- Exercise 4
-- Display countries that do not have any players.

SELECT COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID NOT IN
(
    SELECT COUNTRY_ID
    FROM PLAYER
)


-- Exercise 5
-- Display players whose birth date is later than the average birth date.

SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYER
WHERE BIRTH_DATE >
(
    SELECT AVG(BIRTH_DATE)
    FROM PLAYER
)


-- Exercise 6
-- Display players whose jersey number is greater than
-- the maximum jersey number of players in CLUB_ID = 2.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER >
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYER
    WHERE CLUB_ID = 2
)


-- Exercise 7
-- Display clubs that have players from COUNTRY_ID = 1.

SELECT CLUB_NAME
FROM CLUB
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYER
    WHERE COUNTRY_ID = 1
)


-- Exercise 8
-- Display players from the country with COUNTRY_ID = 3.

SELECT PLAYER_NAME
FROM PLAYER
WHERE COUNTRY_ID =
(
    SELECT COUNTRY_ID
    FROM COUNTRY
    WHERE COUNTRY_ID = 3
)


-- Exercise 9
-- Display the countries that have players wearing jersey number 10.

SELECT COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYER
    WHERE JERSEY_NUMBER = 10
)


-- Exercise 10
-- Display players whose jersey number is less than the maximum jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER <
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYER
)
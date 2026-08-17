/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a SUBQUERY, ask yourself:

1. What is the main query trying to find?
2. What information should the subquery return?
3. Will the subquery return one value or multiple values?
4. Which comparison operator should I use?
5. Does the subquery belong in WHERE?
6. Which column should be compared with the subquery result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A subquery is a query nested inside another SQL query.
- The subquery provides a result that is used by the main query.
- A single-row subquery usually works with =, >, <, >=, <=,
  or <>.
- If the subquery returns multiple rows, use an operator that
  can handle multiple values, such as IN.
- Make sure the subquery returns the type of value required
  by the main query.
- Build the subquery first and check its result before writing
  the main query.
- Keep the subquery simple and focused on returning the
  information needed by the main query.

Build the subquery first, then write the main query.
*/


-- Exercise 1
-- Display players whose jersey number is greater than
-- the average jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYERS
)


-- Exercise 2
-- Display players whose jersey number is less than
-- the average jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER <
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYERS
)


-- Exercise 3
-- Display players from the same country as "Messi".

SELECT PLAYER_NAME
FROM PLAYERS
WHERE COUNTRY_ID =
(
    SELECT COUNTRY_ID
    FROM PLAYERS
    WHERE PLAYER_NAME = 'Messi'
)


-- Exercise 4
-- Display players from the same club as "Cristiano Ronaldo".

SELECT PLAYER_NAME
FROM PLAYERS
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM PLAYERS
    WHERE PLAYER_NAME = 'Cristiano Ronaldo'
)


-- Exercise 5
-- Display clubs that have at least one player.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
)


-- Exercise 6
-- Display clubs that do not have any players.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID NOT IN
(
    SELECT CLUB_ID
    FROM PLAYERS
)


-- Exercise 7
-- Display countries that have at least one player.

SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYERS
)


-- Exercise 8
-- Display players whose birth date is earlier than
-- the average birth date.

SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
WHERE BIRTH_DATE <
(
    SELECT AVG(BIRTH_DATE)
    FROM PLAYERS
)


-- Exercise 9
-- Display players whose jersey number is the highest in the table.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER =
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYERS
)


-- Exercise 10
-- Display players who play for the club with CLUB_ID = 1.

SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM PLAYERS
    WHERE CLUB_ID = 1
)
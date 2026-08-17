/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a SUBQUERY, ask yourself:

1. Can I combine JOIN and a subquery?
2. Should I use an aggregate function inside the subquery?
3. Do I need one subquery or multiple subqueries?
4. Which part of the problem should each subquery solve?
5. Should I use IN, EXISTS, ANY, ALL, or a comparison operator?
6. Am I comparing the correct values between the main query
   and the subquery?
7. Can I simplify the query without changing the result?
8. Would a JOIN or GROUP BY be clearer than a subquery?
9. Does each subquery return the number of rows I expect?
10. Can the subquery return NULL and affect the result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A complex query can contain multiple subqueries when each
  subquery has a clear purpose.
- A subquery can be combined with JOIN, WHERE, GROUP BY,
  HAVING, or aggregate functions.
- Use IN when comparing a value with a list returned by
  a subquery.
- Use EXISTS when the main purpose is to check whether
  matching rows exist.
- Use aggregate functions when the subquery needs to calculate
  a value such as MIN(), MAX(), AVG(), SUM(), or COUNT().
- Make sure each subquery returns the correct number of rows
  for the operator being used.
- Do not use multiple subqueries unnecessarily. If JOIN,
  GROUP BY, or another approach makes the logic clearer,
  consider using it instead.
- Test each subquery separately before combining it with
  the main query.
- Check the result of each step to make sure the final query
  answers the question correctly.

Understand what each subquery returns before writing
the main query.
*/


-- Exercise 1
-- Display players who belong to clubs having more than five players.

SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
    GROUP BY CLUB_ID
    HAVING COUNT(*) > 5
)


-- Exercise 2
-- Display clubs whose average jersey number is greater than
-- the overall average jersey number.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
    GROUP BY CLUB_ID
    HAVING AVG(JERSEY_NUMBER) >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYERS
    )
)


-- Exercise 3
-- Display countries whose average jersey number
-- is greater than the average jersey number of all players.

SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYERS
    GROUP BY COUNTRY_ID
    HAVING AVG(JERSEY_NUMBER) >
    (
        SELECT AVG(JERSEY_NUMBER)
        FROM PLAYERS
    )
)


-- Exercise 4
-- Display players whose jersey number is equal to
-- the highest jersey number in their club.

SELECT PLAYER_NAME,
        CLUB_ID,
        JERSEY_NUMBER
FROM PLAYERS PL
WHERE JERSEY_NUMBER =
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYERS
    WHERE CLUB_ID = PL.CLUB_ID
)


-- Exercise 5
-- Display clubs that have players older than the average player.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
    WHERE BIRTH_DATE <
    (
        SELECT AVG(BIRTH_DATE)
        FROM PLAYERS
    )
)


-- Exercise 6
-- Display countries whose players have
-- an average jersey number greater than 12.

SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYERS
    GROUP BY COUNTRY_ID
    HAVING AVG(JERSEY_NUMBER) > 12
)


-- Exercise 7
-- Display players whose birth date is the earliest in their club.

SELECT PLAYER_NAME,
        CLUB_ID,
        BIRTH_DATE
FROM PLAYERS PL
WHERE BIRTH_DATE =
(
    SELECT MIN(BIRTH_DATE)
    FROM PLAYERS
    WHERE CLUB_ID = PL.CLUB_ID
)


-- Exercise 8
-- Display clubs that do not have any player wearing jersey number 10.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID NOT IN
(
    SELECT CLUB_ID
    FROM PLAYERS
    WHERE JERSEY_NUMBER = 10
)


-- Exercise 9
-- Display countries that have at least
-- one player playing for CLUB_ID = 1.

SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYERS
    WHERE CLUB_ID = 1
)


-- Exercise 10
-- Display players whose jersey number is above
-- their club's average jersey number.

SELECT PLAYER_NAME,
        CLUB_ID,
        JERSEY_NUMBER
FROM PLAYERS PL
WHERE JERSEY_NUMBER >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYERS
    WHERE CLUB_ID = PL.CLUB_ID
)
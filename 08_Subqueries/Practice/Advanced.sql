/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a SUBQUERY, ask yourself:

1. What information should the subquery return?
2. Does the subquery return one row or multiple rows?
3. Should I use =, IN, ANY, ALL, EXISTS, or NOT EXISTS?
4. Which column should I compare with the subquery result?
5. Should I use an aggregate function such as MIN(), MAX(),
    AVG(), or COUNT() inside the subquery?
6. Does the subquery depend on the current row of the main query?
7. Can the subquery return NULL?
8. Do I need a correlated subquery, or can I use a simple
    subquery?
9. Can the same result be obtained more clearly with a JOIN
    or GROUP BY?
10. Is the subquery necessary, or am I making the query
    more complicated than it needs to be?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A subquery is a query nested inside another SQL statement.
- Build and test the subquery first before writing the main query.
- Use = when the subquery is expected to return exactly one value.
- Use IN when the subquery can return multiple values.
- Use EXISTS when you only need to check whether matching rows
  exist.
- Use NOT EXISTS when you need to check that no matching rows exist.
- Aggregate functions such as MIN(), MAX(), AVG(), and COUNT()
  can be used to produce a value for comparison.
- A scalar subquery should return only one value.
- If a subquery returns multiple rows, make sure the operator
  used in the main query can handle multiple values.
- Be careful when a subquery can return NULL because NULL can
  affect comparison results.
- A correlated subquery refers to a column from the outer query
  and may be evaluated for each row processed by the main query.
- A non-correlated subquery does not depend on the outer query
  and can usually be evaluated independently.
- Check whether a JOIN or GROUP BY would make the query simpler
  and easier to understand.
- Avoid using a subquery only because it is possible. Use it when
  it makes the logic of the query clearer or matches the problem.

Build the subquery first, then write the main query.
*/


-- Exercise 1
-- Display players whose jersey number is equal to
-- the minimum jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER =
(
    SELECT MIN(JERSEY_NUMBER)
    FROM PLAYERS
)


-- Exercise 2
-- Display players who play for the same club as player ID = 5.

SELECT PLAYER_NAME
FROM PLAYERS
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM PLAYERS
    WHERE PLAYER_ID = 5
)


-- Exercise 3
-- Display clubs whose club ID appears in the PLAYERS table.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
)


-- Exercise 4
-- Display countries that do not have any players.

SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID NOT IN
(
    SELECT COUNTRY_ID
    FROM PLAYERS
)


-- Exercise 5
-- Display players whose birth date is later than
-- the average birth date.

SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
WHERE BIRTH_DATE >
(
    SELECT AVG(BIRTH_DATE)
    FROM PLAYERS
)


-- Exercise 6
-- Display players whose jersey number is greater than
-- the maximum jersey number of players in CLUB_ID = 2.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER >
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYERS
    WHERE CLUB_ID = 2
)


-- Exercise 7
-- Display clubs that have players from COUNTRY_ID = 1.

SELECT CLUB_NAME
FROM CLUBS
WHERE CLUB_ID IN
(
    SELECT CLUB_ID
    FROM PLAYERS
    WHERE COUNTRY_ID = 1
)


-- Exercise 8
-- Display players from the country with COUNTRY_ID = 3.

SELECT PLAYER_NAME
FROM PLAYERS
WHERE COUNTRY_ID =
(
    SELECT COUNTRY_ID
    FROM COUNTRIES
    WHERE COUNTRY_ID = 3
)


-- Exercise 9
-- Display the countries that have players wearing jersey number 10.

SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID IN
(
    SELECT COUNTRY_ID
    FROM PLAYERS
    WHERE JERSEY_NUMBER = 10
)


-- Exercise 10
-- Display players whose jersey number is less than
-- the maximum jersey number.

SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER <
(
    SELECT MAX(JERSEY_NUMBER)
    FROM PLAYERS
)
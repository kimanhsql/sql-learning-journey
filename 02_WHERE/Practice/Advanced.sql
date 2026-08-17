/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a WHERE clause, ask yourself:

1. Do I need one condition or multiple conditions?
2. Which logical operator should I use (AND, OR, or NOT)?
3. Should I use LIKE, BETWEEN, IN, or IS NULL?
4. Does the condition require exact matching or pattern matching?
5. Should I combine conditions from different columns or tables?
6. Can I simplify the WHERE clause without changing the result?
7. Is there another operator that makes the condition easier to read?
8. Will every row returned satisfy all the required conditions?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- WHERE filters rows based on a condition.
- Use AND when all conditions must be satisfied.
- Use OR when at least one condition must be satisfied.
- Use NOT to exclude rows that satisfy a condition.
- Use LIKE for pattern matching.
- Use BETWEEN for values within a range.
- Use IN when comparing a value with multiple possible values.
- Use IS NULL or IS NOT NULL when checking for NULL values.
- Use parentheses when combining AND and OR to make the logic explicit.
- Be careful with NULL because it does not behave
  like an ordinary value.
- Keep conditions clear and avoid unnecessary complexity.
- Make sure the WHERE clause matches the exact requirements
  of the question.
============================================================
*/


-- Exercise 1
-- Display players whose jersey number is greater than 10
-- and whose position is Forward.

SELECT PLAYER_ID,
        PLAYER_NAME,
        JERSEY_NUMBER,
        POSITION
FROM PLAYERS
WHERE JERSEY_NUMBER > 10
        AND POSITION = 'Forward'


-- Exercise 2
-- Display players whose position is not Goalkeeper.

SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION
FROM PLAYERS
WHERE POSITION <> 'Goalkeeper'


-- Exercise 3
-- Display players whose names start with "A" or end with "n".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME LIKE 'A%'
        OR PLAYER_NAME LIKE '%n'

-- Exercise 4
-- Display players whose jersey number is not between 5 and 15.

SELECT PLAYER_ID,
        PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
WHERE JERSEY_NUMBER NOT BETWEEN 5 AND 15


-- Exercise 5
-- Display players whose country is either Vietnam, England, or Brazil.

SELECT PLAYER_ID,
        PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYERS PL, COUNTRIES CT
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
        AND COUNTRY_NAME IN ('Vietnam', 'England', 'Brazil')


-- Exercise 6
-- Display players whose names do not contain the letter "a".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME NOT LIKE '%a%'


-- Exercise 7
-- Display players born between 1995 and 2005.

SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
WHERE BIRTHDATE BETWEEN '1995-01-01'
        AND '2005-12-31'


-- Exercise 8
-- Display players whose birth date is not NULL
-- and whose jersey number is greater than 20.

SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE,
        JERSEY_NUMBER
FROM PLAYERS
WHERE BIRTH_DATE IS NOT NULL
        AND JERSEY_NUMBER > 20


-- Exercise 9
-- Display players who are not Forward and
-- whose jersey number is less than 10.

SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION,
        JERSEY_NUMBER
FROM PLAYERS
WHERE POSITION <> 'Forward'
        AND JERSEY_NUMBER < 10


-- Exercise 10
-- Display Vietnamese players whose position is Midfielder.

SELECT PLAYER_ID,
        PLAYER_NAME,
        COUNTRY_NAME,
        POSITION
FROM PLAYERS PL, COUNTRIES CT
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
        AND COUNTRY_NAME = 'Vietnam'
        AND POSITION = 'Midfielder'
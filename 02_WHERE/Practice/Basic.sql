/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a WHERE clause, ask yourself:

1. Which table contains the required data?
2. Which column should I filter?
3. Which comparison operator should I use?
4. Should I use =, >, <, >=, <=, or <>?
5. Does the condition match exactly what the question asks?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- WHERE is used to filter rows based on a condition.
- Use = for equality.
- Use > or < for greater-than or less-than comparisons.
- Use >= or <= when the boundary value should be included.
- Use <> when the value must be different.
- Character and date values should be written using appropriate
  quotation marks.
- Make sure the data type of the value matches the column being
  compared.
- A WHERE condition determines which rows are returned.
- Do not add conditions that are not required by the question.

============================================================
*/


-- Exercise 1
-- Display all players whose position is Forward.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE POSITION = 'Forward'


-- Exercise 2
-- Display players whose jersey number is greater than 10.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE JERSEY_NUMBER > 10


-- Exercise 3
-- Display Vietnamese players.

SELECT PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYERS PL, COUNTRIES CT
WHERE PL.COUNTRY_ID = CT.COUNTRY_ID
    AND COUNTRY_NAME = 'Vietnam'


-- Exercise 4
-- Display players born after 2000.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE BIRTH_DATE >= '2001-01-01'


-- Exercise 5
-- Display players whose names start with "N".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME LIKE 'N%'


-- Exercise 6
-- Display players whose jersey number is between 1 and 10.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE JERSEY_NUMBER BETWEEN 1 AND 10


-- Exercise 7
-- Display players whose position is either Forward or Midfielder.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE POSITION = 'Forward'
    OR POSITION = 'Midfielder'


-- Exercise 8
-- Display players whose names end with "n".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME LIKE '%n'


-- Exercise 9
-- Display players whose names contain "an".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME LIKE '%an%'


-- Exercise 10
-- Display players whose birth date is NULL.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE BIRTH_DATE IS NULL
/*
Think before writing SQL.

Ask yourself:

- Do I need one condition or multiple conditions?
- Which logical operator should I use (AND, OR, or NOT)?
- Should I use LIKE, BETWEEN, IN, or IS NULL?
- Does the condition require exact matching or pattern matching?
- Should I combine conditions from different tables?
- Can I simplify the WHERE clause without changing the result?
- Is there another operator that makes the query easier to read?
- Will every row returned satisfy all the required conditions?

Analyze the filtering logic first.
Then build the WHERE clause step by step.
*/


-- Exercise 1
-- Display players whose jersey number is greater than 10
-- and whose position is Forward.

SELECT PLAYER_ID,
        PLAYER_NAME,
        JERSEY_NUMBER,
        POSITION
FROM PLAYER
WHERE JERSEY_NUMBER > 10
        AND POSITION = 'Forward'


-- Exercise 2
-- Display players whose position is not Goalkeeper.

SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION
FROM PLAYER
WHERE POSITION <> 'Goalkeeper'


-- Exercise 3
-- Display players whose names start with "A" or end with "n".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME LIKE 'A%'
        OR PLAYER_NAME LIKE '%n'

-- Exercise 4
-- Display players whose jersey number is not between 5 and 15.

SELECT PLAYER_ID,
        PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER NOT BETWEEN 5 AND 15


-- Exercise 5
-- Display players whose country is either Vietnam, England, or Brazil.

SELECT PLAYER_ID,
        PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYER PL, COUNTRY C
WHERE C.COUNTRY_ID = PL.COUNTRY_ID
        AND COUNTRY_NAME IN ('Vietnam', 'England', 'Brazil')


-- Exercise 6
-- Display players whose names do not contain the letter "a".

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME NOT LIKE '%a%'


-- Exercise 7
-- Display players born between 1995 and 2005.

SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE
FROM PLAYER
WHERE BIRTHDATE BETWEEN '1995-01-01'
                AND '2005-12-31'


-- Exercise 8
-- Display players whose birth date is not NULL
-- and whose jersey number is greater than 20.

SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE,
        JERSEY_NUMBER
FROM PLAYER
WHERE BIRTH_DATE IS NOT NULL
        AND JERSEY_NUMBER > 20


-- Exercise 9
-- Display players who are not Forward and
-- whose jersey number is less than 10.

SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION,
        JERSEY_NUMBER
FROM PLAYER
WHERE POSITION <> 'Forward'
        AND JERSEY_NUMBER < 10


-- Exercise 10
-- Display Vietnamese players whose position is Midfielder.

SELECT PLAYER_ID,
        PLAYER_NAME,
        COUNTRY_NAME,
        POSITION
FROM PLAYER PL, COUNTRY C
WHERE C.COUNTRY_ID = PL.COUNTRY_ID
        AND COUNTRY_NAME = 'Vietnam'
        AND POSITION = 'Midfielder'
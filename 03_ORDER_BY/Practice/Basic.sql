/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing an ORDER BY clause, ask yourself:

1. Which column should be used for sorting?
2. Should the result be sorted in ascending or descending order?
3. Do I need to sort by one column or multiple columns?
4. Does the sorting improve the readability of the result?
5. Should ORDER BY be combined with WHERE, GROUP BY, or DISTINCT?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- ORDER BY is used to sort the result set.
- ASC sorts values in ascending order and is the default.
- DESC sorts values in descending order.
- Multiple columns can be used to define multiple sorting levels.
- The order of columns in ORDER BY determines the sorting priority.
- ORDER BY changes only the order in which rows are displayed.
- ORDER BY does not change the data stored in the table.
- Use ORDER BY when the question requires a specific order.

============================================================
*/


-- Exercise 1
-- Display all players sorted by name.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
ORDER BY PLAYER_NAME


-- Exercise 2
-- Display all players sorted by jersey number.

SELECT PLAYER_ID,
        PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
ORDER BY JERSEY_NUMBER


-- Exercise 3
-- Display all players sorted by birth date from oldest to youngest.

SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
ORDER BY BIRTH_DATE ASC


-- Exercise 4
-- Display all players sorted by birth date from youngest to oldest.

SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
ORDER BY BIRTH_DATE DESC


-- Exercise 5
-- Display all players sorted by position.

SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION
FROM PLAYERS
ORDER BY POSITION


-- Exercise 6
-- Display all players sorted by country.

SELECT PLAYER_ID,
        PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYERS PL, COUNTRIES CT
WHERE PL.COUNTRY_ID = CT.COUNTRY_ID
ORDER BY COUNTRY_NAME


-- Exercise 7
-- Display all clubs sorted alphabetically.

SELECT CLUB_ID,
        CLUB_NAME
FROM CLUBS
ORDER BY CLUB_NAME ASC


-- Exercise 8
-- Display all stadiums sorted by name.

SELECT STADIUM_ID,
        STADIUM_NAME
FROM STADIUMS
ORDER BY STADIUM_NAME


-- Exercise 9
-- Display all players sorted by position and then by name.

SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
ORDER BY POSITION,
        PLAYER_NAME


-- Exercise 10
-- Display all coaches sorted by birth date.

SELECT COACH_ID,
        COACH_NAME,
        BIRTH_DATE
FROM COACHES
ORDER BY BIRTH_DATE
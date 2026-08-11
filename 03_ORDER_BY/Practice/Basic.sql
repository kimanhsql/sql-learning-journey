/*
Think before writing SQL.

Ask yourself:

- Which column should be used for sorting?
- Should the result be sorted in ascending or descending order?
- Do I need to sort by one column or multiple columns?
- Does the sorting improve the readability of the result?
- Should ORDER BY be combined with WHERE, GROUP BY, or DISTINCT?

Sorting the result does not change the data in the table.
It only changes the order in which the rows are displayed.
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
FROM PLAYERS P, COUNTRIES C
WHERE P.COUNTRY_ID = C.COUNTRY_ID
ORDER BY COUNTRY_NAME


-- Exercise 7
-- Display all clubs sorted alphabetically.

SELECT CLUB_ID,
        CLUB_NAME
FROM CLUB
ORDER BY CLUB_NAME ASC


-- Exercise 8
-- Display all stadiums sorted by name.

SELECT STADIUM_ID,
        STADIUM_NAME
FROM STADIUM
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
FROM COACH
ORDER BY BIRTH_DATE
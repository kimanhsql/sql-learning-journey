-- Exercise 1
-- Display all players sorted by name.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
ORDER BY PLAYER_NAME


-- Exercise 2
-- Display all players sorted by jersey number.

SELECT PLAYER_ID, PLAYER_NAME, JERSEY_NUMBER
FROM PLAYER
ORDER BY JERSEY_NUMBER


-- Exercise 3
-- Display all players sorted by birth date from oldest to youngest.

SELECT PLAYER_ID, PLAYER_NAME, BIRTH_DATE
FROM PLAYER
ORDER BY BIRTH_DATE ASC


-- Exercise 4
-- Display all players sorted by birth date from youngest to oldest.

SELECT PLAYER_ID, PLAYER_NAME, BIRTH_DATE
FROM PLAYER
ORDER BY BIRTH_DATE DESC


-- Exercise 5
-- Display all players sorted by position.

SELECT PLAYER_ID, PLAYER_NAME, POSITION
FROM PLAYER
ORDER BY POSITION


-- Exercise 6
-- Display all players sorted by country.

SELECT PLAYER_ID, PLAYER_NAME, COUNTRY_NAME
FROM PLAYER P, COUNTRY C
WHERE P.COUNTRY_ID = C.COUNTRY
ORDER BY COUNTRY_NAME


-- Exercise 7
-- Display all clubs sorted alphabetically.

SELECT CLUB_ID, CLUB_NAME
FROM CLUB
ORDER BY CLUB_NAME ASC


-- Exercise 8
-- Display all stadiums sorted by name.

SELECT STADIUM_ID, STADIUM_NAME
FROM STADIUM
ORDER BY STADIUM_NAME


-- Exercise 9
-- Display all players sorted by position and then by name.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
ORDER BY POSITION,
            PLAYER_NAME


-- Exercise 10
-- Display all coaches sorted by birth date.

SELECT COACH_ID, COACH_NAME, BIRTH_DATE
FROM COACH
ORDER BY BIRTH_DATE
-- Exercise 1
-- Display all players whose position is Forward.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE POSITION = 'Forward'


-- Exercise 2
-- Display players whose jersey number is greater than 10.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE JERSEY_NUMBER > 10


-- Exercise 3
-- Display Vietnamese players.

SELECT PLAYER_NAME, COUNTRY_NAME
FROM PLAYER P, COUNTRY C
WHERE P.COUNTRY_ID = C.COUNTRY_ID
    AND COUNTRY_NAME = 'Vietnam'


-- Exercise 4
-- Display players born after 2000.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE BIRTH_DATE >= '2001-01-01'


-- Exercise 5
-- Display players whose names start with "N".

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME LIKE 'N%'


-- Exercise 6
-- Display players whose jersey number is between 1 and 10.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE JERSEY_NUMBER BETWEEN 1 AND 10


-- Exercise 7
-- Display players whose position is either Forward or Midfielder.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE POSITION = 'Forward'
    OR POSITION = 'Midfielder'


-- Exercise 8
-- Display players whose names end with "n".

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME LIKE '%n'


-- Exercise 9
-- Display players whose names contain "an".

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME LIKE '%an%'


-- Exercise 10
-- Display players whose birth date is NULL.

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE BIRTH_DATE IS NULL
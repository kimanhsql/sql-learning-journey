-- Exercise 1
-- Display positions that have more than 2 players.

SELECT POSITION,
       COUNT(*) AS NumOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING COUNT(*) > 2


-- Exercise 2
-- Display clubs that have at least 5 players.

SELECT C.CLUB_ID,
       CLUB_NAME,
       COUNT(*) AS NumInClubs
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID,
         CLUB_NAME
HAVING COUNT(*) >= 5


-- Exercise 3
-- Display countries whose average jersey number is greater than 15.

SELECT CT.COUNTRY_ID,
       COUNTRY_NAME,
       AVG(JERSEY_NUMBER) AS Player_Num
FROM COUNTRY CT, PLAYER P
WHERE CT.COUNTRY_ID = P.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
         COUNTRY_NAME
HAVING AVG(JERSEY_NUMBER) > 15


-- Exercise 4
-- Display positions whose earliest birth date is before 1995.

SELECT POSITION,
       MIN(BIRTH_DATE) AS Birthday
FROM PLAYER
GROUP BY POSITION
HAVING MIN(BIRTH_DATE) < '1995-01-01'


-- Exercise 5
-- Display clubs whose highest jersey number is greater than 20.

SELECT C.CLUB_ID,
       CLUB_NAME,
       MAX(JERSEY_NUMBER) AS Highest_Num
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID,
         CLUB_NAME
HAVING MAX(JERSEY_NUMBER) > 20


-- Exercise 6
-- Display countries that have exactly 3 players.

SELECT CT.COUNTRY_ID,
       COUNTRY_NAME,
       COUNT(*) AS NumOfPlayers
FROM COUNTRY CT, PLAYER P
WHERE CT.COUNTRY_ID = P.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
         COUNTRY_NAME
HAVING COUNT(*) = 3


-- Exercise 7
-- Display positions that have fewer than 5 players.

SELECT POSITION,
       COUNT(*) AS NumOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING COUNT(*) < 5


-- Exercise 8
-- Display clubs with more than 2 players, sorted by club name.

SELECT C.CLUB_NAME,
       COUNT(*) AS NumInClubs
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_NAME
HAVING COUNT(*) > 2
ORDER BY CLUB_NAME


-- Exercise 9
-- Display countries whose average jersey number is between 10 and 20.

SELECT CT.COUNTRY_ID,
       COUNTRY_NAME,
       AVG(JERSEY_NUMBER) AS Player_Num
FROM COUNTRY CT, PLAYER P
WHERE CT.COUNTRY_ID = P.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
         COUNTRY_NAME
HAVING AVG(JERSEY_NUMBER) BETWEEN 10 AND 20


-- Exercise 10
-- Display clubs that have more than one Forward.

SELECT C.CLUB_ID,
       CLUB_NAME,
       COUNT(*) AS Position_Num
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
  AND POSITION = 'Forward'
GROUP BY C.CLUB_ID,
         CLUB_NAME
HAVING COUNT(*) > 1
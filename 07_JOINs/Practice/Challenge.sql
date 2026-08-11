/*
Think before writing SQL.

Ask yourself:

- Which tables are required to answer the question?
- What is the shortest path between the tables?
- Do I need JOIN together with WHERE, GROUP BY, or HAVING?
- Will some tables require multiple JOINs?
- Should I combine different JOIN types?
- Is every selected column coming from the correct table?

Analyze the database relationships before writing SQL.
*/


-- Exercise 1
-- Display the number of players in each club together
-- with the club and stadium names.

SELECT CLUB_NAME,
        STADIUM_NAME,
        COUNT(*) AS NumOfPlayers
FROM CLUBS C
INNER JOIN STADIUMS ST
        ON ST.STADIUM_ID = C.STADIUM_ID
INNER JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CLUB_NAME,
        STADIUM_NAME


-- Exercise 2
-- Display countries that have more than three players.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        COUNT(*) AS Player_Count
FROM COUNTRIES CT
INNER JOIN PLAYERS PL
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME
HAVING COUNT(*) > 3


-- Exercise 3
-- Display clubs whose average jersey number is greater than 15.

SELECT C.CLUB_ID,
        CLUB_NAME,
        AVG(JERSEY_NUMBER) AS Average_Jersey_Num
FROM CLUBS C
INNER JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
HAVING AVG(JERSEY_NUMBER) > 15


-- Exercise 4
-- Display coaches who manage more than one club.

SELECT CH.COACH_ID,
        COACH_NAME,
        COUNT(CLUB_ID) AS NumOfClubs
FROM COACHES CH
INNER JOIN CLUB_COACHES CC
        ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUBS C
        ON C.CLUB_ID = CC.CLUB_ID
GROUP BY CH.COACH_ID,
        COACH_NAME
HAVING COUNT(CLUB_ID) > 1


-- Exercise 5
-- Display clubs that currently have no coach assigned.

SELECT C.CLUB_ID,
        CLUB_NAME
FROM CLUBS C
LEFT JOIN CLUB_COACHES CC
        ON C.CLUB_ID = CC.CLUB_ID
WHERE CC.COACH_ID IS NULL


-- Exercise 6
-- Display the number of players in each country and position.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        POSITION,
        COUNT(*) AS NumOfPlayers
FROM COUNTRIES CT
INNER JOIN PLAYERS PL
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME,
        POSITION


-- Exercise 7
-- Display stadiums that are used by clubs having more than five players.

SELECT ST.STADIUM_ID,
        STADIUM_NAME,
        CLUB_NAME,
        COUNT(*) AS NumOfPlayers
FROM STADIUMS ST
INNER JOIN CLUBS C
        ON C.STADIUM_ID = ST.STADIUM_ID
INNER JOIN PLAYER PL
        ON PL.CLUB_ID = C.CLUB_ID
GROUP BY ST.STADIUM_ID,
        STADIUM_NAME,
        CLUB_NAME
HAVING COUNT(*) > 5


-- Exercise 8
-- Display coaches together with the total number of players they manage.

SELECT CH.COACH_ID,
        COACH_NAME,
        COUNT(*) AS NumOfPlayers
FROM COACHES CH
INNER JOIN CLUB_COACHES CC
        ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUBS C
        ON C.CLUB_ID = CC.CLUB_ID
INNER JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CH.COACH_ID,
        COACH_NAME


-- Exercise 9
-- Display the number of players in each stadium.

SELECT ST.STADIUM_ID,
        STADIUM_NAME,
        COUNT(*) AS NumOfPlayers
FROM STADIUMS ST
INNER JOIN CLUBS C
        ON C.STADIUM_ID = ST.STADIUM_ID
INNER JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
GROUP BY ST.STADIUM_ID,
        STADIUM_NAME
ORDER BY NumOfPlayers DESC


-- Exercise 10
-- Display coaches who manage clubs having more than eleven players.

SELECT CH.COACH_ID,
        COACH_NAME,
        COUNT(*) AS NumOfPlayers
FROM COACHES CH
INNER JOIN CLUB_COACHES CC
        ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUBS C
        ON C.CLUB_ID = CC.CLUB_ID
INNER JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CH.COACH_ID,
        COACH_NAME
HAVING COUNT(*) > 11
ORDER BY NumOfPlayers DESC
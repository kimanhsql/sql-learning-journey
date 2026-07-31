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


-- Challenge 1
-- Display the number of players in each club together
-- with the club and stadium names.

SELECT CLUB_NAME,
        STADIUM_NAME,
        COUNT(*) AS NumOfPlayers
FROM CLUB C
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CLUB_NAME, STADIUM_NAME


-- Challenge 2
-- Display countries that have more than three players.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        COUNT(*) AS Player_Count
FROM COUNTRY CT
INNER JOIN PLAYER PL
ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
            COUNTRY_NAME
HAVING COUNT(*) > 3


-- Challenge 3
-- Display clubs whose average jersey number is greater than 15.

SELECT C.CLUB_ID,
        CLUB_NAME,
        AVG(JERSEY_NUMBER) AS Average_Jersey_Num
FROM CLUB C
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CLUB_ID,
            CLUB_NAME
HAVING AVG(JERSEY_NUMBER) > 15


-- Challenge 4
-- Display coaches who manage more than one club.

SELECT CH.COACH_ID,
       COACH_NAME,
       COUNT(CLUB_ID) AS NumOfClubs
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUB C
ON C.CLUB_ID = CC.CLUB_ID
GROUP BY CH.COACH_ID,
            COACH_NAME
HAVING COUNT(CLUB_ID) > 1


-- Challenge 5
-- Display clubs that currently have no coach assigned.

SELECT C.CLUB_ID,
       CLUB_NAME
FROM CLUB C
LEFT JOIN COACH_CLUB CC
ON C.CLUB_ID = CC.CLUB_ID
WHERE CC.COACH_ID IS NULL


-- Challenge 6
-- Display the number of players in each country and position.

SELECT COUNTRY_ID,
        COUNTRY_NAME,
        POSITION,
        COUNT(*) AS NumOfPlayers
FROM COUNTRY CT
INNER JOIN PLAYER PL
ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY COUNTRY_ID,
            COUNTRY_NAME,
            POSITION


-- Challenge 7
-- Display stadiums that are used by clubs having more than five players.

SELECT STADIUM_ID,
        STADIUM_NAME,
        CLUB_NAME,
        COUNT(*) AS NumOfPlayers
FROM STADIUM ST
INNER JOIN CLUB C
ON C.STADIUM_ID = ST.STADIUM_ID
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
GROUP BY STADIUM_ID,
            STADIUM_NAME,
            CLUB_NAME
HAVING COUNT(*) > 5


-- Challenge 8
-- Display coaches together with the total number of players they manage.

SELECT CH.COACH_ID,
        COACH_NAME,
        COUNT(*) AS NumOfPlayers
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUB C
ON C.CLUB_ID = CC.CLUB_ID
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CH.COACH_ID,
            COACH_NAME


-- Challenge 9
-- Display the number of players in each stadium.

SELECT ST.STADIUM_ID,
        STADIUM_NAME,
        COUNT(*) AS NumOfPlayers
FROM STADIUM ST
INNER JOIN CLUB C
ON C.STADIUM_ID = ST.STADIUM_ID
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
GROUP BY ST.STADIUM_ID,
            STADIUM_NAME
ORDER BY NumOfPlayers DESC


-- Challenge 10
-- Display coaches who manage clubs having more than eleven players.

SELECT CH.COACH_ID,
        COACH_NAME,
        COUNT(*) AS NumOfPlayers
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUB C
ON C.CLUB_ID = CC.CLUB_ID
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
GROUP BY CH.COACH_ID,
            COACH_NAME
HAVING COUNT(*) > 11
ORDER BY NumOfPlayers DESC
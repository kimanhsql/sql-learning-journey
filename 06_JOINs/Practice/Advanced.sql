/*
Think before writing SQL.

Ask yourself:

- Do I need to join more than two tables?
- Which table should I start with?
- Should I use INNER JOIN or OUTER JOIN?
- Will every table have matching records?
- Can I simplify the JOIN order?
- Should I use table aliases to improve readability?

Build the query one JOIN at a time.
*/


-- Exercise 1
-- Display player names, club names, and stadium names.

SELECT PLAYER_NAME,
        CLUB_NAME,
        STADIUM_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 2
-- Display coach names, club names, and stadium names.

SELECT COACH_NAME,
        CLUB_NAME,
        STADIUM_NAME
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUB C
ON C.CLUB_ID = COACH_CLUB.CLUB_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 3
-- Display player names, country names, club names, and stadium names.

SELECT PLAYER_NAME,
        COUNTRY_NAME,
        CLUB_NAME,
        STADIUM_NAME
FROM PLAYER PL
INNER JOIN COUNTRY CT
ON CT.COUNTRY_ID = PL.COUNTRY_ID
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 4
-- Display all players together with their coaches.

SELECT PLAYER_NAME,
        COACH_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACH CH
ON CH.COACH_ID = CC.COACH_ID


-- Exercise 5
-- Display all clubs and the number of coaches assigned to each club.

SELECT C.CLUB_ID,
        CLUB_NAME,
        COUNT(*) AS NumberOfCoaches
FROM CLUB C
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
GROUP BY C.CLUB_ID, CLUB_NAME


-- Exercise 6
-- Display all stadiums, including stadiums that do not belong to any club.

SELECT STADIUM_NAME,
        CLUB_NAME
FROM STADIUM ST
LEFT JOIN CLUB C
ON C.STADIUM_ID = ST.STADIUM_ID


-- Exercise 7
-- Display all countries together with their players and clubs.

SELECT COUNTRY_NAME,
        PLAYER_NAME,
        CLUB_NAME
FROM COUNTRY CT
INNER JOIN PLAYER PL
ON PL.COUNTRY_ID = CT.COUNTRY_ID
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID


-- Exercise 8
-- Display all coaches and the stadiums of the clubs they manage.

SELECT COACH_NAME,
        STADIUM_NAME,
        CLUB_NAME
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 9
-- Display players together with their club, country, and coach.

SELECT PLAYER_NAME,
        CLUB_NAME,
        COUNTRY_NAME,
        COACH_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN COUNTRY CT
ON CT.COUNTRY_ID = PL.COUNTRY_ID
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACH CH
ON CH.COACH_ID = CC.COACH_ID


-- Exercise 10
-- Display all clubs, players, coaches, and stadiums in one query.

SELECT CLUB_NAME,
        PLAYER_NAME,
        COACH_NAME,
        STADIUM_NAME
FROM CLUB C
INNER JOIN PLAYER PL
ON PL.CLUB_ID = C.CLUB_ID
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACH CH
ON CH.COACH_ID = CC.COACH_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID
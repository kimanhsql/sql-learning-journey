-- Exercise 1
-- Display player names together with their club names.

SELECT CLUB_NAME,
        PLAYER_NAME
FROM CLUB C
INNER JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID


-- Exercise 2
-- Display player names together with their country names.

SELECT COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRY CT
INNER JOIN PLAYER PL
ON CT.COUNTRY_ID = PL.COUNTRY_ID


-- Exercise 3
-- Display club names and their stadium names.

SELECT STADIUM_NAME,
        CLUB_NAME
FROM STADIUM ST
INNER JOIN CLUB C
ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 4
-- Display coach names together with the clubs they manage.

SELECT COACH_NAME,
       CLUB_NAME
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CH.COACH_ID = CC.COACH_ID
INNER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID


-- Exercise 5
-- Display player names, club names, and country names.

SELECT PLAYER_NAME,
       CLUB_NAME,
       COUNTRY_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON PL.CLUB_ID = C.CLUB_ID
INNER JOIN COUNTRY CT
ON PL.COUNTRY_ID = CT.COUNTRY_ID


-- Exercise 6
-- Display all clubs, including clubs that have no players.

SELECT C.CLUB_ID,
       CLUB_NAME,
       PLAYER_NAME
FROM CLUB C
LEFT OUTER JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID


-- Exercise 7
-- Display all countries, including countries that have no players.

SELECT CT.COUNTRY_ID,
       COUNTRY_NAME,
       PLAYER_NAME
FROM COUNTRY CT
LEFT OUTER JOIN PLAYER PL
ON CT.COUNTRY_ID = PL.COUNTRY_ID


-- Exercise 8
-- Display all coaches and the clubs they manage, including coaches who are not assigned to any club.

SELECT CH.COACH_ID,
       COACH_NAME,
       CLUB_NAME
FROM COACH CH
LEFT OUTER JOIN COACH_CLUB CC
ON CH.COACH_ID = CC.COACH_ID
LEFT OUTER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID


-- Exercise 9
-- Display every possible combination of players and clubs.

SELECT PLAYER_NAME,
       CLUB_NAME
FROM PLAYER
CROSS JOIN CLUB


-- Exercise 10
-- Display players who have the same position.

SELECT PL1.PLAYER_NAME,
       PL2.PLAYER_NAME,
       PL1.POSITION
FROM PLAYER PL1
INNER JOIN PLAYER PL2
ON PL1.POSITION = PL2.POSITION
WHERE PL1.PLAYER_ID < PL2.PLAYER_ID
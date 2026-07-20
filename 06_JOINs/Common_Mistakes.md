# Common Mistakes

## Forgetting the bridge table

When two tables have a many-to-many relationship, they must be connected through a bridge table.

Wrong

SELECT COACH_NAME,
       CLUB_NAME
FROM COACH
INNER JOIN CLUB
ON COACH.COACH_ID = CLUB.COACH_ID

Correct

SELECT COACH_NAME,
       CLUB_NAME
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CH.COACH_ID = CC.COACH_ID
INNER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID

---

## Using the wrong JOIN type

Exercise 6 requires displaying all clubs, including clubs that have no players.

This means the query must return rows even when there is no matching record in the PLAYER table.

Wrong

SELECT CLUB_ID,
        CLUB_NAME,
        PLAYER_NAME
FROM CLUB C
INNER JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID

Correct

SELECT CLUB_ID,
        CLUB_NAME,
        PLAYER_NAME
FROM CLUB C
LEFT OUTER JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID

---

## Joining a table with itself unnecessarily

Exercise 7 requires displaying all countries, including countries that have no players.

There is no need to join the COUNTRY table with itself.

Wrong

SELECT COUNTRY_ID,
        COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRY CT1
INNER JOIN COUNTRY CT2
ON CT1.COUNTRY_ID = CT2.COUNTRY_ID

Correct

SELECT COUNTRY_ID,
        COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRY CT
LEFT OUTER JOIN PLAYER PL
ON CT.COUNTRY_ID = PL.COUNTRY_ID

---

## Using CROSS JOIN incorrectly

Exercise 8 requires displaying all coaches and the clubs they manage, including coaches who are not assigned to any club.

A CROSS JOIN returns every possible combination of rows, which is not the expected result.

Wrong

SELECT COACH_ID,
        COACH_NAME,
        CLUB_ID,
        CLUB_NAME
FROM COACH
CROSS JOIN CLUB

Correct

SELECT CH.COACH_ID,
       COACH_NAME,
       CLUB_NAME
FROM COACH CH
LEFT OUTER JOIN COACH_CLUB CC
ON CH.COACH_ID = CC.COACH_ID
LEFT OUTER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID

---

## Using FULL OUTER JOIN instead of SELF JOIN

Wrong

SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION
FROM PLAYER PL1
FULL OUTER JOIN PLAYER PL2
ON PL1.POSITION = PL2.POSITION

Correct

SELECT PL1.PLAYER_ID,
       PL1.PLAYER_NAME,
       PL1.POSITION
FROM PLAYER PL1
INNER JOIN PLAYER PL2
ON PL1.POSITION = PL2.POSITION
WHERE PL1.PLAYER_ID < PL2.PLAYER_ID

---

## Missing alias

Wrong

SELECT CLUB_ID,
       PLAYER_NAME
FROM CLUB C
LEFT JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID

Correct

SELECT C.CLUB_ID,
       C.CLUB_NAME,
       PL.PLAYER_NAME
FROM CLUB C
LEFT JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID
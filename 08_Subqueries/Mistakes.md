# Mistakes

## Comparing dates incorrectly

When comparing dates, remember that an earlier date means an older date.

Wrong

SELECT PLAYER_NAME,
       BIRTH_DATE
FROM PLAYER
WHERE BIRTH_DATE >
(
    SELECT AVG(BIRTH_DATE)
    FROM PLAYER
)

Correct

SELECT PLAYER_NAME,
       BIRTH_DATE
FROM PLAYER
WHERE BIRTH_DATE <
(
    SELECT AVG(BIRTH_DATE)
    FROM PLAYER
)

An earlier date represents an older record because it occurred before another date.

---

## Using JOIN instead of practicing Subqueries

When learning Subqueries, avoid using JOIN if the exercise is designed to practice Subqueries.

Wrong

SELECT PLAYER_NAME,
       CLUB_NAME
FROM PLAYER P
INNER JOIN CLUB C
ON P.CLUB_ID = C.CLUB_ID
WHERE C.CLUB_ID = 1

Correct

SELECT PLAYER_NAME
FROM PLAYER
WHERE CLUB_ID =
(
    SELECT CLUB_ID
    FROM CLUB
    WHERE CLUB_ID = 1
)
# Common Mistakes

## Using aliases in the HAVING clause

Wrong

SELECT POSITION,
       COUNT(*) AS NumOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING NumOfPlayers > 2

Correct

SELECT POSITION,
       COUNT(*) AS NumOfPlayers
FROM PLAYER
GROUP BY POSITION
HAVING COUNT(*) > 2

---

## Comparing a DATE value with an integer

Data type Date is a string, we aggregate by a string, not numeric.

Wrong

SELECT POSITION,
       MIN(BIRTH_DATE) AS Birthday
FROM PLAYER
GROUP BY POSITION
HAVING MIN(BIRTH_DATE) < 1995

Correct

SELECT POSITION,
       MIN(BIRTH_DATE) AS Birthday
FROM PLAYER
GROUP BY POSITION
HAVING MIN(BIRTH_DATE) < '1995-01-01'

---

## Forgetting ORDER BY after HAVING

The problem sorted by club name, not filtered record.

Wrong

SELECT C.CLUB_NAME,
       COUNT(*) AS NumInClubs
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_NAME
HAVING COUNT(*) > 2

Correct

SELECT C.CLUB_NAME,
       COUNT(*) AS NumInClubs
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_NAME
HAVING COUNT(*) > 2
ORDER BY CLUB_NAME

---

## Forgetting the relationship between tables

Wrong

SELECT C.CLUB_ID,
       CLUB_NAME,
       COUNT(*) AS Position_Num
FROM CLUB C, PLAYER P
WHERE POSITION = 'Forward'
GROUP BY C.CLUB_ID,
         CLUB_NAME
HAVING COUNT(*) > 1

Correct

SELECT C.CLUB_ID,
       CLUB_NAME,
       COUNT(*) AS Position_Num
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
  AND POSITION = 'Forward'
GROUP BY C.CLUB_ID,
         CLUB_NAME
HAVING COUNT(*) > 1
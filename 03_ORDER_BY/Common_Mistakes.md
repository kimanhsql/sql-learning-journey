# Common Mistakes

## Including columns which appear in `ORDER BY` clause

Columns used in the ORDER BY clause should also appear in the SELECT statement so as to easily to see results.

Wrong

SELECT PLAYER_ID, PLAYER_NAME
    FROM PLAYER
    ORDER BY JERSEY_NUMBER

Correct

SELECT PLAYER_ID, PLAYER_NAME, JERSEY_NUMBER
    FROM PLAYER
    ORDER BY JERSEY_NUMBER

---

## Confusing about `ASC` and `DESC` in birth_date column

The problem said that sorting birth_date from youngest to oldest, which means sorting in descending order.

Wrong

SELECT PLAYER_ID, PLAYER_NAME, BIRTH_DATE
    FROM PLAYER
    ORDER BY BIRTH_DATE ASC

Correct

SELECT PLAYER_ID, PLAYER_NAME, BIRTH_DATE
    FROM PLAYER
    ORDER BY BIRTH_DATE DESC

---

## Ordering by an unavailable column

COUNTRY_ID appears in COUNTRY table, we use WHERE clause to connect two tables: PLAYER and COUNTRY.

Wrong

SELECT PLAYER_ID, PLAYER_NAME
    FROM PLAYER
    ORDER BY COUNTRY_NAME

Correct

SELECT PLAYER_ID, PLAYER_NAME, COUNTRY_NAME
    FROM PLAYER P, COUNTRY C
    WHERE P.COUNTRY_ID = C.COUNTRY
    ORDER BY COUNTRY_NAME
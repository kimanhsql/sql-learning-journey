# Common Mistakes

## Using columns that do not exist in the selected table

Always make sure the columns you reference belong to the table in the `FROM` clause.

---

## Confusing the `YEAR()` and `GETDATE()` functions

Wrong

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE YEAR(GETDATE(BIRTH_DATE)) > 2000

Correct

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE BIRTH_DATE >= '2001-01-01'

---

## Misunderstanding the requirement

The question asks to find names that **contain** `"an"`, not only names that start or end with `"an"`.

Wrong

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME LIKE '%an'
    OR PLAYER_NAME LIKE 'an%'

Correct

SELECT PLAYER_ID, PLAYER_NAME
FROM PLAYER
WHERE PLAYER_NAME LIKE '%an%'
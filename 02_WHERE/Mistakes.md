# Mistakes

## 1. Using columns that do not exist in the selected table

Always make sure the columns you reference belong to the table in the FROM clause.

---

## 2. Confusing the YEAR() and GETDATE() functions

Wrong

```sql
SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE YEAR(GETDATE(BIRTH_DATE)) > 2000
```

Correct

```sql
SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE BIRTH_DATE >= '2001-01-01'
```

---

## 3. Misunderstanding the requirement

The question asks to find names that **contain** `"an"`, not only names that start or end with `"an"`.

Wrong

```sql
SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME LIKE '%an'
        OR PLAYER_NAME LIKE 'an%'
```

Correct

```sql
SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
WHERE PLAYER_NAME LIKE '%an%'
```
# Mistakes

## 1. Missing column in `GROUP BY` clause

Every selected column that is not part of an aggregate function must be included in the **GROUP BY** clause.

Wrong

```sql
SELECT C.CLUB_ID,
        CLUB_NAME,
        MAX(JERSEY_NUMBER)
FROM CLUBS C, PLAYERS P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID
```

Correct

```sql
SELECT C.CLUB_ID,
        CLUB_NAME,
        MAX(JERSEY_NUMBER)
FROM CLUBS C, PLAYERS P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
```

---

## 2. Using unqualified column names

Wrong

```sql
SELECT CLUB_ID,
        CLUB_NAME,
        COUNT(PLAYER_ID) AS NumPlayerInClub
FROM CLUBS C, PLAYERS P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY CLUB_ID,
        CLUB_NAME
```

Correct

```sql
SELECT C.CLUB_ID,
        CLUB_NAME,
        COUNT(PLAYER_ID) AS NumPlayerInClub
FROM CLUBS C, PLAYERS P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
```

---

## 3. Selecting unnecessary columns in grouped queries

Wrong

```sql
SELECT C.CLUB_ID,
        CLUB_NAME,
        PLAYER_ID,
        PLAYER_NAME,
        MAX(JERSEY_NUMBER)
FROM CLUBS C, PLAYERS P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
```

Correct

```sql
SELECT C.CLUB_ID,
        CLUB_NAME,
        MAX(JERSEY_NUMBER)
FROM CLUBS C, PLAYERS P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
```

---

## 4. Using `ORDER BY` before `GROUP BY`

Wrong

```sql
SELECT POSITION,
        COUNT(*)
FROM PLAYERS
ORDER BY POSITION
GROUP BY POSITION
```

Correct

```sql
SELECT POSITION,
        COUNT(*)
FROM PLAYERS
GROUP BY POSITION
ORDER BY POSITION
```

---

## 5. Missing commas in the list of columns

Wrong

```sql
SELECT POSITION
        AVG(JERSEY_NUMBER)
FROM PLAYERS
GROUP BY POSITION
```

Correct

```sql
SELECT POSITION,
        AVG(JERSEY_NUMBER)
FROM PLAYERS
GROUP BY POSITION
```

---

## 6. Using aggregate functions in the `WHERE` clause

Wrong

```sql
SELECT POSITION,
        COUNT(*)
FROM PLAYERS
WHERE COUNT(*) > 3
GROUP BY POSITION
```

Correct

```sql
SELECT POSITION,
        COUNT(*)
FROM PLAYERS
GROUP BY POSITION
HAVING COUNT(*) > 3
```
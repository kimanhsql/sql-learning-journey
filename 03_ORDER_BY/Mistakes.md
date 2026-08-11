# Mistakes

## 1. Including columns which appear in `ORDER BY` clause

Columns used in the **ORDER BY** clause should also appear in the **SELECT** statement so as to easily to see results.

Wrong

```sql
SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
ORDER BY JERSEY_NUMBER
```

Correct

```sql
SELECT PLAYER_ID,
        PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
ORDER BY JERSEY_NUMBER
```

---

## 2. Confusing about `ASC` and `DESC` in birth_date column

The problem said that sorting birth_date from youngest to oldest, which means sorting in descending order.

Wrong

```sql
SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
ORDER BY BIRTH_DATE ASC
```

Correct

```sql
SELECT PLAYER_ID,
        PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS
ORDER BY BIRTH_DATE DESC
```

---

## 3. Ordering by an unavailable column

**COUNTRY_ID** appears in **COUNTRY** table, we use **WHERE** clause to connect two tables: **PLAYER** and **COUNTRY**.

Wrong

```sql
SELECT PLAYER_ID,
        PLAYER_NAME
FROM PLAYERS
ORDER BY COUNTRY_NAME
```

Correct

```sql
SELECT PLAYER_ID,
        PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYERS PL, COUNTRIES CT
WHERE PL.COUNTRY_ID = CT.COUNTRY_ID
ORDER BY COUNTRY_NAME
```
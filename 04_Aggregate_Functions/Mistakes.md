# Mistakes

## 1. Using `COUNT(*)` instead of `COUNT(column)`

**COUNT(*)** counts all rows, while **COUNT(column_name)** counts only non-NULL values in that column.

Wrong

```sql
SELECT COUNT(PLAYER_NAME)
FROM PLAYERS
```

Correct

```sql
SELECT COUNT(*)
FROM PLAYERS
```

---

## 2. Using `WHERE` to filter aggregate results

**WHERE** filters rows before aggregation.

**HAVING** filters groups after **GROUP BY**.

Wrong

```sql
SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYERS
WHERE COUNT(*) > 2
GROUP BY CLUB_ID
```

Correct

```sql
SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY CLUB_ID
HAVING COUNT(*) > 2
```

---

## 3. Forgetting `GROUP BY`

When calculating an aggregate value for each group, the grouping column must be included in **GROUP BY**.

Wrong

```sql
SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYERS
```

Correct

```sql
SELECT CLUB_ID,
       COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY CLUB_ID
```

---

## 4. Confusing one overall result with one result per group

Without **GROUP BY**, an aggregate function normally returns one result for the entire filtered result set.

Wrong

```sql
SELECT AVG(JERSEY_NUMBER)
FROM PLAYERS
```

It returns one average for all players.

To calculate an average for each club:

Correct

```sql
SELECT CLUB_ID,
       AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY CLUB_ID
```

---

## 5. Forgetting that aggregate functions ignore NULL values

**SUM**, **AVG**, **MIN**, **MAX**, and **COUNT(column)** ignore NULL values.

Therefore, the result may be different from what is expected if the column contains NULL values.

---

## 6. Using `DISTINCT` without understanding what it does

**DISTINCT** removes duplicate result values.

It does not perform aggregation and does not replace **GROUP BY**.

Wrong

```sql
SELECT DISTINCT CLUB_ID,
       COUNT(*)
FROM PLAYERS
```

Correct

```sql
SELECT CLUB_ID,
       COUNT(*)
FROM PLAYERS
GROUP BY CLUB_ID
```
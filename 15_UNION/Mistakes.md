# Mistakes

## 1. Confusing `UNION` with `JOIN`

**UNION** combines result sets vertically.

**JOIN** combines related rows from different tables horizontally.

Use **UNION** when the goal is to put similar results into one result set.

---

## 2. Using `UNION` when duplicates should be preserved

**UNION** removes duplicate rows.

If duplicates should remain, use **UNION ALL**.

Wrong

```sql
SELECT PLAYER_NAME
FROM PLAYER

UNION

SELECT COACH_NAME
FROM COACH
```

Correct

```sql
SELECT PLAYER_NAME
FROM PLAYER

UNION ALL

SELECT COACH_NAME
FROM COACH
```

---

## 3. Using `UNION ALL` when duplicates should be removed

**UNION ALL** preserves duplicate rows.

Use **UNION** when duplicate rows should appear only once.

Wrong

```sql
SELECT PLAYER_NAME
FROM PLAYER

UNION ALL

SELECT COACH_NAME
FROM COACH
```

Correct

```sql
SELECT PLAYER_NAME
FROM PLAYER

UNION

SELECT COACH_NAME
FROM COACH
```

---

## 4. Different numbers of columns

All `SELECT` statements in a `UNION` must return the same number of columns.

Wrong

```sql
SELECT PLAYER_NAME
FROM PLAYER

UNION

SELECT COACH_NAME,
        CLUB_ID
FROM COACH
```

Correct

```sql
SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER

UNION

SELECT COACH_NAME,
        CLUB_ID
FROM COACH
```

---

## 5. Incompatible data types

Corresponding columns should have compatible data types.

Wrong

```sql
SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER

UNION

SELECT COACH_NAME,
        COACH_NAME
FROM COACH
```

Correct

```sql
SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER

UNION

SELECT COACH_NAME,
        CLUB_ID
FROM COACH
```

---

## 6. Applying `ORDER BY` to an individual `SELECT`

When using **UNION**, the final **ORDER BY** should normally be applied to the combined result.

Wrong

```sql
SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER
ORDER BY PERSON_NAME

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACH
```

Correct

```sql
SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACH

ORDER BY PERSON_NAME
```

---

## 7. Forgetting that the column names come from the first `SELECT`

The output column names of a **UNION** are normally determined by the first **SELECT**.

Use an alias in the first **SELECT** when a meaningful final column name is needed.

Correct

```sql
SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION

SELECT COACH_NAME
FROM COACH
```

The final column is named **PERSON_NAME**.

---

## 8. Using `UNION` when the tables should actually be joined

Do not use **UNION** simply because data comes from two tables.

If the task requires combining related information from the same row or relationship, a **JOIN** may be more appropriate.

Use **UNION** when the result sets have a compatible structure and should be stacked together.
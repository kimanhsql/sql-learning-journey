# Mistakes

-- Basic
## Forgetting the bridge table

When two tables have a many-to-many relationship, they must be connected through a bridge table.

Wrong

```sql
SELECT COACH_NAME,
       CLUB_NAME
FROM COACH
INNER JOIN CLUB
ON COACH.COACH_ID = CLUB.COACH_ID
```

Correct

```sql
SELECT COACH_NAME,
       CLUB_NAME
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CH.COACH_ID = CC.COACH_ID
INNER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID
```

---

## Using the wrong JOIN type

Exercise 6 requires displaying all clubs, including clubs that have no players.

This means the query must return rows even when there is no matching record in the PLAYER table.

Wrong

```sql
SELECT CLUB_ID,
        CLUB_NAME,
        PLAYER_NAME
FROM CLUB C
INNER JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID
```

Correct

```sql
SELECT CLUB_ID,
        CLUB_NAME,
        PLAYER_NAME
FROM CLUB C
LEFT OUTER JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID
```

---

## Joining a table with itself unnecessarily

Exercise 7 requires displaying all countries, including countries that have no players.

There is no need to join the COUNTRY table with itself.

Wrong

```sql
SELECT COUNTRY_ID,
        COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRY CT1
INNER JOIN COUNTRY CT2
ON CT1.COUNTRY_ID = CT2.COUNTRY_ID
```

Correct

```sql
SELECT COUNTRY_ID,
        COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRY CT
LEFT OUTER JOIN PLAYER PL
ON CT.COUNTRY_ID = PL.COUNTRY_ID
```

---

## Using CROSS JOIN incorrectly

Exercise 8 requires displaying all coaches and the clubs they manage, including coaches who are not assigned to any club.

A CROSS JOIN returns every possible combination of rows, which is not the expected result.

Wrong

```sql
SELECT COACH_ID,
        COACH_NAME,
        CLUB_ID,
        CLUB_NAME
FROM COACH
CROSS JOIN CLUB
```

Correct

```sql
SELECT CH.COACH_ID,
       COACH_NAME,
       CLUB_NAME
FROM COACH CH
LEFT OUTER JOIN COACH_CLUB CC
ON CH.COACH_ID = CC.COACH_ID
LEFT OUTER JOIN CLUB C
ON CC.CLUB_ID = C.CLUB_ID
```

---

## Using FULL OUTER JOIN instead of SELF JOIN

Wrong

```sql
SELECT PLAYER_ID,
        PLAYER_NAME,
        POSITION
FROM PLAYER PL1
FULL OUTER JOIN PLAYER PL2
ON PL1.POSITION = PL2.POSITION
```

Correct

```sql
SELECT PL1.PLAYER_ID,
       PL1.PLAYER_NAME,
       PL1.POSITION
FROM PLAYER PL1
INNER JOIN PLAYER PL2
ON PL1.POSITION = PL2.POSITION
WHERE PL1.PLAYER_ID < PL2.PLAYER_ID
```

---

## Missing alias

Wrong

```sql
SELECT CLUB_ID,
       PLAYER_NAME
FROM CLUB C
LEFT JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID
```

Correct

```sql
SELECT C.CLUB_ID,
       C.CLUB_NAME,
       PL.PLAYER_NAME
FROM CLUB C
LEFT JOIN PLAYER PL
ON C.CLUB_ID = PL.CLUB_ID
```

---

-- Advanced
## Assuming foreign keys without checking the database schema

Exercise 1 requires before writing a JOIN, verify that the two tables are directly related.

Wrong

```sql
SELECT PLAYER_NAME,
       CLUB_NAME,
       STADIUM_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = PL.STADIUM_ID
```

Correct

```sql
SELECT PLAYER_NAME,
       CLUB_NAME,
       STADIUM_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN STADIUM ST
ON ST.STADIUM_ID = C.STADIUM_ID
```

---

## Forgetting GROUP BY when using aggregate functions

Excercise 5 requires aggregate functions and normal columns cannot be selected together without GROUP BY.

Wrong

```sql
SELECT CLUB_NAME,
       COUNT(*) AS NumberOfCoaches
FROM CLUB C
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
```

Correct

```sql
SELECT CLUB_NAME,
       COUNT(*) AS NumberOfCoaches
FROM CLUB C
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
GROUP BY CLUB_NAME
```

---

## Selecting a column from a table that was never joined

Exercise 9 requires every selected column must come from a table included in the query.

Wrong

```sql
SELECT PLAYER_NAME,
       CLUB_NAME,
       COUNTRY_NAME,
       COACH_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN COUNTRY CT
ON CT.COUNTRY_ID = PL.COUNTRY_ID
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
```

Correct

```sql
SELECT PLAYER_NAME,
       CLUB_NAME,
       COUNTRY_NAME,
       COACH_NAME
FROM PLAYER PL
INNER JOIN CLUB C
ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN COUNTRY CT
ON CT.COUNTRY_ID = PL.COUNTRY_ID
INNER JOIN COACH_CLUB CC
ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACH CH
ON CH.COACH_ID = CC.COACH_ID
```

---

-- Challenge
## Grouping by too many columns

Challenge 4 requires when counting related records, group by the main entity instead of every joined table.

Wrong

```sql
SELECT COACH_NAME,
        CLUB_NAME
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUB C
ON C.CLUB_ID = CC.CLUB_ID
GROUP BY COACH_NAME,
        CLUB_NAME
HAVING COUNT(*) > 1
```

Correct

```sql
SELECT CH.COACH_ID,
        COACH_NAME,
        COUNT(*) AS NumberOfClubs
FROM COACH CH
INNER JOIN COACH_CLUB CC
ON CC.COACH_ID = CH.COACH_ID
GROUP BY CH.COACH_ID,
        COACH_NAME
HAVING COUNT(*) > 1
```
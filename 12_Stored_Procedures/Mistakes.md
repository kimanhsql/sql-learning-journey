# Mistakes

## 1. Using the wrong data type for parameters

The parameter data type should match the corresponding column in the table whenever possible.

Wrong

```sql
CREATE FUNCTION dbo.GetPlayersByCountry (@CountryName NVARCHAR(MAX))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM PLAYER
    WHERE COUNTRY_NAME = @CountryName
)
```

Correct

```sql
CREATE FUNCTION dbo.GetPlayersByCountry (@CountryName NVARCHAR(60))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM PLAYER
    WHERE COUNTRY_NAME = @CountryName
)
```

---

## 2. Using COUNT(*) instead of COUNT(column)

COUNT(*) counts all rows.

If the exercise asks you to count a specific column, use COUNT(column_name).

Wrong

```sql
SELECT COUNTRY_NAME,
        COUNT(*) AS NumberOfPlayers
FROM PLAYER PL
INNER JOIN COUNTRY CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY COUNTRY_NAME
```

Correct

```sql
SELECT COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER PL
INNER JOIN COUNTRY CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY COUNTRY_NAME
```

---

## 3. Forgetting to GROUP BY every non-aggregated column

Every selected column that is not inside an aggregate function must appear in the GROUP BY clause.

Wrong

```sql
SELECT POSITION,
        COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER PL
INNER JOIN COUNTRY CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY POSITION
```

Correct

```sql
SELECT POSITION,
        COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NumberOfPlayers
FROM PLAYER PL
INNER JOIN COUNTRY CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY POSITION,
        COUNTRY_NAME
```
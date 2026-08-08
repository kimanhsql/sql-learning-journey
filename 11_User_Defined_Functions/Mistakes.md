# Mistakes

## 1. Misunderstanding the `RETURNS` keyword

The **RETURNS** clause defines the output of the function, not the data type of its parameters.

Wrong

```sql
CREATE FUNCTION dbo.GetAge (@BirthDate DATE)
RETURNS DATE
AS
BEGIN
    RETURN DATEDIFF(YEAR, @BirthDate, GETDATE())
END
```

Correct

```sql
CREATE FUNCTION dbo.GetAge (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @BirthDate, GETDATE())
END
```

---

## 2. Confusing `RETURN` with `BEGIN ... END`

A scalar function usually uses **BEGIN ... END** and **RETURN** to return a single value.

An inline table-valued function uses **RETURN (...)** without BEGIN ... END.

Wrong

```sql
CREATE FUNCTION dbo.GetPlayersByCountry (@CountryID INT)
RETURNS TABLE
AS
BEGIN
    SELECT PLAYER_NAME
    FROM PLAYER
    WHERE COUNTRY_ID = @CountryID
END
```

Correct

```sql
CREATE FUNCTION dbo.GetPlayersByCountry (@CountryID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT PLAYER_NAME
    FROM PLAYER
    WHERE COUNTRY_ID = @CountryID
)
```
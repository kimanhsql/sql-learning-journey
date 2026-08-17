# Mistakes

## 1. Using FROM with GETDATE()

GETDATE() returns the current date and time directly, so it does not need a FROM clause.

Wrong

```sql
SELECT GETDATE()
FROM PLAYERS
```

Correct

```sql
SELECT GETDATE()
```

---

## Using AS outside CAST()

AS must be written inside the CAST() function.

Wrong

```sql
SELECT CAST(JERSEY_NUMBER) AS VARCHAR(10)
FROM PLAYERS
```

Correct

```sql
SELECT CAST(JERSEY_NUMBER AS VARCHAR(10))
FROM PLAYERS
```
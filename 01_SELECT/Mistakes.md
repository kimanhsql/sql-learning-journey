# Mistakes

## 1. Forgetting `FROM`

Wrong

```sql
SELECT PLAYER_NAME
```

Correct

```sql
SELECT PLAYER_NAME
FROM PLAYERS
```

---

## 2. Misspelling Column Names

Wrong

```sql
SELECT PLAYER_NAMEE
FROM PLAYERS
```

Correct

```sql
SELECT PLAYER_NAME
FROM PLAYERS
```

---

## 3. Using SELECT * Unnecessarily

Avoid using `SELECT *` when only a few columns are required.
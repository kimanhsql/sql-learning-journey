# Mistakes

## Forgetting `FROM`

Wrong

```sql
SELECT HOTEN
```

Correct

```sql
SELECT HOTEN
FROM CAUTHU
```

---

## Misspelling Column Names

Wrong

```sql
SELECT HOTENN
FROM CAUTHU
```

---

## Using SELECT * Unnecessarily

Avoid using `SELECT *` when only a few columns are required.
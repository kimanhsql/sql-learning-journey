# Mistakes

## 1. Forgetting `FROM`

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

## 2. Misspelling Column Names

Wrong

```sql
SELECT HOTENN
FROM CAUTHU
```

---

## 3. Using SELECT * Unnecessarily

Avoid using `SELECT *` when only a few columns are required.
# Mistakes

## 1. Forgetting the `AS` keyword

A view must be created using the **AS** keyword followed by a **SELECT** statement.

Wrong

```sql
CREATE VIEW V_PLAYERS
SELECT PLAYER_NAME
FROM PLAYERS
```

Correct

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME
FROM PLAYERS
```

---

## 2. Using `ORDER BY` inside a view

**ORDER BY** is not allowed in a view unless it is used together with **TOP**, **OFFSET**, or **FOR XML**.

Wrong

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME
FROM PLAYERS
ORDER BY PLAYER_NAME
```

Correct

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME
FROM PLAYERS
```

Sort the result when querying the view.

```sql
SELECT *
FROM V_PLAYERS
ORDER BY PLAYER_NAME
```

---

## 3. Creating a view without a meaningful name

Choose a descriptive name so that the purpose of the view is easy to understand.

Wrong

```sql
CREATE VIEW V1
AS
SELECT *
FROM PLAYERS
```

Correct

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
```

---

## 4. Forgetting to alter a view when the query changes

If the view definition needs to be modified, use **ALTER VIEW** instead of creating another view with the same name.

Wrong

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME
FROM PLAYERS
```

Correct

```sql
ALTER VIEW V_PLAYERS
AS
SELECT PLAYER_NAME,
        POSITION
FROM PLAYERS
```

---

## 5. Selecting unnecessary columns

Only include the columns required by the view.

Wrong

```sql
CREATE VIEW V_PLAYERS
AS
SELECT *
FROM PLAYERS
```

Correct

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYERS
```

---

## 6. Forgetting that a view depends on the underlying table

A view displays data from the underlying table. If the table changes, the view reflects those changes automatically.

Wrong

Thinking that the view stores its own data.

Correct

Remember that a view only stores the SQL query, not the actual data.

---

## 7. Trying to insert or update data through a non-updatable view

Not every view supports **INSERT**, **UPDATE**, or **DELETE**. Views containing joins, aggregate functions, or **GROUP BY** are often not updatable.

Wrong

```sql
UPDATE V_PLAYERS_SUMMARY
SET TOTAL_PLAYER = 20
```

Correct

Update the underlying table instead, or use an updatable view.

---

## 8. Using `SELECT *` inside a view unnecessarily

Avoid using **SELECT *** because changes to the underlying table may affect the view unexpectedly.

Wrong

```sql
CREATE VIEW V_PLAYERS
AS
SELECT *
FROM PLAYERS
```

Correct

```sql
CREATE VIEW V_PLAYERS
AS
SELECT PLAYER_NAME,
        POSITION,
        JERSEY_NUMBER
FROM PLAYERS
```
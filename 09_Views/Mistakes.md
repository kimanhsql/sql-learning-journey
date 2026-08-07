# Mistakes

## Forgetting the `AS` keyword

A view must be created using the `AS` keyword followed by a `SELECT` statement.

Wrong

```sql
CREATE VIEW V_PLAYER
SELECT PLAYER_NAME
FROM PLAYER
```

Correct

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME
FROM PLAYER
```

---

## Using `ORDER BY` inside a view

`ORDER BY` is not allowed in a view unless it is used together with `TOP`, `OFFSET`, or `FOR XML`.

Wrong

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME
FROM PLAYER
ORDER BY PLAYER_NAME
```

Correct

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME
FROM PLAYER
```

Sort the result when querying the view.

```sql
SELECT *
FROM V_PLAYER
ORDER BY PLAYER_NAME
```

---

## Creating a view without a meaningful name

Choose a descriptive name so that the purpose of the view is easy to understand.

Wrong

```sql
CREATE VIEW V1
AS
SELECT *
FROM PLAYER
```

Correct

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
       JERSEY_NUMBER
FROM PLAYER
```

---

## Forgetting to alter a view when the query changes

If the view definition needs to be modified, use `ALTER VIEW` instead of creating another view with the same name.

Wrong

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME
FROM PLAYER
```

Correct

```sql
ALTER VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
       POSITION
FROM PLAYER
```

---

## Selecting unnecessary columns

Only include the columns required by the view.

Wrong

```sql
CREATE VIEW V_PLAYER
AS
SELECT *
FROM PLAYER
```

Correct

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
       JERSEY_NUMBER
FROM PLAYER
```

---

## Forgetting that a view depends on the underlying table

A view displays data from the underlying table. If the table changes, the view reflects those changes automatically.

Wrong

Thinking that the view stores its own data.

Correct

Remember that a view only stores the SQL query, not the actual data.

---

## Trying to insert or update data through a non-updatable view

Not every view supports `INSERT`, `UPDATE`, or `DELETE`. Views containing joins, aggregate functions, or `GROUP BY` are often not updatable.

Wrong

```sql
UPDATE V_PLAYER_SUMMARY
SET TOTAL_PLAYER = 20
```

Correct

Update the underlying table instead, or use an updatable view.

---

## Using `SELECT *` inside a view unnecessarily

Avoid using `SELECT *` because changes to the underlying table may affect the view unexpectedly.

Wrong

```sql
CREATE VIEW V_PLAYER
AS
SELECT *
FROM PLAYER
```

Correct

```sql
CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
       POSITION,
       JERSEY_NUMBER
FROM PLAYER
```
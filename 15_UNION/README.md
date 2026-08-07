# UNION

## Definition

`UNION` is a set operator used to combine the result sets of two or more `SELECT` statements into a single result set.

`UNION` removes duplicate rows from the final result.

`UNION ALL` combines result sets without removing duplicates.

---

## Characteristics

* `UNION` combines the results of multiple `SELECT` statements.
* Each `SELECT` statement must return the same number of columns.
* Corresponding columns must have compatible data types.
* The order of columns must match between the `SELECT` statements.
* `UNION` removes duplicate rows.
* `UNION ALL` keeps duplicate rows.
* `ORDER BY` is normally placed at the end of the complete UNION query.
* `UNION` does not combine columns horizontally. It combines result sets vertically.

---

## UNION vs UNION ALL

### UNION

Removes duplicate rows.

```sql
SELECT column_name
FROM table_a

UNION

SELECT column_name
FROM table_b;
```

### UNION ALL

Keeps duplicate rows.

```sql
SELECT column_name
FROM table_a

UNION ALL

SELECT column_name
FROM table_b;
```

`UNION ALL` is usually preferable when duplicate removal is not required because the database does not need to perform duplicate elimination.

---

## Requirements for UNION

The queries must have:

1. The same number of columns.
2. Compatible data types.
3. Corresponding columns in the same logical order.

Example:

```sql
SELECT PLAYER_NAME, POSITION
FROM PLAYER

UNION

SELECT COACH_NAME, POSITION
FROM COACH;
```

The first column represents a name in both result sets, and the second column represents a position.

---

## UNION vs JOIN

`JOIN` combines related data horizontally by matching rows between tables.

`UNION` combines compatible result sets vertically.

### JOIN

```text
Table A + Table B
        ↓
More columns
```

### UNION

```text
Result A
   ↓
Result B
   ↓
One combined result
```

---

## When to Use UNION

Use `UNION` when:

* Different queries return the same type of information.
* Data comes from different tables but has a compatible structure.
* You need to combine multiple result sets.
* Duplicate rows should be removed.

Use `UNION ALL` when:

* Duplicate rows are meaningful.
* You want to keep every returned row.
* Duplicate removal is unnecessary.

---

## Learning Outcome

After completing this module, I will be able to combine compatible result sets using `UNION` and `UNION ALL`.

I will also understand the differences between `UNION`, `UNION ALL`, and `JOIN`, and choose the appropriate set operation for different query requirements.
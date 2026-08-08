# HAVING Clause

## Definition

The `HAVING` clause is used to filter groups after the data has been grouped by the `GROUP BY` clause.

It is commonly used with aggregate functions to return only the groups that satisfy specified conditions.

---

## Characteristics

- Filters grouped data instead of individual rows.
- Is commonly used with aggregate functions such as `COUNT()`, `SUM()`,
`AVG()`, `MIN()`, and `MAX()`.
- Is evaluated after the `GROUP BY` clause.
- Can be combined with `WHERE` and `ORDER BY`.
- Cannot be used without `GROUP BY` when filtering grouped results.

---

## Topics

- Basic HAVING
- HAVING with COUNT
- HAVING with SUM
- HAVING with AVG
- HAVING with MIN and MAX
- HAVING with WHERE
- HAVING with ORDER BY

---

## When to Use

Use the `HAVING` clause whenever you need to:

- Filter grouped data.
- Apply conditions to aggregate functions.
- Display only groups that satisfy specific requirements.
- Generate summarized reports with filtering conditions.

---

## Learning Outcome

After completing this module, I will be able to filter grouped data by using the `HAVING` clause together with aggregate functions and combine it effectively with `GROUP BY`, `WHERE`, and `ORDER BY`.
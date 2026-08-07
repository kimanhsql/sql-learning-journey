# Subqueries

## Definition

A subquery is a SQL query nested inside another SQL query.

It returns a result that is used by the outer query to retrieve, filter, or compare data.

---

## Characteristics

- Is enclosed in parentheses.
- Is evaluated before the outer query.
- Can return a single value, multiple values, or an entire result set.
- Can be nested inside another subquery.
- Can be used with comparison, membership, and existence operators.
- Can appear in `SELECT`, `FROM`, and `WHERE` clauses.

---

## Operators Used with Subqueries

### Comparison Operators

- `=`
- `>`
- `<`
- `>=`
- `<=`
- `<>`

### Membership Operator

- `IN`

### Existence Operator

- `EXISTS`

### Quantified Comparison Operators

- `ANY`
- `ALL`

---

## Topics

- Single-row Subqueries
- Multiple-row Subqueries
- Subqueries with `IN`
- Subqueries with `EXISTS`
- Correlated Subqueries
- Subqueries in `SELECT`
- Subqueries in `FROM`
- Subqueries in `WHERE`

---

## When to Use

Use subqueries whenever you need to:

- Use the result of one query inside another query.
- Compare values returned from another query.
- Filter data based on aggregated results.
- Retrieve data that depends on another query.
- Simplify complex SQL statements.

---

## Learning Outcome

After completing this module, I will be able to write and understand different types of subqueries, choose the appropriate operator, and apply subqueries effectively to solve complex SQL problems.
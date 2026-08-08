# User-Defined Functions

## Definition

A user-defined function (UDF) is a function created by the user in SQL Server.

Unlike built-in functions, user-defined functions are designed to solve specific business or application requirements.

---

## Characteristics

- Is created by the user.
- Always returns a value or a table.
- Can accept zero, one, or multiple parameters.
- Can be reused in multiple SQL statements.
- Can contain `SELECT` statements and use clauses such as `WHERE` and `JOIN`.
- Cannot modify database data directly.

---

## Types

- Scalar Functions
- Table-Valued Functions
  + Inline Table-Valued Functions
  + Multi-Statement Table-Valued Functions

---

## Topics

- Scalar Functions
- Table-Valued Functions
- Creating a Function
- Altering a Function
- Dropping a Function
- Functions with Parameters

---

## When to Use

Use a user-defined function whenever you need to:

- Reuse business logic.
- Simplify complex SQL queries.
- Avoid writing the same SQL logic repeatedly.
- Return calculated values.
- Return reusable result sets.

---

## Advantages

- Improves code reusability.
- Reduces repetitive SQL code.
- Makes queries easier to read and maintain.
- Encapsulates business logic.
- Can be reused in multiple queries.

---

## Disadvantages

- May reduce query performance if used incorrectly.
- Cannot perform data modification operations such as `INSERT`, `UPDATE`, or `DELETE`.
- Has more restrictions than stored procedures.

---

## Learning Outcome

After completing this module, I will be able to create, modify, and use user-defined functions to encapsulate reusable logic, simplify SQL queries, and improve code organization in SQL Server.

I will also understand the differences between scalar functions and table-valued functions and know when to use each type.
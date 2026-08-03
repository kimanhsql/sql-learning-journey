# Stored Procedures

## Definition

A stored procedure is a precompiled SQL program that is stored in the database and can be executed repeatedly.

It is designed to perform one or more database operations, such as retrieving, inserting, updating, or deleting data.

---

## Characteristics

- Is stored in the database.
- Can accept zero, one, or multiple parameters.
- Can return result sets, output parameters, or no value.
- Can execute multiple SQL statements in a single procedure.
- Can contain control-of-flow statements such as `IF`, `WHILE`, and `TRY...CATCH`.
- Can modify database data.

---

## Topics

- Creating a Stored Procedure
- Executing a Stored Procedure
- Stored Procedures with Parameters
- Altering a Stored Procedure
- Dropping a Stored Procedure

---

## When to Use

Use a stored procedure whenever you need to:

- Reuse SQL logic.
- Perform multiple database operations in a single execution.
- Encapsulate business logic.
- Reduce repetitive SQL code.
- Improve application maintainability.

---

## Advantages

- Improves code reusability.
- Reduces repetitive SQL statements.
- Simplifies application development.
- Encapsulates business logic.
- Can improve security by limiting direct access to tables.

---

## Disadvantages

- May become difficult to maintain if it is too large.
- Debugging can be more complicated than debugging individual SQL statements.
- Vendor-specific syntax may reduce portability between database systems.

---

## Learning Outcome

After completing this module, I will be able to create, execute, modify, and manage stored procedures in SQL Server.

I will also understand when to use stored procedures instead of user-defined functions and apply them to simplify SQL code and improve code reusability.
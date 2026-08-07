# Triggers

## Definition

A trigger is a special type of stored program that executes automatically when a specified database event occurs.

A trigger is associated with a table or view and is fired when an `INSERT`, `UPDATE`, or `DELETE` statement is executed.

---

## Characteristics

- Executes automatically.
- Is associated with a table or view.
- Is fired by `INSERT`, `UPDATE`, or `DELETE` statements.
- Can access the `inserted` and `deleted` virtual tables.
- Cannot be executed directly by using `EXEC`.

---

## Topics

- AFTER Trigger
- INSTEAD OF Trigger
- Creating a Trigger
- Altering a Trigger
- Dropping a Trigger
- Using INSERTED and DELETED Tables

---

## When to Use

Use a trigger whenever you need to:

- Enforce business rules.
- Validate data automatically.
- Record audit information.
- Prevent invalid database operations.
- Synchronize related tables automatically.

---

## Advantages

- Executes automatically.
- Helps enforce business rules.
- Keeps data consistent.
- Can automatically record changes.
- Requires no manual execution.

---

## Disadvantages

- Can be difficult to debug.
- May reduce database performance if overused.
- Hidden execution makes maintenance more difficult.
- Multiple triggers can make program flow harder to understand.

---

## Learning Outcome

After completing this module, I will be able to create and manage triggers in SQL Server.

I will understand the differences between triggers, user-defined functions, and stored procedures, and know when each should be used.
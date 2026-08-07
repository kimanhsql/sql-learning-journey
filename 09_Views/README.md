# Views

## Definition

A view is a virtual table created from the result of a SQL query.

It displays data from one or more tables without storing the data physically.

---

## Characteristics

- Does not store data physically.
- Is created by using the `CREATE VIEW` statement.
- Automatically reflects changes made to the underlying tables.
- Can simplify complex queries.
- Can restrict access to specific columns or rows.
- Can be queried like a regular table.

---

## Topics

- Creating a View
- Querying a View
- Updating a View
- Altering a View
- Dropping a View

---

## When to Use

Use a view whenever you need to:

- Simplify complex queries.
- Reuse frequently used queries.
- Hide unnecessary columns from users.
- Restrict access to sensitive data.
- Present data from multiple tables as a single virtual table.

---

## Advantages

- Simplifies SQL queries.
- Improves code reusability.
- Enhances data security.
- Provides a consistent way to access data.
- Hides the complexity of underlying tables.

---

## Disadvantages

- Does not improve query performance in most cases.
- Depends on the underlying tables.
- Some views cannot be updated.
- Complex views may be difficult to maintain.

---

## Learning Outcome

After completing this module, I will be able to create, modify, and manage views effectively in SQL Server.

I will understand when to use views to simplify queries, improve security, and provide reusable virtual tables for database applications.
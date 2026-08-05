# Transactions

## Definition

A transaction is a unit of work that groups one or more database operations into a single atomic unit.

A transaction ensures that a group of related operations is treated as one logical operation. The changes can either be permanently saved or rolled back.

Transactions are closely related to the **ACID properties** of database systems:

- Atomicity
- Consistency
- Isolation
- Durability

---

## Characteristics

- A transaction can contain one or more SQL operations.
- A transaction can be committed using `COMMIT`.
- A transaction can be undone using `ROLLBACK`.
- A transaction can use `SAVE TRANSACTION` to create a savepoint.
- Transactions help maintain data consistency and integrity.
- Transactions are commonly used with `INSERT`, `UPDATE`, and `DELETE` operations.
- If an error occurs, a transaction can be rolled back to prevent unwanted partial changes.

---

## Topics

- Transactions
- ACID Properties
- BEGIN TRANSACTION
- COMMIT
- ROLLBACK
- SAVE TRANSACTION
- Savepoints
- Transactions with INSERT
- Transactions with UPDATE
- Transactions with DELETE
- TRY...CATCH with Transactions
- Transaction Error Handling

---

## When to Use

Transactions are useful when multiple database operations must be treated as a single unit of work.

They should be considered when:

- Multiple operations must succeed together.
- A failure in one operation should undo previous operations.
- Data consistency must be maintained across multiple changes.
- An operation involves related `INSERT`, `UPDATE`, or `DELETE` statements.
- A partial update could leave the database in an inconsistent state.

For example, when updating related data in multiple tables, a transaction can ensure that either all required changes are completed or the changes are rolled back.

---

## Learning Outcome

After completing this module, I will understand how transactions work and how they are related to the ACID properties.

I will be able to use `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`, and `SAVE TRANSACTION` appropriately.

I will also understand when transactions should be used and how they can help maintain data consistency and integrity in practical database scenarios.
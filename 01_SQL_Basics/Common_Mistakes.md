# Common Mistakes

## Forgetting GO

Some SQL statements require `GO` to separate execution batches.

---

## Forgetting PRIMARY KEY

Every table should have a primary key whenever possible.

---

## Using VARCHAR instead of NVARCHAR

Use NVARCHAR when storing Unicode characters such as Vietnamese.
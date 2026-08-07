# Indexes

## Definition

An index is a database structure used to help SQL Server find and retrieve data more efficiently.

An index is not a table. It is created on one or more columns of a table and stores index key values together with information that helps SQL Server locate the corresponding rows.

Indexes can improve query performance when they are designed appropriately.

However, indexes are not always beneficial. Poorly designed indexes, too many indexes, or missing indexes can cause database performance problems.

---

## Characteristics

- An index is associated with a table and is created on one or more columns.
- An index is used to help SQL Server find data efficiently.
- An index can contain the values of its indexed columns.
- An index does not replace the original table.
- SQL Server can use indexes when executing queries.
- Different types of indexes organize and access data differently.
- Indexes can improve read performance for suitable queries.
- Indexes require additional storage.
- Indexes must be maintained when data is inserted, updated, or deleted.
- Adding more indexes does not always improve performance.
- A poorly designed index may provide little or no performance benefit.
- Index design should balance query performance with index maintenance cost.

---

## Topics

- Index Basics
- Creating Indexes
- Clustered Indexes
- Nonclustered Indexes
- Unique Indexes
- Composite Indexes
- Included Columns
- Index Keys
- Index Seek
- Index Scan
- Index Maintenance
- Index Performance

---

## When to Use Indexes

Indexes are useful when queries frequently search, filter, sort, or join data using specific columns.

Indexes are commonly considered for columns used in:

- `WHERE` conditions
- `JOIN` conditions
- `ORDER BY`
- `GROUP BY`

Indexes should be designed based on actual query patterns and workload rather than being added to every column.

---

## Advantages

- Improve query performance for suitable queries.
- Help SQL Server locate rows more efficiently.
- Can reduce the amount of data SQL Server needs to examine.
- Can improve the performance of frequently executed queries.
- Can support efficient searching, filtering, joining, and sorting.

---

## Disadvantages

- Indexes require additional storage.
- Indexes must be maintained when data changes.
- Too many indexes can increase the cost of `INSERT`, `UPDATE`, and `DELETE` operations.
- Poorly designed indexes may not improve query performance.
- Unnecessary indexes can increase database maintenance overhead.
- Indexes can sometimes make a query slower when SQL Server chooses an inefficient execution strategy or when maintaining the index adds more cost than the performance benefit.

---

## Learning Outcome

After completing this module, I will understand what indexes are, how they help SQL Server retrieve data, and why index design is important for database performance.

I will understand the differences between clustered and nonclustered indexes and know how indexes affect both query performance and data modification operations.

I will also be able to create and use different types of indexes and understand basic concepts such as index keys, included columns, index seeks, and index scans.

Finally, I will understand that effective index design requires balancing query performance, storage requirements, and index maintenance costs.
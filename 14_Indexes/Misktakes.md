# Mistakes

## Including a key column again in INCLUDE

A column that is already an index key does not need to be added again to the `INCLUDE` clause.

The `INCLUDE` clause is used for additional non-key columns that are needed by a query.

Wrong

```sql
CREATE INDEX IX_PLAYER_PLAYER_NAME
ON PLAYER (PLAYER_NAME)
INCLUDE (PLAYER_ID, PLAYER_NAME)
```

`PLAYER_NAME` is already an index key, so including it again is unnecessary.

Correct

```sql
CREATE INDEX IX_PLAYER_PLAYER_NAME
ON PLAYER (PLAYER_NAME)
```

---

## Using a non-unique index when a unique index is required

`CREATE INDEX` creates a non-unique index by default.

When the requirement is to prevent duplicate values, `CREATE UNIQUE INDEX` must be used.

Wrong

```sql
CREATE INDEX IX_PLAYER_ADDRESS
ON PLAYER (ADDRESS)
```

Correct

```sql
CREATE UNIQUE INDEX UX_PLAYER_ADDRESS
ON PLAYER (ADDRESS)
```

A unique index prevents duplicate values in the indexed column.

---

## Confusing index key columns with included columns

Index key columns are used to define the index order and support searching, filtering, and sorting.

Included columns are additional non-key columns stored with the index to help cover a query.

Wrong

```sql
CREATE INDEX IX_CLUB_PLAYER_NAME
ON PLAYER (PLAYER_NAME, CLUB_ID)
INCLUDE (CLUB_ID, PLAYER_NAME)
```

Correct

```sql
CREATE NONCLUSTERED INDEX IX_PLAYER_CLUB_ID
ON PLAYER (CLUB_ID)
INCLUDE (PLAYER_NAME)
```

`CLUB_ID` is the index key because the requirement is to create the index on `CLUB_ID`.

`PLAYER_NAME` is an included column because it is only required as additional data.

---

## Forgetting to specify the required sort order

When an exercise requires a specific sort order for index keys, the `ASC` or `DESC` direction should be explicitly specified.

Wrong

```sql
CREATE INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER (CLUB_ID, JERSEY_NUMBER)
```

Correct

```sql
CREATE INDEX IX_PLAYER_CLUB_JERSEY_DESC
ON PLAYER (CLUB_ID ASC, JERSEY_NUMBER DESC)
```

The index key order and sort direction should match the requirements of the query.

---

## Using ALTER INDEX with a column list

`ALTER INDEX` is used to modify or maintain an existing index. It does not define the indexed columns.

Wrong

```sql
ALTER INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER (PLAYER_ID)
```

Correct

```sql
ALTER INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER
REBUILD
```

The indexed columns are defined when the index is created. `ALTER INDEX` is used for operations such as `REBUILD`, `REORGANIZE`, and disabling or enabling an index.
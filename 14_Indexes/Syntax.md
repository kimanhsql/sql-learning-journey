# Syntax

-- 1. CREATE INDEX

```sql
CREATE INDEX index_name
ON table_name (column_name)
```


-- 2. CREATE UNIQUE INDEX

```sql
CREATE UNIQUE INDEX index_name
ON table_name (column_name)
```


-- 3. CREATE CLUSTERED INDEX

```sql
CREATE CLUSTERED INDEX index_name
ON table_name (column_name)
```


-- 4. CREATE NONCLUSTERED INDEX

```sql
CREATE NONCLUSTERED INDEX index_name
ON table_name (column_name)
```


-- 5. CREATE INDEX ON MULTIPLE COLUMNS

```sql
CREATE INDEX index_name
ON table_name (column1, column2)
```


-- 6. CREATE INDEX WITH INCLUDED COLUMNS

```sql
CREATE INDEX index_name
ON table_name (key_column)
INCLUDE (included_column)
```


-- 7. ALTER INDEX

```sql
ALTER INDEX index_name
ON table_name
REBUILD
```


-- 8. DROP INDEX

```sql
DROP INDEX index_name
ON table_name
```
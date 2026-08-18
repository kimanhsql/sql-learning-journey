/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating a INDEX, ask yourself:

1. Which column is frequently searched or filtered?
2. Should I create a single-column index?
3. Should the index be unique?
4. Should the index be clustered or nonclustered?
5. Does an index already exist for this column?
6. Do I need to remove an existing index?
7. Will the index improve the queries that use this column?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- An index can improve the performance of queries that search,
  filter, or retrieve data from a table.
- A single-column index contains one key column.
- A UNIQUE index prevents duplicate values in the indexed
  key column.
- A clustered index determines the physical order of data
  rows in a table.
- A nonclustered index is a separate structure that points
  to the corresponding data rows.
- A table can have only one clustered index.
- A table can have multiple nonclustered indexes.
- Indexes can improve read performance but can add overhead
  to INSERT, UPDATE, and DELETE operations.
- DROP INDEX can be used to remove an existing index.
- Avoid creating unnecessary indexes because each index
  requires storage and maintenance.

Analyze the query before creating an index.
Test the query performance after creating the index.
*/ 


-- Exercise 1
-- Create a nonclustered index on PLAYER_NAME.

CREATE NONCLUSTERED INDEX IX_PLAYERS_PLAYER_NAME
ON PLAYERS (PLAYER_NAME)

GO


-- Exercise 2
-- Create a nonclustered index on POSITION.

CREATE NONCLUSTERED INDEX IX_PLAYERS_POSITION
ON PLAYERS (POSITION)

GO


-- Exercise 3
-- Create an index on CLUB_ID.

CREATE INDEX IX_CLUBS_CLUB_ID
ON CLUBS (CLUB_ID)

GO


-- Exercise 4
-- Create an index on JERSEY_NUMBER.

CREATE INDEX IX_PLAYERS_JERSEY_NUMBER
ON PLAYERS (JERSEY_NUMBER)

GO


-- Exercise 5
-- Create an index on COUNTRY_ID.

CREATE INDEX IX_COUNTRIES_COUNTRY_ID
ON COUNTRIES (COUNTRY_ID)

GO


-- Exercise 6
-- Create a unique index on a column that
-- should not contain duplicate values.

CREATE UNIQUE INDEX UX_PLAYERS_ADDRESS
ON PLAYERS (ADDRESS)

GO


-- Exercise 7
-- Create a composite index using CLUB_ID and JERSEY_NUMBER.

CREATE INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS (CLUB_ID, JERSEY_NUMBER)

GO


-- Exercise 8
-- Create a nonclustered index on CLUB_ID
-- with PLAYER_NAME as an included column.

CREATE NONCLUSTERED INDEX IX_PLAYERS_CLUB_ID
ON PLAYERS (CLUB_ID)
INCLUDE (PLAYER_NAME)

GO


-- Exercise 9
-- Rebuild an existing index.

ALTER INDEX IX_PLAYERS_CLUB_ID
ON PLAYERS
REBUILD

GO


-- Exercise 10
-- Drop an existing index.

DROP INDEX IX_PLAYERS_CLUB_ID
ON PLAYERS

GO
/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating an INDEX, ask yourself:

1. Which columns are used together in the query?
2. Which column should appear first in a composite index?
3. Which columns should be index keys?
4. Which columns should be included columns?
5. Does the index support the WHERE, JOIN, ORDER BY, or
   GROUP BY operations?
6. Could the index be unnecessary or redundant?
7. Could the index negatively affect INSERT, UPDATE, or
   DELETE performance?
8. What type of index is appropriate for the situation?
9. Can I verify the index effectiveness with the execution plan?
10. Can I simplify the index design without reducing
    query performance?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- A composite index contains multiple key columns.
- The column order in a composite index affects how the
  index can be used by SQL Server.
- Index key columns are used to organize and search the
  indexed data.
- Included columns can store additional data without
  becoming part of the index key.
- An index should support the queries that actually need
  improved performance.
- Avoid creating indexes that duplicate or unnecessarily
  overlap with existing indexes.
- Indexes can improve read performance but may increase
  the cost of INSERT, UPDATE, and DELETE operations.
- Different index types are designed for different
  workloads and data access patterns.
- The execution plan can help determine whether an index
  is being used effectively.
- Index design should be based on actual query patterns,
  not simply on adding indexes to frequently used columns.

Analyze the query and existing indexes before creating
a new index.
Test the index and verify its effect on query performance.
*/


-- Exercise 1
-- Create a composite index for queries that
-- filter players by CLUB_ID and JERSEY_NUMBER.

CREATE INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS (CLUB_ID, JERSEY_NUMBER)

GO


-- Exercise 2
-- Create a composite index using COUNTRY_ID and POSITION.

CREATE INDEX IX_PLAYERS_COUNTRIES_POSITION
ON PLAYERS (COUNTRY_ID, POSITION)

GO


-- Exercise 3
-- Create a nonclustered index on CLUB_ID
-- and include PLAYER_NAME, POSITION, and JERSEY_NUMBER.

CREATE NONCLUSTERED INDEX IX_PLAYERS_CLUBS
ON PLAYERS (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Exercise 4
-- Create a nonclustered index on POSITION
-- and include PLAYER_NAME and JERSEY_NUMBER.

CREATE NONCLUSTERED INDEX IX_PLAYERS_POSITION
ON PLAYERS (POSITION)
INCLUDE (PLAYER_NAME, JERSEY_NUMBER)

GO


-- Exercise 5
-- Create a composite index using CLUB_ID and JERSEY_NUMBER.
-- Define a specific sort order for the index keys.

CREATE INDEX IX_PLAYERS_CLUBS_JERSEY_DESC
ON PLAYERS (CLUB_ID ASC, JERSEY_NUMBER DESC)

GO


-- Exercise 6
-- Create an index designed for a query that filters
-- by COUNTRY_ID and sorts the results by PLAYER_NAME.

CREATE INDEX IX_PLAYERS_COUNTRIES_NAME
ON PLAYERS (COUNTRY_ID, PLAYER_NAME)

GO


-- Exercise 7
-- Create an index designed for a query that filters
-- by CLUB_ID and retrieves PLAYER_NAME, POSITION, and JERSEY_NUMBER.

CREATE INDEX IX_PLAYERS_CLUBS_COVERING
ON PLAYERS (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Exercise 8
-- Create a clustered index on a suitable column.
-- Consider the characteristics of a clustered index
-- before choosing the column.

CREATE CLUSTERED INDEX IX_COACHES_COACH_ID
ON COACHES (COACH_ID)

GO


-- Exercise 9
-- Inspect the indexes currently defined on PLAYERS.

EXEC sp_helpindex 'PLAYERS'

GO


-- Exercise 10
-- Modify an existing index using ALTER INDEX.
-- Choose an appropriate index maintenance operation.

ALTER INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS
REBUILD

GO
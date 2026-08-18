/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before creating a INDEX, analyze the query
requirements carefully.

Ask yourself:

1. Which columns are used for filtering?
2. Which columns are used for sorting?
3. Which columns are used for JOIN conditions?
4. Are multiple columns used together?
5. Which columns should be index keys?
6. Which columns should be included columns?
7. What should the column order be in a composite index?
8. Is the index actually necessary?
9. Does a similar or redundant index already exist?
10. Could the index introduce unnecessary maintenance
    overhead?
11. How will the index affect INSERT, UPDATE, and DELETE
    operations?
12. Can I verify the index effectiveness with the execution plan?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Index design should be based on actual query requirements.
- Columns frequently used for filtering, sorting, or JOIN
  conditions may benefit from indexing.
- Multiple columns can be combined into a composite index.
- The order of key columns in a composite index affects how
  SQL Server can use the index.
- Included columns can provide additional data without
  becoming part of the index key.
- An index should support the query without adding
  unnecessary complexity or maintenance cost.
- Avoid creating indexes that duplicate or unnecessarily
  overlap with existing indexes.
- Indexes can improve read performance but can increase the
  cost of INSERT, UPDATE, and DELETE operations.
- The execution plan can help determine whether the index
  is being used effectively.
- Always consider the trade-off between query performance,
  storage, and maintenance overhead.

Analyze the query before designing the index.
Create the index based on the actual access pattern.
Test the query and verify the effect of the index.
*/


-- Challenge 1
-- A query frequently searches players by PLAYER_NAME.
-- Design an appropriate index for this query.

CREATE INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS (CLUB_ID, JERSEY_NUMBER)

GO


-- Challenge 2
-- A query frequently retrieves players from a specific club
-- and filters them by JERSEY_NUMBER.
-- Design an appropriate index.

CREATE INDEX IX_PLAYERS_COUNTRIES_POSITION
ON PLAYERS (COUNTRY_ID, POSITION)

GO


-- Challenge 3
-- A query filters players by COUNTRY_ID
-- and returns PLAYER_NAME, POSITION, and JERSEY_NUMBER.
-- Design an index that can efficiently support this query.

CREATE NONCLUSTERED INDEX IX_PLAYERS_CLUBS
ON PLAYERS (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Challenge 4
-- A query filters players by CLUB_ID
-- and sorts the results by JERSEY_NUMBER.
-- Design an appropriate index.

CREATE NONCLUSTERED INDEX IX_PLAYERS_POSITION
ON PLAYERS (POSITION)
INCLUDE (PLAYER_NAME, JERSEY_NUMBER)

GO


-- Challenge 5
-- A query frequently searches players by CLUB_ID and JERSEY_NUMBER.
-- The query also returns PLAYER_NAME and POSITION.
-- Design an index that can support this query efficiently.

CREATE INDEX IX_PLAYERS_CLUBS_JERSEY_DESC
ON PLAYERS (CLUB_ID ASC, JERSEY_NUMBER DESC)

GO


-- Challenge 6
-- A table already contains several indexes.
-- Inspect the existing indexes on PLAYERS
-- and identify the indexes currently defined.

CREATE INDEX IX_PLAYERS_COUNTRY_NAME
ON PLAYERS (COUNTRY_ID, PLAYER_NAME)

GO


-- Challenge 7
-- An existing index is no longer needed.
-- Remove the index from PLAYERS.

CREATE INDEX IX_PLAYERS_CLUBS_COVERING
ON PLAYERS (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Challenge 8
-- An existing index has become fragmented.
-- Perform an appropriate index maintenance operation.

CREATE CLUSTERED INDEX IX_COACHES_COACH_ID
ON COACHES (COACH_ID)

GO


-- Challenge 9
-- Design an index for a query that filters by POSITION
-- and COUNTRY_ID while retrieving PLAYER_NAME.

EXEC sp_helpindex 'PLAYERS'

GO


-- Challenge 10
-- Analyze the indexes created for PLAYERS.
-- Identify one index that may be unnecessary
-- or redundant and explain why.

ALTER INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS
REORGANIZE

GO
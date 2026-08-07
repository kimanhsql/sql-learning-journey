/*
Before writing SQL, ask yourself:

- Which columns are used together in the query?
- Which column should appear first in a composite index?
- Which columns should be index keys?
- Which columns should be included columns?
- Could the index be unnecessary or redundant?
- What type of index is appropriate for the situation?
*/


-- Exercise 1
-- Create a composite index for queries that filter players by CLUB_ID and JERSEY_NUMBER.

CREATE INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER (CLUB_ID, JERSEY_NUMBER)

GO


-- Exercise 2
-- Create a composite index using COUNTRY_ID and POSITION.

CREATE INDEX IX_PLAYER_COUNTRY_POSITION
ON PLAYER (COUNTRY_ID, POSITION)

GO


-- Exercise 3
-- Create a nonclustered index on CLUB_ID and include PLAYER_NAME, POSITION, and JERSEY_NUMBER.

CREATE NONCLUSTERED INDEX IX_PLAYER_CLUB
ON PLAYER (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Exercise 4
-- Create a nonclustered index on POSITION and include PLAYER_NAME and JERSEY_NUMBER.

CREATE NONCLUSTERED INDEX IX_PLAYER_POSITION
ON PLAYER (POSITION)
INCLUDE (PLAYER_NAME, JERSEY_NUMBER)

GO


-- Exercise 5
-- Create a composite index using CLUB_ID and JERSEY_NUMBER.
-- Define a specific sort order for the index keys.

CREATE INDEX IX_PLAYER_CLUB_JERSEY_DESC
ON PLAYER (CLUB_ID ASC, JERSEY_NUMBER DESC)

GO


-- Exercise 6
-- Create an index designed for a query that filters
-- by COUNTRY_ID and sorts the results by PLAYER_NAME.

CREATE INDEX IX_PLAYER_COUNTRY_NAME
ON PLAYER (COUNTRY_ID, PLAYER_NAME)

GO


-- Exercise 7
-- Create an index designed for a query that filters
-- by CLUB_ID and retrieves PLAYER_NAME, POSITION, and JERSEY_NUMBER.

CREATE INDEX IX_PLAYER_CLUB_COVERING
ON PLAYER (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Exercise 8
-- Create a clustered index on a suitable column.
-- Consider the characteristics of a clustered index before choosing the column.

CREATE CLUSTERED INDEX IX_COACH_COACH_ID
ON COACH (COACH_ID)

GO


-- Exercise 9
-- Inspect the indexes currently defined on PLAYER.

EXEC sp_helpindex 'PLAYER'

GO


-- Exercise 10
-- Modify an existing index using ALTER INDEX.
-- Choose an appropriate index maintenance operation.

ALTER INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER
REBUILD

GO
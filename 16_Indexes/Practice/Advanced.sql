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
-- Create a composite index for queries that filter players
-- by CLUB_ID and JERSEY_NUMBER.

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
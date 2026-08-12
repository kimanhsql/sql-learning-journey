/*
Before writing SQL, analyze the query requirements carefully.

Ask yourself:

- Which columns are used for filtering?
- Which columns are used for sorting?
- Are multiple columns used together?
- Which columns should be index keys?
- Which columns should be included?
- Is the index actually necessary?
- Could the index introduce unnecessary maintenance overhead?
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
-- Identify one index that may be unnecessary or redundant and explain why.

ALTER INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS
REORGANIZE

GO
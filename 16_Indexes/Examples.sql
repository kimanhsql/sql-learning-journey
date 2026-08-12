-- Example 1
-- Create an index on a column frequently used for filtering.

CREATE INDEX IX_PLAYERS_POSITION
ON PLAYERS (POSITION)

GO


-- Example 2
-- Create an index on a column frequently used for searching.

CREATE INDEX IX_PLAYERS_PLAYER_NAME
ON PLAYERS (PLAYER_NAME)

GO


-- Example 3
-- Create an index on a column frequently used in JOIN conditions.

CREATE INDEX IX_PLAYERS_CLUB_ID
ON PLAYERS (CLUB_ID)

GO


-- Example 4
-- Create a composite index for queries that
-- filter by club and jersey number.

CREATE INDEX IX_PLAYERS_CLUBS_JERSEY
ON PLAYERS (CLUB_ID, JERSEY_NUMBER)

GO


-- Example 5
-- Create a unique index to prevent duplicate values.

CREATE UNIQUE INDEX UX_PLAYERS_JERSEY_NUMBER
ON PLAYERS (JERSEY_NUMBER)

GO


-- Example 6
-- Create a nonclustered index with included columns.

CREATE INDEX IX_PLAYERS_CLUBS
ON PLAYERS (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Example 7
-- Create a clustered index on a column.

CREATE CLUSTERED INDEX IX_PLAYERS_PLAYER_ID
ON PLAYERS (PLAYER_ID)

GO


-- Example 8
-- Rebuild an existing index.

ALTER INDEX IX_PLAYERS_POSITION
ON PLAYERS
REBUILD

GO


-- Example 9
-- Reorganize an existing index.

ALTER INDEX IX_PLAYERS_POSITION
ON PLAYERS
REORGANIZE

GO


-- Example 10
-- Drop an existing index.

DROP INDEX IX_PLAYERS_POSITION
ON PLAYERS

GO
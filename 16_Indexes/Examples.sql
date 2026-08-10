-- Example 1
-- Create an index on a column frequently used for filtering.

CREATE INDEX IX_PLAYER_POSITION
ON PLAYER (POSITION)

GO


-- Example 2
-- Create an index on a column frequently used for searching.

CREATE INDEX IX_PLAYER_PLAYER_NAME
ON PLAYER (PLAYER_NAME)

GO


-- Example 3
-- Create an index on a column frequently used in JOIN conditions.

CREATE INDEX IX_PLAYER_CLUB_ID
ON PLAYER (CLUB_ID)

GO


-- Example 4
-- Create a composite index for queries that
-- filter by club and jersey number.

CREATE INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER (CLUB_ID, JERSEY_NUMBER)

GO


-- Example 5
-- Create a unique index to prevent duplicate values.

CREATE UNIQUE INDEX UX_PLAYER_JERSEY_NUMBER
ON PLAYER (JERSEY_NUMBER)

GO


-- Example 6
-- Create a nonclustered index with included columns.

CREATE INDEX IX_PLAYER_CLUB
ON PLAYER (CLUB_ID)
INCLUDE (PLAYER_NAME, POSITION, JERSEY_NUMBER)

GO


-- Example 7
-- Create a clustered index on a column.

CREATE CLUSTERED INDEX IX_PLAYER_PLAYER_ID
ON PLAYER (PLAYER_ID)

GO


-- Example 8
-- Rebuild an existing index.

ALTER INDEX IX_PLAYER_POSITION
ON PLAYER
REBUILD

GO


-- Example 9
-- Reorganize an existing index.

ALTER INDEX IX_PLAYER_POSITION
ON PLAYER
REORGANIZE

GO


-- Example 10
-- Drop an existing index.

DROP INDEX IX_PLAYER_POSITION
ON PLAYER

GO
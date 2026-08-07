/*
Before writing SQL, ask yourself:

- Which column is frequently searched or filtered?
- Should I create a single-column index?
- Should the index be unique?
- Should the index be clustered or nonclustered?
- Do I need to remove an existing index?
*/


-- Exercise 1
-- Create a nonclustered index on PLAYER_NAME.

CREATE NONCLUSTERED INDEX IX_PLAYER_PLAYER_NAME
ON PLAYER (PLAYER_NAME)

GO


-- Exercise 2
-- Create a nonclustered index on POSITION.

CREATE NONCLUSTERED INDEX IX_PLAYER_POSITION
ON PLAYER (POSITION)

GO


-- Exercise 3
-- Create an index on CLUB_ID.

CREATE INDEX IX_CLUB_CLUB_ID
ON CLUB (CLUB_ID)

GO


-- Exercise 4
-- Create an index on JERSEY_NUMBER.

CREATE INDEX IX_PLAYER_JERSEY_NUMBER
ON PLAYER (JERSEY_NUMBER)

GO


-- Exercise 5
-- Create an index on COUNTRY_ID.

CREATE INDEX IX_COUNTRY_COUNTRY_ID
ON COUNTRY (COUNTRY_ID)

GO


-- Exercise 6
-- Create a unique index on a column that should not contain duplicate values.

CREATE UNIQUE INDEX UX_PLAYER_ADDRESS
ON PLAYER (ADDRESS)

GO


-- Exercise 7
-- Create a composite index using CLUB_ID and JERSEY_NUMBER.

CREATE INDEX IX_PLAYER_CLUB_JERSEY
ON PLAYER (CLUB_ID, JERSEY_NUMBER)

GO


-- Exercise 8
-- Create a nonclustered index on CLUB_ID with PLAYER_NAME as an included column.

CREATE NONCLUSTERED INDEX IX_PLAYER_CLUB_ID
ON PLAYER (CLUB_ID)
INCLUDE (PLAYER_NAME)

GO


-- Exercise 9
-- Rebuild an existing index.

ALTER INDEX IX_PLAYER_CLUB_ID
ON PLAYER
REBUILD

GO


-- Exercise 10
-- Drop an existing index.

DROP INDEX IX_PLAYER_CLUB_ID
ON PLAYER

GO
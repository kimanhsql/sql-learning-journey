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
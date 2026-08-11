-- Example 1
-- Select all columns.

SELECT *
FROM COACHES


-- Example 2
-- Select data of attribute PLAYER_NAME from PLAYERS table.

SELECT PLAYER_NAME
FROM PLAYERS


-- Example 3
-- Select 2 columns: PLAYER_NAME, POSITION from PLAYERS table.

SELECT PLAYER_NAME,
        POSITION
FROM PLAYERS


-- Example 4
-- Select the data in COUNTRY_ID attribute is unique.

SELECT DISTINCT COUNTRY_ID
FROM PLAYERS
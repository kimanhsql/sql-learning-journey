-- Example 1
-- Select all columns.

SELECT *
FROM COACH


-- Example 2
-- Select data of attribute PLAYER_NAME from PLAYER table.

SELECT PLAYER_NAME
FROM PLAYER


-- Example 3
-- Select 2 columns: PLAYER_NAME, POSITION from PLAYER table.

SELECT PLAYER_NAME,
        POSITION
FROM PLAYER


-- Example 4
-- Select the data in COUNTRY_ID attribute is unique.

SELECT DISTINCT COUNTRY_ID
FROM PLAYER
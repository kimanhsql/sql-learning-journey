/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a UNION query, ask yourself:

1. Do both SELECT statements return the same number of columns?
2. Are the corresponding data types compatible?
3. Should duplicate rows be removed?
4. Are the columns in the correct order?
5. Can I test each SELECT statement separately first?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- UNION combines the result sets of two or more SELECT
  statements.
- Each SELECT statement must return the same number of columns.
- Corresponding columns should have compatible data types.
- The columns are combined based on their position, not
  their column names.
- UNION removes duplicate rows from the combined result.
- The column names in the final result are taken from the
  first SELECT statement.
- Each SELECT statement should be tested separately before
  combining the result sets.
- Keep the SELECT statements simple and make sure they return
  compatible result sets.

Test each SELECT statement first.
Then combine the result sets and verify the final output.
*/


-- Exercise 1
-- Combine PLAYER_NAME from PLAYERS
-- and COACH_NAME from COACHES using UNION.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS

UNION

SELECT COACH_NAME AS NAME
FROM COACHES


-- Exercise 2
-- Combine PLAYER_NAME from PLAYERS
-- and COACH_NAME from COACHES using UNION ALL.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS

UNION ALL

SELECT COACH_NAME AS NAME
FROM COACHES


-- Exercise 3
-- Combine PLAYER_NAME and CLUB_ID from PLAYERS
-- with COACH_NAME and CLUB_ID from COACHES.

SELECT PLAYER_NAME AS NAME,
        CLUB_ID
FROM PLAYERS

UNION

SELECT COACH_NAME AS NAME,
        CLUB_ID
FROM COACHES


-- Exercise 4
-- Combine players and coaches belonging to CLUB_ID 1.

SELECT PLAYER_NAME AS NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID = 1

UNION

SELECT COACH_NAME AS NAME,
        CLUB_ID
FROM COACHES
WHERE CLUB_ID = 1


-- Exercise 5
-- Combine players and coaches
-- and sort the final result alphabetically by name.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS

UNION

SELECT COACH_NAME AS NAME
FROM COACHES

ORDER BY NAME
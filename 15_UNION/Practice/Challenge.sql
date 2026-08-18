/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a UNION query, ask yourself:

1. Am I combining result sets or joining related rows?
2. Should duplicate rows be removed?
3. Should duplicate rows be preserved?
4. Do all SELECT statements return the same number of columns?
5. Are the corresponding columns compatible in data type?
6. Are the columns in the correct order?
7. Should filtering happen before or after the UNION?
8. Where should the final ORDER BY be placed?
9. Can I test each SELECT statement separately first?
10. Can I simplify the query without changing the result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- UNION combines the result sets of multiple SELECT statements
  and removes duplicate rows.
- UNION ALL combines result sets without removing duplicates.
- UNION is different from JOIN: UNION combines rows from
  different result sets, while JOIN combines related columns
  from different tables.
- Each SELECT statement must return the same number of columns.
- Corresponding columns must have compatible data types.
- The position of each column determines how the result sets
  are combined.
- WHERE clauses can be used to filter rows within each SELECT
  statement before combining the results.
- ORDER BY should be applied to the final combined result set.
- Test each SELECT statement separately before combining them.
- Use UNION or UNION ALL based on whether duplicate rows should
  be removed or preserved.
- Keep the combined query clear and make sure all result sets
  represent compatible data.

Understand each result set before combining them.
Test the complete UNION query and verify the final output.
*/


-- Challenge 1
-- Create one result containing all player and coach names.
-- Duplicate names should appear only once.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES


-- Challenge 2
-- Create one result containing all player and coach names.
-- Keep duplicate names.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS

UNION ALL

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES


-- Challenge 3
-- Return one list containing players and coaches from CLUB_ID 1.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS
WHERE CLUB_ID = 1

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES
WHERE CLUB_ID = 1


-- Challenge 4
-- Return one list containing players and coaches
-- from CLUB_ID 1 and CLUB_ID 2.
-- Sort the final result by name.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS
WHERE CLUB_ID IN (1, 2)

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES
WHERE CLUB_ID IN (1, 2)

ORDER BY PERSON_NAME


-- Challenge 5
-- Combine player names from two different countries
-- into one unique result.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS
WHERE COUNTRY_ID = 1

UNION

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS
WHERE COUNTRY_ID = 2


-- Challenge 6
-- Combine player and coach information into one result
-- containing name and CLUB_ID.

SELECT PLAYER_NAME AS PERSON_NAME,
        CLUB_ID
FROM PLAYERS

UNION

SELECT COACH_NAME AS PERSON_NAME,
        CLUB_ID
FROM COACHES


-- Challenge 7
-- Return all names from PLAYERS and COACHES,
-- including duplicates, and sort the final result.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS

UNION ALL

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES

ORDER BY PERSON_NAME


-- Challenge 8
-- Combine two result sets where duplicate rows should be removed.

SELECT PLAYER_NAME AS PERSON_NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID = 1

UNION

SELECT PLAYER_NAME AS PERSON_NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID = 2


-- Challenge 9
-- Combine two result sets where duplicate rows should be preserved.

SELECT PLAYER_NAME AS PERSON_NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID = 1

UNION ALL

SELECT PLAYER_NAME AS PERSON_NAME,
        CLUB_ID
FROM PLAYERS
WHERE CLUB_ID = 2


-- Challenge 10
-- Create one result containing PLAYER_NAME and COACH_NAME
-- under the same column name.
-- Include only people belonging to CLUB_ID 1 or CLUB_ID 2.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS
WHERE CLUB_ID IN (1, 2)

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES
WHERE CLUB_ID IN (1, 2)
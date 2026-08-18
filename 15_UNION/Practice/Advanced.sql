/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing an UNION query, ask yourself:

1. Should duplicates remain or be removed?
2. Are the columns aligned correctly between the queries?
3. Do the corresponding columns have compatible data types?
4. Should filtering happen before or after the UNION?
5. Should I use UNION or UNION ALL?
6. Do I need to combine more than two result sets?
7. Where should ORDER BY be applied?
8. Can each query be tested separately before combining them?
9. Can I simplify the query without changing the result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- UNION combines the result sets of multiple SELECT statements
  and removes duplicate rows.
- UNION ALL combines result sets without removing duplicates.
- Each SELECT statement must return the same number of columns.
- Corresponding columns should have compatible data types.
- The order of the columns determines how the result sets
  are combined.
- WHERE clauses can be used inside individual SELECT statements
  to filter rows before the UNION.
- ORDER BY is applied to the final combined result set.
- Test each SELECT statement separately before combining
  the result sets.
- Use UNION when duplicate rows should be removed.
- Use UNION ALL when duplicate rows should be preserved.
- Keep the combined query clear and make sure each result set
  represents compatible data.

Test each SELECT statement first.
Then combine the result sets and verify the final output.
*/


-- Exercise 1
-- Combine player names from CLUB_ID 1 and CLUB_ID 2.
-- Remove duplicate names.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 1

UNION

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 2


-- Exercise 2
-- Combine player names from CLUB_ID 1 and coach names
-- from CLUB_ID 1 using UNION ALL.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 1

UNION ALL

SELECT COACH_NAME AS NAME
FROM COACHES
WHERE CLUB_ID = 1


-- Exercise 3
-- Combine PLAYER_NAME, POSITION, and CLUB_ID
-- with COACH_NAME, POSITION, and CLUB_ID.

SELECT PLAYER_NAME AS NAME,
        POSITION,
        CLUB_ID
FROM PLAYERS

UNION

SELECT COACH_NAME AS NAME,
        POSITION,
        CLUB_ID
FROM COACHES


-- Exercise 4
-- Combine players from COUNTRY_ID 1
-- with players from COUNTRY_ID 2.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE COUNTRY_ID = 1

UNION

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE COUNTRY_ID = 2


-- Exercise 5
-- Combine players and coaches from CLUB_ID 1 and CLUB_ID 2,
-- then sort the final result by name.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID IN (1, 2)

UNION

SELECT COACH_NAME AS NAME
FROM COACHES
WHERE CLUB_ID IN (1, 2)

ORDER BY NAME


-- Exercise 6
-- Combine two result sets and remove duplicates.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 1

UNION

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 2


-- Exercise 7
-- Combine two result sets while preserving duplicates.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 1

UNION ALL

SELECT PLAYER_NAME AS NAME
FROM PLAYERS
WHERE CLUB_ID = 2


-- Exercise 8
-- Combine PLAYER_NAME and COACH_NAME into one column
-- named PERSON_NAME and include CLUB_ID.

SELECT PLAYER_NAME AS PERSON_NAME,
        CLUB_ID
FROM PLAYERS

UNION

SELECT COACH_NAME AS PERSON_NAME,
        CLUB_ID
FROM COACHES


-- Exercise 9
-- Combine players and coaches and return only unique names.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES


-- Exercise 10
-- Combine players and coaches and return all names,
-- including duplicates.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYERS

UNION ALL

SELECT COACH_NAME AS PERSON_NAME
FROM COACHES
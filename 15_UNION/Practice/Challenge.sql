/*
Before writing SQL, ask yourself:

- Am I combining result sets or joining related rows?
- Should duplicate rows be removed?
- Should duplicate rows be preserved?
- Do both SELECT statements have compatible structures?
- Where should the final ORDER BY be placed?
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
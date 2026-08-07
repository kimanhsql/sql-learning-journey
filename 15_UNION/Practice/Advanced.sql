/*
Before writing SQL, ask yourself:

- Should duplicates remain?
- Are the columns aligned correctly?
- Should filtering happen before UNION?
- Where should ORDER BY be applied?
*/


-- Exercise 1
-- Combine player names from CLUB_ID 1 and CLUB_ID 2.
-- Remove duplicate names.

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 1

UNION

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 2


-- Exercise 2
-- Combine player names from CLUB_ID 1 and coach names
-- from CLUB_ID 1 using UNION ALL.

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 1

UNION ALL

SELECT COACH_NAME AS NAME
FROM COACH
WHERE CLUB_ID = 1


-- Exercise 3
-- Combine PLAYER_NAME, POSITION, and CLUB_ID
-- with COACH_NAME, POSITION, and CLUB_ID.

SELECT PLAYER_NAME AS NAME,
       POSITION,
       CLUB_ID
FROM PLAYER

UNION

SELECT COACH_NAME AS NAME,
       POSITION,
       CLUB_ID
FROM COACH


-- Exercise 4
-- Combine players from COUNTRY_ID 1
-- with players from COUNTRY_ID 2.

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE COUNTRY_ID = 1

UNION

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE COUNTRY_ID = 2


-- Exercise 5
-- Combine players and coaches from CLUB_ID 1 and CLUB_ID 2,
-- then sort the final result by name.

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID IN (1, 2)

UNION

SELECT COACH_NAME AS NAME
FROM COACH
WHERE CLUB_ID IN (1, 2)

ORDER BY NAME


-- Exercise 6
-- Combine two result sets and remove duplicates.

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 1

UNION

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 2


-- Exercise 7
-- Combine two result sets while preserving duplicates.

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 1

UNION ALL

SELECT PLAYER_NAME AS NAME
FROM PLAYER
WHERE CLUB_ID = 2


-- Exercise 8
-- Combine PLAYER_NAME and COACH_NAME into one column
-- named PERSON_NAME and include CLUB_ID.

SELECT PLAYER_NAME AS PERSON_NAME,
       CLUB_ID
FROM PLAYER

UNION

SELECT COACH_NAME AS PERSON_NAME,
       CLUB_ID
FROM COACH


-- Exercise 9
-- Combine players and coaches and return only unique names.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACH


-- Exercise 10
-- Combine players and coaches and return all names,
-- including duplicates.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION ALL

SELECT COACH_NAME AS PERSON_NAME
FROM COACH
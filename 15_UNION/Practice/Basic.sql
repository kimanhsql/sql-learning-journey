/*
Before writing SQL, ask yourself:

- Do both SELECT statements return the same number of columns?
- Are the corresponding data types compatible?
- Should duplicates be removed?
*/


-- Exercise 1
-- Combine PLAYER_NAME from PLAYER
-- and COACH_NAME from COACH using UNION.

SELECT PLAYER_NAME AS NAME
FROM PLAYER

UNION

SELECT COACH_NAME AS NAME
FROM COACH


-- Exercise 2
-- Combine PLAYER_NAME from PLAYER
-- and COACH_NAME from COACH using UNION ALL.

SELECT PLAYER_NAME AS NAME
FROM PLAYER

UNION ALL

SELECT COACH_NAME AS NAME
FROM COACH


-- Exercise 3
-- Combine PLAYER_NAME and CLUB_ID from PLAYER
-- with COACH_NAME and CLUB_ID from COACH.

SELECT PLAYER_NAME AS NAME,
        CLUB_ID
FROM PLAYER

UNION

SELECT COACH_NAME AS NAME,
        CLUB_ID
FROM COACH


-- Exercise 4
-- Combine players and coaches belonging to CLUB_ID 1.

SELECT PLAYER_NAME AS NAME,
        CLUB_ID
FROM PLAYER
WHERE CLUB_ID = 1

UNION

SELECT COACH_NAME AS NAME,
        CLUB_ID
FROM COACH
WHERE CLUB_ID = 1


-- Exercise 5
-- Combine players and coaches and sort the final result
-- alphabetically by name.

SELECT PLAYER_NAME AS NAME
FROM PLAYER

UNION

SELECT COACH_NAME AS NAME
FROM COACH

ORDER BY NAME
/*
Before writing SQL, ask yourself:

- Do both SELECT statements return the same number of columns?
- Are the corresponding data types compatible?
- Should duplicates be removed?
*/


-- Exercise 1
-- Combine PLAYER_NAME from PLAYERS
-- and COACH_NAME from COACH using UNION.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS

UNION

SELECT COACH_NAME AS NAME
FROM COACHES


-- Exercise 2
-- Combine PLAYER_NAME from PLAYERS
-- and COACH_NAME from COACH using UNION ALL.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS

UNION ALL

SELECT COACH_NAME AS NAME
FROM COACHES


-- Exercise 3
-- Combine PLAYER_NAME and CLUB_ID from PLAYERS
-- with COACH_NAME and CLUB_ID from COACH.

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
-- Combine players and coaches and sort the final result
-- alphabetically by name.

SELECT PLAYER_NAME AS NAME
FROM PLAYERS

UNION

SELECT COACH_NAME AS NAME
FROM COACHES

ORDER BY NAME
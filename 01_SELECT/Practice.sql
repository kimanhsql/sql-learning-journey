--- BASIC ---
-- Exercise 1
-- Display all columns from the PLAYER table.

SELECT *
    FROM PLAYER


-- Exercise 2
-- Display only player names.

SELECT PLAYER_NAME
    FROM PLAYER


-- Exercise 3
-- Display player names and their positions.

SELECT PLAYER_NAME, POSITION
    FROM PLAYER


-- Exercise 4
-- Display all distinct countries.

SELECT DISTINCT COUNTRY_NAME
    FROM COUNTRY


-- Exercise 5
-- Display all coaches.

SELECT *
    FROM COACH


--- INTERMEDIATE ---
-- Exercise 6
-- Display player names, jersey numbers, and positions.

SELECT PLAYER_NAME, JERSEY_NUMBER, POSITION
    FROM PLAYER


-- Exercise 7
-- Display all stadium names.

SELECT STADIUM_NAME
    FROM STADIUM


-- Exercise 8
-- Display all club names.

SELECT CLUB_NAME
    FROM CLUB


-- Exercise 9
-- Display player names and birth dates.

SELECT PLAYER_NAME, BIRTH_DATE
    FROM PLAYER


-- Exercise 10
-- Display all countries.

SELECT *
    FROM COUNTRY


--- ADVANCED ---
-- Exercise 11
-- Display the same column twice using aliases.

SELECT PLAYER_NAME AS PLAYER_NAME,
        PLAYER_NAME AS FULLNAME
    FROM PLAYER


-- Exercise 12
-- Display a custom message together with player names.

SELECT PLAYER_NAME,
        'ACTIVE PLAYER' AS STATUS
    FROM PLAYER


-- Exercise 13
-- Display the current date using GETDATE().

SELECT PLAYER_NAME,
        GETDATE() AS CURRENT_DATE
    FROM PLAYER


-- Exercise 14
-- Display all columns and rename some column headers using AS.

SELECT PLAYER_ID AS ID,
        PLAYER_NAME AS NAME,
        POSITION AS POSITION,
        JERSEY_NUMBER AS NUM,
        BIRTH_DATE AS BIRTHDAY,
    FROM PLAYER


-- Exercise 15
-- Display the total number of columns selected.

SELECT PLAYER_NAME,
        POSITION,
        JERSEY_NUMBER
    FROM PLAYER
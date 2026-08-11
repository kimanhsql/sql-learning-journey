/*
Think before writing SQL.

Ask yourself:

- Should I rename any column using AS?
- Do I need DISTINCT?
- Should I display a constant value?
- Do I need to use a built-in function?
- Is the result easy to read and understand?

Think about how to improve the output, not just how to retrieve the data.
*/


-- Exercise 1
-- Display the same column twice using aliases.

SELECT PLAYER_NAME AS PLAYER_NAME,
        PLAYER_NAME AS FULLNAME
FROM PLAYERS


-- Exercise 2
-- Display a custom message together with player names.

SELECT PLAYER_NAME,
        'ACTIVE PLAYER' AS STATUS
FROM PLAYERS


-- Exercise 3
-- Display the current date using GETDATE().

SELECT PLAYER_NAME,
        GETDATE() AS Curr_Date
FROM PLAYERS


-- Exercise 4
-- Display all columns and rename some column headers using AS.

SELECT PLAYER_ID AS ID,
        PLAYER_NAME AS NAME,
        POSITION AS POSITION,
        JERSEY_NUMBER AS NUM,
        BIRTH_DATE AS BIRTHDAY
FROM PLAYERS


-- Exercise 5
-- Display the total number of columns selected.

SELECT PLAYER_NAME,
        POSITION,
        JERSEY_NUMBER
FROM PLAYERS
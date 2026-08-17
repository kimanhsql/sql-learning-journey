/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before using a BUILT-IN FUNCTION, ask yourself:

1. Which function solves the problem?
2. What data type am I working with?
3. Does the function require one argument or multiple arguments?
4. Will the function return one value for each row?
5. Should I use a scalar function or an aggregate function?
6. What result should the function return?
7. Does the function change the value or only its format?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Built-in functions are provided by SQL Server to perform
  common operations on data.
- Scalar functions return one value for each row.
- Aggregate functions return one value for a group or the
  entire table.
- Choose the function based on the data type and the required
  result.
- Check the function's arguments before using it.
- Make sure the function is applied to the correct column.
- Different functions may return different data types.
- Test the function with simple data before using it in a
  more complex query.

Choose the correct function before writing the query.
*/


-- Exercise 1
-- Display the total number of players.

SELECT COUNT(*) AS TotalPlayers
FROM PLAYERS


-- Exercise 2
-- Display the highest jersey number in the PLAYERS table.

SELECT MAX(JERSEY_NUMBER) AS HighestJerseyNumber
FROM PLAYERS


-- Exercise 3
-- Display player names in lowercase.

SELECT LOWER(PLAYER_NAME) AS LowercaseNames
FROM PLAYERS


-- Exercise 4
-- Display the length of each club name.

SELECT CLUB_NAME,
        LEN(CLUB_NAME) AS CLubNameLength
FROM CLUBS


-- Exercise 5
-- Display the first letter of each player name.

SELECT PLAYER_NAME,
        LEFT(PLAYER_NAME, 1) AS FirstLetter
FROM PLAYERS


-- Exercise 6
-- Display the current date.

SELECT GETDATE() AS CurrentDate


-- Exercise 7
-- Display the year of each player's birth date.

SELECT PLAYER_NAME,
        YEAR(BIRTH_DATE) AS BirthYear
FROM PLAYERS


-- Exercise 8
-- Display the jersey number as a character value.

SELECT PLAYER_NAME,
        CAST(JERSEY_NUMBER AS VARCHAR(10)) AS JerseyText
FROM PLAYERS


-- Exercise 9
-- Display the average jersey number for each position,
-- rounded to 1 decimal place.

SELECT POSITION,
        ROUND(AVG(JERSEY_NUMBER), 1) AS AverageJerseyNumber
FROM PLAYERS


-- Exercise 10
-- Display player names together with their birth years.

SELECT PLAYER_NAME,
        YEAR(BIRTH_DATE) AS PlayerBirthYear
FROM PLAYERS
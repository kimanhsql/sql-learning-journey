/*
Think before writing SQL.

Ask yourself:

- Which function solves the problem?
- What data type am I working with?
- Does the function require one or more arguments?
- Will the function return a single value or one value for each row?
- Should I use a built-in function or an aggregate function?

Remember:

- Scalar functions return one value for each row.
- Aggregate functions return one value for a group or the entire table.
- Choose the correct function before writing the query.
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
FROM CLUB


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
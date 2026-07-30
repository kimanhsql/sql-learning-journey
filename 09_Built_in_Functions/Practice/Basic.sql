/*
Before writing SQL, think about the following questions:

- Which function do I need?
- Does the function return a single value or a set of values?
- Do I need to combine the function with GROUP BY?
- Should I use a string, date, math, conversion, or aggregate function?
- What column should be passed into the function?

Read the requirement carefully before writing SQL.
Focus on choosing the right function first.
*/


-- Exercise 1
-- Display the total number of players.

SELECT COUNT(*) AS TotalPlayers
FROM PLAYER


-- Exercise 2
-- Display the highest jersey number in the PLAYER table.

SELECT MAX(JERSEY_NUMBER) AS HighestJerseyNumber
FROM PLAYER


-- Exercise 3
-- Display player names in lowercase.

SELECT LOWER(PLAYER_NAME) AS LowercaseNames
FROM PLAYER


-- Exercise 4
-- Display the length of each club name.

SELECT CLUB_NAME,
        LEN(CLUB_NAME) AS CLubNameLength
FROM CLUB


-- Exercise 5
-- Display the first letter of each player name.

SELECT PLAYER_NAME,
       LEFT(PLAYER_NAME, 1) AS FirstLetter
FROM PLAYER


-- Exercise 6
-- Display the current date.

SELECT GETDATE() AS CurrentDate


-- Exercise 7
-- Display the year of each player's birth date.

SELECT PLAYER_NAME,
        YEAR(BIRTH_DATE) AS BirthYear
FROM PLAYER


-- Exercise 8
-- Display the jersey number as a character value.

SELECT PLAYER_NAME,
        CAST(JERSEY_NUMBER AS VARCHAR(10)) AS JerseyText
FROM PLAYER


-- Exercise 9
-- Display the average jersey number for each position, rounded to 1 decimal place.

SELECT POSITION,
        ROUND(AVG(JERSEY_NUMBER), 1) AS AverageJerseyNumber
FROM PLAYER


-- Exercise 10
-- Display player names together with their birth years.

SELECT PLAYER_NAME,
        YEAR(BIRTH_DATE) AS PlayerBirthYear
FROM PLAYER
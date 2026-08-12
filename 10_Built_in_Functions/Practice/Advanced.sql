/*
Think before writing SQL.

Ask yourself:

- Should I combine multiple functions?
- Should the function be applied before or after an aggregate function?
- Do I need GROUP BY?
- Should I convert the data type first?
- Will the function change the output format?
- Can I improve readability by using aliases?

Build the query step by step and verify each function before combining them.
*/


-- Exercise 1
-- Display player names in uppercase together with the length of each name.

SELECT UPPER(PLAYER_NAME) AS PlayerName,
        LEN(PLAYER_NAME) AS NameLength
FROM PLAYERS


-- Exercise 2
-- Display club names and the number of characters
-- after removing trailing spaces.

SELECT CLUB_NAME,
        LEN(RTRIM(CLUB_NAME)) AS Club_Name_Length
FROM CLUBS


-- Exercise 3
-- Display player names together with the month they were born.

SELECT PLAYER_NAME,
        MONTH(BIRTH_DATE) AS BirthMonth
FROM PLAYERS


-- Exercise 4
-- Display player names together with the day they were born.

SELECT PLAYER_NAME,
        DAY(BIRTH_DATE) AS BirthDay
FROM PLAYERS


-- Exercise 5
-- Display the average jersey number for each club
-- rounded to two decimal places.

SELECT CLUB_ID,
        ROUND(AVG(JERSEY_NUMBER), 2) AS Average_Jersey_Number
FROM PLAYERS
GROUP BY CLUB_ID


-- Exercise 6
-- Display the total number of players in each country.

SELECT COUNTRY_ID,
        COUNT(*) AS Total_Players
FROM PLAYERS
GROUP BY COUNTRY_ID


-- Exercise 7
-- Display player names together with
-- the first three characters of their names.

SELECT PLAYER_NAME,
        LEFT(PLAYER_NAME, 3) AS First_Three_Characters
FROM PLAYERS


-- Exercise 8
-- Display player names together with
-- the last three characters of their names.

SELECT PLAYER_NAME,
        RIGHT(PLAYER_NAME, 3) AS Last_Three_Characters
FROM PLAYERS


-- Exercise 9
-- Display jersey numbers as text and player names in uppercase.

SELECT UPPER(PLAYER_NAME) AS PlayerName,
        CAST(JERSEY_NUMBER AS VARCHAR(10)) AS JerseyNumber
FROM PLAYERS


-- Exercise 10
-- Display the maximum, minimum, and average jersey number for each position.

SELECT POSITION,
        MAX(JERSEY_NUMBER) AS MaximumJerseyNumber,
        MIN(JERSEY_NUMBER) AS MinimumJerseyNumber,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY POSITION
/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before using a BUILT-IN FUNCTION, ask yourself:

1. What result do I need the function to produce?
2. Which built-in function is appropriate for the task?
3. Should I combine multiple functions?
4. Should the function be applied before or after an
   aggregate function?
5. Do I need GROUP BY when using the function?
6. Should I convert the data type before applying the function?
7. Will the function change the value, data type, or output format?
8. Should I use a string, numeric, date/time, or conversion function?
9. Can I use an alias to make the calculated result easier to read?
10. Can I simplify the expression without changing the result?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Built-in functions can be used to manipulate, calculate,
  convert, or format data.
- Choose the function based on the data type and the required
  result.
- Multiple functions can be nested when one function needs to
  process the result of another function.
- Check the order in which nested functions are evaluated.
- When combining functions with aggregate functions, understand
  whether the function is applied to individual rows or to the
  aggregated result.
- Use GROUP BY when the query needs to calculate results for
  separate groups.
- Be careful when converting data types because conversion can
  affect the value or format of the result.
- Use aliases for calculated columns when they make the output
  easier to understand.
- Test each function separately before combining multiple
  functions in a complex expression.
- Make sure the final result matches the question, not merely
  the syntax of the function.

Build the query step by step and verify each function before
combining them.
*/


-- Exercise 1
-- Display player names in uppercase together with
-- the length of each name.

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
-- Display the maximum, minimum, and average jersey number
-- for each position.

SELECT POSITION,
        MAX(JERSEY_NUMBER) AS MaximumJerseyNumber,
        MIN(JERSEY_NUMBER) AS MinimumJerseyNumber,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM PLAYERS
GROUP BY POSITION
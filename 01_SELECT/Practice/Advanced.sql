/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a SELECT query, ask yourself:

1. What information does the question actually ask for?
2. Which table(s) contain the required information?
3. Do I need to JOIN with another table?
4. Should I rename any column using AS?
5. Do I need DISTINCT to remove duplicate rows?
6. Should I display a constant value?
7. Do I need a built-in function?
8. Do I need to calculate a new value from existing columns?
9. Do I need to filter the result using WHERE?
10. Do I need to sort the result using ORDER BY?
11. Could NULL values affect the result?
12. Is the result easy to read and understand?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- SELECT retrieves data. It does not modify the database.
- Select only the columns that are required by the question.
- Use AS when a column name should be clearer or more meaningful.
- Use DISTINCT only when duplicate result rows need to be removed.
- Use table aliases to make queries shorter and easier to read,
  especially when working with multiple tables.
- Use qualified column names when different tables contain
  columns with the same name.
- Use built-in functions when they simplify the required operation.
- Use expressions to calculate values when necessary.
- Use WHERE to filter rows before returning the result.
- Use ORDER BY when the question requires a specific order.
- Do not use DISTINCT just because duplicate rows "look wrong".
  First understand why the duplicates appear.
- Do not SELECT * when the question asks for specific columns.
- Make the query answer the question directly instead of
  returning unnecessary data.

============================================================
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
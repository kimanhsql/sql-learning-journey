/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a SELECT query, ask yourself:

1. Which table contains the required data?
2. Which columns contain the information I need?
3. Do I need all columns or only specific columns?
4. Should I use SELECT * or list the columns explicitly?
5. Do I need to rename any column using AS?
6. Is the output exactly what the question asks for?
7. Is the order of the selected columns clear and meaningful?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- SELECT retrieves data from a table.
- Use SELECT * when you need to see all columns.
- List columns explicitly when the question asks for
  specific information.
- The order of columns in SELECT determines the order
  in the result.
- Use AS to give a column a clearer or more meaningful name
  when necessary.
- Do not select unnecessary columns.
- Make sure the selected columns directly answer the question.
- SELECT does not modify the data in the database.

============================================================
*/


-- Exercise 1
-- Display all columns from the PLAYERS table.

SELECT *
FROM PLAYERS


-- Exercise 2
-- Display only player names.

SELECT PLAYER_NAME
FROM PLAYERS


-- Exercise 3
-- Display player names and their positions.

SELECT PLAYER_NAME,
        POSITION
FROM PLAYERS


-- Exercise 4
-- Display all distinct countries.

SELECT DISTINCT COUNTRY_NAME
FROM COUNTRIES


-- Exercise 5
-- Display all coaches.

SELECT *
FROM COACHES


-- Exercise 6
-- Display player names, jersey numbers, and positions.

SELECT PLAYER_NAME,
        JERSEY_NUMBER,
        POSITION
FROM PLAYERS


-- Exercise 7
-- Display all stadium names.

SELECT STADIUM_NAME
FROM STADIUMS


-- Exercise 8
-- Display all club names.

SELECT CLUB_NAME
FROM CLUBS


-- Exercise 9
-- Display player names and birth dates.

SELECT PLAYER_NAME,
        BIRTH_DATE
FROM PLAYERS


-- Exercise 10
-- Display all countries.

SELECT *
FROM COUNTRIES
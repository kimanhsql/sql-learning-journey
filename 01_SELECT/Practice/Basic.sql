/*
Think before writing SQL.

Ask yourself:

- Which table contains the required data?
- Which columns should I display?
- Do I need all columns or only specific ones?
- Should I use SELECT * or list the columns explicitly?
- Is the output exactly what the question asks for?

Focus on understanding the requirement first.
Then write the SQL statement.
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
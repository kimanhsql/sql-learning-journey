/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a GROUP BY query, ask yourself:

1. Which column should I group by?
2. Which aggregate function should I use?
3. Should every selected column be grouped or aggregated?
4. Do I need one grouping column or multiple grouping columns?
5. Does the output answer the question correctly?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- GROUP BY combines rows with the same value into groups.
- Aggregate functions such as COUNT, SUM, AVG, MIN, and MAX
  can be used to calculate a result for each group.
- Every selected column must either be included in GROUP BY
  or used inside an aggregate function.
- Use multiple columns in GROUP BY when the question requires
  grouping at more than one level.
- GROUP BY does not modify the data stored in the table.
- The result contains one row for each group.
- Read the question carefully to determine the correct
  grouping column.

Group the data first.
Then calculate the required result.
============================================================
*/


-- Exercise 1
-- Display the number of players in each position.

SELECT POSITION,
        COUNT(*) AS NumberOfPlayers
FROM PLAYERS
GROUP BY POSITION


-- Exercise 2
-- Display the number of players in each club.

SELECT C.CLUB_ID,
        CLUB_NAME,
        COUNT(PLAYER_ID) AS NumPlayerInClub
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME


-- Exercise 3
-- Display the number of players from each country.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NumPlayerInCountry
FROM COUNTRIES CT, PLAYERS PL
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME


-- Exercise 4
-- Display the average jersey number for each position.

SELECT POSITION,
        AVG(JERSEY_NUMBER)
FROM PLAYERS
GROUP BY POSITION


-- Exercise 5
-- Display the highest jersey number in each club.

SELECT C.CLUB_ID,
        CLUB_NAME,
        MAX(JERSEY_NUMBER)
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME


-- Exercise 6
-- Display the earliest birth date in each country.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        MIN(BIRTH_DATE)
FROM COUNTRIES CT, PLAYERS PL
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME


-- Exercise 7
-- Display the number of players in each position,
-- excluding Goalkeepers.

SELECT POSITION,
        COUNT(*)
FROM PLAYERS
WHERE POSITION <> 'Goalkeeper'
GROUP BY POSITION


-- Exercise 8
-- Display the total number of players in each club
-- and sort the result by club name.

SELECT C.CLUB_ID,
        CLUB_NAME,
        COUNT(*)
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
ORDER BY CLUB_NAME


-- Exercise 9
-- Display the average jersey number for each country.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        AVG(JERSEY_NUMBER)
FROM COUNTRIES CT, PLAYERS PL
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME


-- Exercise 10
-- Display the number of players for each position and country.

SELECT POSITION,
        CT.COUNTRY_ID,
        COUNT(*)
FROM PLAYERS PL, COUNTRIES CT
WHERE PL.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY POSITION,
        CT.COUNTRY_ID
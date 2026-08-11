/*
Think before writing SQL.

Ask yourself:

- Should I use WHERE before GROUP BY?
- Should I use HAVING after GROUP BY?
- Should I join multiple tables before grouping?
- Which aggregate function should I use?
- Am I filtering rows or filtering groups?
- Should I sort the grouped result?
- Can I combine WHERE, GROUP BY, HAVING, and ORDER BY correctly?

Analyze the SQL execution order before writing the query.
*/

-- Exercise 1
-- Display positions that have more than 3 players.

SELECT POSITION,
        COUNT(*) AS NumOfPlayers
FROM PLAYERS
GROUP BY POSITION
HAVING COUNT(*) > 3


-- Exercise 2
-- Display clubs whose average jersey number is greater than 10.

SELECT C.CLUB_ID,
        CLUB_NAME,
        AVG(JERSEY_NUMBER) AS AvgJerseyNum
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
HAVING AVG(JERSEY_NUMBER) > 10


-- Exercise 3
-- Display countries that have at least 4 players.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        COUNT(*) AS NumOfPlayers
FROM COUNTRIES CT, PLAYERS PL
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME
HAVING COUNT(*) >= 4


-- Exercise 4
-- Display clubs whose earliest player birth date is before '1995-01-01'.

SELECT C.CLUB_ID,
        CLUB_NAME,
        MIN(BIRTH_DATE) AS EarliestBirthDate
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
HAVING MIN(BIRTH_DATE) < '1995-01-01'


-- Exercise 5
-- Display positions whose highest jersey number is greater than 20.

SELECT POSITION,
        MAX(JERSEY_NUMBER) AS MaxJerseyNum
FROM PLAYERS
GROUP BY POSITION
HAVING MAX(JERSEY_NUMBER) > 20


-- Exercise 6
-- Display countries whose average jersey number is less than 15,
-- sorted by country name.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        AVG(JERSEY_NUMBER) AS AverageJerseyNumber
FROM COUNTRIES CT, PLAYERS PL
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY CT.COUNTRY_ID,
        COUNTRY_NAME
HAVING AVG(JERSEY_NUMBER) < 15
ORDER BY COUNTRY_NAME


-- Exercise 7
-- Display clubs that have more than two Midfielders.

SELECT C.CLUB_ID,
        CLUB_NAME,
        COUNT(*) AS Player_Position
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
        AND POSITION = 'Midfielder'
GROUP BY C.CLUB_ID,
        CLUB_NAME
HAVING COUNT(*) > 2


-- Exercise 8
-- Display countries that have more than one Goalkeeper.

SELECT COUNTRY_NAME,
        COUNT(*) AS PlayerPosition
FROM COUNTRIES CT, PLAYERS PL
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
        AND POSITION = 'Goalkeeper'
GROUP BY COUNTRY_NAME
HAVING COUNT(*) > 1


-- Exercise 9
-- Display clubs whose maximum jersey number is between 20 and 30.

SELECT C.CLUB_ID,
        CLUB_NAME,
        MAX(JERSEY_NUMBER) AS HighestJerseyNum
FROM CLUBS C, PLAYERS PL
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME
HAVING MAX(JERSEY_NUMBER) BETWEEN 20 AND 30


-- Exercise 10
-- Display positions whose average jersey number is
-- greater than the average jersey number of all players.

SELECT POSITION,
        AVG(JERSEY_NUMBER) AverageJerseyNum
FROM PLAYERS
GROUP BY POSITION
HAVING AVG(JERSEY_NUMBER) >
(
    SELECT AVG(JERSEY_NUMBER)
    FROM PLAYERS
)
/*
Think before writing SQL.

Ask yourself:

- Do I need to join multiple tables before grouping?
- Should I group by one column or multiple columns?
- Should I filter rows before grouping using WHERE?
- Which aggregate function should I use?
- Should I sort the grouped result?

Remember:

- WHERE filters rows before GROUP BY.
- GROUP BY creates groups.
- ORDER BY sorts the final result.
*/


-- Exercise 1
-- Display the number of players in each club, ordered from highest to lowest.

SELECT CLUB_NAME,
        COUNT(*) AS PLAYER_COUNT
FROM PLAYERS PL, CLUBS C
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY CLUB_NAME
ORDER BY PLAYER_COUNT DESC


-- Exercise 2
-- Display the average jersey number for each club.

SELECT CLUB_NAME,
        AVG(JERSEY_NUMBER) AS AVERAGE_JERSEY_NUMBER
FROM PLAYERS PL, CLUBS C
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY CLUB_NAME


-- Exercise 3
-- Display the highest jersey number in each country,
-- ordered by country name.

SELECT COUNTRY_NAME,
        MAX(JERSEY_NUMBER) AS HIGHEST_JERSEY_NUMBER
FROM PLAYERS PL, COUNTRIES CT
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY COUNTRY_NAME
ORDER BY COUNTRY_NAME


-- Exercise 4
-- Display the earliest birth date for each position.

SELECT POSITION,
        MIN(BIRTH_DATE) AS EARLIEST_BIRTH_DATE
FROM PLAYERS
GROUP BY POSITION


-- Exercise 5
-- Display the number of players in each country and each position.

SELECT COUNTRY_NAME,
        POSITION,
        COUNT(*) AS PLAYER_COUNT
FROM PLAYERS PL, COUNTRIES CT
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY COUNTRY_NAME,
        POSITION


-- Exercise 6
-- Display the average jersey number for each country,
-- excluding players whose jersey number is less than 5.

SELECT COUNTRY_NAME,
        AVG(JERSEY_NUMBER) AS AVERAGE_JERSEY_NUMBER
FROM PLAYERS PL, COUNTRIES CT
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
        AND JERSEY_NUMBER >= 5
GROUP BY COUNTRY_NAME


-- Exercise 7
-- Display the total number of players in each club,
-- sorted alphabetically by club name.

SELECT CLUB_NAME,
        COUNT(*) AS PLAYER_COUNT
FROM PLAYERS PL, CLUBS C
WHERE C.CLUB_ID = PL.CLUB_ID
GROUP BY CLUB_NAME
ORDER BY CLUB_NAME


-- Exercise 8
-- Display the maximum jersey number for each position and country.

SELECT POSITION,
        COUNTRY_NAME,
        MAX(JERSEY_NUMBER) AS MAX_JERSEY_NUMBER
FROM PLAYERS PL, COUNTRIES CT
WHERE CT.COUNTRY_ID = PL.COUNTRY_ID
GROUP BY POSITION, COUNTRY_NAME


-- Exercise 9
-- Display the average jersey number for each position,
-- ordered from highest to lowest.

SELECT POSITION,
        AVG(JERSEY_NUMBER) AS AVERAGE_JERSEY_NUMBER
FROM PLAYERS
GROUP BY POSITION
ORDER BY AVERAGE_JERSEY_NUMBER DESC


-- Exercise 10
-- Display the number of players born after '2000-01-01' in each club.

SELECT CLUB_NAME,
        COUNT(*) AS PLAYER_COUNT
FROM PLAYERS PL, CLUBS C
WHERE C.CLUB_ID = PL.CLUB_ID
        AND BIRTH_DATE > '2000-01-01'
GROUP BY CLUB_NAME
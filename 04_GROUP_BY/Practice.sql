-- Exercise 1
-- Display the number of players in each position.

SELECT POSITION,
        COUNT(*) AS NumberOfPlayers
FROM PLAYER
GROUP BY POSITION


-- Exercise 2
-- Display the number of players in each club.

SELECT C.CLUB_ID, CLUB_NAME,
        COUNT(PLAYER_ID) AS NumPlayerInClub
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY CLUB_ID,
            CLUB_NAME


-- Exercise 3
-- Display the number of players from each country.

SELECT CT.COUNTRY_ID, COUNTRY_NAME,
        COUNT(PLAYER_ID) AS NumPlayerInCountry
FROM COUNTRY CT, PLAYER P
WHERE CT.COUNTRY_ID = P.COUNTRY_ID
GROUP BY COUNTRY_ID,
            COUNTRY_NAME


-- Exercise 4
-- Display the average jersey number for each position.

SELECT POSITION,
        AVG(JERSEY_NUMBER)
FROM PLAYER
GROUP BY POSITION


-- Exercise 5
-- Display the highest jersey number in each club.

SELECT C.CLUB_ID, CLUB_NAME,
        MAX(JERSEY_NUMBER)
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY CLUB_ID,
            CLUB_NAME


-- Exercise 6
-- Display the earliest birth date in each country.

SELECT CT.COUNTRY_ID, COUNTRY_NAME,
        MIN(BIRTH_DATE)
FROM COUNTRY CT, PLAYER P
WHERE CT.COUNTRY_ID = P.COUNTRY_ID
GROUP BY COUNTRY_ID,
            COUNTRY_NAME


-- Exercise 7
-- Display the number of players in each position, excluding Goalkeepers.

SELECT POSITION,
        COUNT(*)
FROM PLAYER
WHERE POSITION <> 'Goalkeeper'
GROUP BY POSITION


-- Exercise 8
-- Display the total number of players in each club and sort the result by club name.

SELECT C.CLUB_ID, CLUB_NAME,
        COUNT(*)
FROM CLUB C, PLAYER P
WHERE C.CLUB_ID = P.CLUB_ID
GROUP BY CLUB_ID,
            CLUB_NAME
ORDER BY CLUB_NAME


-- Exercise 9
-- Display the average jersey number for each country.

SELECT CT.COUNTRY_ID, COUNTRY_NAME,
        AVG(JERSEY_NUMBER)
FROM COUNTRY CT, PLAYER P
WHERE CT.COUNTRY_ID = P.COUNTRY_ID
GROUP BY COUNTRY_ID,
            COUNTRY_NAME


-- Exercise 10
-- Display the number of players for each position and country.

SELECT POSITION, CT.COUNTRY_ID,
        COUNT(*)
FROM PLAYER P, COUNTRY CT
WHERE P.COUNTRY_ID = CT.COUNTRY_ID
GROUP BY POSITION,
            COUNTRY_ID
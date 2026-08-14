-- Example 1
-- Display all players whose position is Forward.

SELECT *
FROM PLAYERS
WHERE POSITION = 'Forward'


-- Example 2
-- Display player names whose jersey number is greater than 10.

SELECT PLAYER_NAME
FROM PLAYERS
WHERE JERSEY_NUMBER > 10


-- Example 3
-- Display all Vietnamese players.

SELECT *
FROM PLAYERS
WHERE COUNTRY_NAME = 'Vietnam'


-- Example 4
-- Display all Brazilian goalkeepers.

SELECT *
FROM PLAYERS
WHERE POSITION = 'Goalkeeper'
      AND COUNTRY_NAME = 'Brazil'


-- Example 5
-- Display players whose names start with the letter 'N'.

SELECT *
FROM PLAYERS
WHERE PLAYER_NAME LIKE 'N%'
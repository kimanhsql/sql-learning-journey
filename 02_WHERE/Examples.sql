-- Example 1
-- Display all players whose position is Forward.

SELECT *
FROM PLAYER
WHERE POSITION = 'Forward'


-- Example 2
-- Display player names whose jersey number is greater than 10.

SELECT PLAYER_NAME
FROM PLAYER
WHERE JERSEY_NUMBER > 10


-- Example 3
-- Display all Vietnamese players.

SELECT *
FROM PLAYER
WHERE COUNTRY = 'Vietnam'


-- Example 4
-- Display all Brazilian goalkeepers.

SELECT *
FROM PLAYER
WHERE POSITION = 'Goalkeeper'
  AND COUNTRY = 'Brazil'


-- Example 5
-- Display players whose names start with the letter 'N'.

SELECT *
FROM PLAYER
WHERE PLAYER_NAME LIKE 'N%'
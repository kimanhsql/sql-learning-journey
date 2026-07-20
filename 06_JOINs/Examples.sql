-- Example 1
-- INNER JOIN
-- Return only matching rows from PLAYER and CLUB.

SELECT PLAYER_NAME, CLUB_NAME
FROM PLAYER
INNER JOIN CLUB
ON PLAYER.CLUB_ID = CLUB.CLUB_ID


-- Example 2
-- LEFT OUTER JOIN
-- Return all clubs, including clubs without players.

SELECT CLUB_NAME, PLAYER_NAME
FROM CLUB
LEFT OUTER JOIN PLAYER
ON CLUB.CLUB_ID = PLAYER.CLUB_ID


-- Example 3
-- RIGHT OUTER JOIN
-- Return all players, including players without clubs.

SELECT PLAYER_NAME, CLUB_NAME
FROM CLUB
RIGHT OUTER JOIN PLAYER
ON CLUB.CLUB_ID = PLAYER.CLUB_ID


-- Example 4
-- FULL OUTER JOIN
-- Return all clubs and all players, including unmatched rows.

SELECT CLUB_NAME, PLAYER_NAME
FROM CLUB
FULL OUTER JOIN PLAYER
ON CLUB.CLUB_ID = PLAYER.CLUB_ID


-- Example 5
-- CROSS JOIN
-- Return every possible combination of clubs and countries.

SELECT CLUB_NAME, COUNTRY_NAME
FROM CLUB
CROSS JOIN COUNTRY


-- Example 6
-- SELF JOIN
-- Compare players from the same club.

SELECT P1.PLAYER_NAME,
       P2.PLAYER_NAME,
       P1.CLUB_ID
FROM PLAYER P1
INNER JOIN PLAYER P2
ON P1.CLUB_ID = P2.CLUB_ID
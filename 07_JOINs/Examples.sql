-- Example 1
-- Return only matching rows from PLAYERS and CLUBS.

SELECT PLAYER_NAME,
        CLUB_NAME
FROM PLAYERS PL
INNER JOIN CLUBS C
        ON PL.CLUB_ID = C.CLUB_ID


-- Example 2
-- Return all clubs, including clubs without players.

SELECT CLUB_NAME,
        PLAYER_NAME
FROM CLUBS C
LEFT OUTER JOIN PLAYERS PL
        ON C.CLUB_ID = PL.CLUB_ID


-- Example 3
-- Return all players, including players without clubs.

SELECT PLAYER_NAME,
        CLUB_NAME
FROM CLUBS C
RIGHT OUTER JOIN PLAYERS PL
        ON C.CLUB_ID = PL.CLUB_ID


-- Example 4
-- Return all clubs and all players, including unmatched rows.

SELECT CLUB_NAME,
        PLAYER_NAME
FROM CLUBS C
FULL OUTER JOIN PLAYERS PL
        ON C.CLUB_ID = PL.CLUB_ID


-- Example 5
-- Return every possible combination of clubs and countries.

SELECT CLUB_NAME,
        COUNTRY_NAME
FROM CLUBS
CROSS JOIN COUNTRIES


-- Example 6
-- Compare players from the same club.

SELECT P1.PLAYER_NAME,
        P2.PLAYER_NAME,
        P1.CLUB_ID
FROM PLAYERS P1
INNER JOIN PLAYERS P2
        ON P1.CLUB_ID = P2.CLUB_ID
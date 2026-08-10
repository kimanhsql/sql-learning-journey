/*
Think before writing SQL.

Ask yourself:

- Do I need to combine result sets?
- Do the SELECT statements return the same number of columns?
- Are the corresponding data types compatible?
- Should duplicate rows be removed?
- Should I use UNION or UNION ALL?
- Where should ORDER BY be applied?
*/


-- Example 1
-- Combine player names from PLAYER and coach names from COACH.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACH

GO


-- Example 2
-- Combine player names and coach names without removing duplicates.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION ALL

SELECT COACH_NAME AS PERSON_NAME
FROM COACH

GO


-- Example 3
-- Combine players from two different positions.

SELECT PLAYER_NAME,
        POSITION
FROM PLAYER
WHERE POSITION = 'Forward'

UNION

SELECT PLAYER_NAME,
        POSITION
FROM PLAYER
WHERE POSITION = 'Midfielder'

GO


-- Example 4
-- Combine players from two different clubs.

SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER
WHERE CLUB_ID = 1

UNION

SELECT PLAYER_NAME,
        CLUB_ID
FROM PLAYER
WHERE CLUB_ID = 2

GO


-- Example 5
-- Combine players from two countries.

SELECT PLAYER_NAME,
        COUNTRY_ID
FROM PLAYER
WHERE COUNTRY_ID = 1

UNION ALL

SELECT PLAYER_NAME,
        COUNTRY_ID
FROM PLAYER
WHERE COUNTRY_ID = 2

GO


-- Example 6
-- Sort the final UNION result.

SELECT PLAYER_NAME AS PERSON_NAME
FROM PLAYER

UNION

SELECT COACH_NAME AS PERSON_NAME
FROM COACH

ORDER BY PERSON_NAME

GO


-- Example 7
-- Use JOIN inside each SELECT.

SELECT PL.PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYER PL
INNER JOIN COUNTRY CT
ON PL.COUNTRY_ID = CT.COUNTRY_ID
WHERE CT.COUNTRY_ID = 1

UNION

SELECT PL.PLAYER_NAME,
        COUNTRY_NAME
FROM PLAYER PL
INNER JOIN COUNTRY CT
ON PL.COUNTRY_ID = CT.COUNTRY_ID
WHERE CT.COUNTRY_ID = 2

GO


-- Example 8
-- Compare UNION and UNION ALL.

SELECT CLUB_ID
FROM PLAYER

UNION

SELECT CLUB_ID
FROM PLAYER

GO

SELECT CLUB_ID
FROM PLAYER

UNION ALL

SELECT CLUB_ID
FROM PLAYER

GO
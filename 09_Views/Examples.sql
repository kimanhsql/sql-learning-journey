-- Example  1
-- Create a view that displays player names and jersey numbers.

CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER

GO


-- Example 2
-- Display all records from the view.

SELECT *
FROM V_PLAYER

GO


-- Example 3
-- Create a view that displays forwards only.

CREATE VIEW V_FORWARD
AS
SELECT PLAYER_NAME,
        POSITION
FROM PLAYER
WHERE POSITION = 'Forward'

GO


-- Example 4
-- Create a view that displays players with jersey numbers greater than 10.

CREATE VIEW V_PLAYER_NUMBER
AS
SELECT PLAYER_NAME,
        JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER > 10

GO


-- Example 5
-- Update data through a view.

UPDATE V_PLAYER
SET JERSEY_NUMBER = 30
WHERE PLAYER_NAME = 'Messi'

GO


-- Example 6
-- Modify an existing view.

ALTER VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
        POSITION,
        JERSEY_NUMBER
FROM PLAYER

GO


-- Example 7
-- Delete a view.

DROP VIEW V_PLAYER

GO
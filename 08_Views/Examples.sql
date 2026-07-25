-- Create a view that displays player names and jersey numbers.

CREATE VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
       JERSEY_NUMBER
FROM PLAYER

GO


-- Display all records from the view.

SELECT *
FROM V_PLAYER

GO


-- Create a view that displays forwards only.

CREATE VIEW V_FORWARD
AS
SELECT PLAYER_NAME,
       POSITION
FROM PLAYER
WHERE POSITION = 'Forward'

GO


-- Create a view that displays players with jersey numbers greater than 10.

CREATE VIEW V_PLAYER_NUMBER
AS
SELECT PLAYER_NAME,
       JERSEY_NUMBER
FROM PLAYER
WHERE JERSEY_NUMBER > 10

GO


-- Update data through a view.

UPDATE V_PLAYER
SET JERSEY_NUMBER = 30
WHERE PLAYER_NAME = 'Messi'

GO


-- Modify an existing view.

ALTER VIEW V_PLAYER
AS
SELECT PLAYER_NAME,
       POSITION,
       JERSEY_NUMBER
FROM PLAYER

GO


-- Delete a view.

DROP VIEW V_PLAYER

GO
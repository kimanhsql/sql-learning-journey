/*
Think before writing SQL.

Ask yourself:

- Do I need a transaction?
- Which SQL statements should belong to the same transaction?
- Should the changes be committed or rolled back?
- What happens if one operation fails?
- Do I want to keep or undo the changes?

Remember:

- BEGIN TRANSACTION starts a transaction.
- COMMIT TRANSACTION permanently saves the changes.
- ROLLBACK TRANSACTION undoes the changes made during the transaction.
- A transaction can contain one or more SQL statements.
- COMMIT should be used when all operations complete successfully.
- ROLLBACK should be used when the changes should be undone.
- Multiple INSERT, UPDATE, or DELETE statements can belong to
the same transaction.
*/


-- Exercise 1
-- Start a transaction and update a player's jersey number.
-- Commit the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 15
WHERE PLAYER_ID = 2

COMMIT TRANSACTION


-- Exercise 2
-- Start a transaction and update a player's position.
-- Roll back the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET POSITION = 'Midfielder'
WHERE PLAYER_ID = 8

ROLLBACK TRANSACTION


-- Exercise 3
-- Start a transaction and insert a new player.
-- Commit the transaction.

BEGIN TRANSACTION

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
    CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (11, 'John Doe', 'Forward', '1995-05-15', '123 Main St', 1, 1, 9)

COMMIT TRANSACTION


-- Exercise 4
-- Start a transaction and delete a player.
-- Roll back the transaction.

BEGIN TRANSACTION

DELETE FROM PLAYER
WHERE PLAYER_ID = 5

ROLLBACK TRANSACTION


-- Exercise 5
-- Start a transaction and update two different players.
-- Commit both changes.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 20
WHERE PLAYER_ID = 3

UPDATE PLAYER
SET JERSEY_NUMBER = 25
WHERE PLAYER_ID = 4

COMMIT TRANSACTION


-- Exercise 6
-- Start a transaction and update a player's jersey number.
-- Then roll back the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 22
WHERE PLAYER_ID = 1

ROLLBACK TRANSACTION


-- Exercise 7
-- Start a transaction and delete two players.
-- Roll back both deletions.

BEGIN TRANSACTION

DELETE FROM PLAYER
WHERE PLAYER_ID = 6

DELETE FROM PLAYER
WHERE PLAYER_ID = 7

ROLLBACK TRANSACTION


-- Exercise 8
-- Start a transaction and insert two players.
-- Commit both insertions.

BEGIN TRANSACTION

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
    CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (12, 'Alice Smith', 'Defender', '1998-03-22', '456 Oak St', 2, 1, 5),
    (13, 'Bob Johnson', 'Midfielder', '1997-07-10', '789 Pine St', 2, 1, 8)

COMMIT TRANSACTION


-- Exercise 9
-- Start a transaction and update a player's club.
-- Roll back the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET CLUB_ID = 3
WHERE PLAYER_ID = 9

ROLLBACK TRANSACTION


-- Exercise 10
-- Start a transaction and perform an UPDATE followed by a DELETE.
-- Roll back the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 30
WHERE PLAYER_ID = 10

DELETE FROM PLAYER
WHERE PLAYER_ID = 10

ROLLBACK TRANSACTION
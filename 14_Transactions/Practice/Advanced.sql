/*
Think before writing SQL.

Ask yourself:

Should multiple operations be treated as one unit of work?
Should I use a savepoint?
Where should the savepoint be created?
What should be committed?
What should be rolled back?
Should I use TRY...CATCH?
What should happen if an error occurs?

Remember:

- SAVE TRANSACTION creates a savepoint inside an active transaction.
- A savepoint does not end the transaction.
- ROLLBACK TRANSACTION savepoint_name rolls back only the changes made after the savepoint.
- Changes made before the savepoint remain part of the transaction.
- COMMIT TRANSACTION commits all remaining changes in the transaction.
- A transaction can contain multiple savepoints.
- TRY...CATCH can be used to handle errors inside a transaction.
- If an error occurs, ROLLBACK TRANSACTION can undo the entire transaction.
- @@TRANCOUNT returns the number of active transactions.
- XACT_STATE() indicates whether the current transaction is committable, uncommittable, or has no active transaction.
- Savepoints are useful when only part of a transaction should be rolled back.
- TRY...CATCH is useful when a transaction requires controlled error handling.
*/


-- Exercise 1
-- Start a transaction.
-- Update a player's jersey number.
-- Create a savepoint.
-- Update another player's jersey number.
-- Roll back to the savepoint.
-- Commit the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 10
WHERE PLAYER_ID = 3

SAVE TRANSACTION Savepoint1

UPDATE PLAYER
SET JERSEY_NUMBER = 11
WHERE PLAYER_ID = 4

ROLLBACK TRANSACTION Savepoint1

COMMIT TRANSACTION


-- Exercise 2
-- Start a transaction.
-- Insert a new player.
-- Create a savepoint.
-- Update an existing player.
-- Roll back to the savepoint.
-- Commit the transaction.

BEGIN TRANSACTION

INSERT INTO PLAYER
(PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS, CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
(19, 'Charlie Brown', 'Forward', '1996-08-12', '321 Elm St', 3, 1, 7)

SAVE TRANSACTION Savepoint2

UPDATE PLAYER
SET JERSEY_NUMBER = 12
WHERE PLAYER_ID = 5

ROLLBACK TRANSACTION Savepoint2

COMMIT TRANSACTION


-- Exercise 3
-- Start a transaction.
-- Update two players.
-- Create a savepoint between the two updates.
-- Roll back to the savepoint.
-- Commit the transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 14
WHERE PLAYER_ID = 6

SAVE TRANSACTION Savepoint3

UPDATE PLAYER
SET JERSEY_NUMBER = 15
WHERE PLAYER_ID = 7

ROLLBACK TRANSACTION Savepoint3

COMMIT TRANSACTION


-- Exercise 4
-- Use TRY...CATCH with a transaction.
-- Update a player's jersey number.
-- Commit the transaction if no error occurs.
-- Roll back the transaction if an error occurs.

BEGIN TRY
BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 16
WHERE PLAYER_ID = 8

COMMIT TRANSACTION

END TRY

BEGIN CATCH
IF XACT_STATE() <> 0
ROLLBACK TRANSACTION
END CATCH


-- Exercise 5
-- Use TRY...CATCH with a transaction.
-- Insert a new player and update an existing player.
-- Commit both operations if successful.
-- Roll back both operations if an error occurs.

BEGIN TRY
BEGIN TRANSACTION

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS, CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (20, 'David Green', 'Midfielder', '1994-11-05', '654 Maple St', 4, 1, 6)

UPDATE PLAYER
SET JERSEY_NUMBER = 17
WHERE PLAYER_ID = 9

COMMIT TRANSACTION

END TRY

BEGIN CATCH
IF XACT_STATE() <> 0
ROLLBACK TRANSACTION
END CATCH


-- Exercise 6
-- Start a transaction that performs multiple UPDATE operations.
-- Create a savepoint after the first UPDATE.
-- Roll back to the savepoint after the second UPDATE.
-- Commit the remaining transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 18
WHERE PLAYER_ID = 10

SAVE TRANSACTION Savepoint4

UPDATE PLAYER
SET JERSEY_NUMBER = 19
WHERE PLAYER_ID = 11

ROLLBACK TRANSACTION Savepoint4

COMMIT TRANSACTION


-- Exercise 7
-- Create a transaction that performs an INSERT and DELETE.
-- Use TRY...CATCH to handle possible errors.

BEGIN TRY
BEGIN TRANSACTION

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS, CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (21, 'Eve White', 'Defender', '1993-02-20', '987 Cedar St', 5, 1, 5)

DELETE FROM PLAYER
WHERE PLAYER_ID = 12

COMMIT TRANSACTION

END TRY

BEGIN CATCH
IF XACT_STATE() <> 0
ROLLBACK TRANSACTION
END CATCH


-- Exercise 8
-- Create a transaction that updates multiple players.
-- Use a savepoint so that only the later changes can be rolled back.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 20
WHERE PLAYER_ID = 13

UPDATE PLAYER
SET JERSEY_NUMBER = 22
WHERE PLAYER_ID = 5

UPDATE PLAYER
SET JERSEY_NUMBER = 17
WHERE PLAYER_ID = 4

SAVE TRANSACTION Savepoint5

UPDATE PLAYER
SET JERSEY_NUMBER = 21
WHERE PLAYER_ID = 14

ROLLBACK TRANSACTION Savepoint5

COMMIT TRANSACTION


-- Exercise 9
-- Create a transaction that performs multiple operations on PLAYER.
-- If an error occurs, roll back the transaction using TRY...CATCH.

BEGIN TRY
BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 23
WHERE PLAYER_ID = 15

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS, CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (22, 'Frank Black', 'Goalkeeper', '1992-07-15', '123 Birch St', 6, 1, 1)

DELETE FROM PLAYER
WHERE PLAYER_ID = 16

COMMIT TRANSACTION

END TRY

BEGIN CATCH
IF XACT_STATE() <> 0
ROLLBACK TRANSACTION
END CATCH


-- Exercise 10
-- Create a transaction that performs multiple operations.
-- Use a savepoint to partially roll back the transaction,
-- then commit the remaining changes.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 24
WHERE PLAYER_ID = 17

INSERT INTO PLAYER
(PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS, CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
(23, 'Grace Blue', 'Midfielder', '1995-03-10', '456 Pine St', 7, 1, 8)

UPDATE PLAYER
SET JERSEY_NUMBER = 26
WHERE PLAYER_ID = 18

SAVE TRANSACTION Savepoint6

UPDATE PLAYER
SET JERSEY_NUMBER = 25
WHERE PLAYER_ID = 18

ROLLBACK TRANSACTION Savepoint6

COMMIT TRANSACTION
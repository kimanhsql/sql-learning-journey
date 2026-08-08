/*
Think before writing SQL.

Ask yourself:

- Do I need to handle errors inside the transaction?
- Should I use TRY...CATCH?
- What should happen when an error occurs?
- Do I need a savepoint for a partial rollback?
- Should the entire transaction be rolled back or only part of it?
- How can I check the transaction state?
- How many active transactions are currently open?

Remember:

- TRY...CATCH can be used to handle errors during a transaction.
- ROLLBACK TRANSACTION can undo the entire transaction.
- SAVE TRANSACTION creates a savepoint inside an active transaction.
- ROLLBACK TRANSACTION savepoint_name rolls back only to the specified savepoint.
- COMMIT TRANSACTION commits the remaining changes in the transaction.
- A savepoint does not end the transaction.
- A transaction can contain multiple savepoints.
- @@TRANCOUNT returns the number of active transactions.
- XACT_STATE() indicates whether the current transaction is committable, uncommittable, or has no active transaction.
- TRY...CATCH should be used when a transaction needs controlled error handling.
*/


-- Exercise 1
-- Create a transaction that updates the jersey numbers of
-- two players and commits both changes.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 20
WHERE PLAYER_ID = 1

UPDATE PLAYER
SET JERSEY_NUMBER = 21
WHERE PLAYER_ID = 2

COMMIT TRANSACTION


-- Exercise 2
-- Create a transaction that updates a player's club and jersey number.
-- Roll back both changes.

BEGIN TRANSACTION

UPDATE PLAYER
SET CLUB_ID = 2
WHERE PLAYER_ID = 3

UPDATE PLAYER
SET JERSEY_NUMBER = 18
WHERE PLAYER_ID = 3

ROLLBACK TRANSACTION


-- Exercise 3
-- Create a transaction that inserts a new player and updates an existing player.
-- Use TRY...CATCH to handle errors.

BEGIN TRY
    BEGIN TRANSACTION

    INSERT INTO PLAYER
        (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
        CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
    VALUES
        (14, 'David Lee', 'Goalkeeper', '1994-11-30', '987 Maple St', 3, 1, 1)

    UPDATE PLAYER
    SET JERSEY_NUMBER = 17
    WHERE PLAYER_ID = 4

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH


-- Exercise 4
-- Create a transaction with three UPDATE operations.
-- Create a savepoint after the first operation.
-- Roll back the changes made after the savepoint.
-- Commit the remaining transaction.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 23
WHERE PLAYER_ID = 5

SAVE TRANSACTION Savepoint4

UPDATE PLAYER
SET JERSEY_NUMBER = 24
WHERE PLAYER_ID = 6

UPDATE PLAYER
SET JERSEY_NUMBER = 25
WHERE PLAYER_ID = 7

ROLLBACK TRANSACTION Savepoint4

COMMIT TRANSACTION


-- Exercise 5
-- Create a transaction that inserts two players.
-- If an error occurs, roll back both insertions.

BEGIN TRY
    BEGIN TRANSACTION

    INSERT INTO PLAYER
        (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
        CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
    VALUES
        (15, 'Emma Brown', 'Forward', '1996-02-14', '321 Birch St', 4, 1, 10),
        (16, 'Liam Wilson', 'Midfielder', '1995-08-20', '654 Cedar St', 4, 1, 11)

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH


-- Exercise 6
-- Create a transaction that deletes two players.
-- Use TRY...CATCH to handle possible errors.
-- Roll back the transaction if an error occurs.

BEGIN TRY
    BEGIN TRANSACTION

    DELETE FROM PLAYER
    WHERE PLAYER_ID = 8

    DELETE FROM PLAYER
    WHERE PLAYER_ID = 9

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH


-- Exercise 7
-- Create a transaction that updates multiple players.
-- Create a savepoint between the updates.
-- Roll back only the changes made after the savepoint.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 30
WHERE PLAYER_ID = 10

SAVE TRANSACTION Savepoint7

UPDATE PLAYER
SET JERSEY_NUMBER = 31
WHERE PLAYER_ID = 11

UPDATE PLAYER
SET JERSEY_NUMBER = 32
WHERE PLAYER_ID = 12

ROLLBACK TRANSACTION Savepoint7

COMMIT TRANSACTION


-- Exercise 8
-- Create a transaction that performs an INSERT, an UPDATE, and a DELETE.
-- Commit all operations if they succeed.

BEGIN TRANSACTION

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, POSITION, BIRTH_DATE, ADDRESS,
    CLUB_ID, COUNTRY_ID, JERSEY_NUMBER)
VALUES
    (17, 'Olivia Davis', 'Defender', '1997-05-10', '789 Elm St', 5, 1, 4)

UPDATE PLAYER
SET JERSEY_NUMBER = 33
WHERE PLAYER_ID = 13

DELETE FROM PLAYER
WHERE PLAYER_ID = 14

COMMIT TRANSACTION


-- Exercise 9
-- Create a transaction that performs multiple operations on PLAYER.
-- Use TRY...CATCH and roll back the entire transaction if any error occurs.

BEGIN TRY
    BEGIN TRANSACTION

    UPDATE PLAYER
    SET JERSEY_NUMBER = 33
    WHERE PLAYER_ID = 13

    DELETE FROM PLAYER
    WHERE PLAYER_ID = 14

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH


-- Exercise 10
-- Create a transaction that performs several operations.
-- Use a savepoint to partially roll back the transaction while keeping the earlier changes.

BEGIN TRANSACTION

UPDATE PLAYER
SET JERSEY_NUMBER = 33
WHERE PLAYER_ID = 13

SAVE TRANSACTION Savepoint8

DELETE FROM PLAYER
WHERE PLAYER_ID = 14

DELETE FROM PLAYER
WHERE PLAYER_ID = 22

ROLLBACK TRANSACTION Savepoint8

COMMIT TRANSACTION
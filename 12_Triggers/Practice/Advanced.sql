/*
Think before writing SQL.

Ask yourself:

- Should the trigger validate data?
- Should I use inserted or deleted?
- Can multiple rows be affected?
- Will this trigger prevent an operation?
- Will it affect database performance?

Analyze the trigger logic before writing SQL.
*/


-- Exercise 1
-- Prevent inserting players whose jersey number is less than 1.







-- Exercise 2
-- Prevent updating PLAYER_NAME to NULL.







-- Exercise 3
-- Prevent deleting Goalkeepers.







-- Exercise 4
-- Display all inserted rows after inserting multiple players.







-- Exercise 5
-- Display all deleted rows after deleting multiple players.







-- Exercise 6
-- Prevent changing CLUB_ID after a player is created.







-- Exercise 7
-- Prevent duplicate jersey numbers within the same club.







-- Exercise 8
-- Prevent updating a player's birth date to a future date.







-- Exercise 9
-- Prevent deleting clubs that still have players.







-- Exercise 10
-- Display the old and new values whenever a player's position changes.







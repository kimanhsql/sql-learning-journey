/*
Think before writing SQL.

Ask yourself:

- What task should the stored procedure perform?
- Which SQL statements are required?
- Do I need parameters?
- Should I use JOIN, GROUP BY, HAVING, or a subquery?
- Can I divide the problem into smaller SQL queries first?
- Is the procedure reusable for different inputs?

Remember:

- Focus on solving the SQL problem first.
- Then place the SQL inside the stored procedure.
- Test the SQL before creating the procedure.
- Keep the procedure reusable and easy to maintain.
*/


-- Challenge 1
-- Create a stored procedure that displays the top N players
-- with the highest jersey numbers.

CREATE PROCEDURE prd_top_n_players(IN top_n INT)
BEGIN
    SELECT PLAYER_NAME,
            JERSEY_NUMBER
    FROM PLAYER
    
END



-- Challenge 2
-- Create a stored procedure that searches players by a keyword in their names.





-- Challenge 3
-- Create a stored procedure that displays the number of players in each country,
-- sorted from highest to lowest.





-- Challenge 4
-- Create a stored procedure that displays clubs
-- whose average jersey number is greater than a given value.





-- Challenge 5
-- Create a stored procedure that displays all players
-- belonging to clubs located in a given stadium.


-- Challenge 6
-- Create a stored procedure that displays players
-- whose jersey number is greater than the average jersey number.



-- Challenge 7
-- Create a stored procedure that displays
-- the oldest player in each club.


-- Challenge 8
-- Create a stored procedure that displays
-- the number of players in each position
-- whose total players are greater than a given value.


-- Challenge 9
-- Create a stored procedure that displays
-- all coaches together with the clubs they manage.


-- Challenge 10
-- Create a stored procedure that displays
-- the club having the highest average jersey number
-- together with its stadium name.

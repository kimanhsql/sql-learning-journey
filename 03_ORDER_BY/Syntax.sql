-- Basic ORDER BY

SELECT column_name
FROM table_name
ORDER BY column_name


-- Ascending Order

SELECT column_name
FROM table_name
ORDER BY column_name ASC


-- Descending Order

SELECT column_name
FROM table_name
ORDER BY column_name DESC


-- Multiple Columns

SELECT column1, column2
FROM table_name
ORDER BY column1 ASC,
        column2 DESC


-- Order by Alias

SELECT column_name AS alias_name
FROM table_name
ORDER BY alias_name


-- Order by Column Position

SELECT column1, column2
FROM table_name
ORDER BY 1
-- Basic SYNTAX

SELECT column_name,
       aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition


-- HAVING with COUNT

SELECT column_name,
       COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > value


-- HAVING with SUM

SELECT column_name,
       SUM(column_name)
FROM table_name
GROUP BY column_name
HAVING SUM(column_name) > value


-- HAVING with AVG

SELECT column_name,
       AVG(column_name)
FROM table_name
GROUP BY column_name
HAVING AVG(column_name) >= value


-- HAVING with MIN

SELECT column_name,
       MIN(column_name)
FROM table_name
GROUP BY column_name
HAVING MIN(column_name) >= value


-- HAVING with MAX

SELECT column_name,
       MAX(column_name)
FROM table_name
GROUP BY column_name
HAVING MAX(column_name) <= value
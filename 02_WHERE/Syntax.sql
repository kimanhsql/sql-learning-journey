-- Basic WHERE

SELECT column_name
FROM table_name
WHERE condition


-- Comparison Operators

SELECT column_name
FROM table_name
WHERE column_name = value

SELECT column_name
FROM table_name
WHERE column_name <> value

SELECT column_name
FROM table_name
WHERE column_name > value

SELECT column_name
FROM table_name
WHERE column_name >= value

SELECT column_name
FROM table_name
WHERE column_name < value

SELECT column_name
FROM table_name
WHERE column_name <= value


-- AND

SELECT column_name
FROM table_name
WHERE condition1
    AND condition2


-- OR

SELECT column_name
FROM table_name
WHERE condition1
    OR condition2


-- NOT

SELECT column_name
FROM table_name
WHERE NOT condition


-- BETWEEN

SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2


-- IN

SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, value3)


-- LIKE

SELECT column_name
FROM table_name
WHERE column_name LIKE pattern


-- IS NULL

SELECT column_name
FROM table_name
WHERE column_name IS NULL


-- IS NOT NULL

SELECT column_name
FROM table_name
WHERE column_name IS NOT NULL
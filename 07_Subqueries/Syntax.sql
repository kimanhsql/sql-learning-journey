-- Subquery in WHERE clause (Single-row Subquery)

SELECT column_name
FROM table_name
WHERE column_name operator
(
    SELECT column_name
    FROM table_name
)


-- Subquery in WHERE clause (Multiple-row Subquery)

SELECT column_name
FROM table_name
WHERE column_name IN
(
    SELECT column_name
    FROM table_name
)


-- Subquery in FROM clause

SELECT column_name
FROM
(
    SELECT column_name
    FROM table_name
) AS alias_name


-- Subquery in SELECT clause

SELECT column_name,
(
    SELECT aggregate_function(column_name)
    FROM table_name
) AS alias_name
FROM table_name
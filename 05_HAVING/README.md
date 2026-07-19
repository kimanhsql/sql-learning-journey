# HAVING Clause

## Overview

The `HAVING` clause filters groups based on specified conditions.

Both `WHERE` and `HAVING` filter data, but only `HAVING` can filter aggregated results.

Aggregate functions cannot be used in the `WHERE` clause because filtering occurs before grouping.

The `WHERE` clause filters individual rows before grouping.

The `HAVING` clause is commonly used with aggregate functions such as COUNT(), SUM(), AVG(), MIN(), and MAX().

The `HAVING` clause is optional. However, it can only be used after the GROUP BY clause when filtering grouped data.

The `HAVING` clause comes after the GROUP BY clause because SQL must create the groups before filtering them.



## Topics

- Basic HAVING
- HAVING with COUNT
- HAVING with SUM
- HAVING with AVG
- HAVING with MIN and MAX
- HAVING with WHERE
- HAVING with ORDER BY

## Learning Outcome

After completing this module, I will understand how to group data using the `GROUP BY` clause and filter grouped results using the `HAVING` clause.
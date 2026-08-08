-- Example 1
-- Creating a Database.

CREATE DATABASE SchoolDB
GO

USE SchoolDB
GO


-- Example 2
-- Creating a Table.

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    BirthDate DATE
)
GO
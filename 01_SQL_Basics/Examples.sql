-- Create a database

CREATE DATABASE StudentManagement;
GO

-- Use a database

USE StudentManagement;
GO

-- Create a simple table

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Age INT
);
GO
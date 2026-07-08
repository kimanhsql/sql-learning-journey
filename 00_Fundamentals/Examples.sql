/*==========================================
Creating a Database
==========================================*/

CREATE DATABASE SchoolDB;
GO

USE SchoolDB;
GO

/*******************************************
Creating a Table
*******************************************/

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    BirthDate DATE
);
GO
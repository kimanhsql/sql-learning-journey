/*
    Project: Teaching Management System
    Database: TeachingManagement

    This file creates the tables, primary keys,
    and foreign keys required by the QLGiangDay exercise.
*/

USE TeachingManagement;
GO


-- ============================================================
-- Requirement 2
-- Create the Department table.
-- Original table: KHOA
-- ============================================================

CREATE TABLE Departments
(
    DepartmentID VARCHAR(5),
    DepartmentName VARCHAR(200) NOT NULL,

    CONSTRAINT PK_Departments
        PRIMARY KEY (DepartmentID)
);
GO


-- ============================================================
-- Create the Teacher table.
-- Original table: GIAOVIEN
-- ============================================================

CREATE TABLE Teachers
(
    TeacherID VARCHAR(5),
    FullName VARCHAR(100) NOT NULL,
    DepartmentID VARCHAR(5) NOT NULL,

    CONSTRAINT PK_Teachers
        PRIMARY KEY (TeacherID),

    CONSTRAINT FK_Departments_Teachers
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);
GO


-- ============================================================
-- Create the Subject table.
-- Original table: MONHOC
-- ============================================================

CREATE TABLE Subjects
(
    SubjectID VARCHAR(20),
    SubjectName VARCHAR(200) NOT NULL,

    CONSTRAINT PK_Subjects
        PRIMARY KEY (SubjectID)
);
GO


-- ============================================================
-- Create the Classroom table.
-- Original table: PHONGHOC
-- ============================================================

CREATE TABLE Classrooms
(
    ClassroomID VARCHAR(5),
    FunctionDescription VARCHAR(200),

    CONSTRAINT PK_Classrooms
        PRIMARY KEY (ClassroomID)
);
GO


-- ============================================================
-- Create the Class table.
-- Original table: LOP
-- ============================================================

CREATE TABLE Classes
(
    ClassID VARCHAR(5),
    ClassName VARCHAR(200) NOT NULL,
    DepartmentID VARCHAR(5) NOT NULL,

    CONSTRAINT PK_Classes
        PRIMARY KEY (ClassID),

    CONSTRAINT FK_Departments_Classes
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);
GO


-- ============================================================
-- Create the TeachingSchedule table.
-- Original table: LICHDAY
-- ============================================================

CREATE TABLE TeachingSchedule
(
    TeacherID VARCHAR(5),
    SubjectID VARCHAR(20),
    ClassroomID VARCHAR(5),
    ClassID VARCHAR(5),
    TeachingDate DATETIME,
    StartPeriod INT,
    EndPeriod INT,
    Lesson VARCHAR(200),
    Theory VARCHAR(200),
    Notes VARCHAR(200),

    CONSTRAINT PK_TeachingSchedule
        PRIMARY KEY (TeacherID, SubjectID, ClassroomID, ClassID),

    CONSTRAINT FK_Teachers_TeachingSchedule
        FOREIGN KEY (TeacherID)
        REFERENCES Teachers(TeacherID),

    CONSTRAINT FK_Subjects_TeachingSchedule
        FOREIGN KEY (SubjectID)
        REFERENCES Subjects(SubjectID),

    CONSTRAINT FK_Classrooms_TeachingSchedule
        FOREIGN KEY (ClassroomID)
        REFERENCES Classrooms(ClassroomID),

    CONSTRAINT FK_Classes_TeachingSchedule
        FOREIGN KEY (ClassID)
        REFERENCES Classes(ClassID)
);
GO
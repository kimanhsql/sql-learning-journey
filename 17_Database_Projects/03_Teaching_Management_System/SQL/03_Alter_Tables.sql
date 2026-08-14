/*
    Project: Teaching Management System

    This file modifies the existing tables by adding
    new columns and integrity constraints.

    Source:
    QLGiangDay exercise - Page 100
*/

USE TeachingManagement;
GO


-- ============================================================
-- Requirement 4
-- Add date of birth, gender, and age to the Teachers table.
-- Original table: GIAOVIEN
-- ============================================================

ALTER TABLE Teachers
    ADD BirthDate DATE;
GO

ALTER TABLE Teachers
    ADD Gender VARCHAR(3);
GO

ALTER TABLE Teachers
    ADD Age INT;
GO


-- Add an integrity constraint for teacher age.
ALTER TABLE Teachers
    ADD CONSTRAINT CHK_Teachers_Age
        CHECK (Age BETWEEN 22 AND 67);
GO


-- ============================================================
-- Requirement 5
-- Add classroom capacity to the Classrooms table.
-- Original table: PHONGHOC
-- ============================================================

ALTER TABLE Classrooms
    ADD Capacity INT;
GO

ALTER TABLE Classrooms
    ADD CONSTRAINT CHK_Classrooms_Capacity
        CHECK (Capacity > 0);
GO


-- ============================================================
-- Requirement 6
-- Add credit-related columns to the Subjects table.
-- Original table: MONHOC
-- ============================================================

ALTER TABLE Subjects
    ADD TotalCredits INT;
GO

ALTER TABLE Subjects
    ADD TheoryCredits INT;
GO

ALTER TABLE Subjects
    ADD PracticalCredits INT;
GO


-- Validate the total number of credits.
ALTER TABLE Subjects
    ADD CONSTRAINT CHK_Subjects_TotalCredits
        CHECK (TotalCredits BETWEEN 1 AND 4);
GO

ALTER TABLE Subjects
    ADD CONSTRAINT CHK_Subjects_TheoryCredits
        CHECK (TheoryCredits BETWEEN 0 AND 4);
GO

ALTER TABLE Subjects
    ADD CONSTRAINT CHK_Subjects_PracticalCredits
        CHECK (PracticalCredits BETWEEN 0 AND 4);
GO

ALTER TABLE Subjects
    ADD CONSTRAINT CHK_Subjects_CreditTotal
        CHECK (TotalCredits = TheoryCredits + PracticalCredits);
GO


-- ============================================================
-- Requirement 7
-- Add class size to the Classes table.
-- Original table: LOP
-- ============================================================

ALTER TABLE Classes
    ADD ClassSize INT;
GO

ALTER TABLE Classes
    ADD CONSTRAINT CHK_Classes_ClassSize
        CHECK (ClassSize > 0);
GO


-- ============================================================
-- Requirement 8
-- Integrity constraints required for:
-- ClassSize
-- TotalCredits
-- TheoryCredits
-- PracticalCredits
-- Capacity
-- Age
-- ============================================================

-- The constraints for these columns were created
-- together with the corresponding ALTER TABLE statements above.
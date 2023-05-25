CREATE DATABASE [EntityRelations]

-- 01
CREATE TABLE [Passports]
(
    [PassportID] INT PRIMARY KEY IDENTITY(101, 1),
    [PassportNumber] VARCHAR(8) NOT NULL
)

CREATE TABLE [Persons]
(
    [PersonID] INT PRIMARY KEY IDENTITY,
    [FirstName] VARCHAR(50) NOT NULL,
    [Salary] DECIMAL(8,2) NOT NULL,
    [PassportID] INT FOREIGN KEY REFERENCES [Passports](PassportID) UNIQUE NOT NULL
)

INSERT INTO [Passports]
    (PassportNumber)
VALUES
    ('N34FG21B'),
    ('K65LO4R7'),
    ('ZE657QP2')

INSERT INTO [Persons]
    ([FirstName], [Salary], [PassportID])
VALUES
    ('Roberto', 43300.00, 102),
    ('Tom', 56100.00, 103),
    ('Yana', 60200.00, 101)

-- 02

CREATE TABLE [Manufacturers]
(
    [ManufacturerID] INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
    [EstablishedOn] DATETIME2 NOT NULL
)

CREATE TABLE [Models]
(
    [ModelID] INT PRIMARY KEY IDENTITY(101, 1),
    [Name] VARCHAR(50) NOT NULL,
    [ManufacturerID] INT FOREIGN KEY REFERENCES [Manufacturers](ManufacturerID) NOT NULL
)

-- 03
CREATE TABLE [Students]
(
    [StudentID] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Exams]
(
    [ExamID] INT PRIMARY KEY IDENTITY(101, 1),
    [Name] NVARCHAR(100) NOT NULL
)

CREATE TABLE [StudentsExams]
(
    [StudentID] INT FOREIGN KEY REFERENCES [Students]([StudentID]),
    [ExamID] INT FOREIGN KEY REFERENCES [Exams]([ExamID]),
    PRIMARY KEY ([StudentID], [ExamID])
)

-- 04
CREATE TABLE [Teachers]
(
    [TeacherID] INT PRIMARY KEY IDENTITY(101,1),
    [Name] VARCHAR(100) NOT NULL,
    [ManagerID] INT FOREIGN KEY REFERENCES [Teachers]([TeacherID]) NOT NULL
)

-- 05
CREATE DATABASE [OnlineStoreDatabase]

CREATE TABLE [Cities]
(
    [CityID] INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE [Customers]
(
    [CustomerID] INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
    [Birthday] DATETIME2 NOT NULL,
    [CityID] INT FOREIGN KEY REFERENCES [Cities]([CityID]) NOT NULL
)

CREATE TABLE [Orders]
(
    [OrderID] INT PRIMARY KEY IDENTITY,
    [CustomerID] INT FOREIGN KEY REFERENCES [Customers]([CustomerID]) NOT NULL
)

CREATE TABLE [ItemTypes]
(
    [ItemTypeID] INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE [Items]
(
    [ItemID] INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
    [ItemTypeID] INT FOREIGN KEY REFERENCES [ItemTypes]([ItemTypeID]) NOT NULL
)

CREATE TABLE [OrderItems]
(
    [OrderID] INT FOREIGN KEY REFERENCES [Orders]([OrderID]),
    [ItemID] INT FOREIGN KEY REFERENCES [Items]([ItemID]),
    PRIMARY KEY ([OrderID], [ItemID])
)

-- 06
CREATE DATABASE [UniversityDatabase]

CREATE TABLE [Majors]
(
    [MajorID] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Students]
(
    [StudentID] INT PRIMARY KEY IDENTITY,
    [StudentNumber] VARCHAR(50) NOT NULL,
    [StudentName] VARCHAR(50) NOT NULL,
    [MajorID] INT FOREIGN KEY REFERENCES [Majors]([MajorID]) NOT NULL
)

CREATE TABLE [Subjects]
(
    [SubjectID] INT PRIMARY KEY IDENTITY,
    [SubjectName] VARCHAR(50) NOT NULL
)

CREATE TABLE [Agenda]
(
    [StudentID] INT FOREIGN KEY REFERENCES [Students]([StudentID]),
    [SubjectID] INT FOREIGN KEY REFERENCES [Subjects]([SubjectID]),
    PRIMARY KEY ([StudentID], [SubjectID])
)

CREATE TABLE [Payments]
(
    [PaymentID] INT PRIMARY KEY IDENTITY,
    [PaymentDate] DATETIME2 NOT NULL,
    [PaymentAmount] DECIMAL (8,2) NOT NULL,
    [StudentID] INT FOREIGN KEY REFERENCES [Students]([StudentID]) NOT NULL
)

-- 09
  SELECT p.PeakName, p.Elevation
    FROM [Mountains] AS m
    JOIN [Peaks] AS p ON  p.MountainId = m.Id
   WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC
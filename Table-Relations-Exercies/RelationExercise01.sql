CREATE DATABASE TableRelations


-- One-to-One relation.
--Create two tables as follows. Use appropriate data types.

--Insert the data from the example above.
--Alter the customers table and make PersonID a primary key. 
--Create a foreign key between Persons and Passports by using PassportID column.
CREATE TABLE Passports
(
  PassportID INT PRIMARY KEY,
  PassportNumber VARCHAR(8),
)

CREATE TABLE Persons
(
   PersonID INT IDENTITY PRIMARY KEY,
   FirstName VARCHAR(50),
   Salary DECIMAL(18,2),
   PassportID INT REFERENCES Passports(PassportID)
)




INSERT INTO Passports(PassportID,PassportNumber) VALUES
(101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2')


INSERT INTO Persons(FirstName,Salary,PassportID) VALUES
('Roberto',43300.00,102),
('Tom',56100.00,103),
('Yana',60200.00,101)



ALTER TABLE Persons
ADD UNIQUE (PassportID);

--One-To-Many Relationship

-- Create two tables as follows. Use appropriate data types.
-- Insert the data from the example above. Add primary keys and foreign keys.
CREATE TABLE Manufacturers
(
   ManufacturerID INT PRIMARY KEY,
   [Name] VARCHAR(50),
   EstablishedOn DATE,
)

INSERT INTO Manufacturers(ManufacturerID,Name,EstablishedOn) VALUES
(1,'BMW','07/03/1916'),
(2,'Tesla','01/01/2003'),
(3,'Lada','01/05/1966')

CREATE TABLE Models
(
   ModelID INT PRIMARY KEY,
   [Name] VARCHAR(50),
   ManufacturerID INT REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models(ModelID,Name,ManufacturerID) VALUES
(101,'X1',1),
(102,'I6',1),
(103, 'Model S',2),
(104, 'Model x',2),
(105, 'Model 3',2),
(106,'Nova', 3)

-- Many-To-Many Relationship

CREATE TABLE Students
(
   StudentID INT PRIMARY KEY,
   [Name]  VARCHAR(50),
)
INSERT INTO Students(StudentID,Name) VALUES
(1,'Mila'),
(2, 'Toni'),
(3, 'Ron')

CREATE TABLE Exams 
(
  ExamID INT PRIMARY KEY, 
  [Name] VARCHAR(50),
)

INSERT INTO Exams(ExamID,Name) VALUES 
(101,'SpringMVC'),
(102,'Neo4j'),
(103,'Oracle 11g')

CREATE TABLE StudentsExams
(
  StudentID INT REFERENCES Students(StudentID),
  ExamID INT REFERENCES Exams(ExamID),
  CONSTRAINT PK_StudentID_ExamID 
  PRIMARY KEY (StudentID,ExamID)
)

INSERT INTO StudentsExams(StudentID,ExamID) VALUES
(1,	101),
(1,	102),
(2,	101),
(3,	103),
(2,	102),
(2,	103)


--Self-Referencing 

CREATE TABLE Teachers
(
  TeacherID INT PRIMARY KEY,
  Name VARCHAR(50),
  ManagerID INT REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers(TeacherID,Name,ManagerID) VALUES 
(101,'John',NULL),
(102,'Maya',106),
(103,'Silvia',106),
(104,'Ted',105),
(105,'Mark',101),
(106,'Greta',101)

--Display all peaks for "Rila" mountain. Include:
--•	MountainRange
--•	PeakName
--•	Elevation
--Peaks should be sorted by elevation descending


SELECT m.MountainRange, p.PeakName, p.Elevation
FROM Peaks AS p
JOIN Mountains m ON p.MountainId = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC





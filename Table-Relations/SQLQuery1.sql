CREATE DATABASE CourseText
-- Creating tables, and making realations

CREATE TABLE Students
(
  Id INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(50),
  FacultyNumber VARCHAR(50),
  Photo VARCHAR(MAX),
  EnterDate DATETIME,
  
)

CREATE TABLE Towns
(
  Id INT PRIMARY KEY IDENTITY,
  TownName VARCHAR(10)
)
--Making a One-to-Many realation 
CREATE TABLE Course 
(
  Id INT IDENTITY PRIMARY KEY,
  CouseName VARCHAR(50) NOT NULL,
  TownId INT  REFERENCES Towns(Id),
)

--Many-to-Many realation
CREATE TABLE StudentsCourses
(
  CourseId INT REFERENCES Course(Id),
  StudentId INT REFERENCES Students(Id),
  Mark DECIMAL(2,2),
  CONSTRAINT PK_CourseId_StudentId
  PRIMARY KEY (CourseId,StudentId),
)

--One-to-One realation (CAR - DRIVER) and CASCADE delete.
CREATE TABLE CAR 
(
  CarId INT PRIMARY KEY,
)



CREATE TABLE Driver 
(
   DriverId INT PRIMARY KEY,
   CarId INT UNIQUE REFERENCES CAR(CarId) ON DELETE CASCADE
)


--Basic JOIN, we get all the informations that we need from the realations.
SELECT Course.CouseName, Towns.TownName FROM Course
    JOIN Towns ON Course.TownId = Towns.Id 

SELECT s.FirstName, c.CouseName , t.TownName
    FROM StudentsCourses AS sc
	JOIN Course c ON sc.CourseId = c.Id
	JOIN Students s ON sc.StudentId = s.Id
	JOIN Towns t ON c.TownId = t.Id



--Dropoing tables for practice. 
DROP TABLE Course

DROP TABLE Students

DROP TABLE towns

DROP TABLE StudentsCourses


 
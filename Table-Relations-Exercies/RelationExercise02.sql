--University Database
-- Create a new database and design the following structure:
CREATE DATABASE University 


CREATE TABLE Majors
(
 MajorsID INT PRIMARY KEY,
 [Name] VARCHAR(50),
)


CREATE TABLE Students
(
  StudentID INT PRIMARY KEY,
  StudentNumber INT,
  StudentName VARCHAR(50),
  MajorsID INT REFERENCES Majors(MajorsID)

)

CREATE TABLE Subjects
(
  SubjectID INT PRIMARY KEY,
  SubjectName VARCHAR(50),
)

CREATE TABLE Agenda
(
  StudentID INT REFERENCES  Students(StudentID),
  SubjectID INT REFERENCES Subjects(SubjectID),
  CONSTRAINT PK_Students_Subjects
  PRIMARY KEY (StudentID,SubjectID)
)


CREATE TABLE Payments
(
  PaymentID INT PRIMARY KEY,
  PaymentDate DATE,
  PaymentAmount DECIMAL(18,2),
  StudentID INT REFERENCES  Students(StudentID)

)
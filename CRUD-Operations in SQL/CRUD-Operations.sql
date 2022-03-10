SELECT FirstName + ' ' + LastName AS [Full Name], JobTitle, Salary FROM Employees


SELECT DISTINCT  DepartmentID FROM Employees


SELECT LastName, DepartmentID 
   FROM Employees
   WHERE DepartmentID = 1

   
SELECT LastName, DepartmentID
   FROM Employees
   WHERE NOT (DepartmentID = 3 OR DepartmentID = 4)

SELECT FirstName, Salary 
   FROM Employees
   WHERE Salary BETWEEN 2000 AND 22000


SELECT FirstName, Salary , ManagerID 
   FROM Employees
   WHERE ManagerID IN (109,3,6)

   -- If we want to search if a value is NULL we need to use IS NULL or IS NOT NULL

SELECT LastName, ManagerId FROM Employees
   WHERE ManagerId IS NULL

SELECT LastName, ManagerId FROM Employees
   WHERE ManagerId IS NOT NULL

   -- Order by examples
SELECT FirstName, Salary 
   FROM Employees
   ORDER BY Salary ASC

SELECT FirstName, Salary 
   FROM Employees
   ORDER BY Salary DESC

CREATE VIEW v_EmployeesByDepartment AS
SELECT FirstName + ' ' + LastName AS [Full Name], Salary FROM Employees

SELECT * FROM v_EmployeesByDepartment


SELECT *
FROM Projects


UPDATE Projects
  SET EndDate = GETDATE()
  WHERE EndDate IS NULL

  --In database Geography create a view for the highest peak
--CREATE VIEW v_HighestPeak AS 
-- SELECT TOP(1) * FROM Peaks
-- ORDER BY Elevation DESC
--SELECT * FROM v_HighestPeak
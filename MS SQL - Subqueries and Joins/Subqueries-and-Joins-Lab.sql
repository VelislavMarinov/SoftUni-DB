
--Make a tripple join With adressses and Towns, order them by FirstName and LastName ascending
SELECT TOP(50) e.FirstName, e.LastName, t.Name AS Town, a.AddressText
    FROM Employees e
	JOIN Addresses a ON e.AddressID = a.AddressID
	JOIN Towns t ON a.TownID = t.TownID
	ORDER BY e.FirstName ASC, E.LastName ASC


--Find all employees that are in the "Sales" department. Use "SoftUni" database.

SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name AS DepartmentName
    FROM Employees e
	JOIN Departments d ON e.DepartmentID = d.DepartmentID
	WHERE d.Name = 'Sales'

--	Show all employees that:
--Are hired after 1/1/1999
--Are either in "Sales" or "Finance" department
-- Sorted by HireDate(ascending)

SELECT e.FirstName,e.LastName,e.HireDate,d.Name AS DeptName
    FROM Employees e
	JOIN Departments d ON e.DepartmentID = d.DepartmentID
	WHERE E.HireDate > '1/1/1999' AND d.Name = 'Finance' OR d.Name = 'Sales'
	ORDER BY HireDate

--Display information about employee's manager and employee's department .
--Show only the first 50 employees.
--The exact format is shown below
--Sort by EmployeeID (ascending)

SELECT TOP(50) e.EmployeeID,e.FirstName + ' ' + e.LastName AS EmployeeName,
       m.FirstName + ' ' + m.LastName AS ManagerName, d.Name AS DepartmentName
    FROM Employees e
	LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID
	LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
	ORDER BY e.EmployeeID ASC

--Display lowest average salary of all departments.
--Calculate average salary for each department.
--Then show the value of smallest one.
SELECT MIN(a.AvarageSalary) AS MinAverageSalary
   FROM
   (
      SELECT e.DepartmentID, AVG(e.Salary) AS AvarageSalary
      FROM Employees e
      GROUP BY e.DepartmentID
	) AS a
 
	
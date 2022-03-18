

--That’s it! You no longer work for Mr. Bodrog. You have decided to find a proper job as an analyst in SoftUni. 
--It’s not a surprise that you will use the SoftUni database. Things get more exciting here!
--Create a query that shows the total sum of salaries for each department. Order by DepartmentID.
--Your query should return:	
--•	DepartmentID

SELECT DepartmentID, SUM(Salary)
       FROM Employees
	   GROUP BY DepartmentID
	   ORDER BY DepartmentID ASC

--Select the minimum salary from the employees for departments 
--with ID (2, 5, 7) but only for those hired after 01/01/2000.
--Your query should return:	
--•	DepartmentID


SELECT DepartmentID, MIN(Salary) AS MinimumSalary
       FROM Employees
	   WHERE DepartmentID LIKE '[257]' AND HireDate > '01/01/2000'
	   GROUP BY DepartmentID


--Select all employees who earn more than 30000 into a new table. 
--Then delete all employees who have ManagerID = 42 (in the new table). 
--Then increase the salaries of all employees with DepartmentID=1 by 5000. 
--Finally, select the average salaries in each department.
	   
SELECT * INTO MyNewTable
  FROM Employees
  WHERE Salary > 30000

DELETE FROM MyNewTable
WHERE ManagerID = 42

UPDATE MyNewTable 
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AvarageSalary
      FROM MyNewTable
	  GROUP BY DepartmentID

--Find the max salary for each department. Filter those, 
--which have max salaries NOT in the range 30000 – 70000

SELECT DepartmentID,MAX(Salary) AS MaxSalary 
      FROM Employees
	  GROUP BY DepartmentID
	  HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000

--Count the salaries of all employees who don’t have a manager.

SELECT  COUNT(*) AS [Count]
     FROM Employees
	 WHERE ManagerID IS NULL

--Find the third highest salary in each department if there is such.  *
SELECT DISTINCT k.DepartmentID, k.Salary
 FROM
  (SELECT 
    DepartmentID, Salary, 
    DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) As [Rank]  FROM Employees) AS k
	Where [Rank] = 3
	  
	  
       
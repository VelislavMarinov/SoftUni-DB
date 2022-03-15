
--Find Names of All Employees by First Name
--Write a SQL query to find first and last names of all employees whose first name starts with "SA". 

SELECT FirstName,LastName FROM Employees
WHERE  FirstName LIKE 'sa%'


--Find Names of All employees by Last Name 
--Write a SQL query to find first and last names of all employees whose last name contains "ei". 

SELECT FirstName,LastName FROM Employees
WHERE  LastName LIKE '%ei%'



--Write a SQL query to find the first names of all employees in the 
--departments with ID 3 or 10 and whose hire year is between 1995 and 2005 inclusive.

SELECT FirstName  FROM Employees
WHERE DepartmentID = 3 OR DepartmentID = 10  
AND HireDate BETWEEN '1995' AND '2005'

--Write a SQL query to find the first and last names of all 
--employees whose job titles does not contain "engineer".

SELECT FirstName,LastName FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'


--Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name. 
SELECT Name FROM Towns
WHERE LEN(Name) = 5 OR LEN(Name) = 6
ORDER BY Name


--Write a SQL query to find all towns that start with letters M, K, B or E. Order them alphabetically by town name. 
--Other varitions include "LIKE '[MKBE]%'"
SELECT * FROM Towns

WHERE LEFT(Name,1) IN ('M','K','B','E')
ORDER BY Name



--Write a SQL query to find all towns that does not start with letters R, B or D. 
--Order them alphabetically by name. 
SELECT * FROM Towns
WHERE  Name NOT LIKE '[RBD]%'
ORDER BY Name


--Write a SQL query to create view V_EmployeesHiredAfter2000 
--with first and last name to all employees hired after 2000 year. 
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName,LastName FROM Employees
WHERE HireDate > '2001'


--Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.
SELECT FirstName,LastName FROM Employees
WHERE LEN(LastName) = 5

--Write a query that ranks all employees using DENSE_RANK. 
--In the DENSE_RANK function, employees need to be partitioned 
--by Salary and ordered by EmployeeID. You need to find only the employees 
--whose Salary is between 10000 and 50000 and order them by Salary in descending order.

SELECT EmployeeID,FirstName,LastName,Salary, DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC


--Use the query from the previous problem and upgrade it, so that it finds only the employees 
--whose Rank is 2 and again, order them by Salary (descending).

SELECT * FROM (
SELECT EmployeeID,FirstName,LastName,Salary, DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000 

) AS K
WHERE K.[Rank] = 2
ORDER BY K.Salary DESC

--Find all countries that holds the letter 'A' in their name at least 3 times (case insensitively), 
--sorted by ISO code. Display the country name and ISO code

SELECT CountryName,IsoCode FROM Countries
WHERE CountryName LIKE '%a%a%a%'
ORDER BY IsoCode

--Combine all peak names with all river names, so that the last letter of each peak name is the same as 
--the first letter of its corresponding river name. Display the peak names, river names, and the obtained 
--mix (mix should be in lowercase).

SELECT * FROM(
  SELECT p.PeakName, r.RiverName, LOWER(p.PeakName + SUBSTRING(r.RiverName, 2, LEN(r.RiverName))) AS Mix  
  FROM Peaks AS p,Rivers AS r
  WHERE LOWER(RIGHT(p.PeakName,1)) = LOWER(LEFT(r.RiverName,1))
) AS v
ORDER BY Mix

--Find the top 50 games ordered by start date, then by name of the game. 
--Display only games from 2011 and 2012 year. 
--Display start date in the format "yyyy-MM-dd". 

SELECT TOP(50) [Name],FORMAT([Start], 'yyyy-MM-dd') AS [Start] FROM Games
WHERE YEAR([Start]) = '2011' OR YEAR([Start]) = '2012'
ORDER BY [START] ASC

--Find all users along with information about their email providers. Display the username and email provider.
--Sort the results by email provider alphabetically, then by username.

SELECT Username,SUBSTRING(Email , CHARINDEX('@',Email) + 1, LEN(Email)) AS [Email Provider] 
FROM Users
ORDER BY [Email Provider], Username


--Find all users along with their IP addresses sorted by username alphabetically. 
--Display only rows that IP address matches the pattern: "***.1^.^.***". 
--Legend: * - one symbol, ^ - one or more symbols
--Example


SELECT Username, IpAddress FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username

--Find all games with part of the day and duration sorted by game name alphabetically 
--then by duration (alphabetically, not by the timespan) and part of the day (all ascending). 
--Parts of the day should be Morning (time is >= 0 and < 12), Afternoon (time is >= 12 and < 18), 
--Evening (time is >= 18 and < 24). Duration should be Extra Short (smaller or equal to 3), 
--Short (between 4 and 6 including), Long (greater than 6) and Extra Long (without duration). 

SELECT [Name], 
  CASE 
  WHEN DATEPART(HOUR,Start) BETWEEN 0 AND 11 THEN 'Morning'
  WHEN DATEPART(HOUR,Start) BETWEEN 12 AND 17 THEN 'Afternoon'
  WHEN DATEPART(HOUR,Start) BETWEEN 18 AND 23 THEN 'Evening'
  END AS [Part of the day],
  CASE
  WHEN Duration <= 3 THEN 'Extra Short'
  WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
  WHEN Duration > 6 THEN 'Long'
  WHEN Duration IS NULL THEN 'Extra Long'

  END AS [Duration]
  FROM Games
ORDER BY Name, [Duration]


--You are given a table Orders(Id, ProductName, OrderDate) filled with data. 
--Consider that the payment for that order must be accomplished within 3 days after the order date. 
--Also the delivery date is up to 1 month. Write a query to show each product’s name, order date, 
--pay and deliver due dates.

SELECT ProductName,
       OrderDate,
	   DATEADD(DAY,3,OrderDate) AS [Pay Due],
	   DATEADD(MONTH,1,OrderDate) AS [Deliver Due]
	 From Orders


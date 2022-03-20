
-- How to declare and select a  variable  
DECLARE @num INT = 1;
SELECT @num

-- How to crate and use a function
CREATE FUNCTION udf_TimesTwo(@num INT)
RETURNS INT 
AS
BEGIN
    RETURN @num * 2
END

SELECT FirstName,Salary, dbo.udf_TimesTwo(Salary) AS SalaryMultiplayed  FROM Employees

--Write a function ufn_GetSalaryLevel(@Salary MONEY) that receives salary of an 
--employee and returns the level of the salary.
--If salary is < 30000 return "Low"
--If salary is between 30000 and 50000 (inclusive) returns "Average"
--If salary is > 50000 return "High"

CREATE FUNCTION ufn_GetSalaryLevel(@Salary MONEY)
RETURNS VARCHAR(50)
AS
BEGIN
      DECLARE @Result VARCHAR(50) = ''
      IF(@Salary < 30000)
	  SET @Result = 'Low'
	  ELSE IF(@Salary  BETWEEN 30000 AND 50000)
	  SET @Result = 'Average'
	  ELSE IF(@Salary > 50000)
	  SET @Result = 'High'
	  RETURN @Result
END

SELECT FirstName, LastName,Salary,dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel FROM Employees


--Stored Procedure

CREATE PROC dbo.usp_SelectEmployeesBySeniority 
AS
  SELECT * 
  FROM Employees
  WHERE DATEDIFF(Year, HireDate, GETDATE()) > 20
GO

EXEC usp_SelectEmployeesBySeniority

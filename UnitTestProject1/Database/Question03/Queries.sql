USE TestDB

--drop table Employees
--GO 

--Create table Employees
--(
--EmployeeID int primary key identity,
--EmployeeName nvarchar(50),
--ManagerID int foreign key references Employees(EmployeeID)
--)
--GO

--Insert into Employees values ('John', NULL)
--Insert into Employees values ('Mark', NULL)
--Insert into Employees values ('Steve', NULL)
--Insert into Employees values ('Tom', NULL)
--Insert into Employees values ('Lara', NULL)
--Insert into Employees values ('Simon', NULL)
--Insert into Employees values ('David', NULL)
--Insert into Employees values ('Ben', NULL)
--Insert into Employees values ('Stacy', NULL)
--Insert into Employees values ('Sam', NULL)
--GO

--Update Employees Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
--Update Employees Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
--Update Employees Set ManagerID = 3 Where EmployeeName IN ('Tom')
--Update Employees Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
--Update Employees Set ManagerID = 4 Where EmployeeName IN ('David')
--GO

SELECT * FROM Employees
GO

DECLARE @ID INT = 7;
WITH EmployeeCTE AS (
	-- Anchor
	SELECT
		EmployeeID, EmployeeName, ManagerID
	FROM Employees		
	WHERE EmployeeID = @ID

	UNION ALL

	-- Recursive Member
	SELECT
		Employees.EmployeeID, Employees.EmployeeName, Employees.ManagerID
	FROM Employees		
	INNER JOIN EmployeeCTE ON Employees.EmployeeID = EmployeeCTE.ManagerID
)

SELECT * FROM EmployeeCTE

--SELECT 
--	e1.EmployeeName,
--	ISNULL(e2.EmployeeName, 'No Boss') AS ManagerName 
--FROM EmployeeCTE e1
--LEFT JOIN EmployeeCTE e2 ON e1.ManagerID = e2.EmployeeID
	
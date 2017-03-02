USE TestDB

--DROP TABLE Departments
--DROP TABLE Employees

--Create Table Departments
--(
--     DepartmentID int primary key,
--     DepartmentName nvarchar(50)
--)
--GO

--Create Table Employees
--(
--     EmployeeID int primary key,
--     EmployeeName nvarchar(50),
--     DepartmentID int foreign key references Departments(DepartmentID)
--)
--GO

--Insert into Departments values (1, 'IT')
--Insert into Departments values (2, 'HR')
--Insert into Departments values (3, 'Payroll')
--Insert into Departments values (4, 'Admin')
--GO

--Insert into Employees values (1, 'Mark', 1)
--Insert into Employees values (2, 'John', 1)
--Insert into Employees values (3, 'Mike', 1)
--Insert into Employees values (4, 'Mary', 2)
--Insert into Employees values (5, 'Stacy', 3)
--Insert into Employees values (6, 'Pam', NULL)
--GO

SELECT * FROM Departments
SELECT * FROM Employees

SELECT EmployeeName, DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID

SELECT EmployeeName, DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID

SELECT EmployeeName, DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID

SELECT EmployeeName, DepartmentName
FROM Employees
FULL JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID

--Create Database USADB
--GO

--Create Database UKDB
--GO

--USE USADB
--GO

--Create table Employees
--(
--     ID int primary key,
--     FirstName nvarchar(50),
--     LastName nvarchar(50),
--     Gender nvarchar(50),
--     Salary int,
--     Country nvarchar(50)
--)

--Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 60000, 'USA')
--Insert into Employees values (2, 'Steve', 'Pound', 'Male', 45000, 'USA')
--Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 70000, 'USA')
--Insert into Employees values (4, 'Philip', 'Hastings', 'Male', 45000, 'USA')

--USE UKDB
--GO

--Create table Employees
--(
--     ID int primary key,
--     FirstName nvarchar(50),
--     LastName nvarchar(50),
--     Gender nvarchar(50),
--     Salary int,
--     Country nvarchar(50)
--)

--Insert into Employees values (5, 'Mary', 'Lambeth', 'Female', 30000, 'UK')
--Insert into Employees values (6, 'Valarie', 'Vikings', 'Female', 35000, 'UK')
--Insert into Employees values (7, 'John', 'Stanmore', 'Male', 80000, 'UK')

SELECT * FROM [USADB].[dbo].[Employees]
SELECT * FROM [UKDB].[dbo].[Employees]
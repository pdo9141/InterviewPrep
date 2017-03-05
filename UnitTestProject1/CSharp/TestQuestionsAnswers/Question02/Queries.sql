USE TestDB

--DROP TABLE Departments 
--DROP TABLE Employees

--Create table Departments
--(
--     ID int primary key identity,
--     Name nvarchar(50),
--     Location nvarchar(50)
--)

--Create table Employees
--(
--     ID int primary key identity,
--     FirstName nvarchar(50),
--     LastName nvarchar(50),
--     Gender nvarchar(50),
--     Salary int,
--     DepartmentId int foreign key references Departments(Id)
--)

--Create Procedure spGetAllTables
--as
--Begin
--     Select TABLE_NAME
--     from INFORMATION_SCHEMA.TABLES
--     where TABLE_TYPE='BASE TABLE'
--End

--Create Procedure spGetTableMetaData
--@TableName nvarchar(50)
--as
--Begin
--     Select COLUMN_NAME, DATA_TYPE
--     from INFORMATION_SCHEMA.COLUMNS
--     where TABLE_NAME = @TableName
--End
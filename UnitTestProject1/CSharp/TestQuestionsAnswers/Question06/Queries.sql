USE TestDB

--DROP TABLE Employees
--DROP TABLE Departments

--Create Table Departments
--(
--     ID int primary key,
--     Name nvarchar(50),
--     Location nvarchar(50)
--)
--GO

--Insert into Departments values (1, 'IT', 'New York')
--Insert into Departments values (2, 'HR', 'London')
--GO

--Create Table Employees
--(
--     ID int primary key,
--     Name nvarchar(50),
--     DepartmentID int foreign key references Departments(ID)
--)
--GO

--Insert into Employees values (1, 'Mike', 1)
--Insert into Employees values (2, 'John', 1)
--Insert into Employees values (3, 'Josh', 1)
--Insert into Employees values (4, 'Mary', 2)
--Insert into Employees values (5, 'Rosy', 2)
--GO
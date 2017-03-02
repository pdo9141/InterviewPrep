USE TestDB

--DROP TABLE Students


--Create table Students
--(
--     ID int primary key identity,
--     Name nvarchar(50),
--     Gender nvarchar(50),
--     Salary int
--)
--Go

--Insert into Students values ('Mark', 'Male', 60000)
--Insert into Students values ('Steve', 'Male', 45000)
--Insert into Students values ('James', 'Male', 70000)
--Insert into Students values ('Mike', 'Male', 45000)
--Insert into Students values ('Mary', 'Female', 30000)
--Insert into Students values ('Valarie', 'Female', 35000)
--Insert into Students values ('John', 'Male', 80000)
--Go

SELECT * FROM Students WHERE Name LIKE 'M%'
SELECT * FROM Students WHERE CHARINDEX('M',Name) = 1
SELECT * FROM Students WHERE LEFT(Name, 1) = 'M'
SELECT * FROM Students WHERE SUBSTRING(Name, 1, 1) = 'M'
--https://www.youtube.com/watch?v=GfQD28ektk8&index=89&list=PL08903FB7ACA1C2FB

--SQL Script to create the tables and populate with test data
Create Table TableA
(
    Id int,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Go

Create Table TableB
(
    Id int,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableB values (2, 'Mary', 'Female')
Insert into TableB values (3, 'Steve', 'Male')
Go

--The following query retrieves the common records from both the left and the right query of the Intersect operator. 

Select Id, Name, Gender from TableA
Intersect
Select Id, Name, Gender from TableB

--We can also achieve the same think using INNER join. The following INNER join query would produce the exact same result. 

Select TableA.Id, TableA.Name, TableA.Gender
From TableA Inner Join TableB
On TableA.Id = TableB.Id
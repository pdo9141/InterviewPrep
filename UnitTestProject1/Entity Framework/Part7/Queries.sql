USE TestDB

--DROP TABLE Departments
--DROP TABLE Employees

Create procedure InsertEmployee
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Gender nvarchar(50),
@Salary int,
@JobTitle nvarchar(50),
@DepartmentId int
as
Begin
     Insert into Employees values (@FirstName, @LastName, @Gender, @Salary, @JobTitle, @DepartmentId)   
End
Go

Create procedure UpdateEmployee
@ID int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Gender nvarchar(50),
@Salary int,
@JobTitle nvarchar(50)
as
Begin
     Update Employees Set FirstName = @FirstName, LastName = @LastName, Gender = @Gender, Salary = @Salary, JobTitle = @JobTitle
     where ID = @ID
End
Go

Create procedure DeleteEmployee
@ID int
as
Begin
     Delete from Employees where ID = @ID
End
Go
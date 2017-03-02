USE TestDB

--DROP TABLE Students
--DROP TABLE Courses
--DROP TABLE StudentCourses

--Create table Students
--(
--Id int primary key identity,
--StudentName nvarchar(50)
--)
--Go

--Create table Courses
--(
--Id int primary key identity,
--CourseName nvarchar(50)
--)
--Go

--Create table StudentCourses
--(
--StudentId int not null foreign key references Students(Id),
--CourseId int not null foreign key references Courses(Id)
--)
--Go

--Alter table StudentCourses
--Add Constraint PK_StudentCourses
--Primary Key Clustered (CourseId, StudentId)

Declare @StudentName nvarchar(50) = 'Sam'
Declare @CourseName nvarchar(50) = 'SQL Server'

Declare @StudentId int
Declare @CourseId int

-- If the student already exists, use the existing student ID
Select @StudentId = Id from Students where StudentName = @StudentName
-- If the course already exists, use the existing course ID
Select @CourseId = Id from Courses where CourseName = @CourseName

-- If the student does not exist in the Students table
If (@StudentId is null)
Begin
     -- Insert the student
     Insert into Students values(@StudentName)
     -- Get the Id of the student
     Select @StudentId = SCOPE_IDENTITY()
End

-- If the course does not exist in the Courses table
If (@CourseId is null)
Begin
     -- Insert the course
     Insert into Courses values(@CourseName)
     -- Get the Id of the course
     Select @CourseId = SCOPE_IDENTITY()
End

-- Insert StudentId & CourseId in StudentCourses table

Insert into StudentCourses values(@StudentId, @CourseId)

If required, we can very easily convert this into a stored procedure as shown below.

Create procedure spInsertIntoStudentCourses
@StudentName nvarchar(50),
@CourseName nvarchar(50)
as
Begin

     Declare @StudentId int
     Declare @CourseId int

     Select @StudentId = Id from Students where StudentName = @StudentName
     Select @CourseId = Id from Courses where CourseName = @CourseName

     If (@StudentId is null)
     Begin
          Insert into Students values(@StudentName)
          Select @StudentId = SCOPE_IDENTITY()
     End

     If (@CourseId is null)
     Begin
          Insert into Courses values(@CourseName)
          Select @CourseId = SCOPE_IDENTITY()
     End

     Insert into StudentCourses values(@StudentId, @CourseId)

End

Execute spInsertIntoStudentCourses 'Tom','C#'
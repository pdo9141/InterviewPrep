--https://www.youtube.com/watch?v=TsbMvs0Zqu0&list=PL08903FB7ACA1C2FB&index=66

Use [Sample]
If not exists (select * from information_schema.tables where table_name = 'tblEmployee')
Begin
 Create table tblEmployee
 (
  ID int identity primary key,
  Name nvarchar(100),
  Gender nvarchar(10),
  DateOfBirth DateTime
 )
 Print 'Table tblEmployee successfully created'
End
Else
Begin
 Print 'Table tblEmployee already exists'
End

--Sql server built-in function OBJECT_ID(), can also be used to check for the existence of the table
IF OBJECT_ID('tblEmployee') IS NULL
Begin
   -- Create Table Script
   Print 'Table tblEmployee created'
End
Else
Begin
   Print 'Table tblEmployee already exists'
End

--Depending on what we are trying to achieve, sometime we may need to drop (if the table already exists) and re-create it. The sql script below, does exactly the same thing.
Use [Sample]
IF OBJECT_ID('tblEmployee') IS NOT NULL
Begin
 Drop Table tblEmployee
End
Create table tblEmployee
(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
)

--Let's look at another example. The following sql script adds column "EmailAddress" to table tblEmployee. This script is not re-runnable because, if the column exists we get a script error.
Use [Sample]
ALTER TABLE tblEmployee
ADD EmailAddress nvarchar(50)

--To make this script re-runnable, check for the column existence
Use [Sample]
if not exists(Select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME='EmailAddress' and TABLE_NAME = 'tblEmployee' and TABLE_SCHEMA='dbo') 
Begin
 ALTER TABLE tblEmployee
 ADD EmailAddress nvarchar(50)
End
Else
BEgin
 Print 'Column EmailAddress already exists'
End

--Col_length() function can also be used to check for the existence of a column
If col_length('tblEmployee','EmailAddress') is not null
Begin
 Print 'Column already exists'
End
Else
Begin
 Print 'Column does not exist'
End 

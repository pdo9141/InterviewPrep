--https://www.youtube.com/watch?v=_UQ9Pu2W7Zg&index=74&list=PL08903FB7ACA1C2FB

Create table tblEmployees
(
    Id int primary key,
    Name nvarchar(50)
)
Go

Insert into tblEmployees values(1,'Mark')
Insert into tblEmployees values(3, 'Sara')
Insert into tblEmployees values(100, 'Mary')


--Phantom read example : Open 2 instances of SQL Server Management studio. From the first window execute Transaction 1 code and from the second window, execute Transaction 2 code. Notice that when Transaction 1 completes, 
--it gets different number of rows for read 1 and read 2, resulting in phantom read. 

-- Transaction 1
Begin Transaction
Select * from tblEmployees where Id between 1 and 3
-- Do Some work
waitfor delay '00:00:10'
Select * from tblEmployees where Id between 1 and 3
Commit Transaction

-- Transaction 2
Insert into tblEmployees values(2, 'Marcus')

--Fixing phantom read concurrency problem : To fix the phantom read problem, set transaction isolation level of Transaction 1 to serializable. This will place a range lock on the rows between 1 and 3, 
--which prevents any other transaction from inserting new rows with in that range. This solves the phantom read problem.  

--When you execute Transaction 1 and 2 from 2 different instances of SQL Server management studio, Transaction 2 is blocked until Transaction 1 completes and at the end of Transaction 1, both the reads get the same number of rows. 

-- Transaction 1
Set transaction isolation level serializable
Begin Transaction
Select * from tblEmployees where Id between 1 and 3
-- Do Some work
waitfor delay '00:00:10'
Select * from tblEmployees where Id between 1 and 3
Commit Transaction

-- Transaction 2

Insert into tblEmployees values(2, 'Marcus')
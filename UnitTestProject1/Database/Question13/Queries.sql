USE TestDB

--DROP TABLE TableA
--DROP TABLE TableB

--Create table TableA
--(
--    Id int identity primary key,
--    Name nvarchar(50)
--)
--Go

--Insert into TableA values ('Mark')
--Go

--Create table TableB
--(
--    Id int identity primary key,
--    Name nvarchar(50)
--)
--Go

--Insert into TableB values ('Mary')
--Go

--BLOCKING
--Transaction 1 (in 1 window)
Begin Tran
Update TableA set Name='Mark Transaction 1' where Id = 1
Waitfor Delay '00:00:10'
Commit Transaction

--Transaction 2 (in another window)
Begin Tran
Update TableA set Name='Mark Transaction 2' where Id = 1
Commit Transaction

-- DEADLOCK
-- Transaction 1 (in 1 window)
Begin Tran
Update TableA Set Name = 'Mark Transaction 1' where Id = 1
 -- From Transaction 2 window execute the first update statement
Update TableB Set Name = 'Mary Transaction 1' where Id = 1
 -- From Transaction 2 window execute the second update statement
Commit Transaction

-- Transaction 2 (in another window)
Begin Tran
Update TableB Set Name = 'Mark Transaction 2' where Id = 1
-- From Transaction 1 window execute the second update statement
Update TableA Set Name = 'Mary Transaction 2' where Id = 1
-- After a few seconds notice that one of the transactions complete
-- successfully while the other transaction is made the deadlock victim
Commit Transaction
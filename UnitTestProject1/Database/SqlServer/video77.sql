--Enable Snapshot Isolation for the SampleDB database using the following command
Alter database SampleDB SET ALLOW_SNAPSHOT_ISOLATION ON

--Open 2 instances of SQL Server Management studio. From the first window execute Transaction 1 code and from the second window execute Transaction 2 code. 
--Notice that Transaction 2 is blocked until Transaction 1 is completed. When Transaction 1 completes, Transaction 2 raises an update conflict and the 
--transaction terminates and rolls back with an error. 

--Transaction 1
Set transaction isolation level snapshot
Begin Transaction
Update tblInventory set ItemsInStock = 8 where Id = 1
waitfor delay '00:00:10'
Commit Transaction

-- Transaction 2
Set transaction isolation level snapshot
Begin Transaction
Update tblInventory set ItemsInStock = 5 where Id = 1
Commit Transaction



--Now let's try the same thing using Read Committed Sanpshot Isolation 

--Step 1 : Disable Snapshot Isolation for the SampleDB database using the following command
Alter database SampleDB SET ALLOW_SNAPSHOT_ISOLATION OFF

--Step 2 : Enable Read Committed Sanpshot Isolation at the database level using the following command
Alter database SampleDB SET READ_COMMITTED_SNAPSHOT ON

--Step 3 : Open 2 instances of SQL Server Management studio. From the first window execute Transaction 1 code and from the second window execute Transaction 2 code. Notice that Transaction 2 is blocked until Transaction 1 is completed. When Transaction 1 completes, Transaction 2 also completes successfully without any update conflict. 

--Transaction 1
Set transaction isolation level read committed
Begin Transaction
Update tblInventory set ItemsInStock = 8 where Id = 1
waitfor delay '00:00:10'
Commit Transaction

-- Transaction 2
Set transaction isolation level read committed
Begin Transaction
Update tblInventory set ItemsInStock = 5 where Id = 1
Commit Transaction
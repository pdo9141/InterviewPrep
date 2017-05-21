--https://www.youtube.com/watch?v=5ZEchu2WnD4&index=71&list=PL08903FB7ACA1C2FB

Create table tblInventory
(
    Id int identity primary key,
    Product nvarchar(100),
    ItemsInStock int
)
Go

Insert into tblInventory values ('iPhone', 10)


--Transaction 1 : 
Begin Tran
Update tblInventory set ItemsInStock = 9 where Id=1

-- Billing the customer
Waitfor Delay '00:00:15'
-- Insufficient Funds. Rollback transaction

Rollback Transaction

--Transaction 2 :
Set Transaction Isolation Level Read Uncommitted
Select * from tblInventory where Id=1

--Read Uncommitted transaction isolation level is the only isolation level that has dirty read side effect. This is the least restrictive of all the isolation levels. 
--When this transaction isolation level is set, it is possible to read uncommitted or dirty data. 
--Another option to read dirty data is by using NOLOCK table hint. The query below is equivalent to the query in Transaction 2. 
--Select * from tblInventory WITH (NOLOCK) where Id=1

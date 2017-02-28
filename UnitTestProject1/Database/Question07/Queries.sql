USE TestDB

--Create Table TestTable
--(
--ID int identity primary key,
--Value nvarchar(50)
--)

--Insert into TestTable values ('123')
--Insert into TestTable values ('ABC')
--Insert into TestTable values ('DEF')
--Insert into TestTable values ('901')
--Insert into TestTable values ('JKL')

SELECT * FROM TestTable

SELECT Value FROM TestTable WHERE ISNUMERIC(Value) = 1
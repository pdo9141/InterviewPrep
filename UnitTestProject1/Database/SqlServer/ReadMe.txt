https://www.youtube.com/playlist?list=PL08903FB7ACA1C2FB

01) What is cascading referential integrity constraint? With your foreign key (delete or update rule), you can specify four options when you try to delete or update the primary key column. 
	a) No Action: default behavior, DB will not let you delete the primary key if records exists with the foreign key
	b) Cascade: if you delete/update primary key row referenced by foreign key, all rows containing those keys are also deleted/updated (all rows in tblPerson will be deleted if tblGender row is deleted)
	c) Set NULL: if you delete/update primary key row referenced by foreign key, all rows containg those keys are set to NULL
	d) Set Default: if you delete/update primary key row referenced by foreign key, all rows containg those keys are set to default values (default constraint)
02) What is the check constraint? E.g., an age column cannot be negative or say more than 150. NULLs are allowed by default, constraint won't check if NULL passed
03) If you have an auto increment identity column and you delete row ID 1, your next insert will be 2. Can you insert a new record with ID of 1? Yes you can, you
	can "SET IDENTITY_INSERT tblPerson ON" then run your insert specifying you columns and value of 1 in the ID. Remember to turn identity insert off to revert back to auto increment.
	If you have deleted all rows in a table and you want to reset identity, use "DBCC CHECKIDENT('tblPerson', RESEED, 0)"		
04) How to get the last generated identity column value in SQL Server? You can use SCOPE_IDENTITY(), @@Identity, and IDENT_CURRENT('TableName').
	What's the difference between SCOPE_IDENTITY() and @@Identity? If you incorporate a trigger, SCOPE_IDENTITY() will give you the ID from the main table, @@Identity
	will give you the ID of the table modified by the trigger.
	a) SCOPE_IDENTITY(): same session and the same scope
	b) @@Identity: same session and across any scope
	c) IDENT_CURRENT('TableName'): specific table across any session and any scope
05) What is a unique key constraint? We use UNIQUE constraint to enforce uniqueness of a column. A table can have only one primary key. If you want to enforce 
	uniqueness on 2 or more columns, then you use unique key constraint. 
06) What's the difference between primary key and unique key constraints? 
	a) a table can have only one primary key, but more than one unique key
	b) primary key does not allow nulls, whereas unique key allows one null
07) Aside from the common operators and wildcars =, !=, <>, etc. There are these rarely used operators and wildcards:
	"_" specifies exactly one character, SELECT * FROM tblPerson WHERE EMail LIKE '_@_.com', matches t@t.com and j@j.com
	"[]" any character within the brackets, SELECT * FROM tblPerson WHERE Name LIKE '[MST]%', matches Tom, Mary, and Sara
	"[^]" Not any character within the brackets, SELECT * FROM tblPerson WHERE Name LIKE '[^MST]%', matches John and Josh
08) Aside from specifying SELECT TOP 10 * FROM tblPerson, you can also specify SELECT TOP 50 PERCENT * FROM tblPerson


continue on part 11
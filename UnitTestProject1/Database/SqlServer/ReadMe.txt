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
09) SELECT Gender, City, SUM(Salary) as TotalSalary, COUNT(ID) as [Total Employees]
	FROM tblEmployee
	WHERE Gender = 'Male'
	GROUP BY Gender, City
		is the same as
	SELECT Gender, City, SUM(Salary) as TotalSalary, COUNT(ID) as [Total Employees]
	FROM tblEmployee
	GROUP BY Gender, City
	HAVING Gender = 'Male'
10) SELECT Gender, City, SUM(Salary) as TotalSalary
	FROM tblEmployee
	GROUP BY Gender, City
		is the same as
	SELECT City, Gender, SUM(Salary) as TotalSalary
	FROM tblEmployee
	GROUP BY City, Gender
11) What is the difference between WHERE and HAVING?
	a) WHERE clause can be used with - SELECT, INSERT, and UPDATE statements, where as HAVING clause can only be used with the SELECT statement
	b) WHERE filters rows before aggregation (GROUPING), whereas, HAVING filters groups, after the aggregations are performed
	c) Aggregate functions cannot be used in the WHERE clause, unless it is in a sub query contained in a HAVING clause, whereas, aggregate functions
	   can be used in HAVING clause
12) Explain inner, cross, left outer, right outer, and full outer joins.
	(Inner) Join: returns only the matching rows between both the tables. Non matching rows are eliminated
	Cross Join: produces the Cartesian product of the 2 tables involved in the join. E.g., in the Employees table we have 10 rows and in the Departments table
			    we have 4 rows. So, a cross join between these 2 tables produces 40 rows. A cross join will not have an ON clause.
	Right (Outer) Join: returns all the matching rows + non matching rows from the right table
	Left (Outer) Join: returns all the matching rows + non matching rows from the left table
	Full (Outer) Join: returns all rows from both the left and right tables, including the non matching rows
13) Why would you ever use a cross join? One scenario would be you want to display clothes style with all sizes (XS, S, M, L, XL) in some sort or report
14) How would you query only the non matching rows from the left table?
	SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	LEFT JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id
	WHERE tblEmployee.DepartmentId IS NULL
15) How would you query only the non matching rows from the right table?
	SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	RIGHT JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id
	WHERE tblEmployee.DepartmentId IS NULL
16) How would you query only the non matching rows from both the left and right tables?
	SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	FULL JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id
	WHERE tblEmployee.DepartmentId IS NULL OR tblDepartment.Id IS NULL
17) What is a self join and why would you use it? When you join the table to itself. An example would be an Employee table that has a ManagerId column that
	references the same Employee table but another row. A self join can be an INNER, LEFT, RIGHT, or CROSS join, depends on how you want to use it.




continue on part 15
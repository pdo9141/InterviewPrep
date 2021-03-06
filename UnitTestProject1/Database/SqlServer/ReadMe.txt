﻿https://www.youtube.com/playlist?list=PL08903FB7ACA1C2FB

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
18) What are the different ways to replace NULL values? 
	a) SELECT ISNULL(M.Name, 'No Manager')
	b) SELECT CASE WHEN M.Name IS NULL THEN 'No Manager' ELSE M.Name
	c) COALESCE(M.Name, 'No Manager')
19) What is UNION (no duplicates) and UNION ALL? They are used to combine the resultset of two or more SELECT queries. For both to work, the number, data types, and the order
	of the columns in the select statements must be the same. UNION is slower since it has to do a DISTINCT and sort to remove duplicates. Order of columns can
	be different as long as the data type is the same, no one would do this though. You should only use ORDER BY on the last query else you'll get an error.
20) What are some useful system stored procedures? Be sure not to prefix your procedures with "sp_", this is because there will be ambiguity between user and 
	system stored procedures, also in future versions there might be naming conflicts. sp_helptext, sp_help, and sp_depends are useful system SPs.
21) You can encrypt the text of the stored procedure by using the "WITH Encryption" keywords, when users use the sp_helptext they won't be able to view it. 
22) To create an SP with output parameter, use the keywords OUT or OUTPUT in your parameter specification. When you execute this SP, add OUT or OUTPUT to argument
23) What are SP return values? What's the difference between SP return values and output parameters? When do you use either? All return values are is when you
	use the "return" keyword to return a value. Return values can only be INT, you cannot return VARCHAR or NVARCHAR. You cannot return multiple values, just one INT.
	In general, return is used to convey success or failure.
		return (SELECT COUNT(Id) FROM tblEmployee)
		DECLARE @Total INT
		EXECUTE @Total = spGetTotalCount1

		DECLARE @Total INT
		EXECUTE spGetTotalCount2 @Total OUTPUT
24) What are the advantages of using stored procedures over adhoc queries?
	a) Better execution plan retention and reusability (adhoc queries reuse execution plans but slight changes to query will not reuse it, see samples below)
		EXECUTE spGetNameById 1 (execution plan cached)
		EXECUTE spGetNameById 2 (execution plan reused from above)
		SELECT Name FROM tblEmployee WHERE Id = 1 (execution plan cached)
		SELECT Name FROM tblEmployee WHERE Id = 2 (new execution plan created)
	b) Reduces network traffic, imagine a SP with 3000 lines if done adhoc you would be sending 3000 lines across the network		
	c) Code reusability and better maintainability
	d) Better Security, you can have finer grain control, you can lock down table and create SP and grant user access to allow user to see data you want them to see
	e) Avoids SQL Injection attack
25) What are some built in string functions? 
	a) ASCII - returns the ASCII code of the given character expression
	b) CHAR - converts an int ASCII code to a character. The Integer_Expression should be between 0 and 255
	c) LTRIM - removes blanks on the left handside of the given character expression
	d) RTRIM - removes blanks on the right handside of the given character expression
	e) LOWER - converts all characters in given Character_Expression to lowercase
	f) UPPER - converts all characters in given Character_Expression to uppercase
	g) REVERSE - reverses all the characters in the given string expression
	h) LEN - returns the count of total characters in the given string expression, excluding the blanks at the end of the expression
	i) LEFT - returns specified number of characters from the left hand side of the given character expression
	j) RIGHT - returns specified number of characters from the right hand side of the given character expression
	k) CHARINDEX - returns the starting position of the specified expression in a character string
	l) SUBSTRING - returns substring form the given expression
	m) REPLICATE - repeats the given string for the specified number of times
	n) SPACE - returns number of spaces specified by the number of spaces argument
	o) PATINDEX - returns the starting position of the first occurrence of a pattern in a specifed expression. It taks two arguments, the pattern to be searched and the 
			      expression. This is similar to CHARINDEX but with CHARINDEX we cannot use wildcards. Returns zero if specified pattern not found. Pattern Index
	p) REPLACE - replaces all occurrences of a specified string value with another string value
	q) STUFF - inserts replacement expression at the start position specified along with removing the characters specified using length parameter
26) For date and time we can choose TIME, DATE, SMALLDATETIME, DATETIME, DATETIME2, and DATETIMEOFFSET. Difference is how grandular, how accuracy, and storage size (3-10 bytes stored).
	You use DATETIMEOFFSET for timezone offsets. There are slight differences between GMT and UTC but for most purposes, they are synonymous.
	a) GETDATE() - Commonly used
	b) CURRENT_TIMESTAMP - ANSI SQL equivalent to GETDATE
	c) SYSDATETIME() - More fractional seconds precision
	d) SYSDATETIMEOFFSET() - More fractional seconds precision + time zone offset
	e) GETUTCDATE() - UTC Date and Time
	f) SYSUTCDATETIME() - UTC Date and Time, with more fractional seconds precision
	g) ISDATE() - checks if the given value is a valid date, time, or datetime. Returns 1 for success, 0 for failure. Note, this function returns 0 for DATETIME2 formatted values
	h) DAY() - returns the day number of the month of the given date
	i) MONTH() - returns the month number of the year of the given date
	j) YEAR() - returns the yeaer number of the given date
	k) DATENAME() - returns a string that represents a part of the given date. This function takes 2 parameters. The first parameter date part specifies, the part of the date,
					we want. The second parameter is the actual date from whcih we want the part of the date.
	l) DATEPART() - returns an integer representing the specified date part. This function is similar to DATENAME() which returns nvarchar 
	m) DATEADD() - returns the date time after adding specified number to add to the date part specified of the given date
	n) DATEDIFF() - returns the count of the specified datepart boundaries crossed between the specified startdate and enddate
27) When do you use CAST vs CONVERT? They both give you the same output but if you want grandular control of converted value and you can use CONVERT and specify the third parameter (style, 101-105 DateFormat)
	CAST is based on ANSI standard and CONVERT is specific to SQL Server. So, if portability is a concern and if you want to use the script with other database applications, use CAST().
	CONVERT provides more flexibility than CAST. E.g., it's possible to control how you want DATETIME datatypes to be converted using styles with CONVERT function
28) Mathematical functions:
	a) ABS() - ABS stands for absolute and returns, the absolute (positive) number
	b) CEILING() and FLOOR() - accepts a numberica expression as a single parameter. CEILING() returns the largest integer value greater than or equal to the parameter, whereas FLOOR() returns
	   the smallest integer less than or equal to the parameter
	c) POWER() - returns the power value of the specifed expression to the specified power
	d) SQUARE() - returns the square of the given number
	e) SQRT() - returns the square root of the given number
	f) RAND() - returns a random float number between 0 and 1. It takes an optional seed parameter. When seed value is supplied, the RAND() function always returns the same value for the same seed
	g) ROUND() - rounds the given numberic expression based on the given length. This function takes 3 parameters, numeric expression, length, function (round or truncate number)
29) What are scalar user defined functions? These functions may or may not have parameters, but always return a single (scalar) value. 
	The returned value can be of any data type, except text, ntext, image, cursor, timestamp. To invoke scalar UDF, you must use two part name (e.g., dbo.CalculateAge('10/10/1978'))
	A stored procedure also can accept DateOfBirth and return Age, but you cannot use an SP in SELECT or WHERE clauses.
30) What are inline table valued functions? These functions return a table. E.g., SELECT * FROM fnEmployeesByGender('Male'), you can join as if regular table
	a) We specify TABLE as the return type, instead of any scalar data type
	b) The function body is not enclosed between BEGIN and END block
	c) The structure of the table that gets returned is determined by the SELECT statement within the function
31) What are multi statement table valued functions? These functions are very similar to inline table valued functions with slight differences. The function signature you specify the table structure.
	a) Prefer inline table valued functions over multi statement table valued functions for better performance. If given a task, if it can be achieved using an inline table valued function, use it.
	   Internally, SQL Server treats an inline table valued function much like it would a view and treats a multi-statement valued function similar to how it would a stored procedure	
	b) It's possible to update the underlying table, using an inline table valued function but not possible using multi-statement table valued functions	
32) Here are some important concepts related to functions in SQL Server:
	a) Deterministic functions always return the same result any time they are called with a specific set of input values and give the same state of the DB. SQUARE(), POWER(), SUM(), AVG(), COUNT()
	b) Nondeterministic functions may return different results each time they are called with a specific set of input values even if DB state they access remains the same. GETDATE(), CURRENT_TIMESTAMP
	c) RAND() is a nondeterministic function unless you provide the seed value.
	d) Encrypting a function definition using WITH ENCRYPTION OPTION works similar to encryption with stored procedures. 
	e) Creating a function WITH SCHEMABINDING option specifies that the function is bound to the database objects that it references. When SCHEMABINDING is specified, the base objects cannot be modified
	   in any way that would affect the function definition. The function definition itself must first be modified or dropped to remove dependencies on the object that is to be modified.
	   It's considered best practice to create your functions using the WITH SCHEMABINDING option. You'll get an error if you try to drop a table referenced within a function.	
33) What are temporary tables? They are very similar to permanent tables. Permanent tables get created in the database you specify and remain in the DB permanently until you delete them. Temporary
	tables get created in the TempDB and are automatically deleted when they are no longer used. You can query the local temp table with this command: SELECT * FROM TempDB..SYSOBJECTS WHERE Name LIKE '%PersonDetails%'
	Local temp tables will automatically droppe dwhen the connection that created it is closed. User can explicitly drop the temp table. If you create a local temp table as part of a SP, it gets dropped upon completion of SP execution. 
	It is possible for different connections to create local temp table with same name. When you view TempDB/Temporary Tables the design view you'll notice that the temp table name is appended with underscores and random numbers.
	Global temp tables are available to all SQL Server connections. In designer view, you won't see underscores and random numbers. They are dropped when last connection referencing the table is closed.
	When you use SELECT INTO a temporary table, you don't have to define the temporary table definition, SQL SERVER will derive from the SELECT list.
	You you declare a local temp table in an SP, you can use the same temp table within an SP that is called from within the original SP.
	a) Local temporary tables: #PersonDetails
	b) Global temporary tables: ##PersonDetails
34) You can create indexes on tables and views. You want to avoid Table Scans which is when SQL Server checks ever row in the table from beginning to end, bad for performance. With an index, SQL Server picks up the row addresses from
	the index and directly fetch the records from the table, rather than scanning each row in the table, this is called an Index Seek. You can use SP_HELPINDEX [tablename] to find all indexes created for table.
35) Describe the different types of indexes. You can use sp_helpindex to view index info.
	a) Clustered: determines the physical order of data in a table. For this reason, a table can have only one clustered index. If you don't auto increment primary key and insert rows out of order, SQL Server will sort in order.
				  Clustered indexes are similar to a telephone directory, the lookup has the data. Clustered indexes can contain multiple columns, these are called composite indexes. Only one clustered index per table
	b) Nonclustered: you can have multiple nonclustered indexes on a table. This is similar to a table of contents or index in the back of the book. You look at index to find page number to get to the real data.
					 In he index itself, the data is stored in an asc or desc order of the index key, which doesn't in any way influence the storage of data in the table. When compared to a clustered index, nonclustered indexes
					 are slower since they only contain a pointer back to the data and because of this, they require additional disk space
	c) Unique: unique index is used to enforce uniqueness of key values in the index. By default, primary key constraint creates a unique clustered index. Uniqueness is a property of an index and both clustered and nonclustered
			   indexes can be unique. There are no major differences between a unique index and constraint. In fact, when you add a unique constraint, a unique index gets created behind the scenes
	d) Filtered
	e) XML
	f) Full Text
	g) Spatial
	h) Columnstore
	i) Index with included columns
	j) Index on computed columns
36) What are the pros and cons of using indexes? 
	a) Advantages: indexes makes your reads faster. Insert, updates, and deletes benefit if predicate uses an index column if there are not too many indexes. 
				   ORDER BY sorting is faster as well if index columns are used. GROUP BY grouping is faster as well if inde columns are used.
	b) Disadvantages: additional disk space required if nonclustered index. DML (Data Manipulation Language) statements INSERT, UPDATE, DELETE can become slow since data in all indexes also needs to be updated. Indexes can help
				      to search and locate the rows we want to DELETE but too many indexes to update can actually hurt performance of data modifications
37) What is a covering index? If all the columns that you have requested in the SELECT clause of query are present in the index, then there is no need to lookup table. These are covering indexes (use INCLUDE). A clustered index
	is always a covering index obviously since it contains all of the data in a table. If you have an index on the salary column and your query only returns the salary column, it's a covering query
38) What is a view and it's advantages? A view is nothing more than a saved SQL query. It can also be considered as a virtual table. Views can be used to reduce complexity of DB schema. Views can be used as a mechanism to implement
	row and column level security. Views can be used to present aggregated data and hide detailed data.
39) Is it possible to INSERT, UPDATE, or DELETE from the underlying base table tblEmployees through the view? Yes, be careful when you're updating a view when your view's query contains more than one table.
40) What is an indexed view? When you create an index on a view, the view gets materialized. This means, the view is now capable of storing data. This is usually best used in OLAP (data warehouses). To create an indexed view you
	must create the view with SCHEMABINDING. If an aggregate function in the SELECT list references an expression, and if there is a possibility for that expression to become NULL, then a replacement value should be specified.
	If GROUP BY is specified, the view SELECT list must contain a COUNT_BIG(*) expression. The base tables in the view should be referenced with 2 part name. Indexed views are only good on tables that don't change frequently.
41) What are the limitations of views? 
	a) You cannot pass parameters to a view. Table Valued functions are an excellent replacement for parameterized views
	b) Rules and Defaults cannot be associated with views
	c) The ORDER BY clause is invalid in views unless TOP or FOR XML is also specified
	d) Views cannot be based on temporary tables
42) What are DML triggers? Fired automatically in response to DML events (INSERT, UPDATE, DELETE). They can be classified into 2 types, after triggers (FOR triggers) and instead of triggers. After triggers fires after triggering
	action. The INSERT, UPDATE, and DELETE statements, causes an after trigger to fire after the respective statements are completed. Instead of triggers fire instead of the triggering actions. The INSERT, UPDATE, and DELETE
	statements, causes an instead of trigger to fire instead of the respective statement execution.
	a) FOR INSERT trigger: you'll use the INSERTED table to access new values
	b) FOR DELETE trigger: you'll use the DELETED table to access old values
	c) FOR UPDATE trigger: you'll use the DELETED and INSERTED tables to access what values used to be and the new values
43) Why would you ever use an INSTEAD OF INSERT trigger? Imagine a scenario where you want to INSERT into a VIEW that joins multiple tables? You won't be able to do this because SQL SERVER will be confused. What you can do is 
	create an INSTEAD OF trigger which will get triggered when you try to INSERT into the VIEW. In the trigger, you can use the special tables (INSERTED, DELETED), you can check your invariants and throw an error if necessary.
44) Why would you ever use an INSTEAD OF UPDATE trigger? Same scenario as INSTEAD OF INSERT since views won't allow you to update if view affects multiple tables
45) Why would you ever use an INSTEAD OF DELETE trigger? Same scenario as INSTEAD OF INSERT since views won't allow you to delete if view affects multiple tables
46) What are table variables? Just like temp tables, a table variable is also created in TempDB. The scope of a table variable is the batch, stored procedure, or statement block in which it is declared. They can be passed as
	parameters between procedures. Unlike temp tables, you still have to define your table structure when you use SELECT INTO.
47) What are derived tables? When you define your SQL within parenthesis and use the AS keyword to define your table data name. SELECT DeptName, TotalEmployees FROM (your SQL) AS EmployeeCOUNT WHERE TotalEmployees >= 2.
	Derived tables are available only in the context of the current query.
48) What ace common table expressions (CTE)? A CTE is similar to a derived table in that it is not stored as an object and lasts only for the duration of the query. Basically it's a derived table that you define the structure 
	of before you use it in the query. WITH cteEmployeeCount AS (your SQL), specifying column names is optional. Add them when you want different names returned from the SELECT query within your CTE.
	A CTE can only be referenced by a SELECT, INSERT, UPDATE, or DELETE statement that immediately follows the CTE. When using multiple CTEs, use a comma to demarcate the CTEs, you only need to use one WITH clause.
	When using multiple CTEs, you can leverage the UNION statement with two SELECT statements and SQL Server will treat it as one query.
	You can update the underlying base table in a CTE if you're only working with one table or if the update affects only one table in a multiple table CTE (column names in UPDATE must be distinct in tables)
	You cannot update multiple tables in your UPDATE statement when trying to update using CTE.
	Be careful, even if your UPDATE succeeds, if CTE uses multiple tables, you might not get the results you're expecting. E.g., you update DeptName for a certain employee but it actually updates the DeptName in lookup table
49) How can you utilize a recursive CTE to display employees and their manager along with the hierarchy level? Table EmployeeManager has EmployeeId, Name, ManagerId
	WITH EmployeeCTE (EmployeeId, Name, ManagerId, [Level]) AS (
		SELECT EmployeeId, Name, ManagerId, 1
		FROM tblEmployee WHERE ManagerId IS NULL
			UNION ALL
		SELECT tblEmployee.EmployeeId, tblEmployee.Name, tblEmployee.ManagerId, EmployeesCTE.[Level] + 1
		FROM tblEmployee 
		JOIN EmployeesCTE ON tblEmployee.ManagerId = EmployeesCTE.EmployeeId
	)

	SELECT EmpCTE.Name as Employee, ISNULL(MgrCTE.Name, 'Super Boss') AS Manager, EmpCTE.[Level]
	FROM EmployeesCTE EmpCTE
	LEFT JOIN EmployeesCTE MgrCTE ON EmpCTE.ManagerId = MgrCTE.EmployeeId 
50) Describe DB normalization? Is the process of organizing data to minimize data redundancy (duplication) which in turn ensures data consistency. Problems of data redundancy include disk space waste, data inconsistency, and slow DML queries.
	Database normalization is a step by step process. There are 6 normal forms, First Normal Form (1NF) thru Sixth Normal Form (6NF). Most DBs are in third normal form (3NF). There are certain rules that each normal form should follow.
	a) 1NF: The data in each column should be atomic. No multiple values, separated by commas (Employee column values is 'Sam, Mike, Shan'). The table does not contain any repeating column groups (columns names include Employee1, Employee2, Employee3). 
	   Identify each record uniquely using primary key (tables to reference association using foreign keys).
	b) 2NF: Meets all 1NF conditions, move redundant data to a separate table, create relationship between these tables using foreign keys.
	c) 3NF: Meets all 1NF and 2NF conditions, does not contain columns (attributes) that are not fully dependent upon the primary key (e.g., an AnnualSalary (computed) and DeptHead (depends on DeptName or DeptId not EmpId primary key) in Employees table)
51) What is the PIVOT operator? It can be used to turn unique values from one column into multiple columns in the output, there by effectively rotating a table. Always use a derived table if table contains columns you don't need in PIVOT, e.g., an ID column 
	Table tblProductSales (Id, SalesAgent, SalesCountry, SalesAmount), PivotTable (SalesAgent, India, US, UK)
	SELECT SalesAgent, India, US, UK
	FROM (
		SELECT SalesAgent, SalesCountry, SalesAmount
		FROM tblProductSales
	) AS SourceTable
	PIVOT (
		SUM(SalesAmount) FOR SalesCountry IN ([India], [US], [UK])
	) AS PivotTable
52) How is error handling done in SQL Server? Use the RAISERROR function, RAISERROR('Error Message', ErrorSeverity, ErrorState), most of the time the ErrorSeverity is 16 which indicates general errors that can be corrected by the user. 
	ErrorState = a number between 1 and 255. RAISERROR only generates errors with state from 1 through 127. Use the system function @@ERROR <> 0 to check if statement has completed successfully. Rollback your transaction if you find an error.
	Keep in mind that the @@ERROR is cleared and reset on each statement execution. Check it immediately following the statement being verified, or save it to a local variable that can be checked later.
	It's better to use TRY CATCH over @@ERROR to detect your errors. To use TRY CATCH constructs, use BEGIN TRY END TRY BEGIN CATCH END CATCH. You cannot use TRY CATCH in user defined functions.
	Use RAISERROR() in the catch block to return error to the client code. In the catch statement you can use the following system functions for error details: ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_PROCEDURE(), ERROR_STATE(), ERROR_SEVERITY(), ERROR_LINE()
53) SQL Server default is to allow only reads on committed data. It might be an option to change this to allow reads of all data, SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	a) Atomic: All statements in the transaction either completed successfully or they were all rolled back. The task that the set of operations represents is either accomplised or not, but in any case not left half-done
	b) Consistent: All data touched by the transaction is left in a logically consistent state. E.g., if stock available numbers are decremented from tblProducts then there has to be related entry in tblProductSales. The inventory can't just disappear
	c) Isolated: Transaction must affect data without interfering with other concurrent transactions, or being interfed with by them. This prevents transactions from making changes to data based on uncommited information, for example changes to a record
		         that are subsequently rolled back. Most databases use locking to maintain transaction isolation
	d) Durable: Once a change is made, it is permanent. If a system error or power failure occures before a set of commands is complete, those commands are undone and the data is restored to it's original state once the system begins running again
54) What is a subquery? Subqueries also referred to as inner queries always return one column. You can use subqueries in WHERE and SELECT clauses. Subqueries can be nested up to 32 levels. Queries that contain the subquery is called the outer query.
	The columns from a table that is present only inside a subquery, cannot be used in the SELECT list of the outer query.
	SELECT Id, Name, [Description]
	FROM tblProducts
	WHERE Id NOT IN (
		SELECT DISTINCT(ProductId)
		FROM tblProductSales
	)

	SELECT tblProducts.Id, tblProducts.Name, tblProducts.[Description]
	FROM tblProducts
	LEFT JOIN tblProductSales ON tblProducts.Id = tblProductSales.ProductId
	WHERE tblProductSales.ProductId IS NULL

	SELECT Name
	(SELECT SUM(QuantitySold) FROM tblProductSales WHERE ProductId = tblProducts.Id) AS QtySold
	FROM tblProducts

	SELECT Name, SUM(QuantitySold) AS QtySold
	FROM tblProducts
	LEFT JOIN tblProductSales ON tblProducts.Id = tblProductSales.ProductId
	GROUP BY Name
55) What is a correlated subquery? If the subquery depends on the outer query for its values then that subquery is called a correlated subquery. Correlated subqueries get executed once for every row that is selected by the outer query. 
	Correlated subqueries cannot be executed independently of the outer query. Remember, sub query cannot be executed on it's own.
	SELECT Name
	(SELECT SUM(QuantitySold) FROM tblProductSales WHERE ProductId = tblProducts.Id) AS QtySold
	FROM tblProducts
56) How do you create large table with random data for performance testing? See video61.sql
57) How do you clear query cache and execution plan cache?
	CHECKPOINT
	GO
	DBCC DROPCLEANBUFFERS --clears query cache
	GO
	DBCC FREEPROCCACHE; --clears execution plan cache
	GO
58) What to choose for performance subquery or joins? According to MSDN, in most cases there is usually no performance difference. In some cases where existence must be checked, a join produces better performance. Otherwise the nested
	query must be processed for each result of the outer query. In such cases, a join approach would yield better results. In general joins work faster than subqueries but in reality it all depends on the execution plan that is generated
	by SQL Server. It does not matter how we have written the query, SQL Server will always transform it on an execution plan. If it is "smart" enough to generate the same plan from both queries, you will get the same result. Rather than 
	going by theory, turn on client statistics and execution plan to see the performance of each option then make a decision. See video62.sql
59) Explain cursors. If there is ever a need to process the rows, on a row-by-row basis, then cursors are your choice. Cursors are very bad for performance, and should be avoided always. Most of the time, cursors can be very easily replaced using joins.
	Cursors are similar to the Iterator pattern, see video63.sql for cursor example, see video64.sql to achieve the same thing using joins.
60) How do you list all tables in SQL Server? You can use the system tables: SYSOBJECTS, SYS.TABLES, or INFORMATION_SCHEMA.TABLES.
	-- Gets the list of tables only
	Select * from SYSOBJECTS where XTYPE='U'
	-- Gets the list of tables only
	Select * from  SYS.TABLES
	-- Gets the list of tables and views
	Select * from INFORMATION_SCHEMA.TABLES
	--To get the list of different object types (XTYPE) in a database
	Select Distinct XTYPE from SYSOBJECTS
61) How do you write a re-runnable (repeatsafe, idempotent, script? 1. Check for the existence of the table 2. Create the table if it does not exist 3. Else print a message stating, the table already exists. See video66.sql
62) How do you alter DB columns without dropping table? You have two options:
	Option 1) Use a sql query to alter the column as shown below: Alter table tblEmployee Alter column Salary int
	Option 2) Disable "Prevent saving changes that require table re-creation" option in sql server 2008
		a. Open Microsoft SQL Server Management Studio 2008
		b. Click Tools, select Options
		c. Expand Designers, and select "Table and Database Designers"
		d. On the right hand side window, uncheck, Prevent saving changes that require table re-creation
		e. Click OK
63) How do you use optional parameters in SQL Server stored procedures? Use "= NULL" in the argument list
	Create Proc spSearchEmployees
		@Name nvarchar(50) = NULL,
		@Email nvarchar(50) = NULL,
		@Age int = NULL,
		@Gender nvarchar(50) = NULL
	as
	Begin
		Select * from tblEmployee 
		where (Name = @Name OR @Name IS NULL) AND
		(Email = @Email OR @Email IS NULL) AND
		(Age = @Age OR @Age IS NULL) AND
		(Gender = @Gender OR @Gender IS NULL) 
	End
64) What is the MERGE statement? It allows us to perform inserts, updates, and deletes in one statement. With merge statement we require 2 tables
	1. Source Table - Contains the changes that needs to be applied to the target table
	2. Target Table - The table that require changes (Inserts, Updates and Deletes)
	The merge statement joins the target table to the source table by using a common column in both the tables. Based on how the rows match up as a result of the join, we can then perform insert, update, and delete on the target table. 
	MERGE StudentTarget AS T
	USING StudentSource AS S
	ON T.ID = S.ID
	WHEN MATCHED THEN
		 UPDATE SET T.NAME = S.NAME
	WHEN NOT MATCHED BY TARGET THEN
		 INSERT (ID, NAME) VALUES(S.ID, S.NAME)
	WHEN NOT MATCHED BY SOURCE THEN
		 DELETE;
65) Discuss concurrent transactions issues. Common concurrency problems include dirty reads, lost updates, nonrepeatable reads, phantom reads. To selectively mitigate these problems SQL Server provides transaction isolation levels
	a) Read Uncommitted (D = Yes, L = Yes, N = Yes, P = Yes), lowest isolation level, you incur all common concurrency problems
	b) Read Commimitted (D = No, L = Yes, N = Yes, P = Yes), this is SQL Server default
	c) Repeatable Read (D = No, L = No, N = No, P = Yes)
	d) Snapshot (D = No, L = No, N = No, P = No)
	e) Serializable (D = No, L = No, N = No, P = No), highest isolation level, you will run into performance problems
66) What is dirty read? A dirty read happens when one transaction is permitted to read data that has been modified by another transaction that has not yet been committed. In most cases this would not cause a problem. 
	However, if the first transaction is rolled back after the second reads the data, the second transaction has dirty data that does not exist anymore, see video71.sql
67) What is lost update? Lost update problem happens when 2 transactions read and update the same data. Let's understand this with an example, see video72.sql
68) What is non repeatable read? Non repeatable read problem happens when one transaction reads the same data twice and another transaction updates that data in between the first and second read of transaction one, see video73.sql 
69) What is phantom read? Phantom read happens when one transaction executes a query twice and it gets a different number of rows in the result set each time. 
	This happens when a second transaction inserts a new row that matches the WHERE clause of the query executed by the first transaction, see video74.sql
70) Difference between repeatable read and serializable. Repeatable read prevents only non-repeatable read. Repeatable read isolation level ensures that the data that one transaction has read, will be prevented from being updated or 
	deleted by any other transaction, but it doe not prevent new rows from being inserted by other transactions resulting in phantom read concurrency problem. Serializable prevents both non-repeatable read and phantom read problems. 
	Serializable isolation level ensures that the data that one transaction has read, will be prevented from being updated or deleted by any other transaction. It also prevents new rows from being inserted by other transactions, 
	so this isolation level prevents both non-repeatable read and phantom read problems. 
71) Read committed snapshot isolation level: Read committed snapshot isolation level is not a different isolation level. It is a different way of implementing Read committed isolation level. 
	One problem we have with Read Committed isloation level is that, it blocks the transaction if it is trying to read the data, that another transaction is updating at the same time, see video76.sql
72) Difference between snapshot isolation and read committed snapshot, see video77.sql
	Update conflicts: Snapshot isolation is vulnerable to update conflicts where as Read Committed Snapshot Isolation is not. When a transaction running under snapshot isolation triess to update data that an another transaction is already updating at the sametime, an update conflict occurs and the transaction terminates and rolls back with an error. 
	Existing application: If your application is using the default Read Committed isolation level, you can very easily make the application to use Read Committed Snapshot Isolation without requiring any change to the application at all. All you need to do is turn on READ_COMMITTED_SNAPSHOT option in the database, which will change read committed isolation to use row versioning when reading the committed data.
	Distributed transactions: Read Committed Snapshot Isolation works with distributed transactions, whereas snapshot isolation does not.
	Read consistency: Read Committed Snapshot Isolation provides statement-level read consistency where as Snapshot Isolation provides transaction-level read consistency. The following diagrams explain this.
	#################################################################################################################################################################
	Read Committed Snapshot Isolation															Snapshot Isolation
	No update conflicts																			Vulnerable to update conflicts
	Works with existing applications without requiring any change to the application			Application change may be required to use with an existing application
	Can be used with distributed transactions													Cannot be used with distributed transactions
	Provides statement-level read consistency													Provides transaction-level read consistency
73) What is a deadlock? In a database, a deadlock occurs when two or more processes have a resource locked, and each process requests a lock on the resource that another process has already locked, see video78.sql 
	Neither of the transactions here can move forward, as each one is waiting for the other to release the lock. When deadlocks occur, SQL Server will choose one of processes as the deadlock victim 
	and rollback that process, so the other process can move forward. The transaction that is chosen as the deadlock victim will produce the following error.
	Msg 1205, Level 13, State 51, Line 1
	Transaction (Process ID 57) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction. 
74) SQL Server deadlock victim selection, see video79.sql
	How SQL Server detects deadlocks, Lock monitor thread in SQL Server, runs every 5 seconds by default to detect if there are any deadlocks. If the lock monitor thread finds deadlocks, 
	the deadlock detection interval will drop from 5 seconds to as low as 100 milliseconds depending on the frequency of deadlocks. If the lock monitor thread stops finding deadlocks, 
	the Database Engine increases the intervals between searches to 5 seconds. 
	What happens when a deadlock is detected, When a deadlock is detected, the Database Engine ends the deadlock by choosing one of the threads as the deadlock victim. The deadlock victim's 
	transaction is then rolled back and returns a 1205 error to the application. Rolling back the transaction of the deadlock victim releases all locks held by that transaction. This allows 
	the other transactions to become unblocked and move forward. 
	What is DEADLOCK_PRIORITY, By default, SQL Server chooses a transaction as the deadlock victim that is least expensive to roll back. However, a user can specify the priority of sessions 
	in a deadlock situation using the SET DEADLOCK_PRIORITY statement. The session with the lowest deadlock priority is chosen as the deadlock victim. 
	DEADLOCK_PRIORITY 
	1. The default is Normal
	2. Can be set to LOW, NORMAL, or HIGH
	3. Can also be set to a integer value in the range of -10 to 10.
	 LOW : -5
	 NORMAL : 0
	 HIGH : 5 

	What is the deadlock victim selection criteria
	1. If the DEADLOCK_PRIORITY is different, the session with the lowest priority is selected as the victim
	2. If both the sessions have the same priority, the transaction that is least expensive to rollback is selected as the victim
	3. If both the sessions have the same deadlock priority and the same cost, a victim is chosen randomly 
75) Logging deadlocks in sql server. When deadlocks occur, SQL Server chooses one of the transactions as the deadlock victim and rolls it back. There are several ways in SQL Server to track down 
	the queries that are causing deadlocks. One of the options is to use SQL Server trace flag 1222 to write the deadlock information to the SQL Server error log. 
	Enable Trace flag : To enable trace flags use DBCC command. -1 parameter indicates that the trace flag must be set at the global level. If you omit -1 parameter the trace flag will be set 
	only at the session level. 

	DBCC Traceon(1222, -1) 

	To check the status of the trace flag
	DBCC TraceStatus(1222, -1) 

	DBCC Traceoff(1222, -1)
	
	To read the error log
	EXECUTE sp_readerrorlog 
76) How do you capture deadlocks in SQL Profiler?
	1. Open SQL Profiler
	2. Click File - New Trace. Provide the credentials and connect to the server
	3. On the general tab, select "Blank" template from "Use the template" dropdownlist
	4. On the "Events Selection" tab, expand "Locks" section and select "Deadlock graph" event
	5. Finally click the Run button to start the trace
	6. At this point execute the code that causes deadlock
	7. The deadlock graph should be captured in the profiler

	The deadlock graph data is captured in XML format. If you want to extract this XML data to a physical file for later analysis, you can do so by following the steps below.
	1. In SQL profiler, click on "File - Export - Extract SQL Server Events - Extract Deadlock Events"
	2. Provide a name for the file
	3. The extension for the deadlock xml file is .xdl
	4. Finally choose if you want to export all events in a single file or each event in a separate file

	The deadlock information in the XML file is similar to what we have captured using the trace flag 1222.

	Analyzing the deadlock graph
	1. The oval on the graph, with the blue cross, represents the transaction that was chosen as the deadlock victim by SQL Server.
	2. The oval on the graph represents the transaction that completed successfully.
	3. When you move the mouse pointer over the oval, you can see the SQL code that was running that caused the deadlock.
	4. The oval symbols represent the process nodes a) Server Process Id : If you are using SQL Server Management Studio you can see the server process id on information bar at the bottom. b) Deadlock Priority : If you have not set DEADLOCK PRIORITY 
	   explicitly using SET DEADLOCK PRIORITY statement, then both the processes should have the same default deadlock priority NORMAL (0). c) Log Used : The transaction log space used. If a transaction has used a lot of log space then the cost to roll it back is also more. 
	   So the transaction that has used the least log space is killed and rolled back.
	5. The rectangles represent the resource nodes. a) HoBt ID : Heap Or Binary Tree ID. Using this ID query sys.partitions view to find the database objects involved in the deadlock. SELECT object_name([object_id]) FROM sys.partitions WHERE hobt_id = 72057594041663488
	6. The arrows represent types of locks each process has on each resource node.
77) How do you handle deadlock with TRY CATCH? See video83.sql
78) How do you handle deadlock in ADO.NET? Wrap around C# try catch, catch SqlException and look for ex.Number == 1205
79) How can you implement retry logic for deadlock exceptions? Example uses C#, ASP.NET, SQL Server, and jQuery AJAX. See video85.txt for code snippet
80) How to find blocking queries? One way to do this is by using DBCC OpenTran. DBCC OpenTran will display only the oldest active transaction. It is not going to show you all the open transactions. DBCC OpenTran
	See video86.sql for query to find blocking.
81) How do you kill processes in SQL Server?
	Killing the process using SQL Server Activity Monitor: 
	1. Right Click on the Server Name in Object explorer and select "Activity Monitor"
	2. In the "Activity Monitor" window expand Processes section
	3. Right click on the associated "Session ID" and select "Kill Process" from the context menu

	Killing the process using SQL command: 
	KILL Process_ID
82) What is the EXCEPT operator? EXCEPT operator returns unique rows from the left query that aren’t in the right query's results, see video88.sql
83) What is the difference between EXCEPT and NOT IN? Except filters duplicates and returns only DISTINCT rows from the left query that aren’t in the right query’s results, where as NOT IN does not filter the duplicates.
	EXCEPT operator expects the same number of columns in both the queries, where as NOT IN, compares a single column from the outer query with a single column from the subquery.
	Select Id, Name, Gender From TableA
	Except
	Select Id, Name, Gender From TableB

	Select Id, Name, Gender From TableA
	Where Id NOT IN (Select Id from TableB)
84) What is the INTERSECT operator? Intersect operator retrieves the common records from both the left and the right query of the Intersect operator, see video89.sql
85) What is the difference between INTERSECT and INNER JOIN?
	1. INTERSECT filters duplicates and returns only DISTINCT rows that are common between the LEFT and Right Query, where as INNER JOIN does not filter the duplicates.
	2. INNER JOIN treats two NULLS as two different values. So if you are joining two tables based on a nullable column and if both tables have NULLs in that joining column then, INNER JOIN will not include those rows in the result-set, where as INTERSECT treats two NULLs as a same value and it returns all matching rows.

continue on part 90
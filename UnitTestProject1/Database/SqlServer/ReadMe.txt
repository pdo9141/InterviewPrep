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
	a) Local temporary tables: #PersonDetails
	b) Global temporary tables: ##PersonDetails
34) You can create indexes on tables and views. You want to avoid Table Scans which is when SQL Server checks ever row in the table from beginning to end, bad for performance. With an index, SQL Server picks up the row addresses from
	the index and directly fetch the records from the table, rather than scanning each row in the table, this is called an Index Seek. You can use SP_HELPINDEX [tablename] to find all indexes created for table.




continue on part 36
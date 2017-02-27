USE TestDB

--drop table Employees

--Create table Employees
--(
--	ID int primary key identity,
--	FirstName nvarchar(50),
--	LastName nvarchar(50),
--	Gender nvarchar(50),
--	Salary int
--)
--GO

--Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
--Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
--Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
--Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
--Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
--Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
--Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
--Insert into Employees values ('John', 'Stanmore', 'Male', 80000)
--GO

SELECT DISTINCT Salary FROM Employees WITH (NOLOCK) ORDER BY Salary DESC

-- Get 2nd highest salary using subquery
SELECT
	TOP 1 Salary
FROM (
	SELECT
		DISTINCT TOP 2 Salary
	FROM Employees
	ORDER BY Salary DESC
) SubQueryResult
ORDER BY Salary

GO
-- Get 2nd highest salary using CTE and DENSE_RANK
WITH Result AS (
	SELECT
		Salary,
		DENSE_RANK() OVER (ORDER BY Salary DESC)  AS DenseRank
	FROM Employees
)

SELECT
	TOP 1 Salary
FROM Result 
WHERE DenseRank = 2





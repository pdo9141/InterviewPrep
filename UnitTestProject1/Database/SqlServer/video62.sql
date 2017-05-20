--https://www.youtube.com/watch?v=dAQhBJMAeqc&index=62&list=PL08903FB7ACA1C2FB

--At this stage please clean the query and execution plan cache using the following T-SQL command. 
CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; -- Clears query cache
Go
DBCC FREEPROCCACHE; -- Clears execution plan cache
GO

--The following query, returns, the list of products that we have sold atleast once. This query is formed using sub-queries. When I execute this query I get 306,199 rows in 6 seconds
Select Id, Name, Description
from tblProducts
where ID IN
(
 Select ProductId from tblProductSales
) 

Select distinct tblProducts.Id, Name, Description
from tblProducts
inner join tblProductSales
on tblProducts.Id = tblProductSales.ProductId

--The following query returns the products that we have not sold at least once. This query is formed using sub-queries. When I execute this query I get 93,801 rows in 3 seconds
Select Id, Name, [Description]
from tblProducts
where Not Exists(Select * from tblProductSales where ProductId = tblProducts.Id)

Select tblProducts.Id, Name, [Description]
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
where tblProductSales.ProductId IS NULL 

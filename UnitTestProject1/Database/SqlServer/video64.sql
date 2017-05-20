--https://www.youtube.com/watch?v=4LbPZXeOARY&list=PL08903FB7ACA1C2FB&index=64

Update tblProductSales
set UnitPrice = 
 Case 
  When Name = 'Product - 55' Then 155
  When Name = 'Product - 65' Then 165
  When Name like 'Product - 100%' Then 10001
 End     
from tblProductSales
join tblProducts
on tblProducts.Id = tblProductSales.ProductId
Where Name = 'Product - 55' or Name = 'Product - 65' or 
Name like 'Product - 100%' 


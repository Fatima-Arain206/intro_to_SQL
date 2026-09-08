/*
Write advanced T-SQL queries
Estimated Time: 30 minutes

In this exercise, you practice using JSON functions to build and query JSON data from the AdventureWorksLT database. You also combine JSON output with a CTE and a window function to create a practical report.

You are a database developer for an e-commerce company. The marketing team needs product data in JSON format for a web catalog, and you need to create reports that rank products within categories.

📝 These exercises ask you to copy and paste T-SQL code. Please verify that the code has been copied correctly, before executing the code.

Prerequisites
SQL Server 2022+ or Azure SQL Database
A query tool such as SQL Server Management Studio
A connection with read permissions
AdventureWorks lightweight sample database (SQL Server or Azure SQL)
Connect to AdventureWorksLT
Ensure the AdventureWorksLT sample database is restored and available on your SQL instance. Verify connectivity:

Copy and paste the following T-SQL code into a new query window. Select Execute to execute this query.

sql
 -- Verify key tables in AdventureWorksLT
 SELECT TOP (5) ProductID, Name, ListPrice 
 FROM SalesLT.Product;
    
 SELECT TOP (5) ProductCategoryID, Name 
 FROM SalesLT.ProductCategory;
Each query should return up to five rows of sample data. If any query returns no rows or fails, confirm that the AdventureWorksLT database is properly restored and that you have read access.

Build JSON output from product data
The marketing team needs product information in JSON format for a web catalog. Start by creating a simple JSON object from the Product table.

Create a JSON object for each product
Use FOR JSON PATH to convert product rows into JSON.

Copy and paste the following T-SQL code into a new query window. Select Execute to execute this query.

sql
 SELECT 
     ProductID,
     Name,
     Color,
     ListPrice
 FROM SalesLT.Product
 WHERE Color IS NOT NULL
 ORDER BY ListPrice DESC
 FOR JSON PATH;
This query selects products with a color value and formats the results as a JSON array. Each row becomes a JSON object with properties matching the column names. The FOR JSON PATH clause handles the conversion automatically.

Create nested JSON with product categories
Add category information as a nested object.

Copy and paste the following T-SQL code into a new query window. Select Execute to execute this query.

sql
 SELECT 
     p.ProductID,
     p.Name AS ProductName,
     p.ListPrice,
     JSON_OBJECT(
         'CategoryID': pc.ProductCategoryID,
         'CategoryName': pc.Name
     ) AS Category
 FROM SalesLT.Product AS p
 INNER JOIN SalesLT.ProductCategory AS pc
     ON p.ProductCategoryID = pc.ProductCategoryID
 ORDER BY p.ListPrice DESC
 FOR JSON PATH;
This query uses JSON_OBJECT to build a nested structure. The Category property contains its own JSON object with CategoryID and CategoryName. This approach keeps related data grouped together in the output.

Combine JSON with a CTE and window function
Now create a more useful report that ranks products by price within each category and outputs the result as JSON.
*/
with RankedProduts as(
select 
    p.ProductID,
    p.Name,
    pc.CategoryName,
    p.ListPrice,
    row_number() over(partition by pc.ProductCategoryID order by p.ListPrice desc) as priceRank

from dbo.Products p
inner join dbo.ProductCategories as pc
on p.ProductCategoryID = pc.ProductCategoryID
where p.ListPrice >0
)

select 
ProductID,
     Name,
     CategoryName,
     ListPrice,
     priceRank
from RankedProduts
WHERE PriceRank <= 3
 ORDER BY CategoryName, PriceRank;
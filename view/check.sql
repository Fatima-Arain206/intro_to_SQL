CREATE VIEW OrderSummary
AS
SELECT 
    OrderID,
 
    OrderDate,
    TotalAmount,
    CASE 
        WHEN TotalAmount < 100 THEN 'Small'
        WHEN TotalAmount < 1000 THEN 'Medium'
        ELSE 'Large'
    END AS OrderSize
 from [Order]


 select * from [Order]

 -- c
 create VIEW supplier_summary_contact
 AS
 SELECT
 s.SupplierID,
 s.SupplierName,
 s.Email,
 s.Phone


 from SUPPLIER as s 
 

--
SELECT 
Email ,SupplierName
from supplier_summary_contact

update supplier_summary_contact
set SupplierName ='Hamza'
where SupplierID =1

--Use the WITH CHECK OPTION clause when views will handle data modifications. This option ensures that INSERT and UPDATE statements through the view only affect rows visible in the view:

select * from Category

create VIEW Category_summary
as 
SELECT
CategoryName,
Descripton
from Category
WHERE CategoryName='Electronics'
with check OPTION
--

SELECT * from Category_summary
UPDATE Category_summary 
set CategoryName ='Clothes'-- get error

update Category_summary
SET Descripton =' This was bad'
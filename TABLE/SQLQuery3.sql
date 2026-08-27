-- Create clustered index on primary key (defines physical row order)
CREATE CLUSTERED INDEX IX_Product_ProductID 
ON Product(ProductID);

-- Create non-clustered index on frequently searched column
CREATE NONCLUSTERED INDEX IX_Product_Category 
ON Product(Category) 
INCLUDE (ProductName, Price);
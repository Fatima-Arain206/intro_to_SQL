--Create a temporal table for price history
CREATE TABLE ProductPrice(
    PriceD int PRIMARY KEY identity(1,1)
    ,
    ProductID int not null
    FOREIGN KEY (ProductID ) REFERENCES Product(ProductID),
    CurrentPrice DECIMAL(10,2) not null,
    EffectiveDate DATE,
    SysStartTime Datetime2 generated always as row  START,
    SysEndTime Datetime2 generated always as row end,
    period for SYSTEM_TIME(SysStartTime,SysEndTime)
)
with (system_versioning = on);

 -- Insert initial price data
 INSERT INTO ProductPrice (ProductID, CurrentPrice, EffectiveDate)
 VALUES (1, 99.99, '2025-01-01'), (2, 149.99, '2025-01-01');

 -- Update price (creates history entry)
 UPDATE ProductPrice SET CurrentPrice = 109.99 WHERE ProductID = 1;
 GO



 -- Query price history
 SELECT ProductID, CurrentPrice, SysStartTime, SysEndTime
 FROM ProductPrice
 FOR SYSTEM_TIME ALL
 WHERE ProductID = 1;

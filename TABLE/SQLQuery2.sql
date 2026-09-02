--INSERTION
INSERT INTO dbo.ProductPrice
    VALUES (1, 99.99, '2025-01-01'), (2, 149.99, '2025-01-01');


    SELECT * FROM ProductPrice
    UPDATE ProductPrice
    SET CurrentPrice = 220.98 
    WHERE ProductID = 1
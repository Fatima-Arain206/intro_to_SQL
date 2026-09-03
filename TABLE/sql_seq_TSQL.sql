-- Create sequence
CREATE SEQUENCE OrderNumber 
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1000
    MAXVALUE 999999
    NO CYCLE;

-- Use sequence in INSERT with NEXT VALUE FOR function
INSERT INTO [Order] (OrderID, OrderDate)
VALUES (1, 100, NEXT VALUE FOR OrderNumber, GETDATE());

-- Get next value before INSERT
DECLARE @NextOrderNum INT = NEXT VALUE FOR OrderNumber;
SELECT @NextOrderNum;

-- Get multiple sequence numbers at once for batch processing
DECLARE @FirstSeq INT, @LastSeq INT;
EXEC sp_sequence_get_range 
    @sequence_name = N'OrderNumber',
    @range_size = 100,
    @range_first_value = @FirstSeq OUTPUT,
    @range_last_value = @LastSeq OUTPUT;

-- Reset sequence
ALTER SEQUENCE OrderNumber RESTART WITH 1000;
select * from [Order]
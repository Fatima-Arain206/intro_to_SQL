CREATE TABLE ORDERS(
    ORDERID INT PRIMARY KEY IDENTITY,
    CUSTOMERID INT   NOT NULL,
    ORDERNUMBER INT NOT NULL,
    ORDERDATE DATETIME2  
);

CREATE TABLE ORDERDETAILS(
    OrderID int PRIMARY KEY IDENTITY,
    CustomerID int not null,
      FOREIGN KEY (OrderID)  REFERENCES ORDERS(OrderID),
      ordernumber int not null
)
create SEQUENCE ordernumber
as int
start with 1
maxvalue  10
minvalue 1
increment by 2
no cycle

DECLARE @ornumber int;
set @ornumber =  next value for ordernumber

-- insrt data 

insert into ORDERS
VALUES( @ornumber,2,GETUTCDATE())

insert into ORDERDETAILS
VALUES(2,@ornumber)

select * from ORDERS,ORDERDETAILS



-- Get multiple sequence numbers at once for batch processing
DECLARE @FirstSeq INT, @LastSeq INT;
EXEC sp_sequence_get_range 
    @sequence_name = N'ordernumber',
    @range_size = 10,
    @range_first_value = @FirstSeq OUTPUT,
    @range_last_value = @LastSeq OUTPUT;

-- Reset sequence
ALTER SEQUENCE ordernumber RESTART WITH 1000
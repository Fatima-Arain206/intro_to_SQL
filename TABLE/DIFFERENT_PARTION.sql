--create PARTION BY NUMBERS
CREATE PARTITION FUNCTION
PF_InvoiceNumber(INT)
as  range LEFT for 
VALUES(100000, 200000, 300000, 400000);

-- PARTION BY REGIONS
CREATE PARTITION FUNCTION PF_Regional(VarCHAR(50))
as range left for values
('EAST','NORTH','WEST','SOUTH')

CREATE PARTITION SCHEME PS_REGION
AS PARTITION PF_Regional  ALL to  ([primary])


CREATE table RegionalData(
DataID int not null,
Region varchar(50) not null,
Value decimal(10,2),
CONSTRAINT PK_RegionalData primary key(DataID,Region)) 
on PS_REGION(Region);


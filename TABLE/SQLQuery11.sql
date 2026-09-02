-- create temporal table
use EcommerceDB
CREATE TABLE ProductPrice(
PriceID int PRIMARY KEY IDENTITY(1,1),
ProductID int not null
FOREIGN KEY (ProductID) references Products(ProductID),
CurrentPrice Decimal(10,2) not null,
EffectiveDate Date not null,
SysStartTime DateTime2 GENERATED ALWAYS AS ROW START HIDDEN,
SysEndTime DateTime2 GENERATED ALWAYS AS ROW END HIDDEN,
period for System_time(SysStartTime,SysEndTime)
)
with (SYSTEM_VERSIONING=ON);

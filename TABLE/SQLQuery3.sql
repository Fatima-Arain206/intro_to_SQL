-- CHECK BOTH TABLES
SELECT 
ProductID,CurrentPrice,SysStartTime,SysEndTime
	
	FROM ProductPrice
	for System_time all
	where ProductID=1
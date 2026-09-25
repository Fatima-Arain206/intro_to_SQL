-- Return one summary row for each partition of the OrderDate column.
SELECT
	-- Return the partition number for each order date.
	$PARTITION.pf_orderDate_partion(OrderDate) AS number,
	-- Count the orders stored in each partition.
	COUNT(*) AS orders_inPartion,
	-- Show the earliest order date in the partition.
	MIN(OrderDate) AS minDate,
	-- Show the latest order date in the partition.
	MAX(OrderDate) AS MaxOrderDate
FROM [Order]
-- Group rows by the partition containing their OrderDate.
GROUP BY $PARTITION.pf_orderDate_partion(OrderDate);

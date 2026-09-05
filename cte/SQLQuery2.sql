-- Generate a sequence of dates for the current month
WITH DateSequence AS
(
    -- Anchor: Get the first day of the current month
    SELECT CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) AS DATE) AS DateValue

    UNION ALL

    -- Recursive: Add one day until we reach the end of the month
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateSequence
    WHERE DateValue < EOMONTH(GETDATE())
)
-- Output each date with its day name
SELECT DateValue, DATENAME(WEEKDAY, DateValue) AS DayName
FROM DateSequence
OPTION (MAXRECURSION 31);  -- Allow up to 31 iterations (max days in a month)
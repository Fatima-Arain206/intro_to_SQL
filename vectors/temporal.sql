create table ledger (
    EmployeeID int primary key identity(1,1),
    EmployeeName varchar(50) not null,
    Department varchar(60) not null,
    -- Salary stores a fixed-point amount with 10 total digits and 2 digits after the decimal point; it cannot be NULL.
    Salary decimal(10,2) not null,
    sysStartTime datetime2 generated  always as row start hidden not null,
    -- sysEndTime stores when the current row version stops being valid, is maintained by SQL Server, hidden from normal wildcard queries, and required.
    sysEndTime datetime2 generated always as row end hidden not null,
    -- PERIOD identifies the two columns that define each row version's system-time validity interval.
    period for system_time (sysStartTime, sysEndTime)

    -- The blank line above separates the column definitions from the table option below.
) with (system_versioning = on (history_table = dbo.ledgerHistory));
-- WITH enables table options; SYSTEM_VERSIONING automatically tracks changes, and HISTORY_TABLE names the table for older row versions.
-- Rename the temporal table.
exec sp_rename 'dbo.ledger', 'employee_ledger';


-- Note: This creates a system-versioned temporal table. SQL Server automatically
-- records each row's validity period and stores previous versions in
-- dbo.ledgerHistory. The query below returns the version of EmployeeID 1 that
-- was valid at the specified date and time.
-- SELECT retrieves columns from the ledger table.
select * from employee_ledger
-- FOR SYSTEM_TIME AS OF returns the row version valid at the specified point in time.
for system_time as of '2026-06-01'
-- WHERE limits the result to the employee whose EmployeeID is 1.
where EmployeeID = 1;
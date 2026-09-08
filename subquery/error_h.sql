BEGIN TRY
    -- Attempt an operation that might fail
    INSERT INTO Sales.Customers (CustomerID, FirstName, LastName)
    VALUES (1, 'Test', 'Customer');  -- Duplicate key causes error
END TRY
BEGIN CATCH
    -- Log error details to a table using the ERROR_* functions
    INSERT INTO ErrorLog (
        ErrorTime,
        ErrorNumber,
        ErrorSeverity,
        ErrorState,
        ErrorProcedure,
        ErrorLine,
        ErrorMessage
    )
    VALUES (
        GETDATE(),
        ERROR_NUMBER(),       -- The error number (e.g., 2627 for duplicate key)
        ERROR_SEVERITY(),     -- Severity level (0-25)
        ERROR_STATE(),        -- Error state for debugging
        ISNULL(ERROR_PROCEDURE(), 'Ad hoc query'),  -- NULL if not in a procedure
        ERROR_LINE(),         -- Line number where error occurred
        ERROR_MESSAGE()       -- Full error message text
    );

    -- Re-raise the error to the calling application
    THROW;
END CATCH;
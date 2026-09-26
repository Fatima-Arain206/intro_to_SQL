
--A stored procedure is a compiled collection of T-SQL statements that SQL Server stores and executes as a single unit. Unlike unplanned queries that you send to the server each time, stored procedures are precompiled and optimized, which means they run faster on subsequent executions.

--You use stored procedures to encapsulate complex business logic, enforce data validation rules, and control how applications interact with your database. For example, instead of allowing direct table access, you can create stored procedures that validate input, apply business rules, and log changes before modifying data.

--The performance benefits come from query plan caching. With unplanned queries, SQL Server must parse and optimize each query every time. With stored procedures, the execution plan is cached after the first run, reducing overhead for repeated operations.

 *\

CREATE PROCEDURE dbo.GetCustomerOrders
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        OrderID,
        
        OrderDate,
        TotalAmount
    FROM dbo.[Order]
    ORDER BY OrderDate DESC;
END


EXEC dbo.GetCustomerOrders

--the SET NOCOUNT ON statement prevents the message about the number of rows affected from being sent to the client. This reduces network traffic and improves performance, especially when the procedure executes multiple statements.


--Create stored procedures
--Completed
100 XP
6 minutes
Choose your preferred content format
Stored procedures are one of the most powerful tools in SQL Server for encapsulating business logic and improving application performance. When you create stored procedures, you build reusable code blocks that execute on the server, reducing network traffic and centralizing data access logic.


--Create basic stored procedures
--Creating a stored procedure starts with the CREATE PROCEDURE statement followed by your T-SQL logic. You specify the procedure name using a schema-qualified identifier, which improves clarity and performance.

--SQL
CREATE PROCEDURE dbo.GetCustomerOrders
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        OrderID,
        CustomerID,
        OrderDate,
        TotalAmount
    FROM dbo.Orders
    ORDER BY OrderDate DESC;
END
--The SET NOCOUNT ON statement prevents the message about the number of rows affected from being sent to the client. This reduces network traffic and improves performance, especially when the procedure executes multiple statements.

--When you create procedures, use the BEGIN and END keywords to clearly define the procedure body. This makes your code more readable and helps prevent errors when adding or modifying logic later.

--Work with parameters
--Parameters make stored procedures flexible and reusable. You define input parameters to accept values from the calling application, and output parameters to return values back to the caller.

--Input parameters use the @ symbol followed by a parameter name and data type. You can provide default values to make parameters optional:

create procedure dbo.customerOrderDate
    @OrderID int,
    @StartDate datetime2 = null,
    @endDate datetime2 =null
    as 
    begin

        select 
            o.OrderID,
            o.OrderDate,
            o.TotalAmount
        from [Order]as o
        where o.OrderID= @OrderID
        
            and(@StartDate is null or OrderDate >= @StartDate)
            AND (@EndDate IS NULL OR OrderDate <= @EndDate)
            ORDER BY OrderDate DESC;
    END



  exec dbo.customerOrderDate
  @OrderID =1

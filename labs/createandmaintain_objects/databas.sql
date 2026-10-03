CREATE SCHEMA hr;
GO

CREATE TABLE hr.Employee
(
	EmployeeID INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	JobTitle NVARCHAR(100) NOT NULL
);

INSERT INTO hr.Employee (EmployeeID, FirstName, LastName, JobTitle)
VALUES
	(1, N'Ava', N'Patel', N'Analyst'),
	(2, N'Liam', N'Chen', N'Manager');
GO

CREATE OR ALTER PROCEDURE dbo.usp_GetDatabaseName
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DB_NAME() AS DatabaseName;
END;



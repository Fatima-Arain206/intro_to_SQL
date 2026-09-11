CREATE TABLE [dbo].[Customers]
(
    [CustomerID] INT NOT NULL PRIMARY KEY,
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(100) NULL,
    [PhoneNumber] NVARCHAR(20) NULL
);

--Build and validate the project
--Building is where the safety net kicks in. The build process validates every object reference and checks T-SQL syntax against the target platform. If a view references a column that doesn't exist, the build fails. If you use a vector function added in SQL Server 2025 but your project targets SQL Server 2017 (Sql140), the build catches it.

--To build from the command line:
-- dotnet build MyDatabaseProject.sqlproj

--Once you have a .dacpac, SqlPackage handles the deployment. Install it as a .NET global tool:
-- dotnet tool install --global microsoft.sqlpackage

--Then publish to a target database:
sqlpackage /Action:Publish /SourceFile:"C:\Users\arain\intro_to_SQL\security\MyDatabaseProject.dacpac" /TargetConnectionString:"Server=localhost;Database=MyDatabase;Trusted_Connection=True;"
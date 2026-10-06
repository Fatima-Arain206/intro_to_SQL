# Node / SQL Integration

This folder is for connecting SQL Server to JavaScript or Node-based tooling.

## Why this matters
SQL is often used together with application code. Node.js is a common way to build services that query, insert, and transform database data.

## Common tasks here
- create database connections
- execute queries from Node.js
- read result sets in application code
- build simple data APIs or scripts

## Example idea
```javascript
const sql = require('mssql');

async function getCustomers() {
  const pool = await sql.connect('Server=localhost;Database=DemoDb;Trusted_Connection=True;');
  const result = await pool.request().query('SELECT CustomerId, FirstName FROM dbo.Customer;');
  console.log(result.recordset);
}
```

## Data engineering principle
The database should be the source of truth. Application code should request, validate, and present data, not hide logic in unsafe or inconsistent ways.

## Practice tasks
1. Connect to SQL Server from Node.
2. Fetch rows and print them in a console.
3. Insert a new record using parameterized input.
4. Build a small script that reads from a table.

This folder expands your SQL learning into real-world application integration.

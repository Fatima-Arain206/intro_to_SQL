# Node

## Node.js + SQL

This folder connects SQL practice with backend development.

## Why it matters

Many applications use Node.js to connect to SQL Server and return data to the frontend.

## Example connection

```javascript
const sql = require('mssql');

async function getCustomers() {
  const pool = await sql.connect('Server=localhost;Database=MyDb;User Id=sa;Password=YourPassword;Encrypt=true;TrustServerCertificate=true;');
  const result = await pool.request().query('SELECT CustomerId, FirstName FROM dbo.Customer;');
  console.log(result.recordset);
}

getCustomers();
```

## Useful patterns

- parameterized queries
- try/catch error handling
- environment variables for secrets
- clean API responses

## Best practices

- never concatenate user input into SQL
- keep sensitive values in `.env`
- validate database connection before production use

This folder helps you connect SQL learning with real application logic.

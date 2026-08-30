select year(HireDate) as HireYear,
count(*) as EmployeCount
from Employees
group by year(HireDate)
order by HireYear
 with first_Cte
 --(Department,
--BirthDate,
--Gender,EmployeeName)--colnames
as
(
select

--e.BirthDate,
--count(e.Gender) as EmployeCOunt
--concat(e.FirstName,' ',e.LastName) as EmployeeName


from Sales.Employees e
group by Department
--where e.Salary >15000
)
select 
c.Department,
c.EmployeCOunt,
c.Gender
from 
first_Cte c
group by c.Department
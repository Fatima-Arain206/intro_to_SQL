-- craete a triggeer with dml
alter trigger Sales.tg_AuditEmployeeChange
on Sales.Employees
after insert,update,delete
as begin
	declare @operation varchar(20)
		-- check if data inserted
		if exists (select * from inserted ) and  not exists(Select *from deleted)
			set @operation='Insert'
		else if exists(select * from inserted) and exists(select * from deleted)
			set @operation ='Update'
		else
			set @operation='deleted'

		insert into Sales.AuditEmploye(EmployeeID,operation,changeDate)

			SELECT coalesce(i.EmployeeID,d.EmployeeID),@operation,getdate()
		from inserted i
		full outer join deleted d
		on i.EmployeeID=d.EmployeeID
	end;
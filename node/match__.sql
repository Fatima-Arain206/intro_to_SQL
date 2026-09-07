-- 
select
reports_to_manger.Name as REPORT_TO_MANGER,
manger_reports.Name as manger_report,
report_from_manger.Name as grom_manger

from 
	dbo.Person as reports_to_manger,
	dbo.Person as manger_reports,
	dbo.Person as report_from_manger,
	dbo.ReportsTo rtm,
	dbo.ReportsTo mr,
	dbo.ReportsTo refm
	where match(reports_to_manger -(rtm)->manger_reports-(mr)->report_from_manger )--AND reports_to_manger.Name = 'Alice Johnson'
	AND report_from_manger.Name <> reports_to_manger.Name;

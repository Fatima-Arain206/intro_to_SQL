CREATE LOGIN AliLogin
WITH PASSWORD = 'DataAnalyst@2026';

create login DataAnalystLogin
with password = 'DataAnalyst@2027';
create login hr
with password = 'HREMployee@2028';

CREATE USER AliUser FOR LOGIN AliLogin;
CREATE USER DataAnalystUser FOR LOGIN DataAnalystLogin;
CREATE USER HRUser FOR LOGIN hr;

GRANT SELECT, INSERT
ON SCHEMA::dbo TO dataanalystuser;


grant select ,insert, update, delete
on schema::dbo to hruser;

grant select on schema::dbo to AliUser;

-- reovke
revoke delete on schema :: dbo to hruser;

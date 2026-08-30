--json modefiy
-- JSON_MODIFY()MODEFIES a value in json document and returns
--the modified json document
use MYDATABASE
select * from ConfigurationData1
--return the theme dark to light
select JSON_MODIFY(ConfigSetteings,
'$.Theme',
'Light' )
from ConfigurationData1

--  update it
update ConfigurationData1
set ConfigSetteings =JSON_MODIFY(ConfigSetteings,'$.Theme','Light') ;


SELECT JSON_VALUE(ConfigSetteings,'$.Theme') from ConfigurationData1

-- add font size
update ConfigurationData1
set ConfigSetteings= JSON_MODIFY(ConfigSetteings,'$.fontsize',19);


--check
select JSON_VALUE(ConfigSetteings,'$.fontsize') from ConfigurationData1
select ConfigSetteings from ConfigurationData1

-- remove font size
update ConfigurationData1
set ConfigSetteings = JSON_MODIFY(ConfigSetteings,'$.fontsize',NULL);

-- USE APPENED
UPDATE ConfigurationData1
SET skills = JSON_MODIFY(skills,'append $.Languages','C#');

select JSON_QUERY(skills,' strict $.Languages') from ConfigurationData1

-- delete the index 4
UPDATE ConfigurationData1
SET skills = JSON_MODIFY(skills ,  'strict $.Languages[4]','JS');
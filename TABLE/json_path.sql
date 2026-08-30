---cast and json_path_exist
select 
JSON_PATH_EXISTS(skills,'$.Languages') as languageExist from ConfigurationData1

--cast
select 
CAST(JSON_PATH_EXISTS(skills,'$.Languages') as bit ) as language_exist 
from ConfigurationData1
True
select cast(123 as varchar)
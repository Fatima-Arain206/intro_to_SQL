-- computed column
select
ConfigID,
cast (JSON_PATH_EXISTS(skills,'$.Language') as bit) as hash_language 
from ConfigurationData1
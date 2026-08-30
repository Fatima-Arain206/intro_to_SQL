--.modify vs MODIFYJSON
--.modify is a native method change data in json docment
use MYDATABASE
update ConfigurationData1
set ConfigSetteings.modify('$.Theme','purple') 

select JSON_VALUE(ConfigSetteings,'$.Theme') from ConfigurationData1


-- check path
--json_path_exists
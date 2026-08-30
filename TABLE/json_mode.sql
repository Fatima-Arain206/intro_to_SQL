--lax and stirct 
--lax handle the path if the path doesnot exist server handles it interlly and has not through error
SELECT 
JSON_VALUE(ConfigSetteings,'$.age') 
from ConfigurationData1 -- this is a lax mode age is not exist
--but now we use strict mod
select 
JSON_VALUE(ConfigSetteings,'strict $.age') from 
ConfigurationData1-- it thrw the error
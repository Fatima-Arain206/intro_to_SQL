-- extract values from json document JSON_VALUE()
select JSON_VALUE(
'{
  "Theme": "Dark",
  "Language": "en"
}',
'$.Theme'

)
-- instead
select JSON_VALUE(ConfigSetteings,'$.Theme') from ConfigurationData1

--find skills
select * from  ConfigurationData1
select JSON_QUERY(skills,'$.SKILLS') 
from ConfigurationData1
-- FIND ONE
select JSON_VALUE(skills,'$.SKILLS[0]') 
from ConfigurationData1
-- json
--create a json column table
USE MYDATABASE
CREATE TABLE ConfigurationData1(
ConfigID int primary key,
ConfigSetteings JSON NOT NULL
)

SELECT * FROM ConfigurationData1

-- INSERT JSON DOYCMENT
INSERT INTO ConfigurationData1
VALUEs(1,
'{"Theme":"Dark","Language":"en"
}');

alter table ConfigurationData1
add skills json 

update ConfigurationData1
set skills = '{ "Languages":["java","SQL","PYTHON","CPP"],"TOOLS":["SSMS","JUPYTER","POWER BI"],
"SKILLS":["ML","Data analysis","DATA science"]
}'
where  ConfigID =1


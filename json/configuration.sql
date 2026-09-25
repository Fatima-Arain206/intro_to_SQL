create table configsettings(
    configurantionID int primary key,
    confgsettings json NOT NULL
)

insert into configsettings
values(1,
'{
"THEME":"Dark",
"lenguage":"en",
"notfication":"off",
"font size":28
}'
)

INSERT INTO configsettings 
VALUES (2, '{"theme":"light","language":"fr","notifications":false}');

select 
configurantionID,

JSON_VALUE( confgsettings,'$.theme') as theme,
JSON_VALUE(confgsettings,'$.language'),
JSON_ARRAY(confgsettings,'$')AS ARR,
JSON_QUERY(confgsettings) AS OB
 FROM configsettings

---- Update a single property using the modify method (SQL Server 2025+ preview)

 update configsettings
 set confgsettings.modify('$.THEME','LIGHT')

 -- Alternative: JSON_MODIFY works with both JSON and NVARCHAR(MAX) columns

UPDATE configsettings
set confgsettings=JSON_MODIFY(cast( confgsettings as NVARCHAR(max) ),'$.notifications',  cast(0 as bit) )

where configurantionID =2

UPDATE configsettings
SET ConfgSettings = JSON_MODIFY(CAST(ConfgSettings AS NVARCHAR(MAX)), '$.notifications', CAST(0 AS BIT))
WHERE configurantionID = 1;
-- create index

alter table configsettings
add themevalue as JSON_VALUE(Confgsettings,'$.theme')

SELECT * FROM configsettings

CREATE INDEX IDX_JSON_THEME
ON Configsettings(themevalue);

-- Open JSON as a relational table
SELECT
    c.configurantionID,
    j.[key],
    j.[value],
    j.[type]
FROM Configsettings AS c
CROSS APPLY OPENJSON(c.ConfgSettings) AS j;

-- Open JSON properties as named columns
SELECT
    c.configurantionID,
    j.theme,
    j.language,
    j.notifications,
    j.[font size]
FROM Configsettings AS c
CROSS APPLY OPENJSON(c.ConfgSettings)
WITH (
    theme         nvarchar(20) '$.theme',
    language      nvarchar(10) '$.language',
    notifications nvarchar(10) '$.notifications',
    [font size]   int          '$."font size"'
) AS j;


-- json path exista
select 
(json_path_exists(c.confgsettings,'$.language'))
from configsettings as c
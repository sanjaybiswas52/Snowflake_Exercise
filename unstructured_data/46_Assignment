// First step insert data
CREATE OR REPLACE stage MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE
     url='s3://snowflake-assignments-mc/unstructureddata/'

LIST @MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE;

CREATE OR REPLACE file format MANAGE_DB.FILE_FORMATS.JSONFORMAT
    TYPE = JSON;

CREATE OR REPLACE table OUR_FIRST_DB.PUBLIC.JSON_RAW (
    raw_file variant);

COPY INTO OUR_FIRST_DB.PUBLIC.JSON_RAW
FROM @MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE
file_format= MANAGE_DB.FILE_FORMATS.JSONFORMAT
files = ('Jobskills.json');
    
// Second step: Parse & Analyse Raw JSON 

SELECT * FROM JSON_RAW;

// Selecting attribute/column
SELECT 
$1:first_name::STRING,
$1:last_name::STRING,
$1:Skills[0]::STRING,
$1:Skills[1]::STRING
FROM JSON_RAW;


// Copy data in table
CREATE TABLE SKILLS AS
SELECT 
$1:first_name::STRING as first_name,
$1:last_name::STRING as last_name,
$1:Skills[0]::STRING as Skill_1,
$1:Skills[1]::STRING as Skill_2
FROM JSON_RAW;

// Query from table
SELECT * FROM SKILLS
WHERE FIRST_NAME='Florina';


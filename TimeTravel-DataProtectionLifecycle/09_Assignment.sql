1. Create exercise table

-- Switch to role of accountadmin --
 
USE ROLE ACCOUNTADMIN;
USE DATABASE DEMO_DB;
USE WAREHOUSE COMPUTE_WH;
 
CREATE OR REPLACE TABLE DEMO_DB.PUBLIC.PART
AS
SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."PART";
 
SELECT * FROM PART
ORDER BY P_MFGR DESC;

SELECT P_MFGR FROM DEMO_DB.PUBLIC.PART
WHERE P_MFGR='Manufacturer#5';

2. Update the table

UPDATE DEMO_DB.PUBLIC.PART
SET P_MFGR='Manufacturer#CompanyX'
WHERE P_MFGR='Manufacturer#5';
 
----> Note down query id here:
 
SELECT * FROM PART
ORDER BY P_MFGR DESC;


//3.1: Travel back using the offset until you get the result of before the update

SELECT * FROM DEMO_DB.PUBLIC.PART at (OFFSET => -60*6.5)

3.2: Travel back using the query id to get the result before the update
SELECT * FROM DEMO_DB.PUBLIC.PART at (OFFSET => -60*6.5)
WHERE P_MFGR='Manufacturer#5';


SELECT * FROM OUR_FIRST_DB.public.test before (timestamp => '2025-12-27 06:02:36.636 -0800'::timestamp);

SELECT DATEADD(DAY,-1,CURRENT_TIMESTAMP)

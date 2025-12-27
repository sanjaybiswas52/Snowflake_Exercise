-- Create External Stage
CREATE STAGE COPY_DB.PUBLIC.s3_stage
  URL = 's3://redbird-snowflake-data/'
  STORAGE_INTEGRATION = s3_int
  FILE_FORMAT = (TYPE = PARQUET);

-- Export Data (COPY INTO)

COPY INTO @s3_stage/csv/
FROM OUR_FIRST_DB.PUBLIC.ORDERS
OVERWRITE = TRUE;

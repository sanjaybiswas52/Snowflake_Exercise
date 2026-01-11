LIST @HR_DWH.RAW.aws_stage;

DESC STAGE HR_DWH.RAW.aws_stage; 

// Create schema to keep things organized
CREATE OR REPLACE SCHEMA HR_DWH.pipes;
// Define pipe
CREATE OR REPLACE pipe HR_DWH.pipes.dept_pipe
auto_ingest = TRUE
AS
COPY INTO HR_DWH.BRONZE.DEPT_RAW
FROM @HR_DWH.RAW.aws_stage;
    

// Describe pipe
DESC pipe dept_pipe;

SELECT count(*) FROM HR_DWH.BRONZE.DEPT_RAW ;
SELECT * FROM HR_DWH.BRONZE.DEPT_RAW;

ALTER PIPE pipes.dept_pipe refresh;
ALTER PIPE pipes.dept_pipe SUSPEND;
ALTER PIPE HR_DWH.pipes.dept_pipe RESUME;
SHOW PIPES LIKE 'dept_pipe';

-- Cyclistic Case Study
-- Cleaning Verification Log 
-- Analyst: Ajike Taiwo
/* This is a record of all the checks that were done on the data before analysis.*/

/* No Duplicates. This should equal total number of rows*/

SELECT 
COUNT(DISTINCT ride_id)

FROM
  `cyclistic-325313.Tripdata.tripdata_202107` 


/* Checking for uniform time length, started_at_len should be 10 , ended_at_len should be 8.*/

SELECT 
 MIN(started_at_len)AS started_at_len_min,
 MIN(ended_at_len) AS ended_at_len_min,
 MAX(started_at_len ) AS started_at_len_max,
 MAX (ended_at_len ) AS  ended_at_len_max

 FROM 
    (SELECT 
    LENGTH('started_at') AS started_at_len, 
    LENGTH('ended_at') AS ended_at_len 
    FROM 
    `cyclistic-325313.Tripdata.tripdata_202107` )

/* No null values in started_at and ended_at.*/

SELECT 
started_at,
ended_at,

FROM 
`cyclistic-325313.Tripdata.tripdata_202107`

WHERE

started_at IS NULL OR 
ended_at IS NULL 



/* Ensuring there are no other options other than memeber or casual in the member_casual column */

SELECT 
COUNT(DISTINCT member_casual)

FROM
  `cyclistic-325313.Tripdata.tripdata_202107` 

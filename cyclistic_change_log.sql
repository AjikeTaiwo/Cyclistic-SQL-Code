-- Cyclistic Case Study
-- Change Log 
-- Analyst: Ajike Taiwo
/* This is a sample of all the changes that were done to tables in the dataset.*/

/* adding column for day_of_Week.*/
 ALTER TABLE  `cyclistic-325313.Tripdata.tripdata_202107` 
ADD COLUMN day_of_week INT64;


/* updating day_of_week with values 1=sunday, 7=saturday*/
UPDATE   `cyclistic-325313.Tripdata.tripdata_202107` 
SET day_of_week = EXTRACT(dayofweek FROM started_at)
WHERE TRUE;


 /* Adding columns for ride_length in minutes then in hours.*/

 ALTER TABLE  `cyclistic-325313.Tripdata.tripdata_202107` 
ADD COLUMN ride_length_min INT64;


 ALTER TABLE  `cyclistic-325313.Tripdata.tripdata_202107` 
ADD COLUMN ride_length_hr INT64;

/* updating ride_length with values.*/

UPDATE   `cyclistic-325313.Tripdata.tripdata_202107` 
SET ride_length_min = timestamp_diff(ended_at, started_at, minute)
WHERE TRUE;

UPDATE   `cyclistic-325313.Tripdata.tripdata_202107` 
SET ride_length_hr = timestamp_diff(ended_at, started_at, hour)
WHERE TRUE;

/* Verifying new data.*/
SELECT
*
FROM 
`cyclistic-325313.Tripdata.tripdata_202107`

WHERE 
day_of_week IS NULL 

SELECT
*
FROM 
`cyclistic-325313.Tripdata.tripdata_202107`

WHERE 
ride_length_hr IS NULL AND ride_length_min IS NULL 


SELECT
*
FROM 
`cyclistic-325313.Tripdata.tripdata_202107`

WHERE 
day_of_week > 7 OR day_of_week < 1
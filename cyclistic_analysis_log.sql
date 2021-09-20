-- Cyclistic Case Study
-- Analysis 
-- Analyst: Ajike Taiwo

-- All analysis will exclude any rides where start_stations_name null values and rides under 5 minutes
--min,max,avg
SELECT 
member_casual,
min(ride_length_min) AS min_ride_length,
max(ride_length_min) AS max_ride_length,
avg(ride_length_min) AS avg_ride_length

 FROM 
 (select*, FROM `cyclistic-325313.Tripdata.tripdata_202107`  WHERE start_station_name IS NOT NULL)

WHERE
 ride_length_min > 5

 GROUP BY member_casual;

-- 24hrs vs multiple day rides

 SELECT 
member_casual,
countif(ride_length_min <1440) AS rides_shorter_than_24hrs,
countif( ride_length_min > 1440) AS rides_longer_than_24hrs

 FROM 
 (select*, FROM `cyclistic-325313.Tripdata.tripdata_202107`  WHERE start_station_name IS NOT NULL)

WHERE
 ride_length_min > 5

 GROUP BY member_casual;

-- rides by day of the week


SELECT 
member_casual,
countif(day_of_week =7 ) AS saturday,
countif(day_of_week =6 ) AS friday,
countif(day_of_week =5 ) AS thrusday,
countif(day_of_week =4 ) AS wednesday,
countif(day_of_week =3 ) AS tuesday,
countif(day_of_week =2 ) AS monday,
countif(day_of_week =1 ) AS sunday

 FROM 
 (select*, FROM `cyclistic-325313.Tripdata.tripdata_202107`  WHERE start_station_name IS NOT NULL)

WHERE
 ride_length_min > 5

 GROUP BY member_casual
 ;



 -- verifying  data is consistent 

--total count of rides that have start_stations_name null values and rides under 5 minutes
select*, FROM `cyclistic-325313.Tripdata.tripdata_202107`  WHERE start_station_name IS NOT NULL AND ride_length_min > 5



 --  Categorizing  these rides into members and casual
SELECT 
member_casual,
count(member_casual)

 FROM 
 (select*, FROM `cyclistic-325313.Tripdata.tripdata_202107`  WHERE start_station_name IS NOT NULL)

WHERE
 ride_length_min > 5

 GROUP BY member_casual;

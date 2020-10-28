-- For each origin city, find the destination city (or cities) with the longest
--  direct flight. By direct flight, we mean a flight with no intermediate 
--  stops. Judge the longest flight in time, not distance. (15 points)
-- Name the output columns origin_city, dest_city, and time representing 
-- the flight time between them. Do not include duplicates of the same 
-- origin/destination city pair. Order the result by origin_city and then 
-- dest_city (ascending, i.e. alphabetically).
-- [Output relation cardinality: 334 rows]

WITH MaxTime AS
    (SELECT  F2.origin_city as OG_CITY ,MAX(F2.actual_time) as MT
    FROM Flights as F2
    GROUP BY F2.origin_city)
SELECT DISTINCT F1.origin_city, F1.dest_city, F1.actual_time
FROM Flights as F1, MaxTime
WHERE F1.actual_time = MaxTime.MT AND F1.origin_city = MaxTime.OG_CITY
ORDER BY F1.origin_city, F1.dest_city;



-- HW3_q1 : 334 rows   
-- SELECT COUNT(*)
-- FROM (
--     WITH MaxTime AS
--         (SELECT  F2.origin_city as OG_CITY ,MAX(F2.actual_time) as MT
--         FROM Flights as F2
--         GROUP BY F2.origin_city)
--     SELECT DISTINCT F1.origin_city, F1.dest_city, F1.actual_time
--     FROM Flights as F1, MaxTime
--     WHERE F1.actual_time = MaxTime.MT AND F1.origin_city = MaxTime.OG_CITY
--     ORDER BY F1.origin_city, F1.dest_city);


-- HW3 q2 : 109 rows
-- Find all origin cities that only serve flights shorter than 3 hours. You should not include cancelled flights in your determination. (15 points)
-- Name the output column city and sort them in ascending order alphabetically. List each city only once in the result.
-- [Output relation cardinality: 109]

-- HW3 q2 : Fail
-- SELECT COUNT(*)
-- FROM (
--     WITH MinTime AS
--         (SELECT DISTiNCT F2.origin_city as OG_CITY, MIN(F2.actual_time) as MT
--         FROM Flights as F2
--         WHERE F2.canceled = 0
--         GROUP BY F2.origin_city)
--     SELECT DISTINCT F1.origin_city as city
--     FROM Flights as F1, MinTime
--     WHERE F1.origin_city = MinTime.OG_CITY AND MinTime.MT < 180
--     ORDER BY F1.origin_city) ;

-- HW3 q2 : Successful
-- SELECT COUNT(*)
-- FROM (
-- SELECT DISTINCT F.origin_city AS City
-- FROM Flights AS F
-- WHERE F.origin_city NOT IN (SELECT DISTINCT F1.origin_city
--                             FROM Flights AS F1
--                             WHERE F1.actual_time >= 180)
-- ORDER BY City) ;



-- HW3 q3 : 327 rows
-- For each origin city, find the percentage of departing flights
--  shorter than 3 hours.You should not include cancelled
--   flights in your determination. (15 points)
-- Name the output columns origin_city and percentage. 
-- Order by percentage value, then city, ascending. Be careful
--  to handle cities without any flights shorter than 3 hours.
--   You should return 0 as the result for these cities, 
--   not NULL (which is shown as a blank cell in Azure) 
--   Report percentages as percentages not decimals (e.g.,
--    report 75.25 rather than 0.752534).
-- [Output relation cardinality: 327]


-- SELECT COUNT(*)
-- FROM(
--     SELECT DISTINCT F.origin_city, (100.0 * C.count / COUNT(*)) AS percentage
-- FROM Flights AS F LEFT OUTER JOIN (SELECT F1.origin_city, COUNT(*) AS count
--                                    FROM Flights AS F1
--                                    WHERE F1.actual_time < 180
--                                    GROUP BY F1.origin_city) AS C
--     on F.origin_city = C.origin_city
-- GROUP BY F.origin_city, C.count
-- ORDER BY percentage
-- );



-- HW3 q4 : 256 rows
-- List all cities that can be reached from Seattle through one
--  stop (i.e., with any two flights that go through an 
--  intermediate city) but cannot be reached through a direct
--   flight. Do not include Seattle as one of these destinations
--    (even though you could get back with two flights). 
--    (15 points)
-- Name the output column city. Order the output ascending by city.
-- [Output relation cardinality: 256]

-- SELECT COUNT(*)
-- FROM (
--     SELECT F.dest_city AS city
-- FROM Flights AS F
-- -- in one-transfer flight
-- WHERE F.dest_city IN (SELECT DISTINCT F2.dest_city
--                       FROM Flights AS F1, Flights AS F2
--                       WHERE F1.dest_city = F2.origin_city AND
--                             F1.origin_city = 'Seattle WA') 
--       AND
-- -- not in direct flight
--       F.dest_city NOT IN (SELECT DISTINCT F3.dest_city
--                           FROM Flights AS F3
--                           WHERE F3.origin_city = 'Seattle WA')
--       AND
-- -- exclude settle back and forth
--       F.dest_city != 'Seattle WA'
-- GROUP BY F.dest_city
-- ORDER BY city
-- );





-- HW3 q5 : 3 or 4
-- List all cities that cannot be reached from Seattle through a 
-- direct flight nor with one stop (i.e., with any two flights 
-- that go through an intermediate city). Warning: this query 
-- might take a while to execute. We will learn about how to 
-- speed this up in lecture. (15 points)
-- Name the output column city. Order the output ascending by city.
-- (You can assume all cities to be the collection of all origin_city
--  or all dest_city)
-- (Note: Do not worry if this query takes a while to execute. We are 
-- mostly concerned with the results)
-- [Output relation cardinality: 3 or 4, depending on what you consider 
-- to be the set of all cities]



-- SELECT COUNT(*)
-- FROM (
--     SELECT F.dest_city AS city
-- FROM Flights AS F
-- WHERE F.dest_city NOT IN (SELECT F2.dest_city
--                       FROM Flights AS F1, Flights AS F2
--                       WHERE F1.dest_city = F2.origin_city AND
--                             F1.origin_city = 'Seattle WA') 
--       AND
--       F.dest_city NOT IN (SELECT F3.dest_city
--                           FROM Flights AS F3
--                           WHERE F3.origin_city = 'Seattle WA')
--       AND
--       F.dest_city != 'Seattle WA'
-- GROUP BY F.dest_city
-- ORDER BY city
-- );


-- HW3 q6: 4 rows
-- List the names of carriers that operate flights from 
-- Seattle to San Francisco, CA. Return each carrier's 
-- name only once. Use a nested query to answer this question. 
-- (7 points)
-- Name the output column carrier. Order the output ascending by carrier.
-- [Output relation cardinality: 4]

-- SELECT COUNT(*)
-- FROM (
-- SELECT DISTINCT C.name AS Carrier
-- FROM Carriers AS C, (SELECT F.carrier_id as cid
--                      FROM Flights AS F
--                      WHERE F.origin_city = 'Seattle WA' AND
--                      F.dest_city = 'San Francisco CA') AS ID
-- WHERE C.cid = ID.cid
-- ORDER BY Carrier
-- );



-- HW3 q7 : 4 rows
-- Express the same query as above, but do so without 
-- using a nested query. Again, name the output column carrier 
-- and order ascending by carrier. (8 points)                        
--  [Output relation cardinality: 4]


-- SELECT DISTINCT C.name AS carrier
-- FROM Carriers AS C, Flights AS F
-- WHERE C.cid = F.carrier_id AND
--       F.origin_city = 'Seattle WA' AND
--       F.dest_city = 'San Francisco CA'
-- ORDER BY carrier;

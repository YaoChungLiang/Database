/* testing fail
SELECT DISTINCT F.flight_num
FROM FLIGHTS as F
WHERE F.origin_city = 'Seattle WA' AND
    F.dest_city = 'Boston MA' AND
    (SELECT W.day_of_week 
    FROM WEEKDAYS as W
    WHERE F.day_of_week_id = W.did AND
        W.day_of_week = 'Monday');
*/

-- .header on
-- SELECT DISTINCT F.flight_num as flight_num
-- FROM FLIGHTS as F
-- WHERE F.origin_city = 'Seattle WA' AND
--     F.dest_city = 'Boston MA' AND
--     F.day_of_week_id = 1 AND
--     F.carrier_id = 'AS';


.header on
SELECT DISTINCT F.flight_num as flight_num
FROM FLIGHTS as F, WEEKDAYS as W, CARRIERS as C
WHERE F.origin_city = 'Seattle WA' AND
    F.dest_city = 'Boston MA' AND
    F.day_of_week_id = W.did AND
    W.day_of_week = 'Monday' AND
    F.carrier_id = C.cid AND
    C.name = 'Alaska Airlines Inc.';
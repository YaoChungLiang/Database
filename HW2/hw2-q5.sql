-- SELECT C.name as name,
-- SUM(CASE WHEN F.canceled = 1 THEN 1 ELSE 0 END)/COUNT(*)*100 as percentage
-- FROM FLIGHTS AS F, CARRIERS as C
-- WHERE F.origin_city = 'Seattle WA'
-- AND F.carrier_id = C.cid
-- GROUP BY F.carrier_id
-- HAVING percentage/100 > 0.005
-- ORDER BY percentage ASC;
SELECT C.name as name, (100.0*SUM(CASE WHEN F.canceled = 1 THEN 1 ELSE 0 END))/(COUNT(F.flight_num)) AS percentage
FROM FLIGHTS as F, CARRIERS as C
WHERE F.origin_city = "Seattle WA" AND F.carrier_id = C.cid
GROUP BY C.name
HAVING percentage > 0.5
ORDER BY percentage;
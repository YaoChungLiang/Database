-- .header on
-- SELECT DISTINCT C.name as name
-- FROM FLIGHTS AS F, CARRIERS AS C, MONTHS AS M
-- WHERE F.month_id = M.mid 
-- AND F.carrier_id = C.cid
-- GROUP BY F.month_id, F.day_of_month, C.cid
-- HAVING COUNT(F.fid) > 1000;
SELECT DISTINCT C.name as name
FROM FLIGHTS AS F, CARRIERS AS C
WHERE F.carrier_id = C.cid
GROUP BY F.day_of_month, C.cid
HAVING COUNT(F.fid) > 1000;
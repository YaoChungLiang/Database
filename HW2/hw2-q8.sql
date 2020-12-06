SELECT C.name as name, SUM(F.departure_delay) as delay
FROM FLIGHTS as F, CARRIERS as C
WHERE F.departure_delay > 0
AND F.carrier_id = C.cid
GROUP BY C.name;
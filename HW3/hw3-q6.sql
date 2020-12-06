SELECT DISTINCT C.name AS Carrier
FROM Carriers AS C, (SELECT F.carrier_id as cid
                     FROM Flights AS F
                     WHERE F.origin_city = 'Seattle WA' AND
                     F.dest_city = 'San Francisco CA') AS ID
WHERE C.cid = ID.cid
ORDER BY Carrier
SELECT C.name, MAX(F.price) as max_price
FROM FLIGHTS AS F, CARRIERS AS C
WHERE ((F.origin_city = 'Seattle WA' AND F.dest_city = 'New York NY')
OR (F.origin_city = 'New York NY' AND F.dest_city = 'Seattle WA'))
AND F.carrier_id = C.cid
GROUP BY C.name;
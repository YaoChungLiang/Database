SELECT SUM(F.capacity) as capacity
FROM FLIGHTS as F, MONTHS as M
WHERE ((F.origin_city ='Seatle WA' AND F.dest_city = 'San Francisco CA')
OR (F.origin_city ='San Francisco CA' AND F.dest_city = 'Seattle WA'))
AND F.month_id = M.mid
AND M.month = 'July'
AND F.day_of_month = 10;
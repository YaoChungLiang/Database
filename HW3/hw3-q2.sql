SELECT DISTINCT F.origin_city AS City
FROM Flights AS F
WHERE F.origin_city NOT IN (SELECT DISTINCT F1.origin_city
                            FROM Flights AS F1
                            WHERE F1.actual_time >= 180)
ORDER BY City;
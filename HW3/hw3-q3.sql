SELECT DISTINCT F.origin_city, (100.0 * C.count / COUNT(*)) AS percentage
FROM Flights AS F LEFT OUTER JOIN (SELECT F1.origin_city, COUNT(*) AS count
                                   FROM Flights AS F1
                                   WHERE F1.actual_time < 180
                                   GROUP BY F1.origin_city) AS C
    on F.origin_city = C.origin_city
GROUP BY F.origin_city, C.count
ORDER BY percentage;
SELECT F.dest_city AS city
FROM Flights AS F
-- in one-transfer flight
WHERE F.dest_city IN (SELECT F2.dest_city
                      FROM Flights AS F1, Flights AS F2
                      WHERE F1.dest_city = F2.origin_city AND
                            F1.origin_city = 'Seattle WA') 
      AND
-- not in direct flight
      F.dest_city NOT IN (SELECT F3.dest_city
                          FROM Flights AS F3
                          WHERE F3.origin_city = 'Seattle WA')
      AND
-- exclude settle back and forth
      F.dest_city != 'Seattle WA'
GROUP BY F.dest_city
ORDER BY city;
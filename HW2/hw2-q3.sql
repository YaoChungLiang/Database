.header on
SELECT W.day_of_week as day_of_week, 
AVG(F.arrival_delay) as delay
FROM FLIGHTS AS F, WEEKDAYS AS W
WHERE F.day_of_week_id = W.did
GROUP BY F.day_of_week_id
ORDER BY delay DESC LIMIT 1;

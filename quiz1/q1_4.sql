SELECT E.id, E.name
FROM Event as E, Performance as P
WHERE p.eid = E.id 
GROUP BY E.id
HAVING SUM(P.won) > 1
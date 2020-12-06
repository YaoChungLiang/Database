SELECT C.name
FROM Contestant as C, Team as T
WHERE C.id = T.id and T.name = 'Track'
and T.organization = 'University of Washington'
ORDER BY C.name;
SELECT M.name, M.year, E.name, P.time
FROM Meet as M, Event as E, Performance as P
WHERE P.time = MIN(P.time) AND P.eid = E.id
AND M.id = E.mid;
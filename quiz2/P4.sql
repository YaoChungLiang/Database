-- Original correlated query
-- SELECT m.id
-- FROM Meet m
-- WHERE NOT EXISTS (SELECT c.tid
--                   FROM  Event e, Performance p, Contestant c
--                   WHERE m.id = e.mid AND e.id = p.eid AND p.cid = c.id
--                   GROUP BY c.tid
--                   HAVING COUNT(c.id) >= 3)
-- ORDER BY m.id;




-- decorrelated Failed

SELECT mm.id
FROM    (With OuterQuery AS
            (
                SELECT e.mid as Emid, c.tid as Ctid
                FROM  Event e, Performance p, Contestant c
                WHERE e.id = p.eid AND p.cid = c.id
                GROUP BY c.tid
                HAVING COUNT(c.id) >= 3)
            )
            SELECT m.id
            FROM Meet as m, OuterQuery as o
            ORDER BY m.id
        ) AS tmp 
        JOIN Meet as mm 
        ON mm.id = tmp.Emid
WHERE tmp.Ctid = Null
ORDER BY mm.id;
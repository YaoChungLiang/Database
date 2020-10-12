/* SQL 3-valued logic
True = 1
False = 0
Null = 0.5
C1 AND C2 = min(C1,C2)
C1 OR C2 = max(C1,C2)
NOT C = 1 - C


SELECT * FROM table LIMIT 10
SELECT DISTINCT p.Name

COUNT(attr)
SUM(attr)
MIN/MAX(attr)
AVG(attr)

*/

--CREATE TABLE A (a int);
--CREATE TABLE B (b int);
--INSERT INTO A VALUES (1),(2),(3),(4);
--INSERT INTO B VALUES (3),(4),(5),(6);

--SELECT * FROM A INNER JOIN B ON A.a = B.b;
--SELECT * FROM A LEFT OUTER JOIN B ON A.a = B.b;

--SELECT * FROM A RIGHT OUTER JOIN B ON A.a = B.b;
--SELECT * FROM B LEFT OUTER JOIN A ON A.a = B.b;


-- SELECT * FROM A FULL OUTER JOIN B ON A.a = B.b;
/* (SELECT * FROM A LEFT OUTER JOIN B ON A.a = B.b) UNION
   (SELECT * FROM B LEFT OUTER JOIN A ON A.a = B.b);
*/

SELECT count(*), avg(rating) FROM M, AI, A
WHERE M.id = AI.mid AND A.id = AI.aid AND A.name = "Patric Stewart";





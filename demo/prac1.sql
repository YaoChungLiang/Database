CREATE TABLE Employees(
    id int,
    bossOf int
);

INSERT INTO Employees VALUES(1,2);
INSERT INTO Employees VALUES(1,3);
INSERT INTO Employees VALUES(1,4);
INSERT INTO Employees VALUES(1,5);

INSERT INTO Employees VALUES(2,3);
INSERT INTO Employees VALUES(2,4);
INSERT INTO Employees VALUES(2,5);

SELECT * FROM Employees;


-- SELECT E1.bossOf, E2.bossOf
-- FROM Employees as E1, Employees as E2
-- WHERE E1.id = E2.id AND E1.bossOf = E2.bossOf;
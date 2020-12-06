CREATE TABLE 
(cname VARCHAR(20) primary key,
)


.header on
.mode column
.nullvalue NULL
PRAGMA FOREIGN_KEYS ON;

SELECT DISTINCT P.Job 
FROM Payroll AS P
WHERE P.Salary > 70000;


SELECT COUNT(*)
FROM Payroll;


-- The same for inner join below
-- explicit
SELECT P.Name, R.Car
FROM Payroll AS P JOIN Regist AS R
ON P.UserID = R.UserID;

-- implicit
SELECT P.Name, R.Car
FROM Payroll AS P, Regist AS R
WHERE P.UserID = R.UserID;

/* If no join predicate?! 
   then there will be "Cross product" pairs
*/
SELECT P.Name, R.Car
FROM Payroll AS P, Regist AS R;
/*
for each row1 in Payroll:
    for each row2 in Regist:
        output (row1.Name, row2.Car)
*/

-- outer join includes everyone
SELECT P.Name, R.Car
FROM Payroll AS P LEFT OUTER JOIN Regist AS R
ON P.UserID = R.UserID;

LEFT OUTER JOIN
RIGHT OUTER　JOIN
FULL OUTER JOIN

-- self Joins
SELECT P.Name, R1.Car,R2.Car
FROM Payroll as P, Regist as R1, Regist as R2
WHERE P.UserID = R1.UserID AND
    P.UserID = R2.UserID AND
    R1.Car = 'Civic' AND
    R2.Car = 'Pinto';

-- HW2
sqlite3 flight.db < create-tables.sql
sqlite3 flight.db < import-tables.sql

-- Group by (before)
SELECT Job, MAX(Salary)
FROM Payroll
Group BY Job, Name;

-- having (after)
SELECT Job, MAX(Salary)
FROM Payroll
Group BY Job
HAVING MIN(Salary) > 80000;


-- FWGHOS
    SELECT
    ORDER BY
    HAVING
    GROUP BY
    WHERE
    FROM
    Tables

-- example
SELECT p.Name, COUNT(*) AS count
FROM Payroll p, Registry r
WHERE p.UserID = r.UserID AND
    r.Year < 2017
GROUP BY p.UserID, p.Name

-- COUNT(*) will never be 0

/*
HW2 HINT:
Q5 : SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) 


*/
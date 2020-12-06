
-- Part 4-1
.mode csv
DROP TABLE Sales;
CREATE TABLE Sales(
    name VARCHAR(6),
    discount VARCHAR(3),
    month VARCHAR(4),
    price int
);

.import mrFrumbleData.csv Sales


.header on
.mode column

-- Part 4-2

-- Test if name -> discount
SELECT * 
FROM Sales as S
GROUP BY S.name
HAVING COUNT(DISTINCT S.discount) > 1
LIMIT 1;
-- Since there are results, it means FD name -> discount  doesn't exist

-- Test if name -> month
SELECT *
FROM Sales as S
GROUP BY S.name
HAVING COUNT(DISTINCT S.month) > 1
LIMIT 1;
-- Since there are results, it means FD name -> month doesn't exist

-- Test if name -> price
SELECT *
FROM Sales as S
GROUP BY S.name
HAVING COUNT(DISTINCT S.price) > 1
LIMIT 1;
-- No results, it means FD name -> price exist

-- Test if month -> discount
SELECT *
FROM Sales as S
GROUP BY S.month
HAVING COUNT(DISTINCT S.discount) > 1
LIMIT 1;
-- No results, it means FD month -> discount exist

-- FD exist:
-- name -> price
-- month -> discount


-- Part 4-3
CREATE TABLE NamePrice(
    name VARCHAR(10) PRIMARY KEY,
    price int
);

CREATE TABLE MonthDiscount(
    month VARCHAR(4) PRIMARY KEY,
    discount VARCHAR(3)
);

CREATE TABLE NameMonth(
    name VARCHAR(10) REFERENCES NamePrice(name),
    month VARCHAR(4) REFERENCES MonthDiscount(month),
    PRIMARY KEY(name, month)
);

-- Part 4-4
INSERT INTO NamePrice(name, price)
SELECT S.name, S.price
FROM Sales as S
GROUP BY S.name, S.price;
SELECT COUNT(*) FROM NamePrice;
-- 36 rows in NamePrice Table

INSERT INTO MonthDiscount(month, discount)
SELECT S.month, S.discount
FROM Sales as S
GROUP BY S.month, S.discount;
SELECT COUNT(*) FROM MonthDiscount;
-- 12 rows in MonthDiscount


INSERT INTO NameMonth(name,month)
SELECT S.name, S.month
FROM Sales as S
GROUP bY S.name, S.month;
SELECT COUNT(*) FROM NameMonth;
-- 426 rows in NameMonth

























-- memo:

-- TESTING if imported or not : Pass
-- SELECT S.name, S.discount, s.month, s.price
-- FROM Sales as S

-- Method 1 : if A -> B
-- SELECT *
-- FROM Sales AS S1, Sales as S2
-- WHERE S1.name = S2.name and S1.discount <> S2.discount;

-- Method 2 : if A -> B
-- SELECT *
-- FROM Sales as S
-- GROUP BY S.name
-- HAVING COUNT(DISTINCT S.discount) > 1;

-- Method 2 : if A -> BC
-- SELECT *
-- FROM Sales as S
-- GROUP BY S.name
-- HAVING COUNT(DISTINCT S.discount) or COUNT(DISTINCT S.month) > 1;



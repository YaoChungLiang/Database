CREATE TABLE MyRestaurant(
    Restaurant VARCHAR(40) PRIMARY KEY,
    Food VARCHAR(40),
    Distance INT,
    LastVistedDate VARCHAR(10),
    Positive INT
);

INSERT INTO MyRestaurant VALUES('Debo House','buffelo',5,'2020-05-03',1);
INSERT INTO MyRestaurant VALUES('Jeffery House','Chicken Breast',15,'2019-09-13',0);
INSERT INTO MyRestaurant VALUES('Ann House','Pepsea',1,'2020-10-04',1);
INSERT INTO MyRestaurant VALUES('Chip fillet','Chips',100,'9999-12-31',null);
INSERT INTO MyRestaurant VALUES('Stay awake','Red Bull',50,'0001-01-01',0);

.header on

.mode csv
SELECT * FROM MyRestaurant;


.mode list
SELECT * FROM MyRestaurant;

.width 15 15 15 15 15
.mode column
SELECT * FROM MyRestaurant;



.header off

.mode csv
SELECT * FROM MyRestaurant;


.mode list
SELECT * FROM MyRestaurant;

.width 15 15 15 15 15
.mode column
SELECT * FROM MyRestaurant;


.header on
SELECT Restaurant,Distance
FROM MyRestaurant
WHERE Distance<=20 
ORDER BY Restaurant ASC;

SELECT Restaurant
FROM MyRestaurant
WHERE DATETIME(LastVistedDate) < DATETIME('now','-3 month')
      AND
      Positive == 1;

SELECT Restaurant
FROM MyRestaurant
WHERE Distance <= 10;
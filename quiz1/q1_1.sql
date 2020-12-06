PRAGMA foreign_keys = ON;

CREATE TABLE Meet(
    id INT PRIMARY KEY,
    name VARCHAR(30),
    year INT
);

CREATE TABLE Event(
    id INT PRIMARY KEY,
    mid INT REFERENCES Meet(id),
    name VARCHAR(30)
);

CREATE TABLE Team(
    id INT PRIMARY KEY,
    name VARCHAR(20),
    organization VARCHAR(30)
);

CREATE TABLE Contestant(
    id INT PRIMARY KEY,
    tid INT REFERENCES Team(id),
    name VARCHAR(15),
    birthyear INT
);

CREATE TABLE Performance(
    eid INT REFERENCES Event(id),
    cid INT REFERENCES Contestant(id),
    time INT,
    won INT,
    PRIMARY KEY (eid, cid)
);


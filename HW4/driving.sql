PRAGMA foreign_keys = ON;

CREATE TABLE InsuranceCo(
    name VARCHAR(20),
    phone int,
    PRIMARY KEY(name)
);

CREATE TABLE Person(
    ssn int,
    name VARCHAR(20),
    PRIMARY KEY(ssn)
);


CREATE TABLE Driver(
    ssn int REFERENCES Person(ssn),
    driverID int,
    PRIMARY KEY(ssn)
);

CREATE TABLE Vehicle(
    licensePlate VARCHAR(10),
    year int,
    ssn int REFERENCES Person(ssn),
    name VARCHAR(10) REFERENCES InsuranceCo(name),
    PRIMARY KEY(licensePlate, ssn, name)
);

CREATE TABLE Insures(
    name VARCHAR(20) REFERENCES InsuranceCo(name),
    maxLiability REAL,
    licensePlate VARCHAR(10) REFERENCES Vehicle(licensePlate),
    PRIMARY KEY(name, licensePlate)
);

CREATE TABLE NonProfessionalDriver(
    ssn int REFERENCES Driver(ssn),
    PRIMARY KEY(ssn)
    -- Not sure if I need these two below
    -- name VARCHAR(20) REFERENCES Driver.name,
    -- driverID int REFERENCES Driver.driverID,
);


CREATE TABLE ProfessionalDriver(
    medicalHistory VARCHAR(30),
    ssn int REFERENCES Driver(ssn),
    PRIMARY KEY(ssn)
    -- Not sure if I need these two below
    -- name VARCHAR(20) REFERENCES Driver.name,
    -- driverID int REFERENCES Driver.driverID
);



CREATE TABLE Truck(
    LP VARCHAR(20) REFERENCES Vehicle(licensePlate),
    name VARCHAR(20) REFERENCES Vehicle(name),
    ssn int REFERENCES Vehicle(ssn),
    capacity int
    -- FOREIGN KEY(LP,name,ssn)
);

CREATE TABLE Car(
    LP VARCHAR(20) REFERENCES Vehicle(licensePlate),
    make VARCHAR(20),
    name VARCHAR(20) REFERENCES Vehicle(name),
    ssn int REFERENCES Vehicle(ssn),
    capacity int
);

-- part b
-- 
-- CREATE TABLE Insures(
--     name VARCHAR(20) REFERENCES InsuranceCo(name),
--     maxLiability REAL,
--     licensePlate VARCHAR(10) REFERENCES Vehicle(licensePlate),
--     PRIMARY KEY(name, licensePlate)
-- );

-- because in E/R diagram, there is a attribute 'maxLiability' on the relationship,
-- and also Vehicle to InsuranceCo is a many-to-one relationship so the Insures need to use 
-- InsuranceCo(name) and Vehicle(licensePlate) as reference primary keys.

-- part c
-- In the Drives relationship, there is no constrain between Car and NonProfessionalDriver.
-- In the Operates relationship, Truck to ProfessionalDriver is a many-to-one relation which requires
-- ProfessionalDriver's foreign key be added on Truck.
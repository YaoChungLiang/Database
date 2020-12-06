CREATE TABLE InsuranceCo(
	name TEXT,
	phone INT,
	PRIMARY KEY(name)
);

CREATE TABLE Person(
	ssn INT,
	name TEXT,
	PRIMARY KEY(ssn)
);

CREATE TABLE Vehicle(
	licensePlate TEXT,
	year INT,
	ssn INT UNIQUE REFERENCES Person(ssn),
	PRIMARY KEY(licensePlate, ssn)
);

CREATE TABLE Insures(
	name TEXT UNIQUE REFERENCES InsuranceCo(name),
	licensePlate TEXT REFERENCES Vehicle(licensePlate),
	maxLiability REAL,
	PRIMARY KEY(name, licensePlate)
);


CREATE TABLE Driver(
	ssn INT,
	driverID INT,
	PRIMARY KEY(ssn),
	FOREIGN KEY(ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver(
	ssn INT,
	PRIMARY KEY(ssn),
	FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);

CREATE TABLE ProfessionalDriver(
	ssn INT,
	medicalHistory TEXT,
	PRIMARY KEy(ssn),
	FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);


CREATE TABLE Car(
	make TEXT,
	licensePlate TEXT,
	PRIMARY KEY(licensePlate),
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Drives(
	licensePlate TEXT,
	ssn INT,
	FOREIGN KEY(ssn) REFERENCES NonProfessionalDriver(ssn),
	FOREIGN KEY(licensePlate) REFERENCES Car
);

CREATE TABLE Truck(
	capacity INT,
	licensePlate TEXT,
	ssn INT UNIQUE REFERENCES ProfessionalDriver(ssn),
	PRIMARY KEY (licensePlate),
	FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);
-- Drop a table
DROP TABLE  Attraction; 
DROP TABLE  Population; 
DROP TABLE  Name_Language; 
DROP TABLE  City; 
DROP TABLE  Language; 
DROP TABLE  Timezone; 
DROP TABLE  Country; 


-- Country Table
CREATE TABLE Country
(
	Id              NUMBER(10) PRIMARY KEY,
	Country_Name    VARCHAR(255)

);
-- CREATE SEQUENCE Country.Id INCREMENT BY 1 START WITH 1;

-- Timezone Table
CREATE TABLE Timezone
(
	Id              NUMBER(10) PRIMARY KEY,
	Name            VARCHAR(255) NOT NULL,
	Offset          NUMBER(10) 
);

CREATE TABLE Language
(
	Id              NUMBER(10) PRIMARY KEY,
	Shorthand       CHAR(2) UNIQUE,
	Name            VARCHAR(255) NOT NULL
);

-- City Table
CREATE TABLE City 
(
	Id                      NUMBER(10) PRIMARY KEY,
	Name                    VARCHAR(255) UNIQUE,
	Country                 NUMBER(10) NOT NULL,
	Elevation               NUMBER(10) NOT NULL,
	Timezone                NUMBER(10), 

	--Coordiantes
	Longitude_H             NUMBER(10),
	Longitude_M             NUMBER(10),
	Longitude_O             CHAR(1),
	Longitude_S             NUMBER(10),
	Latitude_H              NUMBER(10),
	Latitude_M              NUMBER(10),
	Latitude_O              CHAR(1),
	Latitude_S              NUMBER(10),

	FOREIGN KEY             (Country) REFERENCES Country(Id),
	FOREIGN KEY             (Timezone) REFERENCES Timezone(Id)
);

-- Create a new Relational table with 3 columns
CREATE TABLE Name_Language 
(
	CityId            NUMBER(10),
	LanguageId        NUMBER(10),
	Value             VARCHAR(255) NOT NULL,
	PRIMARY KEY       (CityId, LanguageId),
	FOREIGN KEY       (CityId) REFERENCES City(id),				
	FOREIGN KEY       (LanguageId) REFERENCES Language(Id)
);

CREATE TABLE Population
(
	Id          NUMBER(10) PRIMARY KEY,
	Type        VARCHAR(255),
	Count       NUMBER(10),
	CityId      NUMBER(10),

    UNIQUE  	    (Type, CityId),
	FOREIGN KEY     (CityId) REFERENCES City(Id)
);

CREATE TABLE Attraction
(
    Id          NUMBER(10) PRIMARY KEY,
    Name        VARCHAR(255) NOT NULL,
    CityId      NUMBER(10) NOT NULL,
    
    FOREIGN KEY (CityId) REFERENCES City(Id)
);

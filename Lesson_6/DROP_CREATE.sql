DROP TABLE Adress;


CREATE TABLE Adress(
    AdressNr    NUMBER(10) PRIMARY KEY,
    Name        VARCHAR(30),
    Vorname     VARCHAR(20),
    Strasse     VARCHAR(50),
    Hausnummer  VARCHAR(5),
    PLZ         VARCHAR(5),
    Ort         VARCHAR(5)
);
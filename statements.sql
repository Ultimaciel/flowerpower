-- Database genaamd flowerpower maken als het nog niet bestaat--
CREATE DATABASE IF NOT EXISTS flowerpower;

-- Database genaamd flowerpower gebruiken--
USE flowerpower;

-- Tabel genaamd klant maken--
CREATE TABLE klant(
    klantcode  INT(255) NOT NULL AUTO_INCREMENT,
    voorletters VARCHAR(255) NOT NULL,
    tussenvoegsels VARCHAR(255) NOT NULL,
    achternaam VARCHAR(255) NOT NULL,
    adres VARCHAR(255) NOT NULL,
    postcode VARCHAR(255) NOT NULL,
    woonplaats VARCHAR(255) NOT NULL,
    geboortedatum DATE NOT NULL,
    gebruikersnaam VARCHAR(255) UNIQUE NOT NULL,
    wachtwoord VARCHAR(255) NOT NULL,
    PRIMARY KEY(klantcode)
);

-- Tabel genaamd artikel maken--
CREATE TABLE artikel(
    artikelcode INT(255) NOT NULL AUTO_INCREMENT,
    artikel VARCHAR(255) NOT NULL,
    prijs DECIMAL(9,2) NOT NULL,
    PRIMARY KEY(artikelcode)
);

-- Tabel genaamd factuur maken--
CREATE TABLE factuur(
    factuurcode INT(255) NOT NULL AUTO_INCREMENT,
    factuurdatum DATE NOT NULL,
    klantcode INT(255) NOT NULL,
    PRIMARY KEY(factuurcode),
    FOREIGN KEY(klantcode) REFERENCES klant(klantcode)
);

-- Tabel genaamd factuurregel maken--
CREATE TABLE factuurregel(
    factuurregelcode INT(255) NOT NULL AUTO_INCREMENT,
    factuurcode INT(255) NOT NULL,
    artikelcode INT(255) NOT NULL,
    aantal INT(255) NOT NULL,
    prijs DECIMAL(9,2) NOT NULL,
    PRIMARY KEY(factuurregelcode),
    FOREIGN KEY(factuurcode) REFERENCES factuur(factuurcode),
    FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode)
);

-- Tabel genaamd winkel maken--
CREATE TABLE winkel(
    winkelcode INT(255) NOT NULL AUTO_INCREMENT,
    winkelnaam VARCHAR(255) NOT NULL,
    winkeladres VARCHAR(255) NOT NULL,
    winkelpostcode VARCHAR(7) NOT NULL,
    vestigingsplaats VARCHAR(255) NOT NULL,
    telefoonnummer INT(11) NOT NULL,
    PRIMARY KEY(winkelcode)
);

-- Tabel genaamd medewerker maken--
CREATE TABLE medewerker(
    medewerkercode INT(255) NOT NULL AUTO_INCREMENT,
    voorletter VARCHAR(255) NOT NULL,
    voorvoegsel VARCHAR(255) NOT NULL,
    achternaam VARCHAR(255) NOT NULL,
    gebruikersnaam VARCHAR(255) UNIQUE NOT NULL,
    wachtwoord VARCHAR(255) NOT NULL,
    PRIMARY KEY(medewerkercode)
);

-- Tabel genaamd bestelling maken--
CREATE TABLE bestelling(
    bestellingcode INT(255) NOT NULL AUTO_INCREMENT,
    artikelcode INT(255) NOT NULL,
    winkelcode INT(255) NOT NULL,
    aantal INT(255) NOT NULL,
    klantcode INT(255) NOT NULL,
    medewerkercode INT(255) NOT NULL,
    afgehaald BOOLEAN NOT NULL,
    PRIMARY KEY(bestellingcode),
    FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode),
    FOREIGN KEY(winkelcode) REFERENCES winkel(winkelcode),
    FOREIGN KEY(klantcode) REFERENCES klant(klantcode),
    FOREIGN KEY(medewerkercode) REFERENCES medewerker(medewerkercode)
);
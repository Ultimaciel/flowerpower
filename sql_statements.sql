-- Database genaamd drempeltoets maken als het nog niet bestaat--
CREATE DATABASE IF NOT EXISTS flowerpower;

-- Database genaamd drempeltoets gebruiken--
USE flowerpower;

CREATE TABLE account(
    id INT(255) NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);
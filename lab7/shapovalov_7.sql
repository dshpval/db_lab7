CREATE SCHEMA IF NOT EXISTS `shapovalov_7` DEFAULT CHARACTER SET utf8;
USE `shapovalov_7`;

DROP TABLE IF EXISTS `shapovalov_7`.`pharmacy`;
DROP TABLE IF EXISTS `shapovalov_7`.`medicine`;
DROP TABLE IF EXISTS `shapovalov_7`.`effectedZone`;
DROP TABLE IF EXISTS `shapovalov_7`.`street`;
DROP TABLE IF EXISTS `shapovalov_7`.`position`;
DROP TABLE IF EXISTS `shapovalov_7`.`staff`;
DROP TABLE IF EXISTS `shapovalov_7`.`treats`;
DROP TABLE IF EXISTS `shapovalov_7`.`availability`;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`pharmacy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `houseNumber` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `workTime` VARCHAR(45) NOT NULL,
  `isSaturdayDayOff` ENUM("yes", "no") NOT NULL,
  `isSundayDayOff` ENUM("yes", "no") NOT NULL,
  `streetId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`medicine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `ministryCode` VARCHAR(45) NOT NULL,
  `recipeOnly` ENUM("yes", "no") NOT NULL,
  `drugs` ENUM("yes", "no") NOT NULL,
  `psychotropic` ENUM("yes", "no") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`effectedZone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`street` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`position` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `middleName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `identificationNumber` VARCHAR(45) NOT NULL,
  `passportNumber` VARCHAR(45) NOT NULL,
  `experience` INT NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `pharmacyId` INT NOT NULL,
  `positionId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`treats` (
  `medicineId` INT NOT NULL,
  `effectedZoneId` INT NOT NULL,
  PRIMARY KEY (`medicineId`, `effectedZoneId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shapovalov_7`.`availability` (
  `pharmacyId` INT NOT NULL,
  `medicineId` INT NOT NULL,
  PRIMARY KEY (`pharmacyId`, `medicineId`))
ENGINE = InnoDB;

INSERT INTO `shapovalov_7`.`pharmacy` (`name`, `houseNumber`, `url`, `workTime`, `isSaturdayDayOff`, `isSundayDayOff`, `streetId`)
VALUES ("Apteka", 15, "http://apteka.com", "10:00-20:00", "no", "yes", 5),
	   ("Apteka1", 43, "http://apteka1.com", "10:00-20:00", "no", "yes", 1),
       ("Apteka2", 81, "http://apteka2.com", "10:00-20:00", "yes", "yes", 3),
       ("Apteka3", 26, "http://apteka3.com", "10:00-20:00", "no", "yes", 6),
       ("Apteka4", 37, "http://apteka4.com", "10:00-20:00", "no", "yes", 8),
       ("Apteka5", 92, "http://apteka5.com", "10:00-20:00", "yes", "yes", 5),
       ("Apteka6", 50, "http://apteka6.com", "10:00-20:00", "no", "yes", 9),
       ("Apteka7", 74, "http://apteka7.com", "10:00-20:00", "no", "yes", 4),
       ("Apteka8", 67, "http://apteka8.com", "10:00-20:00", "yes", "yes", 10),
       ("Apteka9", 145, "http://apteka9.com", "10:00-20:00", "no", "yes", 1);

INSERT INTO `shapovalov_7`.`medicine` (`name`, `ministryCode`, `recipeOnly`, `drugs`, `psychotropic`)
VALUES ('Medicine', '2134asd123', "yes", "no", "no"),
       ('Medicine1', 'as23sa21', "yes", "yes", "no"),
       ('Medicine2', 'as2312dw32312', "no", "no", "yes"),
       ('Medicine3', '2134dfsdf342', "yes", "no", "no"),
       ('Medicine4', 'sdfs23423dfsdf', "yes", "yes", "yes"),
       ('Medicine5', '234423fwe234234', "no", "no", "no"),
       ('Medicine6', 'wre2342rwe', "yes", "no", "no"),
       ('Medicine7', '2342rwer242', "no", "yes", "no"),
       ('Medicine8', '234ewrw24234', "yes", "no", "yes"),
       ('Medicine9', 'werw3242rewr', "yes", "no", "yes");

INSERT INTO `shapovalov_7`.`effectedZone` (`name`)
VALUES ("heart"),
       ("lungs"),
       ("liver"),
       ("stomach"),
       ("head"),
       ("knee"),
       ("ears"),
       ("nose"),
       ("eyes"),
       ("throat");

INSERT INTO `shapovalov_7`.`street` (`name`)
VALUES ("Chuprynky street"),
       ("Apple street"),
       ("Orange street"),
       ("Bandery street"),
       ("Doroshenka street"),
       ("Chuprynky street"),
       ("Main avenue"),
       ("Star street"),
       ("Moon street"),
       ("Clever avenue");

INSERT INTO `shapovalov_7`.`position` (`name`)
VALUES ("Director"),
       ("Clerk"),
       ("Seller"),
       ("Manager"),
       ("Pharmacist"),
       ("Cleaner"),
       ("Guard"),
       ("Accountant"),
       ("Main pharmacist"),
       ("Main manager");
       
INSERT INTO `shapovalov_7`.`staff` (`firstName`, `middleName`, `lastName`, `identificationNumber`, `passportNumber`, `experience`, `dateOfBirth`, `pharmacyId`, `positionId`)
VALUES ("Dmytro", "Ruslanovych", "Lavrishyn", "234232523", "eh234253", 5, "2000-11-12", 5, 1),
       ("Kvitka", "Bogdanovych", "Benzema", "2342353252", "le235454", 2, "1993-05-14", 10, 5),
       ("Maily", "Ihorivna", "Nemel", "98543252", "kl34638768", 3, "1998-09-07", 4, 10),
       ("Valeriia", "Vadymivna", "Sapiga", "214533465464", "gf234234532", 4, "2000-07-09", 2, 3),
       ("Nazar", "Yuriiovych", "Kuzmak", "97856345", "nd23463746", 3, "2000-10-01", 8, 4),
       ("Anton", "Pavlovych", "Farion", "434635245", "nd235435345", 1, "2001-06-26", 4, 9),
       ("Mariia", "Volodymyrivna", "Perova", "35356252", "ne235346345", 7, "2001-01-09", 3, 7),
       ("Diana", "Dmytrivna", "Sikorska", "34647567", "df24234234", 4, "2001-11-27", 8, 5),
       ("Viktoriia", "Oleksandrivna", "Yurchuk", "53463434", "ty235432543", 2, "2001-03-17", 10, 4),
       ("Bogdan", "Ihorovych", "Lupiichuk", "23454353", "rt23523534", 2, "2000-09-08", 9, 7);
       
INSERT INTO `shapovalov_7`.`treats` (`medicineId`, `effectedZoneId`)
VALUES (1,1),
       (2,2),
       (3,3),
       (4,4),
       (5,5),
       (6,6),
       (7,7),
       (8,8),
       (9,9),
       (10,10);

INSERT INTO `shapovalov_7`.`availability` (`pharmacyId`, `medicineId`)
VALUES (1,1),
       (2,2),
       (3,3),
       (4,4),
       (5,5),
       (6,6),
       (7,7),
       (8,8),
       (9,9),
       (10,10);
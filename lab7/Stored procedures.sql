USE lavrishyn_16_21;

DROP PROCEDURE IF EXISTS insertPharmacy;
DROP PROCEDURE IF EXISTS selectAvailability;
DROP PROCEDURE IF EXISTS copyEffectedZone;

DELIMITER //
CREATE PROCEDURE insertPharmacy(
	IN name varchar(45),
    IN houseNumber int,
    IN url varchar(45),
    IN workTime varchar(45),
    IN isSaturdayDayOff enum("yes", "no"),
    IN isSundayDayOff enum("yes", "no"),
    IN streetId int)
BEGIN
	INSERT INTO `lavrishyn_16_21`.`pharmacy` (`name`, `houseNumber`, `url`, `workTime`, `isSaturdayDayOff`, `isSundayDayOff`, `streetId`)
    VALUES (name, houseNumber, url, workTime, isSaturdayDayOff, isSundayDayOff, streetId);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectAvailability(
	IN filter varchar(45))
BEGIN
	IF filter IS NULL THEN
		SELECT p.`name`, m.`name` FROM availability AS a
		JOIN pharmacy AS p
		ON p.id = a.pharmacyId
		JOIN medicine AS m
		ON m.id = a.medicineId;
	ELSE
		SELECT p.`name`, m.`name` FROM availability AS a
		JOIN pharmacy AS p
		ON p.id = a.pharmacyId
		JOIN medicine AS m
		ON m.id = a.medicineId
        WHERE m.`name` = filter;
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE copyEffectedZone()
BEGIN
	DECLARE firstTable varchar(45) DEFAULT CONCAT("Copy 1: ", NOW());
	DECLARE secondTable varchar(45) DEFAULT CONCAT("Copy 2: ", NOW());
    
	DECLARE done int DEFAULT false;
	DECLARE zoneName varchar(45);
	DECLARE myCursor CURSOR
	FOR SELECT `name` FROM effectedZone;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
	OPEN myCursor;
    
    SET @tempQuery = CONCAT("CREATE TABLE IF NOT EXISTS `", firstTable, "` (`id` INT NOT NULL AUTO_INCREMENT, `name` VARCHAR(45) NOT NULL, PRIMARY KEY (`id`))");
    PREPARE myQuery FROM @tempQuery;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
    
    SET @tempQuery = CONCAT("CREATE TABLE IF NOT EXISTS `", secondTable, "` (`id` INT NOT NULL AUTO_INCREMENT, `name` VARCHAR(45) NOT NULL, PRIMARY KEY (`id`))");
    PREPARE myQuery FROM @tempQuery;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
    
    myLoop: LOOP
		FETCH myCursor INTO zoneName;
        IF done THEN LEAVE myLoop;
        END IF;
        
		SET @tempQuery = CONCAT("INSERT INTO `", IF(RAND() < 0.5, firstTable, secondTable), "` (`name`) VALUES ('", zoneName, "')");
		PREPARE myQuery FROM @tempQuery;
		EXECUTE myQuery;
		DEALLOCATE PREPARE myQuery;
        
    END LOOP myLoop;
    
    CLOSE myCursor;
END //
DELIMITER ;

CALL copyEffectedZone();
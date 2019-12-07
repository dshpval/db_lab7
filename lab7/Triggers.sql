USE lavrishyn_16_21;

DROP TRIGGER IF EXISTS BeforeInsertStaffPK;
DROP TRIGGER IF EXISTS BeforeInsertPharmacyPK;
DROP TRIGGER IF EXISTS BeforeInsertAvailabilityPK;
DROP TRIGGER IF EXISTS BeforeInsertTreatsPK;
DROP TRIGGER IF EXISTS BeforeUpdateStaffPK;
DROP TRIGGER IF EXISTS BeforeUpdatePharmacyPK;
DROP TRIGGER IF EXISTS BeforeUpdateAvailabilityPK;
DROP TRIGGER IF EXISTS BeforeUpdateTreatsPK;
DROP TRIGGER IF EXISTS BeforeDeleteStaffPK;
DROP TRIGGER IF EXISTS BeforeDeletePharmacyPK;
DROP TRIGGER IF EXISTS BeforeDeleteAvailabilityPK;
DROP TRIGGER IF EXISTS BeforeDeleteTreatsPK;
DROP TRIGGER IF EXISTS BeforeInsertStaffIndentificationNumber;
DROP TRIGGER IF EXISTS BeforeUpdateStaffIndentificationNumber;
DROP TRIGGER IF EXISTS BeforeInsertMedicineMinistryCode;
DROP TRIGGER IF EXISTS BeforeUpdateMedicineMinistryCode;
DROP TRIGGER IF EXISTS BeforeDeleteStreetLog;

DELIMITER //
CREATE TRIGGER BeforeInsertStaffPK
BEFORE INSERT
ON staff FOR EACH ROW
BEGIN
	IF new.pharmacyId NOT IN (SELECT id FROM pharmacy) AND new.positionId NOT IN (SELECT id FROM position) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insert error for PK in staff table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertPharmacyPK
BEFORE INSERT
ON pharmacy FOR EACH ROW
BEGIN
	IF new.streetId NOT IN (SELECT id FROM street) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insert error for PK in pharmacy table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertAvailabilityPK
BEFORE INSERT
ON availability FOR EACH ROW
BEGIN
	IF new.pharmacyId NOT IN (SELECT id FROM pharmacy) AND new.medicineId NOT IN (SELECT id FROM medicine) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insert error for PK in availability table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertTreatsPK
BEFORE INSERT
ON treats FOR EACH ROW
BEGIN
	IF new.medicineId NOT IN (SELECT id FROM medicine) AND new.effectedZoneId NOT IN (SELECT id FROM effectedZone) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insert error for PK in treats table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdateStaffPK
BEFORE UPDATE
ON staff FOR EACH ROW
BEGIN
	IF new.pharmacyId NOT IN (SELECT id FROM pharmacy) AND new.positionId NOT IN (SELECT id FROM position) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Update error for PK in staff table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdatePharmacyPK
BEFORE UPDATE
ON pharmacy FOR EACH ROW
BEGIN
	IF new.streetId NOT IN (SELECT id FROM street) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Update error for PK in pharmacy table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdateAvailabilityPK
BEFORE UPDATE
ON availability FOR EACH ROW
BEGIN
	IF new.pharmacyId NOT IN (SELECT id FROM pharmacy) AND new.medicineId NOT IN (SELECT id FROM medicine) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Update error for PK in availability table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdateTreatsPK
BEFORE UPDATE
ON treats FOR EACH ROW
BEGIN
	IF new.medicineId NOT IN (SELECT id FROM medicine) AND new.effectedZoneId NOT IN (SELECT id FROM effectedZone) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Update error for PK in treats table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeDeleteStaffPK
BEFORE DELETE
ON staff FOR EACH ROW
BEGIN
	IF old.pharmacyId NOT IN (SELECT id FROM pharmacy) AND old.positionId NOT IN (SELECT id FROM position) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Delete error for PK in staff table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeDeletePharmacyPK
BEFORE DELETE
ON pharmacy FOR EACH ROW
BEGIN
	IF old.streetId NOT IN (SELECT id FROM street) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Delete error for PK in pharmacy table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeDeleteAvailabilityPK
BEFORE DELETE
ON availability FOR EACH ROW
BEGIN
	IF old.pharmacyId NOT IN (SELECT id FROM pharmacy) AND old.medicineId NOT IN (SELECT id FROM medicine) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Delete error for PK in availability table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeDeleteTreatsPK
BEFORE DELETE
ON treats FOR EACH ROW
BEGIN
	IF old.medicineId NOT IN (SELECT id FROM medicine) AND old.effectedZoneId NOT IN (SELECT id FROM effectedZone) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Delete error for PK in treats table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertStaffIndentificationNumber
BEFORE INSERT
ON staff FOR EACH ROW
BEGIN
	IF new.identificationNumber NOT RLIKE '00$' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insert error for indentificationNumber in staff table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdateStaffIndentificationNumber
BEFORE UPDATE
ON staff FOR EACH ROW
BEGIN
	IF new.identificationNumber NOT RLIKE '00$' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Update error for indentificationNumber in staff table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertMedicineMinistryCode
BEFORE INSERT
ON medicine FOR EACH ROW
BEGIN
	IF new.ministryCode NOT RLIKE '^[A-LN-OQ-Z]{2}-[0-9]{3}-[0-9]{2}$' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insert error for ministryCode in medicine table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdateMedicineMinistryCode
BEFORE UPDATE
ON medicine FOR EACH ROW
BEGIN
	IF new.ministryCode NOT RLIKE '^[A-LN-OQ-Z]{2}-[0-9]{3}-[0-9]{2}$' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Update error for ministryCode in midecine table';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeDeleteStreetLog
BEFORE DELETE
ON street FOR EACH ROW
BEGIN
    INSERT INTO streetLogs SET `date` = NOW();
END //
DELIMITER ;
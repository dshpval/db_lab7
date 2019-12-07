USE lavrishyn_16_21;

DROP FUNCTION IF EXISTS avgExperience;
DROP FUNCTION IF EXISTS positionName;

DELIMITER //
CREATE FUNCTION avgExperience()
RETURNS DECIMAL(6,3)
BEGIN
	RETURN (SELECT AVG(experience) FROM staff);
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION positionName(myKey int)
RETURNS varchar(45)
BEGIN
	RETURN (SELECT `name` FROM position WHERE id = myKey);
END //
DELIMITER ;

SELECT * FROM staff
WHERE experience > avgExperience();

SELECT *, positionName(positionId) FROM staff;
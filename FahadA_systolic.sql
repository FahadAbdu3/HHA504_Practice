use synthea;
show tables; 
select * from clinical_data;
INSERT INTO clinical_data (patientUID, lastname, systolic, diastolic) VALUES (777777, 'Fahad', 110, 75);
Select Description, totalcost, Medicationcost(totalcost)
From medications;


##Trigger
delimiter $$
Create Trigger quaitysystolic1 before insert on clinical_data for each row
Begin
IF NEW.diastolic >= 444 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'ERROR: diastolic BP MUST BE BELOW 444 mg!';
END IF;
END; $$

delimiter ; 

# FUNCTION
DELIMITER $$clinical_data
CREATE FUNCTION MedicationCost(
cost DECIMAL(10,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE drugCost VARCHAR(20);
IF cost > 400 THEN

SET drugCost = ‘high’;

ELSEIF (cost >= 20 AND
credit <= 350) THEN

SET drugCost = 'standard';
ELSEIF cost < 20 THEN
SET drugCost = 'Low';
END IF;
-- return the drug cost category
RETURN (drugCost);
END$$
DELIMITER ;


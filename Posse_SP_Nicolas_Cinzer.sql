-- Procedures
use Posse;

-- La idea de este SP es poder obtener la cantidad de ejercicios por su tipo.
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_amount_exercise_by_type;
CREATE PROCEDURE sp_amount_exercise_by_type(IN movement INT, IN p_order_type VARCHAR(4))
BEGIN
	SET @queryString = CONCAT( 
	'SELECT *
	FROM Posse.Exercise AS Exercises
    WHERE Exercises.fk_movement = ', movement, ' ORDER BY Exercises.exercise_type ', p_order_type
    ); 
    
    PREPARE query_string FROM @queryString;
    EXECUTE query_string;
    DEALLOCATE PREPARE query_string;
END $$ 
DELIMITER ;

call sp_amount_exercise_by_type(1, 'ASC');

-- La idea de este SP es insertar multiples registros para un cierto dia de entrenamiento.
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_multiple_random_exercises;
CREATE PROCEDURE sp_insert_multiple_random_exercises (IN block_id INT, IN week_num INT, IN day_num INT)
BEGIN
	SELECT RD.pk_id INTO @rutine FROM Posse.RutineDay AS RD WHERE RD.fk_block = block_id AND RD.week_n = week_num AND RD.day_n = day_num;
	SELECT ROUND(RAND() * 6) + 1 INTO @amount;
    SELECT COUNT(*) INTO @amount_exercises FROM Posse.exercise;
    
	DELETE FROM Posse.RutineDayExercise WHERE fk_rutine = @rutine;
	
    WHILE @amount >= 1 DO
        SELECT ROUND(RAND() * (@amount_exercises - 1)) + 1 into @random_exercise;
        SELECT ROUND(RAND() *6 - 1) + 1 into @random_series;

		INSERT INTO Posse.RutineDayExercise (fk_rutine, fk_exercise, series, reps, weight, unit, comments)
		VALUES (@rutine, @random_exercise, @random_series, null, null, null, null);
        SET @amount = @amount - 1;
	END WHILE;
END $$ 
DELIMITER ;

call sp_insert_multiple_random_exercises(2, 2, 2);

SELECT * FROM Posse.RutineDayExercise WHERE fk_rutine = @rutine;
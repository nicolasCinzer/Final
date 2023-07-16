-- Triggers
use Posse;

DROP TABLE IF EXISTS LOG_EXERCISES;
CREATE TABLE IF NOT EXISTS LOG_EXERCISES (
	idlog INT AUTO_INCREMENT PRIMARY KEY,
    logMsg VARCHAR(300),
    actionName VARCHAR(10),
    tableName VARCHAR(50),
    usuario VARCHAR(100),
    currentDatetime DATE
);

-- Mantiene un registro de los ejercicios hechos en las rutinas
DROP TRIGGER tgg_log_exercises;
DELIMITER //
CREATE TRIGGER tgg_log_exercises
BEFORE UPDATE ON Posse.rutinedayexercise
FOR EACH ROW
BEGIN
	DECLARE newExerciseName VARCHAR(30);
	DECLARE oldExerciseName VARCHAR(30);

	SELECT Exercises.exercise_name INTO newExerciseName FROM Posse.exercise as Exercises WHERE Exercises.pk_id = NEW.fk_exercise;
	SELECT Exercises.exercise_name INTO oldExerciseName FROM Posse.exercise as Exercises WHERE Exercises.pk_id = OLD.fk_exercise;
    
	INSERT INTO LOG_EXERCISES (logMsg, actionName, tableName, usuario, currentDatetime)
	VALUES (CONCAT('Last Build: ', OLD.series, 'x', OLD.weight, OLD.unit, 'x', OLD.reps, ' on ', oldExerciseName,
				' - Current Build: ', NEW.series, 'x', NEW.weight, NEW.unit, 'x', NEW.reps, ' on ', newExerciseName), 'UPDATE', 'RutineDayExercise', CURRENT_USER(), NOW());
END //
DELIMITER ; 

-- Actualiza el pr en caso de ser un pr
DROP TRIGGER tgg_log_new_prs;
DELIMITER //
CREATE TRIGGER tgg_log_new_prs
AFTER UPDATE ON Posse.rutinedayexercise
FOR EACH ROW 
BEGIN
	DECLARE maxPR INT;
    
    SELECT PRs.weight INTO maxPR FROM Posse.prs AS PRs 
    WHERE PRs.fk_exercise = OLD.fk_exercise AND PRs.fk_exercise = NEW.fk_exercise AND PRs.reps = OLD.reps;
    
    IF maxPR < NEW.weight THEN
		UPDATE Posse.prs SET weight = NEW.weight WHERE PRs.fk_exercise = OLD.fk_exercise AND PRs.fk_exercise = NEW.fk_exercise;
    END IF;
END //
DELIMITER ; 

UPDATE Posse.rutinedayexercise SET weight = 220 WHERE pk_id = 6;

SELECT * FROM Posse.LOG_EXERCISES;
SELECT * FROM Posse.rutinedayexercise;
SELECT * FROM Posse.prs;
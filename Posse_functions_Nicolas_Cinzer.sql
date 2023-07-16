-- Funciones
use Posse;

-- Muchas veces cuando programo una planificacion, me interesa saber el volumen (El volumen se puede calcular de muchas manera, pero para simplificarlo voy a calcularlo de la siguiente manera: Series x Peso x Reps) entrenado.
DROP FUNCTION IF EXISTS FN_GET_VOLUME;

DELIMITER $$
CREATE FUNCTION FN_GET_VOLUME (SERIES INT, WEIGHT INT, REPS INT, UNIT ENUM('KGs', 'LBs'))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	RETURN CONCAT(SERIES * WEIGHT * REPS, UNIT);
END $$ 
DELIMITER ;

SELECT fk_rutine, fk_exercise, series, reps, weight, unit, FN_GET_VOLUME(series, weight, reps, unit) AS Volume
FROM posse.rutinedayexercise
WHERE series is not null AND reps is not null AND weight is not null AND unit is not null;

-- El objetivo de esta funcion es obtener mediante el id de un ejercicio el movimiento principal al que esta enfocado. Por ejemplo, un press banca inclinado esta enfocado en mejorar el Press Banca Basico.
DROP FUNCTION IF EXISTS FN_GET_MOVEMENT;
DELIMITER $$
CREATE FUNCTION FN_GET_MOVEMENT (movement_id INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE movement VARCHAR(20);
    
    SELECT Movements.movement_name INTO movement 
    FROM Posse.Exercise as Exercises
    JOIN Posse.Movements as Movements
    ON Exercises.fk_movement = Movements.pk_id
    WHERE Exercises.pk_id = movement_id;
    RETURN movement;
END $$ 
DELIMITER ;

SELECT FN_GET_MOVEMENT(Exercises.pk_id) AS Movimiento, Exercises.exercise_name AS Ejercicio, Exercises.exercise_type AS Tipo
FROM Posse.Exercise as Exercises;



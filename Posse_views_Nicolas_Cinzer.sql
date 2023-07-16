use posse;

-- View: Con esta view podemos visualizar bien nuestros PRs, viendo en la primer columna el ejercicio y el resto de info siendo la marca personal en si.
CREATE OR REPLACE VIEW VW_PRs_BY_EXERCISE AS (
	SELECT Ex.exercise_name AS Ejercicio, PRs.series, PRs.reps, PRs.weight, PRs.unit 
    FROM Posse.PRs AS PRs 
    JOIN Posse.Exercise as Ex 
    ON PRs.fk_exercise = Ex.pk_id
);
SELECT * FROM VW_PRs_BY_EXERCISE;
           
-- View: En esta view vamos a poder ver todos los dias que tiene cada mesociclo y bloque en particular, es una buena manera de ver cuantas semanas y dias tiene cada bloque
CREATE OR REPLACE VIEW VW_RUTINE_DAY_WITH_BLOCK_INFO AS (
	SELECT Meso.mesocycle_name AS Mesociclo, CONCAT(BT.block_name, ' - ' , Movements.movement_name) AS Bloque, RD.week_n AS Semana, RD.day_n AS Dia
	FROM Posse.rutineday AS RD 
    JOIN Posse.mesocycles AS Meso 
    ON RD.fk_mesocycle = Meso.pk_id
    JOIN Posse.blocks AS Blocks
    ON RD.fk_block = Blocks.pk_id
    JOIN Posse.blocktypes AS BT
    ON Blocks.fk_blockType = BT.pk_id
    JOIN Posse.movements AS Movements
    ON Blocks.fk_movement = Movements.pk_id
);
SELECT * FROM VW_RUTINE_DAY_WITH_BLOCK_INFO;

-- View: A veces cuando se programa una planificacion, nos interesa saber por semana cuantas veces hacemos ejercicios principales y sus complementos
CREATE OR REPLACE VIEW VW_EXERCISES_TYPES_BY_WEEK AS (
	SELECT CONCAT('Semana: ',RD.week_n) AS Semana,  CONCAT(Exercises.exercise_type ,': ',count(Exercises.exercise_type)) AS Tipo_De_Ejercicio
    FROM Posse.rutinedayexercise AS RDE
	JOIN Posse.rutineday AS RD
    ON RDE.fk_rutine = RD.pk_id
    JOIN Posse.exercise AS Exercises
    ON RDE.fk_exercise = Exercises.pk_id
    WHERE RD.week_n = 2
    GROUP BY Exercises.exercise_type
);
SELECT * FROM VW_EXERCISES_TYPES_BY_WEEK;

-- View: Esta view te permite ver el ejercicio que tiene el PR con mas peso
CREATE OR REPLACE VIEW VW_BEST_PR_EXERCISE AS (
	SELECT Exercises.exercise_name AS Ejercicio
	FROM Posse.exercise AS Exercises
    WHERE Exercises.pk_id = 
		(SELECT PRs.fk_exercise 
        FROM Posse.PRs AS PRs
        WHERE PRs.weight =
			(SELECT MAX(weight)
            FROM Posse.PRs)
		)
);
SELECT * FROM VW_BEST_PR_EXERCISE;
    
-- View: En esta view podemos ver por dia de entreno los ejercicios
CREATE OR REPLACE VIEW VW_EXERCISES_BY_WEEKDAY AS (
	SELECT CONCAT('Semana: ',RD.week_n,' - Dia: ',RD.day_n) AS Fecha, Exercises.exercise_name AS Ejercicio, RDE.series, RDE.reps, RDE.weight, RDE.unit
    FROM Posse.RutineDayExercise AS RDE
    JOIN Posse.rutineday AS RD
    ON RDE.fk_rutine = RD.pk_id
    JOIN Posse.exercise AS Exercises
    ON RDE.fk_exercise = Exercises.pk_id
    WHERE RD.week_n = 1 AND RD.day_n = 1
    ORDER BY RDE.fk_rutine
);
SELECT * FROM VW_EXERCISES_BY_WEEKDAY;
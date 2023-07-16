INSERT INTO Posse.BlockTypes (block_name) 
VALUES 						 ('Hipertrofia'),
							 ('Fuerza Base'),
                             ('Volumen'),
                             ('Tapering'),
                             ('Peaking');

INSERT INTO Posse.Movements (movement_name) 
VALUES 						('Press Banca'),
							('Sentadilla'),
                            ('Peso Muerto');

INSERT INTO Posse.Mesocycles (mesocycle_name, duration)
VALUES 						 ('Off Season', 3);

INSERT INTO Posse.Blocks (fk_blockType, fk_movement, fk_mesocycle, duration) 
VALUES 					 (1, 1, 1, 2), -- Off Season
						 (1, 2, 1, 2),
                         (1, 3, 1, 1),
                         (2, 1, 1, 1),
                         (2, 2, 1, 1),
                         (2, 3, 1, 1),
                         (5, 3, 1, 1); -- Off Season
                         
INSERT INTO Posse.RutineDay (fk_mesocycle, fk_block, week_n, day_n)
VALUES 						 (1, 1, 1, 1), -- Press Banca / Hipertrofia
							 (1, 1, 1, 2),
                             (1, 1, 1, 3),
                             (1, 1, 2, 1),
							 (1, 1, 2, 2),
							 (1, 1, 2, 3),
							 (1, 1, 3, 1),
                             (1, 1, 3, 2),
							 (1, 1, 3, 3),
                             (1, 1, 4, 1),
							 (1, 1, 4, 2),
                             (1, 1, 4, 3),
                             (1, 1, 5, 1),
							 (1, 1, 5, 2),
							 (1, 1, 5, 3),
							 (1, 1, 6, 1),
                             (1, 1, 6, 2),
							 (1, 1, 6, 3),
                             (1, 1, 7, 1),
							 (1, 1, 7, 2),
							 (1, 1, 7, 3),
							 (1, 1, 8, 1),
                             (1, 1, 8, 2),
							 (1, 1, 8, 3), -- Press Banca / Hipertrofia
                             (1, 2, 1, 1), -- Sentadilla / Hipertrofia
							 (1, 2, 1, 2),
                             (1, 2, 2, 1),
							 (1, 2, 2, 2),
							 (1, 2, 3, 1),
                             (1, 2, 3, 2),
                             (1, 2, 4, 1),
							 (1, 2, 4, 2),
                             (1, 2, 5, 1),
							 (1, 2, 5, 2),
							 (1, 2, 6, 1),
                             (1, 2, 6, 2),
                             (1, 2, 7, 1),
							 (1, 2, 7, 2),
							 (1, 2, 8, 1),
                             (1, 2, 8, 2), -- Sentadilla / Hipertrofia
                             (1, 3, 1, 1), -- Peso Muerto / Hipertrofia
							 (1, 3, 1, 2),
                             (1, 3, 2, 1),
							 (1, 3, 2, 2),
							 (1, 3, 3, 1),
                             (1, 3, 3, 2),
                             (1, 3, 4, 1),
							 (1, 3, 4, 2), -- Peso Muerto / Hipertrofia
                             (1, 4, 1, 1), -- Press Banca / Fuerza Base
							 (1, 4, 1, 2),
                             (1, 4, 2, 1),
							 (1, 4, 2, 2),
							 (1, 4, 3, 1),
                             (1, 4, 3, 2),
                             (1, 4, 4, 1),
							 (1, 4, 4, 2), -- Press Banca / Fuerza Base
                             (1, 5, 1, 1), -- Sentadilla / Fuerza Base
							 (1, 5, 1, 2),
                             (1, 5, 2, 1),
							 (1, 5, 2, 2),
							 (1, 5, 3, 1),
                             (1, 5, 3, 2),
                             (1, 5, 4, 1),
							 (1, 5, 4, 2), -- Sentadilla / Fuerza Base
                             (1, 6, 1, 1), -- Peso Muerto / Fuerza Base
                             (1, 6, 2, 1),
							 (1, 6, 3, 1),
                             (1, 6, 4, 1), -- Peso Muerto / Fuerza Base
                             (1, 7, 1, 1), -- Peso Muerto / Peaking
                             (1, 7, 2, 1),
							 (1, 7, 3, 1),
                             (1, 7, 4, 1); -- Peso Muerto / Peaking
                             
INSERT INTO Posse.Exercise (fk_movement, exercise_name, exercise_type)
VALUES 					   (1, 'Press Banca', 'Basico'),
						   (2, 'Sentadilla', 'Basico'),
                           (3, 'Peso Muerto', 'Basico'),
                           (1, 'Press Banca CG', 'Variante'),
                           (1, 'Press Banca Inclinado', 'Variante'),
                           (1, 'Press Banca Pausa', 'Variante'),
                           (1, 'Press Banca Mancuerna', 'Accesorio'),
                           (null, 'Pec Dec', 'Accesorio'),
                           (null, 'Extension Triceps', 'Accesorio'),
                           (null, 'Laterales', 'Accesorio'),
                           (null, 'Press Hombros', 'Accesorio'),
                           (null, 'Jalon a la Cara', 'Accesorio'),
                           (2, 'Sentadilla Pausa', 'Variante'),
                           (2, 'Sentadilla Tempo', 'Variante'),
                           (2, 'Sentadilla HB', 'Variante'),
                           (2, 'Sentadilla Bulgara', 'Accesorio'),
                           (null, 'Extension de Cuadriceps', 'Accesorio'),
                           (null, 'Prensa Piernas', 'Accesorio'),
                           (3, 'Peso Muerto Pausa', 'Variante'),
                           (3, 'Peso Muerto Rack Pull', 'Variante'),
                           (3, 'Peso Muerto Piernas Rigidas', 'Variante'),
                           (3, 'Peso Muerto Rumano', 'Accesorio'),
                           (null, 'Curl de Piernas Sentado', 'Accesorio'),
						   (null, 'Jalon al Pecho', 'Accesorio'),
                           (null, 'Remo en Cable', 'Accesorio'),
                           (null, 'Pull ups Asistidas', 'Accesorio');

INSERT INTO Posse.RutineDayExercise (fk_rutine, fk_exercise, series, reps, weight, unit, comments)
VALUES 					   			(1, 1, 4, 10, 135, 'LBs', null), -- Week 1 / PB
									(1, 4, 2, 9, 45, 'LBs', null),
                                    (2, 5, 4, 8, 135, 'LBs', null),
                                    (2, 11, 2, 10, 135, 'LBs', null),
                                    (2, 10, 3, 10, 45, 'LBs', null),
                                    (3, 1, 4, 10, 45, 'LBs', null),
                                    (3, 7, 3, 8, 45, 'LBs', null),
									(3, 9, 3, 135, null, 'LBs', null), -- Week 1 / PB
                                    (4, 1, 4, 10, null, null, null), -- Week 2 / PB
									(4, 4, 2, null, null, null, null),
                                    (5, 5, 4, 8, null, null, null),
                                    (5, 11, 2, 10, null, null, null),
                                    (5, 10, 3, 10, null, null, null),
                                    (6, 1, 4, 10, null, null, null),
                                    (6, 7, 3, 8, null, null, null),
									(6, 9, 3, null, null, null, null), -- Week 2 / PB
                                    (7, 1, 4, 10, null, null, null), -- Week 3 / PB
									(7, 4, 2, null, null, null, null),
                                    (8, 5, 4, 8, null, null, null),
                                    (8, 11, 2, 10, null, null, null),
                                    (8, 10, 3, 10, null, null, null),
                                    (9, 1, 4, 10, null, null, null),
                                    (9, 7, 3, 8, null, null, null),
									(9, 9, 3, null, null, null, null), -- Week 3 / PB
                                    (10, 1, 4, 10, null, null, null), -- Week 4 / PB
									(10, 4, 2, null, null, null, null),
                                    (11, 5, 4, 8, null, null, null),
                                    (11, 11, 2, 10, null, null, null),
                                    (11, 10, 3, 10, null, null, null),
                                    (12, 1, 4, 10, null, null, null),
                                    (12, 7, 3, 8, null, null, null),
									(12, 9, 3, null, null, null, null), -- Week 4 / PB
                                    (13, 1, 4, 10, null, null, null), -- Week 5 / PB
									(13, 4, 2, null, null, null, null),
                                    (14, 5, 4, 8, null, null, null),
                                    (14, 11, 2, 10, null, null, null),
                                    (14, 10, 3, 10, null, null, null),
                                    (15, 1, 4, 10, null, null, null),
                                    (15, 7, 3, 8, null, null, null),
									(15, 9, 3, null, null, null, null), -- Week 5 / PB
                                    (16, 1, 4, 10, null, null, null), -- Week 6 / PB
									(16, 4, 2, null, null, null, null),
                                    (17, 5, 4, 8, null, null, null),
                                    (17, 11, 2, 10, null, null, null),
                                    (17, 10, 3, 10, null, null, null),
                                    (18, 1, 4, 10, null, null, null),
                                    (18, 7, 3, 8, null, null, null),
									(18, 9, 3, null, null, null, null), -- Week 6 / PB
                                    (19, 1, 4, 10, null, null, null), -- Week 7 / PB
									(19, 4, 2, null, null, null, null),
                                    (20, 5, 4, 8, null, null, null),
                                    (20, 11, 2, 10, null, null, null),
                                    (20, 10, 3, 10, null, null, null),
                                    (21, 1, 4, 10, null, null, null),
                                    (21, 7, 3, 8, null, null, null),
									(21, 9, 3, null, null, null, null), -- Week 7 / PB
                                    (22, 1, 4, 10, null, null, null), -- Week 8 / PB
									(22, 4, 2, null, null, null, null),
                                    (23, 5, 4, 8, null, null, null),
                                    (23, 11, 2, 10, null, null, null),
                                    (23, 10, 3, 10, null, null, null),
                                    (24, 1, 4, 10, null, null, null),
                                    (24, 7, 3, 8, null, null, null),
									(24, 9, 3, null, null, null, null); -- Week 8 / PB
                                    -- Hasta aca lleno porque sino se hace eterno esto, espero que se entienda el sentido de la tabla, Seria algo parecido para el resto de Semanas
		
INSERT INTO Posse.PRs (fk_exercise, series, reps, weight, unit, comments)
VALUES 				  (1, 1, 1, 92, 'KGs', null), 
					  (2, 1, 1, 142, 'KGs', null),
                      (3, 1, 1, 155, 'KGs', null);
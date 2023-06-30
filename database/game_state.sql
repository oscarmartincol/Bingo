USE bingo;

-- -----------------------------------------------------
-- Inserción de datos a la tabla de estados del juego
-- -----------------------------------------------------
INSERT INTO state (state_name, state_description)
VALUES ("Juego creado","Partida creada, esperando a que los jugadores se unan.");

INSERT INTO state (state_name, state_description)
VALUES ("Juego iniciado","Partida en curso, generando números del bingo.");

INSERT INTO state (state_name, state_description)
VALUES ("Juego en pausa","Partida detenida, validando bingo ganador.");

INSERT INTO state (state_name, state_description)
VALUES ("Juego finalizado","Partida terminada, ya tenemos ganador.");


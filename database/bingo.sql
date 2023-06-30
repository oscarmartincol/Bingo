-- -----------------------------------------------------
-- Creación del esquema bingo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS bingo DEFAULT CHARACTER SET utf8 ;
USE bingo;

-- -----------------------------------------------------
-- Creación de tabla gamer si no existe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gamer (
  id_gamer INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_gamer),
  UNIQUE INDEX id_gamer_UNIQUE (id_gamer ASC) VISIBLE,
  UNIQUE INDEX username_UNIQUE (username ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Creación de una tabla con los estados del juego
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS state (
  id_state INT NOT NULL AUTO_INCREMENT,
  state_name VARCHAR(45) NOT NULL,
  state_description VARCHAR(80) NOT NULL,
  PRIMARY KEY (id_state),
  UNIQUE INDEX id_state_UNIQUE (id_state ASC) VISIBLE,
  UNIQUE INDEX state_name_UNIQUE (state_name ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Creación de la tabla del juego
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS game (
  id_game INT NOT NULL AUTO_INCREMENT,
  id_winner INT NULL,
  id_state INT NOT NULL,
  created DATETIME(0) NULL,
  PRIMARY KEY (id_game),
  UNIQUE INDEX id_game_UNIQUE (id_game ASC) VISIBLE,
  INDEX fk_game_gamer1_idx (id_winner ASC) VISIBLE,
  INDEX fk_game_status1_idx (id_state ASC) VISIBLE,
  CONSTRAINT fk_game_gamer1
    FOREIGN KEY (id_winner)
    REFERENCES gamer (id_gamer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_game_status1
    FOREIGN KEY (id_state)
    REFERENCES state (id_state)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Creación de la tabla con los datos de los tarjetones de bingo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bingo_card (
  id_card INT NOT NULL AUTO_INCREMENT UNIQUE,
  id_gamer INT NOT NULL,
  id_game INT NOT NULL,
  num_b1 INT NOT NULL,
  num_b2 INT NOT NULL,
  num_b3 INT NOT NULL,
  num_b4 INT NOT NULL,
  num_b5 INT NOT NULL,
  num_i1 INT NOT NULL,
  num_i2 INT NOT NULL,
  num_i3 INT NOT NULL,
  num_i4 INT NOT NULL,
  num_i5 INT NOT NULL,
  num_n1 INT NOT NULL,
  num_n2 INT NOT NULL,
  num_n3 INT NOT NULL,
  num_n4 INT NOT NULL,
  num_g1 INT NOT NULL,
  num_g2 INT NOT NULL,
  num_g3 INT NOT NULL,
  num_g4 INT NOT NULL,
  num_g5 INT NOT NULL,
  num_o1 INT NOT NULL,
  num_o2 INT NOT NULL,
  num_o3 INT NOT NULL,
  num_o4 INT NOT NULL,
  num_o5 INT NOT NULL,
  PRIMARY KEY (id_card),
  INDEX fk_bingo_card_gamer_idx (id_gamer ASC) VISIBLE,
  INDEX fk_bingo_card_game1_idx (id_game ASC) VISIBLE,
  CONSTRAINT fk_bingo_card_gamer
    FOREIGN KEY (id_gamer)
    REFERENCES gamer (id_gamer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_bingo_card_game1
    FOREIGN KEY (id_game)
    REFERENCES game (id_game)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Creación de la tabla que relaciona los jugadores con el juego
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gamer_has_game (
  gamer_id_gamer INT NOT NULL,
  game_id_game INT NOT NULL,
  PRIMARY KEY (gamer_id_gamer, game_id_game),
  INDEX fk_gamer_has_game_game1_idx (game_id_game ASC) VISIBLE,
  INDEX fk_gamer_has_game_gamer1_idx (gamer_id_gamer ASC) VISIBLE,
  CONSTRAINT fk_gamer_has_game_gamer1
    FOREIGN KEY (gamer_id_gamer)
    REFERENCES gamer (id_gamer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gamer_has_game_game1
    FOREIGN KEY (game_id_game)
    REFERENCES game (id_game)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Creación de la tabla que guarda los números que se generan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS numbers (
  id_number INT NOT NULL AUTO_INCREMENT,
  r_number INT NOT NULL,
  lett_number VARCHAR(1) NOT NULL,
  id_game INT NOT NULL,
  PRIMARY KEY (id_number, id_game),
  UNIQUE INDEX id_number_UNIQUE (id_number ASC) VISIBLE,
  INDEX fk_number_game1_idx (id_game ASC) VISIBLE,
  CONSTRAINT fk_number_game1
    FOREIGN KEY (id_game)
    REFERENCES game (id_game)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


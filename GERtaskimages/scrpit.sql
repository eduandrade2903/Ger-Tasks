-- -----------------------------------------------------
PontoCREATE SCHEMA IF NOT EXISTS `gerenciadorDB`
-- USE `gerenciadorDB` ;

-- -----------------------------------------------------
-- Table `gerenciadorDB`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciadorDB`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(32) NOT NULL,
  `senha` VARCHAR(32) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `gerenciadorDB`.`Quadro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciadorDB`.`Quadro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rsponsavel` VARCHAR(50) NOT NULL,
  `membros` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `gerenciadorDB`.`cartao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciadorDB`.`cartao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `responsavel` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(50) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Quadro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Cartao_Quadro1_idx` (`Quadro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cartao_Quadro1`
    FOREIGN KEY (`Quadro_id`)
    REFERENCES `gerenciadorDB`.`Quadro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `gerenciadorDB`.`tarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciadorDB`.`tarefas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `concluida` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `gerenciadorDB`.`usuário_has_Quadro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciadorDB`.`usuário_has_Quadro` (
  `usuário_id` INT NOT NULL,
  `Quadro_id` INT NOT NULL,
  PRIMARY KEY (`usuário_id`, `Quadro_id`),
  INDEX `fk_usuário_has_Quadro_Quadro1_idx` (`Quadro_id` ASC) VISIBLE,
  INDEX `fk_usuário_has_Quadro_usuário_idx` (`usuário_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuário_has_Quadro_usuário`
    FOREIGN KEY (`usuário_id`)
    REFERENCES `gerenciadorDB`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuário_has_Quadro_Quadro1`
    FOREIGN KEY (`Quadro_id`)
    REFERENCES `gerenciadorDB`.`Quadro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `gerenciadorDB`.`tarefas_has_Cartao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciadorDB`.`tarefas_has_Cartao` (
  `tarefas_id` INT NOT NULL,
  `Cartao_id` INT NOT NULL,
  PRIMARY KEY (`tarefas_id`, `Cartao_id`),
  INDEX `fk_tarefas_has_Cartao_Cartao1_idx` (`Cartao_id` ASC) VISIBLE,
  INDEX `fk_tarefas_has_Cartao_tarefas1_idx` (`tarefas_id` ASC) VISIBLE,
  CONSTRAINT `fk_tarefas_has_Cartao_tarefas1`
    FOREIGN KEY (`tarefas_id`)
    REFERENCES `gerenciadorDB`.`tarefas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarefas_has_Cartao_Cartao1`
    FOREIGN KEY (`Cartao_id`)
    REFERENCES `gerenciadorDB`.`cartao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

Ponto

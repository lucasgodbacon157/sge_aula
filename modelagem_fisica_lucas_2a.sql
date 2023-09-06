-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sge
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sge` ;

-- -----------------------------------------------------
-- Schema sge
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sge` ;
USE `sge` ;

-- -----------------------------------------------------
-- Table `sge`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`turma` ;

CREATE TABLE IF NOT EXISTS `sge`.`turma` (
  `id_turma` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `ano INT` VARCHAR(45) NULL,
  PRIMARY KEY (`id_turma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`aluno` ;

CREATE TABLE IF NOT EXISTS `sge`.`aluno` (
  `idaluno` INT NOT NULL,
  `lucas` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `dt_nascimento` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `turma_id_turma` INT NOT NULL,
  PRIMARY KEY (`idaluno`, `turma_id_turma`),
  INDEX `fk_aluno_turma1_idx` (`turma_id_turma` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_turma1`
    FOREIGN KEY (`turma_id_turma`)
    REFERENCES `sge`.`turma` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`professor` ;

CREATE TABLE IF NOT EXISTS `sge`.`professor` (
  `id_professor` INT NOT NULL,
  `flores` VARCHAR(45) NULL,
  `espeçialização_TI` VARCHAR(45) NULL,
  `e_mail` VARCHAR(45) NULL,
  PRIMARY KEY (`id_professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `sge`.`disciplina` (
  `iddisciplina int` INT NOT NULL,
  `cod_disciplina` VARCHAR(45) NULL,
  `carga_horaria INT` VARCHAR(45) NULL,
  `ano INT` VARCHAR(45) NULL,
  PRIMARY KEY (`iddisciplina int`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`Leciona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`Leciona` ;

CREATE TABLE IF NOT EXISTS `sge`.`Leciona` (
  `professor_id_professor` INT NOT NULL,
  `turma_id_turma` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `turma_id_turma`),
  INDEX `fk_professor_has_turma_turma1_idx` (`turma_id_turma` ASC) VISIBLE,
  INDEX `fk_professor_has_turma_professor1_idx` (`professor_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_turma_professor1`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `sge`.`professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_turma_turma1`
    FOREIGN KEY (`turma_id_turma`)
    REFERENCES `sge`.`turma` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`associada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`associada` ;

CREATE TABLE IF NOT EXISTS `sge`.`associada` (
  `turma_id_turma` INT NOT NULL,
  `disciplina_iddisciplina int` INT NOT NULL,
  PRIMARY KEY (`turma_id_turma`, `disciplina_iddisciplina int`),
  INDEX `fk_turma_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina int` ASC) VISIBLE,
  INDEX `fk_turma_has_disciplina_turma1_idx` (`turma_id_turma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_disciplina_turma1`
    FOREIGN KEY (`turma_id_turma`)
    REFERENCES `sge`.`turma` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina int`)
    REFERENCES `sge`.`disciplina` (`iddisciplina int`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`ministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`ministra` ;

CREATE TABLE IF NOT EXISTS `sge`.`ministra` (
  `professor_id_professor` INT NOT NULL,
  `disciplina_iddisciplina int` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `disciplina_iddisciplina int`),
  INDEX `fk_professor_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina int` ASC) VISIBLE,
  INDEX `fk_professor_has_disciplina_professor1_idx` (`professor_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_disciplina_professor1`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `sge`.`professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina int`)
    REFERENCES `sge`.`disciplina` (`iddisciplina int`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

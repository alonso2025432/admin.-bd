-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_usuario` (
  `id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `descripcion_tipo` VARCHAR(100) NOT NULL,
  `nombre_tipo` VARCHAR(20) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT,
  `deleted` BOOLEAN,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE INDEX `id_tipo_usuario_UNIQUE` (`id_tipo_usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(50) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `tipo_usuario_id_tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_tipo_usuario_idx` (`tipo_usuario_id_tipo_usuario` ASC) VISIBLE,
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tipo_usuario`
    FOREIGN KEY (`tipo_usuario_id_tipo_usuario`)
    REFERENCES `mydb`.`tipo_usuario` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registro_personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registro_personas` (
  `rut` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `numero_telefono` INT NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`rut`, `usuario_id_usuario`),
  UNIQUE INDEX `rut_UNIQUE` (`rut` ASC) VISIBLE,
  INDEX `fk_personas_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_personas_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estado_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estado_paciente` (
  `id_estado_paciente` INT NOT NULL AUTO_INCREMENT,
  `calificacion` TINYINT(2) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `registro_personas_rut` INT NOT NULL,
  `registro_personas_usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_estado_paciente`),
  UNIQUE INDEX `rut_UNIQUE` (`id_estado_paciente` ASC) VISIBLE,
  INDEX `fk_estado_paciente_registro_personas1_idx` (`registro_personas_rut` ASC, `registro_personas_usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_estado_paciente_registro_personas1`
    FOREIGN KEY (`registro_personas_rut` , `registro_personas_usuario_id_usuario`)
    REFERENCES `mydb`.`registro_personas` (`rut` , `usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registro_doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registro_doctor` (
  `rut_doctor` INT NOT NULL,
  `nombre_doctor` VARCHAR(45) NOT NULL,
  `fecha_nacimiento_doctor` DATE NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  PRIMARY KEY (`rut_doctor`),
  UNIQUE INDEX `rut_UNIQUE` (`rut_doctor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tratamiento_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tratamiento_medico` (
  `id_tratamiento_medico` INT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `registro_personas_rut` INT NOT NULL,
  `registro_personas_usuario_id_usuario` INT NOT NULL,
  `registro_doctor_rut_doctor` INT NOT NULL,
  PRIMARY KEY (`id_tratamiento_medico`),
  UNIQUE INDEX `rut_UNIQUE` (`id_tratamiento_medico` ASC) VISIBLE,
  INDEX `fk_tratamiento_medico_registro_personas1_idx` (`registro_personas_rut` ASC, `registro_personas_usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_tratamiento_medico_registro_doctor1_idx` (`registro_doctor_rut_doctor` ASC) VISIBLE,
  CONSTRAINT `fk_tratamiento_medico_registro_personas1`
    FOREIGN KEY (`registro_personas_rut` , `registro_personas_usuario_id_usuario`)
    REFERENCES `mydb`.`registro_personas` (`rut` , `usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tratamiento_medico_registro_doctor1`
    FOREIGN KEY (`registro_doctor_rut_doctor`)
    REFERENCES `mydb`.`registro_doctor` (`rut_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamentos` (
  `id_tratamiento_medico` INT NOT NULL,
  `medicamentos` VARCHAR(50) NOT NULL,
  `descripcion_medicamento` VARCHAR(100) NOT NULL,
  `dosis` VARCHAR(20) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `tratamiento_medico_id_tratamiento_medico` INT NOT NULL,
  PRIMARY KEY (`id_tratamiento_medico`),
  UNIQUE INDEX `rut_UNIQUE` (`id_tratamiento_medico` ASC) VISIBLE,
  INDEX `fk_medicamentos_tratamiento_medico1_idx` (`tratamiento_medico_id_tratamiento_medico` ASC) VISIBLE,
  CONSTRAINT `fk_medicamentos_tratamiento_medico1`
    FOREIGN KEY (`tratamiento_medico_id_tratamiento_medico`)
    REFERENCES `mydb`.`tratamiento_medico` (`id_tratamiento_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genero` (
  `id_genero` INT NOT NULL,
  `nombre_genero` VARCHAR(45) NOT NULL,
  `descripcion_genero` VARCHAR(100) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `registro_personas_rut` INT NOT NULL,
  `registro_personas_usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_genero`, `registro_personas_rut`, `registro_personas_usuario_id_usuario`),
  UNIQUE INDEX `rut_UNIQUE` (`id_genero` ASC) VISIBLE,
  INDEX `fk_genero_registro_personas1_idx` (`registro_personas_rut` ASC, `registro_personas_usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_genero_registro_personas1`
    FOREIGN KEY (`registro_personas_rut` , `registro_personas_usuario_id_usuario`)
    REFERENCES `mydb`.`registro_personas` (`rut` , `usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chat` (
  `id_chat` INT NOT NULL,
  `mensaje_doctor` LONGTEXT NOT NULL,
  `mesaje_paciente` LONGTEXT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `usuario_id_usuario` INT NOT NULL,
  `registro_doctor_rut_doctor` INT NOT NULL,
  PRIMARY KEY (`id_chat`),
  UNIQUE INDEX `rut_UNIQUE` (`id_chat` ASC) VISIBLE,
  INDEX `fk_chat_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_chat_registro_doctor1_idx` (`registro_doctor_rut_doctor` ASC) VISIBLE,
  CONSTRAINT `fk_chat_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chat_registro_doctor1`
    FOREIGN KEY (`registro_doctor_rut_doctor`)
    REFERENCES `mydb`.`registro_doctor` (`rut_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sintomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sintomas` (
  `id_sintomas` INT NOT NULL,
  `nombre_sintomas` VARCHAR(50) NOT NULL,
  `descripcion_sintomas` VARCHAR(200) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT,
  `update_by` INT ,
  `deleted` BOOLEAN,
  `estado_paciente_id_estado_paciente` INT NOT NULL,
  PRIMARY KEY (`id_sintomas`),
  UNIQUE INDEX `rut_UNIQUE` (`id_sintomas` ASC) VISIBLE,
  INDEX `fk_sintomas_estado_paciente1_idx` (`estado_paciente_id_estado_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_sintomas_estado_paciente1`
    FOREIGN KEY (`estado_paciente_id_estado_paciente`)
    REFERENCES `mydb`.`estado_paciente` (`id_estado_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema physiologydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema physiologydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `physiologydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `physiologydb` ;

-- -----------------------------------------------------
-- Table `physiologydb`.`TestType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`TestType` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `testName` VARCHAR(255) NULL COMMENT '',
  `description` VARCHAR(255) NULL COMMENT '',
  `status` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`testdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`testdetail` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userid` INT NULL COMMENT '',
  `testtypeid` INT NULL COMMENT '',
  `score` INT NULL COMMENT '',
  `updatedOn` DATE NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_testdetail_TestType1_idx` (`testtypeid` ASC)  COMMENT '',
  CONSTRAINT `fk_testdetail_TestType1`
    FOREIGN KEY (`testtypeid`)
    REFERENCES `physiologydb`.`TestType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`login` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userId` INT NULL COMMENT '',
  `username` VARCHAR(255) NULL COMMENT '',
  `password` VARCHAR(255) NULL COMMENT '',
  `status` INT NULL COMMENT '',
  `updatedOn` DATE NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`user_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`user_detail` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(255) NULL COMMENT '',
  `fname` VARCHAR(255) NULL COMMENT '',
  `age` INT NULL COMMENT '',
  `sex` INT NULL COMMENT '',
  `educationType` VARCHAR(255) NULL COMMENT '',
  `educationMedium` VARCHAR(255) NULL COMMENT '',
  `domicile` VARCHAR(255) NULL COMMENT '',
  `maritialStatus` INT NULL COMMENT '',
  `monthlyIncome` VARCHAR(45) NULL COMMENT '',
  `religion` VARCHAR(255) NULL COMMENT '',
  `familyType` INT NULL COMMENT '',
  `birthorder` INT NULL COMMENT '',
  `locality` VARCHAR(255) NULL COMMENT '',
  `address` VARCHAR(255) NULL COMMENT '',
  `mobileno` VARCHAR(15) NULL COMMENT '',
  `phno` VARCHAR(15) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_user_detail_testdetail1`
    FOREIGN KEY (`id`)
    REFERENCES `physiologydb`.`testdetail` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_detail_login1`
    FOREIGN KEY (`id`)
    REFERENCES `physiologydb`.`login` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`questionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`questionType` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `type` INT NULL COMMENT '',
  `description` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `testType` INT NULL COMMENT '',
  `question` VARCHAR(255) NULL COMMENT '',
  `optionType_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `optionType_id`)  COMMENT '',
  INDEX `fk_question_optionType_idx` (`optionType_id` ASC)  COMMENT '',
  CONSTRAINT `fk_question_optionType`
    FOREIGN KEY (`optionType_id`)
    REFERENCES `physiologydb`.`questionType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`answers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`answers` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `questionid` INT NULL COMMENT '',
  `description` VARCHAR(255) NULL COMMENT '',
  `score` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_answers_question1_idx` (`questionid` ASC)  COMMENT '',
  CONSTRAINT `fk_answers_question1`
    FOREIGN KEY (`questionid`)
    REFERENCES `physiologydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`testHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`testHistory` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `testdetail_id` INT NOT NULL COMMENT '',
  `userid` INT NULL COMMENT '',
  `questionId` INT NULL COMMENT '',
  `testTypeId` INT NULL COMMENT '',
  `optionTypeId` INT NULL COMMENT '',
  `selectedTypeId` INT NULL COMMENT '',
  `selectedOptionValue` VARCHAR(255) NULL COMMENT '',
  `optionscore` INT NULL COMMENT '',
  `updatedOn` DATE NULL COMMENT '',
  PRIMARY KEY (`id`, `testdetail_id`)  COMMENT '',
  INDEX `fk_testHistory_testdetail1_idx` (`testdetail_id` ASC)  COMMENT '',
  CONSTRAINT `fk_testHistory_testdetail1`
    FOREIGN KEY (`testdetail_id`)
    REFERENCES `physiologydb`.`testdetail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physiologydb`.`TestType_has_question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physiologydb`.`TestType_has_question` (
  `TestType_id` INT NOT NULL COMMENT '',
  `question_id` INT NOT NULL COMMENT '',
  `question_optionType_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`TestType_id`, `question_id`, `question_optionType_id`)  COMMENT '',
  INDEX `fk_TestType_has_question_question1_idx` (`question_id` ASC, `question_optionType_id` ASC)  COMMENT '',
  INDEX `fk_TestType_has_question_TestType1_idx` (`TestType_id` ASC)  COMMENT '',
  CONSTRAINT `fk_TestType_has_question_TestType1`
    FOREIGN KEY (`TestType_id`)
    REFERENCES `physiologydb`.`TestType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestType_has_question_question1`
    FOREIGN KEY (`question_id` , `question_optionType_id`)
    REFERENCES `physiologydb`.`question` (`id` , `optionType_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

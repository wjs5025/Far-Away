-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema faraway
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema faraway
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `faraway` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `faraway` ;

-- -----------------------------------------------------
-- Table `faraway`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faraway`.`members` ;

CREATE TABLE IF NOT EXISTS `faraway`.`users` (
  `user_id` VARCHAR(16) NOT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(16) NOT NULL,
  `email_id` VARCHAR(20) NULL DEFAULT NULL,
  `email_domain` VARCHAR(45) NULL DEFAULT NULL,
  `join_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into `faraway`.`users` (user_id, user_name, user_password, email_id, email_domain, join_date)
values 	('ssafy', '김싸피', '1234', 'ssafy', 'ssafy.com', now()), 
		('admin', '관리자', '1234', 'admin', 'google.com', now());
	
commit;


-- -----------------------------------------------------
-- Table `faraway`.`board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faraway`.`board` ;

CREATE TABLE IF NOT EXISTS `faraway`.`board` (
  `board_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `category` VARCHAR(20) NOT NULL,
  `hit` INT NULL DEFAULT 0,
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_id`),
  INDEX `board_to_members_user_id_fk` (`user_id` ASC) VISIBLE,
  CONSTRAINT `board_to_members_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `faraway`.`users` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

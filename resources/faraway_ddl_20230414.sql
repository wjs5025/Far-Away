-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema faraway
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `faraway` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `faraway` ;

-- -----------------------------------------------------
-- Table `faraway`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faraway`.`users` ;

CREATE TABLE IF NOT EXISTS `faraway`.`users` (
  `user_id` VARCHAR(16) NOT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `user_password` TEXT NOT NULL,
  `salt` VARCHAR(45) NOT NULL,
  `email_id` VARCHAR(20) NULL DEFAULT NULL,
  `email_domain` VARCHAR(45) NULL DEFAULT NULL,
  `join_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
	
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
  INDEX `board_to_users_user_id_fk` (`user_id` ASC) VISIBLE,
  CONSTRAINT `board_to_users_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `faraway`.`users` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Table `faraway`.`plans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faraway`.`plans` ;

CREATE TABLE `plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(16) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` TEXT DEFAULT NULL,
  `hit` int DEFAULT '0',
  `departure_time` timestamp NULL DEFAULT NULL,
  `arrival_time` timestamp NULL DEFAULT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_course` TEXT DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `plans_to_members_user_id_fk` (`user_id`),
  CONSTRAINT `plans_to_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `faraway`.`hotplaces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faraway`.`hotplaces` ;

CREATE TABLE `hotplaces` (
  `hotplace_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(16) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `visited_date` date NOT NULL,
  `type` int DEFAULT NULL,
  `content` TEXT DEFAULT NULL,
  `latitude` double(30,10) DEFAULT '37.5006130000',
  `longitude` double(30,10) DEFAULT '127.0364310000',
  `image` TEXT DEFAULT NULL,
  PRIMARY KEY (`hotplace_id`),
  KEY `hotplaces_to_users_user_id_fk` (`user_id`),
  CONSTRAINT `hotplaces_to_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `faraway`.`attraction_description`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attraction_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction_description` (
  `content_id` int NOT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `overview` varchar(10000) DEFAULT NULL,
  `telname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_attraciton_id_fk` FOREIGN KEY (`content_id`) REFERENCES `attraction_info` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- -----------------------------------------------------
-- Table `faraway`.`gugun`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gugun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gugun` (
  `gugun_code` int NOT NULL,
  `gugun_name` varchar(30) DEFAULT NULL,
  `sido_code` int NOT NULL,
  PRIMARY KEY (`gugun_code`,`sido_code`),
  KEY `gugun_to_sido_sido_code_fk_idx` (`sido_code`),
  CONSTRAINT `gugun_to_sido_sido_code_fk` FOREIGN KEY (`sido_code`) REFERENCES `sido` (`sido_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- -----------------------------------------------------
-- Table `faraway`.`sido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sido` (
  `sido_code` int NOT NULL,
  `sido_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sido_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
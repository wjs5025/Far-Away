use faraway;

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

CREATE DATABASE IF NOT EXISTS `crud-mvc-oop-pdo`;

USE `crud-mvc-oop-pdo`;

/*
+-----------------+--------------+------+-----+-------------------+-----------------------------+
| Field           | Type         | Null | Key | Default           | Extra                       |
+-----------------+--------------+------+-----+-------------------+-----------------------------+
| user_id         | INT(11)      | NO   | PRI | NULL              | AUTO_INCREMENT              |
| user_registered | DATETIME     | NO   |     | CURRENT_TIMESTAMP |                             |
| user_updated    | DATETIME     | NO   |     | CURRENT_TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP |
| user_name       | VARCHAR(255) | NO   |     | NULL              |                             |
| user_email      | VARCHAR(255) | NO   |     | NULL              |                             |
+-----------------+--------------+------+-----+-------------------+-----------------------------+
*/
CREATE TABLE IF NOT EXISTS `users` (
	`user_id`         INT(11)      NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_registered` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`user_updated`    DATETIME     NOT NULL ON UPDATE CURRENT_TIMESTAMP,
	`user_name`       VARCHAR(255) NOT NULL,
	`user_email`      VARCHAR(255) NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

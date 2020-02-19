/* Задача N1
	Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
    Заполните их текущими датой и временем.
*/


DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
creat_at VARCHAR(255) NULL,
updated_at VARCHAR(255) NULL
) COMMENT = 'Пользователи';


INSERT INTO `users` VALUES 
('1','Margaret',NULL,NULL),
('2','Cathryn',NULL,NULL),
('3','Jayden',NULL,NULL),
('4','Terrance',NULL,NULL),
('5','Judge',NULL,NULL),
('6','Jamal',NULL,NULL),
('7','Dane',NULL,NULL),
('8','Heath',NULL,NULL),
('9','Corene',NULL,NULL),
('10','Delta',NULL,NULL),
('11','Justina',NULL,NULL),
('12','Makayla',NULL,NULL),
('13','Carlos',NULL,NULL),
('14','Brandi',NULL,NULL),
('15','Lyric',NULL,NULL); 
  
UPDATE `example`.`users` SET `creat_at` = now();
UPDATE `example`.`users` SET `updated_at`= CURRENT_TIMESTAMP;

SELECT * FROM users;

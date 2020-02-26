/* Задача N2
	Таблица users была неудачно спроектирована. Записи created_at и updated_at были 
    заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
    Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/


DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

-- есть таблица users с записями created_at и updated_at типа VARCHAR
CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Имя пользователя',
creat_at VARCHAR(255) NULL,
updated_at VARCHAR(255) NULL
) COMMENT = 'Пользователи';

-- в них помещались значения в формате "20.10.2017 8:10"
INSERT INTO `example`.`users` VALUES ('1', 'Margaret', '17.02.2001 8:10', '16.04.2017 13:16');
INSERT INTO `example`.`users` VALUES ('2', 'Cathryn', '8.09.2005 22:31', '30.06.2006 11:53');
INSERT INTO `example`.`users` VALUES ('3', 'Jayden', '28.12.1997 17:48', '21.01.2018 9:08');
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

/*

#==================== решение =========================================
-- мой вариант, через создание новых колонок 
-- создаем новые колонки с date DATETIME
ALTER TABLE `example`.`users` ADD COLUMN `creat_at_new` DATETIME AFTER `creat_at`; 
ALTER TABLE `example`.`users` ADD COLUMN `updated_at_new` DATETIME AFTER `updated_at`; 

-- заносим в них переформатированные даты
UPDATE `example`.`users` SET `creat_at_new` = DATE_FORMAT(STR_TO_DATE(creat_at, '%d.%m.%Y %H:%i'),'%Y-%m-%d %H:%i:00'); 
UPDATE `example`.`users` SET `updated_at_new` = DATE_FORMAT(STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i'),'%Y-%m-%d %H:%i:00'); 

-- старые колонки удаляем 
ALTER TABLE `example`.`users` 
DROP COLUMN `updated_at`,
DROP COLUMN `creat_at`;

-- новые колонки переименовываем в старые названия
ALTER TABLE `example`.`users` 
CHANGE COLUMN `creat_at_new` `creat_at` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `updated_at_new` `updated_at` DATETIME NULL DEFAULT NULL ;
-- и вуаля!!!

*/

-- ВАРИАНТ 2
-- три команды 
UPDATE 
	`example`.`users` 
SET 
	creat_at = STR_TO_DATE(creat_at, '%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
SELECT * FROM users;

ALTER TABLE 
	users 
CHANGE
	creat_at creat_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE 
	users 
CHANGE
	updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;

DESCRIBE users;











/* Урок 7. Задача N3
	Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label,
name). Поля from, to и label содержат английские названия городов, поле name — русское.
Выведите список рейсов flights с русскими названиями городов.
*/

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

-- создадим и заполним таблички 
CREATE TABLE 
	`flights` 
(
    `id` SERIAL PRIMARY KEY,
    `from` VARCHAR(255),
    `to` VARCHAR(255)
)  COMMENT='Маршруты рейсов';

INSERT INTO 
	`flights` 
VALUES 
	('1', 'moskow', 'omsk'),
	('2', 'novgorod', 'kazan'),
	('3', 'irkutsk', 'moskow'),
	('4', 'omsk', 'irkutsk'),
	('5', 'moskow', 'kazan');
    
CREATE TABLE 
	`cities` 
(
    `label` VARCHAR(255),
    `name` VARCHAR(255)
)  COMMENT='Написание городов на русском языке';

INSERT INTO 
	`cities` 
VALUES 
	('moskow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');

-- табло на английском     
SELECT * FROM `flights`;

-- ОТВЕТ 
-- табло на русском 
SELECT 
	id,
	(SELECT `name` FROM `cities` WHERE `label` = `flights`.`from`) AS 'from',
	(SELECT `name` FROM `cities` WHERE `label` = `flights`.`to`) AS 'to'
FROM `flights`;








/* Урок 9. Задача N4
	(по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте
	запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих
	записей.
*/

CREATE TABLE `example`.`tbl1` (
  `id` INT NOT NULL,
  `created_at` DATE NULL,
  PRIMARY KEY (`id`));

INSERT INTO 
	`example`.`tbl1` (`id`, `created_at`) 
VALUES 
	('1', '2018-08-01'),
	('2', '2016-08-04'),
	('3', '2018-08-16'),
    ('4', '2018-07-09'),
    ('5', '2018-12-24'),
	('6', '2018-08-17');    
    
PREPARE prd FROM 'DELETE FROM `example`.`tbl1` ORDER BY `created_at` LIMIT ?';
SET @cnt = (SELECT count(*) - 3 FROM `example`.`tbl1`);
EXECUTE prd USING @cnt;

drop  table if exists `example`.`tbl1`;   

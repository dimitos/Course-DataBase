/* Урок 9. Задача N2
	Создайте представление, которое выводит название name товарной позиции из таблицы
	products и соответствующее название каталога name из таблицы catalogs.
*/


CREATE OR REPLACE VIEW `namecate` (`name`, `name_cat`) AS
	SELECT 
		p.`name`, 
        c.`name`
        FROM `products` p
        JOIN `catalogs` c ON p.`catalog_id` = c.`id`;
SELECT * FROM `namecate`;

-- DROP VIEW IF EXISTS cat2, namecate;
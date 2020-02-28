/* Урок 7. Задача N2
	Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

USE shop;
-- Ответ 
SELECT
	p.id,
    c.name,
    p.name,
    p.description,
    p.price
FROM
	products AS p
JOIN
	catalogs AS c
ON
	p.catalog_id = c.id;






/* Урок 7. Задача N1
	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в
	интернет магазине.
*/

USE shop;

-- добавим в таблицу orders пользователей, кто делал покупки 

INSERT INTO orders 
	(`user_id`) 
VALUES 
	('2'),    
	('6'),
	('5'),
	('2'),
	('5'),
	('3'),
	('2'),
	('6'),
	('5');
    
    
-- Запрос на список пользователей users, которые осуществили хотя бы один заказ orders    
-- Ответ. Вариант 1. Через вложенный запрос и ANY
SELECT 
	id, name 
FROM 
	users 
WHERE 
	id = ANY (SELECT user_id FROM orders);
    
-- Ответ. Вариант 2. Через JOIN объединяем и берем уникальные id
SELECT DISTINCT 
	p.`id`, p.`name`
FROM
	 orders AS c
JOIN
	`users` AS p
ON
	c.user_id = p.id;
    
    
    
/* Задача N5
	Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
    Отсортируйте записи в порядке, заданном в списке IN.
*/


DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

# есть таблица юзеров
CREATE TABLE catalogs (
id SERIAL PRIMARY KEY,
firstname VARCHAR(255),
birthday DATE NOT NULL
) COMMENT = 'каталог пользователей';

# занполняем каталог
INSERT INTO `catalogs` 
VALUES 
('1','Nella','2000-09-06'),
('2','Cathryn','2003-01-27'),
('3','Juliana','1975-12-18'),
('4','Elena','2001-12-08'),
('5','Muhammad','1987-05-01'),
('6','Dereck','2003-08-26'),
('7','Ally','1989-09-17'),
('8','Gustave','1972-07-27'),
('9','Quinten','2003-12-31'),
('10','Dakota','1997-11-29'),
('11','Heath','1999-07-15'),
('12','Saige','1987-10-29'),
('13','Delia','1982-05-28'),
('14','Jacynthe','1992-03-21'),
('15','Waino','1987-08-23'),
('16','Caterina','1997-11-05'),
('17','Henriette','1989-05-09'),
('18','Osborne','1988-04-28');

# отсортировать записи в порядке, заданном в списке IN
SELECT * FROM catalogs 
	WHERE id IN (5, 1, 14, 2)
    ORDER BY FIND_IN_SET(id, '5,1,14,2');


    


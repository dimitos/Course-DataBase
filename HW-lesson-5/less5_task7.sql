/* Задача N7
	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
    Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/


DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

# есть таблица юзеров
CREATE TABLE users (
id SERIAL PRIMARY KEY,
firstname VARCHAR(255),
birthday DATE NOT NULL
) COMMENT = 'Пользователи';

# заносим даты рождения
INSERT INTO `users` 
VALUES 
('1','Nella','2000-09-06'),
('2','Cathryn','2003-01-27'),
('3','Juliana','1975-12-18'),
('4','Elena','2001-12-08'),
('5','Muhammad','1987-05-01'),
('6','Dereck','2003-08-26'),
('7','Ally','1989-09-17'),
('8','Gustave','1972-07-29'),
('9','Quinten','2003-12-31'),
('10','Dakota','1997-11-29'),
('11','Heath','1999-07-15'),
('12','Saige','1987-10-29'),
('13','Delia','1982-05-28'),
('14','Jacynthe','1992-03-21'),
('15','Waino','1987-08-22'),
('16','Caterina','1997-11-05'),
('17','Henriette','1989-05-09'),
('18','Osborne','1988-04-28');

# выводим количества д/р по столбцам с неделями, обязательно с приведение даты рождения к 2020 году.
SELECT 
	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='0') AS `Понедельник`,
  	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='1') AS `Вторник`,
	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='2') AS `Среда`,
	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='3') AS `Четверг`,
	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='4') AS `Пятница`,
	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='5') AS `Суббота`,
	sum(WEEKDAY(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d'))='6') AS `Воскресенье`  
FROM users ;

-- select *, weekday(DATE_FORMAT(STR_TO_DATE(`birthday`, '%Y-%m-%d'),'2020-%m-%d')) AS `WEEKDAY` from `users`; 

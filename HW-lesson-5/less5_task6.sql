/* Задача N6
	Подсчитайте средний возраст пользователей в таблице users
*/


DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

# есть таблица юзеров
CREATE TABLE users (
id SERIAL PRIMARY KEY,
firstname VARCHAR(255),
birthday DATETIME NOT NULL
) COMMENT = 'Пользователи';

# заносим даты рождения
INSERT INTO `users` 
VALUES 
('1','Nella','2000-09-06 15:54:27'),
('2','Cathryn','2003-01-27 00:06:21'),
('3','Juliana','1975-12-18 12:39:42'),
('4','Elena','2001-12-08 03:02:36'),
('5','Muhammad','1987-05-01 23:32:19'),
('6','Dereck','2003-08-26 08:47:19'),
('7','Ally','1989-09-17 01:30:31'),
('8','Gustave','1972-07-27 10:39:42'),
('9','Quinten','2003-12-31 04:06:58'),
('10','Dakota','1997-11-29 05:28:11'),
('11','Heath','1999-08-15 20:26:18'),
('12','Saige','1987-10-30 15:26:01'),
('13','Delia','1982-05-28 22:46:28'),
('14','Jacynthe','1992-03-21 11:03:32'),
('15','Waino','1987-08-23 21:38:51'),
('16','Caterina','1997-11-05 15:07:59'),
('17','Henriette','1989-05-09 11:45:42'),
('18','Osborne','1988-04-28 05:09:59');

# вычисляем возрасты пользователеё, суммируем их, делим эту сумму на количество строк в таблице, округляем
# до десятых и выводим.
SELECT 
	ROUND(
		SUM((YEAR(CURRENT_DATE)-YEAR(`birthday`))-(RIGHT(CURRENT_DATE,5)<RIGHT(`birthday`,5)))/COUNT(*), 1
    )
	AS `Средний возраст пользователей` FROM users;

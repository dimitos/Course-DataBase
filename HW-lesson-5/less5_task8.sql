/* Задача N8
	Подсчитайте произведение чисел в столбце таблицы
*/

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

-- таблице в value есть числа
CREATE TABLE `numbers` (
id SERIAL PRIMARY KEY,
`value` INT DEFAULT 0
) COMMENT = 'Таблица чисел';

-- в поле value разные цифры.
INSERT INTO `numbers` 
VALUES 
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','2'),
('7','8');

-- подсчитайть произведение чисел в столбце value
select round(exp(sum(log(value)))) as 'произведение всех значений' from numbers;






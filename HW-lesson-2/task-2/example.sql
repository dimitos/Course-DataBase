/* Задача N2
Создайте базу данных example, разместите в ней таблицу users, 
состоящую из двух столбцов, числового id и строкового name.
*/


DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Имя пользователя'
) COMMENT = 'Пользователи';

INSERT INTO users (name) VALUES 
  ('Василий'),
  ('Афанасий'),
  ('Елена'),
  ('John'),
  ('Пётр');

SELECT * FROM users;

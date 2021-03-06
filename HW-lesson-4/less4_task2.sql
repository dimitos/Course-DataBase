
/* Задача №2 к уроку №4
 Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
*/


USE vk;

SELECT id, firstname FROM users GROUP BY firstname ORDER BY firstname ASC;
-- выбрать firstname из таблицы vk.users  без повторений в колонке firstname отсортировать firstname по возрастанию.
-- из 100 users выбирает уникальных 93 и сортирует по возрастанию.

# отсортировать можно с мпомощью DISTINCT
SELECT  DISTINCT firstname FROM users;
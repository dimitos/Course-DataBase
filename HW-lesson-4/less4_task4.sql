
/* Задача №4 к уроку №4
 Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
*/

USE vk;
-- в таблице messages 200 сообщений
-- сначала сделаем пару подобных строчек
UPDATE `vk`.`messages` SET `created_at` = '2022-01-16 17:46:53' WHERE (`id` = '10');
UPDATE `vk`.`messages` SET `created_at` = '2020-03-09 01:04:45' WHERE (`id` = '28');
UPDATE `vk`.`messages` SET `created_at` = '2021-07-14 23:11:27' WHERE (`id` = '36');
UPDATE `vk`.`messages` SET `created_at` = '2020-12-29 03:41:48' WHERE (`id` = '51');


-- а теперь удалим их
 DELETE FROM messages WHERE created_at > NOW();
 -- осталось 196 сообщений
 
 SELECT * FROM vk.messages;
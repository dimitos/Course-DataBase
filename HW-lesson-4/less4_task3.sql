/* Задача №3 к уроку №4
 Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
*/


use vk;

-- добавим поле is_active в таблицу profiles со значением по умолчанию = true
ALTER TABLE `vk`.`profiles` 
ADD COLUMN `is_active` SET('true', 'false') NOT NULL DEFAULT 'true' AFTER `created_at`,
ADD INDEX `is_active` (`is_active` ASC) VISIBLE;

-- заменим true на false в тех строчках, где возраст меньше 18
UPDATE `vk`.`profiles` 
SET `is_active` = 'false' 
WHERE `is_active` = 'true' 
AND (YEAR(CURRENT_DATE)-YEAR(`birthday`))-(RIGHT(CURRENT_DATE,5)<RIGHT(`birthday`,5)) < 18;

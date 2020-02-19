
/* Задача №3 к уроку №4
 Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
*/

use vk;

/*
# ПЕРВЫЙ ВАРИАНТ
# добавим поле is_active в таблицу profiles со значением по умолчанию = true
ALTER TABLE `vk`.`profiles` 
ADD COLUMN `is_active` SET('true', 'false') NOT NULL DEFAULT 'false' AFTER `created_at`,
ADD INDEX `is_active` (`is_active` ASC) VISIBLE;

# заменим false на true в тех строчках, где возраст больше 18
UPDATE `vk`.`profiles` 
SET `is_active` = 'true' 
WHERE `is_active` = 'false' 
AND (YEAR(CURRENT_DATE)-YEAR(`birthday`))-(RIGHT(CURRENT_DATE,5)<RIGHT(`birthday`,5)) >= 18;

# изменил 60 строк открыли доступ 60 пользователям
SELECT *  FROM `vk`.`profiles`;
*/

# ВТОРОЙ ВАРИАНТ  используем тип данных BIT

-- добавим поле is_active в таблицу profiles со значением по умолчанию = true
ALTER TABLE `vk`.`profiles` 
ADD COLUMN `is_active` BIT NOT NULL AFTER `created_at`,  -- при NOT NULL по умолчанию присваивается 0
ADD INDEX `is_active` (`is_active` ASC) VISIBLE;

-- заменим 0 на 1 в тех строчках, где возраст больше 18
UPDATE `vk`.`profiles` 
SET `is_active` = 1       -- открываем доступ
WHERE `is_active` = 0 
AND (YEAR(CURRENT_DATE)-YEAR(`birthday`))-(RIGHT(CURRENT_DATE,5)<RIGHT(`birthday`,5)) >= 18;

-- зменил 60 строк открыли доступ 60 пользователям
SELECT *  FROM `vk`.`profiles`;


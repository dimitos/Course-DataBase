/* Урок 6. Задача N3
	Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

use vk;

-- --------- подготовка ---------------
-- определим список мужчин
-- SELECT user_id FROM `profiles` WHERE `gender` = 'b';

-- составим список media мужчин
-- SELECT id FROM media WHERE user_id IN (SELECT user_id FROM `profiles` WHERE `gender` = 'b');

-- считаем количество лайков у мужчин
-- SELECT count(*) FROM `likes` WHERE `media_id` IN (SELECT `id` FROM `media` WHERE `user_id` IN (SELECT `user_id` FROM `profiles` WHERE `gender` = 'b'));


-- --------- ответ ---------------
-- сравниваем

SELECT
	CASE
		WHEN 
			(SELECT count(*) FROM `likes` WHERE `media_id` IN (SELECT `id` FROM `media` WHERE `user_id` IN (SELECT `user_id` FROM `profiles` WHERE `gender` = 'b')))
			 >
			(SELECT count(*) FROM `likes` WHERE `media_id` IN (SELECT `id` FROM `media` WHERE `user_id` IN (SELECT `user_id` FROM `profiles` WHERE `gender` = 'g')))
		THEN 'больше у мужчин'
		WHEN 
			(SELECT count(*) FROM `likes` WHERE `media_id` IN (SELECT `id` FROM `media` WHERE `user_id` IN (SELECT `user_id` FROM `profiles` WHERE `gender` = 'b')))
			 <
			(SELECT count(*) FROM `likes` WHERE `media_id` IN (SELECT `id` FROM `media` WHERE `user_id` IN (SELECT `user_id` FROM `profiles` WHERE `gender` = 'g')))
		THEN 'больше у женщин'
		ELSE 'у мужчин иженщин одинаково'
	END AS 'Количество лайков';  





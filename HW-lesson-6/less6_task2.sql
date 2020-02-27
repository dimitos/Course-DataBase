/* Урок 6. Задача N2
	Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
*/

use vk;

-- --------- подготовка ---------------
-- определим список пользователей младше 10 лет
-- SELECT user_id FROM `profiles` WHERE timestampdiff(YEAR, birthday, now()) < 10;
-- SELECT * FROM `profiles` WHERE (`birthday` + INTERVAL 10 YEAR) > now();

-- определим какие media есть у наших мелких пользователей 
-- SELECT id FROM media WHERE user_id IN (SELECT user_id FROM `profiles` WHERE timestampdiff(YEAR, birthday, now()) < 10);

-- --------- ответ ---------------

SELECT
	count(*) AS 'Общее количество полученных лайков пользователями младше 10 лет'
FROM `likes`
WHERE `media_id` IN 
	(
		SELECT `id` FROM `media` WHERE `user_id` IN 
        (
			SELECT `user_id` FROM `profiles` WHERE timestampdiff(YEAR, `birthday`, now()) < 10
		)
	);







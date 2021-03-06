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

-- SELECT `user_id` FROM `profiles` WHERE FLOOR((TO_DAYS(NOW()) - TO_DAYS(`birthday`))/ 365.25) < 10;



select count(*) -- количество лайков
from likes
where media_id in ( -- все медиа записи таких пользователей
	select id 
	from media 
	where user_id in ( -- все пользователи младше 10 лет
		select 
			user_id
		-- 	, birthday
		from profiles as p
		where  YEAR(CURDATE()) - YEAR(birthday) < 10
	)
);


SELECT
	count(*) 'Общее количество полученных лайков пользователями младше 10 лет'
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN profiles p ON p.user_id = m.user_id
WHERE YEAR(CURDATE()) - YEAR(birthday) < 10;










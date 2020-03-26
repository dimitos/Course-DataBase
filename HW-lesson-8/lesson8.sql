-- Сложные запросы с использованием JOIN
use vk;

SELECT COUNT(*) 
FROM users;
SELECT count(*)
FROM messages;

SELECT 
	u.*,
    m.*
FROM 
	users u
	JOIN
	messages m
WHERE u.id = m.from_user_id
ORDER BY u.id;

SELECT 
	u.*,
    m.*
FROM 
	users u
	JOIN
	messages m
WHERE u.id = m.from_user_id
ORDER BY u.id;

SELECT 
	u.*,
    m.*
FROM 
	users u
	JOIN
	messages m
ON u.id = m.from_user_id
ORDER BY u.id;

-- ---------------------------------------
-- сколько сообщений написал каждый пользователь
SELECT 
	u.id индентификатор,
    count(*) cnt    
FROM 
	users u
	INNER JOIN
	messages m
ON u.id = m.from_user_id
GROUP BY u.id
ORDER BY u.id DESC;

-- ---------------------------------------------
-- выборка пользователей и их сообщений даже если у них нет сообщений
SELECT
	u.*,
    m.*
FROM
	users u
    LEFT OUTER JOIN
    messages m
ON u.id = m.from_user_id;

   SELECT
	u.*,
    m.*
FROM
	users u
    LEFT OUTER JOIN
    messages m
ON u.id = m.from_user_id
ORDER BY m.id; 

-- ----------------------------------------------------

SELECT
	firstname,
    lastname,
    (SELECT hometown FROM profiles WHERE user_id = users.id) city,
    (SELECT filename FROM media WHERE id = 
		(SELECT photo_id FROM profiles WHERE user_id = users.id)
	) main_photo
FROM
	users
WHERE id =1;
                      --   ИЛИ
SELECT
	u.`firstname`,
    u.`lastname`,
    `hometown` city,
    `filename` main_photo
FROM `users` u
JOIN `profiles` p ON p.`user_id` = u.`id`
JOIN `media` m ON p.`photo_id` = m.`id`
WHERE u.`id` =1;
    
-- --------------------------------------------------------
    
-- выборка новостей пользователя 
SELECT
	mt.`name`,
    m.*,
    u.id
FROM `media` m
JOIN `users` u ON u.`id` = m.`user_id`
JOIN `media_types` mt ON m.`media_types_id` = mt.`id` 
WHERE u.`id` < 10;    
    
-- --------------------------------------------------------
    
-- Сообщения к пользователю 
SELECT
	concat(u.`firstname`, ' ', u.`lastname`) 'Кому',
    (SELECT concat(u.`firstname`, ' ', u.`lastname`) FROM `users` u WHERE u.`id` = m.`from_user_id`) 'От кого',
    m.`body` Сообщение	
FROM `users` u
JOIN `messages` m ON u.`id` = m.`to_user_id`
ORDER BY u.`firstname`;
    
-- --------------------------------------------------------
    
-- У кого сколько пользователей
SELECT
	u.`id`,
    concat(u.`firstname`, ' ', u.`lastname`) 'Имя Фамилия',
    count(*) cnt	
FROM `users` u
JOIN `friend_requests` f ON u.`id` = f.`initiatior_user_id` OR u.`id` = f.`target_user_id`
WHERE f.`status` = 'approved'
GROUP BY u.`id`
ORDER BY cnt DESC;
    
-- --------------------------------------------------------
    
-- Получить новости моих друзей 
SELECT
	m.*
FROM `media` m
JOIN `friend_requests` fr ON m.`user_id` = fr.`initiatior_user_id` 
WHERE fr.`status` = 'approved'
	AND fr.`target_user_id` = 30
UNION
SELECT
	m.*
FROM `media` m
JOIN `friend_requests` fr ON m.`user_id` = fr.`target_user_id`  
WHERE fr.`status` = 'approved'
	AND fr.`initiatior_user_id` = 30;

        -- ИЛИ     
SELECT
	m.*
FROM `media` m
JOIN `friend_requests` fr ON 
	(m.`user_id` = fr.`initiatior_user_id` AND fr.`target_user_id` = 30)
    OR
    (m.`user_id` = fr.`target_user_id` AND fr.`initiatior_user_id` = 30)
WHERE fr.`status` = 'approved'
ORDER BY m.`created_at` DESC;    -- упорядочим по дате 
    
-- --------------------------------------------------------
    
-- список медиафайлов пользователя с количеством лайков
SELECT
m.`id`,
m.`user_id`,
count(*) cnt
FROM `media` m
JOIN `likes` l ON m.`id` = l.`media_id`
WHERE m.`user_id` = 27
GROUP BY l.`media_id`
ORDER BY cnt DESC;

         -- ИЛИ 

SELECT
m.`id`,
m.`user_id`,
m.`filename`,
mt.`name`,
count(*) total_likes,
concat(u.`firstname`, ' ', u.`lastname`) 'owner'
FROM `media` m
JOIN `media_types` mt ON m.`media_types_id` = mt.`id`
JOIN `likes` l ON m.`id` = l.`media_id`
JOIN `users` u ON u.`id` = m.`user_id`
WHERE m.`user_id` = 27
GROUP BY l.`media_id`
ORDER BY total_likes DESC;


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

/* Урок 6. Задача N1
	Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
	который больше всех общался с нашим пользователем.
*/


use vk;

-- --------- подготовка ---------------
# в таблице messages посчитаем количество сообщений между юзером №30 и его собеседником, например №74 
SELECT count(*) FROM messages WHERE (from_user_id = 30 AND to_user_id = 74) OR (from_user_id = 74 AND to_user_id = 30);

# там же составим список(множество) собеседников юзера №30
SELECT from_user_id FROM messages WHERE to_user_id = 30
	UNION
SELECT to_user_id FROM messages WHERE from_user_id = 30; 

# множество моих друзей из таблицы friend_requests
SELECT initiatior_user_id FROM friend_requests WHERE target_user_id = 30 AND status = 'approved'
	UNION
SELECT target_user_id FROM friend_requests WHERE initiatior_user_id = 30 AND status = 'approved';



-- --------- ответ ---------------
# все запросы используем в общем запросе поиска нужного нам id из таблицы users
SET @user = 30;

SELECT 
	id,	                   -- нам нужен список id     
	(
		SELECT count(*)    -- с соответсвующим количеством переписки юзера №30 (вместо 74 поставили текущий users.id)
		FROM messages 
		WHERE (from_user_id = @user AND to_user_id = users.id) OR (from_user_id = users.id AND to_user_id = @user)
	) AS count_messages
FROM users
WHERE id IN                -- с собеседниками из списка его собеседников
	(
		SELECT from_user_id FROM messages WHERE to_user_id = @user
			UNION
		SELECT to_user_id FROM messages WHERE from_user_id = @user
	)
AND id IN                  -- и с проверкой на дружбу из таблицы friend_requests
	(
		SELECT initiatior_user_id FROM friend_requests WHERE target_user_id = @user AND status = 'approved'
			UNION
		SELECT target_user_id FROM friend_requests WHERE initiatior_user_id = @user AND status = 'approved'
    )
ORDER BY count_messages desc    -- сортируем список по убываню количества сообщений
LIMIT 1;                        -- и оставляем только первую строчку с искомым гиперобщительным другом 

# задание выполнено, в моей базе это №74.




/* 
Создаем базу vk

*/


DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,  -- BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE    id 
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(100) UNIQUE,  -- mail унмкальный 
	password_hash VARCHAR(255),
	phone VARCHAR(100),
    INDEX users_phone_idx (phone),  -- искать по номеру телефона (с нашим именем users_phone_idx)
    INDEX (firstname, lastname)   --  составной индекс, искать по имени фамилии (с автоматическим именем)
) COMMENT 'Пользователи';

-- не стоит накладывать индекс на поля, которые часто обновляются. Например логи: мы их чаще записываем, чем читаем

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    photo_id BIGINT UNSIGNED NULL,
    hometown VARCHAR(100),
    created_at DATETIME DEFAULT NOW(),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Профайлы';

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),    
    
    INDEX (from_user_id),
    INDEX (to_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
) COMMENT 'Сообщения';

-- табличка дружбы
DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	initiatior_user_id BIGINT UNSIGNED NOT NULL,     -- кто отправил запрос в друзья 
	target_user_id BIGINT UNSIGNED NOT NULL,     -- кому отправил запрос в друзья 
    `status` ENUM('requested', 'approved', 'unfirended', 'declined'),  -- тип данных перечисление: запрошен, подтвержден, удаление, отклонение
          -- некоторые субд резервируют слова типа ststus, поэтому их лучше в обратные ковычки 
    PRIMARY KEY (initiatior_user_id, target_user_id),   -- первичный ключ составной, эта пара гарантирует нам уникальность, чтобы случайно не могли добавить сразу две записи одновременно одному пользователю
    created_at DATETIME DEFAULT NOW(),   -- инфа, когда был отправлен этот запрос с значением по умолчанию текущей даты
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,   -- проставляется при обновлении
    INDEX (initiatior_user_id),
    INDEX (target_user_id),
    FOREIGN KEY (initiatior_user_id) REFERENCES users(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id)
) COMMENT 'Статус дружбы';

-- группы пользователей
-- у пользователя несколько групп 
-- в каждой группе много пользователей 
-- это отношение сущностей многие ко многим  М х М 

-- табличка с группами 
DROP TABLE IF EXISTS communities;
CREATE TABLE communities (
	id SERIAL PRIMARY KEY,
    `name` VARCHAR(200),   -- наименование группы
    admin_user_id BIGINT UNSIGNED NOT NULL,  -- администратор группы
    
    INDEX communities_name_idx(name),
    INDEX (admin_user_id),
    FOREIGN KEY (admin_user_id) REFERENCES users(id)    
) COMMENT 'Группы';

-- чтобы организовать связь МхМ (пользователей и групп) нужна еще одна таблица (таблица связей)
-- M х М
DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities (
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (user_id, community_id),  -- -- первичный ключ составной
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
) COMMENT 'Табличка связи Пользователей и Групп';

-- надо организовать ленту новостей 
-- новость будет собираться 
-- выделим типы новостей (можно через ENUM), но мы сделаем отдельную таблицу - справочник для типов медиа новостей 

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
    `name` VARCHAR(200)   -- имя типа медиа контента
    -- здесь будет мало записей, поэтому смысл в индексе для поиска пропадает
) COMMENT 'Типы Новостей';

DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
    media_types_id BIGINT UNSIGNED NOT NULL,  -- ссылка на тип медиа 
    user_id BIGINT UNSIGNED NOT NULL,    -- кто запостился? ссылается на поле id таблицы users
    body TEXT,    --  текст поста  
    filename VARCHAR(255),   -- если это файл, то сохраним относительный путь к файлу в файлохранилище; не стоит хранить содержимое файла прямо в табличке 
    -- filename BLOB   можно объявить тип данных BLOB и хранить в нем файл
    `size` INT,    -- будем хранить инфу о размере файла    
    metadata JSON,  -- у файлов есть мета информация (свойства), можно использовать тип данных JSON
    created_at DATETIME DEFAULT NOW(),   -- дата создания со значением по умолчанию текущей даты
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,   -- дата обновления     
    
    INDEX(user_id),
    FOREIGN KEY (media_types_id) REFERENCES media_types(id),  -- завяжем на таблицу типов
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Новости';

-- Лайки

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,    -- кто поставил лайк? ссылается на поле id таблицы users
	media_id BIGINT UNSIGNED NOT NULL,   --  к какому посту поставили лайк 
    created_at DATETIME DEFAULT NOW(),   -- дата лайка со значением по умолчанию текущей даты
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
) COMMENT 'Лайки';

-- добавим фотоальбомы и фотографии, в таблице с фотографиями делаем ссылку на таблицу media там есть все метаданные 
DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums (
	id SERIAL,
    `name` VARCHAR(255) DEFAULT NULL,   -- название альбома
	user_id BIGINT UNSIGNED NOT NULL,    -- чей альбом ссылается на поле id таблицы users

	PRIMARY KEY (id),  -- это как вариант указания ключа
    FOREIGN KEY (user_id) REFERENCES users(id)    
) COMMENT 'Фотоальбомы';

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
    album_id BIGINT UNSIGNED NULL,   --  ссылаемся на альбом  NOT Null не надо
	media_id BIGINT UNSIGNED NOT NULL,   --  сохраним инфу о файле- ссылка на medi, но лучше сделать отдельную таблицу file_info 
	user_id BIGINT UNSIGNED NOT NULL,    -- чья фотография ссылается на поле id таблицы users
    
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (user_id) REFERENCES users(id) 
) COMMENT 'Фотографии';


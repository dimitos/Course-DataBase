/* Задача N 4
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной 
таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/

-- использовал команду
-- mysqldump mysql help_keyword --where="true limit 100" > help_keyword_dump.sql
-- --------------------------------------------------------------------------------------------------------------------------------

-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--
-- WHERE:  true limit 100

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (225,'(JSON'),(226,'->'),(228,'->>'),(46,'<>'),(628,'ACCOUNT'),(422,'ACTION'),
(40,'ADD'),(653,'ADMIN'),(108,'AES_DECRYPT'),(109,'AES_ENCRYPT'),(341,'AFTER'),(95,'AGAINST'),(675,'AGGREGATE'),
(342,'ALGORITHM'),(488,'ALL'),(41,'ALTER'),(343,'ANALYZE'),(47,'AND'),(311,'ANY_VALUE'),(423,'ARCHIVE'),(102,'ARRAY'),
(489,'AS'),(259,'ASC'),(404,'AT'),(513,'AUTOCOMMIT'),(447,'AUTOEXTEND_SIZE'),(344,'AUTO_INCREMENT'),
(345,'AVG_ROW_LENGTH'),(527,'BACKUP'),(541,'BEFORE'),(514,'BEGIN'),(48,'BETWEEN'),(72,'BIGINT'),(104,'BINARY'),
(704,'BINLOG'),(312,'BIN_TO_UUID'),(8,'BOOL'),(9,'BOOLEAN'),(62,'BOTH'),(408,'BTREE'),(260,'BY'),(33,'BYTE'),
(712,'CACHE'),(455,'CALL'),(283,'CAN_ACCESS_COLUMN'),(284,'CAN_ACCESS_DATABASE'),(285,'CAN_ACCESS_TABLE'),
(286,'CAN_ACCESS_VIEW'),(424,'CASCADE'),(53,'CASE'),(608,'CATALOG_NAME'),(75,'CEIL'),(76,'CEILING'),(515,'CHAIN'),
(346,'CHANGE'),(547,'CHANNEL'),(34,'CHAR'),(30,'CHARACTER'),(687,'CHARSET'),(347,'CHECK'),(348,'CHECKSUM'),
(629,'CIPHER'),(609,'CLASS_ORIGIN'),(654,'CLIENT'),(683,'CLONE'),(461,'CLOSE'),(349,'COALESCE'),(707,'CODE'),
(316,'COLLATE'),(689,'COLLATION'),(350,'COLUMN'),(351,'COLUMNS'),(610,'COLUMN_NAME'),(321,'COMMENT'),(516,'COMMIT'),
(530,'COMMITTED'),(425,'COMPACT'),(322,'COMPLETION'),(679,'COMPONENT'),(426,'COMPRESSED'),(352,'COMPRESSION'),
(475,'CONCURRENT'),(605,'CONDITION'),(353,'CONNECTION'),(517,'CONSISTENT'),(354,'CONSTRAINT'),(611,'CONSTRAINT_CATALOG'),
(612,'CONSTRAINT_NAME'),(613,'CONSTRAINT_SCHEMA'),(606,'CONTINUE'),(103,'CONVERT'),(258,'COUNT'),(42,'CREATE'),
(256,'CREATE_DH_PARAMETERS'),(506,'CROSS'),(427,'CSV'),(268,'CUME_DIST'),(630,'CURRENT'),(116,'CURRENT_ROLE'),(323,'CURRENT_USER');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 19:16:04

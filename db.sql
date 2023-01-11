-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: aimeos
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB-1:10.10.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_job`
--

DROP TABLE IF EXISTS `madmin_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_majob_ctime_sid` (`ctime`,`siteid`),
  KEY `idx_majob_status_sid` (`status`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_job`
--

LOCK TABLES `madmin_job` WRITE;
/*!40000 ALTER TABLE `madmin_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_queue`
--

DROP TABLE IF EXISTS `madmin_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `cname` varchar(32) NOT NULL,
  `rtime` datetime NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_maque_queue_rtime_cname` (`queue`,`rtime`,`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_queue`
--

LOCK TABLES `madmin_queue` WRITE;
/*!40000 ALTER TABLE `madmin_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute`
--

DROP TABLE IF EXISTS `mshop_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msatt_dom_type_code_sid` (`domain`,`type`,`code`,`siteid`),
  KEY `idx_msatt_dom_sid_stat_typ_pos` (`domain`,`siteid`,`status`,`type`,`pos`),
  KEY `idx_msatt_status_sid` (`status`,`siteid`),
  KEY `idx_msatt_label_sid` (`label`,`siteid`),
  KEY `idx_msatt_code_sid` (`code`,`siteid`),
  KEY `idx_msatt_type_sid` (`type`,`siteid`),
  KEY `idx_msatt_key_sid` (`key`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute`
--

LOCK TABLES `mshop_attribute` WRITE;
/*!40000 ALTER TABLE `mshop_attribute` DISABLE KEYS */;
INSERT INTO `mshop_attribute` VALUES
(1,'1.','product|color|demo-black','color','product','demo-black','Demo: Black',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','product|print|demo-print-small','print','product','demo-print-small','Demo: Small print',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.','product|text|demo-print-text','text','product','demo-print-text','Demo: Text for print',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.','product|interval|P0Y1M0W0D','interval','product','P0Y1M0W0D','Demo: One month',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.','product|interval|P1Y0M0W0D','interval','product','P1Y0M0W0D','Demo: One year',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','product|print|demo-print-large','print','product','demo-print-large','Demo: Large print',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','product|color|demo-blue','color','product','demo-blue','Demo: Blue',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','product|width|demo-width-32','width','product','demo-width-32','Demo: Width 32',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','product|length|demo-length-34','length','product','demo-length-34','Demo: Length 34',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','product|color|demo-beige','color','product','demo-beige','Demo: Beige',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','product|width|demo-width-33','width','product','demo-width-33','Demo: Width 33',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','product|length|demo-length-36','length','product','demo-length-36','Demo: Length 36',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.','product|sticker|demo-sticker-small','sticker','product','demo-sticker-small','Demo: Small sticker',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.','product|sticker|demo-sticker-large','sticker','product','demo-sticker-large','Demo: Large sticker',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.','product|price|custom','price','product','custom','Custom price',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.','product|date|demo-custom-date','date','product','demo-custom-date','Demo: Custom date',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_list`
--

DROP TABLE IF EXISTS `mshop_attribute_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_msattli_key_sid` (`key`,`siteid`),
  KEY `fk_msattli_pid` (`parentid`),
  CONSTRAINT `fk_msattli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_list`
--

LOCK TABLES `mshop_attribute_list` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_list` DISABLE KEYS */;
INSERT INTO `mshop_attribute_list` VALUES
(1,'1.',1,'media|default|7','default','media','7',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.',1,'text|default|32','default','text','32',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.',1,'text|default|33','default','text','33',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.',1,'text|default|34','default','text','34',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.',1,'text|default|35','default','text','35',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.',2,'price|default|1','default','price','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.',2,'price|default|2','default','price','2',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.',2,'text|default|36','default','text','36',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.',2,'text|default|37','default','text','37',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.',2,'text|default|38','default','text','38',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.',2,'text|default|39','default','text','39',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.',3,'text|default|40','default','text','40',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.',3,'text|default|41','default','text','41',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.',4,'text|default|42','default','text','42',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.',4,'text|default|43','default','text','43',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.',5,'text|default|44','default','text','44',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.',5,'text|default|45','default','text','45',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(18,'1.',6,'price|default|3','default','price','3',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.',6,'price|default|4','default','price','4',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.',6,'text|default|46','default','text','46',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.',6,'text|default|47','default','text','47',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.',6,'text|default|48','default','text','48',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.',6,'text|default|49','default','text','49',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.',7,'media|default|10','default','media','10',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.',7,'text|default|57','default','text','57',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.',7,'text|default|58','default','text','58',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(27,'1.',7,'text|default|59','default','text','59',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(28,'1.',7,'text|default|60','default','text','60',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(29,'1.',8,'text|default|61','default','text','61',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(30,'1.',8,'text|default|62','default','text','62',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(31,'1.',8,'text|default|63','default','text','63',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(32,'1.',9,'text|default|64','default','text','64',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(33,'1.',9,'text|default|65','default','text','65',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(34,'1.',9,'text|default|66','default','text','66',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(35,'1.',10,'media|default|11','default','media','11',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(36,'1.',10,'text|default|67','default','text','67',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(37,'1.',10,'text|default|68','default','text','68',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(38,'1.',10,'text|default|69','default','text','69',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(39,'1.',10,'text|default|70','default','text','70',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(40,'1.',11,'text|default|71','default','text','71',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(41,'1.',11,'text|default|72','default','text','72',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(42,'1.',11,'text|default|73','default','text','73',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(43,'1.',12,'text|default|74','default','text','74',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(44,'1.',12,'text|default|75','default','text','75',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(45,'1.',12,'text|default|76','default','text','76',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(46,'1.',13,'price|default|15','default','price','15',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(47,'1.',13,'price|default|16','default','price','16',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(48,'1.',13,'text|default|85','default','text','85',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(49,'1.',13,'text|default|86','default','text','86',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(50,'1.',13,'text|default|87','default','text','87',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(51,'1.',13,'text|default|88','default','text','88',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(52,'1.',14,'price|default|17','default','price','17',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(53,'1.',14,'price|default|18','default','price','18',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(54,'1.',14,'text|default|89','default','text','89',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(55,'1.',14,'text|default|90','default','text','90',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(56,'1.',14,'text|default|91','default','text','91',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(57,'1.',14,'text|default|92','default','text','92',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(58,'1.',15,'text|default|101','default','text','101',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(59,'1.',15,'text|default|102','default','text','102',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(60,'1.',16,'text|default|103','default','text','103',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(61,'1.',16,'text|default|104','default','text','104',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_attribute_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_list_type`
--

DROP TABLE IF EXISTS `mshop_attribute_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattlity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msattlity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msattlity_label_sid` (`label`,`siteid`),
  KEY `idx_msattlity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_list_type`
--

LOCK TABLES `mshop_attribute_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_list_type` DISABLE KEYS */;
INSERT INTO `mshop_attribute_list_type` VALUES
(1,'1.','media','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','price','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','text','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','upload','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_attribute_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_property`
--

DROP TABLE IF EXISTS `mshop_attribute_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattpr_ty_lid_value_sid` (`parentid`,`type`,`langid`,`value`,`siteid`),
  KEY `idx_msattpr_key_sid` (`key`,`siteid`),
  KEY `fk_msattpr_pid` (`parentid`),
  CONSTRAINT `fk_msattpr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_property`
--

LOCK TABLES `mshop_attribute_property` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_property_type`
--

DROP TABLE IF EXISTS `mshop_attribute_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattprty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msattprty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msattprty_label_sid` (`label`,`siteid`),
  KEY `idx_msattprty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_property_type`
--

LOCK TABLES `mshop_attribute_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_type`
--

DROP TABLE IF EXISTS `mshop_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msattty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msattty_label_sid` (`label`,`siteid`),
  KEY `idx_msattty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_type`
--

LOCK TABLES `mshop_attribute_type` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_type` DISABLE KEYS */;
INSERT INTO `mshop_attribute_type` VALUES
(1,'1.','product','color','Color',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','product','size','Size',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','product','width','Width',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','product','length','Length',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','product','print','Print',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.','product','sticker','Sticker',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(7,'1.','product','download','Download',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(8,'1.','product','price','Price',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(9,'1.','product','text','Text',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(10,'1.','product','date','Date',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(11,'1.','product','interval','Interval',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(12,'1.','product','customer/group','Customer group ID',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_catalog`
--

DROP TABLE IF EXISTS `mshop_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `level` smallint(6) NOT NULL DEFAULT 0,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `config` text NOT NULL DEFAULT '{}',
  `nleft` int(11) NOT NULL,
  `nright` int(11) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscat_code_sid` (`code`,`siteid`),
  KEY `idx_mscat_nlt_nrt_lvl_pid_sid` (`nleft`,`nright`,`level`,`parentid`,`siteid`),
  KEY `idx_mscat_status_sid` (`status`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_catalog`
--

LOCK TABLES `mshop_catalog` WRITE;
/*!40000 ALTER TABLE `mshop_catalog` DISABLE KEYS */;
INSERT INTO `mshop_catalog` VALUES
(1,'1.',0,0,'home','Home','home','{\"css-class\":\"megamenu\"}',1,28,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.',1,1,'demo-best','Best sellers','best-sellers','[]',2,23,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.',2,2,'demo-best-women','Women','women','[]',3,10,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.',3,3,'demo-best-women-shirt','Shirts','shirts','[]',4,5,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.',3,3,'demo-best-women-dress','Dresses','dresses','[]',6,7,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.',3,3,'demo-best-women-top','Tops','tops','[]',8,9,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(7,'1.',2,2,'demo-best-men','Men','men','[]',11,16,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(8,'1.',7,3,'demo-best-men-tshirt','T-Shirts','t-shirts','[]',12,13,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(9,'1.',7,3,'demo-best-men-muscle','Muscle shirts','muscle-shirts','[]',14,15,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(10,'1.',2,2,'demo-best-misc','Misc','misc','[]',17,22,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(11,'1.',10,3,'demo-best-misc-event','Events','events','[]',18,19,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(12,'1.',10,3,'demo-best-misc-voucher','Vouchers','vouchers','[]',20,21,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(13,'1.',1,1,'demo-new','New arrivals','new-arrivals','[]',24,25,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(14,'1.',1,1,'demo-deals','Hot deals','hot-deals','[]',26,27,'',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_catalog_list`
--

DROP TABLE IF EXISTS `mshop_catalog_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_catalog_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_mscatli_key_sid` (`key`,`siteid`),
  KEY `fk_mscatli_pid` (`parentid`),
  CONSTRAINT `fk_mscatli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_catalog_list`
--

LOCK TABLES `mshop_catalog_list` WRITE;
/*!40000 ALTER TABLE `mshop_catalog_list` DISABLE KEYS */;
INSERT INTO `mshop_catalog_list` VALUES
(1,'1.',1,'text|default|1','default','text','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.',1,'text|default|2','default','text','2',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.',1,'text|default|3','default','text','3',NULL,NULL,'[]',1,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.',1,'text|default|4','default','text','4',NULL,NULL,'[]',2,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.',1,'text|default|5','default','text','5',NULL,NULL,'[]',3,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.',1,'text|default|6','default','text','6',NULL,NULL,'[]',4,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(7,'1.',1,'text|default|7','default','text','7',NULL,NULL,'[]',5,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(8,'1.',2,'media|default|1','default','media','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(9,'1.',2,'media|default|2','default','media','2',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(10,'1.',2,'text|default|8','default','text','8',NULL,NULL,'[]',1,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(11,'1.',2,'text|default|9','default','text','9',NULL,NULL,'[]',2,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(12,'1.',2,'text|default|10','default','text','10',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(13,'1.',13,'media|default|3','default','media','3',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(14,'1.',13,'text|default|11','default','text','11',NULL,NULL,'[]',1,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(15,'1.',13,'text|default|12','default','text','12',NULL,NULL,'[]',2,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(16,'1.',13,'text|default|13','default','text','13',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(17,'1.',14,'media|default|4','default','media','4',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(18,'1.',14,'text|default|14','default','text','14',NULL,NULL,'[]',1,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(19,'1.',14,'text|default|15','default','text','15',NULL,NULL,'[]',2,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(20,'1.',14,'text|default|16','default','text','16',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_catalog_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_catalog_list_type`
--

DROP TABLE IF EXISTS `mshop_catalog_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_catalog_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatlity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mscatlity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mscatlity_label_sid` (`label`,`siteid`),
  KEY `idx_mscatlity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_catalog_list_type`
--

LOCK TABLES `mshop_catalog_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_catalog_list_type` DISABLE KEYS */;
INSERT INTO `mshop_catalog_list_type` VALUES
(1,'1.','media','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','text','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_catalog_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_cms`
--

DROP TABLE IF EXISTS `mshop_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscms_url_sid` (`url`,`siteid`),
  KEY `unq_mscms_label_sid` (`label`,`siteid`),
  KEY `unq_mscms_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_cms`
--

LOCK TABLES `mshop_cms` WRITE;
/*!40000 ALTER TABLE `mshop_cms` DISABLE KEYS */;
INSERT INTO `mshop_cms` VALUES
(1,'1.','/','Demo homepage',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_cms_list`
--

DROP TABLE IF EXISTS `mshop_cms_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_cms_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscmsli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_mscmsli_key_sid` (`key`,`siteid`),
  KEY `fk_mscmsli_pid` (`parentid`),
  CONSTRAINT `fk_mscmsli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_cms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_cms_list`
--

LOCK TABLES `mshop_cms_list` WRITE;
/*!40000 ALTER TABLE `mshop_cms_list` DISABLE KEYS */;
INSERT INTO `mshop_cms_list` VALUES
(1,1,'1.','text|default|17','default','text','17',NULL,NULL,'[]',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_cms_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_cms_list_type`
--

DROP TABLE IF EXISTS `mshop_cms_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_cms_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscmslity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mscmslity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mscmslity_label_sid` (`label`,`siteid`),
  KEY `idx_mscmslity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_cms_list_type`
--

LOCK TABLES `mshop_cms_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_cms_list_type` DISABLE KEYS */;
INSERT INTO `mshop_cms_list_type` VALUES
(1,'1.','text','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs'),
(2,'1.','media','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs');
/*!40000 ALTER TABLE `mshop_cms_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_coupon`
--

DROP TABLE IF EXISTS `mshop_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(255) NOT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mscou_stat_start_end_sid` (`status`,`start`,`end`,`siteid`),
  KEY `idx_mscou_provider_sid` (`provider`,`siteid`),
  KEY `idx_mscou_label_sid` (`label`,`siteid`),
  KEY `idx_mscou_start_sid` (`start`,`siteid`),
  KEY `idx_mscou_end_sid` (`end`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_coupon`
--

LOCK TABLES `mshop_coupon` WRITE;
/*!40000 ALTER TABLE `mshop_coupon` DISABLE KEYS */;
INSERT INTO `mshop_coupon` VALUES
(1,'1.','demo-voucher','Voucher','{\"voucher.productcode\":\"demo-rebate\"}',NULL,NULL,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','demo-fixed','FixedRebate,Basket','{\"fixedrebate.productcode\":\"demo-rebate\",\"fixedrebate.rebate\":{\"EUR\":125,\"USD\":150},\"basket.total-value-min\":{\"EUR\":125,\"USD\":150}}',NULL,NULL,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','demo-percent','PercentRebate','{\"percentrebate.productcode\":\"demo-rebate\",\"percentrebate.rebate\":\"10\"}',NULL,NULL,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_coupon_code`
--

DROP TABLE IF EXISTS `mshop_coupon_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_coupon_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `count` int(11) DEFAULT 0,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `ref` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscouco_code_sid` (`code`,`siteid`),
  KEY `idx_mscouco_ct_start_end_sid` (`count`,`start`,`end`,`siteid`),
  KEY `idx_mscouco_start_sid` (`start`,`siteid`),
  KEY `idx_mscouco_end_sid` (`end`,`siteid`),
  KEY `fk_mscouco_pid` (`parentid`),
  CONSTRAINT `fk_mscouco_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_coupon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_coupon_code`
--

LOCK TABLES `mshop_coupon_code` WRITE;
/*!40000 ALTER TABLE `mshop_coupon_code` DISABLE KEYS */;
INSERT INTO `mshop_coupon_code` VALUES
(1,'1.',2,'fixed',1000,NULL,NULL,'','2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.',3,'percent',1000,NULL,NULL,'','2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_coupon_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer`
--

DROP TABLE IF EXISTS `mshop_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `salutation` varchar(8) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vatid` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `firstname` varchar(64) NOT NULL DEFAULT '',
  `lastname` varchar(64) NOT NULL DEFAULT '',
  `address1` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) NOT NULL DEFAULT '',
  `address3` varchar(200) NOT NULL DEFAULT '',
  `postal` varchar(16) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `state` varchar(200) NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `countryid` varchar(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `telefax` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `longitude` double DEFAULT 0,
  `latitude` double DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `vdate` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscus_code_sid` (`code`,`siteid`),
  KEY `idx_mscus_langid_sid` (`langid`,`siteid`),
  KEY `idx_mscus_last_first` (`lastname`,`firstname`),
  KEY `idx_mscus_post_addr1` (`postal`,`address1`),
  KEY `idx_mscus_post_city` (`postal`,`city`),
  KEY `idx_mscus_city` (`city`),
  KEY `idx_mscus_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer`
--

LOCK TABLES `mshop_customer` WRITE;
/*!40000 ALTER TABLE `mshop_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_address`
--

DROP TABLE IF EXISTS `mshop_customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `company` varchar(100) NOT NULL DEFAULT '',
  `vatid` varchar(32) NOT NULL DEFAULT '',
  `salutation` varchar(8) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `firstname` varchar(64) NOT NULL DEFAULT '',
  `lastname` varchar(64) NOT NULL DEFAULT '',
  `address1` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) NOT NULL DEFAULT '',
  `address3` varchar(200) NOT NULL DEFAULT '',
  `postal` varchar(16) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `state` varchar(200) NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `countryid` varchar(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `telefax` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `longitude` double DEFAULT 0,
  `latitude` double DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `pos` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mscusad_langid_sid` (`langid`,`siteid`),
  KEY `idx_mscusad_last_first` (`lastname`,`firstname`),
  KEY `idx_mscusad_post_addr1` (`postal`,`address1`),
  KEY `idx_mscusad_post_city` (`postal`,`city`),
  KEY `idx_mscusad_city` (`city`),
  KEY `idx_mscusad_email` (`email`),
  KEY `fk_mscusad_pid` (`parentid`),
  CONSTRAINT `fk_mscusad_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_address`
--

LOCK TABLES `mshop_customer_address` WRITE;
/*!40000 ALTER TABLE `mshop_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_group`
--

DROP TABLE IF EXISTS `mshop_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusgr_code_sid` (`code`,`siteid`),
  KEY `idx_mscusgr_label_sid` (`label`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_group`
--

LOCK TABLES `mshop_customer_group` WRITE;
/*!40000 ALTER TABLE `mshop_customer_group` DISABLE KEYS */;
INSERT INTO `mshop_customer_group` VALUES
(1,'1.','admin','Administrator','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','editor','Editor','2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_list`
--

DROP TABLE IF EXISTS `mshop_customer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_mscusli_key_sid` (`key`,`siteid`),
  KEY `fk_mscusli_pid` (`parentid`),
  CONSTRAINT `fk_mscusli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_list`
--

LOCK TABLES `mshop_customer_list` WRITE;
/*!40000 ALTER TABLE `mshop_customer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_list_type`
--

DROP TABLE IF EXISTS `mshop_customer_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscuslity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mscuslity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mscuslity_label_sid` (`label`,`siteid`),
  KEY `idx_mscuslity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_list_type`
--

LOCK TABLES `mshop_customer_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_customer_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_property`
--

DROP TABLE IF EXISTS `mshop_customer_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscuspr_pid_ty_lid_val_sid` (`parentid`,`type`,`langid`,`value`,`siteid`),
  KEY `idx_mscuspr_key_sid` (`key`,`siteid`),
  KEY `fk_mcuspr_pid` (`parentid`),
  CONSTRAINT `fk_mcuspr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_property`
--

LOCK TABLES `mshop_customer_property` WRITE;
/*!40000 ALTER TABLE `mshop_customer_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_property_type`
--

DROP TABLE IF EXISTS `mshop_customer_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusprty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mscusprty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mscusprty_label_sid` (`label`,`siteid`),
  KEY `idx_mscusprty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_property_type`
--

LOCK TABLES `mshop_customer_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_customer_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_attribute`
--

DROP TABLE IF EXISTS `mshop_index_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_attribute` (
  `prodid` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `artid` int(11) DEFAULT NULL,
  `attrid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `listtype` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindat_p_s_aid_lt` (`prodid`,`siteid`,`attrid`,`listtype`),
  KEY `idx_msindat_p_s_lt_t_c` (`prodid`,`siteid`,`listtype`,`type`,`code`),
  KEY `idx_msindat_s_at_lt` (`siteid`,`attrid`,`listtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_attribute`
--

LOCK TABLES `mshop_index_attribute` WRITE;
/*!40000 ALTER TABLE `mshop_index_attribute` DISABLE KEYS */;
INSERT INTO `mshop_index_attribute` VALUES
(1,'1.',1,'1','default','color','demo-black','2023-01-11 03:00:27'),
(1,'1.',1,'2','config','print','demo-print-small','2023-01-11 03:00:27'),
(1,'1.',1,'3','custom','text','demo-print-text','2023-01-11 03:00:27'),
(1,'1.',1,'4','config','interval','P0Y1M0W0D','2023-01-11 03:00:27'),
(1,'1.',1,'5','config','interval','P1Y0M0W0D','2023-01-11 03:00:27'),
(1,'1.',1,'6','config','print','demo-print-large','2023-01-11 03:00:27'),
(2,'1.',2,'7','variant','color','demo-blue','2023-01-11 03:00:27'),
(2,'1.',2,'8','variant','width','demo-width-32','2023-01-11 03:00:27'),
(2,'1.',2,'9','variant','length','demo-length-34','2023-01-11 03:00:27'),
(3,'1.',3,'10','variant','color','demo-beige','2023-01-11 03:00:27'),
(3,'1.',3,'11','variant','width','demo-width-33','2023-01-11 03:00:27'),
(3,'1.',3,'12','variant','length','demo-length-36','2023-01-11 03:00:27'),
(4,'1.',4,'10','variant','color','demo-beige','2023-01-11 03:00:27'),
(4,'1.',4,'8','variant','width','demo-width-32','2023-01-11 03:00:27'),
(4,'1.',4,'9','variant','length','demo-length-34','2023-01-11 03:00:27'),
(5,'1.',5,'10','variant','color','demo-beige','2023-01-11 03:00:27'),
(5,'1.',5,'11','variant','width','demo-width-33','2023-01-11 03:00:27'),
(5,'1.',5,'9','variant','length','demo-length-34','2023-01-11 03:00:27'),
(6,'1.',3,'10','variant','color','demo-beige','2023-01-11 03:00:27'),
(6,'1.',3,'11','variant','width','demo-width-33','2023-01-11 03:00:27'),
(6,'1.',3,'12','variant','length','demo-length-36','2023-01-11 03:00:27'),
(6,'1.',2,'7','variant','color','demo-blue','2023-01-11 03:00:27'),
(6,'1.',2,'8','variant','width','demo-width-32','2023-01-11 03:00:27'),
(6,'1.',2,'9','variant','length','demo-length-34','2023-01-11 03:00:27'),
(7,'1.',1,'1','default','color','demo-black','2023-01-11 03:00:27'),
(7,'1.',7,'13','config','sticker','demo-sticker-small','2023-01-11 03:00:27'),
(7,'1.',7,'14','config','sticker','demo-sticker-large','2023-01-11 03:00:27'),
(7,'1.',1,'2','config','print','demo-print-small','2023-01-11 03:00:27'),
(7,'1.',1,'3','custom','text','demo-print-text','2023-01-11 03:00:27'),
(7,'1.',1,'4','config','interval','P0Y1M0W0D','2023-01-11 03:00:27'),
(7,'1.',1,'5','config','interval','P1Y0M0W0D','2023-01-11 03:00:27'),
(7,'1.',1,'6','config','print','demo-print-large','2023-01-11 03:00:27'),
(8,'1.',8,'15','custom','price','custom','2023-01-11 03:00:27'),
(8,'1.',8,'16','custom','date','demo-custom-date','2023-01-11 03:00:27'),
(10,'1.',1,'1','default','color','demo-black','2023-01-11 03:00:27'),
(10,'1.',7,'13','config','sticker','demo-sticker-small','2023-01-11 03:00:27'),
(10,'1.',7,'14','config','sticker','demo-sticker-large','2023-01-11 03:00:27'),
(10,'1.',1,'2','config','print','demo-print-small','2023-01-11 03:00:27'),
(10,'1.',1,'3','custom','text','demo-print-text','2023-01-11 03:00:27'),
(10,'1.',1,'4','config','interval','P0Y1M0W0D','2023-01-11 03:00:27'),
(10,'1.',1,'5','config','interval','P1Y0M0W0D','2023-01-11 03:00:27'),
(10,'1.',1,'6','config','print','demo-print-large','2023-01-11 03:00:27');
/*!40000 ALTER TABLE `mshop_index_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_catalog`
--

DROP TABLE IF EXISTS `mshop_index_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_catalog` (
  `prodid` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `catid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `listtype` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindca_p_s_cid_lt_po` (`prodid`,`siteid`,`catid`,`listtype`,`pos`),
  KEY `idx_msindca_s_ca_lt_po` (`siteid`,`catid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_catalog`
--

LOCK TABLES `mshop_index_catalog` WRITE;
/*!40000 ALTER TABLE `mshop_index_catalog` DISABLE KEYS */;
INSERT INTO `mshop_index_catalog` VALUES
(1,'1.','1','promotion',0,'2023-01-11 03:00:27'),
(1,'1.','13','default',5,'2023-01-11 03:00:27'),
(1,'1.','14','default',0,'2023-01-11 03:00:27'),
(1,'1.','2','default',1,'2023-01-11 03:00:27'),
(6,'1.','1','default',1,'2023-01-11 03:00:27'),
(6,'1.','13','default',6,'2023-01-11 03:00:27'),
(6,'1.','2','default',2,'2023-01-11 03:00:27'),
(7,'1.','1','default',2,'2023-01-11 03:00:27'),
(7,'1.','13','default',7,'2023-01-11 03:00:27'),
(7,'1.','2','default',3,'2023-01-11 03:00:27'),
(8,'1.','1','default',3,'2023-01-11 03:00:27'),
(8,'1.','2','default',0,'2023-01-11 03:00:27'),
(9,'1.','13','default',3,'2023-01-11 03:00:27'),
(9,'1.','14','default',7,'2023-01-11 03:00:27'),
(9,'1.','2','default',4,'2023-01-11 03:00:27'),
(10,'1.','13','default',7,'2023-01-11 03:00:27'),
(10,'1.','14','default',5,'2023-01-11 03:00:27'),
(10,'1.','2','default',5,'2023-01-11 03:00:27'),
(12,'1.','1','promotion',1,'2023-01-11 03:00:27'),
(12,'1.','13','default',4,'2023-01-11 03:00:27'),
(12,'1.','14','default',2,'2023-01-11 03:00:27'),
(12,'1.','2','default',6,'2023-01-11 03:00:27'),
(13,'1.','13','default',2,'2023-01-11 03:00:27'),
(13,'1.','14','default',5,'2023-01-11 03:00:27'),
(13,'1.','2','default',7,'2023-01-11 03:00:27'),
(14,'1.','1','default',4,'2023-01-11 03:00:27'),
(15,'1.','1','default',5,'2023-01-11 03:00:27'),
(15,'1.','13','default',1,'2023-01-11 03:00:27'),
(15,'1.','14','default',4,'2023-01-11 03:00:27'),
(15,'1.','2','default',8,'2023-01-11 03:00:27'),
(16,'1.','1','default',6,'2023-01-11 03:00:27'),
(16,'1.','13','default',0,'2023-01-11 03:00:27'),
(16,'1.','14','default',7,'2023-01-11 03:00:27'),
(17,'1.','1','default',7,'2023-01-11 03:00:27'),
(17,'1.','14','default',3,'2023-01-11 03:00:27'),
(17,'1.','2','default',9,'2023-01-11 03:00:27');
/*!40000 ALTER TABLE `mshop_index_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_price`
--

DROP TABLE IF EXISTS `mshop_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_price` (
  `prodid` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `currencyid` varchar(3) NOT NULL,
  `value` decimal(12,2) DEFAULT 0.00,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindpr_pid_sid_cid` (`prodid`,`siteid`,`currencyid`),
  KEY `idx_msindpr_sid_cid_val` (`siteid`,`currencyid`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_price`
--

LOCK TABLES `mshop_index_price` WRITE;
/*!40000 ALTER TABLE `mshop_index_price` DISABLE KEYS */;
INSERT INTO `mshop_index_price` VALUES
(1,'1.','EUR',100.00,'2023-01-11 03:00:27'),
(1,'1.','USD',130.00,'2023-01-11 03:00:27'),
(2,'1.','EUR',140.00,'2023-01-11 03:00:27'),
(2,'1.','USD',190.00,'2023-01-11 03:00:27'),
(6,'1.','EUR',150.00,'2023-01-11 03:00:27'),
(6,'1.','USD',200.00,'2023-01-11 03:00:27'),
(7,'1.','EUR',250.00,'2023-01-11 03:00:27'),
(7,'1.','USD',250.00,'2023-01-11 03:00:27'),
(8,'1.','EUR',25.00,'2023-01-11 03:00:27'),
(8,'1.','USD',25.00,'2023-01-11 03:00:27'),
(9,'1.','EUR',49.00,'2023-01-11 03:00:27'),
(9,'1.','USD',59.00,'2023-01-11 03:00:27'),
(10,'1.','EUR',49.00,'2023-01-11 03:00:27'),
(10,'1.','USD',59.00,'2023-01-11 03:00:27'),
(12,'1.','EUR',49.00,'2023-01-11 03:00:27'),
(12,'1.','USD',59.00,'2023-01-11 03:00:27'),
(13,'1.','EUR',69.00,'2023-01-11 03:00:27'),
(13,'1.','USD',79.00,'2023-01-11 03:00:27'),
(14,'1.','EUR',29.00,'2023-01-11 03:00:27'),
(14,'1.','USD',36.00,'2023-01-11 03:00:27'),
(15,'1.','EUR',79.00,'2023-01-11 03:00:27'),
(15,'1.','USD',99.00,'2023-01-11 03:00:27'),
(16,'1.','EUR',19.00,'2023-01-11 03:00:27'),
(16,'1.','USD',22.00,'2023-01-11 03:00:27'),
(17,'1.','EUR',49.00,'2023-01-11 03:00:27'),
(17,'1.','USD',59.00,'2023-01-11 03:00:27');
/*!40000 ALTER TABLE `mshop_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_supplier`
--

DROP TABLE IF EXISTS `mshop_index_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_supplier` (
  `prodid` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `supid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `listtype` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `latitude` double DEFAULT 0,
  `longitude` double DEFAULT 0,
  `pos` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindsu_p_s_lt_si_po_la_lo` (`prodid`,`supid`,`listtype`,`siteid`,`pos`,`latitude`,`longitude`),
  KEY `idx_msindsup_p_lat_lon_sid` (`prodid`,`latitude`,`longitude`,`siteid`),
  KEY `idx_msindsup_sid_supid_lt_po` (`siteid`,`supid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_supplier`
--

LOCK TABLES `mshop_index_supplier` WRITE;
/*!40000 ALTER TABLE `mshop_index_supplier` DISABLE KEYS */;
INSERT INTO `mshop_index_supplier` VALUES
(1,'1.','1','default',NULL,NULL,0,'2023-01-11 03:00:27'),
(2,'1.','1','default',NULL,NULL,0,'2023-01-11 03:00:27'),
(2,'1.','2','default',NULL,NULL,1,'2023-01-11 03:00:27'),
(7,'1.','2','default',NULL,NULL,0,'2023-01-11 03:00:27');
/*!40000 ALTER TABLE `mshop_index_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_text`
--

DROP TABLE IF EXISTS `mshop_index_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prodid` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msindte_pid_sid_lid_url` (`prodid`,`siteid`,`langid`,`url`),
  KEY `idx_msindte_pid_sid_lid_name` (`prodid`,`siteid`,`langid`,`name`),
  FULLTEXT KEY `idx_msindte_content` (`content`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_text`
--

LOCK TABLES `mshop_index_text` WRITE;
/*!40000 ALTER TABLE `mshop_index_text` DISABLE KEYS */;
INSERT INTO `mshop_index_text` VALUES
(1,1,'1.','de','demo-article','Demoartikel',' demo-article hot deals start best sellers new arrivals demo-händler schwarz demoartikel dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(2,1,'1.','en','demo-article','Demo article',' demo-article hot deals start best sellers new arrivals demo-händler schwarz demo article this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(3,2,'1.','en','demo-variant-article-1','Demo variant article 1',' demo-selection-article-1 demo-händler demo-händler 2 blau 32 34 demo variant article 1','2023-01-11 03:00:27'),
(4,2,'1.','de','demo-variant-article-1','Demo variant article 1',' demo-selection-article-1 demo-händler demo-händler 2 blau 32 34 demo variant article 1','2023-01-11 03:00:27'),
(5,3,'1.','en','demo-variant-article-2','Demo variant article 2',' demo-selection-article-2 beige 33 36 demo variant article 2','2023-01-11 03:00:27'),
(6,3,'1.','de','demo-variant-article-2','Demo variant article 2',' demo-selection-article-2 beige 33 36 demo variant article 2','2023-01-11 03:00:27'),
(7,4,'1.','en','demo-variant-article-3','Demo variant article 3',' demo-selection-article-3 beige 32 34 demo variant article 3','2023-01-11 03:00:27'),
(8,4,'1.','de','demo-variant-article-3','Demo variant article 3',' demo-selection-article-3 beige 32 34 demo variant article 3','2023-01-11 03:00:27'),
(9,5,'1.','en','demo-variant-article-4','Demo variant article 4',' demo-selection-article-4 beige 33 34 demo variant article 4','2023-01-11 03:00:27'),
(10,5,'1.','de','demo-variant-article-4','Demo variant article 4',' demo-selection-article-4 beige 33 34 demo variant article 4','2023-01-11 03:00:27'),
(11,6,'1.','de','demoartikel-mit-auswahl','Demoartikel mit Auswahl',' demo-selection-article-1 demo-händler demo-händler 2 blau 32 34 demo-selection-article-2 beige 33 36 demo-selection-article start best sellers new arrivals demoartikel mit auswahl demoartikel-mit-auswahl dies ist die kurzbeschreibung des demoartikels mit auswahl hier folgt eine ausführliche beschreibung des artikels mit auswahl, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(12,6,'1.','en','demo-selection-article','Demo selection article',' demo-selection-article-1 demo-händler demo-händler 2 blau 32 34 demo-selection-article-2 beige 33 36 demo-selection-article start best sellers new arrivals demo selection article this is the short description of the selection demo article. add a detailed description of the selection demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(13,7,'1.','de','demoartikel-mit-bundle','Demoartikel mit Bundle',' demo-selection-article start best sellers new arrivals demoartikel mit auswahl demoartikel-mit-auswahl dies ist die kurzbeschreibung des demoartikels mit auswahl hier folgt eine ausführliche beschreibung des artikels mit auswahl, die gerne etwas länger sein darf. demo-article hot deals start best sellers new arrivals demo-händler schwarz demoartikel dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. demo-bundle-article start best sellers new arrivals demo-händler 2 demoartikel mit bundle demoartikel-mit-bundle dies ist die kurzbeschreibung des demoartikels mit bundle hier folgt eine ausführliche beschreibung des artikels mit bundle, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(14,7,'1.','en','demo-bundle-article','Demo bundle article',' demo-selection-article start best sellers new arrivals demo selection article this is the short description of the selection demo article. add a detailed description of the selection demo article that may be a little bit longer. demo-article hot deals start best sellers new arrivals demo-händler schwarz demo article this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. demo-bundle-article start best sellers new arrivals demo-händler 2 demo bundle article this is the short description of the bundle demo article. add a detailed description of the bundle demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(15,8,'1.','de','demo-voucher','Demo-Gutschein',' demo-voucher best sellers start demo-gutschein dies ist die kurzbeschreibung des demo-gutscheins hier folgt eine ausführliche beschreibung des gutscheins, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(16,8,'1.','en','demo-voucher','Demo voucher',' demo-voucher best sellers start demo voucher this is the short description of the demo voucher. add a detailed description of the demo voucher that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(17,9,'1.','de','demoevent-article','Demoevent article',' demo-event-article new arrivals best sellers hot deals demoevent article demoevent article dies ist die kurzbeschreibung des demoevents hier folgt eine ausführliche beschreibung des demoevents, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(18,9,'1.','en','demo-event-article','Demo event article',' demo-event-article new arrivals best sellers hot deals demo event article this is the short description of the event demo article. add a detailed description of the event demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(19,10,'1.','de','demo-gruppenartikel','Demo-Gruppenartikel',' demo-article hot deals start best sellers new arrivals demo-händler schwarz demoartikel dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. demo-bundle-article start best sellers new arrivals demo-händler 2 demoartikel mit bundle demoartikel-mit-bundle dies ist die kurzbeschreibung des demoartikels mit bundle hier folgt eine ausführliche beschreibung des artikels mit bundle, die gerne etwas länger sein darf. demo-event-article new arrivals best sellers hot deals demoevent article demoevent article dies ist die kurzbeschreibung des demoevents hier folgt eine ausführliche beschreibung des demoevents, die gerne etwas länger sein darf. demo-group-article best sellers hot deals new arrivals demo-gruppenartikel demo-gruppenartikel dies ist die kurzbeschreibung des demo-gruppenartikels hier folgt eine ausführliche beschreibung des gruppenartikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(20,10,'1.','en','demo-group-article','Demo group article',' demo-article hot deals start best sellers new arrivals demo-händler schwarz demo article this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. demo-bundle-article start best sellers new arrivals demo-händler 2 demo bundle article this is the short description of the bundle demo article. add a detailed description of the bundle demo article that may be a little bit longer. demo-event-article new arrivals best sellers hot deals demo event article this is the short description of the event demo article. add a detailed description of the event demo article that may be a little bit longer. demo-group-article best sellers hot deals new arrivals demo group article this is the short description of the group demo article. add a detailed description of the group demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(21,11,'1.','de','demo-rebate','Demorabatt',' demo-rebate demorabatt','2023-01-11 03:00:27'),
(22,11,'1.','en','demo-rebate','Demo rebate',' demo-rebate demo rebate','2023-01-11 03:00:27'),
(23,12,'1.','de','demo-article-2','Demoartikel 2',' demo-article-2 start hot deals new arrivals best sellers demoartikel 2 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(24,12,'1.','en','demo-article-2','Demo article 2',' demo-article-2 start hot deals new arrivals best sellers demo article 2 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(25,13,'1.','de','demo-article-3','Demoartikel 3',' demo-article-3 new arrivals hot deals best sellers demoartikel 3 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(26,13,'1.','en','demo-article-3','Demo article 3',' demo-article-3 new arrivals hot deals best sellers demo article 3 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(27,14,'1.','de','demo-article-4','Demoartikel 4',' demo-article-4 start demoartikel 4 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(28,14,'1.','en','demo-article-4','Demo article 4',' demo-article-4 start demo article 4 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(29,15,'1.','de','demo-article-5','Demoartikel 5',' demo-article-5 new arrivals hot deals start best sellers demoartikel 5 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(30,15,'1.','en','demo-article-5','Demo article 5',' demo-article-5 new arrivals hot deals start best sellers demo article 5 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(31,16,'1.','de','demo-article-6','Demoartikel 6',' demo-article-6 new arrivals start hot deals demoartikel 6 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(32,16,'1.','en','demo-article-6','Demo article 6',' demo-article-6 new arrivals start hot deals demo article 6 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(33,17,'1.','de','demo-article-7','Demoartikel 7',' demo-article-7 hot deals start best sellers demoartikel 7 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27'),
(34,17,'1.','en','demo-article-7','Demo article 7',' demo-article-7 hot deals start best sellers demo article 7 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page','2023-01-11 03:00:27');
/*!40000 ALTER TABLE `mshop_index_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale`
--

DROP TABLE IF EXISTS `mshop_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `langid` varchar(5) NOT NULL,
  `currencyid` varchar(3) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msloc_lang_curr_sid` (`langid`,`currencyid`,`site_id`),
  KEY `fk_msloc_siteid` (`site_id`),
  KEY `fk_msloc_langid` (`langid`),
  KEY `fk_msloc_currid` (`currencyid`),
  CONSTRAINT `fk_msloc_currid` FOREIGN KEY (`currencyid`) REFERENCES `mshop_locale_currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_langid` FOREIGN KEY (`langid`) REFERENCES `mshop_locale_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_siteid` FOREIGN KEY (`site_id`) REFERENCES `mshop_locale_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale`
--

LOCK TABLES `mshop_locale` WRITE;
/*!40000 ALTER TABLE `mshop_locale` DISABLE KEYS */;
INSERT INTO `mshop_locale` VALUES
(1,1,'1.','en','EUR',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,1,'1.','en','USD',1,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,1,'1.','de','EUR',2,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale_currency`
--

DROP TABLE IF EXISTS `mshop_locale_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale_currency` (
  `id` varchar(3) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msloccu_status` (`status`),
  KEY `idx_msloccu_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale_currency`
--

LOCK TABLES `mshop_locale_currency` WRITE;
/*!40000 ALTER TABLE `mshop_locale_currency` DISABLE KEYS */;
INSERT INTO `mshop_locale_currency` VALUES
('AED','United Arab Emirates dirham',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('AFN','Afghan afghani',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ALL','Albanian Lek',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('AMD','Armenian Dram',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ANG','Netherlands Antillean gulden',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('AOA','Angolan Kwanza',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ARS','Argentine Peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('AUD','Australian Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('AWG','Aruban Guilder',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('AZN','Azerbaijani Manat',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BAM','Bosnia-Herzegovina Conv. Mark',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BBD','Barbados Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BDT','Bangladeshi taka',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BGN','Bulgarian Lev',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BHD','Bahraini Dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BIF','Burundi Franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BMD','Bermuda Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BND','Brunei Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BOB','Boliviano',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BRL','Brazilian Real',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BSD','Bahamian Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BTN','Bhutanese Ngultrum',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BWP','Botswana pula',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BYR','Belarussian Ruble',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('BZD','Belize Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CAD','Canadian Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CDF','Congolese franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CHF','Swiss franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CLP','Chilean Peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CNY','Chinese Yuan Renminbi',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('COP','Colombian Peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CRC','Costa Rican colón',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CUP','Cuban peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CVE','Cape Verde Escudo',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('CZK','Czech koruna',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('DJF','Djibouti franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('DKK','Danish krone',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('DOP','Dominican peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('DZD','Algerian Dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('EGP','Egyptian pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ERN','Eritrean nakfa',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ETB','Ethiopian birr',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('EUR','Euro',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('FJD','Fijian dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('FKP','Falkland Islands pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GBP','Pound sterling',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GEL','Georgian lari',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GHC','Ghanaian cedi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GIP','Gibraltar pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GMD','Gambian dalasi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GNF','Guinea Franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GTQ','Guatemalan quetzal',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('GYD','Guyana Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('HKD','Hong Kong dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('HNL','Honduran lempira',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('HRK','Croatian kuna',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('HTG','Haitian gourde',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('HUF','Hungarian forint',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('IDR','Indonesian rupiah',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ILS','New Israeli Sheqel',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('INR','Indian rupee',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('IQD','Iraqi dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('IRR','Iranian rial',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ISK','Icelandic króna',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('JMD','Jamaican dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('JOD','Jordanian dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('JPY','Japanese yen',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KES','Kenyan shilling',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KGS','Kyrgyzstani som',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KHR','Cambodian riel',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KMF','Comorian Franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KPW','North Korean won',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KRW','South Corean won',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KWD','Kuwaiti dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KYD','Cayman Islands Dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('KZT','Kazakhstani tenge',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LAK','Lao kip',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LBP','Lebanese pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LKR','Sri Lankan rupee',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LRD','Liberian dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LSL','Lesotho loti',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LTL','Lithuanian litas',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LVL','Latvian lats',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('LYD','Libyan dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MAD','Moroccan dirham',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MDL','Moldovan leu',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MGA','Malagasy ariary',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MKD','Macedonian denar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MMK','Myanmar kyat',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MNT','Mongolian tugrug',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MOP','Macanese pataca',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MRO','Mauritanian ouguiya',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MUR','Mauritian rupee',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MVR','Maldivian rufiyaa',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MWK','Malawian kwacha',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MXN','Mexican peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MYR','Malaysian ringgit',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('MZM','Mozambican metical',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('NAD','Namibian dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('NGN','Nigerian naira',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('NIO','Nicaraguan córdoba',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('NOK','Norvegian krone',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('NPR','Nepalese rupee',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('NZD','New Zealand dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('OMR','Omani rial',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PAB','Panamanian balboa',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PEN','Peruvian nuevo sol',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PGK','Papua New Guinean kina',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PHP','Philippine peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PKR','Pakistani rupee',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PLN','Polish złoty',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('PYG','Paraguayan guaraní',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('QAR','Qatari riyal',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('RON','Romanian leu',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('RSD','Serbian dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('RUB','Russian ruble',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('RWF','Rwandan franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SAR','Saudi riyal',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SBD','Solomon Islands dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SCR','Seychelles rupee',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SDG','Sudanese pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SEK','Swedish krona',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SGD','Singapore dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SHP','Saint Helena pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SLL','Sierra Leonean leone',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SOS','Somali shilling',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SRD','Suriname dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('STD','São Tomé and Príncipe dobra',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SYP','Syrian pound',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('SZL','Swazi lilangeni',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('THB','Baht',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TJS','Tajikistani somoni',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TMT','Turkmenistani manat',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TND','Tunisian dinar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TOP','Tongan pa\'anga',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TRY','Turkish new lira',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TTD','Trinidad and Tobago dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TWD','New Taiwan dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('TZS','Tanzanian shilling',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('UAH','Ukrainian hryvnia',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('UGX','Ugandan shilling',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('USD','US dollar',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('UYU','Uruguayan peso',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('UZS','Uzbekistani som',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('VEF','Venezuelan bolivar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('VND','Vietnamese dong',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('VUV','Vatu',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('WST','Samoan tala',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('XAF','CFA Franc BEAC',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('XCD','East Caribbean dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('XOF','CFA Franc BCEAO',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('XPF','CFP Franc',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('YER','Yemeni rial',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ZAR','South African rand',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ZMW','Zambian kwacha',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ZWL','Zimbabwean dollar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup');
/*!40000 ALTER TABLE `mshop_locale_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale_language`
--

DROP TABLE IF EXISTS `mshop_locale_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale_language` (
  `id` varchar(5) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mslocla_status` (`status`),
  KEY `idx_mslocla_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale_language`
--

LOCK TABLES `mshop_locale_language` WRITE;
/*!40000 ALTER TABLE `mshop_locale_language` DISABLE KEYS */;
INSERT INTO `mshop_locale_language` VALUES
('aa','Afar',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ab','Abkhazian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('af','Afrikaans',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ak','Akan',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('am','Amharic',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('an','Aragonese',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ar','Arabic',1,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('as','Assamese',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('av','Avar',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ay','Aymara',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('az','Azerbaijani',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ba','Bashkir',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('be','Belarusian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bg','Bulgarian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bh','Bihari',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bi','Bislama',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bm','Bambara',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bn','Bengali',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bo','Tibetan',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('br','Breton',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('bs','Bosnian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ca','Catalan',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ce','Chechen',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ch','Chamorro',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('co','Corsican',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('cr','Cree',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('cs','Czech',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('cu','Church Slavonic',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('cv','Chuvash',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('cy','Welsh',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('da','Danish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('de','German',1,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('dv','Dhivehi',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('dz','Dzongkha',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ee','Ewe',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('el','Greek',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('en','English',1,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('eo','Esperanto',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('es','Spanish',1,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('et','Estonian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('eu','Basque',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('fa','Persian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ff','Fula',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('fi','Finnish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('fj','Fijian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('fo','Faeroese',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('fr','French',1,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('fy','Frisian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ga','Irish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('gd','Scottish Gaelic',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('gl','Galician',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('gn','Guaraní',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('gu','Gujarati',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('gv','Manx',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ha','Hausa',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('he','Hebrew',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('hi','Hindi',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ho','Hiri motu',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('hr','Croatian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ht','Haïtian Creole',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('hu','Hungarian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('hy','Armenian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('hz','Herero',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ia','Interlingua',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('id','Indonesian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ie','Interlingue',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ig','Igbo',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ii','Yi',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ik','Inupiaq',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('io','Ido',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('is','Icelandic',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('it','Italian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('iu','Inuktitut',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ja','Japanese',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('jv','Javanese',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ka','Georgian',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kg','Kongo',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ki','Kikuyu',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kj','Kuanyama',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kk','Kazakh',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kl','Greenlandic',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('km','Khmer',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kn','Kannada',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ko','Korean',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kr','Kanuri',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ks','Kashmiri',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ku','Kurdish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kv','Komi',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('kw','Cornish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ky','Kirghiz',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('lb','Luxembourgish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('lg','Luganda',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('li','Limburgish',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('ln','Lingala',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('lo','Lao',0,'2023-01-11 03:00:25','2023-01-11 03:00:25','setup'),
('lt','Lithuanian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('lu','Luba-Katanga',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('lv','Latvian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mg','Malagasy',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mh','Marshallese',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mi','Māori',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mk','Macedonian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ml','Malayalam',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mn','Mongolian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mo','Moldavian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mr','Marathi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ms','Malay',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('mt','Maltese',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('my','Burmese',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('na','Nauru',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('nb','Norwegian Bokmål',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('nd','North Ndebele',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ne','Nepali',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ng','Ndonga',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('nl','Dutch',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('nn','Norwegian Nynorsk',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('no','Norwegian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('nr','South Ndebele',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('nv','Navajo',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ny','Chichewa',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('oc','Occitan',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('oj','Ojibwa',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('om','Oromo',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('or','Oriya',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('os','Ossetic',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('pa','Punjabi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('pi','Pali',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('pl','Polish',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ps','Pashto',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('pt','Portuguese',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('qu','Quechua',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('rm','Rhaeto-Romance',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('rn','Kirundi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ro','Romanian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ru','Russian',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('rw','Kinyarwanda',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sa','Sanskrit',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sc','Sardinian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sd','Sindhi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('se','Northern Sami',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sg','Sango',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('si','Sinhala',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sk','Slovak',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sl','Slovenian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sm','Samoan',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sn','Shona',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('so','Somali',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sq','Albanian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sr','Serbian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ss','Swati',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('st','Sesotho',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('su','Sundanese',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sv','Swedish',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('sw','Swahili',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ta','Tamil',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('te','Telugu',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tg','Tajik',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('th','Thai',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ti','Tigrinya',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tk','Turkmen',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tl','Tagalog',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tn','Setswana',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('to','Tongan',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tr','Turkish',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ts','Tsonga',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tt','Tatar',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('tw','Twi',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ty','Tahitian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ug','Uyghur',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('uk','Ukrainian',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ur','Urdu',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('uz','Uzbek',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('ve','Venda',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('vi','Vietnamese',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('vo','Volapük',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('wa','Walloon',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('wo','Wolof',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('xh','Xhosa',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('yi','Yiddish',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('yo','Yoruba',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('za','Zhuang',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('zh','Chinese',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup'),
('zu','Zulu',0,'2023-01-11 03:00:26','2023-01-11 03:00:26','setup');
/*!40000 ALTER TABLE `mshop_locale_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale_site`
--

DROP TABLE IF EXISTS `mshop_locale_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `siteid` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '{}',
  `config` text NOT NULL DEFAULT '{}',
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `theme` varchar(32) DEFAULT NULL,
  `level` smallint(6) NOT NULL DEFAULT 0,
  `rating` decimal(4,2) NOT NULL DEFAULT 0.00,
  `ratings` int(11) NOT NULL DEFAULT 0,
  `invoiceno` int(11) NOT NULL DEFAULT 1,
  `nleft` int(11) NOT NULL,
  `nright` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mslocsi_code` (`code`),
  UNIQUE KEY `unq_mslocsi_siteid` (`siteid`),
  KEY `idx_mslocsi_nlt_nrt_lvl_pid` (`nleft`,`nright`,`level`,`parentid`),
  KEY `idx_mslocsi_level_status` (`level`,`status`),
  KEY `idx_mslocsi_rating` (`rating`),
  KEY `idx_mslocsi_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale_site`
--

LOCK TABLES `mshop_locale_site` WRITE;
/*!40000 ALTER TABLE `mshop_locale_site` DISABLE KEYS */;
INSERT INTO `mshop_locale_site` VALUES
(1,0,'1.','default','Default','','{}','{}','',NULL,0,0.00,0,4,1,2,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_locale_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media`
--

DROP TABLE IF EXISTS `mshop_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `fsname` varchar(32) NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL,
  `preview` text NOT NULL DEFAULT '{}',
  `mimetype` varchar(64) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msmed_dom_mime_sid` (`domain`,`mimetype`,`siteid`),
  KEY `idx_msmed_label_sid` (`label`,`siteid`),
  KEY `idx_msmed_link_sid` (`link`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media`
--

LOCK TABLES `mshop_media` WRITE;
/*!40000 ALTER TABLE `mshop_media` DISABLE KEYS */;
INSERT INTO `mshop_media` VALUES
(1,'1.','stage','fs-media',NULL,'catalog','Demo: Best seller stage','https://aimeos.org/media/default/main-banner-1-big.webp','{\"480\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-1-low.webp\",\"960\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-1-med.webp\",\"1920\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-1-big.webp\"}','image/webp',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','menu','fs-media',NULL,'catalog','Demo: Best seller menu','https://aimeos.org/media/default/product_01_A-low.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','stage','fs-media',NULL,'catalog','Demo: New arrivals stage','https://aimeos.org/media/default/main-banner-2-big.webp','{\"480\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-2-low.webp\",\"960\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-2-med.webp\",\"1920\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-2-big.webp\"}','image/webp',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','stage','fs-media',NULL,'catalog','Demo: Hot deals stage','https://aimeos.org/media/default/main-banner-3-big.webp','{\"480\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-3-low.webp\",\"960\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-3-med.webp\",\"1920\":\"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-3-big.webp\"}','image/webp',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','default','fs-media',NULL,'supplier','Demo: Article 1.jpg','https://aimeos.org/media/default/logo-1.png','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png\"}','image/jpeg',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','default','fs-media',NULL,'supplier','Demo: Article 1.jpg','https://aimeos.org/media/default/logo-4.png','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png\"}','image/jpeg',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','icon','fs-media',NULL,'attribute','Demo: black.gif','data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=','{\"1\":\"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=\"}','image/gif',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_01_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_01_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','icon','fs-media',NULL,'attribute','Demo: blue.gif','data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=','{\"1\":\"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs=\"}','image/gif',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','icon','fs-media',NULL,'attribute','Demo: beige.gif','data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=','{\"1\":\"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=\"}','image/gif',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','default','fs-media',NULL,'product','Demo: Selection article 1.webp','https://aimeos.org/media/default/product_04_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.','default','fs-media',NULL,'product','Demo: Selection article 2.webp','https://aimeos.org/media/default/product_04_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.','default','fs-media',NULL,'product','Demo: Bundle article 1.webp','https://aimeos.org/media/default/product_03_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.','default','fs-media',NULL,'product','Demo: Bundle article 2.webp','https://aimeos.org/media/default/product_03_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.','default','fs-media',NULL,'product','Demo: Voucher 0.webp','https://aimeos.org/media/default/voucher-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/voucher-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/voucher-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/voucher-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.','default','fs-media',NULL,'product','Demo: Bundle article 1.webp','https://aimeos.org/media/default/event-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/event-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/event-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/event-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(18,'1.','default','fs-media',NULL,'product','Demo: Bundle article 1.webp','https://aimeos.org/media/default/product_10_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.','default','fs-media',NULL,'product','Demo: Bundle article 2.webp','https://aimeos.org/media/default/product_10_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_02_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_02_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_05_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_05_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_06_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_06_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_07_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(27,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_07_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(28,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_08_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(29,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_08_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(30,'1.','default','fs-media',NULL,'product','Demo: Article 1.webp','https://aimeos.org/media/default/product_09_A-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_A-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_A-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_A-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(31,'1.','default','fs-media',NULL,'product','Demo: Article 2.webp','https://aimeos.org/media/default/product_09_B-big.webp','{\"240\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_B-low.webp\",\"720\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_B-med.webp\",\"1350\":\"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_B-big.webp\"}','image/webp',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(32,'1.','icon','fs-media',NULL,'service','Demo: pickup.png','https://aimeos.org/media/service/pickup.png','{\"1\":\"https:\\/\\/aimeos.org\\/media\\/service\\/pickup.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(33,'1.','icon','fs-media',NULL,'service','Demo: dhl.png','https://aimeos.org/media/service/dhl.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/dhl.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(34,'1.','icon','fs-media',NULL,'service','Demo: dhl-express.png','https://aimeos.org/media/service/dhl-express.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/dhl-express.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(35,'1.','icon','fs-media',NULL,'service','Demo: fedex.png','https://aimeos.org/media/service/fedex.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/fedex.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(36,'1.','icon','fs-media',NULL,'service','Demo: tnt.png','https://aimeos.org/media/service/tnt.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/tnt.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(37,'1.','icon','fs-media','de','service','Demo: payment-in-advance.png','https://aimeos.org/media/service/payment-in-advance.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/payment-in-advance.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(38,'1.','icon','fs-media','de','service','Demo: sepa.png','https://aimeos.org/media/service/sepa.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/sepa.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(39,'1.','icon','fs-media','en','service','Demo: direct-debit.png','https://aimeos.org/media/service/direct-debit.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/direct-debit.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(40,'1.','icon','fs-media',NULL,'service','Demo: paypal.png','https://aimeos.org/media/service/paypal.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/paypal.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(41,'1.','icon','fs-media','de','service','Demo: dhl-cod.png','https://aimeos.org/media/service/dhl-cod.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/dhl-cod.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(42,'1.','icon','fs-media','de','service','Demo: payment-in-advance-alternative.png','https://aimeos.org/media/service/payment-in-advance-alternative.png','{\"0\":\"https:\\/\\/aimeos.org\\/media\\/service\\/payment-in-advance-alternative.png\"}','image/png',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_list`
--

DROP TABLE IF EXISTS `mshop_media_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_msmedli_key_sid` (`key`,`siteid`),
  KEY `fk_msmedli_pid` (`parentid`),
  CONSTRAINT `fk_msmedli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_list`
--

LOCK TABLES `mshop_media_list` WRITE;
/*!40000 ALTER TABLE `mshop_media_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_list_type`
--

DROP TABLE IF EXISTS `mshop_media_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedlity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msmedlity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msmedlity_label_sid` (`label`,`siteid`),
  KEY `idx_msmedlity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_list_type`
--

LOCK TABLES `mshop_media_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_media_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_property`
--

DROP TABLE IF EXISTS `mshop_media_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedpr_pid_ty_lid_val_sid` (`parentid`,`type`,`langid`,`value`,`siteid`),
  KEY `idx_msmedpr_key_sid` (`key`,`siteid`),
  KEY `fk_msmedpr_pid` (`parentid`),
  CONSTRAINT `fk_msmedpr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_property`
--

LOCK TABLES `mshop_media_property` WRITE;
/*!40000 ALTER TABLE `mshop_media_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_property_type`
--

DROP TABLE IF EXISTS `mshop_media_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedprty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msmedprty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msmedprty_label_sid` (`label`,`siteid`),
  KEY `idx_msmedprty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_property_type`
--

LOCK TABLES `mshop_media_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_media_property_type` DISABLE KEYS */;
INSERT INTO `mshop_media_property_type` VALUES
(1,'1.','media','name','Media title',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_media_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_type`
--

DROP TABLE IF EXISTS `mshop_media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msmedty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msmedty_label_sid` (`label`,`siteid`),
  KEY `idx_msmedty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_type`
--

LOCK TABLES `mshop_media_type` WRITE;
/*!40000 ALTER TABLE `mshop_media_type` DISABLE KEYS */;
INSERT INTO `mshop_media_type` VALUES
(1,'1.','cms','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs'),
(2,'1.','attribute','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','attribute','icon','Icon',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','catalog','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','catalog','stage','Stage',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.','catalog','menu','Menu',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(7,'1.','catalog','icon','Icon',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(8,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(9,'1.','product','download','Download',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(10,'1.','service','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(11,'1.','service','icon','Icon',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(12,'1.','supplier','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order`
--

DROP TABLE IF EXISTS `mshop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `baseid` bigint(20) NOT NULL,
  `relatedid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `channel` varchar(16) NOT NULL DEFAULT '',
  `invoiceno` varchar(32) NOT NULL DEFAULT '',
  `datepayment` datetime DEFAULT NULL,
  `datedelivery` datetime DEFAULT NULL,
  `statuspayment` smallint(6) NOT NULL DEFAULT -1,
  `statusdelivery` smallint(6) NOT NULL DEFAULT -1,
  `cdate` varchar(10) NOT NULL DEFAULT '',
  `cmonth` varchar(7) NOT NULL DEFAULT '',
  `cweek` varchar(7) NOT NULL DEFAULT '',
  `cwday` varchar(1) NOT NULL DEFAULT '',
  `chour` varchar(2) NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msord_channel_sid` (`channel`,`siteid`),
  KEY `idx_msord_ctime_pstat_sid` (`ctime`,`statuspayment`,`siteid`),
  KEY `idx_msord_mtime_pstat_sid` (`mtime`,`statuspayment`,`siteid`),
  KEY `idx_msord_mtime_dstat_sid` (`mtime`,`statusdelivery`,`siteid`),
  KEY `idx_msord_dstat_sid` (`statusdelivery`,`siteid`),
  KEY `idx_msord_ddate_sid` (`datedelivery`,`siteid`),
  KEY `idx_msord_pdate_sid` (`datepayment`,`siteid`),
  KEY `idx_msord_editor_sid` (`editor`,`siteid`),
  KEY `idx_msord_cdate_sid` (`cdate`,`siteid`),
  KEY `idx_msord_cmonth_sid` (`cmonth`,`siteid`),
  KEY `idx_msord_cweek_sid` (`cweek`,`siteid`),
  KEY `idx_msord_cwday_sid` (`cwday`,`siteid`),
  KEY `idx_msord_chour_sid` (`chour`,`siteid`),
  KEY `fk_msord_baseid` (`baseid`),
  CONSTRAINT `fk_msord_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order`
--

LOCK TABLES `mshop_order` WRITE;
/*!40000 ALTER TABLE `mshop_order` DISABLE KEYS */;
INSERT INTO `mshop_order` VALUES
(1,'1.',1,'','','1',NOW() - INTERVAL 2 DAY,NULL,5,-1,DATE(NOW() - INTERVAL 2 DAY),DATE_FORMAT(NOW() - INTERVAL 2 DAY,'%Y-%m'),DATE_FORMAT(NOW() - INTERVAL 2 DAY,'%Y-%U'),WEEKDAY(NOW() - INTERVAL 2 DAY)+1,HOUR(NOW() - INTERVAL 2 DAY),NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.',2,'','','2',NOW() - INTERVAL 1 DAY,NULL,5,-1,DATE(NOW() - INTERVAL 1 DAY),DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m'),DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%U'),WEEKDAY(NOW() - INTERVAL 1 DAY)+1,HOUR(NOW() - INTERVAL 1 DAY),NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(3,'1.',3,'','','3',NOW() - INTERVAL 0 DAY,NULL,5,-1,DATE(NOW() - INTERVAL 0 DAY),DATE_FORMAT(NOW() - INTERVAL 0 DAY,'%Y-%m'),DATE_FORMAT(NOW() - INTERVAL 0 DAY,'%Y-%U'),WEEKDAY(NOW() - INTERVAL 0 DAY)+1,HOUR(NOW() - INTERVAL 0 DAY),NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base`
--

DROP TABLE IF EXISTS `mshop_order_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `customerid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `sitecode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) NOT NULL,
  `currencyid` varchar(3) NOT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `costs` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rebate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `taxflag` smallint(6) NOT NULL DEFAULT 1,
  `customerref` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordba_custid_scode` (`customerid`,`sitecode`),
  KEY `idx_msordba_custid_sid` (`customerid`,`siteid`),
  KEY `idx_msordba_ctime_sid` (`ctime`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base`
--

LOCK TABLES `mshop_order_base` WRITE;
/*!40000 ALTER TABLE `mshop_order_base` DISABLE KEYS */;
INSERT INTO `mshop_order_base` VALUES
(1,'1.','','default','en','EUR',100.00,5.00,0.00,17.5000,1,'','',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.','','default','en','USD',250.00,27.00,0.00,13.7099,1,'','',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(3,'1.','','default','en','EUR',140.00,16.90,0.00,14.7864,1,'','',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_address`
--

DROP TABLE IF EXISTS `mshop_order_base_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `baseid` bigint(20) NOT NULL,
  `addrid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `salutation` varchar(8) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vatid` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `firstname` varchar(64) NOT NULL DEFAULT '',
  `lastname` varchar(64) NOT NULL DEFAULT '',
  `address1` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) NOT NULL DEFAULT '',
  `address3` varchar(200) NOT NULL DEFAULT '',
  `postal` varchar(16) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `state` varchar(200) NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `countryid` varchar(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `telefax` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `longitude` double DEFAULT 0,
  `latitude` double DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaad_bid_type` (`baseid`,`type`),
  KEY `idx_msordbaad_bid_lname` (`baseid`,`lastname`),
  KEY `idx_msordbaad_bid_addr1` (`baseid`,`address1`),
  KEY `idx_msordbaad_bid_postal` (`baseid`,`postal`),
  KEY `idx_msordbaad_bid_city` (`baseid`,`city`),
  KEY `idx_msordbaad_bid_email` (`baseid`,`email`),
  KEY `fk_msordbaad_baseid` (`baseid`),
  CONSTRAINT `fk_msordbaad_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_address`
--

LOCK TABLES `mshop_order_base_address` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_address` DISABLE KEYS */;
INSERT INTO `mshop_order_base_address` VALUES
(1,'1.',1,'','payment','','','','','test','user','test street 1','','','12345','test city','','en','DE','','','aimeos@aimeos.org','',NULL,NULL,NULL,0,NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.',2,'','payment','','','','','test','user','test street 1','','','12345','test city','','en','US','','','aimeos@aimeos.org','',NULL,NULL,NULL,0,NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(3,'1.',3,'','payment','','','','','test','user','test street 1','','','12345','test city','','en','IN','','','aimeos@aimeos.org','',NULL,NULL,NULL,0,NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_base_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_coupon`
--

DROP TABLE IF EXISTS `mshop_order_base_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `baseid` bigint(20) NOT NULL,
  `ordprodid` bigint(20) DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordbaco_bid_code` (`baseid`,`code`),
  KEY `fk_msordbaco_baseid` (`baseid`),
  CONSTRAINT `fk_msordbaco_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_coupon`
--

LOCK TABLES `mshop_order_base_coupon` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_product`
--

DROP TABLE IF EXISTS `mshop_order_base_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `baseid` bigint(20) NOT NULL,
  `ordprodid` bigint(20) DEFAULT NULL,
  `ordaddrid` bigint(20) DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `prodid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `parentprodid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `prodcode` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `stocktype` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'default',
  `vendor` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `mediaurl` varchar(255) NOT NULL DEFAULT '',
  `target` varchar(255) NOT NULL DEFAULT '',
  `timeframe` varchar(16) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT 1,
  `qtyopen` double NOT NULL DEFAULT 0,
  `scale` double NOT NULL DEFAULT 1,
  `currencyid` varchar(3) NOT NULL,
  `price` decimal(12,2) DEFAULT 0.00,
  `costs` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rebate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `taxrate` varchar(255) NOT NULL DEFAULT '{}',
  `taxflag` smallint(6) NOT NULL DEFAULT 1,
  `flags` int(11) NOT NULL DEFAULT 0,
  `pos` int(11) NOT NULL DEFAULT 0,
  `statuspayment` smallint(6) NOT NULL DEFAULT -1,
  `statusdelivery` smallint(6) NOT NULL DEFAULT -1,
  `notes` text NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbapr_bid_pos` (`baseid`,`pos`),
  KEY `idx_msordbapr_bid_pid` (`baseid`,`prodid`),
  KEY `idx_msordbapr_bid_pcd` (`baseid`,`prodcode`),
  KEY `idx_msordbapr_bid_qtyo` (`baseid`,`qtyopen`),
  KEY `idx_msordbapr_ct_pid_bid` (`ctime`,`prodid`,`baseid`),
  KEY `fk_msordbapr_baseid` (`baseid`),
  CONSTRAINT `fk_msordbapr_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_product`
--

LOCK TABLES `mshop_order_base_product` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_product` DISABLE KEYS */;
INSERT INTO `mshop_order_base_product` VALUES
(1,'1.',1,NULL,NULL,'default','1','','demo-article','default','Default','Demo article','','https://aimeos.org/media/default/product_01_A-low.webp','','',1,1,1,'EUR',100.00,5.00,0.00,17.5000,'{\"tax\":\"20.00\"}',1,0,0,-1,-1,'',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.',2,NULL,NULL,'bundle','7','','demo-bundle-article','default','','Demo bundle article','','https://aimeos.org/media/default/product_03_A-low.webp','','',1,1,1,'USD',250.00,15.00,0.00,12.6190,'{\"tax\":\"5.00\"}',1,0,0,-1,-1,'',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(3,'1.',2,2,NULL,'select','6','7','demo-selection-article','default','','Demo selection article','','https://aimeos.org/media/default/product_04_A-low.webp','','',1,1,1,'USD',200.00,15.00,0.00,10.2381,'{\"tax\":\"5.00\"}',1,0,1,-1,-1,'',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(4,'1.',2,2,NULL,'default','1','7','demo-article','default','','Demo article','','https://aimeos.org/media/default/product_01_A-low.webp','','',1,1,1,'USD',130.00,7.50,0.00,12.5000,'{\"tax\":\"10.00\"}',1,0,2,-1,-1,'',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(5,'1.',3,NULL,NULL,'select','2','6','demo-selection-article-1','default','Default','Demo selection article','','https://aimeos.org/media/default/product_04_A-low.webp','','',1,1,1,'EUR',140.00,10.00,0.00,13.6364,'{\"tax\":\"10.00\"}',1,0,0,-1,-1,'',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_base_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_product_attr`
--

DROP TABLE IF EXISTS `mshop_order_base_product_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_product_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` bigint(20) NOT NULL,
  `attrid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT 1,
  `price` decimal(12,2) DEFAULT 0.00,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaprat_oid_aid_ty_cd` (`parentid`,`attrid`,`type`,`code`),
  KEY `fk_msordbaprat_parentid` (`parentid`),
  KEY `idx_msordbaprat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaprat_parentid` FOREIGN KEY (`parentid`) REFERENCES `mshop_order_base_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_product_attr`
--

LOCK TABLES `mshop_order_base_product_attr` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_product_attr` DISABLE KEYS */;
INSERT INTO `mshop_order_base_product_attr` VALUES
(1,'1.',5,'7','variant','color',1,NULL,'Blue','\"demo-blue\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(2,'1.',5,'8','variant','width',1,NULL,'32','\"demo-width-32\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(3,'1.',5,'9','variant','length',1,NULL,'34','\"demo-length-34\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_base_product_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_service`
--

DROP TABLE IF EXISTS `mshop_order_base_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `baseid` bigint(20) NOT NULL,
  `servid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `mediaurl` varchar(255) NOT NULL DEFAULT '',
  `currencyid` varchar(3) NOT NULL,
  `price` decimal(12,2) DEFAULT 0.00,
  `costs` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rebate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `taxrate` varchar(255) NOT NULL DEFAULT '{}',
  `taxflag` smallint(6) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbase_bid_cd_typ_sid` (`baseid`,`code`,`type`,`siteid`),
  KEY `idx_msordbase_code_type_sid` (`code`,`type`,`siteid`),
  KEY `fk_msordbase_baseid` (`baseid`),
  CONSTRAINT `fk_msordbase_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_service`
--

LOCK TABLES `mshop_order_base_service` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_service` DISABLE KEYS */;
INSERT INTO `mshop_order_base_service` VALUES
(1,'1.',1,'1','delivery','demo-pickup','Click & Collect','','EUR',0.00,0.00,0.00,0.0000,'{\"tax\":\"0.00\"}',1,0,NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.',1,'6','payment','demo-invoice','Invoice','','EUR',0.00,0.00,0.00,0.0000,'{\"tax\":\"20.00\"}',1,1,NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(3,'1.',2,'1','delivery','demo-pickup','Click & Collect','','USD',0.00,0.00,0.00,0.0000,'{\"tax\":\"0.00\"}',1,0,NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(4,'1.',2,'9','payment','demo-cashondelivery','Cash on delivery','','USD',0.00,12.00,0.00,1.0909,'{\"tax\":\"10.00\"}',1,1,NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(5,'1.',3,'4','delivery','demo-fedex','Fedex','','EUR',0.00,6.90,0.00,1.1500,'{\"tax\":\"20.00\"}',1,0,NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(6,'1.',3,'7','payment','demo-sepa','Direct debit','','EUR',0.00,0.00,0.00,0.0000,'{\"tax\":\"20.00\"}',1,1,NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_base_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_service_attr`
--

DROP TABLE IF EXISTS `mshop_order_base_service_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_service_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` bigint(20) NOT NULL,
  `attrid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT 1,
  `price` decimal(12,2) DEFAULT 0.00,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaseat_oid_aid_ty_cd` (`parentid`,`attrid`,`type`,`code`),
  KEY `fk_msordbaseat_parentid` (`parentid`),
  KEY `idx_msordbaseat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaseat_parentid` FOREIGN KEY (`parentid`) REFERENCES `mshop_order_base_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_service_attr`
--

LOCK TABLES `mshop_order_base_service_attr` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_service_attr` DISABLE KEYS */;
INSERT INTO `mshop_order_base_service_attr` VALUES
(1,'1.',1,'','hidden','supplier.code',1,NULL,'','\"demo-test1\"',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.',1,'','delivery','time.hourminute',1,NULL,'','\"13:56\"',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(3,'1.',1,'','delivery','supplier.address',1,NULL,'','\"Test supplier 1, Test company, Test street 1, 10000 Test city\"',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(4,'1.',6,'','payment','directdebit.accountowner',1,NULL,'','\"test user\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(5,'1.',6,'','payment','directdebit.accountno',1,NULL,'','\"XXXXX678\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(6,'1.',6,'','payment','directdebit.bankcode',1,NULL,'','\"456789\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(7,'1.',6,'','payment','directdebit.bankname',1,NULL,'','\"test bank\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(8,'1.',6,'','payment/hidden','directdebit.accountno',1,NULL,'','\"12345678\"',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_base_service_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_basket`
--

DROP TABLE IF EXISTS `mshop_order_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_basket` (
  `id` varchar(255) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `customerid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordca_custid` (`customerid`),
  KEY `idx_msordca_mtime` (`mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_basket`
--

LOCK TABLES `mshop_order_basket` WRITE;
/*!40000 ALTER TABLE `mshop_order_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_status`
--

DROP TABLE IF EXISTS `mshop_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` bigint(20) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `value` varchar(64) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordst_pid_typ_val_sid` (`parentid`,`type`,`value`,`siteid`),
  KEY `fk_msordst_pid` (`parentid`),
  CONSTRAINT `fk_msordst_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_status`
--

LOCK TABLES `mshop_order_status` WRITE;
/*!40000 ALTER TABLE `mshop_order_status` DISABLE KEYS */;
INSERT INTO `mshop_order_status` VALUES
(1,'1.',1,'stock-update','1',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(2,'1.',1,'coupon-update','1',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(3,'1.',1,'status-payment','5',NOW() - INTERVAL 2 DAY,NOW() - INTERVAL 2 DAY,'10.42.0.1'),
(4,'1.',2,'stock-update','1',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(5,'1.',2,'coupon-update','1',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(6,'1.',2,'status-payment','5',NOW() - INTERVAL 1 DAY,NOW() - INTERVAL 1 DAY,'10.42.0.1'),
(7,'1.',3,'stock-update','1',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(8,'1.',3,'coupon-update','1',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1'),
(9,'1.',3,'status-payment','5',NOW() - INTERVAL 0 DAY,NOW() - INTERVAL 0 DAY,'10.42.0.1');
/*!40000 ALTER TABLE `mshop_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_plugin`
--

DROP TABLE IF EXISTS `mshop_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `provider` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msplu_ty_prov_sid` (`type`,`provider`,`siteid`),
  KEY `idx_msplu_prov_sid` (`provider`,`siteid`),
  KEY `idx_msplu_status_sid` (`status`,`siteid`),
  KEY `idx_msplu_label_sid` (`label`,`siteid`),
  KEY `idx_msplu_pos_sid` (`pos`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_plugin`
--

LOCK TABLES `mshop_plugin` WRITE;
/*!40000 ALTER TABLE `mshop_plugin` DISABLE KEYS */;
INSERT INTO `mshop_plugin` VALUES
(1,'1.','order','ProductLimit','Limits maximum amount of products','{\"single-number-max\":10,\"total-number-max\":100,\"single-value-max\":{\"EUR\":\"1000.00\"},\"total-value-max\":{\"EUR\":\"10000.00\"}}',10,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','order','ProductGone','Checks for deleted products','[]',20,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.','order','ProductStock','Checks for products out of stock','[]',30,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.','order','ProductPrice','Checks for changed product prices','[]',40,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.','order','Autofill','Adds addresses/delivery/payment to basket','{\"address\":1,\"useorder\":1,\"orderaddress\":1,\"orderservice\":1,\"delivery\":1,\"payment\":0}',50,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','order','ServicesUpdate','Updates delivery/payment options on basket change','[]',60,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','order','Shipping','Free shipping above threshold','{\"threshold\":{\"EUR\":\"1.00\"}}',70,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','order','BasketLimits','Checks for necessary basket limits','{\"min-products\":1,\"max-products\":100,\"min-value\":{\"EUR\":\"1.00\"},\"max-value\":{\"EUR\":\"10000.00\"}}',80,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','order','Taxrates','Country and state tax rates','{\"country-taxrates\":{\"US\":\"5.00\",\"AT\":\"20.00\"},\"state-taxrates\":{\"CA\":\"6.25\"}}',90,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','order','Coupon','Coupon update','[]',100,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','order','AddressesAvailable','Checks for required addresses (billing/delivery)','{\"payment\":1,\"delivery\":\"\"}',110,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','order','ServicesAvailable','Checks for required services (delivery/payment)','{\"payment\":1,\"delivery\":1}',120,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_plugin_type`
--

DROP TABLE IF EXISTS `mshop_plugin_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_plugin_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspluty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mspluty_status_pos_sid` (`status`,`siteid`,`pos`),
  KEY `idx_mspluty_label_sid` (`label`,`siteid`),
  KEY `idx_mspluty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_plugin_type`
--

LOCK TABLES `mshop_plugin_type` WRITE;
/*!40000 ALTER TABLE `mshop_plugin_type` DISABLE KEYS */;
INSERT INTO `mshop_plugin_type` VALUES
(1,'1.','plugin','order','Order',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_plugin_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price`
--

DROP TABLE IF EXISTS `mshop_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `currencyid` varchar(3) NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `value` decimal(12,2) DEFAULT 0.00,
  `costs` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rebate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `taxrate` varchar(255) NOT NULL DEFAULT '{}',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mspri_dom_cid_val_sid` (`domain`,`currencyid`,`value`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price`
--

LOCK TABLES `mshop_price` WRITE;
/*!40000 ALTER TABLE `mshop_price` DISABLE KEYS */;
INSERT INTO `mshop_price` VALUES
(1,'1.','default','attribute','Demo: Small print','EUR',1,5.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','default','attribute','Demo: Small print','USD',1,7.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.','default','attribute','Demo: Large print','EUR',1,15.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.','default','attribute','Demo: Large print','USD',1,20.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.','default','product','Demo: Article from 1','EUR',1,100.00,5.00,20.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','default','product','Demo: Article from 1','USD',1,130.00,7.50,30.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','default','product','Demo: Selection article 1 from 1','EUR',1,140.00,10.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','default','product','Demo: Selection article 1 from 1','USD',1,190.00,15.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','default','product','Demo: Selection article from 1','EUR',1,150.00,10.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','default','product','Demo: Selection article from 5','EUR',5,135.00,10.00,15.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','default','product','Demo: Selection article from 10','EUR',10,120.00,10.00,30.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','default','product','Demo: Selection article from 1','USD',1,200.00,15.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.','default','product','Demo: Selection article from 5','USD',5,175.00,15.00,25.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.','default','product','Demo: Selection article from 10','USD',10,150.00,15.00,50.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.','default','attribute','Demo: Small sticker','EUR',1,2.50,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.','default','attribute','Demo: Small sticker','USD',1,3.50,0.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.','default','attribute','Demo: Large sticker','EUR',1,5.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(18,'1.','default','attribute','Demo: Large sticker','USD',1,7.00,0.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.','default','product','Demo: Bundle article from 1','EUR',1,250.00,10.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.','default','product','Demo: Bundle article from 5','EUR',5,235.00,10.00,15.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.','default','product','Demo: Bundle article from 10','EUR',10,220.00,10.00,30.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.','default','product','Demo: Bundle article from 1','USD',1,250.00,15.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.','default','product','Demo: Bundle article from 5','USD',5,225.00,15.00,25.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.','default','product','Demo: Bundle article from 10','USD',10,200.00,15.00,50.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.','default','product','Demo: Voucher','EUR',1,25.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.','default','product','Demo: Voucher','USD',1,25.00,0.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(27,'1.','default','product','Demo: Event article from 1','EUR',1,49.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(28,'1.','default','product','Demo: Event article from 1','USD',1,59.00,0.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(29,'1.','default','product','Demo: Event article from 1','EUR',1,49.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(30,'1.','default','product','Demo: Event article from 1','USD',1,59.00,0.00,0.00,'{\"tax\":\"5.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(31,'1.','default','product','Demo: Article from 1','EUR',1,49.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(32,'1.','default','product','Demo: Article from 1','USD',1,59.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(33,'1.','default','product','Demo: Article from 1','EUR',1,69.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(34,'1.','default','product','Demo: Article from 1','USD',1,79.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(35,'1.','default','product','Demo: Article from 1','EUR',1,29.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(36,'1.','default','product','Demo: Article from 1','USD',1,36.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(37,'1.','default','product','Demo: Article from 1','EUR',1,79.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(38,'1.','default','product','Demo: Article from 1','USD',1,99.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(39,'1.','default','product','Demo: Article from 1','EUR',1,19.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(40,'1.','default','product','Demo: Article from 1','USD',1,22.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(41,'1.','default','product','Demo: Article from 1','EUR',1,49.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(42,'1.','default','product','Demo: Article from 1','USD',1,59.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(43,'1.','default','service','Demo: Click&Collect','EUR',1,0.00,0.00,0.00,'{\"tax\":\"0.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(44,'1.','default','service','Demo: Click&Collect','USD',1,0.00,0.00,0.00,'{\"tax\":\"0.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(45,'1.','default','service','Demo: DHL','EUR',1,0.00,5.90,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(46,'1.','default','service','Demo: DHL','USD',1,0.00,7.90,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(47,'1.','default','service','Demo: DHL','EUR',1,0.00,11.90,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(48,'1.','default','service','Demo: DHL','USD',1,0.00,15.90,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(49,'1.','default','service','Demo: Fedex','EUR',1,0.00,6.90,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(50,'1.','default','service','Demo: Fedex','USD',1,0.00,8.50,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(51,'1.','default','service','Demo: TNT','EUR',1,0.00,8.90,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(52,'1.','default','service','Demo: TNT','USD',1,0.00,12.90,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(53,'1.','default','service','Demo: Invoice','EUR',1,0.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(54,'1.','default','service','Demo: Invoice','USD',1,0.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(55,'1.','default','service','Demo: Direct debit','EUR',1,0.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(56,'1.','default','service','Demo: Direct debit','USD',1,0.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(57,'1.','default','service','Demo: PayPal','EUR',1,0.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(58,'1.','default','service','Demo: PayPal','USD',1,0.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(59,'1.','default','service','Demo: Cache on delivery','EUR',1,0.00,8.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(60,'1.','default','service','Demo: Cache on delivery','USD',1,0.00,12.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(61,'1.','default','service','Demo: Prepayment','EUR',1,0.00,0.00,0.00,'{\"tax\":\"20.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(62,'1.','default','service','Demo: Prepayment','USD',1,0.00,0.00,0.00,'{\"tax\":\"10.00\"}',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_list`
--

DROP TABLE IF EXISTS `mshop_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprili_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_msprili_key_sid` (`key`,`siteid`),
  KEY `fk_msprili_pid` (`parentid`),
  CONSTRAINT `fk_msprili_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_list`
--

LOCK TABLES `mshop_price_list` WRITE;
/*!40000 ALTER TABLE `mshop_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_list_type`
--

DROP TABLE IF EXISTS `mshop_price_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprility_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msprility_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msprility_label_sid` (`label`,`siteid`),
  KEY `idx_msprility_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_list_type`
--

LOCK TABLES `mshop_price_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_price_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_property`
--

DROP TABLE IF EXISTS `mshop_price_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspripr_pid_ty_lid_val_sid` (`parentid`,`type`,`langid`,`value`,`siteid`),
  KEY `idx_mspripr_key_sid` (`key`,`siteid`),
  KEY `fk_mspripr_pid` (`parentid`),
  CONSTRAINT `fk_mspripr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_property`
--

LOCK TABLES `mshop_price_property` WRITE;
/*!40000 ALTER TABLE `mshop_price_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_property_type`
--

DROP TABLE IF EXISTS `mshop_price_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspriprty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mspriprty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mspriprty_label_sid` (`label`,`siteid`),
  KEY `idx_mspriprty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_property_type`
--

LOCK TABLES `mshop_price_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_price_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_type`
--

DROP TABLE IF EXISTS `mshop_price_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msprity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msprity_label_sid` (`label`,`siteid`),
  KEY `idx_msprity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_type`
--

LOCK TABLES `mshop_price_type` WRITE;
/*!40000 ALTER TABLE `mshop_price_type` DISABLE KEYS */;
INSERT INTO `mshop_price_type` VALUES
(1,'1.','attribute','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','service','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_price_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product`
--

DROP TABLE IF EXISTS `mshop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `dataset` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `config` text NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `scale` double NOT NULL DEFAULT 0,
  `rating` decimal(4,2) NOT NULL DEFAULT 0.00,
  `ratings` int(11) NOT NULL DEFAULT 0,
  `instock` smallint(6) NOT NULL DEFAULT 0,
  `target` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspro_siteid_code_sid` (`code`,`siteid`),
  KEY `idx_mspro_id_stat_st_end_rt_sid` (`id`,`status`,`start`,`end`,`rating`,`siteid`),
  KEY `idx_mspro_stat_st_end_rt_sid` (`status`,`start`,`end`,`rating`,`siteid`),
  KEY `idx_mspro_rating_sid` (`rating`,`siteid`),
  KEY `idx_mspro_label_sid` (`label`,`siteid`),
  KEY `idx_mspro_start_sid` (`start`,`siteid`),
  KEY `idx_mspro_type_sid` (`type`,`siteid`),
  KEY `idx_mspro_end_sid` (`end`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product`
--

LOCK TABLES `mshop_product` WRITE;
/*!40000 ALTER TABLE `mshop_product` DISABLE KEYS */;
INSERT INTO `mshop_product` VALUES
(1,'1.','','default','demo-article','Demo article','demo-article','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','','default','demo-selection-article-1','Demo variant article 1','demo-variant-article-1','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.','','default','demo-selection-article-2','Demo variant article 2','demo-variant-article-2','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.','','default','demo-selection-article-3','Demo variant article 3','demo-variant-article-3','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.','','default','demo-selection-article-4','Demo variant article 4','demo-variant-article-4','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','','select','demo-selection-article','Demo selection article','demo-selection-article','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','','bundle','demo-bundle-article','Demo bundle article','demo-bundle-article','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','','voucher','demo-voucher','Demo voucher','demo-voucher','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','','event','demo-event-article','Demo event article','demo-event-article','[]','2100-01-01 08:00:00','2100-01-01 16:00:00',1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','','group','demo-group-article','Demo group article','demo-group-article','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','','default','demo-rebate','Demo rebate','demo-rebate','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','','default','demo-article-2','Demo article 2','demo-article-2','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.','','default','demo-article-3','Demo article 3','demo-article-3','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.','','default','demo-article-4','Demo article 4','demo-article-4','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.','','default','demo-article-5','Demo article 5','demo-article-5','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.','','default','demo-article-6','Demo article 6','demo-article-6','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.','','default','demo-article-7','Demo article 7','demo-article-7','[]',NULL,NULL,1,0.00,0,0,'',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_list`
--

DROP TABLE IF EXISTS `mshop_product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_msproli_key_sid` (`key`,`siteid`),
  KEY `fk_msproli_pid` (`parentid`),
  CONSTRAINT `fk_msproli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_list`
--

LOCK TABLES `mshop_product_list` WRITE;
/*!40000 ALTER TABLE `mshop_product_list` DISABLE KEYS */;
INSERT INTO `mshop_product_list` VALUES
(1,'1.',1,'attribute|default|1','default','attribute','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.',1,'attribute|config|2','config','attribute','2',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.',1,'attribute|custom|3','custom','attribute','3',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.',1,'attribute|config|4','config','attribute','4',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.',1,'attribute|config|5','config','attribute','5',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.',1,'attribute|config|6','config','attribute','6',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.',1,'media|default|8','default','media','8',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.',1,'media|default|9','default','media','9',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.',1,'price|default|5','default','price','5',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.',1,'price|default|6','default','price','6',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.',1,'text|default|50','default','text','50',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.',1,'text|default|51','default','text','51',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.',1,'text|default|52','default','text','52',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.',1,'text|default|53','default','text','53',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.',1,'text|default|54','default','text','54',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.',1,'text|default|55','default','text','55',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.',1,'text|default|56','default','text','56',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(18,'1.',1,'catalog|promotion|1','promotion','catalog','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.',1,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.',1,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.',1,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.',1,'supplier|default|1','default','supplier','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.',2,'attribute|variant|7','variant','attribute','7',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.',2,'attribute|variant|8','variant','attribute','8',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.',2,'attribute|variant|9','variant','attribute','9',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.',2,'price|default|7','default','price','7',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(27,'1.',2,'price|default|8','default','price','8',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(28,'1.',2,'supplier|default|1','default','supplier','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(29,'1.',2,'supplier|default|2','default','supplier','2',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(30,'1.',3,'attribute|variant|10','variant','attribute','10',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(31,'1.',3,'attribute|variant|11','variant','attribute','11',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(32,'1.',3,'attribute|variant|12','variant','attribute','12',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(33,'1.',4,'attribute|variant|10','variant','attribute','10',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(34,'1.',4,'attribute|variant|8','variant','attribute','8',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(35,'1.',4,'attribute|variant|9','variant','attribute','9',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(36,'1.',5,'attribute|variant|10','variant','attribute','10',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(37,'1.',5,'attribute|variant|11','variant','attribute','11',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(38,'1.',5,'attribute|variant|9','variant','attribute','9',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(39,'1.',6,'media|default|12','default','media','12',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(40,'1.',6,'media|default|13','default','media','13',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(41,'1.',6,'price|default|9','default','price','9',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(42,'1.',6,'price|default|10','default','price','10',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(43,'1.',6,'price|default|11','default','price','11',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(44,'1.',6,'price|default|12','default','price','12',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(45,'1.',6,'price|default|13','default','price','13',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(46,'1.',6,'price|default|14','default','price','14',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(47,'1.',6,'text|default|77','default','text','77',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(48,'1.',6,'text|default|78','default','text','78',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(49,'1.',6,'text|default|79','default','text','79',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(50,'1.',6,'text|default|80','default','text','80',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(51,'1.',6,'text|default|81','default','text','81',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(52,'1.',6,'text|default|82','default','text','82',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(53,'1.',6,'text|default|83','default','text','83',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(54,'1.',6,'text|default|84','default','text','84',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(55,'1.',6,'product|default|2','default','product','2',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(56,'1.',6,'product|suggestion|1','suggestion','product','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(57,'1.',6,'product|bought-together|1','bought-together','product','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(58,'1.',6,'product|default|3','default','product','3',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(59,'1.',6,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(60,'1.',6,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(61,'1.',6,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(62,'1.',7,'attribute|config|13','config','attribute','13',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(63,'1.',7,'attribute|config|14','config','attribute','14',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(64,'1.',7,'media|default|14','default','media','14',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(65,'1.',7,'media|default|15','default','media','15',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(66,'1.',7,'price|default|19','default','price','19',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(67,'1.',7,'price|default|20','default','price','20',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(68,'1.',7,'price|default|21','default','price','21',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(69,'1.',7,'price|default|22','default','price','22',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(70,'1.',7,'price|default|23','default','price','23',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(71,'1.',7,'price|default|24','default','price','24',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(72,'1.',7,'text|default|93','default','text','93',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(73,'1.',7,'text|default|94','default','text','94',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(74,'1.',7,'text|default|95','default','text','95',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(75,'1.',7,'text|default|96','default','text','96',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(76,'1.',7,'text|default|97','default','text','97',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(77,'1.',7,'text|default|98','default','text','98',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(78,'1.',7,'text|default|99','default','text','99',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(79,'1.',7,'text|default|100','default','text','100',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(80,'1.',7,'product|default|6','default','product','6',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(81,'1.',7,'product|default|1','default','product','1',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(82,'1.',7,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(83,'1.',7,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(84,'1.',7,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',7,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(85,'1.',7,'supplier|default|2','default','supplier','2',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(86,'1.',8,'attribute|custom|15','custom','attribute','15',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(87,'1.',8,'attribute|custom|16','custom','attribute','16',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(88,'1.',8,'media|default|16','default','media','16',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(89,'1.',8,'price|default|25','default','price','25',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(90,'1.',8,'price|default|26','default','price','26',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(91,'1.',8,'text|default|105','default','text','105',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(92,'1.',8,'text|default|106','default','text','106',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(93,'1.',8,'text|default|107','default','text','107',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(94,'1.',8,'text|default|108','default','text','108',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(95,'1.',8,'text|default|109','default','text','109',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(96,'1.',8,'text|default|110','default','text','110',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(97,'1.',8,'text|default|111','default','text','111',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(98,'1.',8,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(99,'1.',8,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(100,'1.',9,'media|default|17','default','media','17',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(101,'1.',9,'price|default|27','default','price','27',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(102,'1.',9,'price|default|28','default','price','28',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(103,'1.',9,'text|default|112','default','text','112',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(104,'1.',9,'text|default|113','default','text','113',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(105,'1.',9,'text|default|114','default','text','114',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(106,'1.',9,'text|default|115','default','text','115',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(107,'1.',9,'text|default|116','default','text','116',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(108,'1.',9,'text|default|117','default','text','117',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(109,'1.',9,'text|default|118','default','text','118',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(110,'1.',9,'text|default|119','default','text','119',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(111,'1.',9,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(112,'1.',9,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(113,'1.',9,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',7,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(114,'1.',10,'media|default|18','default','media','18',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(115,'1.',10,'media|default|19','default','media','19',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(116,'1.',10,'price|default|29','default','price','29',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(117,'1.',10,'price|default|30','default','price','30',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(118,'1.',10,'text|default|120','default','text','120',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(119,'1.',10,'text|default|121','default','text','121',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(120,'1.',10,'text|default|122','default','text','122',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(121,'1.',10,'text|default|123','default','text','123',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(122,'1.',10,'text|default|124','default','text','124',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(123,'1.',10,'text|default|125','default','text','125',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(124,'1.',10,'text|default|126','default','text','126',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(125,'1.',10,'text|default|127','default','text','127',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(126,'1.',10,'product|default|1','default','product','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(127,'1.',10,'product|default|7','default','product','7',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(128,'1.',10,'product|default|9','default','product','9',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(129,'1.',10,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(130,'1.',10,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(131,'1.',10,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',7,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(132,'1.',11,'text|default|128','default','text','128',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(133,'1.',12,'media|default|20','default','media','20',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(134,'1.',12,'media|default|21','default','media','21',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(135,'1.',12,'price|default|31','default','price','31',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(136,'1.',12,'price|default|32','default','price','32',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(137,'1.',12,'text|default|129','default','text','129',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(138,'1.',12,'text|default|130','default','text','130',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(139,'1.',12,'text|default|131','default','text','131',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(140,'1.',12,'text|default|132','default','text','132',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(141,'1.',12,'text|default|133','default','text','133',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(142,'1.',12,'text|default|134','default','text','134',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(143,'1.',12,'text|default|135','default','text','135',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(144,'1.',12,'catalog|promotion|1','promotion','catalog','1',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(145,'1.',12,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(146,'1.',12,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(147,'1.',12,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(148,'1.',13,'media|default|22','default','media','22',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(149,'1.',13,'media|default|23','default','media','23',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(150,'1.',13,'price|default|33','default','price','33',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(151,'1.',13,'price|default|34','default','price','34',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(152,'1.',13,'text|default|136','default','text','136',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(153,'1.',13,'text|default|137','default','text','137',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(154,'1.',13,'text|default|138','default','text','138',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(155,'1.',13,'text|default|139','default','text','139',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(156,'1.',13,'text|default|140','default','text','140',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(157,'1.',13,'text|default|141','default','text','141',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(158,'1.',13,'text|default|142','default','text','142',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(159,'1.',13,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(160,'1.',13,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(161,'1.',13,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',7,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(162,'1.',14,'media|default|24','default','media','24',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(163,'1.',14,'media|default|25','default','media','25',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(164,'1.',14,'price|default|35','default','price','35',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(165,'1.',14,'price|default|36','default','price','36',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(166,'1.',14,'text|default|143','default','text','143',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(167,'1.',14,'text|default|144','default','text','144',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(168,'1.',14,'text|default|145','default','text','145',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(169,'1.',14,'text|default|146','default','text','146',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(170,'1.',14,'text|default|147','default','text','147',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(171,'1.',14,'text|default|148','default','text','148',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(172,'1.',14,'text|default|149','default','text','149',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(173,'1.',14,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(174,'1.',15,'media|default|26','default','media','26',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(175,'1.',15,'media|default|27','default','media','27',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(176,'1.',15,'price|default|37','default','price','37',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(177,'1.',15,'price|default|38','default','price','38',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(178,'1.',15,'text|default|150','default','text','150',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(179,'1.',15,'text|default|151','default','text','151',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(180,'1.',15,'text|default|152','default','text','152',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(181,'1.',15,'text|default|153','default','text','153',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(182,'1.',15,'text|default|154','default','text','154',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(183,'1.',15,'text|default|155','default','text','155',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(184,'1.',15,'text|default|156','default','text','156',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(185,'1.',15,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(186,'1.',15,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(187,'1.',15,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(188,'1.',15,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',8,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(189,'1.',16,'media|default|28','default','media','28',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(190,'1.',16,'media|default|29','default','media','29',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(191,'1.',16,'price|default|39','default','price','39',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(192,'1.',16,'price|default|40','default','price','40',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(193,'1.',16,'text|default|157','default','text','157',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(194,'1.',16,'text|default|158','default','text','158',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(195,'1.',16,'text|default|159','default','text','159',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(196,'1.',16,'text|default|160','default','text','160',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(197,'1.',16,'text|default|161','default','text','161',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(198,'1.',16,'text|default|162','default','text','162',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(199,'1.',16,'text|default|163','default','text','163',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(200,'1.',16,'catalog|default|13','default','catalog','13',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(201,'1.',16,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(202,'1.',16,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',7,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(203,'1.',17,'media|default|30','default','media','30',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(204,'1.',17,'media|default|31','default','media','31',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(205,'1.',17,'price|default|41','default','price','41',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(206,'1.',17,'price|default|42','default','price','42',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(207,'1.',17,'text|default|164','default','text','164',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(208,'1.',17,'text|default|165','default','text','165',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(209,'1.',17,'text|default|166','default','text','166',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(210,'1.',17,'text|default|167','default','text','167',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(211,'1.',17,'text|default|168','default','text','168',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(212,'1.',17,'text|default|169','default','text','169',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(213,'1.',17,'text|default|170','default','text','170',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(214,'1.',17,'catalog|default|14','default','catalog','14',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(215,'1.',17,'catalog|default|1','default','catalog','1',NULL,NULL,'[]',7,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(216,'1.',17,'catalog|default|2','default','catalog','2',NULL,NULL,'[]',9,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_product_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_list_type`
--

DROP TABLE IF EXISTS `mshop_product_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprolity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msprolity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msprolity_label_sid` (`label`,`siteid`),
  KEY `idx_msprolity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_list_type`
--

LOCK TABLES `mshop_product_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_product_list_type` DISABLE KEYS */;
INSERT INTO `mshop_product_list_type` VALUES
(1,'1.','attribute','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','attribute','config','Configurable',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','attribute','variant','Variant',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','attribute','hidden','Hidden',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','attribute','custom','Custom value',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.','catalog','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(7,'1.','catalog','promotion','Promotion',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(8,'1.','media','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(9,'1.','price','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(10,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(11,'1.','product','suggestion','Suggestion',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(12,'1.','product','bought-together','Bought together',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(13,'1.','tag','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(14,'1.','text','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_product_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_property`
--

DROP TABLE IF EXISTS `mshop_product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspropr_pid_ty_lid_val_sid` (`parentid`,`type`,`langid`,`value`,`siteid`),
  KEY `idx_mspropr_key_sid` (`key`,`siteid`),
  KEY `fk_mspropr_pid` (`parentid`),
  CONSTRAINT `fk_mspropr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_property`
--

LOCK TABLES `mshop_product_property` WRITE;
/*!40000 ALTER TABLE `mshop_product_property` DISABLE KEYS */;
INSERT INTO `mshop_product_property` VALUES
(1,'1.',1,'package-length|null|20.00','package-length',NULL,'20.00','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.',1,'package-width|null|10.00','package-width',NULL,'10.00','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.',1,'package-height|null|5.00','package-height',NULL,'5.00','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.',1,'package-weight|null|2.5','package-weight',NULL,'2.5','2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_property_type`
--

DROP TABLE IF EXISTS `mshop_product_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproprty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msproprty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msproprty_label_sid` (`label`,`siteid`),
  KEY `idx_msproprty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_property_type`
--

LOCK TABLES `mshop_product_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_product_property_type` DISABLE KEYS */;
INSERT INTO `mshop_product_property_type` VALUES
(1,'1.','product','package-height','Package height',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','product','package-length','Package length',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','product','package-width','Package width',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','product','package-weight','Package weight',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_product_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_type`
--

DROP TABLE IF EXISTS `mshop_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msproty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msproty_label_sid` (`label`,`siteid`),
  KEY `idx_msproty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_type`
--

LOCK TABLES `mshop_product_type` WRITE;
/*!40000 ALTER TABLE `mshop_product_type` DISABLE KEYS */;
INSERT INTO `mshop_product_type` VALUES
(1,'1.','product','default','Article',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','product','bundle','Bundle',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','product','event','Event',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','product','group','Group',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','product','select','Selection',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.','product','voucher','Voucher',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_review`
--

DROP TABLE IF EXISTS `mshop_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `customerid` varchar(36) DEFAULT NULL,
  `ordprodid` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT -1,
  `rating` smallint(6) NOT NULL DEFAULT 0,
  `comment` text NOT NULL DEFAULT '',
  `response` text NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msrev_cid_dom_rid_sid` (`customerid`,`domain`,`refid`,`siteid`),
  KEY `idx_msrev_dom_rid_sta_ct_sid` (`domain`,`refid`,`status`,`ctime`,`siteid`),
  KEY `idx_msrev_dom_rid_sta_rate_sid` (`domain`,`refid`,`status`,`rating`,`siteid`),
  KEY `idx_msrev_dom_cid_mt_sid` (`domain`,`customerid`,`mtime`,`siteid`),
  KEY `idx_msrev_rate_dom_sid` (`rating`,`domain`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_review`
--

LOCK TABLES `mshop_review` WRITE;
/*!40000 ALTER TABLE `mshop_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_rule`
--

DROP TABLE IF EXISTS `mshop_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `provider` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `config` text NOT NULL DEFAULT '{}',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msrul_prov_sid` (`provider`,`siteid`),
  KEY `idx_msrul_status_sid` (`status`,`siteid`),
  KEY `idx_msrul_label_sid` (`label`,`siteid`),
  KEY `idx_msrul_pos_sid` (`pos`,`siteid`),
  KEY `idx_msrul_start_sid` (`start`,`siteid`),
  KEY `idx_msrul_end_sid` (`end`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_rule`
--

LOCK TABLES `mshop_rule` WRITE;
/*!40000 ALTER TABLE `mshop_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_rule_type`
--

DROP TABLE IF EXISTS `mshop_rule_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_rule_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msrulty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msrulty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msrulty_label_sid` (`label`,`siteid`),
  KEY `idx_msrulty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_rule_type`
--

LOCK TABLES `mshop_rule_type` WRITE;
/*!40000 ALTER TABLE `mshop_rule_type` DISABLE KEYS */;
INSERT INTO `mshop_rule_type` VALUES
(1,'1.','rule','catalog','Catalog',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_rule_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service`
--

DROP TABLE IF EXISTS `mshop_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `provider` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msser_siteid_code_sid` (`code`,`siteid`),
  KEY `idx_msser_stat_start_end_sid` (`status`,`start`,`end`,`siteid`),
  KEY `idx_msser_prov_sid` (`provider`,`siteid`),
  KEY `idx_msser_code_sid` (`code`,`siteid`),
  KEY `idx_msser_label_sid` (`label`,`siteid`),
  KEY `idx_msser_pos_sid` (`pos`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service`
--

LOCK TABLES `mshop_service` WRITE;
/*!40000 ALTER TABLE `mshop_service` DISABLE KEYS */;
INSERT INTO `mshop_service` VALUES
(1,'1.','delivery','demo-pickup','Standard,Time,Supplier','Click & Collect',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','delivery','demo-dhl','Standard','DHL',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.','delivery','demo-dhlexpress','Standard','DHL Express',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.','delivery','demo-fedex','Standard','Fedex',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.','delivery','demo-tnt','Standard','TNT',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','payment','demo-invoice','PostPay','Invoice',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','payment','demo-sepa','DirectDebit','Direct debit',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','payment','demo-paypal','PayPalExpress','PayPal',NULL,NULL,'{\"paypalexpress.AccountEmail\":\"selling2@metaways.de\",\"paypalexpress.ApiUsername\":\"unit_1340199666_biz_api1.yahoo.de\",\"paypalexpress.ApiPassword\":\"1340199685\",\"paypalexpress.ApiSignature\":\"A34BfbVoMVoHt7Sf8BlufLXS8tKcAVxmJoDiDUgBjWi455pJoZXGoJ87\",\"paypalexpress.PaypalUrl\":\"https:\\/\\/www.sandbox.paypal.com\\/webscr&cmd=_express-checkout&useraction=commit&token=%1$s\",\"paypalexpress.ApiEndpoint\":\"https:\\/\\/api-3t.sandbox.paypal.com\\/nvp\"}',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','payment','demo-cashondelivery','PostPay','Cash on delivery',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','payment','demo-prepay','PrePay,Reduction','Prepayment',NULL,NULL,'{\"reduction.basket-value-min\":{\"EUR\":\"200.00\"},\"reduction.percent\":3}',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service_list`
--

DROP TABLE IF EXISTS `mshop_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` varchar(255) NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_msserli_key_sid` (`key`,`siteid`),
  KEY `fk_msserli_pid` (`parentid`),
  CONSTRAINT `fk_msserli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service_list`
--

LOCK TABLES `mshop_service_list` WRITE;
/*!40000 ALTER TABLE `mshop_service_list` DISABLE KEYS */;
INSERT INTO `mshop_service_list` VALUES
(1,'1.',1,'media|default|32','default','media','32',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.',1,'price|default|43','default','price','43',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.',1,'price|default|44','default','price','44',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.',1,'text|default|171','default','text','171',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.',1,'text|default|172','default','text','172',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.',1,'text|default|173','default','text','173',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.',1,'text|default|174','default','text','174',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.',2,'media|default|33','default','media','33',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.',2,'price|default|45','default','price','45',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.',2,'price|default|46','default','price','46',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.',2,'text|default|175','default','text','175',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.',2,'text|default|176','default','text','176',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.',2,'text|default|177','default','text','177',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.',2,'text|default|178','default','text','178',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.',3,'media|default|34','default','media','34',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.',3,'price|default|47','default','price','47',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.',3,'price|default|48','default','price','48',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(18,'1.',3,'text|default|179','default','text','179',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.',3,'text|default|180','default','text','180',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.',3,'text|default|181','default','text','181',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.',3,'text|default|182','default','text','182',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.',4,'media|default|35','default','media','35',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.',4,'price|default|49','default','price','49',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.',4,'price|default|50','default','price','50',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.',4,'text|default|183','default','text','183',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.',4,'text|default|184','default','text','184',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(27,'1.',4,'text|default|185','default','text','185',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(28,'1.',4,'text|default|186','default','text','186',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(29,'1.',5,'media|default|36','default','media','36',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(30,'1.',5,'price|default|51','default','price','51',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(31,'1.',5,'price|default|52','default','price','52',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(32,'1.',5,'text|default|187','default','text','187',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(33,'1.',5,'text|default|188','default','text','188',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(34,'1.',5,'text|default|189','default','text','189',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(35,'1.',5,'text|default|190','default','text','190',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(36,'1.',6,'media|default|37','default','media','37',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(37,'1.',6,'price|default|53','default','price','53',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(38,'1.',6,'price|default|54','default','price','54',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(39,'1.',6,'text|default|191','default','text','191',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(40,'1.',6,'text|default|192','default','text','192',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(41,'1.',6,'text|default|193','default','text','193',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(42,'1.',6,'text|default|194','default','text','194',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(43,'1.',6,'text|default|195','default','text','195',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(44,'1.',7,'media|default|38','default','media','38',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(45,'1.',7,'media|default|39','default','media','39',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(46,'1.',7,'price|default|55','default','price','55',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(47,'1.',7,'price|default|56','default','price','56',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(48,'1.',7,'text|default|196','default','text','196',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(49,'1.',7,'text|default|197','default','text','197',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(50,'1.',7,'text|default|198','default','text','198',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(51,'1.',7,'text|default|199','default','text','199',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(52,'1.',7,'text|default|200','default','text','200',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(53,'1.',8,'media|default|40','default','media','40',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(54,'1.',8,'price|default|57','default','price','57',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(55,'1.',8,'price|default|58','default','price','58',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(56,'1.',8,'text|default|201','default','text','201',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(57,'1.',8,'text|default|202','default','text','202',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(58,'1.',8,'text|default|203','default','text','203',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(59,'1.',8,'text|default|204','default','text','204',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(60,'1.',9,'media|default|41','default','media','41',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(61,'1.',9,'price|default|59','default','price','59',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(62,'1.',9,'price|default|60','default','price','60',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(63,'1.',9,'text|default|205','default','text','205',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(64,'1.',9,'text|default|206','default','text','206',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(65,'1.',9,'text|default|207','default','text','207',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(66,'1.',9,'text|default|208','default','text','208',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(67,'1.',10,'media|default|42','default','media','42',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(68,'1.',10,'price|default|61','default','price','61',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(69,'1.',10,'price|default|62','default','price','62',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(70,'1.',10,'text|default|209','default','text','209',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(71,'1.',10,'text|default|210','default','text','210',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(72,'1.',10,'text|default|211','default','text','211',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(73,'1.',10,'text|default|212','default','text','212',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(74,'1.',10,'text|default|213','default','text','213',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_service_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service_list_type`
--

DROP TABLE IF EXISTS `mshop_service_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserlity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msserlity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msserlity_label_sid` (`label`,`siteid`),
  KEY `idx_msserlity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service_list_type`
--

LOCK TABLES `mshop_service_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_service_list_type` DISABLE KEYS */;
INSERT INTO `mshop_service_list_type` VALUES
(1,'1.','media','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','price','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','text','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_service_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service_type`
--

DROP TABLE IF EXISTS `mshop_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msserty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msserty_label_sid` (`label`,`siteid`),
  KEY `idx_msserty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service_type`
--

LOCK TABLES `mshop_service_type` WRITE;
/*!40000 ALTER TABLE `mshop_service_type` DISABLE KEYS */;
INSERT INTO `mshop_service_type` VALUES
(1,'1.','service','payment','Payment',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','service','delivery','Delivery',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_stock`
--

DROP TABLE IF EXISTS `mshop_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `prodid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `stocklevel` int(11) DEFAULT NULL,
  `backdate` datetime DEFAULT NULL,
  `timeframe` varchar(16) NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssto_pid_ty_sid` (`prodid`,`type`,`siteid`),
  KEY `idx_mssto_stocklevel_sid` (`stocklevel`,`siteid`),
  KEY `idx_mssto_backdate_sid` (`backdate`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_stock`
--

LOCK TABLES `mshop_stock` WRITE;
/*!40000 ALTER TABLE `mshop_stock` DISABLE KEYS */;
INSERT INTO `mshop_stock` VALUES
(1,'1.','1','default',NULL,NULL,'',NOW() - INTERVAL 1 DAY,'2023-01-11 03:00:27','10.42.0.1'),
(2,'1.','2','default',4,NULL,'',NOW() - INTERVAL 0 DAY,'2023-01-11 03:00:27','10.42.0.1'),
(3,'1.','3','default',0,'2015-01-01 12:00:00','','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.','4','default',10,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.','5','default',3,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.','6','default',4,NULL,'',NOW() - INTERVAL 1 DAY,'2023-01-11 03:00:27','10.42.0.1'),
(7,'1.','7','default',NULL,NULL,'',NOW() - INTERVAL 1 DAY,'2023-01-11 03:00:27','10.42.0.1'),
(8,'1.','8','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','9','default',100,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','10','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','11','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','12','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.','13','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.','14','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.','15','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.','16','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.','17','default',NULL,NULL,'','2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_stock_type`
--

DROP TABLE IF EXISTS `mshop_stock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_stock_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msstoty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_msstoty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_msstoty_label_sid` (`label`,`siteid`),
  KEY `idx_msstoty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_stock_type`
--

LOCK TABLES `mshop_stock_type` WRITE;
/*!40000 ALTER TABLE `mshop_stock_type` DISABLE KEYS */;
INSERT INTO `mshop_stock_type` VALUES
(1,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_stock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_subscription`
--

DROP TABLE IF EXISTS `mshop_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_subscription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `baseid` bigint(20) NOT NULL,
  `ordprodid` bigint(20) NOT NULL,
  `next` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `productid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `interval` varchar(32) NOT NULL,
  `reason` smallint(6) DEFAULT 0,
  `period` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mssub_pid_period_sid` (`productid`,`period`,`siteid`),
  KEY `idx_mssub_next_stat_sid` (`next`,`status`,`siteid`),
  KEY `idx_mssub_opid` (`ordprodid`),
  KEY `idx_mssub_baseid` (`baseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_subscription`
--

LOCK TABLES `mshop_subscription` WRITE;
/*!40000 ALTER TABLE `mshop_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier`
--

DROP TABLE IF EXISTS `mshop_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssup_code_sid` (`code`,`siteid`),
  KEY `idx_mssup_label_sid` (`label`,`siteid`),
  KEY `idx_mssup_sid_stat_pos_label` (`siteid`,`status`,`pos`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier`
--

LOCK TABLES `mshop_supplier` WRITE;
/*!40000 ALTER TABLE `mshop_supplier` DISABLE KEYS */;
INSERT INTO `mshop_supplier` VALUES
(1,'1.','demo-test1','Test supplier 1',1,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.','demo-test2','Test supplier 2',1,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier_address`
--

DROP TABLE IF EXISTS `mshop_supplier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `company` varchar(100) NOT NULL DEFAULT '',
  `vatid` varchar(32) NOT NULL DEFAULT '',
  `salutation` varchar(8) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `firstname` varchar(64) NOT NULL DEFAULT '',
  `lastname` varchar(64) NOT NULL DEFAULT '',
  `address1` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) NOT NULL DEFAULT '',
  `address3` varchar(200) NOT NULL DEFAULT '',
  `postal` varchar(16) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `state` varchar(200) NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `countryid` varchar(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `telefax` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `longitude` double DEFAULT 0,
  `latitude` double DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `pos` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mssupad_pid` (`parentid`),
  CONSTRAINT `fk_mssupad_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier_address`
--

LOCK TABLES `mshop_supplier_address` WRITE;
/*!40000 ALTER TABLE `mshop_supplier_address` DISABLE KEYS */;
INSERT INTO `mshop_supplier_address` VALUES
(1,'1.',1,'Test company','DE999999999','company','','','','Test street','1','','10000','Test city','NY',NULL,'US','','','demo1@example.com','',NULL,NULL,NULL,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.',2,'Test company','DE999999999','company','','','','Test road','10','','20000','Test town','NY',NULL,'US','','','demo2@example.com','',NULL,NULL,NULL,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_supplier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier_list`
--

DROP TABLE IF EXISTS `mshop_supplier_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssupli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_mssupli_key_sid` (`key`,`siteid`),
  KEY `fk_mssupli_pid` (`parentid`),
  CONSTRAINT `fk_mssupli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier_list`
--

LOCK TABLES `mshop_supplier_list` WRITE;
/*!40000 ALTER TABLE `mshop_supplier_list` DISABLE KEYS */;
INSERT INTO `mshop_supplier_list` VALUES
(1,'1.',1,'media|default|5','default','media','5',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(2,'1.',1,'text|default|18','default','text','18',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(3,'1.',1,'text|default|19','default','text','19',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(4,'1.',1,'text|default|20','default','text','20',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(5,'1.',1,'text|default|21','default','text','21',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(6,'1.',1,'text|default|22','default','text','22',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.',1,'text|default|23','default','text','23',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.',1,'text|default|24','default','text','24',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.',2,'media|default|6','default','media','6',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.',2,'text|default|25','default','text','25',NULL,NULL,'[]',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.',2,'text|default|26','default','text','26',NULL,NULL,'[]',1,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.',2,'text|default|27','default','text','27',NULL,NULL,'[]',2,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.',2,'text|default|28','default','text','28',NULL,NULL,'[]',3,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.',2,'text|default|29','default','text','29',NULL,NULL,'[]',4,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.',2,'text|default|30','default','text','30',NULL,NULL,'[]',5,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.',2,'text|default|31','default','text','31',NULL,NULL,'[]',6,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_supplier_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier_list_type`
--

DROP TABLE IF EXISTS `mshop_supplier_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssuplity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mssuplity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mssuplity_sid_label_sid` (`label`,`siteid`),
  KEY `idx_mssuplity_sid_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier_list_type`
--

LOCK TABLES `mshop_supplier_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_supplier_list_type` DISABLE KEYS */;
INSERT INTO `mshop_supplier_list_type` VALUES
(1,'1.','attribute','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','product','promotion','Promotion',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','media','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','text','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_supplier_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_tag`
--

DROP TABLE IF EXISTS `mshop_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstag_dom_ty_lid_lab_sid` (`domain`,`type`,`langid`,`label`,`siteid`),
  KEY `idx_mstag_dom_langid_sid` (`langid`,`domain`,`siteid`),
  KEY `idx_mstag_dom_label_sid` (`label`,`domain`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_tag`
--

LOCK TABLES `mshop_tag` WRITE;
/*!40000 ALTER TABLE `mshop_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_tag_type`
--

DROP TABLE IF EXISTS `mshop_tag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstagty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mstagty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mstagty_label_sid` (`label`,`siteid`),
  KEY `idx_mstagty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_tag_type`
--

LOCK TABLES `mshop_tag_type` WRITE;
/*!40000 ALTER TABLE `mshop_tag_type` DISABLE KEYS */;
INSERT INTO `mshop_tag_type` VALUES
(1,'1.','catalog','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `mshop_tag_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text`
--

DROP TABLE IF EXISTS `mshop_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `domain` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mstex_dom_stat_sid` (`domain`,`status`,`siteid`),
  KEY `idx_mstex_langid_sid` (`langid`,`siteid`),
  KEY `idx_mstex_label_sid` (`label`,`siteid`),
  KEY `idx_mstex_sid_dom_cont` (`siteid`,`domain`,`content`(255))
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text`
--

LOCK TABLES `mshop_text` WRITE;
/*!40000 ALTER TABLE `mshop_text` DISABLE KEYS */;
INSERT INTO `mshop_text` VALUES
(1,'1.','name','de','catalog','Demo name/de: Start','Start',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','url','de','catalog','Demo url/de: Start','Start',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','short','de','catalog','Demo short/de: Dies ist der Kurztext','Dies ist der Kurztext für die Hauptkategorie ihres neuen Webshops.',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','short','en','catalog','Demo short/en: This is the short text','This is the short text for the main category of your new web shop.',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','long','de','catalog','Demo long/de: Hier kann eine ausführliche Einleitung','Hier kann eine ausführliche Einleitung für ihre Hauptkategorie stehen.',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.','long','en','catalog','Demo long/en: Here you can add a long introduction','Here you can add a long introduction for you main category.',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(7,'1.','meta-description',NULL,'catalog','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(8,'1.','short','de','catalog','Best seller kurz','<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(9,'1.','short','en','catalog','Best seller short','<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(10,'1.','meta-description',NULL,'catalog','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(11,'1.','short','de','catalog','New arrivals kurz','<p><strong>Sommer 2021-2022</strong></p><p>Neue Collection eingetroffen</p>',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(12,'1.','short','en','catalog','New arrivals short','<p><strong>Summer 2021-2022</strong></p><p>New collection available</p>',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(13,'1.','meta-description',NULL,'catalog','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(14,'1.','short','de','catalog','Hot deals kurz','<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(15,'1.','short','en','catalog','Hot deals short','<p>Up to <strong>30%</strong> discount<br />on selected items</p>',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(16,'1.','meta-description',NULL,'catalog','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(17,'1.','content',NULL,'cms','Demo content: Home','{\"css\":\"img{max-width:100%;}form{padding-top:10px;}.container-xl{min-height:2.5rem !important;}.row{min-height:2.5rem !important;}.col, [class^=\\\"col-\\\"]{min-height:2.5rem !important;}.row{display:flex;width:auto;}.gjs-dashed .container-xl, .gjs-dashed .row, .gjs-dashed .space{padding-top:10px;padding-right:0px;padding-bottom:10px;padding-left:0px;}.table .row{display:table-row;}.table .cell{width:auto;height:auto;}::-webkit-scrollbar{background-color:var(--bs-bg, #f8fafc);width:0.25rem;}::-webkit-scrollbar-thumb{background-color:rgb(80, 88, 96);outline-color:initial;outline-style:none;outline-width:initial;}body{background-image:none;background-color:rgb(248, 250, 252);}.cataloglist{display:block;max-height:350px;overflow-x:hidden;overflow-y:hidden;white-space:nowrap;}.product{display:inline-block;width:240px;height:320px;margin-top:14px;margin-right:14px;margin-bottom:14px;margin-left:14px;background-color:rgb(232, 236, 239);}.contact-form .contact-pot{display:none;}#iz45jf{background-image:url(\\\"https://aimeos.org/media/default/background.webp\\\");}#ihpseq{display:inline-block;min-height:50px;width:100%;}#ikvn3f{display:inline-block;min-height:50px;width:100%;}#ihy2hl{display:inline-block;min-height:50px;width:100%;}#i4rmlj{display:inline-block;min-height:50px;width:100%;}#iid4ih{letter-spacing:normal;}#i4wrp-2{letter-spacing:normal;}#ib6hol{letter-spacing:normal;}\",\"html\":\"<div class=\\\"row g-0\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-gutters=\\\"g-0\\\" data-break=\\\"col-sm\\\"><div class=\\\"col-sm\\\"><a title=\\\"Accessories\\\" href=\\\"/shop\\\" id=\\\"io0s6g\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-top-1.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-top-1.webp 480w, https://aimeos.org/media/default/content-top-1.webp 600w\\\" alt=\\\"Accessories\\\" id=\\\"iae6\\\"/></a></div><div class=\\\"col-sm\\\"><a title=\\\"Women\'s clothing\\\" href=\\\"/shop\\\" id=\\\"i91mut\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-top-2.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-top-2.webp 480w, https://aimeos.org/media/default/content-top-2.webp 600w\\\" alt=\\\"Women\'s clothing\\\" id=\\\"idoo\\\"/></a></div><div class=\\\"col-sm\\\"><a title=\\\"Casual trends\\\" href=\\\"/shop\\\" id=\\\"ix4qff\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-top-3.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-top-3.webp 480w, https://aimeos.org/media/default/content-top-3.webp 600w\\\" alt=\\\"Casual trends\\\" id=\\\"igo4\\\"/></a></div></div><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><h2>Top Seller</h2><cataloglist class=\\\"cataloglist\\\" limit=\\\"6\\\" type=\\\"default\\\" catid=\\\"2\\\"><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div></cataloglist></div><div class=\\\"row g-0\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-gutters=\\\"g-0\\\" data-break=\\\"col-md\\\"><div class=\\\"col-md\\\"><a title=\\\"40% discount\\\" href=\\\"/shop\\\" id=\\\"is5n8h\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-mid-1.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-mid-1.webp 480w\\\" alt=\\\"40% discount\\\" id=\\\"ig0kh\\\"/></a></div><div class=\\\"col-md\\\"><a href=\\\"/shop\\\" title=\\\"Discount deals\\\" id=\\\"ibvrdg\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-mid-2.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-mid-2.webp 480w\\\" alt=\\\"Discount deals\\\" id=\\\"ii2my\\\"/></a></div></div><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><h2 id=\\\"ixboc\\\">New Products</h2><cataloglist class=\\\"cataloglist\\\" limit=\\\"6\\\" type=\\\"default\\\" catid=\\\"13\\\"><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div></cataloglist></div><div class=\\\"background lazy-image\\\" data-background=\\\"https://aimeos.org/media/default/background.webp 480w, https://aimeos.org/media/default/background.webp 960w, https://aimeos.org/media/default/background.webp 1903w\\\" id=\\\"iz45jf\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><div><p id=\\\"ix988m\\\"><span id=\\\"iid4ih\\\">YOUR STYLE - YOUR ATTITUDE</span><br draggable=\\\"true\\\" data-highlightable=\\\"1\\\" id=\\\"i4wrp-2\\\"/><span id=\\\"ib6hol\\\">Select your unique style</span></p></div><a href=\\\"/shop\\\" title=\\\"Unique styles\\\" class=\\\"btn\\\">Take a look</a></div></div><div class=\\\"background\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><h2 id=\\\"iq09l\\\">Hot Deals</h2><cataloglist class=\\\"cataloglist\\\" limit=\\\"6\\\" type=\\\"default\\\" catid=\\\"14\\\"><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div><div class=\\\"product\\\"></div></cataloglist></div></div><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><h2>What&#039;s New</h2><div class=\\\"row\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-break=\\\"col-lg\\\" data-gutters=\\\"\\\"><div class=\\\"col-lg\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><div class=\\\"row\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-gutters=\\\"\\\" data-break=\\\"col-sm\\\"><div class=\\\"col-sm\\\"><a href=\\\"/shop\\\" title=\\\"New arrivals\\\" id=\\\"ikvn3f\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-bottom-1.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-bottom-1.webp 480w, https://aimeos.org/media/default/content-bottom-1.webp 600w\\\" alt=\\\"New arrivals\\\" id=\\\"infyh\\\"/></a></div><div class=\\\"col-sm\\\"><h3 id=\\\"if35b\\\">NEW ARRIVALS</h3><div id=\\\"iwj6a\\\"><p id=\\\"irl1k\\\">Our new collection covers the latest fashion trends. Check out what&#039;s hot this summer!</p></div></div></div></div></div><div class=\\\"col-lg\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><div class=\\\"row\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-break=\\\"col-sm\\\"><div class=\\\"col-sm\\\"><a title=\\\"Cool fashion\\\" href=\\\"/shop\\\" id=\\\"ihpseq\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-bottom-2.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-bottom-2.webp 480w, https://aimeos.org/media/default/content-bottom-2.webp 600w\\\" alt=\\\"Best sellers\\\" id=\\\"izstt\\\"/></a></div><div class=\\\"col-sm\\\"><h3 id=\\\"i8ekd\\\">COOL FASHION</h3><div id=\\\"i2xnz7\\\"><p>Cool styles for cool people! Get your own trending look for this summer season.</p></div></div></div></div></div></div><div class=\\\"row\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-break=\\\"col-lg\\\" data-gutters=\\\"\\\"><div class=\\\"col-lg\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><div class=\\\"row\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-break=\\\"col-sm\\\" data-gutters=\\\"\\\"><div class=\\\"col-sm\\\"><a title=\\\"Best sellers\\\" href=\\\"/shop\\\" id=\\\"ihy2hl\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-bottom-3.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-bottom-3.webp 480w, https://aimeos.org/media/default/content-bottom-3.webp 600w\\\" alt=\\\"Best sellers\\\" id=\\\"i8848\\\"/></a><div id=\\\"i6649q\\\"></div></div><div class=\\\"col-sm\\\"><h3 id=\\\"isv17\\\">BEST SELLERS</h3><p id=\\\"ivkql\\\">Check out our best sellers! High quality accessories and basics at lowest prices!</p></div></div></div></div><div class=\\\"col-lg\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><div class=\\\"row\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-break=\\\"col-sm\\\" data-gutters=\\\"\\\"><div class=\\\"col-sm\\\"><a title=\\\"Casual styles\\\" id=\\\"i4rmlj\\\" href=\\\"/shop\\\" class=\\\"space\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/content-bottom-4.webp\\\" srcset=\\\"https://aimeos.org/media/default/content-bottom-4.webp 480w, https://aimeos.org/media/default/content-bottom-4.webp 600w\\\" alt=\\\"Casual styles\\\" id=\\\"ieoqf\\\"/></a><div id=\\\"i0ld9x\\\"></div></div><div class=\\\"col-sm\\\"><h3>CASUAL STYLES</h3><p>We support your custom style with a large amount of fashion basics from major brands.</p></div></div></div></div></div></div><div class=\\\"background\\\"><div class=\\\"container-xl\\\" data-gjs-name=\\\"Container\\\"><div class=\\\"row g-0\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-gutters=\\\"g-0\\\"><div class=\\\"col\\\"><div class=\\\"row g-0\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-gutters=\\\"g-0\\\"><div class=\\\"col\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/logo-1.png\\\" srcset=\\\"https://aimeos.org/media/default/logo-1.png 240w\\\" alt=\\\"Ballroom\\\" id=\\\"immyok\\\"/></div><div class=\\\"col\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/logo-2.png\\\" srcset=\\\"https://aimeos.org/media/default/logo-2.png 240w\\\" alt=\\\"C-Story\\\" id=\\\"iuvnw1\\\"/></div></div></div><div class=\\\"col\\\"><div class=\\\"row g-0\\\" data-gjs-droppable=\\\".col\\\" data-gjs-name=\\\"Row\\\" data-gutters=\\\"g-0\\\"><div class=\\\"col\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/logo-3.png\\\" srcset=\\\"https://aimeos.org/media/default/logo-3.png 240w\\\" alt=\\\"Sergio\\\" id=\\\"i71vzg\\\"/></div><div class=\\\"col\\\"><img loading=\\\"lazy\\\" src=\\\"https://aimeos.org/media/default/logo-4.png\\\" srcset=\\\"https://aimeos.org/media/default/logo-4.png 240w\\\" id=\\\"ikylxg\\\" alt=\\\"H&R\\\"/></div></div></div></div></div></div>\"}',1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(18,'1.','name','de','supplier','Demo name/de: Demo Händler','Demo-Händler',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.','short','de','supplier','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demo-Händlers',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.','long','de','supplier','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.','name','en','supplier','Demo name/en: Demo supplier','Demo supplier',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.','short','en','supplier','Demo short/en: This is the short description','This is the short description of the demo supplier.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.','long','en','supplier','Demo long/en: Add a detailed description','Add a detailed description of the demo supplier that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.','meta-description',NULL,'supplier','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.','name','de','supplier','Demo name/de: Demo Händler 2','Demo-Händler 2',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.','short','de','supplier','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demo-Händlers 2',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(27,'1.','long','de','supplier','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(28,'1.','name','en','supplier','Demo name/en: Demo supplier 2','Demo supplier 2',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(29,'1.','short','en','supplier','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(30,'1.','long','en','supplier','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(31,'1.','meta-description',NULL,'supplier','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(32,'1.','name','de','attribute','Demo name/de: Schwarz','Schwarz',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(33,'1.','name','en','attribute','Demo name/en: Black','Black',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(34,'1.','url','de','attribute','Demo url/de: Schwarz','Schwarz',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(35,'1.','url','en','attribute','Demo url/en: Black','Black',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(36,'1.','name','de','attribute','Demo name/de: Kleiner Aufdruck','Kleiner Aufdruck',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(37,'1.','name','en','attribute','Demo name/en: Small print','Small print',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(38,'1.','url','de','attribute','Demo url/de: Kleiner Aufdruck','Kleiner-Aufdruck',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(39,'1.','url','en','attribute','Demo url/en: Small print','small-print',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(40,'1.','name','de','attribute','Demo name/de: Kleiner Aufdruck','Text Aufdruck',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(41,'1.','name','en','attribute','Demo name/en: Small print','print text',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(42,'1.','name','de','attribute','Demo name/de: Ein Monat','1 Monat',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(43,'1.','name','en','attribute','Demo name/en: One Month','1 month',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(44,'1.','name','de','attribute','Demo name/de: Ein Jahr','1 Jahr',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(45,'1.','name','en','attribute','Demo name/en: One year','1 year',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(46,'1.','name','de','attribute','Demo name/de: Grosser Aufdruck','Grosser Aufdruck',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(47,'1.','name','en','attribute','Demo name/en: Large print','Large print',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(48,'1.','url','de','attribute','Demo url/de: Grosser Aufdruck','Grosser-Aufdruck',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(49,'1.','url','en','attribute','Demo url/en: Large print','large-print',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(50,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(51,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(52,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(53,'1.','name','en','product','Demo name/en: Demo article','Demo article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(54,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(55,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(56,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(57,'1.','name','de','attribute','Demo name/de: Blau','Blau',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(58,'1.','url','de','attribute','Demo url/de: Blau','Blau',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(59,'1.','name','en','attribute','Demo name/en: Blue','Blue',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(60,'1.','url','en','attribute','Demo url/en: Blue','blue',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(61,'1.','name',NULL,'attribute','Demo name: Width 32','32',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(62,'1.','url','de','attribute','Demo url: Width 32','Weite-32',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(63,'1.','url','en','attribute','Demo url: Width 32','width-32',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(64,'1.','name',NULL,'attribute','Demo name: Length 34','34',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(65,'1.','url','de','attribute','Demo url: Length 34','Länge-34',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(66,'1.','url','en','attribute','Demo url: Length 34','length-34',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(67,'1.','name','de','attribute','Demo name/de: Beige','Beige',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(68,'1.','url','de','attribute','Demo url/de: Beige','Beige',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(69,'1.','name','en','attribute','Demo name/en: Beige','Beige',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(70,'1.','url','en','attribute','Demo url/en: Beige','beige',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(71,'1.','name',NULL,'attribute','Demo name: Width 33','33',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(72,'1.','url','de','attribute','Demo url: Width 33','Weite-33',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(73,'1.','url','en','attribute','Demo url: Width 33','width-33',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(74,'1.','name',NULL,'attribute','Demo name: Length 36','36',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(75,'1.','url',NULL,'attribute','Demo url: Length 36','Länge-36',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(76,'1.','url',NULL,'attribute','Demo url: Length 36','length-36',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(77,'1.','name','de','product','Demo name/de: Demoartikel mit Auswahl','Demoartikel mit Auswahl',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(78,'1.','url','de','product','Demo url/de: Demoartikel mit Auswahl','Demoartikel-mit-Auswahl',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(79,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels mit Auswahl',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(80,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels mit Auswahl, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(81,'1.','name','en','product','Demo name/en: Demo selection article','Demo selection article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(82,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the selection demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(83,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the selection demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(84,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(85,'1.','name','de','attribute','Demo name/de: Kleines Etikett','Kleines Etikett',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(86,'1.','name','en','attribute','Demo name/en: Small sticker','Small sticker',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(87,'1.','url','de','attribute','Demo url/de: Kleines Etikett','Kleines-Etikett',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(88,'1.','url','en','attribute','Demo url/en: Small sticker','small-sticker',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(89,'1.','name','de','attribute','Demo name/de: Grosses Etikett','Großes Etikett',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(90,'1.','name','en','attribute','Demo name/en: Large sticker','Large sticker',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(91,'1.','url','de','attribute','Demo url/de: Grosses Etikett','Grosses-Etikett',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(92,'1.','url','en','attribute','Demo url/en: Large sticker','large-sticker',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(93,'1.','name','de','product','Demo name/de: Demoartikel mit Bundle','Demoartikel mit Bundle',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(94,'1.','url','de','product','Demo url/de: Demoartikel mit Bundle','Demoartikel-mit-Bundle',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(95,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels mit Bundle',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(96,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels mit Bundle, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(97,'1.','name','en','product','Demo name/en: Demo bundle article','Demo bundle article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(98,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the bundle demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(99,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the bundle demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(100,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(101,'1.','name','de','attribute','name/de: Gutscheinwert','Gutscheinwert',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(102,'1.','name','en','attribute','name/en: Voucher value','Voucher value',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(103,'1.','name','de','attribute','Demo name/de: Kundendatum','Kundendatum',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(104,'1.','name','en','attribute','Demo name/en: Customer date','Customer date',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(105,'1.','name','de','product','Demo name/de: Gutschein','Demo-Gutschein',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(106,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demo-Gutscheins',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(107,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Gutscheins, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(108,'1.','name','en','product','Demo name/en: Demo article','Demo voucher',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(109,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo voucher.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(110,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo voucher that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(111,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(112,'1.','name','de','product','Demo name/de: Demoevent article','Demoevent article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(113,'1.','url','de','product','Demo url/de: Demoevent article','Demoevent article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(114,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoevents',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(115,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Demoevents, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(116,'1.','name','en','product','Demo name/en: Demoevent article','Demo event article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(117,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the event demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(118,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the event demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(119,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(120,'1.','name','de','product','Demo name/de: Demo-Gruppenartikel','Demo-Gruppenartikel',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(121,'1.','url','de','product','Demo url/de: Demo-Gruppenartikel','Demo-Gruppenartikel',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(122,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demo-Gruppenartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(123,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Gruppenartikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(124,'1.','name','en','product','Demo name/en: Demo group article','Demo group article',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(125,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the group demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(126,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the group demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(127,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(128,'1.','name','de','product','Demo name/de: Rabatt','Demorabatt',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(129,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel 2',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(130,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(131,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(132,'1.','name','en','product','Demo name/en: Demo article','Demo article 2',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(133,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(134,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(135,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(136,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel 3',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(137,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(138,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(139,'1.','name','en','product','Demo name/en: Demo article','Demo article 3',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(140,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(141,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(142,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(143,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel 4',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(144,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(145,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(146,'1.','name','en','product','Demo name/en: Demo article','Demo article 4',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(147,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(148,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(149,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(150,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel 5',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(151,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(152,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(153,'1.','name','en','product','Demo name/en: Demo article','Demo article 5',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(154,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(155,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(156,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(157,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel 6',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(158,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(159,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(160,'1.','name','en','product','Demo name/en: Demo article','Demo article 6',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(161,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(162,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(163,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(164,'1.','name','de','product','Demo name/de: Demoartikel','Demoartikel 7',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(165,'1.','short','de','product','Demo short/de: Dies ist die Kurzbeschreibung','Dies ist die Kurzbeschreibung des Demoartikels',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(166,'1.','long','de','product','Demo long/de: Hier folgt eine ausführliche Beschreibung','Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(167,'1.','name','en','product','Demo name/en: Demo article','Demo article 7',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(168,'1.','short','en','product','Demo short/en: This is the short description','This is the short description of the demo article.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(169,'1.','long','en','product','Demo long/en: Add a detailed description','Add a detailed description of the demo article that may be a little bit longer.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(170,'1.','meta-description',NULL,'product','Demo meta-description','Meta descriptions are important because they are shown in the search engine result page',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(171,'1.','short','de','service','Demo short/de: Abholung vor Ort','Abholung vor Ort',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(172,'1.','long','de','service','Demo long/de: Abholung vor Ort','Abholung vor Ort bei einem unserer Läden',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(173,'1.','short','en','service','Demo short/en: Local pick-up','Local pick-up',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(174,'1.','long','en','service','Demo long/en: Local pick-up','Pick-up at one of our local stores',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(175,'1.','short','de','service','Demo short/de: Lieferung innerhalb von drei Tagen','Lieferung innerhalb von drei Tagen.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(176,'1.','long','de','service','Demo long/de: Die Lieferung erfolgt in der Regel','Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(177,'1.','short','en','service','Demo short/en: Delivery within three days','Delivery within three days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(178,'1.','long','en','service','Demo long/en: The parcel is usually delivered','The parcel is usually delivered within three working days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(179,'1.','short','de','service','Demo short/de: Lieferung am nächsten Tag','Lieferung am nächsten Tag.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(180,'1.','long','de','service','Demo long/de: Bei Bestellungen bis 16:00 Uhr','Bei Bestellungen bis 16:00 Uhr erfolgt die Lieferung am nächsten Werktag',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(181,'1.','short','en','service','Demo short/en: Delivery on the next day','Delivery on the next day',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(182,'1.','long','en','service','Demo long/en: If you order till 16 o\'clock','If you order till 16 o\'clock the delivery will be on the next working day',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(183,'1.','short','de','service','Demo short/de: Lieferung innerhalb von drei Tagen','Lieferung innerhalb von drei Tagen.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(184,'1.','long','de','service','Demo long/de: Die Lieferung erfolgt in der Regel','Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(185,'1.','short','en','service','Demo short/en: Delivery within three days','Delivery within three days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(186,'1.','long','en','service','Demo long/en: The parcel is usually delivered','The parcel is usually delivered within three working days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(187,'1.','short','de','service','Demo short/de: Lieferung innerhalb von drei Tagen','Lieferung innerhalb von drei Tagen.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(188,'1.','long','de','service','Demo long/de: Die Lieferung erfolgt in der Regel','Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(189,'1.','short','en','service','Demo short/en: Delivery within three days','Delivery within three days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(190,'1.','long','en','service','Demo long/en: The parcel is usually delivered','The parcel is usually delivered within three working days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(191,'1.','name','de','service','Demo name/de: Rechnung','Rechnung',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(192,'1.','short','de','service','Demo short/de: Zahlung per Rechnung','Zahlung per Rechnung innerhalb von 14 Tagen.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(193,'1.','long','de','service','Demo long/de: Bitte überweisen Sie den Betrag','Bitte überweisen Sie den Betrag innerhalb von 14 Tagen an BIC: XXX, IBAN: YYY',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(194,'1.','short','en','service','Demo short/en: Pay by invoice','Pay by invoice within 14 days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(195,'1.','long','en','service','Demo long/en: Please transfer the money','Please transfer the money within 14 days to BIC: XXX, IBAN: YYY',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(196,'1.','name','de','service','Demo name/de: Lastschrift','Lastschrift',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(197,'1.','short','de','service','Demo short/de: Abbuchung vom angegebenen Konto','Abbuchung vom angegebenen Konto.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(198,'1.','long','de','service','Demo long/de: Der Betrag wird in den nächsten 1-3 Tagen','Der Betrag wird in den nächsten 1-3 Tagen von Ihrem Konto abgebucht',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(199,'1.','short','en','service','Demo short/en: Payment via your bank account','Payment via your bank account',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(200,'1.','long','en','service','Demo long/en: The money will be collected','The money will be collected from your bank account within 1-3 days',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(201,'1.','short','de','service','Demo short/de: Zahlung mit ihrem PayPal Konto','Zahlung mit PayPal',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(202,'1.','long','de','service','Demo long/de: Einfache Bezahlung mit Ihrem PayPal Konto','Einfache Bezahlung mit Ihrem PayPal Konto.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(203,'1.','short','en','service','Demo short/en: Payment via your PayPal account','Payment via PayPal',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(204,'1.','long','en','service','Demo long/en: Easy and secure payment with your PayPal account','Easy and secure payment with your PayPal account',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(205,'1.','name','de','service','Demo name/de: Nachnahme','Nachnahme',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(206,'1.','short','de','service','Demo short/de: Zahlung bei Lieferung','Zahlung bei Lieferung.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(207,'1.','long','de','service','Demo long/de: Die Bezahlung erfolgt bei Übergabe der Ware','Die Bezahlung erfolgt bei Übergabe der Ware',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(208,'1.','short','en','service','Demo short/en: Pay cash on delivery of the parcel','Pay cash on delivery of the parcel',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(209,'1.','name','de','service','Demo name/de: Vorauskasse','Vorauskasse',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(210,'1.','short','de','service','Demo short/de: Versand der Ware nach Zahlungseingang','3% Rabatt, Versand der Ware nach Zahlungseingang.',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(211,'1.','long','de','service','Demo long/de: Bitte überweisen Sie den Betrag','Bitte überweisen Sie den Betrag an BIC: XXX, IBAN: YYY',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(212,'1.','short','en','service','Demo short/en: The parcel will be shipped after the payment has been received','3% discount, the parcel will be shipped after the payment has been received',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(213,'1.','long','en','service','Demo long/en: Please transfer the money','Please transfer the money to BIC: XXX, IBAN: YYY',1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text_list`
--

DROP TABLE IF EXISTS `mshop_text_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL DEFAULT '{}',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_mstexli_key_sid` (`key`,`siteid`),
  KEY `fk_mstexli_pid` (`parentid`),
  CONSTRAINT `fk_mstexli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text_list`
--

LOCK TABLES `mshop_text_list` WRITE;
/*!40000 ALTER TABLE `mshop_text_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_text_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text_list_type`
--

DROP TABLE IF EXISTS `mshop_text_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexlity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mstexlity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mstexlity_label` (`label`,`siteid`),
  KEY `idx_mstexlity_code` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text_list_type`
--

LOCK TABLES `mshop_text_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_text_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_text_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text_type`
--

DROP TABLE IF EXISTS `mshop_text_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_mstexty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_mstexty_label_sid` (`label`,`siteid`),
  KEY `idx_mstexty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text_type`
--

LOCK TABLES `mshop_text_type` WRITE;
/*!40000 ALTER TABLE `mshop_text_type` DISABLE KEYS */;
INSERT INTO `mshop_text_type` VALUES
(1,'1.','cms','name','Name',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs'),
(2,'1.','cms','meta-keyword','Meta keywords',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs'),
(3,'1.','cms','meta-description','Meta description',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs'),
(4,'1.','cms','content','Content',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','ai-cms-grapesjs'),
(5,'1.','attribute','name','Name',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(6,'1.','attribute','short','Short description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(7,'1.','attribute','long','Long description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(8,'1.','catalog','name','Name',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(9,'1.','catalog','short','Short description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(10,'1.','catalog','long','Long description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(11,'1.','catalog','url','URL segment',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(12,'1.','catalog','meta-keyword','Meta keywords',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(13,'1.','catalog','meta-description','Meta description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(14,'1.','product','name','Name',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(15,'1.','product','short','Short description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(16,'1.','product','long','Long description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(17,'1.','product','url','URL segment',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(18,'1.','product','meta-keyword','Meta keywords',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(19,'1.','product','meta-description','Meta description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(20,'1.','product','basket','Basket description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(21,'1.','service','name','Name',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(22,'1.','service','short','Short description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(23,'1.','service','long','Long description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(24,'1.','supplier','name','Name',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(25,'1.','supplier','short','Short description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core'),
(26,'1.','supplier','long','Long description',0,1,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `mshop_text_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `siteid` varchar(255) NOT NULL DEFAULT '',
  `superuser` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `company` varchar(100) NOT NULL DEFAULT '',
  `vatid` varchar(32) NOT NULL DEFAULT '',
  `salutation` varchar(8) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `firstname` varchar(64) NOT NULL DEFAULT '',
  `lastname` varchar(64) NOT NULL DEFAULT '',
  `address1` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) NOT NULL DEFAULT '',
  `address3` varchar(200) NOT NULL DEFAULT '',
  `postal` varchar(16) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `state` varchar(200) NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `countryid` varchar(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `telefax` varchar(32) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `longitude` double DEFAULT 0,
  `latitude` double DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `editor` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `unq_lvu_email` (`email`),
  KEY `idx_lvu_langid_sid` (`langid`,`siteid`),
  KEY `idx_lvu_last_first` (`lastname`,`firstname`),
  KEY `idx_lvu_post_addr1` (`postal`,`address1`),
  KEY `idx_lvu_post_city` (`postal`,`city`),
  KEY `idx_lvu_city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Test user','demo@example.com',NULL,'$2y$10$mnP/iWgmO1cB4TakTlpYR.ll3MBxZUrNHPNmKivqTyylQlKFFnyhq',NULL,'2023-01-11 03:00:27','2023-01-11 03:00:27','1.',0,1,'Test company','DE999999999','mr','','Test','User','Test street','1','','10000','Test city','CA','en','US','','','',NULL,NULL,'2000-01-01','core'),
(2,'','','2023-01-11','',NULL,'2023-01-11 03:00:30','2023-01-11 03:00:30','',1,1,'','','','','','','','','','','','',NULL,NULL,'','','',NULL,NULL,NULL,'aimeos:account'),
(3,'admin@example.com','admin@example.com','2023-01-11','$2y$10$Puo0sCcc/pPlyUQVgR.FgOQ4oTt3s7v/7fSJWE/Ar7AcVE/8e5k.a',NULL,'2023-01-11 03:00:31','2023-01-11 03:00:31','1.',0,1,'','','','','','','','','','','','',NULL,NULL,'','','',NULL,NULL,NULL,'aimeos:account');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_address`
--

DROP TABLE IF EXISTS `users_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` bigint(20) unsigned NOT NULL,
  `company` varchar(100) NOT NULL,
  `vatid` varchar(32) NOT NULL,
  `salutation` varchar(8) NOT NULL,
  `title` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `address3` varchar(200) NOT NULL,
  `postal` varchar(16) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `langid` varchar(5) DEFAULT NULL,
  `countryid` varchar(2) DEFAULT NULL,
  `telephone` varchar(32) NOT NULL,
  `telefax` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `longitude` double DEFAULT 0,
  `latitude` double DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `pos` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lvuad_langid_sid` (`langid`,`siteid`),
  KEY `idx_lvuad_last_first` (`lastname`,`firstname`),
  KEY `idx_lvuad_post_addr1` (`postal`,`address1`),
  KEY `idx_lvuad_post_ci` (`postal`,`city`),
  KEY `idx_lvuad_city` (`city`),
  KEY `idx_lvuad_email` (`email`),
  KEY `fk_lvuad_pid` (`parentid`),
  CONSTRAINT `fk_lvuad_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_address`
--

LOCK TABLES `users_address` WRITE;
/*!40000 ALTER TABLE `users_address` DISABLE KEYS */;
INSERT INTO `users_address` VALUES
(1,'1.',1,'Demo company','DE999999999','ms','','Test','User','Demo street','100','','12345','Demo city','NY','en','US','','','demo@example.com','',NULL,NULL,NULL,0,'2023-01-11 03:00:27','2023-01-11 03:00:27','core');
/*!40000 ALTER TABLE `users_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list`
--

DROP TABLE IF EXISTS `users_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` bigint(20) unsigned NOT NULL,
  `key` varchar(134) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `domain` varchar(32) NOT NULL,
  `refid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuli_pid_dm_ty_rid_sid` (`parentid`,`domain`,`type`,`refid`,`siteid`),
  KEY `idx_lvuli_key_sid` (`key`,`siteid`),
  KEY `fk_lvuli_pid` (`parentid`),
  CONSTRAINT `fk_lvuli_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list`
--

LOCK TABLES `users_list` WRITE;
/*!40000 ALTER TABLE `users_list` DISABLE KEYS */;
INSERT INTO `users_list` VALUES
(1,'1.',2,'customer/group|default|1','default','customer/group','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:30','2023-01-11 03:00:30','aimeos:account'),
(2,'1.',3,'customer/group|default|1','default','customer/group','1',NULL,NULL,'[]',0,1,'2023-01-11 03:00:31','2023-01-11 03:00:31','aimeos:account');
/*!40000 ALTER TABLE `users_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list_type`
--

DROP TABLE IF EXISTS `users_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvulity_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_lvulity_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_lvulity_label_sid` (`label`,`siteid`),
  KEY `idx_lvulity_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list_type`
--

LOCK TABLES `users_list_type` WRITE;
/*!40000 ALTER TABLE `users_list_type` DISABLE KEYS */;
INSERT INTO `users_list_type` VALUES
(1,'1.','customer/group','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(2,'1.','product','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(3,'1.','product','favorite','Favorite',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(4,'1.','product','watch','Watch list',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core'),
(5,'1.','service','default','Standard',0,1,'2023-01-11 03:00:26','2023-01-11 03:00:26','core');
/*!40000 ALTER TABLE `users_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_property`
--

DROP TABLE IF EXISTS `users_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `parentid` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `langid` varchar(5) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvupr_pid_ty_lid_val_sid` (`parentid`,`type`,`langid`,`value`,`siteid`),
  KEY `idx_lvupr_key_sid` (`key`,`siteid`),
  KEY `fk_lvupr_pid` (`parentid`),
  CONSTRAINT `fk_lvupr_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_property`
--

LOCK TABLES `users_property` WRITE;
/*!40000 ALTER TABLE `users_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_property_type`
--

DROP TABLE IF EXISTS `users_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuprty_dom_code_sid` (`domain`,`code`,`siteid`),
  KEY `idx_lvuprty_status_sid_pos` (`status`,`siteid`,`pos`),
  KEY `idx_lvuprty_label_sid` (`label`,`siteid`),
  KEY `idx_lvuprty_code_sid` (`code`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_property_type`
--

LOCK TABLES `users_property_type` WRITE;
/*!40000 ALTER TABLE `users_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_property_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-11 13:19:28

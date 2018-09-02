-- MySQL dump 10.13  Distrib 5.6.36, for Linux (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.6.36-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 评论',7,'add_comment'),(20,'Can change 评论',7,'change_comment'),(21,'Can delete 评论',7,'delete_comment'),(22,'Can add 标签',8,'add_tag'),(23,'Can change 标签',8,'change_tag'),(24,'Can delete 标签',8,'delete_tag'),(25,'Can add 类别',9,'add_category'),(26,'Can change 类别',9,'change_category'),(27,'Can delete 类别',9,'delete_category'),(28,'Can add 博客',10,'add_blog'),(29,'Can change 博客',10,'change_blog'),(30,'Can delete 博客',10,'delete_blog'),(34,'Can add 导航',12,'add_navbar'),(35,'Can change 导航',12,'change_navbar'),(36,'Can delete 导航',12,'delete_navbar'),(37,'Can add 友情链接',13,'add_friendlink'),(38,'Can change 友情链接',13,'change_friendlink'),(39,'Can delete 友情链接',13,'delete_friendlink');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$xkzXNpTmP6R4$sUGZuky9EmttFH2zFDF7ezo2Y3W8koDbG0US4KBr7U0=','2018-05-19 08:04:56',1,'admin','','','2855669687@qq.com',1,1,'2018-03-03 08:33:24');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-03-03 08:39:00','1','python',1,'[{\"added\": {}}]',8,1),(2,'2018-03-03 08:39:30','1','python',1,'[{\"added\": {}}]',9,1),(3,'2018-03-03 08:39:33','1','标题测试',1,'[{\"added\": {}}]',10,1),(4,'2018-03-03 09:07:44','2','test',1,'[{\"added\": {}}]',10,1),(5,'2018-03-03 09:15:54','2','test',2,'[{\"changed\": {\"fields\": [\"thumb\"]}}]',10,1),(6,'2018-03-06 01:10:48','2','JavaScript加密逻辑分析与Python模拟执行实现数据爬',2,'[{\"changed\": {\"fields\": [\"title\", \"author\", \"keywords\", \"content\"]}}]',10,1),(7,'2018-03-07 01:45:26','1','标题测试',3,'',10,1),(8,'2018-03-07 02:36:41','3','机器学习主要术语',1,'',10,1),(9,'2018-03-07 06:31:26','3','机器学习主要术语',2,'已修改 description 。',10,1),(10,'2018-03-07 06:32:30','2','JavaScript加密逻辑分析与Python模拟执行实现数据爬',2,'已修改 description 和 content 。',10,1),(11,'2018-03-09 01:50:42','1','技术杂谈',2,'已修改 name 。',9,1),(12,'2018-03-09 02:11:33','2','python',1,'',9,1),(13,'2018-03-09 02:34:25','2','python',2,'已修改 parent 。',9,1),(14,'2018-03-09 02:37:00','3','php',1,'',9,1),(15,'2018-03-09 02:38:03','4','生活笔记',1,'',9,1),(16,'2018-03-09 02:40:47','4','生活笔记',2,'已修改 ordernum 。',9,1),(17,'2018-03-09 02:41:01','1','技术杂谈',2,'已修改 ordernum 。',9,1),(18,'2018-03-09 02:55:11','1','技术杂谈',2,'已修改 code 。',9,1),(19,'2018-03-09 02:55:50','4','生活笔记',2,'已修改 code 。',9,1),(20,'2018-03-09 02:55:57','3','php',2,'已修改 code 。',9,1),(21,'2018-03-09 02:56:04','2','python',2,'已修改 code 。',9,1),(22,'2018-03-09 03:03:50','3','机器学习主要术语',2,'已修改 category 。',10,1),(23,'2018-03-09 07:07:41','2','php',1,'',8,1),(24,'2018-03-09 07:33:47','4','Python-CKEditor中配置CodeSnippet插件来',1,'',10,1),(25,'2018-03-09 07:34:50','4','Python-CKEditor中配置CodeSnippet插件来',2,'已修改 content 。',10,1),(26,'2018-03-09 07:36:24','4','Python-CKEditor中配置CodeSnippet插件来',2,'已修改 content 。',10,1),(27,'2018-03-09 07:37:48','4','Python-CKEditor中配置CodeSnippet插件来',2,'已修改 content 。',10,1),(28,'2018-03-09 07:40:35','4','Python-CKEditor中配置CodeSnippet插件来',2,'已修改 content 。',10,1),(29,'2018-03-09 07:49:29','4','Python-CKEditor中配置CodeSnippet插件来',2,'已修改 content 。',10,1),(30,'2018-03-09 07:51:07','4','Python-CKEditor中配置CodeSnippet插件来',2,'已修改 content 。',10,1),(31,'2018-03-20 03:56:11','9','django',1,'[{\"added\": {}}]',12,1),(32,'2018-03-20 06:25:51','5','django',1,'[{\"added\": {}}]',9,1),(33,'2018-03-23 05:39:10','4','Python-CKEditor中配置CodeSnippet插件来',2,'[{\"changed\": {\"fields\": [\"content\", \"ishot\"]}}]',10,1),(34,'2018-03-23 09:56:54','4','Python-CKEditor中配置CodeSnippet插件来',2,'[]',10,1),(35,'2018-03-23 09:58:39','3','机器学习',1,'[{\"added\": {}}]',8,1),(36,'2018-03-23 09:58:47','3','机器学习主要术语',2,'[{\"changed\": {\"fields\": [\"content\", \"tag\"]}}]',10,1),(37,'2018-03-23 10:05:32','5','刚开始学编程？这几款小工具能让你事半功倍',1,'[{\"added\": {}}]',10,1),(38,'2018-03-23 10:06:06','5','刚开始学编程？这几款小工具能让你事半功倍',2,'[{\"changed\": {\"fields\": [\"click_count\"]}}]',10,1),(39,'2018-03-24 06:58:12','4','工具',1,'[{\"added\": {}}]',8,1),(40,'2018-03-24 06:58:16','5','刚开始学编程？这几款小工具能让你事半功倍',2,'[{\"changed\": {\"fields\": [\"tag\"]}}]',10,1),(41,'2018-03-24 06:58:26','5','刚开始学编程？这几款小工具能让你事半功倍',2,'[]',10,1),(42,'2018-03-28 09:02:10','5','刚开始学编程？这几款小工具能让你事半功倍',2,'[{\"changed\": {\"fields\": [\"tag\"]}}]',10,1),(43,'2018-03-28 09:40:48','4','Python-CKEditor中配置CodeSnippet插件来',2,'[{\"changed\": {\"fields\": [\"tag\"]}}]',10,1),(44,'2018-03-28 09:41:42','2','JavaScript加密逻辑分析与Python模拟执行实现数据爬',2,'[{\"changed\": {\"fields\": [\"content\", \"tag\"]}}]',10,1),(45,'2018-03-29 09:34:57','1','在哪有得买呢?',2,'[{\"changed\": {\"fields\": [\"parent\"]}}]',7,1),(46,'2018-03-29 09:35:48','2','请问电子书什么时候开始出售呢？',1,'[{\"added\": {}}]',7,1),(47,'2018-03-29 09:37:14','3','书在3月上线',1,'[{\"added\": {}}]',7,1),(48,'2018-03-29 09:37:17','3','书在3月上线',2,'[]',7,1),(49,'2018-03-29 09:38:17','4','坐等！出了第一时间入手！',1,'[{\"added\": {}}]',7,1),(50,'2018-03-30 03:07:30','5','你的电子书是不想给人看吗？为什么网站老是崩溃？',1,'[{\"added\": {}}]',7,1),(51,'2018-03-30 03:08:06','6','说的好',1,'[{\"added\": {}}]',7,1),(52,'2018-03-30 03:09:23','7','是真的预售吧，去年七月份我记得才哥你就开始说了，哈哈哈哈哈',1,'[{\"added\": {}}]',7,1),(53,'2018-04-08 05:44:01','1','百度',1,'[{\"added\": {}}]',13,1),(54,'2018-04-08 05:44:18','56','',3,'',7,1),(55,'2018-04-08 05:44:18','54','test',3,'',7,1),(56,'2018-04-08 05:44:18','51','',3,'',7,1),(57,'2018-04-08 05:44:29','55','',3,'',7,1),(58,'2018-04-08 05:44:29','53','test',3,'',7,1),(59,'2018-04-08 05:44:29','52','test',3,'',7,1),(60,'2018-04-08 05:44:29','50','SELECT * FROM `myblog_comment` WHERE 1',3,'',7,1),(61,'2018-04-08 05:44:29','49','test',3,'',7,1),(62,'2018-04-08 05:44:29','48','htmlstr=re_charEntity.sub(\"\",htmlstr,1)\r\n            sz=re_charEntity.search(htmlstr)',3,'',7,1),(63,'2018-04-08 05:44:29','47','select * from user',3,'',7,1),(64,'2018-04-08 05:46:53','2','新浪',1,'[{\"added\": {}}]',13,1),(65,'2018-04-13 05:35:24','1','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(66,'2018-04-28 09:16:03','5','django',1,'[{\"added\": {}}]',8,1),(67,'2018-04-28 09:16:30','6','django+nginx+uwsgi 配置404页面',1,'[{\"added\": {}}]',10,1),(68,'2018-04-28 09:48:45','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"click_count\", \"content\"]}}]',10,1),(69,'2018-04-28 09:49:27','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(70,'2018-04-28 09:50:09','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(71,'2018-04-28 09:50:33','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(72,'2018-04-28 09:51:08','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(73,'2018-04-28 09:52:35','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(74,'2018-04-28 09:52:59','6','django+nginx+uwsgi 配置404页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(75,'2018-04-28 09:58:01','6','django+nginx+uwsgi 403/404/500错误',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',10,1),(76,'2018-04-28 09:58:14','6','django+nginx+uwsgi 403/404/500错误',2,'[]',10,1),(77,'2018-04-28 09:59:34','6','django+nginx+uwsgi 403/404/500错误',2,'[]',10,1),(78,'2018-04-28 10:01:55','6','django 自定义403/404/500错误页面',2,'[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]',10,1),(79,'2018-04-28 10:03:11','6','django 自定义403/404/500错误页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(80,'2018-04-28 10:06:17','6','django 自定义403/404/500错误页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(81,'2018-04-28 10:07:13','6','django 自定义403/404/500错误页面',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(82,'2018-04-28 10:31:57','7','django 更新了py代码后，没有反应的处理方法',1,'[{\"added\": {}}]',10,1),(83,'2018-04-28 10:33:07','7','django 更新了py代码后，没有反应的处理方法',2,'[{\"changed\": {\"fields\": [\"description\", \"content\"]}}]',10,1),(84,'2018-04-28 10:44:08','7','django 更新了py代码后，没有反应的处理方法',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',10,1),(85,'2018-04-28 10:45:09','7','django 更新了py和html模板代码后，没有反应的处理方法',2,'[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'myblog','blog'),(9,'myblog','category'),(7,'myblog','comment'),(13,'myblog','friendlink'),(12,'myblog','navbar'),(8,'myblog','tag'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-03 08:23:51'),(2,'auth','0001_initial','2018-03-03 08:23:59'),(3,'admin','0001_initial','2018-03-03 08:24:02'),(4,'admin','0002_logentry_remove_auto_add','2018-03-03 08:24:02'),(5,'contenttypes','0002_remove_content_type_name','2018-03-03 08:24:03'),(6,'auth','0002_alter_permission_name_max_length','2018-03-03 08:24:04'),(7,'auth','0003_alter_user_email_max_length','2018-03-03 08:24:05'),(8,'auth','0004_alter_user_username_opts','2018-03-03 08:24:05'),(9,'auth','0005_alter_user_last_login_null','2018-03-03 08:24:06'),(10,'auth','0006_require_contenttypes_0002','2018-03-03 08:24:06'),(11,'auth','0007_alter_validators_add_error_messages','2018-03-03 08:24:06'),(12,'auth','0008_alter_user_username_max_length','2018-03-03 08:24:08'),(13,'sessions','0001_initial','2018-03-03 08:24:08'),(14,'myblog','0001_initial','2018-03-03 08:32:07'),(15,'myblog','0002_auto_20180303_0902','2018-03-03 09:02:16'),(16,'myblog','0003_auto_20180303_0907','2018-03-03 09:07:13'),(17,'myblog','0004_auto_20180303_0914','2018-03-03 09:15:03'),(18,'myblog','0005_auto_20180307_1101','2018-03-07 06:30:24'),(19,'myblog','0006_auto_20180307_1428','2018-03-07 06:30:25'),(20,'myblog','0007_category_parent','2018-03-09 02:33:57'),(21,'myblog','0008_category_ordernum','2018-03-09 02:40:25'),(22,'myblog','0009_category_code','2018-03-09 02:54:35'),(23,'myblog','0010_auto_20180309_1506','2018-03-09 07:06:42'),(24,'myblog','0011_auto_20180309_1510','2018-03-09 07:10:10'),(25,'myblog','0012_navbar','2018-03-13 08:46:39'),(26,'myblog','0013_auto_20180313_1650','2018-03-13 08:50:51'),(27,'myblog','0014_auto_20180313_1651','2018-03-13 08:51:49'),(28,'myblog','0015_auto_20180313_1653','2018-03-13 08:53:11'),(29,'myblog','0016_auto_20180313_1655','2018-03-13 08:55:35'),(30,'myblog','0017_auto_20180313_1656','2018-03-13 08:56:39'),(31,'myblog','0002_navbar','2018-03-13 10:08:50'),(32,'myblog','0003_blog_ishot','2018-03-23 05:38:40'),(33,'myblog','0004_blog_isshow','2018-03-23 05:48:44'),(34,'myblog','0005_auto_20180329_1727','2018-03-29 09:28:42'),(35,'myblog','0006_auto_20180330_1548','2018-03-30 07:49:23'),(36,'myblog','0007_auto_20180331_1203','2018-03-31 04:03:48'),(37,'myblog','0008_auto_20180331_1204','2018-03-31 04:04:25'),(38,'myblog','0009_auto_20180331_1259','2018-03-31 04:59:24'),(39,'myblog','0010_auto_20180331_1421','2018-03-31 06:21:51'),(40,'myblog','0011_auto_20180331_1424','2018-03-31 06:24:53'),(41,'myblog','0012_friendlink','2018-04-08 05:43:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0bjm9xlev8ojryodibfwwxbjj2qdhm3g','YjgzZTIwMWQxNjI5M2NhMjFkYzY2MGU0M2Q5NzJkNDk4NTZiMDEyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFhMmQ4YmY5NmIxNDZiZDc2Y2EyYmU0ZGU5NDZlMTdkYjBmNTZmNDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-12 09:34:48'),('aplcau7qj7zdqcquj4xmbetmvqzjz22w','ZTA5YzRlYTJiYTRlOWI4YjZhNTI4YjZlZWUzODJiNjdkNTBmZGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMTM4OGFkNTVhOWU2NzkzM2UxZmJhNGM2ZDJhZTMxMGM0MjBkMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-27 05:35:39'),('b1ampxa8vch70y0gzogarwaq3zx9gewc','NTYxZGJmOTIxZmI0MzA0MjY4MzlmNTA1NzFlMzAxMTQ3YTA4MmQwNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMTM4OGFkNTVhOWU2NzkzM2UxZmJhNGM2ZDJhZTMxMGM0MjBkMmMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-27 05:35:24'),('d6hratfhg9152x0yu9g0rx11m0o0p3dg','ZTA5YzRlYTJiYTRlOWI4YjZhNTI4YjZlZWUzODJiNjdkNTBmZGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMTM4OGFkNTVhOWU2NzkzM2UxZmJhNGM2ZDJhZTMxMGM0MjBkMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-06-02 08:04:56'),('j50oh56ax917l40c4b8mnc7y82faubwm','YjgzZTIwMWQxNjI5M2NhMjFkYzY2MGU0M2Q5NzJkNDk4NTZiMDEyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFhMmQ4YmY5NmIxNDZiZDc2Y2EyYmU0ZGU5NDZlMTdkYjBmNTZmNDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-11 09:01:44'),('jmtm7t9hke7tle0w5gmr1cas7mqtnl9g','ZmM4M2Y1Y2ZiNjU5NmI0NDhkYzBmZDFjOWU3NjE0NmYwMGU5YzU2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2OWExNzY0N2E5ZWE5YjFlMjI2NWNkYWNmZTM2MzZjYjdhNjlkYmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-27 08:47:08'),('mhgjgwbb1z5msrsj0ah4cyx11f4vajdr','ZTA5YzRlYTJiYTRlOWI4YjZhNTI4YjZlZWUzODJiNjdkNTBmZGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMTM4OGFkNTVhOWU2NzkzM2UxZmJhNGM2ZDJhZTMxMGM0MjBkMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-27 05:35:57'),('mog6n7y48qe5gmow23huyh8ktzcdl0nn','ZTA5YzRlYTJiYTRlOWI4YjZhNTI4YjZlZWUzODJiNjdkNTBmZGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMTM4OGFkNTVhOWU2NzkzM2UxZmJhNGM2ZDJhZTMxMGM0MjBkMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-27 05:36:17'),('r7knjs3ko5f0dsergwp92btxt4scz0im','ZTA5YzRlYTJiYTRlOWI4YjZhNTI4YjZlZWUzODJiNjdkNTBmZGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMTM4OGFkNTVhOWU2NzkzM2UxZmJhNGM2ZDJhZTMxMGM0MjBkMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-12 09:08:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_blog`
--

DROP TABLE IF EXISTS `myblog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `author` varchar(16) NOT NULL,
  `content` longtext NOT NULL,
  `pub` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `click_count` int(11) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  `love_count` int(11) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `ishot` tinyint(1) NOT NULL,
  `isshow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myblog_blog_category_id_1e968d17_fk_myblog_category_id` (`category_id`),
  KEY `id` (`id`),
  CONSTRAINT `myblog_blog_category_id_1e968d17_fk_myblog_category_id` FOREIGN KEY (`category_id`) REFERENCES `myblog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_blog`
--

LOCK TABLES `myblog_blog` WRITE;
/*!40000 ALTER TABLE `myblog_blog` DISABLE KEYS */;
INSERT INTO `myblog_blog` VALUES (2,'JavaScript加密逻辑分析与Python模拟执行实现数据爬','吴孝永','<p>本节来说明一下 JavaScript 加密逻辑分析并利用 Python 模拟执行 JavaScript 实现数据爬取的过程。在这里以中国空气质量在线监测分析平台为例来进行分析，主要分析其加密逻辑及破解方法，并利用 PyExecJS 来实现 JavaScript 模拟执行来实现该网站的数据爬取。</p>\r\n\r\n<h2>疑难杂症</h2>\r\n\r\n<p>中国空气质量在线监测分析平台是一个收录全国各大城市天气数据的网站，包括温度、湿度、PM 2.5、AQI 等数据，链接为：<a href=\"https://www.aqistudy.cn/html/city_detail.html\">https://www.aqistudy.cn/html/city_detail.html</a>，预览图如下：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-223705-1100x456.png\" style=\"height:456px; width:1100px\" />通过这个网站我们可以获取到各大城市任何一天的天气数据，对数据分析还是非常有用的。</p>\r\n\r\n<p>然而不幸的是，该网站的数据接口通信都被加密了。经过分析之后发现其页面数据是通过 Ajax 加载的，数据接口地址是：<a href=\"https://www.aqistudy.cn/apinew/aqistudyapi.php\">https://www.aqistudy.cn/apinew/aqistudyapi.php</a>，是一个 POST 形式访问的接口，这个接口的请求数据和返回数据都被加密了，即&nbsp;POST 请求的 Data、返回的数据都被加密了，下图是数据接口的 Form Data 部分，可见传输数据是一个加密后的字符串：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-223517.png\" style=\"height:490px; width:1085px\" /></p>\r\n\r\n<p>下图是该接口返回的内容，同样是经过加密的字符串：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-223555.png\" style=\"height:91px; width:1086px\" /></p>\r\n\r\n<p>遇到这种接口加密的情况，一般来说我们会选择避开请求接口的方式进行数据爬取，如使用 Selenium 模拟浏览器来执行。但这个网站的数据是图表展示的，所以其数据会变得难以提取。</p>\r\n\r\n<p>那怎么办呢？刚啊！</p>\r\n\r\n<h2>一刚到底</h2>\r\n\r\n<p>之前的老法子都行不通了，那就只能上了！接下来我们就不得不去分析这个网站接口的加密逻辑，并通过一些技巧来破解这个接口了。</p>\r\n\r\n<p>首先找到突破口，当我们点击了这个搜索按钮之后，后台便会发出 Ajax 请求，说明这个点击动作是被监听的，所以我们可以找一下这个点击事件对应的处理代码在哪里，这里可以借助于 Firefox 来实现，它可以分析页面某个元素的绑定事件以及定位到具体的代码在哪一行，如图所示：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-225414@2x-1100x704.png\" style=\"height:704px; width:1100px\" /></p>\r\n\r\n<p>这里我们发现这个搜索按钮绑定了三个事件，blur、click、focus，同时 Firefox 还帮助我们列出来了对应事件的处理函数在哪个代码的哪一行，这里可以看到 click 事件是在 city_detail.html 的第 139 行处理的，而且是调用了 getData() 函数。</p>\r\n\r\n<p>接下来我们就可以顺藤摸瓜，找到 city_detail.html 文件的 getData() 函数，然后再找到这个函数的定义即可，很容易地，我们在 city_detail.html 的第 463 行就找到了这个函数的定义：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-230128@2x-1100x415.png\" style=\"height:415px; width:1100px\" /></p>\r\n\r\n<p>经过分析发现它又调用了&nbsp;getAQIData() 和&nbsp;getWeatherData() 两个方法，而这两个方法的声明就在下面，再进一步分析发现这两个方法都调用了 getServerData() 这个方法，并传递了 method、param 等参数，然后还有一个回调函数很明显是对返回数据进行处理的，这说明 Ajax 请求就是由这个 getServerData() 方法发起的，如图所示：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-230433@2x-1100x875.png\" style=\"height:875px; width:1100px\" /></p>\r\n\r\n<p>所以这里我们只需要再找到 getServerData() 方法的定义即可分析它的加密逻辑了。继续搜索，然而在原始 html 文件中没有搜索到该方法，那就继续去搜寻其他的 JavaScript 文件有没有这个定义，终于经过一番寻找，居然在 jquery-1.8.0.min.js 这个文件中找到了：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-230819@2x-1100x303.png\" style=\"height:303px; width:1100px\" /></p>\r\n\r\n<p>有的小伙伴可能会说，jquery.min.js 不是一个库文件吗，怎么会有这种方法声明？嗯，我只想说，最危险的地方就是最安全的地方。</p>\r\n\r\n<p>好了，现在终于找到这个方法了，可为什么看不懂呢？这个方法名后面怎么直接跟了一些奇怪的字符串，而且不符合一般的 JavaScript 写法。其实这里是经过 JavaScript 混淆加密了，混淆加密之后，代码将变为不可读的形式，但是功能是完全一致的，这是一种常见的 JavaScript 加密手段。</p>\r\n\r\n<p>那到这里了该怎么解呢？当然是接着刚啊！</p>\r\n\r\n<h2>反混淆</h2>\r\n\r\n<p>JavaScript 混淆之后，其实是有反混淆方法的，最简单的方法便是搜索在线反混淆网站，这里提供一个：<a href=\"http://www.bm8.com.cn/jsConfusion/\">http://www.bm8.com.cn/jsConfusion/</a>，我们将&nbsp;jquery-1.8.0.min.js 中第二行 eval 开头的混淆后的 JavaScript 代码复制一下，然后粘贴到这个网站中进行反混淆，就可以看到正常的 JavaScript 代码了，搜索一下就可以找到 getServerData() 方法了，可以看到这个方法确实发出了一个 Ajax 请求，请求了刚才我们分析到的接口：</p>\r\n\r\n<p><img alt=\"\" src=\"https://oku1mq4op.qnssl.com/wp-content/uploads/2018/01/WX20180125-231719.png\" style=\"height:536px; width:681px\" /></p>','2018-02-08',1,7,'JavaScript加密逻辑，Python',4,'img/u41656178372048994076fm27gp0.jpg','大家好哈，我呢最近在学习Python爬虫，感觉非常有意思，真的让生活可以方便很多。学习过程中我把一些学习的笔记总结下来，还记录了一些自己实际写的一些小爬虫，在这里跟大家一同分享，希望对Python爬虫感兴趣的童鞋有帮助，如果有机会期待与大家的交流。',0,1),(3,'机器学习主要术语','吴孝永','<p>什么是（监督式）机器学习？简单来说，它的定义如下：</p>\r\n\r\n<ul>\r\n	<li>机器学习系统通过学习如何组合输入信息来对从未见过的数据做出有用的预测。</li>\r\n</ul>\r\n\r\n<p>下面我们来了解一下机器学习的基本术语。</p>\r\n\r\n<h2>标签</h2>\r\n\r\n<p>在简单线性回归中，标签是我们要预测的事物，即&nbsp;y&nbsp;变量。标签可以是小麦未来的价格、图片中显示的动物品种、音频剪辑的含义或任何事物。</p>\r\n\r\n<h2>特征</h2>\r\n\r\n<p>在简单线性回归中，特征是输入变量，即&nbsp;x&nbsp;变量。简单的机器学习项目可能会使用单个特征，而比较复杂的机器学习项目可能会使用数百万个特征，按如下方式指定：</p>\r\n\r\n<p>{x1,x2,&hellip;xN}</p>\r\n\r\n<p>在垃圾邮件检测器示例中，特征可能包括：</p>\r\n\r\n<ul>\r\n	<li>电子邮件文本中的字词</li>\r\n	<li>发件人的地址</li>\r\n	<li>发送电子邮件的时段</li>\r\n	<li>电子邮件中包含&ldquo;一种奇怪的把戏&rdquo;这样的短语。</li>\r\n</ul>\r\n\r\n<h2>样本</h2>\r\n\r\n<p>样本是指数据的特定实例：x。（我们采用粗体&nbsp;x&nbsp;表示它是一个矢量。）我们将样本分为以下两类：</p>\r\n\r\n<ul>\r\n	<li>有标签样本</li>\r\n	<li>无标签样本</li>\r\n</ul>\r\n\r\n<p>有标签样本同时包含特征和标签。即：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1</p>\r\n\r\n<p>&nbsp; labeled examples: {features, label}: (x, y)</p>\r\n\r\n<p>我们使用有标签样本来训练模型。在我们的垃圾邮件检测器示例中，有标签样本是用户明确标记为&ldquo;垃圾邮件&rdquo;或&ldquo;非垃圾邮件&rdquo;的各个电子邮件。</p>\r\n\r\n<p>例如，下表显示了从包含加利福尼亚州房价信息的<a href=\"https://developers.google.cn/machine-learning/crash-course/california-housing-data-description\">数据集</a>中抽取的 5 个有标签样本：</p>\r\n\r\n<p>housingMedianAge<br />\r\n（特征）totalRooms<br />\r\n（特征）totalBedrooms<br />\r\n（特征）medianHouseValue<br />\r\n（标签）15561212836690019765019018010017720174857001415013377340020145432665500</p>\r\n\r\n<p>无标签样本包含特征，但不包含标签。即：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1</p>\r\n\r\n<p>&nbsp; unlabeled examples: {features, ?}: (x, ?)</p>\r\n\r\n<p>在使用有标签样本训练了我们的模型之后，我们会使用该模型来预测无标签样本的标签。在垃圾邮件检测器示例中，无标签样本是用户尚未添加标签的新电子邮件。</p>\r\n\r\n<h2>模型</h2>\r\n\r\n<p>模型定义了特征与标签之间的关系。例如，垃圾邮件检测模型可能会将某些特征与&ldquo;垃圾邮件&rdquo;紧密联系起来。我们来重点介绍一下模型生命周期的两个阶段：</p>\r\n\r\n<ul>\r\n	<li>训练表示创建或学习模型。也就是说，您向模型展示有标签样本，让模型逐渐学习特征与标签之间的关系。</li>\r\n	<li>推断表示将训练后的模型应用于无标签样本。也就是说，您使用训练后的模型来做出有用的预测 (y&rsquo;)。例如，在推断期间，您可以针对新的无标签样本预测&nbsp;medianHouseValue。</li>\r\n</ul>\r\n\r\n<h2>回归与分类</h2>\r\n\r\n<p>回归模型可预测连续值。例如，回归模型做出的预测可回答如下问题：</p>\r\n\r\n<ul>\r\n	<li>加利福尼亚州一栋房产的价值是多少？</li>\r\n	<li>用户点击此广告的概率是多少？</li>\r\n</ul>\r\n\r\n<p>分类模型可预测离散值。例如，分类模型做出的预测可回答如下问题：</p>\r\n\r\n<ul>\r\n	<li>某个指定电子邮件是垃圾邮件还是非垃圾邮件？</li>\r\n	<li>这是一张狗、猫还是仓鼠图片？</li>\r\n</ul>','2018-03-07',2,5,'机器学习',7,'img/001.jpeg','什么是（监督式）机器学习？简单来说，它的定义如下： 机器学习系统通过学习如何组合输入信息来对从未见过的数据做出有用的预测。 下面我们来了解一下机器学习的基本术语。 标签 在简单线性回归中，标签是我们要预测的事物，即 y 变量。标签可以是小麦未来的价格、图片中显示的动物品种、音...',0,1),(4,'Python-CKEditor中配置CodeSnippet插件来','吴孝永','<h2>第一步：安装django-ckeditor和pillow</h2>\r\n\r\n<p>使用pip安装&nbsp;<code>django-ckeditor</code>&nbsp;和&nbsp;<code>pillow</code>，pillow用于生成缩略图，用来在编辑器里浏览上传的图片</p>\r\n\r\n<pre>\r\n<code class=\"language-abap\">pip install django-ckeditor\r\npip install pillow</code></pre>\r\n\r\n<h2>第二步：在setting中，添加ckeditor ， ckeditor_uploader 到INSTALLED_APPS</h2>\r\n\r\n<pre>\r\n<code class=\"language-c\">INSTALLED_APPS = [\r\n    \'django_admin_bootstrapped\',\r\n    \'django.contrib.admin\',\r\n    \'django.contrib.auth\',\r\n    \'django.contrib.contenttypes\',\r\n    \'django.contrib.sessions\',\r\n    \'django.contrib.messages\',\r\n    \'django.contrib.staticfiles\',\r\n    \'myblog\',\r\n    \'ckeditor\',\r\n    \'ckeditor_uploader\'\r\n]</code></pre>\r\n\r\n<h2>第三步：在setting中，添加</h2>\r\n\r\n<p>设置&nbsp;<code>MEDIA_ROOT</code>&nbsp;和&nbsp;<code>MEDIA_URL</code>，<code>CKEDITOR_UPLOAD_PATH = &#39;upload/&#39;</code>，图片将上传到项目下的media/upload路径下，图片的url是 /media/upload/</p>\r\n\r\n<p>设置<code>CKEDITOR_IMAGE_BACKEND = &#39;pillow&#39;</code>, 用于生成图片缩略图，在编辑器里浏览上传的图片</p>\r\n\r\n<pre>\r\n<code class=\"language-actionscript\">CKEDITOR_CONFIGS = {\r\n    \'custom\': {        \r\n        \'language\':\'zh-cn\',\r\n        \'width\':\'730px\',\r\n        \'height\':\'500px\',\r\n        \'image_previewText\':\' \',\r\n        \'tabSpaces\': 4,\r\n        \'toolbar\': \'Custom\',\r\n        \'toolbar_Custom\': [\r\n            [\'Bold\', \'Italic\', \'Underline\', \'Format\', \'RemoveFormat\'],\r\n            [\'NumberedList\', \'BulletedList\'],\r\n            [\'Blockquote\', \'CodeSnippet\'],\r\n            [\'Image\', \'Link\', \'Unlink\'],\r\n            [\'Maximize\']\r\n        ],\r\n        \'extraPlugins\': \',\'.join([\'codesnippet\',\'uploadimage\',\'prism\',\'widget\',\'lineutils\',]),\r\n    }\r\n}\r\n\r\nMEDIA_ROOT = os.path.join(BASE_DIR, \'media\').replace(\'\\\\\', \'/\') \r\nMEDIA_URL = \'/media/\'      \r\nCKEDITOR_UPLOAD_PATH = \"uploads/\"\r\nCKEDITOR_IMAGE_BACKEND = \'pillow\'</code></pre>\r\n\r\n<h2>第四步：执行 python manage.py collectstatic ，收集静态文件</h2>\r\n\r\n<h2>第五步：urls.py里，加入&nbsp;<code>ckeditor_uploader.url</code></h2>\r\n\r\n<pre>\r\n<code>from django.conf.urls import url,include\r\nfrom django.conf.urls.static import static\r\nfrom django.conf import settings\r\nfrom django.contrib import admin\r\n\r\nurlpatterns = [\r\n    url(r\'\', include(\'ckeditor_uploader.urls\')),\r\n] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) #没有这一句无法显示上传的图片</code></pre>\r\n\r\n<h3>注意</h3>\r\n\r\n<p>在开发环境里debug模式下，<code>static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)</code>&nbsp;这句是必不可少的，没有的话，你上传的图片将无法显示。</p>\r\n\r\n<p>当我们在服务器部署时，需要用nginx来配置静态资源，在nginx的配置文件里</p>\r\n\r\n<pre>\r\n<code>location /media {\r\n                alias /path-to/media;\r\n        }</code></pre>\r\n\r\n<h2>第六步：在models.py的Post类，让正文字段使用&nbsp;<code>RichTextUploadingField()</code></h2>\r\n\r\n<pre>\r\n<code>from ckeditor_uploader.fields import RichTextUploadingField\r\n\r\nclass Blog(models.Model):\r\n    content=RichTextUploadingField(config_name=\'custom\')</code></pre>\r\n\r\n<h2>第七步：改动了models.py不要忘了更新。</h2>\r\n\r\n<pre>\r\n<code>pyhton manage.py makemigrations\r\npython manage.py migrate</code></pre>\r\n\r\n<p>&nbsp;</p>','2018-03-09',2,18,'Python_CKEditor,CodeSnippet',9,'img/timthumb.jpeg','在学习Django的过程中，最近自己在尝试做一个博客，其中富文本编辑器使用的是CKEditor，其功能也基本能够实现了，但是代码高亮功能采用CodeSnippet插件没有调出来。',1,1),(5,'刚开始学编程？这几款小工具能让你事半功倍','吴孝永','<p>科技行业里，可供人们使用的工具成百上千，你要怎么知道用哪一种上手最合适呢？</p>\r\n\r\n<p>拿最近刚进入编程这行的人来说吧，大量的工具信息堆砌过来其实毫无益处，反而会无从下手。我发现在自己的开发过程中，很多安装的扩展工具不仅没有真正起到助益作用，反而常常妨碍了正常的开发工作。</p>\r\n\r\n<p>我不是专家，不过随着时间的推移，我还是编制了一份工具清单，这些工具已经证明对我非常有用。如果你刚刚开始学习怎么编程的话，这个清单能给你提供一些指导。如果你是个经验丰富的开发人员，也希望你能从中学到一些新的东西。</p>\r\n\r\n<p>我将把这篇文章分为Chrome扩展程序和VS代码扩展扩展程序两部分。我知道还有其他的浏览器和文本编辑器，但是我想你当然只能在你能找到的工具里选择，所以还是别因为个人喜好而引起一场宗教般的争论。</p>\r\n\r\n<p>请随便选。</p>\r\n\r\n<p>Chrome扩展程序</p>\r\n\r\n<p><img alt=\"\" src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fcrawl.nosdn.127.net%2Fimg%2F9b31ccf8b84f5d62420b5e92e9743c25.jpg&amp;thumbnail=690x2147483647&amp;quality=75&amp;type=webp\" /></p>\r\n\r\n<p>现在设我是一位web开发人员，以Chrome为阵地。下面是一些能让我少花点时间的工具：</p>\r\n\r\n<p>WhatFont&mdash;&mdash;名字就说明了一切。这是找出你最喜欢网站使用的字体的简单方法，这样你就可以为己所用了。</p>\r\n\r\n<p>Pesticide&mdash;&mdash;修改CSS的绝佳程序。当我试着学习匣子模型的时候，它简直就是救命稻草般的存在。</p>\r\n\r\n<p>Colorzilla&mdash;&mdash;用于复制确切颜色的一个网站，用它可以将颜色直接复制到剪贴板上，这样你就没必要花太多时间获得正确的RGBA组合了。</p>\r\n\r\n<p>CSS Peeper&mdash;&mdash;查看网站使用的颜色时非常方便。在你一开始山寨你认为酷的网站的时候很管用。这个程序能让你查看它们的幕后的色彩方案。</p>\r\n\r\n<p>Wappalyzer&mdash;&mdash;想要获悉你在网站上看到的是什么技术，这个程序很有用。想知道某网站使用什么样的框架或者它承载了什么服务？这个照样管用。</p>\r\n\r\n<p>React Dev Tools&mdash;&mdash;一款用于调试应用程序的工具。有一点要提一下，它只有在你编写React程序时才有用。</p>\r\n\r\n<p>Redux Dev Tools&mdash;&mdash;一款用于调试应用程序的工具。有一点要提一下，它只有在你编写Redux程序时才有用。</p>\r\n\r\n<p>JSON Formatter&mdash;&mdash;让JSON在浏览器中看起来更一目了然的不二之选。也许麻烦的JSON让你苦不堪言，不过只要用了这个软件，找到你要找的东西，所花费的时间会大幅缩短。</p>\r\n\r\n<p>Vimeo Repeat and Speed&mdash;&mdash;加速Vimeo视频的绝佳工具。如果你像大多数的web开发人员一样观看视频教程，你就会知道用1.25倍的常规回放速度观看它们是多么的方便。本程序同时也有适用于YouTube的版本。</p>\r\n\r\n<p>VS Code扩展程序</p>\r\n\r\n<p><img alt=\"\" src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fcrawl.nosdn.127.net%2Fimg%2F0e4e9594c4243f3c0f137ef48e2856a8.jpg&amp;thumbnail=690x2147483647&amp;quality=75&amp;type=webp\" /></p>\r\n\r\n<p>Visual Studio Code是我写代码时的不二之选。</p>\r\n\r\n<p>每个人都有他自己喜欢的文本编辑器，我也不例外。不过，我还是想把这些扩展程序介绍给你，而它们对你所使用的大多数编辑器都适用。看看我最喜欢的扩展程序有哪些：</p>\r\n\r\n<p>Auto Rename Tag&mdash;&mdash;自动重命名成对的HTML标记。假如你创建了一个&lt;p&gt;标记。现在你想更改它。有了这个软件，你只需要更改一个就行，另一个会自动修改。从理论上来说，使用这个软件可以把你的工作效率提升一倍。</p>\r\n\r\n<p>HTML CSS Support&mdash;&mdash;HTML文档的CSS支持工具。该工具在获得一些简洁的语法高亮显示和代码建议方面非常有用。</p>\r\n\r\n<p>HTML Snippets&mdash;&mdash;这一工具在代码分段方面非常有用，可以为你节省大量的时间。它能跟Emmet配对，这样一来你甚至都不用再真正键入HTML了。</p>\r\n\r\n<p>Babel ES6/ES7&mdash;&mdash;JavaScript Babel的辅助工具。如果你用的是Babel，这个工具可以让你更容易区分代码。如果你喜欢JavaScript，那务必也不要错过这款软件。</p>\r\n\r\n<p>Bracket Pair Colorizer&mdash;&mdash;色彩可视化工具。如果你没有准确地括号，那这个工具对于发现因此导致的许多常见漏洞十分方便。</p>\r\n\r\n<p>ESLint&mdash;&mdash;你在编写代码的时候，利用这个软件可以轻易获取有关漏洞的提示，而且在编码过程中，它还可以帮助你养成良好的编码习惯。</p>\r\n\r\n<p>Guides&mdash;&mdash;这一工具可以被用来添加额外的指导行代码。这是另一个视觉提示，以确保你正确地括号了。</p>\r\n\r\n<p>JavaScript Console Utils&mdash;&mdash;使控制台日志记录变得更为简单可行。如果你像大多数开发人员一样，你会发现自己需要在调试流中登录到控制台（我知道我们应该使用调试器）。这个实用的程序使得创建有用的console.log()语句变得易如反掌。</p>\r\n\r\n<p>Code Spell Checker&mdash;&mdash;这一工具正如其名，是拼写检查程序。漏洞的的另一个常见来源是变量或函数名。这一拼写检查工具可以查找不常见的单词，而且还可以把我们用JavaScript编写的东西进行有效的审核。</p>\r\n\r\n<p>Git Lens&mdash;&mdash;可以让我们对某文件何时、以及由何人进行更改变得一目了然。当代码被破坏时，我们就能找到该负责任的人，而不是让你当替罪羊了。</p>\r\n\r\n<p>Path Intellisense&mdash;&mdash;文件路径自动完成程序。这样一来从其他文件中导入重要的东西就非常方便了。这一工具使文件导航变得轻而易举。</p>\r\n\r\n<p>Prettier&mdash;&mdash;自动代码格式化程序。忘掉那些你不得不手动缩进代码的日子吧，有了这个工具，事情就变得简单多啦。这个程序会比你自己做得更快更好。对这个程序我是鼎力推荐的。</p>\r\n\r\n<p>VSCode-Icons&mdash;&mdash;将图标添加到文件谱中。如果文件结构非常不科学，你的眼睛想罢工的话，这个程序可能会有所帮助。它对于你正在制作的任何文件都能提供有用的图标辅助，能使你更为轻易地区分看到的内容。</p>\r\n\r\n<p>总结</p>\r\n\r\n<p>你肯定也有自己中意的工具，这些工具对你的开发工作来说是必不可少的。也希望我上面提到的一些工具能够提高你的工作效率。</p>\r\n\r\n<p>但是千万不要落入贪多不烂的陷阱，因为它可能耗费很多时间。</p>\r\n\r\n<p>希望你能在评论区留下你最喜欢的工具，这样我们就可以共同进步了。</p>','2018-03-23',1,30,'小工具',1,'img/下载.webp','Mario Hoyos在Medium上写了文章Tools I wish I had known about when I startedcoding，给新入行的开发工程师提供了几款好用的工具',0,1),(6,'django 自定义403/404/500错误页面','吴孝永','<h2>在django 中403/404/500错误自定义页面的配置，是相对还是比较简单的，只需要三步：</h2>\r\n\r\n<p>我的配置环境是：django+nginx+uwsgi，如果您按此方法配置不成功，请留言</p>\r\n\r\n<p>1、在templates文件夹中添加自己的404.html、403.html、500.html 文件。</p>\r\n\r\n<p>2、在views.py中，添加如下代码：</p>\r\n\r\n<pre>\r\n<code class=\"language-python\">from django.shortcuts import render\r\n\r\n\r\ndef page_not_found(request):\r\n    return render(request, \'404.html\')\r\n\r\n\r\ndef page_error(request):\r\n    return render(request, \'500.html\')\r\n\r\n\r\ndef permission_denied(request):\r\n    return render(request, \'403.html\')</code></pre>\r\n\r\n<p>3、在settings.py文件中，把此配置项改为</p>\r\n\r\n<p>DEBUG = False</p>\r\n\r\n<p>&nbsp;<strong>特别说明：</strong></p>\r\n\r\n<p>有的教程中说需要在urls.py文件中添加如下代码，但我没有添加也可以成功，请自行验证。</p>\r\n\r\n<pre>\r\n<code class=\"language-python\">from myapp.views import * \r\nhandler403 = permission_denied \r\nhandler404 = page_not_found \r\nhandler500 = page_error</code></pre>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<h2>DEBUG = False<strong>设置后产生的问题：</strong></h2>\r\n\r\n<p>1、找不到静态资源，static和media中的文件无法访问。</p>\r\n\r\n<p>原因是debug=true的时候，django会自动处理静态资源，false时就需要单独设置。</p>\r\n\r\n<p>解决办法：</p>\r\n\r\n<p>直接交给nginx来处理，配置location访问静态资源，代码下：</p>\r\n\r\n<pre>\r\n<code class=\"language-nginx\">location /media/ {\r\n                alias /home/wwwroot/mydjango/media/;\r\n        \r\n        }\r\n</code></pre>\r\n\r\n<p>2、ALLOWED_HOSTS = [&#39;*&#39;] 需要设置*或者加上IP</p>','2018-04-28',5,1,'django,404页面',0,'img/f964c68080d97222d49512408266b5f0.jpg','在django 中配置404页面，是相对还是比较简单的，只需要三步',0,1),(7,'django 更新了py和html模板代码后，没有反应的处理方法','吴孝永','<h2>直接修改uwsgi.ini文件</h2>\r\n\r\n<p>这个问题是新手基本都会遇到的问题，更新了py文件后，并没有立即生效。解析办法很简单，无需重新启动uwsgi，为了大家熟悉uwsgi.ini的常用配置项，我把ini的常用配置项都挂出来，请自行学习，重点请关注代码48行</p>\r\n\r\n<pre>\r\n<code class=\"language-nginx\">[uwsgi]\r\n# 项目目录\r\nchdir=/home/wwwroot/mydjango/\r\n\r\n# 指定项目的application\r\nmodule=mydjango.wsgi:application\r\n\r\n# 指定sock的文件路径,Create this file automatically\r\nsocket=/home/wwwroot/mydjango/uwsgi.sock\r\n\r\n# 进程个数       \r\nworkers=5\r\n\r\n#Save process ID,Create this file automatically\r\npidfile=/home/wwwroot/mydjango/uwsgi.pid\r\n\r\n# 指定IP端口       \r\nhttp=127.0.0.1:8000\r\n\r\n# 指定静态文件\r\nstatic-map=/static=/home/wwwroot/mydjango/static\r\n\r\n# 启动uwsgi的用户名和用户组\r\nuid=root\r\ngid=root\r\n\r\n# 启用主进程\r\nmaster=true\r\n\r\n# 自动移除unix Socket和pid文件当服务停止的时候\r\nvacuum=true\r\n\r\n# 序列化接受的内容，如果可能的话\r\nthunder-lock=true\r\n\r\n# 启用线程\r\nenable-threads=true\r\n\r\n# 设置自中断时间\r\nharakiri=30\r\n\r\n# 设置缓冲\r\npost-buffering=4096\r\n\r\n# 设置日志目录 Create this file automatically\r\ndaemonize=/home/wwwroot/mydjango/uwsgi.log\r\n\r\n#设置自动加截更改后的py文件，uwsgi会自动判断文件是否有改动，如果有改动，自动加载，是不是很简单。\r\n\r\npy-autoreload=1\r\n</code></pre>\r\n\r\n<h2>比较笨的方法如下：</h2>\r\n\r\n<pre>\r\n<code class=\"language-php\">uwsgi --reload uwsgi.pid \r\n\r\n其中uwsgi.pid是进程的pid文件[通过 ps aux | uwsgi 找到uwsgi对应的pid, 然后直接uwsgi --reload 进程对应的文件名]</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>在实际工作中，我们修改了html模板文件，更新后也没有效果，方法如下：</h2>\r\n\r\n<p>killall uwsgi</p>\r\n\r\n<p>网站能正常访问，无缝重启。<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','2018-04-28',5,1,'django,python',0,'img/django.png','这个问题是新手基本都会遇到的问题，更新了py文件后，并没有立即生效。解析办法很简单，无需重新启动uwsgi，为了大家熟悉uwsgi.ini的常用配置项，我把ini的常用配置项都挂出来，请自行学习，重点请关注代码48行',0,1);
/*!40000 ALTER TABLE `myblog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_blog_tag`
--

DROP TABLE IF EXISTS `myblog_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myblog_blog_tag_blog_id_tag_id_a63c3832_uniq` (`blog_id`,`tag_id`),
  KEY `myblog_blog_tag_tag_id_f7a72b16_fk_myblog_tag_id` (`tag_id`),
  CONSTRAINT `myblog_blog_tag_blog_id_3e8b1101_fk_myblog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `myblog_blog` (`id`),
  CONSTRAINT `myblog_blog_tag_tag_id_f7a72b16_fk_myblog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `myblog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_blog_tag`
--

LOCK TABLES `myblog_blog_tag` WRITE;
/*!40000 ALTER TABLE `myblog_blog_tag` DISABLE KEYS */;
INSERT INTO `myblog_blog_tag` VALUES (5,2,1),(19,2,2),(14,3,3),(13,4,1),(18,4,2),(17,5,2),(16,5,4),(20,6,5),(21,7,5);
/*!40000 ALTER TABLE `myblog_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_category`
--

DROP TABLE IF EXISTS `myblog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parent_id` int(11),
  `ordernum` int(11) NOT NULL,
  `code` varchar(30),
  PRIMARY KEY (`id`),
  KEY `myblog_category_6be37982` (`parent_id`),
  CONSTRAINT `myblog_category_parent_id_7e2e6719b395034e_fk_myblog_category_id` FOREIGN KEY (`parent_id`) REFERENCES `myblog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_category`
--

LOCK TABLES `myblog_category` WRITE;
/*!40000 ALTER TABLE `myblog_category` DISABLE KEYS */;
INSERT INTO `myblog_category` VALUES (1,'技术杂谈',NULL,2,'technique'),(2,'python',1,0,'python'),(3,'php',1,0,'php'),(4,'生活笔记',NULL,1,'life'),(5,'django',1,0,'django');
/*!40000 ALTER TABLE `myblog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_comment`
--

DROP TABLE IF EXISTS `myblog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `email` varchar(254) NOT NULL,
  `content` varchar(240) NOT NULL,
  `pub` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_comment`
--

LOCK TABLES `myblog_comment` WRITE;
/*!40000 ALTER TABLE `myblog_comment` DISABLE KEYS */;
INSERT INTO `myblog_comment` VALUES (1,'呀咩喋','wuxiaoyong_cy@163.com','在哪有得买呢?','2018-03-29 00:00:00',NULL,'http://www.test.com',5),(2,'Ann2018','test@163.com','请问电子书什么时候开始出售呢？','2018-03-29 00:00:00',NULL,'http://www.haha.com',5),(3,'wuxiaoyong','haha@163.com','书在3月上线','2018-03-29 00:00:00',NULL,'http://www.haha.com',5),(4,'Treehole','vip120@126.com','坐等！出了第一时间入手！','2018-03-29 00:00:00',3,'http://www.baidu.com',5),(5,'你好胡卡的风景卡拉斯京贷款空间','test@163.com','你的电子书是不想给人看吗？为什么网站老是崩溃？','2018-03-30 00:00:00',3,'http://www.haha.com',5),(6,'1234567@163.com','test@163.com','说的好','2018-03-30 00:00:00',5,'http://www.haha.com',5),(7,'coder.HB','test@163.com','是真的预售吧，去年七月份我记得才哥你就开始说了，哈哈哈哈哈','2018-03-30 00:00:00',3,'http://www.haha.com',5),(8,'wuxiaoyong','wuxiaoyong_cy@163.com',' :silly:  :what: ','2018-03-30 00:00:00',6,'',5),(9,'wuxiaoyong','wuxiaoyong_cy@163.com',' :silly: ','2018-03-30 07:49:33',6,'',5),(10,'wuxiaoyong','wuxiaoyong_cy@163.com',' :what: ','2018-03-30 07:54:16',6,'',5),(14,'wuxiaoyong','wuxiaoyong_cy@163.com',' :yeah: ','2018-03-31 14:25:29',0,'',5),(15,'wuxiaoyong','wuxiaoyong_cy@163.com',' :good: ','2018-03-31 14:25:48',14,'',5),(16,'wuxiaoyong','wuxiaoyong_cy@163.com',' :Secretly: ','2018-03-31 14:29:23',15,'',5),(17,'wuxiaoyong','wuxiaoyong_cy@163.com',' :yeah: ','2018-03-31 06:34:14',16,'',5),(18,'wuxiaoyong','wuxiaoyong_cy@163.com',' :silly: ','2018-03-31 14:38:03',17,'',5),(19,'wuxiaoyong','wuxiaoyong_cy@163.com',' :byebye: ','2018-03-31 14:43:38',18,'',5),(20,'wuxiaoyong','wuxiaoyong_cy@163.com',' :disturb: ','2018-03-31 14:43:51',19,'',5),(21,'wuxiaoyong','wuxiaoyong_cy@163.com','asdfsdfdsf','2018-03-31 14:44:52',14,'',5),(22,'wuxiaoyong','wuxiaoyong_cy@163.com',' :good: ','2018-03-31 15:13:50',21,'',5),(23,'wuxiaoyong','wuxiaoyong_cy@163.com',' :silly: ','2018-03-31 15:15:38',22,'',5),(24,'wuxiaoyong','wuxiaoyong_cy@163.com',' :yeah: ','2018-03-31 15:18:10',23,'',5),(25,'wuxiaoyong','wuxiaoyong_cy@163.com',' :yeah: ','2018-03-31 15:18:30',23,'',5),(26,'wuxiaoyong','wuxiaoyong_cy@163.com',' :disturb: ','2018-03-31 15:24:06',21,'',5),(27,'wuxiaoyong','wuxiaoyong_cy@163.com','asdgsdgds','2018-03-31 15:25:08',1,'',5),(28,'wuxiaoyong','wuxiaoyong_cy@163.com','你的博客做的好棒 :what: ','2018-04-01 14:26:41',0,'',4);
/*!40000 ALTER TABLE `myblog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_friendlink`
--

DROP TABLE IF EXISTS `myblog_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_friendlink`
--

LOCK TABLES `myblog_friendlink` WRITE;
/*!40000 ALTER TABLE `myblog_friendlink` DISABLE KEYS */;
INSERT INTO `myblog_friendlink` VALUES (1,'百度','http://www.baidu.com',0),(2,'新浪','http://www.sina.com',1);
/*!40000 ALTER TABLE `myblog_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_navbar`
--

DROP TABLE IF EXISTS `myblog_navbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_navbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `blank` varchar(20) NOT NULL,
  `ordernum` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myblog_navbar_parent_id_740f2781304be2c6_fk_myblog_navbar_id` (`parent_id`),
  CONSTRAINT `myblog_navbar_parent_id_740f2781304be2c6_fk_myblog_navbar_id` FOREIGN KEY (`parent_id`) REFERENCES `myblog_navbar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_navbar`
--

LOCK TABLES `myblog_navbar` WRITE;
/*!40000 ALTER TABLE `myblog_navbar` DISABLE KEYS */;
INSERT INTO `myblog_navbar` VALUES (1,'首页','/',' ',0,NULL),(2,'技术杂谈','/category/technique',' ',1,NULL),(3,'python','/category/technique/python',' ',0,2),(4,'Php','/category/technique/php',' ',2,2),(5,'生活笔记','/category/life','  ',2,NULL),(6,'福利专区','/category/welfarearea','  ',3,NULL),(7,'关于自己','/about','  ',4,NULL),(8,'给我留言','/message','  ',5,NULL),(9,'django','/category/technique/django','_blank',0,2);
/*!40000 ALTER TABLE `myblog_navbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_tag`
--

DROP TABLE IF EXISTS `myblog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_tag`
--

LOCK TABLES `myblog_tag` WRITE;
/*!40000 ALTER TABLE `myblog_tag` DISABLE KEYS */;
INSERT INTO `myblog_tag` VALUES (1,'python'),(2,'php'),(3,'机器学习'),(4,'工具'),(5,'django');
/*!40000 ALTER TABLE `myblog_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-19  9:26:40

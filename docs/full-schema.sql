-- MySQL dump 10.13  Distrib 5.1.52, for apple-darwin10.5.0 (i386)
--
-- Host: localhost    Database: pdns
-- ------------------------------------------------------
-- Server version	5.1.52-log

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
-- Table structure for table `accounts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `api_key` varchar(32) DEFAULT NULL,
  `api_secret` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(11) DEFAULT NULL,
  `account` varchar(40) DEFAULT NULL,
  `cas` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`),
  KEY `account` (`account`),
  KEY `account_2` (`account`),
  CONSTRAINT `domains_ibfk_1` FOREIGN KEY (`account`) REFERENCES `accounts` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1558 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rec_name_index` (`name`),
  KEY `nametype_index` (`name`,`type`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=588709 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supermasters`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supermasters` (
  `ip` varchar(25) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-14 17:01:53

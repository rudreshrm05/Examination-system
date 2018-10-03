-- MySQL dump 10.13  Distrib 5.5.16, for Win64 (x86)
--
-- Host: localhost    Database: Examination_system
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `topic_id` varchar(10) NOT NULL DEFAULT '',
  `q_num` int(11) NOT NULL DEFAULT '0',
  `answer` char(1) DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`q_num`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `exam` (`topic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES ('TID1',1,'A'),('TID2',1,'C'),('TID2',2,'A'),('TID2',3,'');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_answers`
--

DROP TABLE IF EXISTS `candidate_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_answers` (
  `exam_id` varchar(10) NOT NULL DEFAULT '',
  `topic_id` varchar(10) NOT NULL DEFAULT '',
  `q_num` int(11) NOT NULL DEFAULT '0',
  `answer` char(1) DEFAULT NULL,
  PRIMARY KEY (`exam_id`,`topic_id`,`q_num`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `candidate_answers_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `candidate_details` (`exam_id`) ON DELETE CASCADE,
  CONSTRAINT `candidate_answers_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `exam` (`topic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_answers`
--

LOCK TABLES `candidate_answers` WRITE;
/*!40000 ALTER TABLE `candidate_answers` DISABLE KEYS */;
INSERT INTO `candidate_answers` VALUES ('EID1','TID1',1,'A'),('EID2','TID1',1,'B'),('EID4','TID2',1,'C'),('EID4','TID2',2,'B'),('EID4','TID2',3,'B'),('EID5','TID2',1,'C'),('EID5','TID2',2,'A'),('EID5','TID2',3,'A');
/*!40000 ALTER TABLE `candidate_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_details` (
  `exam_id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES ('EID1','Rajeshwari','rajeshwari@gmail.com','77898765577','1997-09-08','qwerty'),('EID2','shru','shru@gmail.com','8956325698','11-12-1992','shru'),('EID3','reret','ryry','tyt','tyty','12345'),('EID4','Rajeshwari','rajeshwari@gmail.com','5678776','1997-8-9','qwerty'),('EID5','Nikshepa','nikshepa@gmail.com','9986972367','23-01-1998','nishu23'),('EID6','Manohar','hdjhfdkjhf','8905809','iou34','qwerty'),('EID7','Rajeshwari','rajeshwaris@gmail.com','9174810938','1997-07-09','qwerty');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_details`
--

DROP TABLE IF EXISTS `ec_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_details` (
  `user_id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_details`
--

LOCK TABLES `ec_details` WRITE;
/*!40000 ALTER TABLE `ec_details` DISABLE KEYS */;
INSERT INTO `ec_details` VALUES ('UID1','Rudresh RM','rudramadhu0509@gmail.com','9964757758','qwerty'),('UID2','Rudresh','rudresh@gmail.com','567677','qwerty'),('UID3','Chandhan','chandhan@gmail.com','8296793147','meghana'),('UID4','Rudresh','mnkufhddh','838o8459','qwerty'),('UID5','Rudresh','rudreshrm@gmail.com','9964757758','qwerty');
/*!40000 ALTER TABLE `ec_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `topic_id` varchar(10) NOT NULL,
  `topic_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('TID1','ds'),('TID2','cs');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noofquestions`
--

DROP TABLE IF EXISTS `noofquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noofquestions` (
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noofquestions`
--

LOCK TABLES `noofquestions` WRITE;
/*!40000 ALTER TABLE `noofquestions` DISABLE KEYS */;
INSERT INTO `noofquestions` VALUES (1),(1),(1),(1),(1),(1),(1);
/*!40000 ALTER TABLE `noofquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `topic_id` varchar(10) NOT NULL DEFAULT '',
  `q_num` int(11) NOT NULL DEFAULT '0',
  `a` varchar(30) DEFAULT NULL,
  `b` varchar(30) DEFAULT NULL,
  `c` varchar(30) DEFAULT NULL,
  `d` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`q_num`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `exam` (`topic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES ('TID1',1,'Linear','not DS','non linear','LIFO'),('TID2',1,'int','float','both A and B','array'),('TID2',2,'database magagement system','data','database base management','abc'),('TID2',3,'','','','');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `topic_id` varchar(10) NOT NULL DEFAULT '',
  `q_num` int(11) NOT NULL DEFAULT '0',
  `question` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`q_num`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `exam` (`topic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('TID1',1,'queue is?'),('TID2',1,'which are the following are data types?'),('TID2',2,'DBMS ?'),('TID2',3,'');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger number after insert on questions for each row insert into noOfQuestions values(1) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `topic_id` varchar(10) NOT NULL DEFAULT '',
  `exam_id` varchar(30) NOT NULL DEFAULT '',
  `result` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `resultpf` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`exam_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `exam` (`topic_id`) ON DELETE CASCADE,
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `candidate_details` (`exam_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES ('TID1','EID1',1,NULL,NULL),('TID1','EID2',0,NULL,NULL),('TID1','EID4',5,20,'fail'),('TID1','EID5',7,58,'pass'),('TID1','EID6',2,10,'fail'),('TID2','EID4',1,NULL,NULL),('TID2','EID5',1,NULL,NULL);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_status`
--

DROP TABLE IF EXISTS `result_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_status` (
  `resultpf` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_status`
--

LOCK TABLES `result_status` WRITE;
/*!40000 ALTER TABLE `result_status` DISABLE KEYS */;
INSERT INTO `result_status` VALUES (''),('');
/*!40000 ALTER TABLE `result_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger result_Status after insert on result_status for each row
begin
update result set resultpf='fail' where percentage<35;
update result set resultpf='pass' where percentage>35;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-05 19:14:06

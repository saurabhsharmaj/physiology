-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: physiologydb
-- ------------------------------------------------------
-- Server version	5.5.46

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answers_question1_idx` (`questionid`),
  CONSTRAINT `fk_answers_question1` FOREIGN KEY (`questionid`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'Delhi',10),(2,1,'Gujrat',0),(3,1,'Panjab',0),(4,1,'Haryana',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updatedOn` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_login1` (`userId`),
  CONSTRAINT `fk_user_id_login1` FOREIGN KEY (`userId`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,1,'saurabh','saurabh123',0,'2016-08-27');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testType` int(11) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `optionType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_optionType_idx` (`optionType_id`),
  CONSTRAINT `fk_question_optionType` FOREIGN KEY (`optionType_id`) REFERENCES `questiontype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'What is capital of India?',1),(2,1,'Which color do you like?',2),(3,1,'Are you male or femaile?',3),(4,1,'Enter you favorite Color',4);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questiontype`
--

DROP TABLE IF EXISTS `questiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questiontype`
--

LOCK TABLES `questiontype` WRITE;
/*!40000 ALTER TABLE `questiontype` DISABLE KEYS */;
INSERT INTO `questiontype` VALUES (1,1,'single Choice'),(2,2,'Multiple Choice'),(3,3,'Boolean'),(4,4,'Fill in the blank');
/*!40000 ALTER TABLE `questiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdetail`
--

DROP TABLE IF EXISTS `testdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `testtypeid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `updatedOn` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_testdetail_TestType1_idx` (`testtypeid`),
  KEY `fk_testdetail_userid` (`userid`),
  CONSTRAINT `fk_testdetail_TestType1` FOREIGN KEY (`testtypeid`) REFERENCES `testtype` (`id`),
  CONSTRAINT `fk_testdetail_userid` FOREIGN KEY (`userid`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdetail`
--

LOCK TABLES `testdetail` WRITE;
/*!40000 ALTER TABLE `testdetail` DISABLE KEYS */;
INSERT INTO `testdetail` VALUES (1,1,1,100,'2016-08-27'),(2,1,2,50,'2016-08-27');
/*!40000 ALTER TABLE `testdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testhistory`
--

DROP TABLE IF EXISTS `testhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testdetail_id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `testTypeId` int(11) DEFAULT NULL,
  `questionTypeId` int(11) DEFAULT NULL,
  `selectedTypeId` int(11) DEFAULT NULL,
  `selectedOptionValue` varchar(255) DEFAULT NULL,
  `optionscore` int(11) DEFAULT NULL,
  `updatedOn` date DEFAULT NULL,
  PRIMARY KEY (`id`,`testdetail_id`),
  KEY `fk_testHistory_testdetail1_idx` (`testdetail_id`),
  KEY `fk_testHistory_userdetail` (`userid`),
  KEY `fk_testHistory_test_type` (`testTypeId`),
  KEY `fk_testHistory_question_type` (`questionTypeId`),
  CONSTRAINT `fk_testHistory_testdetail1` FOREIGN KEY (`testdetail_id`) REFERENCES `testdetail` (`id`),
  CONSTRAINT `fk_testHistory_userdetail` FOREIGN KEY (`userid`) REFERENCES `user_detail` (`id`),
  CONSTRAINT `fk_testHistory_test_type` FOREIGN KEY (`testTypeId`) REFERENCES `testtype` (`id`),
  CONSTRAINT `fk_testHistory_question_type` FOREIGN KEY (`questionTypeId`) REFERENCES `questiontype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testhistory`
--

LOCK TABLES `testhistory` WRITE;
/*!40000 ALTER TABLE `testhistory` DISABLE KEYS */;
INSERT INTO `testhistory` VALUES (1,1,1,1,1,1,1,'1',10,'2016-08-27');
/*!40000 ALTER TABLE `testhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtype`
--

DROP TABLE IF EXISTS `testtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtype`
--

LOCK TABLES `testtype` WRITE;
/*!40000 ALTER TABLE `testtype` DISABLE KEYS */;
INSERT INTO `testtype` VALUES (1,'Hindi','ABC Test',0),(2,'English','English Test',0),(3,'Math','Math Test',0);
/*!40000 ALTER TABLE `testtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtype_has_question`
--

DROP TABLE IF EXISTS `testtype_has_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtype_has_question` (
  `TestType_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_optionType_id` int(11) NOT NULL,
  PRIMARY KEY (`TestType_id`,`question_id`,`question_optionType_id`),
  KEY `fk_TestType_has_question_question1` (`question_id`),
  CONSTRAINT `fk_TestType_has_question_TestType1` FOREIGN KEY (`TestType_id`) REFERENCES `testtype` (`id`),
  CONSTRAINT `fk_TestType_has_question_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtype_has_question`
--

LOCK TABLES `testtype_has_question` WRITE;
/*!40000 ALTER TABLE `testtype_has_question` DISABLE KEYS */;
INSERT INTO `testtype_has_question` VALUES (1,1,1);
/*!40000 ALTER TABLE `testtype_has_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `educationType` varchar(255) DEFAULT NULL,
  `educationMedium` varchar(255) DEFAULT NULL,
  `domicile` varchar(255) DEFAULT NULL,
  `maritialStatus` int(11) DEFAULT NULL,
  `monthlyIncome` varchar(45) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `familyType` int(11) DEFAULT NULL,
  `birthorder` int(11) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `phno` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
INSERT INTO `user_detail` VALUES (1,'saurabh','roshan lal sharma',32,1,'1','1','Rajasthan',1,'100000','1',1,1,'jaipur','108,Shiv Nager Murlipura scheem','9602273529','1412261267');
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'physiologydb'
--

--
-- Dumping routines for database 'physiologydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-27 19:44:50

CREATE TABLE user_roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uni_user_role (role,username),
  KEY fk_userid_idx (username));
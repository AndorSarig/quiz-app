-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: quiz-app
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `PossibleAnswers`
--

DROP TABLE IF EXISTS `PossibleAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PossibleAnswers` (
  `answer-id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz-id` int(11) NOT NULL,
  `question-id` int(11) NOT NULL,
  `answer` varchar(256) NOT NULL,
  `is-correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`answer-id`),
  KEY `question-id` (`question-id`),
  KEY `quiz-id` (`quiz-id`),
  CONSTRAINT `PossibleAnswers_ibfk_1` FOREIGN KEY (`question-id`) REFERENCES `Questions` (`question-id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PossibleAnswers_ibfk_2` FOREIGN KEY (`quiz-id`) REFERENCES `QuizCategories` (`quiz-id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PossibleAnswers`
--

LOCK TABLES `PossibleAnswers` WRITE;
/*!40000 ALTER TABLE `PossibleAnswers` DISABLE KEYS */;
INSERT INTO `PossibleAnswers` VALUES (1,1,1,'Chris Froome',0),(2,1,1,'Tom Doumolin',0),(3,1,1,'Geraint Thomas',1),(4,1,1,'Nairo Quintana',0),(5,1,2,'Tom Doumolin',0),(6,1,2,'Chris Froome',1),(7,1,2,'Wout Poels',0),(8,1,2,'Domenico Pozzovivo',0),(9,1,3,'1',0),(10,1,3,'3',0),(11,1,3,'4',1),(12,1,3,'2',0),(13,1,3,'5',0),(14,1,4,'Cutie',0),(15,1,4,'Alien',1),(16,1,4,'The Rock',0),(17,1,4,'None of these',0),(18,1,5,'Skoda',1),(19,1,5,'LCL',0),(20,1,5,'AXA',0),(21,1,5,'BNP Paribas',0),(22,1,5,'Carrefour',0),(23,1,6,'2011',0),(24,1,6,'2015',0),(25,1,6,'2017',0),(26,1,6,'2013',1);
/*!40000 ALTER TABLE `PossibleAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `question-id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz-id` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  PRIMARY KEY (`question-id`),
  KEY `quiz-id` (`quiz-id`),
  CONSTRAINT `Questions_ibfk_1` FOREIGN KEY (`quiz-id`) REFERENCES `QuizCategories` (`quiz-id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (1,1,'Who won the 2018\'s Tour de France?'),(2,1,'Who won the 2018\'s Giro d\'Italia?'),(3,1,'How many riders have won 5 times the Tour de France?'),(4,1,'What\'s the nickname of Chris Froome?'),(5,1,'Who\'s the sponsor of Tour de France\'s green jersey?'),(6,1,'When did Chris Froome won his first Tour de France?');
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuizCategories`
--

DROP TABLE IF EXISTS `QuizCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuizCategories` (
  `quiz-id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz-name` varchar(256) NOT NULL,
  PRIMARY KEY (`quiz-id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuizCategories`
--

LOCK TABLES `QuizCategories` WRITE;
/*!40000 ALTER TABLE `QuizCategories` DISABLE KEYS */;
INSERT INTO `QuizCategories` VALUES (1,'Cycling');
/*!40000 ALTER TABLE `QuizCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuizHistory`
--

DROP TABLE IF EXISTS `QuizHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuizHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user-id` int(11) NOT NULL,
  `quiz-id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user-id` (`user-id`),
  KEY `quiz-id` (`quiz-id`),
  CONSTRAINT `QuizHistory_ibfk_1` FOREIGN KEY (`user-id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `QuizHistory_ibfk_2` FOREIGN KEY (`quiz-id`) REFERENCES `QuizCategories` (`quiz-id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuizHistory`
--

LOCK TABLES `QuizHistory` WRITE;
/*!40000 ALTER TABLE `QuizHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuizHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Andor','andorsarig@yahoo.com');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-02 17:42:35

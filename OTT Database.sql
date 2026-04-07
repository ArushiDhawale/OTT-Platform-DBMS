-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ott
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `Actor_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Actor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (401,'Leonardo DiCaprio','1974-11-11'),(402,'Millie Bobby Brown','2004-02-19'),(403,'Aamir Khan','1965-03-14'),(404,'Matthew McConaughey','1969-11-04'),(405,'Nawazuddin Siddiqui','1974-05-19');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acts_in`
--

DROP TABLE IF EXISTS `acts_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acts_in` (
  `Content_ID` int NOT NULL,
  `Actor_ID` int NOT NULL,
  PRIMARY KEY (`Content_ID`,`Actor_ID`),
  KEY `Actor_ID` (`Actor_ID`),
  CONSTRAINT `acts_in_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content` (`Content_ID`),
  CONSTRAINT `acts_in_ibfk_2` FOREIGN KEY (`Actor_ID`) REFERENCES `actor` (`Actor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acts_in`
--

LOCK TABLES `acts_in` WRITE;
/*!40000 ALTER TABLE `acts_in` DISABLE KEYS */;
INSERT INTO `acts_in` VALUES (301,401),(302,402),(303,403),(304,404),(305,405);
/*!40000 ALTER TABLE `acts_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `Content_ID` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `Release_Country` varchar(50) DEFAULT NULL,
  `Release_Year` int DEFAULT NULL,
  `Rating` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`Content_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (301,'Inception','148 min','USA',2010,8.8),(302,'Stranger Things','50 min','USA',2016,8.7),(303,'3 Idiots','170 min','India',2009,8.4),(304,'Interstellar','169 min','USA',2014,8.6),(305,'Sacred Games','45 min','India',2018,8.5);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `Director_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Director_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (501,'Christopher Nolan','1970-07-30'),(502,'Duffer Brothers','1984-02-15'),(503,'Rajkumar Hirani','1962-11-20'),(504,'Anurag Kashyap','1972-09-10'),(505,'Imtiaz Ali','1971-06-16');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directs`
--

DROP TABLE IF EXISTS `directs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directs` (
  `Content_ID` int NOT NULL,
  `Director_ID` int NOT NULL,
  PRIMARY KEY (`Content_ID`,`Director_ID`),
  KEY `Director_ID` (`Director_ID`),
  CONSTRAINT `directs_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content` (`Content_ID`),
  CONSTRAINT `directs_ibfk_2` FOREIGN KEY (`Director_ID`) REFERENCES `director` (`Director_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directs`
--

LOCK TABLES `directs` WRITE;
/*!40000 ALTER TABLE `directs` DISABLE KEYS */;
INSERT INTO `directs` VALUES (301,501),(304,501),(302,502),(303,503),(305,504);
/*!40000 ALTER TABLE `directs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `Episode_ID` int NOT NULL,
  `Content_ID` int DEFAULT NULL,
  `Season_No` int DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  PRIMARY KEY (`Episode_ID`),
  KEY `Content_ID` (`Content_ID`),
  CONSTRAINT `episode_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `series` (`Content_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (601,302,1,'Episode 1','50 min','2016-07-15'),(602,302,1,'Episode 2','48 min','2016-07-15'),(603,302,2,'Episode 1','52 min','2017-10-27'),(604,305,1,'Episode 1','45 min','2018-07-06'),(605,305,1,'Episode 2','47 min','2018-07-06');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `Login_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Login_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,1,'aditi','user123','user'),(2,2,'rahul','user123','user'),(3,3,'neha','user123','user'),(4,NULL,'admin','admin123','admin');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `Content_ID` int NOT NULL,
  `Box_Office_Collection` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Content_ID`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content` (`Content_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (301,'800M'),(302,'300M'),(303,'400M'),(304,'500M'),(305,'600M');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Plan_ID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Method` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Plan_ID` (`Plan_ID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Plan_ID`) REFERENCES `sub_plan` (`Plan_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (201,1,103,699.00,'2026-01-10','UPI','Success'),(202,2,102,399.00,'2026-01-12','Card','Success'),(203,3,101,199.00,'2026-01-15','UPI','Failed'),(204,4,104,999.00,'2026-02-01','NetBanking','Success'),(205,5,105,1499.00,'2026-02-05','Card','Pending');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `Content_ID` int NOT NULL,
  `No_of_Seasons` int DEFAULT NULL,
  PRIMARY KEY (`Content_ID`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content` (`Content_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (301,2),(302,4),(303,1),(304,5),(305,3);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_plan`
--

DROP TABLE IF EXISTS `sub_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_plan` (
  `Plan_ID` int NOT NULL,
  `Plan_Name` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `Video_Quality` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Plan_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_plan`
--

LOCK TABLES `sub_plan` WRITE;
/*!40000 ALTER TABLE `sub_plan` DISABLE KEYS */;
INSERT INTO `sub_plan` VALUES (101,'Basic',199.00,'1 Month','480p'),(102,'Standard',399.00,'1 Month','720p'),(103,'Premium',699.00,'1 Month','1080p'),(104,'Mobile Only',149.00,'1 Month','480p'),(105,'Annual Premium',4999.00,'1 Year','4K');
/*!40000 ALTER TABLE `sub_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Aditi','aditi@gmail.com','9876543210','India','2005-06-12'),(2,'Rahul','rahul@gmail.com','9123456780','India','2003-03-25'),(3,'Neha','neha@gmail.com','9988776655','India','2004-11-05'),(4,'Aniha','aniha@gmail.com','9822334455','India','2004-08-15'),(5,'Arushi','arushi@gmail.com','9766554433','India','2005-01-20');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watches` (
  `User_ID` int NOT NULL,
  `Content_ID` int NOT NULL,
  PRIMARY KEY (`User_ID`,`Content_ID`),
  KEY `Content_ID` (`Content_ID`),
  CONSTRAINT `watches_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `watches_ibfk_2` FOREIGN KEY (`Content_ID`) REFERENCES `content` (`Content_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
INSERT INTO `watches` VALUES (1,301),(2,302),(3,303),(4,304),(5,305);
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-31 15:15:38

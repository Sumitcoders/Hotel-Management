-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_celestial
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS admins;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE admins (
  username varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES admins WRITE;
/*!40000 ALTER TABLE admins DISABLE KEYS */;
INSERT INTO admins VALUES ('Aashu','Sharma_ji@2007'),('Sumit_2007','sk2007_admin');
/*!40000 ALTER TABLE admins ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banquet_hall`
--

DROP TABLE IF EXISTS banquet_hall;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE banquet_hall (
  Hall_no int NOT NULL,
  `Type` varchar(20) NOT NULL,
  capacity int DEFAULT NULL,
  price int DEFAULT NULL,
  PRIMARY KEY (Hall_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banquet_hall`
--

LOCK TABLES banquet_hall WRITE;
/*!40000 ALTER TABLE banquet_hall DISABLE KEYS */;
INSERT INTO banquet_hall VALUES (1,'Small',20,8000),(2,'Medium',50,10000),(3,'Large',100,12000),(4,'Massive',200,15000),(5,'Celestial Special',500,20000);
/*!40000 ALTER TABLE banquet_hall ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS bill;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE bill (
  C_ID int NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  Service_Type varchar(20) DEFAULT NULL,
  Cost int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES bill WRITE;
/*!40000 ALTER TABLE bill DISABLE KEYS */;
/*!40000 ALTER TABLE bill ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS customer;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customer (
  C_ID int NOT NULL,
  `name` varchar(30) NOT NULL,
  room_no int DEFAULT NULL,
  contact bigint DEFAULT NULL,
  email varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Not in',
  room_type varchar(20) DEFAULT NULL,
  PRIMARY KEY (C_ID),
  UNIQUE KEY email (email),
  UNIQUE KEY contact (contact)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES customer WRITE;
/*!40000 ALTER TABLE customer DISABLE KEYS */;
/*!40000 ALTER TABLE customer ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS event;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event` varchar(50) DEFAULT NULL,
  organiser varchar(30) DEFAULT NULL,
  contact bigint DEFAULT NULL,
  event_date date DEFAULT NULL,
  hall_no int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES event WRITE;
/*!40000 ALTER TABLE event DISABLE KEYS */;
/*!40000 ALTER TABLE event ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS feedback;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE feedback (
  `Name` varchar(20) DEFAULT NULL,
  Feedback text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES feedback WRITE;
/*!40000 ALTER TABLE feedback DISABLE KEYS */;
/*!40000 ALTER TABLE feedback ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS logs;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `Names` varchar(30) NOT NULL,
  C_ID int DEFAULT NULL,
  check_in date NOT NULL,
  in_time time DEFAULT NULL,
  check_out date DEFAULT NULL,
  out_time time DEFAULT NULL,
  room_no int DEFAULT NULL,
  log_id int NOT NULL,
  PRIMARY KEY (log_id),
  UNIQUE KEY room_no (room_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES logs WRITE;
/*!40000 ALTER TABLE logs DISABLE KEYS */;
/*!40000 ALTER TABLE logs ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS menu;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE menu (
  P_ID int NOT NULL,
  `Name` varchar(20) NOT NULL,
  Price int NOT NULL,
  Category varchar(20) DEFAULT NULL,
  PRIMARY KEY (P_ID),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES menu WRITE;
/*!40000 ALTER TABLE menu DISABLE KEYS */;
INSERT INTO menu VALUES (2344,'DAL MAKHANI',150,'VEG'),(2345,'DAL TADKA',140,'VEG'),(2346,'SHAHI PANEER',199,'VEG'),(2347,'KADHAI PANEER',199,'VEG'),(2348,'PANEER LABABDAR',199,'VEG'),(2349,'PANEER PASANDA',170,'VEG'),(2350,'HIND SPL. PANEER',210,'VEG'),(2351,'SIMPLE SOYA CHAP',150,'VEG'),(2352,'TAWA SOYA CHAP',170,'VEG'),(2353,'KADHAI SOYA CHAP',199,'VEG'),(2354,'MIX VEG',199,'VEG'),(2355,'AALOO GOBHI',160,'VEG'),(2356,'JEERA AALOO',140,'VEG'),(2357,'TAWA ROTI',10,'VEG'),(2358,'PLAIN NAAN',15,'VEG'),(2359,'BUTTER NAAN',20,'VEG'),(2360,'DAL CHAWAL',50,'VEG'),(2361,'RAJMA CHAWAL',130,'VEG'),(2362,'CURRY CHAWAL',120,'VEG'),(2363,'PLAIN DOSA',70,'SOUTH INDIAN'),(2364,'MASALA DOSA',100,'SOUTH INDIAN'),(2365,'MEDU VADA',20,'SOUTH INDIAN'),(2366,'IDLI SAMBHAR',70,'SOUTH INDIAN'),(2367,'UTTAPAM',50,'SOUTH INDIAN'),(2368,'UPMA',40,'SOUTH INDIAN'),(2369,'APPAM',50,'SOUTH INDIAN'),(2370,'PONGAL',80,'SOUTH INDIAN'),(2371,'PESARATTU',50,'SOUTHINDIAN'),(2372,'SAMOSA',10,'SNACKS'),(2373,'VEG CUTTLET',30,'SNACKS'),(2374,'DAHI BHALLE',50,'SNACKS'),(2375,'RAJ KACHORI',60,'SNACKS'),(2376,'PASTA',50,'SNACKS'),(2377,'BURGER',50,'SNACKS'),(2378,'FARM HOUSE PIZZA',159,'SNACKS'),(2379,'MARGRITA PIZZA',179,'SNACKS'),(2380,'CHEESE BURST PIZZA',249,'SNACKS'),(2381,'PANEER CHEESE PIZZA',299,'SNACKS'),(2382,'CHOWMEIN',50,'CHINESE'),(2383,'HAKKA NOODLES',70,'CHINESE'),(2384,'VEG MONCHURIEN',80,'CHINESE'),(2385,'SIMPLE MOMOS',50,'CHINESE'),(2386,'PANEER MOMOS',70,'CHINESE'),(2387,'KURKURE MOMOS',120,'CHINESE'),(2388,'SPRING ROLL',80,'CHINESE'),(2389,'DUMPLINGS',80,'CHINESE'),(2390,'CHICKEN NUGGETS',100,'NON VEG'),(2391,'CHICKEN LEG PIECE',150,'NON VEG'),(2392,'MIX CHICKEN',140,'NON VEG'),(2394,'CHICKEN BIRYANI',199,'NON VEG'),(2395,'CHICKEN LOLIPOP',230,'NON VEG'),(2397,'MASALA CHICKEN',220,'NON VEG'),(2398,'FRIED CHICKEN',250,'NON VEG'),(2399,'CHICKEN CURRY',299,'NON VEG'),(2400,'SPL. CHICKEN TIKKA',299,'NON VEG'),(2401,'FULL CHICKEN THALI',349,'NON VEG'),(2402,'ICE CREAM',50,'DESERT'),(2403,'GULAB JAMUN',10,'DESERT'),(2404,'RASAGULLA',12,'DESERT'),(2405,'JALEBI',30,'DESERT'),(2406,'RAS MALAI',40,'DESERT'),(2407,'MILK SHAKE',80,'DESERT'),(2408,'SMOOTHI',100,'DESERT');
/*!40000 ALTER TABLE menu ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orders (
  C_ID int NOT NULL,
  P_ID int NOT NULL,
  `Name` varchar(20) NOT NULL,
  Amount int NOT NULL,
  Price int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES orders WRITE;
/*!40000 ALTER TABLE orders DISABLE KEYS */;
/*!40000 ALTER TABLE orders ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS rooms;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE rooms (
  room_no int DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES rooms WRITE;
/*!40000 ALTER TABLE rooms DISABLE KEYS */;
INSERT INTO rooms VALUES (100,'vacent','single bedroom'),(101,'vacent','Single Bedroom'),(102,'vacent','Single Bedroom'),(103,'vacent','Single Bedroom'),(104,'vacent','Single Bedroom'),(105,'vacent','Single Bedroom'),(106,'vacent','Single Bedroom'),(107,'vacent','Single Bedroom'),(108,'vacent','Single Bedroom'),(109,'vacent','Single Bedroom'),(110,'vacent','Single Bedroom'),(111,'vacent','Single Bedroom'),(112,'vacent','Single Bedroom'),(113,'vacent','Single Bedroom'),(114,'vacent','Single Bedroom'),(115,'vacent','Single Bedroom'),(116,'vacent','Single Bedroom'),(117,'vacent','Single Bedroom'),(118,'vacent','Single Bedroom'),(119,'vacent','Single Bedroom'),(120,'vacent','Single Bedroom'),(121,'vacent','Single Bedroom'),(122,'vacent','Single Bedroom'),(123,'vacent','Single Bedroom'),(124,'vacent','Single Bedroom'),(125,'vacent','Single Bedroom'),(126,'vacent','Single Bedroom'),(127,'vacent','Single Bedroom'),(128,'vacent','Single Bedroom'),(129,'vacent','Single Bedroom'),(130,'vacent','Single Bedroom'),(131,'vacent','Single Bedroom'),(132,'vacent','Single Bedroom'),(133,'vacent','Single Bedroom'),(134,'vacent','Single Bedroom'),(135,'vacent','Single Bedroom'),(136,'vacent','Single Bedroom'),(137,'vacent','Single Bedroom'),(138,'vacent','Single Bedroom'),(139,'vacent','Single Bedroom'),(140,'vacent','Single Bedroom'),(141,'vacent','Single Bedroom'),(142,'vacent','Single Bedroom'),(143,'vacent','Single Bedroom'),(144,'vacent','Single Bedroom'),(145,'vacent','Single Bedroom'),(146,'vacent','Single Bedroom'),(147,'vacent','Single Bedroom'),(148,'vacent','Single Bedroom'),(149,'vacent','Single Bedroom'),(150,'vacent','Single Bedroom'),(151,'vacent','Single Bedroom'),(152,'vacent','Single Bedroom'),(153,'vacent','Single Bedroom'),(154,'vacent','Single Bedroom'),(155,'vacent','Single Bedroom'),(156,'vacent','Single Bedroom'),(157,'vacent','Single Bedroom'),(158,'vacent','Single Bedroom'),(159,'vacent','Single Bedroom'),(160,'vacent','Single Bedroom'),(161,'vacent','Single Bedroom'),(162,'vacent','Single Bedroom'),(163,'vacent','Single Bedroom'),(164,'vacent','Single Bedroom'),(165,'vacent','Single Bedroom'),(166,'vacent','Single Bedroom'),(167,'vacent','Single Bedroom'),(168,'vacent','Single Bedroom'),(169,'vacent','Single Bedroom'),(170,'vacent','Single Bedroom'),(171,'vacent','Single Bedroom'),(172,'vacent','Single Bedroom'),(173,'vacent','Single Bedroom'),(174,'vacent','Single Bedroom'),(175,'vacent','Single Bedroom'),(176,'vacent','Single Bedroom'),(177,'vacent','Single Bedroom'),(178,'vacent','Single Bedroom'),(179,'vacent','Single Bedroom'),(180,'vacent','Single Bedroom'),(181,'vacent','Single Bedroom'),(182,'vacent','Single Bedroom'),(183,'vacent','Single Bedroom'),(184,'vacent','Single Bedroom'),(185,'vacent','Single Bedroom'),(186,'vacent','Single Bedroom'),(187,'vacent','Single Bedroom'),(188,'vacent','Single Bedroom'),(189,'vacent','Single Bedroom'),(190,'vacent','Single Bedroom'),(191,'vacent','Single Bedroom'),(192,'vacent','Single Bedroom'),(193,'vacent','Single Bedroom'),(194,'vacent','Single Bedroom'),(195,'vacent','Single Bedroom'),(196,'vacent','Single Bedroom'),(197,'vacent','Single Bedroom'),(198,'vacent','Single Bedroom'),(199,'vacent','Single Bedroom'),(200,'vacent','Single Bedroom'),(201,'vacent','Double Bedroom'),(202,'vacent','Double Bedroom'),(203,'vacent','Double Bedroom'),(204,'vacent','Double Bedroom'),(205,'vacent','Double Bedroom'),(206,'vacent','Double Bedroom'),(207,'vacent','Double Bedroom'),(208,'vacent','Double Bedroom'),(209,'vacent','Double Bedroom'),(210,'vacent','Double Bedroom'),(211,'vacent','Double Bedroom'),(212,'vacent','Double Bedroom'),(213,'vacent','Double Bedroom'),(214,'vacent','Double Bedroom'),(215,'vacent','Double Bedroom'),(216,'vacent','Double Bedroom'),(217,'vacent','Double Bedroom'),(218,'vacent','Double Bedroom'),(219,'vacent','Double Bedroom'),(220,'vacent','Double Bedroom'),(221,'vacent','Double Bedroom'),(222,'vacent','Double Bedroom'),(223,'vacent','Double Bedroom'),(224,'vacent','Double Bedroom'),(225,'vacent','Double Bedroom'),(226,'vacent','Double Bedroom'),(227,'vacent','Double Bedroom'),(228,'vacent','Double Bedroom'),(229,'vacent','Double Bedroom'),(230,'vacent','Double Bedroom'),(231,'vacent','Double Bedroom'),(232,'vacent','Double Bedroom'),(233,'vacent','Double Bedroom'),(234,'vacent','Double Bedroom'),(235,'vacent','Double Bedroom'),(236,'vacent','Double Bedroom'),(237,'vacent','Double Bedroom'),(238,'vacent','Double Bedroom'),(239,'vacent','Double Bedroom'),(240,'vacent','Double Bedroom'),(241,'vacent','Double Bedroom'),(242,'vacent','Double Bedroom'),(243,'vacent','Double Bedroom'),(244,'vacent','Double Bedroom'),(245,'vacent','Double Bedroom'),(246,'vacent','Double Bedroom'),(247,'vacent','Double Bedroom'),(248,'vacent','Double Bedroom'),(249,'vacent','Double Bedroom'),(250,'vacent','Double Bedroom'),(251,'vacent','Double Bedroom'),(252,'vacent','Double Bedroom'),(253,'vacent','Double Bedroom'),(254,'vacent','Double Bedroom'),(255,'vacent','Double Bedroom'),(256,'vacent','Double Bedroom'),(257,'vacent','Double Bedroom'),(258,'vacent','Double Bedroom'),(259,'vacent','Double Bedroom'),(260,'vacent','Double Bedroom'),(261,'vacent','Double Bedroom'),(262,'vacent','Double Bedroom'),(263,'vacent','Double Bedroom'),(264,'vacent','Double Bedroom'),(265,'vacent','Double Bedroom'),(266,'vacent','Double Bedroom'),(267,'vacent','Double Bedroom'),(268,'vacent','Double Bedroom'),(269,'vacent','Double Bedroom'),(270,'vacent','Double Bedroom'),(271,'vacent','Double Bedroom'),(272,'vacent','Double Bedroom'),(273,'vacent','Double Bedroom'),(274,'vacent','Double Bedroom'),(275,'vacent','Double Bedroom'),(276,'vacent','Double Bedroom'),(277,'vacent','Double Bedroom'),(278,'vacent','Double Bedroom'),(279,'vacent','Double Bedroom'),(280,'vacent','Double Bedroom'),(281,'vacent','Double Bedroom'),(282,'vacent','Double Bedroom'),(283,'vacent','Double Bedroom'),(284,'vacent','Double Bedroom'),(285,'vacent','Double Bedroom'),(286,'vacent','Double Bedroom'),(287,'vacent','Double Bedroom'),(288,'vacent','Double Bedroom'),(289,'vacent','Double Bedroom'),(290,'vacent','Double Bedroom'),(291,'vacent','Double Bedroom'),(292,'vacent','Double Bedroom'),(293,'vacent','Double Bedroom'),(294,'vacent','Double Bedroom'),(295,'vacent','Double Bedroom'),(296,'vacent','Double Bedroom'),(297,'vacent','Double Bedroom'),(298,'vacent','Double Bedroom'),(299,'vacent','Double Bedroom'),(300,'vacent','Double Bedroom'),(301,'vacent','Dulex Double Bedroom'),(302,'vacent','Dulex Double Bedroom'),(303,'vacent','Dulex Double Bedroom'),(304,'vacent','Dulex Double Bedroom'),(305,'vacent','Dulex Double Bedroom'),(306,'vacent','Dulex Double Bedroom'),(307,'vacent','Dulex Double Bedroom'),(308,'vacent','Dulex Double Bedroom'),(309,'vacent','Dulex Double Bedroom'),(310,'vacent','Dulex Double Bedroom'),(311,'vacent','Dulex Double Bedroom'),(312,'vacent','Dulex Double Bedroom'),(313,'vacent','Dulex Double Bedroom'),(314,'vacent','Dulex Double Bedroom'),(315,'vacent','Dulex Double Bedroom'),(316,'vacent','Dulex Double Bedroom'),(317,'vacent','Dulex Double Bedroom'),(318,'vacent','Dulex Double Bedroom'),(319,'vacent','Dulex Double Bedroom'),(320,'vacent','Dulex Double Bedroom'),(321,'vacent','Dulex Double Bedroom'),(322,'vacent','Dulex Double Bedroom'),(323,'vacent','Dulex Double Bedroom'),(324,'vacent','Dulex Double Bedroom'),(325,'vacent','Dulex Double Bedroom'),(326,'vacent','Dulex Double Bedroom'),(327,'vacent','Dulex Double Bedroom'),(328,'vacent','Dulex Double Bedroom'),(329,'vacent','Dulex Double Bedroom'),(330,'vacent','Dulex Double Bedroom'),(331,'vacent','Dulex Double Bedroom'),(332,'vacent','Dulex Double Bedroom'),(333,'vacent','Dulex Double Bedroom'),(334,'vacent','Dulex Double Bedroom'),(335,'vacent','Dulex Double Bedroom'),(336,'vacent','Dulex Double Bedroom'),(337,'vacent','Dulex Double Bedroom'),(338,'vacent','Dulex Double Bedroom'),(339,'vacent','Dulex Double Bedroom'),(340,'vacent','Dulex Double Bedroom'),(341,'vacent','Dulex Double Bedroom'),(342,'vacent','Dulex Double Bedroom'),(343,'vacent','Dulex Double Bedroom'),(344,'vacent','Dulex Double Bedroom'),(345,'vacent','Dulex Double Bedroom'),(346,'vacent','Dulex Double Bedroom'),(347,'vacent','Dulex Double Bedroom'),(348,'vacent','Dulex Double Bedroom'),(349,'vacent','Dulex Double Bedroom'),(350,'vacent','Dulex Double Bedroom'),(351,'vacent','Dulex Double Bedroom'),(352,'vacent','Dulex Double Bedroom'),(353,'vacent','Dulex Double Bedroom'),(354,'vacent','Dulex Double Bedroom'),(355,'vacent','Dulex Double Bedroom'),(356,'vacent','Dulex Double Bedroom'),(357,'vacent','Dulex Double Bedroom'),(358,'vacent','Dulex Double Bedroom'),(359,'vacent','Dulex Double Bedroom'),(360,'vacent','Dulex Double Bedroom'),(361,'vacent','Dulex Double Bedroom'),(362,'vacent','Dulex Double Bedroom'),(363,'vacent','Dulex Double Bedroom'),(364,'vacent','Dulex Double Bedroom'),(365,'vacent','Dulex Double Bedroom'),(366,'vacent','Dulex Double Bedroom'),(367,'vacent','Dulex Double Bedroom'),(368,'vacent','Dulex Double Bedroom'),(369,'vacent','Dulex Double Bedroom'),(370,'vacent','Dulex Double Bedroom'),(371,'vacent','Dulex Double Bedroom'),(372,'vacent','Dulex Double Bedroom'),(373,'vacent','Dulex Double Bedroom'),(374,'vacent','Dulex Double Bedroom'),(375,'vacent','Dulex Double Bedroom'),(376,'vacent','Dulex Double Bedroom'),(377,'vacent','Dulex Double Bedroom'),(378,'vacent','Dulex Double Bedroom'),(379,'vacent','Dulex Double Bedroom'),(380,'vacent','Dulex Double Bedroom'),(381,'vacent','Dulex Double Bedroom'),(382,'vacent','Dulex Double Bedroom'),(383,'vacent','Dulex Double Bedroom'),(384,'vacent','Dulex Double Bedroom'),(385,'vacent','Dulex Double Bedroom'),(386,'vacent','Dulex Double Bedroom'),(387,'vacent','Dulex Double Bedroom'),(388,'vacent','Dulex Double Bedroom'),(389,'vacent','Dulex Double Bedroom'),(390,'vacent','Dulex Double Bedroom'),(391,'vacent','Dulex Double Bedroom'),(392,'vacent','Dulex Double Bedroom'),(393,'vacent','Dulex Double Bedroom'),(394,'vacent','Dulex Double Bedroom'),(395,'vacent','Dulex Double Bedroom'),(396,'vacent','Dulex Double Bedroom'),(397,'vacent','Dulex Double Bedroom'),(398,'vacent','Dulex Double Bedroom'),(399,'vacent','Dulex Double Bedroom'),(400,'vacent','Dulex Double Bedroom'),(401,'vacent','Luxary'),(402,'vacent','Luxary'),(403,'vacent','Luxary'),(404,'vacent','Luxary'),(405,'vacent','Luxary'),(406,'vacent','Luxary'),(407,'vacent','Luxary'),(408,'vacent','Luxary'),(409,'vacent','Luxary'),(410,'vacent','Luxary'),(411,'vacent','Luxary'),(412,'vacent','Luxary'),(413,'vacent','Luxary'),(414,'vacent','Luxary'),(415,'vacent','Luxary'),(416,'vacent','Luxary'),(417,'vacent','Luxary'),(418,'vacent','Luxary'),(419,'vacent','Luxary'),(420,'vacent','Luxary'),(421,'vacent','Luxary'),(422,'vacent','Luxary'),(423,'vacent','Luxary'),(424,'vacent','Luxary'),(425,'vacent','Luxary'),(426,'vacent','Luxary'),(427,'vacent','Luxary'),(428,'vacent','Luxary'),(429,'vacent','Luxary'),(430,'vacent','Luxary'),(431,'vacent','Luxary'),(432,'vacent','Luxary'),(433,'vacent','Luxary'),(434,'vacent','Luxary'),(435,'vacent','Luxary'),(436,'vacent','Luxary'),(437,'vacent','Luxary'),(438,'vacent','Luxary'),(439,'vacent','Luxary'),(440,'vacent','Luxary'),(441,'vacent','Luxary'),(442,'vacent','Luxary'),(443,'vacent','Luxary'),(444,'vacent','Luxary'),(445,'vacent','Luxary'),(446,'vacent','Luxary'),(447,'vacent','Luxary'),(448,'vacent','Luxary'),(449,'vacent','Luxary'),(450,'vacent','Luxary'),(451,'vacent','Luxary'),(452,'vacent','Luxary'),(453,'vacent','Luxary'),(454,'vacent','Luxary'),(455,'vacent','Luxary'),(456,'vacent','Luxary'),(457,'vacent','Luxary'),(458,'vacent','Luxary'),(459,'vacent','Luxary'),(460,'vacent','Luxary'),(461,'vacent','Luxary'),(462,'vacent','Luxary'),(463,'vacent','Luxary'),(464,'vacent','Luxary'),(465,'vacent','Luxary'),(466,'vacent','Luxary'),(467,'vacent','Luxary'),(468,'vacent','Luxary'),(469,'vacent','Luxary'),(470,'vacent','Luxary'),(471,'vacent','Luxary'),(472,'vacent','Luxary'),(473,'vacent','Luxary'),(474,'vacent','Luxary'),(475,'vacent','Luxary'),(476,'vacent','Luxary'),(477,'vacent','Luxary'),(478,'vacent','Luxary'),(479,'vacent','Luxary'),(480,'vacent','Luxary'),(481,'vacent','Luxary'),(482,'vacent','Luxary'),(483,'vacent','Luxary'),(484,'vacent','Luxary'),(485,'vacent','Luxary'),(486,'vacent','Luxary'),(487,'vacent','Luxary'),(488,'vacent','Luxary'),(489,'vacent','Luxary'),(490,'vacent','Luxary'),(491,'vacent','Luxary'),(492,'vacent','Luxary'),(493,'vacent','Luxary'),(494,'vacent','Luxary'),(495,'vacent','Luxary'),(496,'vacent','Luxary'),(497,'vacent','Luxary'),(498,'vacent','Luxary'),(499,'vacent','Luxary'),(500,'vacent','Luxary');
/*!40000 ALTER TABLE rooms ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 23:28:09

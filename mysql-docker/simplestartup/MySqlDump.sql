-- MySQL dump 10.13  Distrib 8.0.30, for Linux (aarch64)
--
-- Host: localhost    Database: myloves
-- ------------------------------------------------------
-- Server version       8.0.30
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `addressLine1` varchar(500) DEFAULT NULL,
  `addressLine2` varchar(500) DEFAULT NULL,
  `birthMonth` int DEFAULT NULL,
  `birthYear` int DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jerry','Smith','123 Test Lane',NULL,1,1990);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userFoodLove`
--

DROP TABLE IF EXISTS `userFoodLove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userFoodLove` (
  `userId` int NOT NULL,
  `foodName` varchar(100) NOT NULL,
  `foodDetails` varchar(1000) NOT NULL,
  `foodUrl` varchar(500) DEFAULT NULL,
  `foodVendor` varchar(500) DEFAULT NULL,
  `foodVendorUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`userId`,`foodName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userFoodLove`
--

LOCK TABLES `userFoodLove` WRITE;
/*!40000 ALTER TABLE `userFoodLove` DISABLE KEYS */;
INSERT INTO `userFoodLove` VALUES (1,'Berlin Doner Kebab','If you travel to Berlin you have to try this delicious Middle Eastern Kebab that is iconic there.  I\'m partial to the lamb meat filling.',NULL,NULL,NULL),(1,'Choo Chee Curry Salmon','This is the most delicious curry you\'ll ever eat.  If you like moderately spicy Thai food, you have to try this!',NULL,NULL,NULL),(1,'Grape Nuts Ice Cream','This is a delicious, adult ice cream.  Grape Nuts in delicious vanilla ice cream.  Just the right crunch and sweetness after the beach on a summer afternoon.','Unspecified','Far Fars in Duxbury, MA','Unspecified'),(1,'Hot Pastrami Sub','There is nothing like a hot pastrami sub with provolone cheese and spicy mustard!  Yum!  My favorite places to get one are Lamberts in Norwood and The Linden Deli in Wellesley.','Unspecified','Unspecified','Unspecified'),(1,'Meat Lasagna','Colleen makes my favorite meat lasagna in the world!','Unspecified','Unspecified','Unspecified'),(1,'Polar Seltzer Lime','Great tasting sparkline water','Unspecified','Server=127.0.0.1;Port=3306;Database=myloves;Uid=root;Pwd=supersecret','Unspecified'),(1,'Spaghetti Carbonara','This is so delicious.  My favorite place to eat this is Il Massimo','https://cooking.nytimes.com/recipes/12965-spaghetti-carbonara','Il Massimo','https://massimori.com/menu/');
/*!40000 ALTER TABLE `userFoodLove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userPlaceLove`
--

DROP TABLE IF EXISTS `userPlaceLove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userPlaceLove` (
  `userId` int NOT NULL,
  `placeName` varchar(500) NOT NULL,
  `placeDetails` varchar(1000) NOT NULL,
  `placeMapUrl` varchar(500) DEFAULT NULL,
  `placeOfficialUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`userId`,`placeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userPlaceLove`
--

LOCK TABLES `userPlaceLove` WRITE;
/*!40000 ALTER TABLE `userPlaceLove` DISABLE KEYS */;
INSERT INTO `userPlaceLove` VALUES (1,'Berlin, Germany','Berlin is such a fascinating and modern place that is very English speaker friendly.  It has great food, a hip culture scene, excellent public transportation (except for their poor airports), and its amazing cold war history.  It is very bike friendly also and the weather is wonderful.  I highly recommend visiting.','https://goo.gl/maps/yA9EQUBJyjGApLFn6',NULL);
/*!40000 ALTER TABLE `userPlaceLove` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-10 22:57:50
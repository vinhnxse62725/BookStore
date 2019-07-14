CREATE DATABASE  IF NOT EXISTS `BookStore` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `BookStore`;
-- MySQL dump 10.13  Distrib 5.7.26, for Win32 (AMD64)
--
-- Host: bookstore.celyxksxnsuq.ap-southeast-1.rds.amazonaws.com    Database: BookStore
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `discount` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa2lewbtksokxu8gdlb16j5dyq` (`categoryid`),
  CONSTRAINT `FKa2lewbtksokxu8gdlb16j5dyq` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Hamlet','This tale of the immortal Prince of Denmark delves deeply into the complexities of the human soul as it recounts Hamlet\'s tragic struggle to avenge his father\'s death. Books in this new, illustrated series present complete texts of Shakespeare\'s plays. However, the lines are set up so students can see the bard\'s original poetic phrases printed side-by-side and line-by-line with a modern \"translation\" on the facing page. Starting in the late 1580s and for several decades that followed, Shakespeare\'s plays were popular entertainment for London\'s theatergoers. His Globe Theatre was the equivalent of a Broadway theater in today\'s New York. The plays have endured, but over the course of 400+ years, the English language has changed in many ways--which is why today\'s students often find Shakespeare\'s idiom difficult to comprehend. Simply Shakespeare offers an excellent solution to their problem. Introducing each play is a general essay covering Shakespeare\'s life and times. At the beginning of each of the five acts in every play, a two-page spread describes what is about to take place. The story\'s background is explained, followed by brief descriptions of key people who will appear in the act, details students should watch for as the story unfolds, discussion of the play\'s historical context, how the play was staged in Shakespeare\'s day, and explanation of puns and plays on words that occur in characters\' dialogues. Identifying icons preceding each of these study points are printed in a second color, then are located again as cross-references in the play\'s original text. For instance, where words spoken by a person in the play offer insights into his or another character\'s personality, the \"Characters\" icon will appear as a cross-reference in both the introductory spread and the play proper. Following each act, a closing spread presents questions and discussion points for use as teachers\' aids. Guided by the inspiring format of this fine new series, both teachers and students will come to understand and appreciate the genius of Shakespeare as never before.',10,'https://img.thriftbooks.com/api/images/l/9dfc64b690179b709261fd39e4f8a95f0b017fb9.jpg',120000,120,_binary '',2),(2,'If I Stay','The critically acclaimed, bestselling novel from Gayle Forman, author of Where She Went, Just One Day, and Just One Year. Soon to be a major motion picture, starring Chloe Moretz! In the blink of an eye everything changes. Seventeen ­year-old Mia has no memory of the accident; she can only recall what happened afterwards, watching her own damaged body being taken from the wreck. Little by little she struggles to put together the pieces- to figure out what she has lost, what she has left, and the very difficult choice she must make. Heartwrenchingly beautiful, this will change the way you look at life, love, and family. Now a major motion picture starring Chloe Grace Moretz, Mia\'s story will stay with you for a long, long time.',30,'https://images-na.ssl-images-amazon.com/images/I/41PfwxtnyTL._SL300_.jpg',150000,220,_binary '',2),(3,'Pilgrim\'s Progress','From the publisher who gave you the immensly popular James ussher\'s Annals Of The World: - John Bunyan\'s personal memoir- His last sermon- Special sayings of Bunyan, about death and judgment, the joys of heaven, and much more- Bunyan\'s personal account of his life before he accepted Christ- The writer\'s account of his time spent in prison- The Barren Fig Tree- The Holy War Made by Shaddai Upon Diabolus for the Regaining of the Metropolis of the World',25,'https://img.thriftbooks.com/api/images/l/f16c60cbbf90109ea7314d02aa4ce2ac269d1818.jpg',125000,0,_binary '\0',2),(4,'Niv Women\'s Devotional Bible : A New Collection of Daily Devotions from Godly Women','A second volume of devotions written by and for today\'s Christian woman, with complete NIV text - A year of devotions by godly women - Author index with biographical information on each contributor, plus subject index - Also available in the New Revised Standard Version',20,'https://images-na.ssl-images-amazon.com/images/I/41nkzoXxPLL._SL300_.jpg',100000,125,_binary '',2),(5,'Angels & Demons','From the #1 New York Times bestselling author of The Da Vinci Code comes the explosive thriller that started it all.An ancient secret brotherhood. A devastating new weapon of destruction. An unthinkable target. When world-renowned Harvard symbologist Robert Langdon is summoned to his first assignment to a Swiss research facility to analyze a mysterious symbol -- seared into the chest of a murdered physicist -- he discovers evidence of the unimaginable: the resurgence of an ancient secret brotherhood known as the Illuminati...the most powerful underground organization ever to walk the earth. The Illuminati has now surfaced to carry out the final phase of its legendary vendetta against its most hated enemy -- the Catholic Church. Langdon\'s worst fears are confirmed on the eve of the Vatican\'s holy conclave, when a messenger of the Illuminati announces they have hidden an unstoppable time bomb at the very heart of Vatican City. With the countdown under way, Langdon jets to Rome to join forces with Vittoria Vetra, a beautiful and mysterious Italian scientist, to assist the Vatican in a desperate bid for survival. Embarking on a frantic hunt through sealed crypts, dangerous catacombs, deserted cathedrals, and the most secretive vault on earth, Langdon and Vetra follow a 400-year-old trail of ancient symbols that snakes across Rome toward the long-forgotten Illuminati lair...a clandestine location that contains the only hope for Vatican salvation. Critics have praised the exhilarating blend of relentless adventure, scholarly intrigue, and cutting wit found in Brown\'s remarkable thrillers featuring Robert Langdon. An explosive international suspense, Angels & Demons marks this hero\'s first adventure as it careens from enlightening epiphanies to dark truths as the battle between science and religion turns to war.',15,'https://images-na.ssl-images-amazon.com/images/I/51Ecr94gwyL._SL300_.jpg',130000,220,_binary '',2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'All'),(2,'Arts & Music'),(3,'Biographies'),(4,'Business'),(5,'Comics'),(6,'Computers & Tech'),(7,'Cooking'),(8,'Kids'),(9,'Hobbies & Crafts'),(10,'Edu & Reference'),(11,'Health & Fitness'),(12,'Literature & Fiction'),(13,'Medical'),(14,'Romance'),(15,'Science & Math'),(16,'Sci-Fi & Fantasy'),(17,'Self-Help'),(18,'Travel');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnfh10o56vk19716ugp7uug3fx` (`bookid`),
  KEY `FK715ucxrvknue1cfnb458qh5n5` (`orderid`),
  CONSTRAINT `FK715ucxrvknue1cfnb458qh5n5` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKnfh10o56vk19716ugp7uug3fx` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp23lx8o6n71bl0y4klavavbea` (`customerid`),
  CONSTRAINT `FKp23lx8o6n71bl0y4klavavbea` FOREIGN KEY (`customerid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `customerid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Supplier',22,'user1','vinhnxse62725@gmail.com','user','Male',_binary '\0',_binary '\0','$2a$10$XPgg/OAgto4qU2Oi7d84j.4lFrSQSxO1POBxeRVZFy3it1HITnvte','0123456789');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-12 20:26:16

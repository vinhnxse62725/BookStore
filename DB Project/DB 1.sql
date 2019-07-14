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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Hamlet','This tale of the immortal Prince of Denmark delves deeply into the complexities of the human soul as it recounts Hamlet\'s tragic struggle to avenge his father\'s death. Books in this new, illustrated series present complete texts of Shakespeare\'s plays. However, the lines are set up so students can see the bard\'s original poetic phrases printed side-by-side and line-by-line with a modern \"translation\" on the facing page. Starting in the late 1580s and for several decades that followed, Shakespeare\'s plays were popular entertainment for London\'s theatergoers. His Globe Theatre was the equivalent of a Broadway theater in today\'s New York. The plays have endured, but over the course of 400+ years, the English language has changed in many ways--which is why today\'s students often find Shakespeare\'s idiom difficult to comprehend. Simply Shakespeare offers an excellent solution to their problem. Introducing each play is a general essay covering Shakespeare\'s life and times. At the beginning of each of the five acts in every play, a two-page spread describes what is about to take place. The story\'s background is explained, followed by brief descriptions of key people who will appear in the act, details students should watch for as the story unfolds, discussion of the play\'s historical context, how the play was staged in Shakespeare\'s day, and explanation of puns and plays on words that occur in characters\' dialogues. Identifying icons preceding each of these study points are printed in a second color, then are located again as cross-references in the play\'s original text. For instance, where words spoken by a person in the play offer insights into his or another character\'s personality, the \"Characters\" icon will appear as a cross-reference in both the introductory spread and the play proper. Following each act, a closing spread presents questions and discussion points for use as teachers\' aids. Guided by the inspiring format of this fine new series, both teachers and students will come to understand and appreciate the genius of Shakespeare as never before.',10,'https://img.thriftbooks.com/api/images/l/9dfc64b690179b709261fd39e4f8a95f0b017fb9.jpg',120000,120,_binary '',2),(2,'If I Stay','The critically acclaimed, bestselling novel from Gayle Forman, author of Where She Went, Just One Day, and Just One Year. Soon to be a major motion picture, starring Chloe Moretz! In the blink of an eye everything changes. Seventeen ­year-old Mia has no memory of the accident; she can only recall what happened afterwards, watching her own damaged body being taken from the wreck. Little by little she struggles to put together the pieces- to figure out what she has lost, what she has left, and the very difficult choice she must make. Heartwrenchingly beautiful, this will change the way you look at life, love, and family. Now a major motion picture starring Chloe Grace Moretz, Mia\'s story will stay with you for a long, long time.',30,'https://images-na.ssl-images-amazon.com/images/I/41PfwxtnyTL._SL300_.jpg',150000,220,_binary '',2),(3,'Pilgrim\'s Progress','From the publisher who gave you the immensly popular James ussher\'s Annals Of The World: - John Bunyan\'s personal memoir- His last sermon- Special sayings of Bunyan, about death and judgment, the joys of heaven, and much more- Bunyan\'s personal account of his life before he accepted Christ- The writer\'s account of his time spent in prison- The Barren Fig Tree- The Holy War Made by Shaddai Upon Diabolus for the Regaining of the Metropolis of the World',25,'https://img.thriftbooks.com/api/images/l/f16c60cbbf90109ea7314d02aa4ce2ac269d1818.jpg',125000,0,_binary '\0',2),(4,'Niv Women\'s Devotional Bible : A New Collection of Daily Devotions from Godly Women','A second volume of devotions written by and for today\'s Christian woman, with complete NIV text - A year of devotions by godly women - Author index with biographical information on each contributor, plus subject index - Also available in the New Revised Standard Version',20,'https://images-na.ssl-images-amazon.com/images/I/41nkzoXxPLL._SL300_.jpg',100000,125,_binary '',2),(5,'Angels & Demons','From the #1 New York Times bestselling author of The Da Vinci Code comes the explosive thriller that started it all.An ancient secret brotherhood. A devastating new weapon of destruction. An unthinkable target. When world-renowned Harvard symbologist Robert Langdon is summoned to his first assignment to a Swiss research facility to analyze a mysterious symbol -- seared into the chest of a murdered physicist -- he discovers evidence of the unimaginable: the resurgence of an ancient secret brotherhood known as the Illuminati...the most powerful underground organization ever to walk the earth. The Illuminati has now surfaced to carry out the final phase of its legendary vendetta against its most hated enemy -- the Catholic Church. Langdon\'s worst fears are confirmed on the eve of the Vatican\'s holy conclave, when a messenger of the Illuminati announces they have hidden an unstoppable time bomb at the very heart of Vatican City. With the countdown under way, Langdon jets to Rome to join forces with Vittoria Vetra, a beautiful and mysterious Italian scientist, to assist the Vatican in a desperate bid for survival. Embarking on a frantic hunt through sealed crypts, dangerous catacombs, deserted cathedrals, and the most secretive vault on earth, Langdon and Vetra follow a 400-year-old trail of ancient symbols that snakes across Rome toward the long-forgotten Illuminati lair...a clandestine location that contains the only hope for Vatican salvation. Critics have praised the exhilarating blend of relentless adventure, scholarly intrigue, and cutting wit found in Brown\'s remarkable thrillers featuring Robert Langdon. An explosive international suspense, Angels & Demons marks this hero\'s first adventure as it careens from enlightening epiphanies to dark truths as the battle between science and religion turns to war.',15,'https://images-na.ssl-images-amazon.com/images/I/51Ecr94gwyL._SL300_.jpg',130000,220,_binary '',2),(11,'Bram Stoker\'s Dracula','Not for the faint of heart! Award-winning artist Gary Blythe brilliantly captures the eerie mood of Bram Stoker\'s uneasy tale, expertly edited for today\'s reader. Can there be a more terrifying tale than this? The story of the notorious vampire Count Dracula, lord of the undead, who rises from his coffin at night to suck the blood of the living is, undoubtedly, the stuff of nightmares. A lunatic asylum, a bleak Transylvanian castle, an ancient cemetary . . . these are the dark backgrounds to the even darker deeds portrayed in this most bloodcurdling of tales. Narrated from several viewpoints, DRACULA is a complex story that many know, but few have actually read. Jan Needle\'s newly edited version makes the gripping events accessible to the twenty-first reader without losing the incomparably chilling atmosphere of Bram Stoker\'s original novel.',20,'https://img.thriftbooks.com/api/images/l/cd6bb5cc89dd5ef9024e7e90a6ada30af77e51c1.jpg',115000,200,_binary '',2),(12,'The Hiding Place','\"Every experience God gives us . . . is the perfect preparation for the future only He can see.\"--Corrie ten BoomCorrie ten Boom was a Dutch watchmaker who became a heroine of the Resistance, a survivor of Hitler\'s concentration camps, and one of the most remarkable evangelists of the twentieth century. In World War II she and her family risked their lives to help Jews and underground workers escape from the Nazis, and for their work they were tested in the infamous Nazi death camps. Only Corrie among her family survived to tell the story of how faith ultimately triumphs over evil.Here is the riveting account of how Corrie and her family were able to save many of God\'s chosen people. For 35 years millions have seen that there is no pit so deep that God\'s love is not deeper still. Now The Hiding Place, repackaged for a new generation of readers, continues to declare that God\'s love will overcome, heal, and restore.\"A groundbreaking book that shines a clear light on one of the darkest moments of history.\"--Philip Yancey, author, The Jesus I Never Knew \"Ten Boom\'s classic is even more relevant to the present hour than at the time of its writing. We . . . need to be inspired afresh by the courage manifested by her family.\"--Jack W. Hayford, president, International Foursquare Church; chancellor, The King\'s College and Seminary\"The Hiding Place is a classic that begs revisiting. Corrie ten Boom lived the deeper life with God. Her gripping story of love in action will challenge and inspire you!\"--Joyce Meyer, best-selling author and Bible teacher',25,'https://images-na.ssl-images-amazon.com/images/I/51XFKp6q0-L._SL300_.jpg',140000,125,_binary '',3),(13,'Narrative of the Life of Frederick Douglas : An American Slave','The story of Frederick Douglass is passionate, harrowing, and inspiring. As a former slave, impassioned abolitionist, gifted writer, newspaper editor, and powerful orator, Douglass was an immense, motivational figure. His early life, filled with physical abuse, deprivation, and tragedy, adds up to a heart-wrenching history. However, he was able to overcome everything that bound a slave to his life and become a leading spokesman for his people. In this first of his three autobiographies, Douglass relates graphic descriptions of his childhood, his shocking experiences as a slave, and his thrilling escape from slavery to safety in the North and his pivotal freedom. Originally published in 1845, a date significant for the fact that very few African Americans could read or write at that time, this tale of sadness, danger, and eventual liberation will appeal to readers of all kinds. For those interested in African American history and the life of one of the most daring and heroic champions of civil rights, this page-turner is a perfect library addition.',12,'https://images-na.ssl-images-amazon.com/images/I/41ZYUb0bHBL._SL300_.jpg',126000,236,_binary '',3),(14,'Dreams from My Father: A Story of Race and Inheritance','In this lyrical, unsentimental, and compelling memoir, the son of a black African father and a white American mother searches for a workable meaning to his life as a black American. It begins in New York, where Barack Obama learns that his father—a figure he knows more as a myth than as a man—has been killed in a car accident. This sudden death inspires an emotional odyssey—first to a small town in Kansas, from which he retraces the migration of his mother’s family to Hawaii, and then to Kenya, where he meets the African side of his family, confronts the bitter truth of his father’s life, and at last reconciles his divided inheritance. Pictured in lefthand photograph on cover: Habiba Akumu Hussein and Barack Obama, Sr. (President Obama\'s paternal grandmother and his father as a young boy). Pictured in righthand photograph on cover: Stanley Dunham and Ann Dunham (President Obama\'s maternal grandfather and his mother as a young girl). ',24,'https://images-na.ssl-images-amazon.com/images/I/51TdV%2B4rjSL._SL300_.jpg',162000,135,_binary '',3),(15,'The Color of Water : A Black Man\'s Tribute to His White Mother','From the New York Times bestselling author of The Good Lord Bird , winner of the 2013 National Book Award for Fiction, and Kill \'Em and Leave , a James Brown biography. Celebrating the 20th anniversary of the book that launched James McBride\'s literary career Over two years on The New York Times bestseller list Who is Ruth McBride Jordan? A self-declared \"light-skinned\" woman evasive about her ethnicity, yet steadfast in her love for her twelve black children. James McBride, journalist, musician, and son, explores his mother\'s past, as well as his own upbringing and heritage, in a poignant and powerful debut, The Color Of Water: A Black Man\'s Tribute to His White Mother . The son of a black minister and a woman who would not admit she was white, James McBride grew up in \"orchestrated chaos\" with his eleven siblings in the poor, all-black projects of Red Hook, Brooklyn. \"Mommy,\" a fiercely protective woman with \"dark eyes full of pep and fire,\" herded her brood to Manhattan\'s free cultural events, sent them off on buses to the best (and mainly Jewish) schools, demanded good grades, and commanded respect. As a young man, McBride saw his mother as a source of embarrassment, worry, and confusion and reached thirty before he began to discover the truth about her early life and long-buried pain. In The Color of Water , McBride retraces his mother\'s footsteps and, through her searing and spirited voice, recreates her remarkable story. The daughter of a failed itinerant Orthodox rabbi, she was born Rachel Shilsky (actually Ruchel Dwara Zylska) in Poland on April 1, 1921. Fleeing pogroms, her family emigrated to America and ultimately settled in Suffolk, Virginia, a small town where anti-Semitism and racial tensions ran high. With candor and immediacy, Ruth describes her parents\' loveless marriage; her fragile, handicapped mother; her cruel, sexually-abusive father; and the rest of the family and life she abandoned. At seventeen, after fleeing Virginia and settling in New York City, Ruth married a black minister and founded the all- black New Brown Memorial Baptist Church in her Red Hook living room. \"God is the color of water,\" Ruth McBride taught her children, firmly convinced that life\'s blessings and life\'s values transcend race. Twice widowed, and continually confronting overwhelming adversity and racism, Ruth\'s determination, drive and discipline saw her dozen children through college and most through graduate school. At age 65, she herself received a degree in social work from Temple University. Interspersed throughout his mother\'s compelling narrative, McBride shares candid recollections of his own experiences as a mixed-race child of poverty, his flirtations with drugs and violence, and his eventual self- realization and professional success. The Color of Water touches readers of all colors as a vivid portrait of growing up, a haunting meditation on race and identity, and a lyrical valentine to a mother from her son. \"',5,'https://img.thriftbooks.com/api/images/l/95b2cf3cff3c2e145aa914afe4333c41d8adc13f.jpg',100000,0,_binary '\0',3),(16,'The Investment Answer : Learn to Manage Your Money and Protect Your Financial Future','What if there were a way to cut through all the financial mumbo-jumbo? Wouldn\'t it be great if someone could really explain to us-in plain and simple English-the basics we must know about investing in order to insure our financial freedom? At last, here\'s good news. Jargon-free and written for all investors-experienced, beginner, and everyone in between-THE INVESTMENT ANSWER distills the process into just five decisions-five straightforward choices that can lead to safe and sound ways to manage your money. When Wall Street veteran Gordon Murray told his good friend and financial advisor, Dan Goldie, that he had only six months to live, Dan responded, \"Do you want to write that book you\'ve always wanted to do?\" The result is this eminently valuable primer which can be read and understood in one sitting, and has advice that benefits you, not Wall Street and the rest of the traditional financial services industry. THE INVESTMENT ANSWER asks readers to make five basic but key decisions to stack the investment odds in their favor. The advice is simple, easy-to-follow, and effective, and can lead to a more profitable portfolio for every investor. Specifically: * Should I invest on my own or seek help from an investment professional? * How should I allocate my investments among stocks, bonds, and cash? * Which specific asset classes within these broad categories should I include in my portfolio? * Should I take an actively managed approach to investing, or follow a passive alternative? * When should I sell assets and when should I buy more? In a world of fast-talking traders who believe that they can game the system and a market characterized by instability, this extraordinary and timely book offers guidance every investor should have.',10,'https://img.thriftbooks.com/api/images/l/07e35e58d2acad9b8ed3037c9bfdef9c82eee69e.jpg',126000,122,_binary '',4);
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

-- Dump completed on 2019-07-12 20:53:31

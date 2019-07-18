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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Hamlet','This tale of the immortal Prince of Denmark delves deeply into the complexities of the human soul as it recounts Hamlet\'s tragic struggle to avenge his father\'s death. Books in this new, illustrated series present complete texts of Shakespeare\'s plays. However, the lines are set up so students can see the bard\'s original poetic phrases printed side-by-side and line-by-line with a modern \"translation\" on the facing page. Starting in the late 1580s and for several decades that followed, Shakespeare\'s plays were popular entertainment for London\'s theatergoers. His Globe Theatre was the equivalent of a Broadway theater in today\'s New York. The plays have endured, but over the course of 400+ years, the English language has changed in many ways--which is why today\'s students often find Shakespeare\'s idiom difficult to comprehend. Simply Shakespeare offers an excellent solution to their problem. Introducing each play is a general essay covering Shakespeare\'s life and times. At the beginning of each of the five acts in every play, a two-page spread describes what is about to take place. The story\'s background is explained, followed by brief descriptions of key people who will appear in the act, details students should watch for as the story unfolds, discussion of the play\'s historical context, how the play was staged in Shakespeare\'s day, and explanation of puns and plays on words that occur in characters\' dialogues. Identifying icons preceding each of these study points are printed in a second color, then are located again as cross-references in the play\'s original text. For instance, where words spoken by a person in the play offer insights into his or another character\'s personality, the \"Characters\" icon will appear as a cross-reference in both the introductory spread and the play proper. Following each act, a closing spread presents questions and discussion points for use as teachers\' aids. Guided by the inspiring format of this fine new series, both teachers and students will come to understand and appreciate the genius of Shakespeare as never before.',10,'https://img.thriftbooks.com/api/images/l/9dfc64b690179b709261fd39e4f8a95f0b017fb9.jpg',120000,120,_binary '',2),(2,'If I Stay','The critically acclaimed, bestselling novel from Gayle Forman, author of Where She Went, Just One Day, and Just One Year. Soon to be a major motion picture, starring Chloe Moretz! In the blink of an eye everything changes. Seventeen ­year-old Mia has no memory of the accident; she can only recall what happened afterwards, watching her own damaged body being taken from the wreck. Little by little she struggles to put together the pieces- to figure out what she has lost, what she has left, and the very difficult choice she must make. Heartwrenchingly beautiful, this will change the way you look at life, love, and family. Now a major motion picture starring Chloe Grace Moretz, Mia\'s story will stay with you for a long, long time.',30,'https://images-na.ssl-images-amazon.com/images/I/41PfwxtnyTL._SL300_.jpg',150000,220,_binary '',2),(3,'Pilgrim\'s Progress','From the publisher who gave you the immensly popular James ussher\'s Annals Of The World: - John Bunyan\'s personal memoir- His last sermon- Special sayings of Bunyan, about death and judgment, the joys of heaven, and much more- Bunyan\'s personal account of his life before he accepted Christ- The writer\'s account of his time spent in prison- The Barren Fig Tree- The Holy War Made by Shaddai Upon Diabolus for the Regaining of the Metropolis of the World',25,'https://img.thriftbooks.com/api/images/l/f16c60cbbf90109ea7314d02aa4ce2ac269d1818.jpg',125000,0,_binary '\0',2),(4,'Niv Women\'s Devotional Bible : A New Collection of Daily Devotions from Godly Women','A second volume of devotions written by and for today\'s Christian woman, with complete NIV text - A year of devotions by godly women - Author index with biographical information on each contributor, plus subject index - Also available in the New Revised Standard Version',20,'https://images-na.ssl-images-amazon.com/images/I/41nkzoXxPLL._SL300_.jpg',100000,125,_binary '',2),(5,'Angel And Demon','From the #1 New York Times bestselling author of The Da Vinci Code comes the explosive thriller that started it all.An ancient secret brotherhood. A devastating new weapon of destruction. An unthinkable target. When world-renowned Harvard symbologist Robert Langdon is summoned to his first assignment to a Swiss research facility to analyze a mysterious symbol -- seared into the chest of a murdered physicist -- he discovers evidence of the unimaginable: the resurgence of an ancient secret brotherhood known as the Illuminati...the most powerful underground organization ever to walk the earth. The Illuminati has now surfaced to carry out the final phase of its legendary vendetta against its most hated enemy -- the Catholic Church. Langdon\'s worst fears are confirmed on the eve of the Vatican\'s holy conclave, when a messenger of the Illuminati announces they have hidden an unstoppable time bomb at the very heart of Vatican City. With the countdown under way, Langdon jets to Rome to join forces with Vittoria Vetra, a beautiful and mysterious Italian scientist, to assist the Vatican in a desperate bid for survival. Embarking on a frantic hunt through sealed crypts, dangerous catacombs, deserted cathedrals, and the most secretive vault on earth, Langdon and Vetra follow a 400-year-old trail of ancient symbols that snakes across Rome toward the long-forgotten Illuminati lair...a clandestine location that contains the only hope for Vatican salvation. Critics have praised the exhilarating blend of relentless adventure, scholarly intrigue, and cutting wit found in Brown\'s remarkable thrillers featuring Robert Langdon. An explosive international suspense, Angels & Demons marks this hero\'s first adventure as it careens from enlightening epiphanies to dark truths as the battle between science and religion turns to war.',15,'https://images-na.ssl-images-amazon.com/images/I/51Ecr94gwyL._SL300_.jpg',130000,220,_binary '',2),(11,'Bram Stoker\'s Dracula','Not for the faint of heart! Award-winning artist Gary Blythe brilliantly captures the eerie mood of Bram Stoker\'s uneasy tale, expertly edited for today\'s reader. Can there be a more terrifying tale than this? The story of the notorious vampire Count Dracula, lord of the undead, who rises from his coffin at night to suck the blood of the living is, undoubtedly, the stuff of nightmares. A lunatic asylum, a bleak Transylvanian castle, an ancient cemetary . . . these are the dark backgrounds to the even darker deeds portrayed in this most bloodcurdling of tales. Narrated from several viewpoints, DRACULA is a complex story that many know, but few have actually read. Jan Needle\'s newly edited version makes the gripping events accessible to the twenty-first reader without losing the incomparably chilling atmosphere of Bram Stoker\'s original novel.',20,'https://img.thriftbooks.com/api/images/l/cd6bb5cc89dd5ef9024e7e90a6ada30af77e51c1.jpg',115000,200,_binary '',2),(12,'The Hiding Place','\"Every experience God gives us . . . is the perfect preparation for the future only He can see.\"--Corrie ten BoomCorrie ten Boom was a Dutch watchmaker who became a heroine of the Resistance, a survivor of Hitler\'s concentration camps, and one of the most remarkable evangelists of the twentieth century. In World War II she and her family risked their lives to help Jews and underground workers escape from the Nazis, and for their work they were tested in the infamous Nazi death camps. Only Corrie among her family survived to tell the story of how faith ultimately triumphs over evil.Here is the riveting account of how Corrie and her family were able to save many of God\'s chosen people. For 35 years millions have seen that there is no pit so deep that God\'s love is not deeper still. Now The Hiding Place, repackaged for a new generation of readers, continues to declare that God\'s love will overcome, heal, and restore.\"A groundbreaking book that shines a clear light on one of the darkest moments of history.\"--Philip Yancey, author, The Jesus I Never Knew \"Ten Boom\'s classic is even more relevant to the present hour than at the time of its writing. We . . . need to be inspired afresh by the courage manifested by her family.\"--Jack W. Hayford, president, International Foursquare Church; chancellor, The King\'s College and Seminary\"The Hiding Place is a classic that begs revisiting. Corrie ten Boom lived the deeper life with God. Her gripping story of love in action will challenge and inspire you!\"--Joyce Meyer, best-selling author and Bible teacher',25,'https://images-na.ssl-images-amazon.com/images/I/51XFKp6q0-L._SL300_.jpg',140000,125,_binary '',3),(13,'Narrative of the Life of Frederick Douglas : An American Slave','The story of Frederick Douglass is passionate, harrowing, and inspiring. As a former slave, impassioned abolitionist, gifted writer, newspaper editor, and powerful orator, Douglass was an immense, motivational figure. His early life, filled with physical abuse, deprivation, and tragedy, adds up to a heart-wrenching history. However, he was able to overcome everything that bound a slave to his life and become a leading spokesman for his people. In this first of his three autobiographies, Douglass relates graphic descriptions of his childhood, his shocking experiences as a slave, and his thrilling escape from slavery to safety in the North and his pivotal freedom. Originally published in 1845, a date significant for the fact that very few African Americans could read or write at that time, this tale of sadness, danger, and eventual liberation will appeal to readers of all kinds. For those interested in African American history and the life of one of the most daring and heroic champions of civil rights, this page-turner is a perfect library addition.',12,'https://images-na.ssl-images-amazon.com/images/I/41ZYUb0bHBL._SL300_.jpg',126000,236,_binary '',3),(14,'Dreams from My Father: A Story of Race and Inheritance','In this lyrical, unsentimental, and compelling memoir, the son of a black African father and a white American mother searches for a workable meaning to his life as a black American. It begins in New York, where Barack Obama learns that his father—a figure he knows more as a myth than as a man—has been killed in a car accident. This sudden death inspires an emotional odyssey—first to a small town in Kansas, from which he retraces the migration of his mother’s family to Hawaii, and then to Kenya, where he meets the African side of his family, confronts the bitter truth of his father’s life, and at last reconciles his divided inheritance. Pictured in lefthand photograph on cover: Habiba Akumu Hussein and Barack Obama, Sr. (President Obama\'s paternal grandmother and his father as a young boy). Pictured in righthand photograph on cover: Stanley Dunham and Ann Dunham (President Obama\'s maternal grandfather and his mother as a young girl). ',24,'https://images-na.ssl-images-amazon.com/images/I/51TdV%2B4rjSL._SL300_.jpg',162000,135,_binary '',3),(15,'The Color of Water : A Black Man\'s Tribute to His White Mother','From the New York Times bestselling author of The Good Lord Bird , winner of the 2013 National Book Award for Fiction, and Kill \'Em and Leave , a James Brown biography. Celebrating the 20th anniversary of the book that launched James McBride\'s literary career Over two years on The New York Times bestseller list Who is Ruth McBride Jordan? A self-declared \"light-skinned\" woman evasive about her ethnicity, yet steadfast in her love for her twelve black children. James McBride, journalist, musician, and son, explores his mother\'s past, as well as his own upbringing and heritage, in a poignant and powerful debut, The Color Of Water: A Black Man\'s Tribute to His White Mother . The son of a black minister and a woman who would not admit she was white, James McBride grew up in \"orchestrated chaos\" with his eleven siblings in the poor, all-black projects of Red Hook, Brooklyn. \"Mommy,\" a fiercely protective woman with \"dark eyes full of pep and fire,\" herded her brood to Manhattan\'s free cultural events, sent them off on buses to the best (and mainly Jewish) schools, demanded good grades, and commanded respect. As a young man, McBride saw his mother as a source of embarrassment, worry, and confusion and reached thirty before he began to discover the truth about her early life and long-buried pain. In The Color of Water , McBride retraces his mother\'s footsteps and, through her searing and spirited voice, recreates her remarkable story. The daughter of a failed itinerant Orthodox rabbi, she was born Rachel Shilsky (actually Ruchel Dwara Zylska) in Poland on April 1, 1921. Fleeing pogroms, her family emigrated to America and ultimately settled in Suffolk, Virginia, a small town where anti-Semitism and racial tensions ran high. With candor and immediacy, Ruth describes her parents\' loveless marriage; her fragile, handicapped mother; her cruel, sexually-abusive father; and the rest of the family and life she abandoned. At seventeen, after fleeing Virginia and settling in New York City, Ruth married a black minister and founded the all- black New Brown Memorial Baptist Church in her Red Hook living room. \"God is the color of water,\" Ruth McBride taught her children, firmly convinced that life\'s blessings and life\'s values transcend race. Twice widowed, and continually confronting overwhelming adversity and racism, Ruth\'s determination, drive and discipline saw her dozen children through college and most through graduate school. At age 65, she herself received a degree in social work from Temple University. Interspersed throughout his mother\'s compelling narrative, McBride shares candid recollections of his own experiences as a mixed-race child of poverty, his flirtations with drugs and violence, and his eventual self- realization and professional success. The Color of Water touches readers of all colors as a vivid portrait of growing up, a haunting meditation on race and identity, and a lyrical valentine to a mother from her son. \"',5,'https://img.thriftbooks.com/api/images/l/95b2cf3cff3c2e145aa914afe4333c41d8adc13f.jpg',100000,0,_binary '\0',3),(16,'The Investment Answer : Learn to Manage Your Money and Protect Your Financial Future','What if there were a way to cut through all the financial mumbo-jumbo? Wouldn\'t it be great if someone could really explain to us-in plain and simple English-the basics we must know about investing in order to insure our financial freedom? At last, here\'s good news. Jargon-free and written for all investors-experienced, beginner, and everyone in between-THE INVESTMENT ANSWER distills the process into just five decisions-five straightforward choices that can lead to safe and sound ways to manage your money. When Wall Street veteran Gordon Murray told his good friend and financial advisor, Dan Goldie, that he had only six months to live, Dan responded, \"Do you want to write that book you\'ve always wanted to do?\" The result is this eminently valuable primer which can be read and understood in one sitting, and has advice that benefits you, not Wall Street and the rest of the traditional financial services industry. THE INVESTMENT ANSWER asks readers to make five basic but key decisions to stack the investment odds in their favor. The advice is simple, easy-to-follow, and effective, and can lead to a more profitable portfolio for every investor. Specifically: * Should I invest on my own or seek help from an investment professional? * How should I allocate my investments among stocks, bonds, and cash? * Which specific asset classes within these broad categories should I include in my portfolio? * Should I take an actively managed approach to investing, or follow a passive alternative? * When should I sell assets and when should I buy more? In a world of fast-talking traders who believe that they can game the system and a market characterized by instability, this extraordinary and timely book offers guidance every investor should have.',10,'https://img.thriftbooks.com/api/images/l/07e35e58d2acad9b8ed3037c9bfdef9c82eee69e.jpg',126000,122,_binary '',4),(18,'Hamlet 3','This tale of the immortal Prince of Denmark delves deeply into the complexities of the human soul as it recounts Hamlet\'s tragic struggle to avenge his father\'s death. Books in this new, illustrated series present complete texts of Shakespeare\'s plays. However, the lines are set up so students can see the bard\'s original poetic phrases printed side-by-side and line-by-line with a modern \"translation\" on the facing page. Starting in the late 1580s and for several decades that followed, Shakespeare\'s plays were popular entertainment for London\'s theatergoers. His Globe Theatre was the equivalent of a Broadway theater in today\'s New York. The plays have endured, but over the course of 400+ years, the English language has changed in many ways--which is why today\'s students often find Shakespeare\'s idiom difficult to comprehend. Simply Shakespeare offers an excellent solution to their problem. Introducing each play is a general essay covering Shakespeare\'s life and times. At the beginning of each of the five acts in every play, a two-page spread describes what is about to take place. The story\'s background is explained, followed by brief descriptions of key people who will appear in the act, details students should watch for as the story unfolds, discussion of the play\'s historical context, how the play was staged in Shakespeare\'s day, and explanation of puns and plays on words that occur in characters\' dialogues. Identifying icons preceding each of these study points are printed in a second color, then are located again as cross-references in the play\'s original text. For instance, where words spoken by a person in the play offer insights into his or another character\'s personality, the \"Characters\" icon will appear as a cross-reference in both the introductory spread and the play proper. Following each act, a closing spread presents questions and discussion points for use as teachers\' aids. Guided by the inspiring format of this fine new series, both teachers and students will come to understand and appreciate the genius of Shakespeare as never before.',10,'https://img.thriftbooks.com/api/images/l/9dfc64b690179b709261fd39e4f8a95f0b017fb9.jpg',120000,120,_binary '\0',2),(24,'Perfectly Legal : The Covert Campaign to Rig Our Tax System to Benefit the Super Rich -- and Cheat Everybody Else','Now updated with a new prologue Since the mid-1970s, there has been a dramatic shift in America\'s socioeconomic system, one that has gone virtually unnoticed by the general public. Tax policies and their enforcement have become a disaster, and thanks to discreet lobbying by a segment of the top 1 percent, Washington is reluctant or unable to fix them. The corporate income tax, the estate tax, and the gift tax have been largely ignored by the media. But the cumulative results are remarkable: today someone who earns a yearly salary of $60,000 pays a larger percentage of his income in taxes than the four hundred richest Americans. Pulitzer Prize-winning investigative reporter David Cay Johnston exposes exactly how the middle class is being squeezed to create a widening wealth gap that threatens the stability of the country. By relating the compelling tales of real people across all areas of society, he reveals the truth behind: \"Middle class\" tax cuts and exactly whom they benefit. How workers are being cheated out of their retirement plans while disgraced CEOs walk away with millions. How some corporations avoid paying any federal income tax. How a law meant to prevent cheating by the top 2 percent of Americans no longer affects most of them, but has morphed into a stealth tax on single mothers making just $28,000. Why the working poor are seven times more likely to be audited by the IRS than everyone else. How the IRS became so weak that even when it was handed complete banking records detailing massive cheating by 1,600 people, it prosecuted only 4 percent of them. Johnston has been breaking pieces of this story on the front page of The New York Times for seven years. With Perfectly Legal , he puts the whole shocking narrative together in a way that will stir up media attention and make readers angry about the state of our country.',12,'https://img.thriftbooks.com/api/images/l/39d63e488e52074b10126bacde3b89d9f8aa8300.jpg',100000,100,_binary '',4),(25,'Intermediate Accounting','The bestselling book on intermediate accounting, Kieso is an excellent reference for practicing accountants and an invaluable resource for anyone entering the field. It integrates FARS/Codification exercises, cases, and simulations into the chapters. This introduces readers to the codification project. They\'ll learn how to leverage everyday accounting programs like Excel, GLS, and other computerized accounting software giving them a strong background in the tools needed in the accounting profession. New and existing content is arranged in a way to offer accountants a chance to review key concepts. New to This Edition: NEW IFRS content: \"Intermediate Accounting,\" 13e, includes, in 20 of the 24 chapters, a \"Convergence Corner\" feature that demonstrates to readers how international financial reporting standards apply to the main topics of the chapter. * Updated Appendix 24B provides a complete discussion of the international accounting and reporting environment, with the latest convergence developments. * Quick-hitting International Insights in the margins compare or contrast international standards with a point under discussion in the nearby text. * New end-of-chapter Questions in each chapter focus on international standards introduced in the chapter. These questions are marked with an icon for easy reference. * International Reporting Cases ask readers to analyze financial statements of international companies and apply analysis with the application of international standards. Updated \"Fair Value discussions\" Fair value has been expanded at both the introductory level in Chapter 2 and in subsequent chapters where appropriate. The more thorough discussion in Chapter 2 lays the groundwork for expanded discussions in later chapters. The result is a solid understanding of fair value in the accounting profession today. FASB Codification This edition integrates the new FASB Codification throughout. References to the accounting pronouncements replaced by a numbering system in each chapter linked to the new Codification. A list of Codification references at the end of each chapter links the bracketed numbers from the text to the Codification; this list also includes a reference to the preceding literature, for easing the transition to the new system. In addition, a handful of quick exercises in each chapter give readers opportunities for practice and simple research in the Codification. Revised \"End-of-Chapter Material\" Names, numbers, and dates in all end-of-chapter materials, including brief exercises and problems, have been changed. Expanded \"CPA-prep Professional Simulations\" Now be offering a complete online Wiley CPA prep course electronically. Updated real-world focus: This edition contains many new chapter-opening stories and \"What Do the Numbers Mean?\" boxes. Such applications join theory and practice, and demonstrate to readers the use of accounting in today\'s business world.',30,'https://img.thriftbooks.com/api/images/l/f7f67908a26d76fb54421c8cf6631cef8e4c38ed.jpg',120000,221,_binary '',4),(26,'Hug Your Customers : The Proven Way to Personalize Sales and Achieve Astounding Results','Revised and updated for the first time since original publication Here is the 200,000-copy staple, praised by Warren Buffett as \"a gem ... I wish everyone at Berkshire would follow Jack Mitchell\'s] advice--we would own the world.\" If you want to put your arms around your business and bottom line, you\'ll want all the updated information and practices found in the landmark business bestseller, Hug Your Customers . The only way to stay in business is to have customers; the only way to increase your profit is to attract more customer visits by providing exceptional customer service. It\'s that simple says Jack Mitchell. Hug Your Customers shares the hands-on practical philosophy that has allowed Mitchell and his Family of Stores to thrive and excel in today\'s challenging retail marketplace. Filled with accessible advice, personal case studies and tips any businessperson can use, Hug Your Customers is an energizing blueprint for customer and employee retention, increased per capita spending, and groundbreaking success.',40,'https://img.thriftbooks.com/api/images/l/a6f8a7b62cc5fd7d296b3137144f7533cae140d9.jpg',150000,200,_binary '',4),(27,'Sway: The Irresistible Pull of Irrational Behavior','A fascinating journey into the hidden psychological influences that derail our decision-making, Sway will change the way you think about the way you think.Why is it so difficult to sell a plummeting stock or end a doomed relationship? Why do we listen to advice just because it came from someone “important”? Why are we more likely to fall in love when there’s danger involved? In Sway, renowned organizational thinker Ori Brafman and his brother, psychologist Rom Brafman, answer all these questions and more.Drawing on cutting-edge research from the fields of social psychology, behavioral economics, and organizational behavior, Sway reveals dynamic forces that influence every aspect of our personal and business lives, including loss aversion (our tendency to go to great lengths to avoid perceived losses), the diagnosis bias (our inability to reevaluate our initial diagnosis of a person or situation), and the “chameleon effect” (our tendency to take on characteristics that have been arbitrarily assigned to us). Sway introduces us to the Harvard Business School professor who got his students to pay $204 for a $20 bill, the head of airline safety whose disregard for his years of training led to the transformation of an entire industry, and the football coach who turned conventional strategy on its head to lead his team to victory. We also learn the curse of the NBA draft, discover why interviews are a terrible way to gauge future job performance, and go inside a session with the Supreme Court to see how the world’s most powerful justices avoid the dangers of group dynamics.Every once in a while, a book comes along that not only challenges our views of the world but changes the way we think. In Sway, Ori and Rom Brafman not only uncover rational explanations for a wide variety of irrational behaviors but also point readers toward ways to avoid succumbing to their pull.',12,'https://images-na.ssl-images-amazon.com/images/I/41TlXr4iVBL._SL300_.jpg',78000,123,_binary '',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'All'),(2,'Arts & Music'),(3,'Biographies'),(4,'Business'),(5,'Comics'),(6,'Computers & Tech'),(7,'Cooking'),(8,'Kids'),(9,'Hobbies & Crafts'),(10,'Edu & Reference'),(11,'Health & Fitness'),(12,'Literature & Fiction'),(13,'Medical'),(14,'Romance'),(15,'Science & Math'),(16,'Sci-Fi & Fantasy'),(17,'Self-Help'),(18,'Travel'),(19,'Home & Garden');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,10,1,216000,1,1),(2,30,2,210000,2,1),(3,20,4,240000,4,1),(4,10,1,1080000,1,2),(5,10,1,648000,1,3),(6,25,12,1155000,12,4),(7,10,1,108000,1,5),(8,20,11,92000,11,5),(9,30,2,105000,2,6),(10,10,1,216000,1,6),(11,10,1,432000,1,7),(12,30,2,525000,2,8),(13,12,13,443520,13,8),(14,25,12,420000,12,8),(15,15,5,442000,5,8),(16,20,4,240000,4,9),(17,30,2,315000,2,9),(18,10,1,324000,1,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2019-07-15 02:15:20',_binary '\0',1596000,1),(2,'2019-07-15 02:15:20',_binary '',1080000,1),(3,'2019-07-15 09:17:32',_binary '\0',648000,1),(4,'2019-07-15 11:18:22',_binary '',1155000,1),(5,'2019-07-16 03:00:12',_binary '',200000,5),(6,'2019-07-16 03:00:12',_binary '',321000,1),(7,'2019-07-17 05:52:49',_binary '\0',432000,7),(8,'2019-07-18 21:06:36',_binary '',1830520,1),(9,'2019-07-18 21:07:47',_binary '\0',879000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Some where',22,'user1','user1@gmail.com','User','Female',_binary '',_binary '\0','$2a$10$K2Hmi8BL8nuvmlGFhp8.u.qLM1ZPWXVlwk2XXHinqsXJ2YOJXmhvW','1234567899'),(4,'Phú Thượng, Phú Vang',24,'user2','vinhnxse62725@gmail.com','Nguyen Xuan Vinh','Male',_binary '',_binary '','$2a$10$0lg/zDHPtT0wj03WX9O78O2fVD5Nuxg/2lM5ESw6xLyGFqFxXcc.6','1231231231'),(5,'Phú Thượng, Phú Vang',24,'vinhnxse62725','vinhnxse62725@gmail.com','Nguyen Xuan Vinh','Male',_binary '',_binary '','$2a$10$MAxr8LLJ2s9QjwYuvPm/MOca6ej/OKuHDK692WAdRJZ1UBdtigoYO','1231231231'),(6,'Supplier',22,'hoang','vinhnxse62725@gmail.com','userchange','Male',_binary '\0',_binary '\0','$2a$10$qUjtqXRlWPtHqVTiQkapMuIZ2HN1QLkWRdboNNwyPmfNU1KNwARma','0123456789'),(7,'Some where',20,'user3','user3@gmail.com','user','Male',_binary '\0',_binary '\0','$2a$10$WOAfkZXk60yYUkHNTaMwreOo7TST9JAdQkbG0bnISO8COqotkNbAu','0123456789');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'BookStore'
--

--
-- Dumping routines for database 'BookStore'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-18 14:14:12

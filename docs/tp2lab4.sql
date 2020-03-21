/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.6-MariaDB : Database - tp2lab4
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tp2lab4` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `tp2lab4`;

/*Table structure for table `pais` */

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `codigo_pais` int(11) NOT NULL,
  `capital_pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `nombre_pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poblacion` int(11) NOT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pais` */

insert  into `pais`(`codigo_pais`,`capital_pais`,`latitud`,`longitud`,`nombre_pais`,`poblacion`,`region`) values (1,'Ottawa',60,-95,'Canada',36155487,'Americas'),(7,'Moscow',60,100,'Russian Federation',146599183,'Europe'),(20,'Cairo',27,30,'Egypt',91290000,'Africa'),(27,'Pretoria',-29,24,'South Africa',55653654,'Africa'),(30,'Athens',39,22,'Greece',10858018,'Europe'),(31,'Amsterdam',52.5,5.75,'Netherlands',17019800,'Europe'),(32,'Brussels',50.83333333,4,'Belgium',11319511,'Europe'),(33,'Paris',46,2,'France',66710000,'Europe'),(34,'Madrid',40,-4,'Spain',46438422,'Europe'),(36,'Budapest',47,20,'Hungary',9823000,'Europe'),(39,'Rome',42.83333333,12.83333333,'Italy',60665551,'Europe'),(40,'Bucharest',46,25,'Romania',19861408,'Europe'),(41,'Bern',47,8,'Switzerland',8341600,'Europe'),(43,'Vienna',47.33333333,13.33333333,'Austria',8725931,'Europe'),(44,'St. Peter Port',49.46666666,-2.58333333,'Guernsey',62999,'Europe'),(45,'Copenhagen',56,10,'Denmark',5717014,'Europe'),(46,'Stockholm',62,15,'Sweden',9894888,'Europe'),(47,'Oslo',62,10,'Norway',5223256,'Europe'),(48,'Warsaw',52,20,'Poland',38437239,'Europe'),(49,'Berlin',51,9,'Germany',81770900,'Europe'),(51,'Lima',-10,-76,'Peru',31488700,'Americas'),(52,'Mexico City',23,-102,'Mexico',122273473,'Americas'),(53,'Havana',21.5,-80,'Cuba',11239004,'Americas'),(54,'Buenos Aires',-34,-64,'Argentina',43590400,'Americas'),(55,'Brasília',-10,-55,'Brazil',206135893,'Americas'),(56,'Santiago',-30,-71,'Chile',18191900,'Americas'),(57,'Bogotá',4,-72,'Colombia',48759958,'Americas'),(58,'Caracas',8,-66,'Venezuela (Bolivarian Republic of)',31028700,'Americas'),(60,'Kuala Lumpur',2.5,112.5,'Malaysia',31405416,'Asia'),(61,'Canberra',-27,133,'Australia',24117360,'Oceania'),(62,'Jakarta',-5,120,'Indonesia',258705000,'Asia'),(63,'Manila',13,122,'Philippines',103279800,'Asia'),(64,'Wellington',-41,174,'New Zealand',4697854,'Oceania'),(65,'Singapore',1.36666666,103.8,'Singapore',5535000,'Asia'),(66,'Bangkok',15,100,'Thailand',65327652,'Asia'),(76,'Astana',48,68,'Kazakhstan',17753200,'Asia'),(81,'Tokyo',36,138,'Japan',126960000,'Asia'),(82,'Seoul',37,127.5,'Korea (Republic of)',50801405,'Asia'),(84,'Hanoi',16.16666666,107.83333333,'Viet Nam',92700000,'Asia'),(86,'Beijing',35,105,'China',1377422166,'Asia'),(90,'Ankara',39,35,'Turkey',78741053,'Asia'),(91,'New Delhi',20,77,'India',1295210000,'Asia'),(92,'Islamabad',30,70,'Pakistan',194125062,'Asia'),(93,'Kabul',33,65,'Afghanistan',27657145,'Asia'),(94,'Colombo',7,81,'Sri Lanka',20966000,'Asia'),(95,'Naypyidaw',22,98,'Myanmar',51419420,'Asia'),(98,'Tehran',32,53,'Iran (Islamic Republic of)',79369900,'Asia'),(211,'Juba',7,30,'South Sudan',12131000,'Africa'),(212,'Rabat',32,-5,'Morocco',33337529,'Africa'),(213,'Algiers',28,3,'Algeria',40400000,'Africa'),(216,'Tunis',34,9,'Tunisia',11154400,'Africa'),(218,'Tripoli',25,17,'Libya',6385000,'Africa'),(220,'Banjul',13.46666666,-16.56666666,'Gambia',1882450,'Africa'),(221,'Dakar',14,-14,'Senegal',14799859,'Africa'),(222,'Nouakchott',20,-12,'Mauritania',3718678,'Africa'),(223,'Bamako',17,-4,'Mali',18135000,'Africa'),(224,'Conakry',11,-10,'Guinea',12947000,'Africa'),(225,'Yamoussoukro',8,-5,'Côte d\'Ivoire',22671331,'Africa'),(226,'Ouagadougou',13,-2,'Burkina Faso',19034397,'Africa'),(227,'Niamey',16,8,'Niger',20715000,'Africa'),(228,'Lomé',8,1.16666666,'Togo',7143000,'Africa'),(229,'Porto-Novo',9.5,2.25,'Benin',10653654,'Africa'),(230,'Port Louis',-20.28333333,57.55,'Mauritius',1262879,'Africa'),(231,'Monrovia',6.5,-9.5,'Liberia',4615000,'Africa'),(232,'Freetown',8.5,-11.5,'Sierra Leone',7075641,'Africa'),(233,'Accra',8,-2,'Ghana',27670174,'Africa'),(234,'Abuja',10,8,'Nigeria',186988000,'Africa'),(235,'N\'Djamena',15,19,'Chad',14497000,'Africa'),(236,'Bangui',7,21,'Central African Republic',4998000,'Africa'),(237,'Yaoundé',6,12,'Cameroon',22709892,'Africa'),(238,'Praia',16,-24,'Cabo Verde',531239,'Africa'),(239,'São Tomé',1,7,'Sao Tome and Principe',187356,'Africa'),(240,'Malabo',2,10,'Equatorial Guinea',1222442,'Africa'),(241,'Libreville',-1,11.75,'Gabon',1802278,'Africa'),(242,'Brazzaville',-1,15,'Congo',4741000,'Africa'),(243,'Kinshasa',0,25,'Congo (Democratic Republic of the)',85026000,'Africa'),(244,'Luanda',-12.5,18.5,'Angola',25868000,'Africa'),(245,'Bissau',12,-15,'Guinea-Bissau',1547777,'Africa'),(246,'Diego Garcia',-6,71.5,'British Indian Ocean Territory',3000,'Africa'),(248,'Victoria',-4.58333333,55.66666666,'Seychelles',91400,'Africa'),(249,'Khartoum',15,30,'Sudan',39598700,'Africa'),(250,'Kigali',-2,30,'Rwanda',11553188,'Africa'),(251,'Addis Ababa',8,38,'Ethiopia',92206005,'Africa'),(252,'Mogadishu',10,49,'Somalia',11079000,'Africa'),(253,'Djibouti',11.5,43,'Djibouti',900000,'Africa'),(254,'Nairobi',1,38,'Kenya',47251000,'Africa'),(255,'Dodoma',-6,35,'Tanzania, United Republic of',55155000,'Africa'),(256,'Kampala',1,32,'Uganda',33860700,'Africa'),(257,'Bujumbura',-3.5,30,'Burundi',10114505,'Africa'),(258,'Maputo',-18.25,35,'Mozambique',26423700,'Africa'),(260,'Lusaka',-15,30,'Zambia',15933883,'Africa'),(261,'Antananarivo',-20,47,'Madagascar',22434363,'Africa'),(262,'Mamoudzou',-12.83333333,45.16666666,'Mayotte',226915,'Africa'),(263,'Harare',-20,30,'Zimbabwe',14240168,'Africa'),(264,'Windhoek',-22,17,'Namibia',2324388,'Africa'),(265,'Lilongwe',-13.5,34,'Malawi',16832910,'Africa'),(266,'Maseru',-29.5,28.5,'Lesotho',1894194,'Africa'),(267,'Gaborone',-22,24,'Botswana',2141206,'Africa'),(268,'Lobamba',-26.5,31.5,'Swaziland',1132657,'Africa'),(269,'Moroni',-12.16666666,44.25,'Comoros',806153,'Africa'),(290,'Jamestown',-15.95,-5.7,'Saint Helena, Ascension and Tristan da Cunha',4255,'Africa'),(291,'Asmara',15,39,'Eritrea',5352000,'Africa'),(297,'Oranjestad',12.5,-69.96666666,'Aruba',107394,'Americas'),(298,'Tórshavn',62,-7,'Faroe Islands',49376,'Europe'),(299,'Nuuk',72,-40,'Greenland',55847,'Americas');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

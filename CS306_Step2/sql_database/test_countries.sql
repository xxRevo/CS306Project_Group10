-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `name` varchar(30) DEFAULT NULL,
  `iso_code` varchar(3) NOT NULL,
  PRIMARY KEY (`iso_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('Aruba','ABW'),('Afghanistan','AFG'),('Angola','AGO'),('Albania','ALB'),('Netherlands Antilles','ANT'),('United Arab Emirates','ARE'),('Argentina','ARG'),('Armenia','ARM'),('American Samoa','ASM'),('Antarctica','ATA'),('Antigua and Barbuda','ATG'),('Australia','AUS'),('Austria','AUT'),('Azerbaijan','AZE'),('Burundi','BDI'),('Belgium','BEL'),('Benin','BEN'),('Burkina Faso','BFA'),('Bangladesh','BGD'),('Bulgaria','BGR'),('Bahrain','BHR'),('Bahamas','BHS'),('Bosnia and Herzegovina','BIH'),('Belarus','BLR'),('Belize','BLZ'),('Bermuda','BMU'),('Bolivia','BOL'),('Brazil','BRA'),('Barbados','BRB'),('Brunei','BRN'),('Bhutan','BTN'),('Botswana','BWA'),('Central African Republic','CAF'),('Canada','CAN'),('Switzerland','CHE'),('Chile','CHL'),('China','CHN'),('Cote d\'Ivoire','CIV'),('Cameroon','CMR'),('Democratic Republic of Congo','COD'),('Congo','COG'),('Cook Islands','COK'),('Colombia','COL'),('Comoros','COM'),('Cape Verde','CPV'),('Costa Rica','CRI'),('Cuba','CUB'),('Cayman Islands','CYM'),('Cyprus','CYP'),('Czechia','CZE'),('Germany','DEU'),('Djibouti','DJI'),('Dominica','DMA'),('Denmark','DNK'),('Dominican Republic','DOM'),('Algeria','DZA'),('Ecuador','ECU'),('Egypt','EGY'),('Eritrea','ERI'),('Western Sahara','ESH'),('Spain','ESP'),('Estonia','EST'),('Ethiopia','ETH'),('Finland','FIN'),('Fiji','FJI'),('Falkland Islands','FLK'),('France','FRA'),('Faeroe Islands','FRO'),('Micronesia (country)','FSM'),('Gabon','GAB'),('United Kingdom','GBR'),('Georgia','GEO'),('Ghana','GHA'),('Gibraltar','GIB'),('Guinea','GIN'),('Guadeloupe','GLP'),('Gambia','GMB'),('Guinea-Bissau','GNB'),('Equatorial Guinea','GNQ'),('Greece','GRC'),('Grenada','GRD'),('Greenland','GRL'),('Guatemala','GTM'),('French Guiana','GUF'),('Guam','GUM'),('Guyana','GUY'),('Hong Kong','HKG'),('Honduras','HND'),('Croatia','HRV'),('Haiti','HTI'),('Hungary','HUN'),('Indonesia','IDN'),('India','IND'),('Ireland','IRL'),('Iran','IRN'),('Iraq','IRQ'),('Iceland','ISL'),('Israel','ISR'),('Italy','ITA'),('Jamaica','JAM'),('Jordan','JOR'),('Japan','JPN'),('Kazakhstan','KAZ'),('Kenya','KEN'),('Kyrgyzstan','KGZ'),('Cambodia','KHM'),('Kiribati','KIR'),('Saint Kitts and Nevis','KNA'),('South Korea','KOR'),('Kuwait','KWT'),('Laos','LAO'),('Lebanon','LBN'),('Liberia','LBR'),('Libya','LBY'),('Saint Lucia','LCA'),('Sri Lanka','LKA'),('Lesotho','LSO'),('Lithuania','LTU'),('Luxembourg','LUX'),('Latvia','LVA'),('Macao','MAC'),('Morocco','MAR'),('Moldova','MDA'),('Madagascar','MDG'),('Maldives','MDV'),('Mexico','MEX'),('North Macedonia','MKD'),('Mali','MLI'),('Malta','MLT'),('Myanmar','MMR'),('Montenegro','MNE'),('Mongolia','MNG'),('Northern Mariana Islands','MNP'),('Mozambique','MOZ'),('Mauritania','MRT'),('Montserrat','MSR'),('Martinique','MTQ'),('Mauritius','MUS'),('Malawi','MWI'),('Malaysia','MYS'),('Namibia','NAM'),('New Caledonia','NCL'),('Niger','NER'),('Nigeria','NGA'),('Nicaragua','NIC'),('Niue','NIU'),('Netherlands','NLD'),('Norway','NOR'),('Nepal','NPL'),('Nauru','NRU'),('New Zealand','NZL'),('Oman','OMN'),('Pakistan','PAK'),('Panama','PAN'),('Peru','PER'),('Philippines','PHL'),('Papua New Guinea','PNG'),('Poland','POL'),('Puerto Rico','PRI'),('North Korea','PRK'),('Portugal','PRT'),('Paraguay','PRY'),('Palestine','PSE'),('French Polynesia','PYF'),('Qatar','QAT'),('Reunion','REU'),('Romania','ROU'),('Russia','RUS'),('Rwanda','RWA'),('Saudi Arabia','SAU'),('Sudan','SDN'),('Senegal','SEN'),('Singapore','SGP'),('Saint Helena','SHN'),('Solomon Islands','SLB'),('Sierra Leone','SLE'),('El Salvador','SLV'),('Somalia','SOM'),('Saint Pierre and Miquelon','SPM'),('Serbia','SRB'),('South Sudan','SSD'),('Sao Tome and Principe','STP'),('Suriname','SUR'),('Slovakia','SVK'),('Slovenia','SVN'),('Sweden','SWE'),('Eswatini','SWZ'),('Seychelles','SYC'),('Syria','SYR'),('Turks and Caicos Islands','TCA'),('Chad','TCD'),('Togo','TGO'),('Thailand','THA'),('Tajikistan','TJK'),('Turkmenistan','TKM'),('Timor','TLS'),('Tonga','TON'),('Trinidad and Tobago','TTO'),('Tunisia','TUN'),('Turkey','TUR'),('Tuvalu','TUV'),('Taiwan','TWN'),('Tanzania','TZA'),('Uganda','UGA'),('Ukraine','UKR'),('Uruguay','URY'),('United States','USA'),('Uzbekistan','UZB'),('Venezuela','VEN'),('British Virgin Islands','VGB'),('United States Virgin Islands','VIR'),('Vietnam','VNM'),('Vanuatu','VUT'),('Samoa','WSM'),('Yemen','YEM'),('South Africa','ZAF'),('Zambia','ZMB'),('Zimbabwe','ZWE');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23 19:31:51

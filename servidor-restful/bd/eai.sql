CREATE DATABASE  IF NOT EXISTS `eai` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eai`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: eai
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu7

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
-- Table structure for table `antecedente`
--

DROP TABLE IF EXISTS `antecedente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente` (
  `idantecedente` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idantecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente`
--

LOCK TABLES `antecedente` WRITE;
/*!40000 ALTER TABLE `antecedente` DISABLE KEYS */;
INSERT INTO `antecedente` VALUES (1,'Asesinato'),(2,'Intento de Asesinato'),(3,'Robo con Arma de Fuego'),(4,'Robo con Arma Blanca'),(5,'Dano a la Propiedad Publica'),(6,'Pertubar el orden publico'),(7,'Desacato a la autoridad');
/*!40000 ALTER TABLE `antecedente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedentepersona`
--

DROP TABLE IF EXISTS `antecedentepersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedentepersona` (
  `idantecedentepersona` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `antecedenteid` int(11) NOT NULL,
  `personaid` varchar(10) NOT NULL,
  `nacionalidadid` varchar(1) NOT NULL,
  PRIMARY KEY (`idantecedentepersona`),
  KEY `fk_AntecedentePersona_Antecedente1_idx` (`antecedenteid`),
  KEY `fk_AntecedentePersona_Persona1_idx` (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedentepersona`
--

LOCK TABLES `antecedentepersona` WRITE;
/*!40000 ALTER TABLE `antecedentepersona` DISABLE KEYS */;
INSERT INTO `antecedentepersona` VALUES (1,'2014-02-12',6,'20927471','V'),(2,'2014-01-01',7,'20927471','V'),(3,'2000-01-01',6,'10773199','V'),(4,'2014-02-12',7,'19241804','V'),(5,'1996-02-29',1,'20934558','V');
/*!40000 ALTER TABLE `antecedentepersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `idbanco` varchar(5) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `ciudadid` int(11) NOT NULL,
  PRIMARY KEY (`idbanco`),
  KEY `fk_Banco_Ciudad1_idx` (`ciudadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES ('0001','Banco Central de Venezuela','G200001100',32),('0003','Banco Industrial de Venezuela, C.A','G200106760',32),('0006','Banco Coro, C.A','J070001739',32),('0008','Banco Guayana, C.A','J000928630',32),('0102','Banco de Venezuela, S.A','G200099976',32),('0104','Venezolano de Credito, S.A','J000029709',32),('0105','Banco Mercantil, C.A',' J000029610',32),('0108','Banco Provincial, S.A',' J000029679',32),('0114','Banco del Caribe, C.A','J000029490 ',32),('0115','Banco del Exterior, C.A','J000029504',32),('0121','Banco Occidental de Descuento, C.A',' J300619460',32),('0128','Banco Caroni, C.A','J095048551',32),('0134','Banesco Banco Universal, S.A','J070133805',32),('0137','Banco Sofitasa Banco Universal S.A','J090283846',32),('0138','Banco Plaza, C.A','J002970553',32),('0146','Banco de la Gente Emprendedora BANGENTE, C.A',' J301442040',32),('0148','Total Bank, C.A',' J308058238',32),('0151','BFC Banco Fondo Comun C.A',' J000723060',32),('0156','100% Banco C.A',' J000373981',32),('0157','Del Sur Banco Universal, C.A','J000797234',32),('0162','BanValor Banco Comercial, C.A','J000503605',32),('0163','Banco del Tesoro, C.A','G200051876 ',32),('0166','Banco Agricola de Venezuela, C.A','G200057955',32),('0168','Bancrecer S.A Banco de Desarrollo',' J316374173',32),('0171','Banco Activo, C.A',' J080066227 ',32),('0174','BANPLUS Banco Comercial, C.A',' J000423032',32),('0175','Banco Bicentenario Banco Universal, C.A','G200091487',32),('0191','Banco Nacional de Credito, C.A',' J309841327',32);
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `municipioid` int(11) NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_Ciudad_Municipio1_idx` (`municipioid`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'La Esmeralda',2),(2,'San Fernando de Atabo',3),(3,'Puerto Ayacucho',4),(4,'Isla Raton',5),(5,'San Juan de Manapiare',6),(6,'Maroa',7),(7,'San Carlos de Rio Negro',8),(8,'Anaco',9),(9,'Aragua de Barcelona',10),(10,'Barcelona',11),(11,'Clarines',12),(12,'Onoto',13),(13,'Valle de Guanape',14),(14,'Lecheria',15),(15,'Cantaura',16),(16,'El Tigrito',17),(17,'Guanta',18),(18,'Soledad',19),(19,'San Mateo',20),(20,'El Chaparro',21),(21,'Pariaguan',22),(22,'Puerto Piritu',23),(23,'Piritu',24),(24,'Sotillo',25),(25,'Achaguas',26),(26,'Biruaca',27),(27,'Bruzal',28),(28,'Guasdualito',29),(29,'San Juan de Payara',30),(30,'Elorza',31),(31,'San Fernando de Apure',32),(32,'Caracas',1),(33,'San Mateo',33),(34,'Camatagua',34),(35,'Santa Rita',35),(36,'Maracay',36),(37,'Santa Cruz',37),(38,'La Victoria',38),(39,'El Consejo',39),(40,'Palo Negro',40),(41,'El Limon',41),(42,'Ocumare de la Costa',42),(43,'San Casimiro',43),(44,'San Sebastian de los Reyes',44),(45,'Turmero',45),(46,'Las Tejerias',46),(47,'Cagua',47),(48,'Colonia Tovar',48),(49,'Barbacoas',49),(50,'Villa de Cura',50),(51,'Sabaneta',51),(52,'En Canton',52),(53,'Socopo',53),(54,'Arismendi',54),(55,'Barinas',55),(56,'Barinitas',56),(57,'Barrancas',57),(58,'Santa Barbara',58),(59,'Obispos',59),(60,'Ciudad Bolivia',60),(61,'Libertad',61),(62,'Ciudad de Nutrias',62),(63,'Ciudad Guayana',63),(64,'Caicara del Orinoco',64),(65,'El Callao',65),(66,'Santa Elena de Uairen',66),(67,'Ciudad Bolivar',67),(68,'Upata',68),(69,'Ciudad Piar',69),(70,'Guassipati',70),(71,'Tumeremo',71),(72,'Maripa',72),(73,'El Palmar',73),(74,'Bejuma',74),(75,'Guigue',75),(76,'Mariara',76),(77,'Guacara',77),(78,'Moron',78),(79,'Tocuyito',79),(80,'Los Guayos',80),(81,'Miranda',81),(82,'Montalban',82),(83,'Naguanagua',83),(84,'Puerto Cabello',84),(85,'San Diego',85),(86,'San Juanquin',86),(87,'Valencia',87),(88,'Cojedes',88),(89,'Tinaquillo',89),(90,'El Baul',90),(91,'Macapo',91),(92,'El Pao',92),(93,'Libertad',93),(94,'Las Vegas',94),(95,'San Carlos',95),(96,'Tinaco',96),(97,'Curiapo',97),(98,'Sierra Imataca',98),(99,'Perdenales',99),(100,'Tucupita',100),(101,'San Juan de los Cayos',101),(102,'San Luis',102),(103,'Capatárida',103),(104,'Yaracal',104),(105,'Punto Fijo',105),(106,'La Vela de Coro',106),(107,'Dabajuro',107),(108,'Pedregal',108),(109,'Pueblo Nuevo',109),(110,'Churuguara',110),(111,'Jacura',111),(112,'Santa Cruz de los Taques',112),(113,'Mene de Mauroa',113),(114,'Santa Ana de Coro',114),(115,'Chichiriviche',115),(116,'Palmasola',116),(117,'Cabure',117),(118,'Piritu',118),(119,'Mirimire',119),(120,'Tucacas',120),(121,'La Cruz de Taratara',121),(122,'Tocopero',122),(123,'Santa Cruz de Burucal',123),(124,'Urumaco',124),(125,'Puerto Cumarebo',125),(126,'Camaguan',126),(127,'Chaguaramas',127),(128,'El Socorro',128),(129,'Calabozo',129),(130,'Tucupido',130),(131,'Altagracia de Orituco',131),(132,'San Juan de los Morros',132),(133,'El Sombrero',133),(134,'Las Mercedes ',134),(135,'Valle de Pascua',135),(136,'Zaraza',136),(137,'Ortiz',137),(138,'Guayabal',138),(139,'San Jose de Guaribe',139),(140,'Santa Maria de Ipire',140),(141,'Sanare',141),(142,'Duaca',142),(143,'Barquisimeto',143),(144,'Quibor',144),(145,'El Tocuyo',145),(146,'Cabudare',146),(147,'Sarare',147),(148,'Carora',148),(149,'Sisisique',149),(150,'El Vigia',150),(151,'La Azulita',151),(152,'Santa Cruz de Mora',152),(153,'Aricagua',153),(154,'Canagua',154),(155,'Ejido',155),(156,'Tucani',156),(157,'Santo Domingo',157),(158,'Guaraque',158),(159,'Arapuey',159),(160,'Torondoy',160),(161,'Merida',161),(162,'Timotes',162),(163,'Santa Elena de Arenales',163),(164,'Santa Maria de Caparo',164),(165,'Pueblo Llano',165),(166,'Mucuhies',166),(167,'Bailadores',167),(168,'Tabay',168),(169,'Lagunillas',169),(170,'Tovar',170),(171,'Nueva Bolivia',171),(172,'Zea',172),(173,'Caucagua',173),(174,'San Jose de Barlovento',174),(175,'Baruta',175),(176,'Higuerote',176),(177,'Mamporal',177),(178,'Carrizal',178),(179,'Chacao',179),(180,'Charallave',180),(181,'El Hatillo',181),(182,'Los Teques',182),(183,'Santa Teresa del Tuy',183),(184,'Ocumare del Tuy',184),(185,'San Antonio de los Altos',185),(186,'Rio Chico',186),(187,'Santa Lucia',187),(188,'Cupira',188),(189,'Guarenas',189),(190,'San Francisco de Yare',190),(191,'Petare',191),(192,'Cua',192),(193,'Guatire',193),(194,'San Antonio de Capayacuar',194),(195,'Aguasay',195),(196,'Caripito',196),(197,'Caripe',197),(198,'Caicara',198),(199,'Punta de Mata',199),(200,'Temblador',200),(201,'Maturin',201),(202,'Aragua',202),(203,'Quiriquire',203),(204,'Santa Barbara',204),(205,'Barrancas del Orinoco',205),(206,'Uracoa',206),(207,'La Plaza de Paraguachi',207),(208,'La Asuncion',208),(209,'San Juan Bautista',209),(210,'El Valle del Espiritu Santo',210),(211,'Santa Ana',211),(212,'Pampatar',212),(213,'Juan Griego',213),(214,'Porlamar',214),(215,'Boca de Rio',215),(216,'Punta de Piedras',216),(217,'San Pedro de Coche',217),(218,'Agua Blanca',218),(219,'Araure',219),(220,'Piritu',220),(221,'Guanare',221),(222,'Guanarito',222),(223,'Chabasquen de Unda',223),(224,'Ospino',224),(225,'Acarigua',225),(226,'Papelon',226),(227,'Boconoito',227),(228,'San Rafael de Onoto',228),(229,'El Playon',229),(230,'Biscocuy',230),(231,'Villa bruzual',231),(232,'Casanay',232),(233,'San Jose de Aerocuar',233),(234,'Rio Caribe',234),(235,'El Pilar',235),(236,'Carupano',236),(237,'Mariguitar',237),(238,'Yaguaraparo',238),(239,'Araya',239),(240,'Tunapuy',240),(241,'Irapa',241),(242,'San Antonio de Golfo',242),(243,'Cumanacoa',243),(244,'Cariaco',244),(245,'Cumana',245),(246,'Guira',246),(247,'Cordero',247),(248,'Las Mesas',248),(249,'Colon',249),(250,'San Antonio del Tachira',250),(251,'Tariba',251),(252,'Santa Ana del Tachira',252),(253,'San Rafael del Pinal',253),(254,'San Jose de Bolivar',254),(255,'La Fria',255),(256,'Palmira',256),(257,'Capacho Nuevo',257),(258,'La Grita',258),(259,'El Cobre',259),(260,'Rubio',260),(261,'Capacho Viejo',261),(262,'Abejales',262),(263,'Lobatera',263),(264,'Michelena',264),(265,'Coloncito',265),(266,'Urena',267),(267,'Delicias',268),(268,'La Tendida',269),(269,'San Cristobal',270),(270,'Seboruco',271),(271,'San Simon',272),(272,'Queniquea',273),(273,'San Josecito',274),(274,'Pregonero',275),(275,'Umoquena',276),(276,'Santa Isabel',277),(277,'Bocono',278),(278,'Sabana Grande',279),(279,'Chejende',280),(280,'Carache',281),(281,'Escuque',282),(282,'El Paradero',283),(283,'Campo Elias',284),(284,'Santa Apolonia',285),(285,'El Dividive',286),(286,'Monte Carmelo',287),(287,'Motatan',288),(288,'Pampan',289),(289,'Pampanito',290),(290,'Betijoque',291),(291,'Carvajal',292),(292,'Sabana de Mendoza',293),(293,'Trujillo',294),(294,'La Quebrada',295),(295,'Valera',296),(297,'La Guaira',297),(298,'San Pablo',298),(299,'Aroa',299),(300,'Chivacoa',300),(301,'Cocorote',301),(302,'Independencia',302),(303,'Sabana de Parra',303),(304,'Boraure',304),(305,'Yumare',305),(306,'Nirgua',306),(307,'Yaritagua',307),(308,'San Felipe',308),(309,'Guama',309),(310,'Urachiche',310),(311,'Veroes',311),(312,'El Toro',312),(313,'San Timoteo',313),(314,'Cabimas',314),(315,'Encontrados',315),(316,'San Carlos del Zulia',316),(317,'Pueblo Nuevo El Chivo',317),(318,'La Concepcion',318),(319,'Casigua El Cubo',319),(320,'Concepcion',320),(321,'Ciudad Ojeda',321),(322,'Machiques',322),(323,'San Rafael de Mojan',323),(324,'Maracaibo',324),(325,'Los Puertos de Altagracia',325),(326,'Sinamaica',326),(327,'La Villa del Rosario',327),(328,'San Francisco',328),(329,'Santa Rita',329),(330,'Tia Juana',330),(331,'Bobures',331),(332,'Bachaquero',332);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuyente`
--

DROP TABLE IF EXISTS `contribuyente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contribuyente` (
  `idcontribuyente` int(11) NOT NULL,
  `tiporif` varchar(45) DEFAULT NULL,
  `personaid` varchar(10) NOT NULL,
  `nacionalidadid` varchar(1) NOT NULL,
  PRIMARY KEY (`idcontribuyente`),
  KEY `fk_Contribuyente_Persona1_idx` (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuyente`
--

LOCK TABLES `contribuyente` WRITE;
/*!40000 ALTER TABLE `contribuyente` DISABLE KEYS */;
INSERT INTO `contribuyente` VALUES (20296530,'J','20296530','V'),(192418048,'J','19241804','V'),(192627518,'J','19262751','V'),(193489298,'J','19348929','V'),(195910078,'J','19591007','V'),(197262238,'J','19726223','V'),(198285818,'J','19828581','V'),(200106918,'J','20010691','V'),(201891078,'J','20189107','V'),(209274708,'J','20927470','V'),(238114158,'J','23811415','V');
/*!40000 ALTER TABLE `contribuyente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentabancaria`
--

DROP TABLE IF EXISTS `cuentabancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentabancaria` (
  `idcuentabancaria` varchar(20) NOT NULL,
  `tipocuenta` varchar(45) DEFAULT NULL,
  `bancoid` varchar(5) NOT NULL,
  `personaid` varchar(10) NOT NULL,
  `nacionalidadid` varchar(1) NOT NULL,
  `saldo` float NOT NULL,
  PRIMARY KEY (`idcuentabancaria`),
  KEY `fk_CuentaBancaria_Banco1_idx` (`bancoid`),
  KEY `fk_CuentaBancaria_Persona1_idx` (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentabancaria`
--

LOCK TABLES `cuentabancaria` WRITE;
/*!40000 ALTER TABLE `cuentabancaria` DISABLE KEYS */;
INSERT INTO `cuentabancaria` VALUES ('00015645376878900788','2','0001','23811415','V',2000),('01023947563820010029','1','0102','19591007','V',4000),('01050094847364783909','2','0105','10773199','V',200000),('01080013000293874899','1','0108','20927470','V',35000),('01080182161820032205','1','0108','20296530','V',200),('01166476454674839800','2','0108','20927471','V',1000);
/*!40000 ALTER TABLE `cuentabancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entejuridico`
--

DROP TABLE IF EXISTS `entejuridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entejuridico` (
  `identejuridico` varchar(12) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `razonsocial` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`identejuridico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entejuridico`
--

LOCK TABLES `entejuridico` WRITE;
/*!40000 ALTER TABLE `entejuridico` DISABLE KEYS */;
INSERT INTO `entejuridico` VALUES (' J000029610','Banco Mercantil, C.A','Entidad Financiera'),(' J000029679','Banco Provincial, S.A','Entidad Financiera'),(' J000373981','100% Banco C.A','Entidad Financiera'),(' J000423032','BANPLUS Banco Comercial, C.A','Entidad Financiera'),(' J000723060','BFC Banco Fondo Comun C.A','Entidad Financiera'),(' J080066227 ','Banco Activo, C.A','Entidad Financiera'),(' J300619460','Banco Occidental de Descuento, C.A','Entidad Financiera'),(' J301442040','Banco de la Gente Emprendedora BANGENTE, C.A','Entidad Financiera'),(' J308058238','Total Bank, C.A','Entidad Financiera'),(' J309841327','Banco Nacional de Credito, C.A','Entidad Financiera'),(' J316374173','Bancrecer S.A Banco de Desarrollo','Entidad Financiera'),('G200001100','Banco Central de Venezuela','Entidad Financiera'),('G200051876 ','Banco del Tesoro, C.A','Entidad Financiera'),('G200057955','Banco Agricola de Venezuela, C.A','Entidad Financiera'),('G200091487','Banco Bicentenario Banco Universal, C.A','Entidad Financiera'),('G200099976','Banco de Venezuela, S.A','Entidad Financiera'),('G200106760','Banco Industrial de Venezuela, C.A','Entidad Financiera'),('J000029490 ','Banco del Caribe, C.A','Entidad Financiera'),('J000029504','Banco del Exterior, C.A','Entidad Financiera'),('J000029709','Venezolano de Credito, S.A','Entidad Financiera'),('J000503605','BanValor Banco Comercial, C.A','Entidad Financiera'),('J000797234','Del Sur Banco Universal, C.A','Entidad Financiera'),('J000928630','Banco Guayana, C.A','Entidad Financiera'),('J002970553','Banco Plaza, C.A','Entidad Financiera'),('J070001739','Banco Coro, C.A','Entidad Financiera'),('J070133805','Banesco Banco Universal, S.A','Entidad Financiera'),('J090283846','Banco Sofitasa Banco Universal S.A','Entidad Financiera'),('J095048551','Banco Caroni, C.A','Entidad Financiera'),('J123456789','Empresa XYZ','Grupo XYZ'),('J123457678','Corpoelec, C.A','Energia Electrica del Estado'),('J239877674','Hidrolara, C.A','Hiroplanta Gubernamental'),('J300619460 ','Corp Banca, C.A','Entidad Financiera');
/*!40000 ALTER TABLE `entejuridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Distrito Capital'),(2,'Amazonas'),(3,'Anzoategui'),(4,'Apure'),(5,'Aragua'),(6,'Barinas'),(7,'Bolivar'),(8,'Carabobo'),(9,'Cojedes'),(10,'Delta Amacuro'),(11,'Falcon'),(12,'Guarico'),(13,'Lara'),(14,'Merida'),(15,'Miranda'),(16,'Monagas'),(17,'Nueva Esparta'),(18,'Portuguesa'),(19,'Sucre'),(20,'Tachira'),(21,'Trujillo'),(22,'Vargas'),(23,'Yaracuy'),(24,'Zulia');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `estadoid` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `fk_Municipio_Estado1_idx` (`estadoid`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Libertador',1),(2,'Alto Orinoco',2),(3,'Atabano',2),(4,'Atures',2),(5,'Autana',2),(6,'Manapiare',2),(7,'Maroa',2),(8,'Rio Negro',2),(9,'Anaco',3),(10,'Aragua',3),(11,'Bolivar',3),(12,'Bruzual',3),(13,'Cajigal',3),(14,'Carvajal',3),(15,'Diego Bautista Urbaneja',3),(16,'Freites',3),(17,'Guanipa',3),(18,'Guanta',3),(19,'Independencia',3),(20,'Libertad',3),(21,'McGregor',3),(22,'Miranda',3),(23,'Penalver',3),(24,'Piritu',3),(25,'Sotillo',3),(26,'Achaguas',4),(27,'Biruaca',4),(28,'Munoz',4),(29,'Paez',4),(30,'Pedro Camejo',4),(31,'Romulo Gallegos',4),(32,'San Fernando',4),(33,'Bolivar',5),(34,'Camatagua',5),(35,'Francisco Linares Alcantara',5),(36,'Girardot',5),(37,'Jose Angel Lamas',5),(38,'Jose Felix Rivas',5),(39,'Jose Rafael Revenga',5),(40,'Libertador',5),(41,'Mario Briceno',5),(42,'Ocumare de la Costa',5),(43,'San Casimiro',5),(44,'San Sebastian',5),(45,'Santiago Marino',5),(46,'Santos Michelena',5),(47,'Sucre',5),(48,'Tovar',5),(49,'Urdaneta',5),(50,'Zamora',5),(51,'Alberto Arvelo',6),(52,'Andres Eloy Blanco',6),(53,'Antonio Jose de Sucre',6),(54,'Arismendi',6),(55,'Barinas',6),(56,'Bolivar',6),(57,'Cruz Paredes',6),(58,'Ezequiel Zamora',6),(59,'Obispos',6),(60,'Pedraza',6),(61,'Rojas',6),(62,'Sosa',6),(63,'Caroni',7),(64,'Cedeno',7),(65,'El Callao',7),(66,'Gran Sabana',7),(67,'Heres',7),(68,'Piar',7),(69,'Raul Leoni',7),(70,'Roscio',7),(71,'Sifontes',7),(72,'Sucre',7),(73,'Padre Pedro Chen',7),(74,'Bejuma',8),(75,'Carlos Arvelo',8),(76,'Diego Ibarra',8),(77,'Guacara',8),(78,'Juan Jose Mora',8),(79,'Libertador',8),(80,'Los Guayos',8),(81,'Miranda',8),(82,'Montalbán',8),(83,'Naguanagua',8),(84,'Puerto Cabello',8),(85,'San Diego',8),(86,'San Juaquin',8),(87,'Valencia',8),(88,'Anzoategui',9),(89,'Falcon',9),(90,'Girardot',9),(91,'Lima Blanco',9),(92,'Pao de San Juan Bautista',9),(93,'Ricaurte',9),(94,'Romulo Gallegos',9),(95,'San Carlos',9),(96,'Tinaco',9),(97,'Antonio Diaz',10),(98,'Casacoima',10),(99,'Pedernales',10),(100,'Tucupita',10),(101,'Acosta',11),(102,'Bolivar',11),(103,'Buchivacoa',11),(104,'Cacique Manaure',11),(105,'Carirubana',11),(106,'Colina',11),(107,'Dabajuro',11),(108,'Democracia',11),(109,'Falcon',11),(110,'Federacion',11),(111,'Jacura',11),(112,'Los Taques',11),(113,'Mauroa',11),(114,'Miranda',11),(115,'Monseñor',11),(116,'Palmasola',11),(117,'Petit',11),(118,'Píritu',11),(119,'San Francisco',11),(120,'Silva',11),(121,'Sucre',11),(122,'Tocopero',11),(123,'Union',11),(124,'urumaco',11),(125,'Zamora',11),(126,'Camaguán',12),(127,'Chaguaramas',12),(128,'El Socorro',12),(129,'Francisco de Miranda',12),(130,'Jose Felix Rivas',12),(131,'Jose Tadeo Monagas',12),(132,'Juan German Roscio',12),(133,'Julian Mellado',12),(134,'Las Mercedes',12),(135,'Leonardo Infante',12),(136,'Pedro Zaraza',12),(137,'Ortiz',12),(138,'San Geronimo de Guayacal',12),(139,'San Jose de Guaribe',12),(140,'Santa Maria de Ipire',12),(141,'Andres Eloy Blanco',13),(142,'Crespo',13),(143,'Iribarren',13),(144,'Jimenez',13),(145,'Moran',13),(146,'Palavecino',13),(147,'Simon Planas',13),(148,'Torres',13),(149,'Urdaneta',13),(150,'Alberto Adriani',14),(151,'Andres Bello',14),(152,'Antonio Pinto Salina',14),(153,'Aricagua',14),(154,'Arzobispo Chacon',14),(155,'Arzobispo Campo Elias',14),(156,'Caracciolo Parra Olmedo',14),(157,'Cardenal Quintero',14),(158,'Guaraque',14),(159,'Julio Cesar Salas',14),(160,'Justo Briceno',14),(161,'Libertador',14),(162,'Miranda',14),(163,'Obispo Ramos de Lora',14),(164,'Padre Noruega',14),(165,'Pueblo Llano',14),(166,'Rangel',14),(167,'Rivas Davila',14),(168,'Santos Marquina',14),(169,'Sucre',14),(170,'Tovar',14),(171,'Tulio Febres Cordero',14),(172,'Zea',14),(173,'Acevedo',15),(174,'Andres Bello',15),(175,'Baruta',15),(176,'Brion',15),(177,'Buroz',15),(178,'Carrizal',15),(179,'Chaco',15),(180,'Cristobal Rojas',15),(181,'El Hatillo',15),(182,'Guaicaipuro',15),(183,'Independencia',15),(184,'Lander',15),(185,'Los Salias',15),(186,'Paez',15),(187,'Paz Castillo',15),(188,'Pedro Gual',15),(189,'Plaza',15),(190,'Simon Bolivar',15),(191,'Sucre',15),(192,'Urdaneta',15),(193,'Zamora',15),(194,'Acosta',16),(195,'Aguasay',16),(196,'Bolivar',16),(197,'Caripe',16),(198,'Cedeno',16),(199,'Ezequiel Zamora',16),(200,'Libertador',16),(201,'Maturin',16),(202,'Piar',16),(203,'Punceres',16),(204,'Santa Barbara',16),(205,'Sotillo',16),(206,'Uracoa',16),(207,'Antolin del Campo',17),(208,'Arismendi',17),(209,'Diaz',17),(210,'Garcia',17),(211,'Gomez',17),(212,'Maneiro',17),(213,'Marcano',17),(214,'Marino',17),(215,'Peninsula de Maracaibo',17),(216,'Tubores',17),(217,'Villalba',17),(218,'Agua Blanca',18),(219,'Araure',18),(220,'Esteller',18),(221,'Guanare',18),(222,'Guanarito',18),(223,'Monsenor Jose Vicenti de Unda',18),(224,'Ospino',18),(225,'Paez',18),(226,'Papelon',18),(227,'San Genaro de Boconoito',18),(228,'San Rafael de Onoto',18),(229,'Santa Rosalia',18),(230,'Sucre',18),(231,'Turen',18),(232,'Andres Eloy Blanco',19),(233,'Andres Mata',19),(234,'Arismendi',19),(235,'Benitez',19),(236,'Beremudez',19),(237,'Bolivar',19),(238,'Cajigal',19),(239,'Cruz Salmeron Acosta',19),(240,'Libertador',19),(241,'Marino',19),(242,'Mejia',19),(243,'Montes',19),(244,'Ribero',19),(245,'Sucre',19),(246,'Valdez',19),(247,'Andres Bello',20),(248,'Antonio Romulo Acosta',20),(249,'Ayacucho',20),(250,'Bolivar',20),(251,'Cardenas',20),(252,'Cordoba',20),(253,'Fernandez Feo',20),(254,'Francisco de Miranda',20),(255,'Garcia de Hevia',20),(256,'Guasimos',20),(257,'Independencia',20),(258,'Jauregui',20),(259,'Jose Maria Vargas',20),(260,'Junin',20),(261,'Libertad',20),(262,'Libertador',20),(263,'Lobatera',20),(264,'Michelena',20),(265,'Panamericano',20),(267,'Pedro Maria Urena',20),(268,'Rafael Urdaneta',20),(269,'Samuel Dario Maldonado',20),(270,'San Cristobal',20),(271,'Seboruco',20),(272,'Simon Rodriguez',20),(273,'Sucre',20),(274,'Torbes',20),(275,'Uribante',20),(276,'San Judas Tadeo',20),(277,'Andres Bello',21),(278,'Bocono',21),(279,'Bolivar',21),(280,'Candelaria',21),(281,'Carache',21),(282,'Escuque',21),(283,'Jose Felipe Marquez Canizalez',21),(284,'Jose Vicente Campos Elias',21),(285,'La Ceiba',21),(286,'Miranda',21),(287,'Monte Carmelo',21),(288,'Motatan',21),(289,'Pampan',21),(290,'Pampanito',21),(291,'Rafael Rangel',21),(292,'San Rafael de Carvajal',21),(293,'Sucre',21),(294,'Trujillo',21),(295,'Urdaneta',21),(296,'Valera',21),(297,'Vargas',22),(298,'Aristides Bastidas',23),(299,'Bolivar',23),(300,'Bruzual',23),(301,'Cocorote',23),(302,'Independencia',23),(303,'Jose Antonio Paez',23),(304,'La Trinidad',23),(305,'Manuel Monge',23),(306,'Nirgua',23),(307,'Pena',23),(308,'San Felipe',23),(309,'Sucre',23),(310,'Urachiche',23),(311,'Veroes',23),(312,'Almirante Padilla',24),(313,'Baralt',24),(314,'Cabimas',24),(315,'Catatumbo',24),(316,'Colon',24),(317,'Francisco Javier Pulgar',24),(318,'Jesus Enrique Losada',24),(319,'Jesus Maria Semprun',24),(320,'La Canada de Urdaneta',24),(321,'Lagunillas',24),(322,'Machiques de Perija',24),(323,'Mara',24),(324,'Maracaibo',24),(325,'Miranda',24),(326,'Paez',24),(327,'Rosario de Perija',24),(328,'San Francisco',24),(329,'Santa Rita',24),(330,'Simon Bolivar',24),(331,'Sucre',24),(332,'Valmore Rodriguez',24);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `contribuyenteid` int(11) NOT NULL,
  `tributoid` int(11) NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_Pago_Contribuyente1_idx` (`contribuyenteid`),
  KEY `tributoid_idx` (`tributoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'2000-09-01',20296530,1),(2,'2012-08-07',192418048,2),(3,'2013-07-01',192627518,1),(4,'2014-02-09',193489298,2);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nacionalidad` varchar(1) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `estadocivil` varchar(1) DEFAULT NULL,
  `ciudadid` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`,`nacionalidad`),
  KEY `fk_Persona_Ciudad1_idx` (`ciudadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('10773199','FREDDY','RAMOS','URB. LOS HORCONES','04145624435','V','freddyr@hotmail.com','S',143),('18295979','PEDRO ANTONIO','GANDIA ESCALONA','CASERÍO: ASENTAMIENTO GATO NEGRO.','04123310018','V','pedro@yahoo.com','S',221),('19198872','CARLOS JOSE','ENOCK PEREDA','URBANIZACIÓN: DANIEL CARIAS. ','04267785984','V','enock@gmail.com','S',300),('19241804','FREDDY JOSE','APONTE GONZALEZ','URBANIZACIÓN: CABO JOSE DORANTE.','04247869968','V','freddy@gmail.com','S',144),('19262751','HILDAMAR ','PARRA','CALLEJON 11 CON CALLE 45 ','04167762536','V','hilda@yahoo.com','S',143),('19348929','MARIA ANTONIETA','DORANTE ','URBANIZACIÓN: RUEZGA SUR.','04263003981','V','maria@hotmail.com','S',143),('19591007','NATASHA','MAVARE','URB. LAS TRINITARIA','04165563325','V','nmavare@gmail.com','S',143),('19726223','JOSE MANUEL','RODRIGUEZ','PAVIA ARRIBA','02126748857','V','jose@hotmail.com','S',143),('19828581','MIGUEL ANGEL','SANTIAGO MENDOZA','URBANIZACIÓN CLEOFE ANDRADE','04243524110','V','santiago@yahoo.com','S',143),('20010691','ANA','URE','URB. LOS CREPUSCULOS','04167782778','V','ana@gmail.com','S',143),('20189107','RAFAEL','CAMACHO','URB UNION','04142556378','V','zaeta@hotmail.com','S',143),('20236529','ALEXI','BARRETO','URB. EL CUJI','04167890987','V','zabarce@gmail.com','S',143),('20296530','EUCLIDES','MENDOZA','URB OBELISCO','04127809667','V','mendoza.euclides@gmail.com','S',143),('20429107','YESSIKKA','HERNANDEZ','SECTOR EL COUNTRY','04246299899','V','yessika@yahoo.com','S',295),('20526623','JOSALYS','MATOS','URBANIZACIÓN: EL OBELISCO','04145526376','V','josa@gmail.com','S',146),('20540118','HENRI FRANCISCO','SAMUEL ROMERO','BARRIO: PUEBLO NUEVO. ','04167789932','V','henris@gmail.com','S',143),('20927470','VERONICA ','VASQUEZ','CABUDARE','04160998678','V','veronicavasquez.92@gmail.com','S',143),('20927471','ALEXANDRA','PEREIRA','URB. CARORITA 2','04167736538','V','alexa@gmail.com','S',148),('20934558','DAISY','MONTANO','URB. SANTANDER','04145638878','V','daysi@gmail.com','C',63),('20987789','GUILLERMO','OSORIO','ALTOS DE PARAMILLO','04167789988','V','guille@gmail.com','S',269),('23811415','FREMBERLING','RAMOS','URB. LOS HORCONES','04163456788','V','fremberling@gmail.com','S',143),('5610928','ANTONIO','PEREIRA','CALLE 57 A. CON CARR 17','04166655009','E','antoniop@hotmail.com','C',143),('73892787','ZINA','RODRIGUEZ','URB. EL LIMON','04125658890','E','zina@gmail.com','C',41),('7390383','JOSE','VASQUEZ','URB. LAS BRISAS DEL OBELISCO','04145243455','V','jorova@gmail.com','S',143),('81273667','ANTONIO','SOUSA','CALLE 34 CON CARR. 16','04124556352','E','tony@hotmail.com','S',143);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetacredito`
--

DROP TABLE IF EXISTS `tarjetacredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjetacredito` (
  `idtarjetacredito` varchar(17) NOT NULL,
  `mesexpiracion` int(11) DEFAULT NULL,
  `annoexpiracion` int(11) DEFAULT NULL,
  `codseguridad` int(3) DEFAULT NULL,
  `limite` float DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `personaid` varchar(10) NOT NULL,
  `nacionalidadid` varchar(1) NOT NULL,
  `bancoid` varchar(5) NOT NULL,
  PRIMARY KEY (`idtarjetacredito`),
  KEY `fk_TarjetaCredito_Persona1_idx` (`personaid`),
  KEY `fk_TarjetaCredito_Banco1_idx` (`bancoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetacredito`
--

LOCK TABLES `tarjetacredito` WRITE;
/*!40000 ALTER TABLE `tarjetacredito` DISABLE KEYS */;
INSERT INTO `tarjetacredito` VALUES ('1234567898765432',8,17,301,20000,20000,'20296530','V','0108');
/*!40000 ALTER TABLE `tarjetacredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotransaccion`
--

DROP TABLE IF EXISTS `tipotransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotransaccion` (
  `idtipotransaccion` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipotransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotransaccion`
--

LOCK TABLES `tipotransaccion` WRITE;
/*!40000 ALTER TABLE `tipotransaccion` DISABLE KEYS */;
INSERT INTO `tipotransaccion` VALUES (1,'Transferencia'),(2,'Deposito'),(3,'Cheque');
/*!40000 ALTER TABLE `tipotransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `idtransaccion` bigint(8) unsigned NOT NULL,
  `monto` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `bancoid` varchar(5) NOT NULL,
  `tipotransaccionid` int(11) NOT NULL,
  `personaid` varchar(10) NOT NULL,
  `nacionalidadid` varchar(1) NOT NULL,
  `cuentabancariaid` varchar(20) NOT NULL,
  PRIMARY KEY (`idtransaccion`,`tipotransaccionid`),
  KEY `fk_Transaccion_Banco1_idx` (`bancoid`),
  KEY `fk_Transaccion_TipoTransaccion1_idx` (`tipotransaccionid`),
  KEY `fk_Transaccion_Persona1_idx` (`personaid`),
  KEY `cuenta_idx` (`cuentabancariaid`),
  CONSTRAINT `cuenta` FOREIGN KEY (`cuentabancariaid`) REFERENCES `cuentabancaria` (`idcuentabancaria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (12345,1500,'2014-02-12','0108',1,'20296530','V','00015645376878900788'),(322332,2000,'2014-02-07','0108',2,'23811415','V','01080182161820032205'),(323302,1500,'2014-02-13','0108',2,'19591007','V','01023947563820010029'),(324882,3000,'2014-02-11','0108',2,'23811415','V','00015645376878900788'),(2496664878,428,'2014-02-07','0121',2,'20927470','V','01023947563820010029'),(1340395303951011289,12000,'2013-08-07','0134',3,'7390383','V','01080182161820032205');
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributo`
--

DROP TABLE IF EXISTS `tributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tributo` (
  `idtributo` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`idtributo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributo`
--

LOCK TABLES `tributo` WRITE;
/*!40000 ALTER TABLE `tributo` DISABLE KEYS */;
INSERT INTO `tributo` VALUES (1,'ISLR',NULL),(2,'IVA',0.14),(3,'Impuestos sobre sucesiones',0.15),(4,'Impuestos sobre Donaciones',0.01),(5,'Impuestos sobre cigarrillo y manufacturera de tabacos.',0.1),(6,'Impuestos sobre licores y especies alcohólicas',0.2),(7,'Impuesto sobre las actividades de juegos envite y de azar.',0.2);
/*!40000 ALTER TABLE `tributo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vivienda`
--

DROP TABLE IF EXISTS `vivienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vivienda` (
  `idvivienda` int(11) NOT NULL AUTO_INCREMENT,
  `codcatastral` varchar(45) DEFAULT NULL,
  `metrocuadrado` varchar(45) DEFAULT NULL,
  `alicuota` double DEFAULT NULL,
  `numinmueble` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `fechadocumento` date DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `personaid` varchar(10) NOT NULL,
  `nacionalidadid` varchar(1) NOT NULL,
  PRIMARY KEY (`idvivienda`),
  KEY `fk_Vivienda_Persona1_idx` (`personaid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vivienda`
--

LOCK TABLES `vivienda` WRITE;
/*!40000 ALTER TABLE `vivienda` DISABLE KEYS */;
INSERT INTO `vivienda` VALUES (1,'123456789','75',0.01,'A95','Urb. Obelisco','2014-02-01','A','20296530','V'),(2,'987654321','250',0.1,'A11','Urb. Obelisco','2014-02-06','A','20927470','V'),(3,'123450987','400',0.1,'12-01','Las Mercedes de Cabudare','2014-02-02','A','23811415','V'),(4,'123654789','400',0.1,'12-02','Las Mercedes de Cabudare','2014-02-03','A','20927470','V'),(5,'192418049','400',0.1,'12-10','Las Mercedes de Cabudare','2014-01-03','A','19241804','V'),(6,'192627518','400',0.1,'12-08','Las Mercedes de Cabudare','2014-01-03','A','19262751','V'),(7,'201891071','400',0.1,'12-09','Las Mercedes de Cabudare','2014-01-03','A','20189107','V'),(8,'202965302','400',0.1,'12-03','Las Mercedes de Cabudare','2014-01-03','A','20296530','V'),(9,'204291073','400',0.1,'12-04','Las Mercedes de Cabudare','2014-01-03','A','20429107','V'),(10,'205266234','400',0.1,'12-07','Las Mercedes de Cabudare','2014-01-03','A','20526623','V'),(11,'197262235','400',0.1,'12-06','Las Mercedes de Cabudare','2014-01-03','A','19726223','V'),(12,'192627516','400',0.1,'12-05','Las Mercedes de Cabudare','2014-01-03','A','19262751','V');
/*!40000 ALTER TABLE `vivienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-15 22:18:36


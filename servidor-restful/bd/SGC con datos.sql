CREATE DATABASE  IF NOT EXISTS `gestioncondominio` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `gestioncondominio`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: gestioncondominio
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
-- Table structure for table `arbols`
--

DROP TABLE IF EXISTS `arbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `text` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vinculo` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbols`
--

LOCK TABLES `arbols` WRITE;
/*!40000 ALTER TABLE `arbols` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areacomuns`
--

DROP TABLE IF EXISTS `areacomuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areacomuns` (
  `idareacomun` int(11) NOT NULL AUTO_INCREMENT,
  `codigoareacomun` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionareacomun` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusareacomun` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `capacidadareacomun` int(11) NOT NULL,
  `idcondominioareacomun` int(11) NOT NULL,
  `nombreareacomun` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idareacomun`),
  KEY `fk_areacomuns_condominios1_idx` (`idcondominioareacomun`),
  CONSTRAINT `fk_areacomuns_condominios1` FOREIGN KEY (`idcondominioareacomun`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areacomuns`
--

LOCK TABLES `areacomuns` WRITE;
/*!40000 ALTER TABLE `areacomuns` DISABLE KEYS */;
INSERT INTO `areacomuns` VALUES (1,'1','Piscina con 20 mesas','A',20,1,'Piscina A'),(2,'2','Cancha de futbol','A',11,0,'Cancha A'),(3,'3','Cancha de Beisbol','A',40,1,'Cancha la bota'),(4,'4','Salon de Fiesta Grande','A',200,1,'Salon Maritimo'),(5,'5','Caney para fiestas campestre','A',10,0,'Caney B');
/*!40000 ALTER TABLE `areacomuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `codigocondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrebanco` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `rifbanco` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusbanco` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (108,'0108','Banco Provincial','J12345678','A'),(116,'0116','Bod Banco Universal','J98765432','A');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `codigocargo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecargo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuscargo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'1','Concerje','A'),(2,'2','Vigilante','A'),(3,'3','Administrador','A'),(4,'4','Presidente','A'),(5,'5','Tesorero','A');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudads`
--

DROP TABLE IF EXISTS `ciudads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudads` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `codigociudad` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombreciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusciudad` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idmunicipiociudad` int(11) NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudades_municipios1_idx` (`idmunicipiociudad`),
  CONSTRAINT `fk_ciudades_municipios1` FOREIGN KEY (`idmunicipiociudad`) REFERENCES `municipios` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudads`
--

LOCK TABLES `ciudads` WRITE;
/*!40000 ALTER TABLE `ciudads` DISABLE KEYS */;
INSERT INTO `ciudads` VALUES (1,'1','Barquisimeto','A',1),(2,'2','Cabudare','A',1);
/*!40000 ALTER TABLE `ciudads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantedepagos`
--

DROP TABLE IF EXISTS `comprobantedepagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobantedepagos` (
  `idcomprobantedepago` int(11) NOT NULL AUTO_INCREMENT,
  `codigocomprobantedepago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcioncomprobantedepago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacomprobantedepago` date NOT NULL,
  `montototalcomprobante` float NOT NULL,
  `nombrearchivocomprobantedepago` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatoarchivocomprobantedepago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivocomprobantedepago` blob,
  `estatuscomprobantedepago` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idproveedorxcondominiocomprobantedepago` int(11) NOT NULL,
  PRIMARY KEY (`idcomprobantedepago`),
  KEY `fk_comprobantedepago_proveedorxcondominios1_idx` (`idproveedorxcondominiocomprobantedepago`),
  CONSTRAINT `fk_comprobantedepago_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominiocomprobantedepago`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantedepagos`
--

LOCK TABLES `comprobantedepagos` WRITE;
/*!40000 ALTER TABLE `comprobantedepagos` DISABLE KEYS */;
INSERT INTO `comprobantedepagos` VALUES (1,'1','Pago del Agua','2014-01-01',12000,'Comprobante','pdf',NULL,'A',2),(2,'2','Pago de GAS','2014-02-02',200,'c','pdf',NULL,'A',3),(3,'3','Compra de Vidrio Puerta Principal','2014-04-04',1500,'c','pdf',NULL,'A',2);
/*!40000 ALTER TABLE `comprobantedepagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condominios`
--

DROP TABLE IF EXISTS `condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condominios` (
  `idcondominio` int(11) NOT NULL,
  `rifcondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `direccioncondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `nombredocumentocondominio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatodocumentocondominio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `documentocondominio` blob,
  `interesmoracondominio` float NOT NULL,
  `tiempomoracondominio` int(11) NOT NULL,
  `nombrefotocondominio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotocondominio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotocondominio` blob,
  `estatuscondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idciudadcondominio` int(11) NOT NULL,
  `idtipocondominiocondominio` int(11) NOT NULL,
  PRIMARY KEY (`idcondominio`),
  KEY `fk_condominios_ciudads1_idx` (`idciudadcondominio`),
  KEY `fk_condominios_tipocondominios1_idx` (`idtipocondominiocondominio`),
  CONSTRAINT `fk_condominios_ciudads1` FOREIGN KEY (`idciudadcondominio`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_condominios_tipocondominios1` FOREIGN KEY (`idtipocondominiocondominio`) REFERENCES `tipocondominios` (`idtipocondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominios`
--

LOCK TABLES `condominios` WRITE;
/*!40000 ALTER TABLE `condominios` DISABLE KEYS */;
INSERT INTO `condominios` VALUES (0,'J11','Lara P','O','Documento','Documento',NULL,0.1,1,'Foto','foto',NULL,'A',1,2),(1,'J12','Mercedes','Cabudare','Documento','Documento',NULL,0.1,2,'Foto','foto',NULL,'A',2,1);
/*!40000 ALTER TABLE `condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlvisitas`
--

DROP TABLE IF EXISTS `controlvisitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlvisitas` (
  `idcontrolvisita` int(11) NOT NULL AUTO_INCREMENT,
  `codigocontrolvisita` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechavisita` date NOT NULL,
  `horavisita` time NOT NULL,
  `idvisitantecontrolvisita` int(11) NOT NULL,
  `idempleadocontrolvisita` int(11) NOT NULL,
  `idinmueblecontrolvisita` int(11) NOT NULL,
  `estatuscontrolvisita` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcontrolvisita`),
  KEY `fk_controlvisitas_visitantes1_idx` (`idvisitantecontrolvisita`),
  KEY `fk_controlvisitas_empleados1_idx` (`idempleadocontrolvisita`),
  KEY `fk_controlvisitas_inmuebles1_idx` (`idinmueblecontrolvisita`),
  CONSTRAINT `fk_controlvisitas_empleados1` FOREIGN KEY (`idempleadocontrolvisita`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_controlvisitas_inmuebles1` FOREIGN KEY (`idinmueblecontrolvisita`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_controlvisitas_visitantes1` FOREIGN KEY (`idvisitantecontrolvisita`) REFERENCES `visitantes` (`idvisitante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlvisitas`
--

LOCK TABLES `controlvisitas` WRITE;
/*!40000 ALTER TABLE `controlvisitas` DISABLE KEYS */;
INSERT INTO `controlvisitas` VALUES (1,'1','2014-01-01','02:00:00',1,2,1,'A'),(2,'2','2014-01-02','04:00:00',2,2,2,'A'),(3,'3','2014-02-03','05:00:00',1,3,3,'A');
/*!40000 ALTER TABLE `controlvisitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copropietarios`
--

DROP TABLE IF EXISTS `copropietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copropietarios` (
  `idcopropietario` int(11) NOT NULL AUTO_INCREMENT,
  `cedulacopropietario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecopropietario` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidocopropietario` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `correocopropietario` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefonocopropietario` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacreacioncopropietario` date NOT NULL,
  `estatuscopropietario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `direccioncopropietario` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechanacimientocopropietario` date NOT NULL,
  `nombrefotocopropietario` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotocopropietario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotocopropietario` blob,
  `twittercopropietario` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idciudadcopropietario` int(11) NOT NULL,
  PRIMARY KEY (`idcopropietario`),
  KEY `fk_copropietarios_ciudads1_idx` (`idciudadcopropietario`),
  CONSTRAINT `fk_copropietarios_ciudads1` FOREIGN KEY (`idciudadcopropietario`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copropietarios`
--

LOCK TABLES `copropietarios` WRITE;
/*!40000 ALTER TABLE `copropietarios` DISABLE KEYS */;
INSERT INTO `copropietarios` VALUES (1,'123','Vero','Vasquez','veronica@yahoo.com','04168736454','2014-01-01','A','Cabudare','1990-01-01','foto','foto',NULL,'vero',2),(2,'234','Ale','Vasquez','v@gmail.com','12345','2014-01-01','A','Cabudare','1990-01-01','foto','foto',NULL,'ale',2),(3,'345','Jose','Perez','p@gmail.com','12345','2014-01-01','A','Barquisimeto','1990-01-01','foto','foto',NULL,'jose',2),(4,'567','Xiomara','Avila','x@gmail.com','234','2014-01-01','A','Barquisimeto','1990-01-01','f','f',NULL,'x',2),(5,'238765','Yuly','Izarra','y@gmail.com','456','2014-01-01','A','Barquisimeto','1990-01-01','f','f',NULL,'y',1),(6,'34554','Zulme','Saldivia','s@gmail.com','7654','2014-01-01','A','Barquisimeto','1990-01-01','f','f',NULL,'z',1),(8,'34543','Wilmer','Ojeda','o@gmail.com','456','2014-01-01','A','Barquisimeto','1990-01-01','f','f',NULL,'w',1);
/*!40000 ALTER TABLE `copropietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacions`
--

DROP TABLE IF EXISTS `cotizacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacions` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigocotizacion` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcioncotizacion` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacotizacioncotizacion` date NOT NULL,
  `fechavencimientocotizacioncotizacion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `aprobacioncotizacion` tinyint(1) NOT NULL,
  `montocotizacion` float NOT NULL,
  `estatuscotizacion` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idproveedorxcondominiocotizacion` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `fk_cotizacions_proveedorxcondominios1_idx` (`idproveedorxcondominiocotizacion`),
  CONSTRAINT `fk_cotizacions_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominiocotizacion`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacions`
--

LOCK TABLES `cotizacions` WRITE;
/*!40000 ALTER TABLE `cotizacions` DISABLE KEYS */;
INSERT INTO `cotizacions` VALUES (1,'1','Recibo de agua','2013-02-01','2013-03-01',0,12000,'A',2),(2,'2','Remodelación de piscina','2014-02-02','2014-02-03',0,20000,'A',6);
/*!40000 ALTER TABLE `cotizacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `numerocuenta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `idbancocuenta` int(11) NOT NULL,
  `idcondominiocuenta` int(11) NOT NULL,
  `cedulatitularcuenta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombretitularcuenta` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `tipocuenta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `saldodisponible` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionbanco` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`numerocuenta`,`idbancocuenta`,`idcondominiocuenta`),
  KEY `fk_cuentas_bancos1_idx` (`idbancocuenta`),
  KEY `fk_cuentas_condominios1_idx` (`idcondominiocuenta`),
  CONSTRAINT `fk_cuentas_bancos1` FOREIGN KEY (`idbancocuenta`) REFERENCES `bancos` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuentas_condominios1` FOREIGN KEY (`idcondominiocuenta`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES ('01089903876373839',108,1,'12345','Vero','1','20000','Cuenta abierta para fondo de reserva'),('01161234567898765',116,0,'12345','Ale','2','20000','Fondo de Prestaciones sociales');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles`
--

DROP TABLE IF EXISTS `detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles` (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idcomprobantedepagodetalle` int(11) DEFAULT NULL,
  `idcotizaciondetalle` int(11) DEFAULT NULL,
  `descripciondetalle` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `montodetalle` float NOT NULL,
  `idtipoegresodetalle` int(11) NOT NULL,
  `idproveedorxserviciodetalle` int(11) NOT NULL,
  `idformapagodetalle` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_comprobantedepagos1_idx` (`idcomprobantedepagodetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_cotizacions1_idx` (`idcotizaciondetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_tipoegresos1_idx` (`idtipoegresodetalle`),
  KEY `fk_detalledecomprobante_proveedorxservicios1_idx` (`idproveedorxserviciodetalle`),
  KEY `fk_detalles_formapagos1_idx` (`idformapagodetalle`),
  CONSTRAINT `fk_detallecomprobantecotizacionservicio_comprobantedepagos1` FOREIGN KEY (`idcomprobantedepagodetalle`) REFERENCES `comprobantedepagos` (`idcomprobantedepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallecomprobantecotizacionservicio_cotizacions1` FOREIGN KEY (`idcotizaciondetalle`) REFERENCES `cotizacions` (`idcotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallecomprobantecotizacionservicio_tipoegresos1` FOREIGN KEY (`idtipoegresodetalle`) REFERENCES `tipoegresos` (`idtipoegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalledecomprobante_proveedorxservicios1` FOREIGN KEY (`idproveedorxserviciodetalle`) REFERENCES `proveedorxservicios` (`idproveedorxservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_formapagos1` FOREIGN KEY (`idformapagodetalle`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles`
--

LOCK TABLES `detalles` WRITE;
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
INSERT INTO `detalles` VALUES (2,1,1,'Pago del agua',12000,1,2,1),(3,2,NULL,'Pago de 1 bombona de GAS',100,1,3,1),(4,2,NULL,'Pago de instalación de bombona',100,1,3,1),(5,3,NULL,'Compra de vidrio puerta principal',1500,2,2,1);
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresonocomunxinmuebles`
--

DROP TABLE IF EXISTS `egresonocomunxinmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresonocomunxinmuebles` (
  `idegresonocomunxinmueble` int(11) NOT NULL AUTO_INCREMENT,
  `idegresosnocomun` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `estatusegresonocomunxinmueble` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idegresonocomunxinmueble`),
  KEY `fk_egresonocomunxinmuebles_egresosnocomuns1_idx` (`idegresosnocomun`),
  KEY `fk_egresonocomunxinmuebles_inmuebles1_idx` (`idinmueble`),
  CONSTRAINT `fk_egresonocomunxinmuebles_egresosnocomuns1` FOREIGN KEY (`idegresosnocomun`) REFERENCES `egresosnocomuns` (`idegresosnocomun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresonocomunxinmuebles_inmuebles1` FOREIGN KEY (`idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresonocomunxinmuebles`
--

LOCK TABLES `egresonocomunxinmuebles` WRITE;
/*!40000 ALTER TABLE `egresonocomunxinmuebles` DISABLE KEYS */;
INSERT INTO `egresonocomunxinmuebles` VALUES (1,1,1,'A');
/*!40000 ALTER TABLE `egresonocomunxinmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresos`
--

DROP TABLE IF EXISTS `egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresos` (
  `idegreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigoegreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionegreso` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `fechaegreso` date NOT NULL,
  `montoegreso` float NOT NULL,
  `estatusegreso` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `iddetalles` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  `idformapagopago` int(11) NOT NULL,
  PRIMARY KEY (`idegreso`),
  KEY `fk_egresos_detalles1_idx` (`iddetalles`),
  KEY `fk_egresos_condominios1_idx` (`idcondominio`),
  KEY `fk_egresos_formapagos1_idx` (`idformapagopago`),
  CONSTRAINT `fk_egresos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresos_detalles1` FOREIGN KEY (`iddetalles`) REFERENCES `detalles` (`iddetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresos_formapagos1` FOREIGN KEY (`idformapagopago`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresos`
--

LOCK TABLES `egresos` WRITE;
/*!40000 ALTER TABLE `egresos` DISABLE KEYS */;
INSERT INTO `egresos` VALUES (1,'1','Pago por servicios de GAS','2014-02-02',100,'A',3,1,1),(2,'2','Pago por 1 bombona de GAS','2014-02-02',100,'A',4,1,1);
/*!40000 ALTER TABLE `egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresosnocomuns`
--

DROP TABLE IF EXISTS `egresosnocomuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresosnocomuns` (
  `idegresosnocomun` int(11) NOT NULL AUTO_INCREMENT,
  `codigonocomun` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionnocomun` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `montonocomuns` float NOT NULL,
  `fechanocomun` date NOT NULL,
  `estatusegresonocomun` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `iddetalle` int(11) NOT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idegresosnocomun`),
  KEY `fk_egresosnocomuns_detalles1_idx` (`iddetalle`),
  KEY `fk_egresosnocomuns_condominios1_idx` (`idcondominio`),
  CONSTRAINT `fk_egresosnocomuns_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresosnocomuns_detalles1` FOREIGN KEY (`iddetalle`) REFERENCES `detalles` (`iddetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresosnocomuns`
--

LOCK TABLES `egresosnocomuns` WRITE;
/*!40000 ALTER TABLE `egresosnocomuns` DISABLE KEYS */;
INSERT INTO `egresosnocomuns` VALUES (1,'1','Compra de Vidrio Puerta Principal',1500,'2014-02-04','A',5,1);
/*!40000 ALTER TABLE `egresosnocomuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresoxrecibos`
--

DROP TABLE IF EXISTS `egresoxrecibos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresoxrecibos` (
  `idegresoxrecibo` int(11) NOT NULL AUTO_INCREMENT,
  `montoegresoxrecibo` float NOT NULL,
  `estatusegresoxrecibo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idrecibocobro` int(11) NOT NULL,
  `idegreso` int(11) DEFAULT NULL,
  `idegresonocomunxinmueble` int(11) DEFAULT NULL,
  PRIMARY KEY (`idegresoxrecibo`),
  KEY `fk_egresoxrecibocobroxinmuebles_egresos1_idx` (`idegreso`),
  KEY `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1_idx` (`idrecibocobro`),
  KEY `fk_egresoxrecibo_egresonocomunxinmuebles1_idx` (`idegresonocomunxinmueble`),
  CONSTRAINT `fk_egresoxrecibocobroxinmuebles_egresos1` FOREIGN KEY (`idegreso`) REFERENCES `egresos` (`idegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1` FOREIGN KEY (`idrecibocobro`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresoxrecibo_egresonocomunxinmuebles1` FOREIGN KEY (`idegresonocomunxinmueble`) REFERENCES `egresonocomunxinmuebles` (`idegresonocomunxinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresoxrecibos`
--

LOCK TABLES `egresoxrecibos` WRITE;
/*!40000 ALTER TABLE `egresoxrecibos` DISABLE KEYS */;
INSERT INTO `egresoxrecibos` VALUES (1,50,'A',1,1,NULL),(2,50,'A',1,2,NULL),(3,1500,'A',1,NULL,1);
/*!40000 ALTER TABLE `egresoxrecibos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaempledo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombreempledo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidoempledo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `direccionempledo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoempledo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `correoempledo` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechanacimientoempleado` date DEFAULT NULL,
  `nombrefotoempleado` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotoempleado` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotoempleado` blob,
  `sueldobase` float NOT NULL,
  `estatusempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idloginempleado` int(11) NOT NULL,
  `idcondominioempleado` int(11) NOT NULL,
  `idcargoempleado` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_logins1_idx` (`idloginempleado`),
  KEY `fk_empleados_condominios1_idx` (`idcondominioempleado`),
  KEY `fk_empleados_cargo1_idx` (`idcargoempleado`),
  CONSTRAINT `fk_empleados_cargo1` FOREIGN KEY (`idcargoempleado`) REFERENCES `cargos` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_condominios1` FOREIGN KEY (`idcondominioempleado`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_logins1` FOREIGN KEY (`idloginempleado`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'1234','Pedro','Guanipa','Cabudare','1234','pepito@gamail.com','1957-01-01','f','f',NULL,3000,'A',3,1,1),(2,'4356346','Juan','Marquez','Quibor','3456','e@g','1980-01-01','f','f',NULL,4000,'A',6,1,2),(3,'123','Manuel','Sevilla','cabudare','1','a','1987-01-01','f','f',NULL,5000,'A',5,1,3);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `codigoestado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombreestado` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusestado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'1','Lara','A'),(2,'2','Falcón','A'),(3,'3','Zulia','A');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fondoreservas`
--

DROP TABLE IF EXISTS `fondoreservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fondoreservas` (
  `idfondoreserva` int(11) NOT NULL AUTO_INCREMENT,
  `codigofondoreserva` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrefondoreserva` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `objetivofondoreserva` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `cuentas` float NOT NULL,
  `montofijfondoreserva` float NOT NULL,
  `saldoactual` float NOT NULL,
  `estatusfondoreserva` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idcondominiofondoreserva` int(11) NOT NULL,
  PRIMARY KEY (`idfondoreserva`),
  KEY `fk_fondoreservas_condominios1_idx` (`idcondominiofondoreserva`),
  CONSTRAINT `fk_fondoreservas_condominios1` FOREIGN KEY (`idcondominiofondoreserva`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fondoreservas`
--

LOCK TABLES `fondoreservas` WRITE;
/*!40000 ALTER TABLE `fondoreservas` DISABLE KEYS */;
INSERT INTO `fondoreservas` VALUES (1,'1','Fondo para Remodelaciones','Remodelar fachada del condominio',0.1,200000,0,'A',1),(2,'2','Fondo para Prestaciones Sociales','Prestaciones Sociales de Trabajadores',0.1,300000,0,'A',0);
/*!40000 ALTER TABLE `fondoreservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagos`
--

DROP TABLE IF EXISTS `formapagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formapagos` (
  `idformapagopago` int(11) NOT NULL AUTO_INCREMENT,
  `codigoformapago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionforma` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusformadepago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idformapagopago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagos`
--

LOCK TABLES `formapagos` WRITE;
/*!40000 ALTER TABLE `formapagos` DISABLE KEYS */;
INSERT INTO `formapagos` VALUES (1,'1','Deposito','A'),(2,'2','Transferencia','A');
/*!40000 ALTER TABLE `formapagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencianotificaciones`
--

DROP TABLE IF EXISTS `frecuencianotificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencianotificaciones` (
  `idfrecuencianotificaciones` int(11) NOT NULL,
  `codigofrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombrefrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusfrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idfrecuencianotificaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencianotificaciones`
--

LOCK TABLES `frecuencianotificaciones` WRITE;
/*!40000 ALTER TABLE `frecuencianotificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `frecuencianotificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarioareas`
--

DROP TABLE IF EXISTS `horarioareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarioareas` (
  `idhorarioarea` int(11) NOT NULL AUTO_INCREMENT,
  `codigohorario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `diahorario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  `estatushorario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idareacomun` int(11) NOT NULL,
  PRIMARY KEY (`idhorarioarea`),
  KEY `fk_horariopordiadeareas_areacomuns1_idx` (`idareacomun`),
  CONSTRAINT `fk_horariopordiadeareas_areacomuns1` FOREIGN KEY (`idareacomun`) REFERENCES `areacomuns` (`idareacomun`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarioareas`
--

LOCK TABLES `horarioareas` WRITE;
/*!40000 ALTER TABLE `horarioareas` DISABLE KEYS */;
INSERT INTO `horarioareas` VALUES (1,'1','Martes','11:00:00','16:00:00','A',1),(2,'2','Miercoles','11:00:00','16:00:00','A',1),(3,'3','Jueves','11:00:00','16:00:00','A',1),(4,'4','Viernes','11:00:00','16:00:00','A',1),(5,'5','Sabado','11:00:00','16:00:00','A',1),(6,'6','Domingo','11:00:00','18:00:00','A',1),(7,'7','Lunes','09:00:00','21:00:00','A',2),(8,'8','Martes','09:00:00','21:00:00','A',2),(9,'9','Miercoles','09:00:00','21:00:00','A',2),(10,'10','Jueves','09:00:00','21:00:00','A',2),(11,'11','Viernes','09:00:00','21:00:00','A',2),(12,'12','Sabado','09:00:00','21:00:00','A',2),(13,'13','Domingo','08:00:00','21:00:00','A',2),(14,'14','Lunes','09:00:00','21:00:00','A',3),(15,'15','Martes','09:00:00','21:00:00','A',3),(16,'16','Miercoles','09:00:00','21:00:00','A',3),(17,'17','Jueves','09:00:00','21:00:00','A',3),(18,'18','Viernes','09:00:00','21:00:00','A',3),(19,'19','Sabado','09:00:00','21:00:00','A',3),(20,'20','Domingo','08:00:00','21:00:00','A',3),(21,'21','Viernes','18:00:00','03:00:00','A',4),(22,'22','Sabado','18:00:00','03:00:00','A',4),(23,'23','Viernes','12:00:00','03:00:00','A',5),(24,'24','Sabado','12:00:00','03:00:00','A',5);
/*!40000 ALTER TABLE `horarioareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariopordiadeempleados`
--

DROP TABLE IF EXISTS `horariopordiadeempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horariopordiadeempleados` (
  `idhorariopordiadeempleado` int(11) NOT NULL AUTO_INCREMENT,
  `codigohorariopordiadeempleado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `diahorariopordiadeempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `horainiciohorariopordiadeempleado` time NOT NULL,
  `horafinhorariopordiadeempleado` time NOT NULL,
  `estatushorariopordiadeempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idempleadohorariopordiadeempleado` int(11) NOT NULL,
  PRIMARY KEY (`idhorariopordiadeempleado`),
  KEY `fk_horariopordiadeempleados_empleados1_idx` (`idempleadohorariopordiadeempleado`),
  CONSTRAINT `fk_horariopordiadeempleados_empleados1` FOREIGN KEY (`idempleadohorariopordiadeempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariopordiadeempleados`
--

LOCK TABLES `horariopordiadeempleados` WRITE;
/*!40000 ALTER TABLE `horariopordiadeempleados` DISABLE KEYS */;
INSERT INTO `horariopordiadeempleados` VALUES (1,'1','Lunes','07:00:00','13:00:00','A',1),(2,'2','Martes','13:00:00','21:00:00','A',1),(3,'3','Miercoles','07:00:00','13:00:00','A',1),(4,'4','Jueves','13:00:00','21:00:00','A',1),(5,'6','Viernes','07:00:00','13:00:00','A',1),(6,'6','Sabado','13:00:00','21:00:00','I',1),(7,'7','Domingo','07:00:00','13:00:00','I',1),(8,'8','Lunes','07:00:00','13:00:00','A',2),(9,'9','Miercoles','07:00:00','13:00:00','A',2),(10,'10','Jueves','13:00:00','21:00:00','A',2),(11,'11','Viernes','07:00:00','13:00:00','A',2),(12,'12','Sabado','13:00:00','21:00:00','I',2),(13,'13','Domingo','07:00:00','13:00:00','I',2),(14,'14','Martes','07:00:00','13:00:00','A',2),(15,'15','Miercoles','07:00:00','13:00:00','A',3),(16,'16','Jueves','13:00:00','21:00:00','A',3),(17,'17','Viernes','07:00:00','13:00:00','A',3),(18,'18','Sabado','13:00:00','21:00:00','I',3),(19,'19','Domingo','07:00:00','13:00:00','I',3),(20,'20','Martes','07:00:00','13:00:00','A',3),(21,'21','Lunes','13:00:00','21:00:00','A',3);
/*!40000 ALTER TABLE `horariopordiadeempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicadores`
--

DROP TABLE IF EXISTS `indicadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicadores` (
  `idindicadores` int(11) NOT NULL AUTO_INCREMENT,
  `codigoindicadores` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreindicadores` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusindicadores` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idindicadores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicadores`
--

LOCK TABLES `indicadores` WRITE;
/*!40000 ALTER TABLE `indicadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `idingresos` int(11) NOT NULL,
  `codigoingreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechaingreso` date NOT NULL,
  `montoingreso` float NOT NULL,
  `estatusingreso` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idpagoingreso` int(11) NOT NULL,
  `descripcioningreso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idingresos`),
  KEY `fk_ingresos_pagos1_idx` (`idpagoingreso`),
  KEY `fk_ingresos_condominios1_idx` (`idcondominio`),
  CONSTRAINT `fk_ingresos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresos_pagos1` FOREIGN KEY (`idpagoingreso`) REFERENCES `pagos` (`idpago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,'1','2014-01-01',4000,'A',3,'Venta de un activo',1),(2,'2','2014-01-01',5000,'A',3,'Venta de activo2',1);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `idinmueble` int(11) NOT NULL AUTO_INCREMENT,
  `codigoinmueble` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `metroscuadradosinmueble` float NOT NULL,
  `alicuotainmueble` float NOT NULL,
  `descripcioninmueble` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `estatusinmueble` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `codigocatastralinmueble` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `idcopropietarioinmueble` int(11) NOT NULL,
  `idlogininmueble` int(11) NOT NULL,
  `idcondominioinmueble` int(11) NOT NULL,
  PRIMARY KEY (`idinmueble`),
  KEY `fk_inmuebles_copropietarios1_idx` (`idcopropietarioinmueble`),
  KEY `fk_inmuebles_logins1_idx` (`idlogininmueble`),
  KEY `fk_inmuebles_condominios1_idx` (`idcondominioinmueble`),
  CONSTRAINT `fk_inmuebles_condominios1` FOREIGN KEY (`idcondominioinmueble`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_copropietarios1` FOREIGN KEY (`idcopropietarioinmueble`) REFERENCES `copropietarios` (`idcopropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_logins1` FOREIGN KEY (`idlogininmueble`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES (1,'1',200,0.1,'1 baño, 2 cuartos','A','0001',1,1,1),(2,'2',200,0.2,'2 baños, 3 cuartos','A','0002',2,2,1),(3,'3',450,0.4,'3 baños, 5 cuartos','A','0003',3,8,0),(4,'4',200,0.3,'2 baños, 3 cuartos','A','0004',4,9,1);
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juntacondominios`
--

DROP TABLE IF EXISTS `juntacondominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juntacondominios` (
  `idjuntacondominio` int(11) NOT NULL AUTO_INCREMENT,
  `codigojuntacondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechainicio` date NOT NULL,
  `fechaculminacion` date NOT NULL,
  `estatusvigenciacargo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusjuntacondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idloginjuntacondominio` int(11) NOT NULL,
  `idcargojuntacondominio` int(11) NOT NULL,
  `idcondominiocondominio` int(11) NOT NULL,
  `idcopropietario` int(11) NOT NULL,
  PRIMARY KEY (`idjuntacondominio`),
  KEY `fk_juntacondominios_logins1_idx` (`idloginjuntacondominio`),
  KEY `fk_juntacondominios_cargo1_idx` (`idcargojuntacondominio`),
  KEY `fk_juntacondominios_condominios1_idx` (`idcondominiocondominio`),
  KEY `fk_juntacondominios_copropietarios1_idx` (`idcopropietario`),
  CONSTRAINT `fk_juntacondominios_cargo1` FOREIGN KEY (`idcargojuntacondominio`) REFERENCES `cargos` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_juntacondominios_condominios1` FOREIGN KEY (`idcondominiocondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_juntacondominios_copropietarios1` FOREIGN KEY (`idcopropietario`) REFERENCES `copropietarios` (`idcopropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_juntacondominios_logins1` FOREIGN KEY (`idloginjuntacondominio`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juntacondominios`
--

LOCK TABLES `juntacondominios` WRITE;
/*!40000 ALTER TABLE `juntacondominios` DISABLE KEYS */;
INSERT INTO `juntacondominios` VALUES (1,'1','2014-01-01','2015-01-01','A','A',4,4,1,1),(2,'2','2014-01-01','2015-01-01','A','A',10,5,1,2);
/*!40000 ALTER TABLE `juntacondominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `usuariologin` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `paswordlogin` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecharegistrologin` date NOT NULL,
  `estatuslogin` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idrollogin` int(11) NOT NULL,
  PRIMARY KEY (`idlogin`),
  KEY `fk_logins_rols1_idx` (`idrollogin`),
  CONSTRAINT `fk_logins_rols1` FOREIGN KEY (`idrollogin`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,'casa1','1234','2014-01-01','A',1),(2,'cas2','123','2014-01-01','A',1),(3,'emp','123','2014-01-01','A',3),(4,'juntee','1234','2014-01-01','A',6),(5,'empleado','1234','2014-01-01','A',2),(6,'Guachi','123','2014-01-01','A',4),(7,'superusuario','1234','2014-01-01','A',5),(8,'cas3','123','2014-01-01','A',1),(9,'cas4','123','2014-01-01','A',1),(10,'junta2','123','2014-01-01','A',6),(11,'xxxz','1234','2014-02-02','A',5);
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `idmovimientos` int(11) NOT NULL AUTO_INCREMENT,
  `codigomovimiento` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `montomovimiento` float NOT NULL,
  `cuentas_numerocuenta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `cuentas_idbancocuenta` int(11) NOT NULL,
  `idcondominiocuentamovimiento` int(11) NOT NULL,
  PRIMARY KEY (`idmovimientos`),
  KEY `fk_movimientos_cuentas1_idx` (`cuentas_numerocuenta`,`cuentas_idbancocuenta`,`idcondominiocuentamovimiento`),
  CONSTRAINT `fk_movimientos_cuentas1` FOREIGN KEY (`cuentas_numerocuenta`, `cuentas_idbancocuenta`, `idcondominiocuentamovimiento`) REFERENCES `cuentas` (`numerocuenta`, `idbancocuenta`, `idcondominiocuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multas` (
  `idmulta` int(11) NOT NULL AUTO_INCREMENT,
  `codigomulta` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionmullta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `montomulta` float NOT NULL,
  `fechamulta` date NOT NULL,
  `idtipomultamulta` int(11) NOT NULL,
  `idinmueblemulta` int(11) NOT NULL,
  `idrecibocobro` int(11) NOT NULL,
  PRIMARY KEY (`idmulta`),
  KEY `fk_multas_tipomultas1_idx` (`idtipomultamulta`),
  KEY `fk_multas_inmuebles1_idx` (`idinmueblemulta`),
  KEY `fk_multas_recibocobros1_idx` (`idrecibocobro`),
  CONSTRAINT `fk_multas_inmuebles1` FOREIGN KEY (`idinmueblemulta`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_multas_recibocobros1` FOREIGN KEY (`idrecibocobro`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_multas_tipomultas1` FOREIGN KEY (`idtipomultamulta`) REFERENCES `tipomultas` (`idtipomulta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multas`
--

LOCK TABLES `multas` WRITE;
/*!40000 ALTER TABLE `multas` DISABLE KEYS */;
INSERT INTO `multas` VALUES (1,'1','Dano a Propiedad Comun',2000,'2014-01-20',2,1,1),(2,'2','Danos de la mascota',2000,'2014-01-09',3,1,1);
/*!40000 ALTER TABLE `multas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `codigomunicipio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombremunicipio` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `estatusmunicipio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idestadomunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `fk_municipios_estados1_idx` (`idestadomunicipio`),
  CONSTRAINT `fk_municipios_estados1` FOREIGN KEY (`idestadomunicipio`) REFERENCES `estados` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'1','Iribarren','A',1),(2,'2','Palavecino','A',1);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominaempleados`
--

DROP TABLE IF EXISTS `nominaempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nominaempleados` (
  `idempleado` int(11) NOT NULL,
  `idnomina` int(11) NOT NULL,
  `fechanominaempleado` date NOT NULL,
  `sueldoneto` float NOT NULL,
  `asignacionesnominaempleado` float NOT NULL,
  `deduccionesnominaempleado` float NOT NULL,
  `sueldototal` float NOT NULL,
  `estatusnominaempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idempleado`,`idnomina`),
  KEY `fk_nominaempleados_empleados1_idx` (`idempleado`),
  KEY `fk_nominaempleados_nominas1_idx` (`idnomina`),
  CONSTRAINT `fk_nominaempleados_empleados1` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nominaempleados_nominas1` FOREIGN KEY (`idnomina`) REFERENCES `nominas` (`idnomina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominaempleados`
--

LOCK TABLES `nominaempleados` WRITE;
/*!40000 ALTER TABLE `nominaempleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `nominaempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominas`
--

DROP TABLE IF EXISTS `nominas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nominas` (
  `idnomina` int(11) NOT NULL,
  `codigonominanomina` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechanomina` date NOT NULL,
  `sueldosbasestotalesnomina` float NOT NULL,
  `asignacionestotalesnomina` float NOT NULL,
  `deduccionestotalesnomina` float NOT NULL,
  `sueldostotalesnomina` float NOT NULL,
  `estatusnomina` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idegresonomina` int(11) NOT NULL,
  PRIMARY KEY (`idnomina`),
  KEY `fk_nominas_egresos1_idx` (`idegresonomina`),
  CONSTRAINT `fk_nominas_egresos1` FOREIGN KEY (`idegresonomina`) REFERENCES `egresos` (`idegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominas`
--

LOCK TABLES `nominas` WRITE;
/*!40000 ALTER TABLE `nominas` DISABLE KEYS */;
/*!40000 ALTER TABLE `nominas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `codigonoticia` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechanoticia` date NOT NULL,
  `descripcionnoticia` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `nombrearchivonoticia` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatoarchivonoticia` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivonoticia` blob,
  `estatusnoticia` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idtiponoticiamaestronoticia` int(11) NOT NULL,
  `idloginnoticia` int(11) DEFAULT NULL,
  `cedulaautor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idnoticia`),
  KEY `fk_noticias_tiponoticiamaestros1_idx` (`idtiponoticiamaestronoticia`),
  KEY `fk_noticias_logins1_idx` (`idloginnoticia`),
  KEY `fk_noticias_rols1_idx` (`idrol`),
  KEY `fk_noticias_condominios1_idx` (`idcondominio`),
  CONSTRAINT `fk_noticias_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticias_logins1` FOREIGN KEY (`idloginnoticia`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticias_rols1` FOREIGN KEY (`idrol`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticias_tiponoticiamaestros1` FOREIGN KEY (`idtiponoticiamaestronoticia`) REFERENCES `tiponoticiamaestros` (`idtiponoticiamaestro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (1,'1','2014-02-02','Asamblea urgente para tratar cambio de administrador','f','f',NULL,'A',2,4,'123',6,1),(2,'2','2014-02-02','Suspendida la asamblea','f','f',NULL,'A',3,4,'123',6,1),(3,'2','2014-01-02','cerrada la entrada principal','','','','A',3,5,'1234544634',3,1);
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `codigopago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionpago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nrodocumento` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `montopago` float NOT NULL,
  `validacionpago` tinyint(1) NOT NULL,
  `fechapago` date NOT NULL,
  `estatuspago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idformapagopago` int(11) NOT NULL,
  `idrazondepagopago` int(11) NOT NULL,
  `idreservacionpago` int(11) DEFAULT NULL,
  `idrecibocobropago` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  `cidepositante` varchar(8) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idbanco` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pagos_formapagos1_idx` (`idformapagopago`),
  KEY `fk_pagos_razondepagos1_idx` (`idrazondepagopago`),
  KEY `fk_pagos_reservacions1_idx` (`idreservacionpago`),
  KEY `fk_pagos_recibocobros1_idx` (`idrecibocobropago`),
  KEY `fk_pagos_condominios1_idx` (`idcondominio`),
  CONSTRAINT `fk_pagos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_formapagos1` FOREIGN KEY (`idformapagopago`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_razondepagos1` FOREIGN KEY (`idrazondepagopago`) REFERENCES `razondepagos` (`idrazondepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_recibocobros1` FOREIGN KEY (`idrecibocobropago`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_reservacions1` FOREIGN KEY (`idreservacionpago`) REFERENCES `reservacions` (`idreservacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'1','Pago del Mes de Febrero','001',1500,0,'2014-03-01','A',1,1,NULL,1,1,'12345',108),(2,'2','Pago del Mes de Febrero Pendiente','002',100,0,'2014-03-04','A',1,1,NULL,1,1,'12345',108),(3,'3','Pago por venta de activo','002',4000,1,'2014-02-01','A',1,1,NULL,NULL,1,'12345',108),(4,'4','$descripcionpago','9876',100,0,'2014-02-15','A',1,1,NULL,1,1,'123',108),(5,'4','xxx','9876',100,0,'2014-02-15','A',1,1,NULL,1,1,'123',108),(6,'2','xxx','1234',100,0,'2014-03-03','A',1,1,NULL,1,1,'123',108),(7,'2','xxx','1234',100,0,'2014-03-03','A',1,1,NULL,1,1,'123',108),(8,'2','xxx','1234',100,0,'2014-03-03','A',1,1,NULL,1,1,'123',108),(9,'2','xxx','1234',1000,0,'2014-03-03','A',1,1,NULL,1,1,'123',108),(10,'2','xxx','1234',1000,0,'2014-03-03','A',1,1,NULL,1,1,'123',108),(11,'2','xxx','1234',1000,0,'2014-03-03','A',1,1,NULL,1,1,'123',108),(12,'2','xxx','1234',1000,0,'2014-03-03','A',1,1,NULL,2,1,'123',108);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `cedulapersona` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `primernombrepersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `segundonombrepersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `primerapellidopersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `segundoapellidopersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuspersona` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedors`
--

DROP TABLE IF EXISTS `proveedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedors` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `rifproveedor` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `razonsocialproveedor` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `correoproveedor` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoproveedor` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusproveesor` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `idciudadproveedor` int(11) NOT NULL,
  `nombreproveedor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccionproveedor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedors_ciudads1_idx` (`idciudadproveedor`),
  CONSTRAINT `fk_proveedors_ciudads1` FOREIGN KEY (`idciudadproveedor`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedors`
--

LOCK TABLES `proveedors` WRITE;
/*!40000 ALTER TABLE `proveedors` DISABLE KEYS */;
INSERT INTO `proveedors` VALUES (1,'J10','CA','a@gmail.com','12345','A',1,'Proveedor1',NULL),(2,'J12','CA','b@gmail.com','12345','A',1,'Proveedor2',NULL),(3,'J13','CA','c@gmail.com','12345','A',1,'Proveedor3',NULL),(4,'J4','SA','p4@gmail.com','12345','A',1,'proveedor4',NULL);
/*!40000 ALTER TABLE `proveedors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedorxcondominios`
--

DROP TABLE IF EXISTS `proveedorxcondominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedorxcondominios` (
  `idproveedorxcondominio` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedorproveedorxcndominio` int(11) NOT NULL,
  `idcondominioproveedorxcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idproveedorxcondominio`),
  KEY `fk_proveedorxcondominios_proveedors1_idx` (`idproveedorproveedorxcndominio`),
  KEY `fk_proveedorxcondominios_condominios1_idx` (`idcondominioproveedorxcondominio`),
  CONSTRAINT `fk_proveedorxcondominios_condominios1` FOREIGN KEY (`idcondominioproveedorxcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedorxcondominios_proveedors1` FOREIGN KEY (`idproveedorproveedorxcndominio`) REFERENCES `proveedors` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedorxcondominios`
--

LOCK TABLES `proveedorxcondominios` WRITE;
/*!40000 ALTER TABLE `proveedorxcondominios` DISABLE KEYS */;
INSERT INTO `proveedorxcondominios` VALUES (2,1,1),(3,2,1),(4,3,1),(6,4,0);
/*!40000 ALTER TABLE `proveedorxcondominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedorxservicios`
--

DROP TABLE IF EXISTS `proveedorxservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedorxservicios` (
  `idproveedorxservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedorxcondominioproveedorxservicio` int(11) NOT NULL,
  `idservicioproveedorxservicio` int(11) NOT NULL,
  `estatusproveedorxservicio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `codigoproveedorxservicio` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproveedorxservicio`),
  KEY `fk_proveedorxservicios_proveedorxcondominios1_idx` (`idproveedorxcondominioproveedorxservicio`),
  KEY `fk_proveedorxservicios_servicios1_idx` (`idservicioproveedorxservicio`),
  CONSTRAINT `fk_proveedorxservicios_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominioproveedorxservicio`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedorxservicios_servicios1` FOREIGN KEY (`idservicioproveedorxservicio`) REFERENCES `servicios` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedorxservicios`
--

LOCK TABLES `proveedorxservicios` WRITE;
/*!40000 ALTER TABLE `proveedorxservicios` DISABLE KEYS */;
INSERT INTO `proveedorxservicios` VALUES (1,2,1,'A','1'),(2,2,2,'A','2'),(3,2,3,'A','3'),(4,3,1,'A','4'),(5,3,5,'A','5'),(6,3,4,'A','6'),(7,4,6,'A','7'),(8,4,1,'A','8'),(9,6,1,'A','9'),(10,6,7,'A','10');
/*!40000 ALTER TABLE `proveedorxservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `razondepagos`
--

DROP TABLE IF EXISTS `razondepagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `razondepagos` (
  `idrazondepago` int(11) NOT NULL AUTO_INCREMENT,
  `codigorazondepago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrerazondepago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrazondepago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrazondepago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `razondepagos`
--

LOCK TABLES `razondepagos` WRITE;
/*!40000 ALTER TABLE `razondepagos` DISABLE KEYS */;
INSERT INTO `razondepagos` VALUES (1,'1','Cancelar mensualidad','A');
/*!40000 ALTER TABLE `razondepagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibocobros`
--

DROP TABLE IF EXISTS `recibocobros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recibocobros` (
  `idrecibocobro` int(11) NOT NULL AUTO_INCREMENT,
  `codigorecibocobro` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecharecibocobro` date NOT NULL,
  `cuotapendienterecibo` float NOT NULL,
  `fechavencimientorecibo` date NOT NULL,
  `abonorecibocobro` float NOT NULL,
  `montorecibocobro` float NOT NULL,
  `estatuscancelacionrecibo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrecibocobro` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idinmueblerecibocobro` int(11) NOT NULL,
  PRIMARY KEY (`idrecibocobro`),
  KEY `fk_recibocobros_inmuebles1_idx` (`idinmueblerecibocobro`),
  CONSTRAINT `fk_recibocobros_inmuebles1` FOREIGN KEY (`idinmueblerecibocobro`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibocobros`
--

LOCK TABLES `recibocobros` WRITE;
/*!40000 ALTER TABLE `recibocobros` DISABLE KEYS */;
INSERT INTO `recibocobros` VALUES (1,'1','2014-02-28',0,'2014-03-29',2600,1600,'pendiente','A',1),(2,'2','2014-03-28',1000,'2014-04-29',1000,2000,'pendiente','A',1),(3,'3','2014-02-28',1600,'2014-03-29',0,1600,'pendiente','A',2);
/*!40000 ALTER TABLE `recibocobros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciboxfondoreserva`
--

DROP TABLE IF EXISTS `reciboxfondoreserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reciboxfondoreserva` (
  `idreciboxfondoreserva` int(11) NOT NULL AUTO_INCREMENT,
  `idrecibocobroreciboxfondoreserva` int(11) NOT NULL,
  `fondoreservas_idfondoreserva` int(11) NOT NULL,
  PRIMARY KEY (`idreciboxfondoreserva`),
  KEY `fk_recibocobros_has_fondoreservas_fondoreservas1_idx` (`fondoreservas_idfondoreserva`),
  KEY `fk_recibocobros_has_fondoreservas_recibocobros1_idx` (`idrecibocobroreciboxfondoreserva`),
  CONSTRAINT `fk_recibocobros_has_fondoreservas_fondoreservas1` FOREIGN KEY (`fondoreservas_idfondoreserva`) REFERENCES `fondoreservas` (`idfondoreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibocobros_has_fondoreservas_recibocobros1` FOREIGN KEY (`idrecibocobroreciboxfondoreserva`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciboxfondoreserva`
--

LOCK TABLES `reciboxfondoreserva` WRITE;
/*!40000 ALTER TABLE `reciboxfondoreserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciboxfondoreserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamosugerencias`
--

DROP TABLE IF EXISTS `reclamosugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamosugerencias` (
  `idreclamosugerencia` int(11) NOT NULL AUTO_INCREMENT,
  `codigoreclamosugerencia` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `razonreclamosugerencia` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechareclamosugerencia` date NOT NULL,
  `descripcionreclamosugerencia` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `estatusreclamosugerencia` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idinmueblereclamosugerencia` int(11) NOT NULL,
  `codigoinmuebledestinatario` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idreclamosugerencia`),
  KEY `fk_reclamosugerencias_inmuebles1_idx` (`idinmueblereclamosugerencia`),
  CONSTRAINT `fk_reclamosugerencias_inmuebles1` FOREIGN KEY (`idinmueblereclamosugerencia`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamosugerencias`
--

LOCK TABLES `reclamosugerencias` WRITE;
/*!40000 ALTER TABLE `reclamosugerencias` DISABLE KEYS */;
INSERT INTO `reclamosugerencias` VALUES (1,'1','Mascota causo daño a mi carro','2014-02-02','El perro de la vecina me daño carroceria de mi automovil','A',1,'2'),(2,'2','Retraso en recoger la basura','2014-02-05','Estan recogiendo la basura muy tarde y hay gusanos ya...','A',2,NULL);
/*!40000 ALTER TABLE `reclamosugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacions`
--

DROP TABLE IF EXISTS `reservacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservacions` (
  `idreservacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigoreservacion` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechareservacion` date NOT NULL,
  `nombrelistainvitadosreservacion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatolistainvitadosreservacion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `listainvitadosreservacion` blob,
  `estatusreservacion` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `montoapagar` float NOT NULL,
  `idareacomunreservacion` int(11) NOT NULL,
  `idinmueblereservacion` int(11) NOT NULL,
  `montoabonado` float DEFAULT NULL,
  PRIMARY KEY (`idreservacion`),
  KEY `fk_reservacions_areacomuns1_idx` (`idareacomunreservacion`),
  KEY `fk_reservacions_inmuebles1_idx` (`idinmueblereservacion`),
  CONSTRAINT `fk_reservacions_areacomuns1` FOREIGN KEY (`idareacomunreservacion`) REFERENCES `areacomuns` (`idareacomun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservacions_inmuebles1` FOREIGN KEY (`idinmueblereservacion`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacions`
--

LOCK TABLES `reservacions` WRITE;
/*!40000 ALTER TABLE `reservacions` DISABLE KEYS */;
INSERT INTO `reservacions` VALUES (1,'1','2014-09-01','f','f',NULL,'A',2000,1,1,233),(2,'2','2014-03-03','f','f',NULL,'A',3444,4,2,100),(3,'3','2014-03-02','f','f',NULL,'A',2000,4,1,1000),(4,'4','2014-03-01',NULL,NULL,NULL,'A',2000,4,1,NULL),(5,'4','2014-03-01',NULL,NULL,NULL,'A',2000,4,1,NULL),(6,'4','2014-04-27',NULL,NULL,NULL,'A',2000,4,1,NULL);
/*!40000 ALTER TABLE `reservacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rols` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `codigorol` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrerol` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrol` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rols`
--

LOCK TABLES `rols` WRITE;
/*!40000 ALTER TABLE `rols` DISABLE KEYS */;
INSERT INTO `rols` VALUES (1,'1','Copropietario','A'),(2,'2','Administrador','A'),(3,'3','Empleado','A'),(4,'4','Vigilante','A'),(5,'5','superusuario','A'),(6,'6','Junta de Condominio','A');
/*!40000 ALTER TABLE `rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `codigoservicio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionservicio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusservicio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'1','Agua','A'),(2,'2','Luz','A'),(3,'3','Gas','A'),(4,'4','Mantenimiento','A'),(5,'5','Jardineria','A'),(6,'6','Venta de Vidrios','A'),(7,'7','Caminion de Basura','A');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superusuarios`
--

DROP TABLE IF EXISTS `superusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superusuarios` (
  `idsuperusuario` int(11) NOT NULL AUTO_INCREMENT,
  `codigosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombresuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `apellidosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `telefonosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombrefotosuperusuario` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotosuperusuario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotosuperusuario` blob,
  `estatussuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idloginsuperusuario` int(11) NOT NULL,
  PRIMARY KEY (`idsuperusuario`),
  KEY `fk_superusuarios_logins1_idx` (`idloginsuperusuario`),
  CONSTRAINT `fk_superusuarios_logins1` FOREIGN KEY (`idloginsuperusuario`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superusuarios`
--

LOCK TABLES `superusuarios` WRITE;
/*!40000 ALTER TABLE `superusuarios` DISABLE KEYS */;
INSERT INTO `superusuarios` VALUES (1,'1','Manuel','Perez','1','a','f','f',NULL,'A',7),(2,'2','Jorge','Perez','1','a',NULL,NULL,NULL,'A',11);
/*!40000 ALTER TABLE `superusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocondominios`
--

DROP TABLE IF EXISTS `tipocondominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocondominios` (
  `idtipocondominio` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipocondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombretipocondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatustipocondominio` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipocondominio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocondominios`
--

LOCK TABLES `tipocondominios` WRITE;
/*!40000 ALTER TABLE `tipocondominios` DISABLE KEYS */;
INSERT INTO `tipocondominios` VALUES (1,'1','Casas','A'),(2,'2','Apartamento','A'),(3,'3','Local Comercial','A');
/*!40000 ALTER TABLE `tipocondominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoegresos`
--

DROP TABLE IF EXISTS `tipoegresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoegresos` (
  `idtipoegreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipoegreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombretipoegreso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatustipoegreso` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipoegreso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoegresos`
--

LOCK TABLES `tipoegresos` WRITE;
/*!40000 ALTER TABLE `tipoegresos` DISABLE KEYS */;
INSERT INTO `tipoegresos` VALUES (1,'1','Ordinario','A'),(2,'2','Extraordinario','A');
/*!40000 ALTER TABLE `tipoegresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomultas`
--

DROP TABLE IF EXISTS `tipomultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomultas` (
  `idtipomulta` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipomulta` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombremulta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatus` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipomulta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomultas`
--

LOCK TABLES `tipomultas` WRITE;
/*!40000 ALTER TABLE `tipomultas` DISABLE KEYS */;
INSERT INTO `tipomultas` VALUES (1,'1','Falta de Convivencia','A'),(2,'2','Destruccion de propiedad comun','A'),(3,'3','Daños causados por mascota','A');
/*!40000 ALTER TABLE `tipomultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiponoticiamaestros`
--

DROP TABLE IF EXISTS `tiponoticiamaestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiponoticiamaestros` (
  `idtiponoticiamaestro` int(11) NOT NULL AUTO_INCREMENT,
  `nombretiponoticiamaestro` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatustiponoticiamaestro` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `codigotiponoticia` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtiponoticiamaestro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiponoticiamaestros`
--

LOCK TABLES `tiponoticiamaestros` WRITE;
/*!40000 ALTER TABLE `tiponoticiamaestros` DISABLE KEYS */;
INSERT INTO `tiponoticiamaestros` VALUES (1,'Reunion','A','1'),(2,'Asamblea','A','2'),(3,'Informacion','A','3');
/*!40000 ALTER TABLE `tiponoticiamaestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `idunidades` int(11) NOT NULL AUTO_INCREMENT,
  `codigounidades` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreunidades` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusunidades` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idunidades`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioporindicadores`
--

DROP TABLE IF EXISTS `usuarioporindicadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioporindicadores` (
  `idusuarioporindicadores` int(11) NOT NULL AUTO_INCREMENT,
  `codigousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `valordemetausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechametausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valoramarillousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valorrojousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valorverdeusuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechaamarillousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fecharojousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechaverdeusuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correoresponsablemetausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idindicadoresusuarioporindicadores` int(11) NOT NULL,
  `idrolusuarioporindicadores` int(11) NOT NULL,
  `idcondominiousuarioporindicadores` int(11) NOT NULL,
  `idfrecuencianotificacionesusuarioporindicadores` int(11) NOT NULL,
  `idunidadesusuarioporindicadores` int(11) NOT NULL,
  PRIMARY KEY (`idusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_indicadores1_idx` (`idindicadoresusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_rols1_idx` (`idrolusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_condominios1_idx` (`idcondominiousuarioporindicadores`),
  KEY `fk_usuarioporindicadores_frecuencianotificaciones1_idx` (`idfrecuencianotificacionesusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_unidades1_idx` (`idunidadesusuarioporindicadores`),
  CONSTRAINT `fk_usuarioporindicadores_condominios1` FOREIGN KEY (`idcondominiousuarioporindicadores`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_frecuencianotificaciones1` FOREIGN KEY (`idfrecuencianotificacionesusuarioporindicadores`) REFERENCES `frecuencianotificaciones` (`idfrecuencianotificaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_indicadores1` FOREIGN KEY (`idindicadoresusuarioporindicadores`) REFERENCES `indicadores` (`idindicadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_rols1` FOREIGN KEY (`idrolusuarioporindicadores`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_unidades1` FOREIGN KEY (`idunidadesusuarioporindicadores`) REFERENCES `unidades` (`idunidades`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioporindicadores`
--

LOCK TABLES `usuarioporindicadores` WRITE;
/*!40000 ALTER TABLE `usuarioporindicadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioporindicadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitantes`
--

DROP TABLE IF EXISTS `visitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `cedulavisitante` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `nombrevisitante` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidovisitante` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusvisitante` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idvisitante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitantes`
--

LOCK TABLES `visitantes` WRITE;
/*!40000 ALTER TABLE `visitantes` DISABLE KEYS */;
INSERT INTO `visitantes` VALUES (1,'987','visitante1','visitante1','A'),(2,'67809','visitante2','visitante2','A');
/*!40000 ALTER TABLE `visitantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-18  1:06:40

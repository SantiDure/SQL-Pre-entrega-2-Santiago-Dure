CREATE DATABASE  IF NOT EXISTS `supermercado_coderhouse` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `supermercado_coderhouse`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado_coderhouse
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `area_de_trabajo`
--

DROP TABLE IF EXISTS `area_de_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_de_trabajo` (
  `idarea_de_trabajo` int(11) NOT NULL AUTO_INCREMENT,
  `area_de_trabajo` varchar(30) NOT NULL,
  PRIMARY KEY (`idarea_de_trabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_de_trabajo`
--

LOCK TABLES `area_de_trabajo` WRITE;
/*!40000 ALTER TABLE `area_de_trabajo` DISABLE KEYS */;
INSERT INTO `area_de_trabajo` VALUES (1,'verduleria'),(2,'panaderia'),(3,'comida vegana'),(4,'comida vegetariana'),(5,'comida china'),(6,'carniceria'),(7,'dulces');
/*!40000 ALTER TABLE `area_de_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'gerente'),(2,'cajero'),(3,'repositor'),(4,'pasante');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `idcategoria_producto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,'carne'),(2,'panederia'),(3,'panaderia (sin gluten)'),(4,'apto vegano'),(5,'embutidos'),(6,'enlatados'),(7,'frutas'),(8,'verduras'),(9,'limpieza'),(10,'alcohol bebida'),(11,'chocolates'),(12,'joyeria');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nacionalidad` varchar(45) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `pasaporte` varchar(45) DEFAULT NULL,
  `fk_idSucursal` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcliente`),
  KEY `id_sucursal_idx` (`fk_idSucursal`),
  CONSTRAINT `fk_idSucursal` FOREIGN KEY (`fk_idSucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Reid','Pride','3','6734876640',NULL,1),(2,'Maryrose','Lepper','8','5480488279',NULL,1),(3,'Chrisy','Tsarovic','3','8528407047',NULL,1),(4,'Yardley','Westoll','6','4734949379',NULL,1),(5,'Calla','Bough','4','2272908950',NULL,1),(6,'Genni','Blanking','7','0099352036',NULL,1),(7,'Willy','Sillwood','1','5909030108',NULL,1),(8,'Taddeo','Pleace','7','9401855110',NULL,1),(9,'Ellie','Brazener','7','0408809108',NULL,1),(10,'Davey','Peris','6','2028083573',NULL,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fk_nacionalidad` int(11) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `pasaporte` varchar(45) DEFAULT NULL,
  `fk_idCargo` int(11) NOT NULL,
  `fk_idAreaDeTrabajo` int(11) NOT NULL,
  `fk_idSucursal_empleado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idempleado`),
  KEY `id_cargo_idx` (`fk_idCargo`),
  KEY `fk_idAreaDeTrabajo_idx` (`fk_idAreaDeTrabajo`),
  KEY `fk_idSucursal_empleado_idx` (`fk_idSucursal_empleado`),
  KEY `fk_nacionalidad_idx` (`fk_nacionalidad`),
  CONSTRAINT `fk_idAreaDeTrabajo` FOREIGN KEY (`fk_idAreaDeTrabajo`) REFERENCES `area_de_trabajo` (`idarea_de_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCargo` FOREIGN KEY (`fk_idCargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idSucursal_empleado` FOREIGN KEY (`fk_idSucursal_empleado`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nacionalidad` FOREIGN KEY (`fk_nacionalidad`) REFERENCES `nacionalidad` (`idnacionalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (2,'Juan','Alfonso',5,'43235031',NULL,2,3,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supermercado_coderhouse`.`empleado_BEFORE_INSERT` BEFORE INSERT ON `empleado` FOR EACH ROW
BEGIN
 UPDATE sucursal
    SET empleados = (SELECT COUNT(*) FROM empleado WHERE idsucursal = 1) + 1
    WHERE idsucursal = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supermercado_coderhouse`.`empleado_BEFORE_DELETE` BEFORE DELETE ON `empleado` FOR EACH ROW
BEGIN
   UPDATE sucursal
    SET empleados = (SELECT COUNT(*) FROM empleado WHERE idsucursal = 1) - 1
    WHERE idsucursal = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `linea_de_producto`
--

DROP TABLE IF EXISTS `linea_de_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linea_de_producto` (
  `idlinea_de_producto` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `fk_idVenta` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  PRIMARY KEY (`idlinea_de_producto`),
  KEY `fk_idProducto_idx` (`fk_idProducto`),
  KEY `fk_idVenta_idx` (`fk_idVenta`),
  CONSTRAINT `fk_idProducto` FOREIGN KEY (`fk_idProducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idVenta` FOREIGN KEY (`fk_idVenta`) REFERENCES `venta` (`idventas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_de_producto`
--

LOCK TABLES `linea_de_producto` WRITE;
/*!40000 ALTER TABLE `linea_de_producto` DISABLE KEYS */;
INSERT INTO `linea_de_producto` VALUES (3,1,1,1,0);
/*!40000 ALTER TABLE `linea_de_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supermercado_coderhouse`.`linea_de_producto_AFTER_INSERT` AFTER INSERT ON `linea_de_producto` FOR EACH ROW

BEGIN
  UPDATE producto
    SET stock = stock - NEW.cantidad
    WHERE idproducto = NEW.fk_idProducto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad` (
  `idnacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` varchar(70) NOT NULL,
  PRIMARY KEY (`idnacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Chile'),(2,'Venezuela'),(3,'Colombia'),(4,'Uruguay'),(5,'Argentina'),(6,'Paraguay'),(7,'Ecuador');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `precio` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL DEFAULT 'no especificada',
  `fk_idCategoriaProducto` int(11) NOT NULL,
  `fk_idProveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `ultima_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_idCategoriaProducto_idx` (`fk_idCategoriaProducto`),
  KEY `fk_idProveedor_idx` (`fk_idProveedor`),
  CONSTRAINT `fk_idCategoriaProducto` FOREIGN KEY (`fk_idCategoriaProducto`) REFERENCES `categoria_producto` (`idcategoria_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idProveedor` FOREIGN KEY (`fk_idProveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'1.00','Oxygen',1,1,'Vinegar - Rice',0,'2024-06-15 18:33:48'),(2,'2','Top Care Day Time',1,2,'Wine - Two Oceans Sauvignon',2,NULL),(3,'53','Levetiracetam',1,3,'Dried Apple',3,NULL),(4,'44','Mercaptopurine',4,1,'Beef - Top Sirloin - Aaa',4,NULL),(5,'80','Gelato Homecare',2,4,'Coffee - Decaffeinato Coffee',5,NULL),(6,'40','Simvastatin',3,2,'Steampan - Half Size Shallow',6,NULL),(7,'41','Good Neighbor Pharmacy ibuprofen',3,3,'Sugar - Palm',7,NULL),(8,'12','Bayberry',1,1,'Vinegar - Sherry',8,NULL),(9,'52','Acetaminophen',2,2,'Transfer Sheets',9,NULL),(10,'22','Lisinopril',4,2,'Cup - 3.5oz, Foam',10,NULL),(11,'1000.00','no especificada',12,2,'collar de perlas',10,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER registrar_actualizacion_precio
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        SET NEW.ultima_actualizacion = NOW();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `productos_con_poco_stock`
--

DROP TABLE IF EXISTS `productos_con_poco_stock`;
/*!50001 DROP VIEW IF EXISTS `productos_con_poco_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productos_con_poco_stock` AS SELECT 
 1 AS `idproducto`,
 1 AS `nombre`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idArea` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fk_idSucursal_proveedor` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproveedor`),
  KEY `id_sucursal_fk_idx` (`fk_idSucursal_proveedor`),
  KEY `fk_idArea_idx` (`fk_idArea`),
  CONSTRAINT `fk_idArea` FOREIGN KEY (`fk_idArea`) REFERENCES `area_de_trabajo` (`idarea_de_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idSucursal_proveedor` FOREIGN KEY (`fk_idSucursal_proveedor`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,1,'Lorrie','792-661-3746','livy0@pen.io',1),(2,2,'Merrile','160-676-8948','mcaddy1@cisco.com',1),(3,3,'Dyanna','789-692-8240','dbaudasso2@sciencedaily.com',1),(4,4,'Hayyim','529-643-5088','hkarsh3@discovery.com',1),(5,1,'Nada','210-946-8652','ncabera4@imageshack.us',1),(6,2,'Brooke','442-809-7108','bgerleit5@ifeng.com',1),(7,1,'Rollie','744-393-5573','rselborne6@is.gd',1),(8,4,'Terri','761-209-1890','thilling7@cpanel.net',1),(9,5,'Dayna','726-367-8450','dwoodburne8@shinystat.com',1),(10,1,'Granger','222-794-2422','gbraidwood9@yahoo.co.jp',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sin_stock`
--

DROP TABLE IF EXISTS `sin_stock`;
/*!50001 DROP VIEW IF EXISTS `sin_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sin_stock` AS SELECT 
 1 AS `idproducto`,
 1 AS `producto_sin_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `empleados` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Juan Bautista Alberdi 1475','Buenos Aires',1);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_venta`
--

DROP TABLE IF EXISTS `tipo_de_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_venta` (
  `idtipo_de_venta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_venta` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipo_de_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_venta`
--

LOCK TABLES `tipo_de_venta` WRITE;
/*!40000 ALTER TABLE `tipo_de_venta` DISABLE KEYS */;
INSERT INTO `tipo_de_venta` VALUES (1,'mayorista'),(2,'minorista');
/*!40000 ALTER TABLE `tipo_de_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_gastado_por_cliente`
--

DROP TABLE IF EXISTS `total_gastado_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `total_gastado_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_gastado_por_cliente` AS SELECT 
 1 AS `idcliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `total_comprado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventas` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idSucursal_venta` int(11) NOT NULL DEFAULT '1',
  `fk_idCliente` int(11) NOT NULL,
  `precio_total` float NOT NULL,
  `fecha_de_venta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_idTipoDeVenta` int(11) NOT NULL,
  PRIMARY KEY (`idventas`),
  KEY `fk_ifCliente_idx` (`fk_idCliente`),
  KEY `fk_idSucursal_idx` (`fk_idSucursal_venta`),
  KEY `fk_idTipoDeVenta_idx` (`fk_idTipoDeVenta`),
  CONSTRAINT `fk_idSucursal_venta` FOREIGN KEY (`fk_idSucursal_venta`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoDeVenta` FOREIGN KEY (`fk_idTipoDeVenta`) REFERENCES `tipo_de_venta` (`idtipo_de_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ifCliente` FOREIGN KEY (`fk_idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,1,109,'2024-06-15 21:28:58',2),(2,1,4,1000,'2024-06-15 21:28:58',1),(3,1,1,1,'2024-06-15 21:28:58',2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'supermercado_coderhouse'
--

--
-- Dumping routines for database 'supermercado_coderhouse'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_descuento`(precio DECIMAL(10, 2), descuento DECIMAL(5, 2)) RETURNS decimal(10,2)
BEGIN
    RETURN precio - (precio * descuento / 100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `nombre_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nombre_cliente`(p_idcliente INT) RETURNS varchar(255) CHARSET latin1
BEGIN
    DECLARE nombrec VARCHAR(50);
    SELECT CONCAT(nombre,  apellido) INTO nombrec
    FROM cliente
    WHERE idcliente = p_idcliente;
    RETURN nombrec;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `nombre_completo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nombre_completo_cliente`(p_idcliente INT) RETURNS varchar(255) CHARSET latin1
BEGIN
    DECLARE nombre_completo VARCHAR(50);
    SELECT CONCAT(nombre,  " " ,apellido) INTO nombre_completo
    FROM cliente
    WHERE idcliente = p_idcliente;
    RETURN nombre_completo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_gastado_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_gastado_cliente`(id_cliente INT) RETURNS decimal(10,2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(precio_total) INTO total
    FROM venta
    WHERE fk_idCliente = id_cliente;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_ventas_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_ventas_cliente`(id_cliente INT) RETURNS decimal(10,2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(precio_total) INTO total
    FROM venta
    WHERE fk_idCliente = id_cliente;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_precio_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_precio_producto`(
    IN p_id_producto INT,
    IN p_nuevo_precio DECIMAL(10, 2)
)
BEGIN
    UPDATE producto
    SET precio = p_nuevo_precio
    WHERE idproducto = p_id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_categoria_de_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_categoria_de_producto`(
    IN p_categoria VARCHAR(45)
)
BEGIN
    INSERT INTO categoria_producto (categoria)
    VALUES (p_categoria);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_producto`(
    IN p_nombre VARCHAR(45),
    IN p_marca VARCHAR(45),
    IN p_precio DECIMAL(10, 2),
    IN p_stock INT,
    IN p_id_categoria INT,
    IN p_id_proveedor INT
)
BEGIN
    INSERT INTO producto (nombre, marca, precio, stock, fk_idCategoriaProducto, fk_idProveedor)
    VALUES (p_nombre, p_marca,p_precio, p_stock, p_id_categoria, p_id_proveedor);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `productos_con_poco_stock`
--

/*!50001 DROP VIEW IF EXISTS `productos_con_poco_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_con_poco_stock` AS select `producto`.`idproducto` AS `idproducto`,`producto`.`nombre` AS `nombre`,`producto`.`stock` AS `stock` from `producto` where (`producto`.`stock` between 1 and 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sin_stock`
--

/*!50001 DROP VIEW IF EXISTS `sin_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sin_stock` AS select `producto`.`idproducto` AS `idproducto`,`producto`.`nombre` AS `producto_sin_stock` from `producto` where (`producto`.`stock` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_gastado_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `total_gastado_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_gastado_por_cliente` AS select `cl`.`idcliente` AS `idcliente`,`cl`.`nombre` AS `nombre`,`cl`.`apellido` AS `apellido`,sum(`v`.`precio_total`) AS `total_comprado` from (`cliente` `cl` join `venta` `v` on((`cl`.`idcliente` = `v`.`fk_idCliente`))) group by `cl`.`idcliente`,`cl`.`nombre`,`cl`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 19:04:50

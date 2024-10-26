CREATE DATABASE  IF NOT EXISTS `detodito_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `detodito_ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: detodito_ecommerce
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `AEROLINEA`
--

DROP TABLE IF EXISTS `AEROLINEA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AEROLINEA` (
  `id_aerolinea` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `pagina_web` varchar(80) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AEROLINEA`
--

LOCK TABLES `AEROLINEA` WRITE;
/*!40000 ALTER TABLE `AEROLINEA` DISABLE KEYS */;
INSERT INTO `AEROLINEA` VALUES (1,'avianca','aerolinea brasilera','www.avianca.com','2024-05-22'),(2,'american','aerolinea usa','www.american.com','2024-05-23'),(3,'latam','aerolinea chilena','www.latam.com','2024-05-24'),(4,'delta','aerolinea usa','www.delta.com','2024-05-25'),(5,'southwest','aerolinea usa','www.southwest.com','2024-05-26'),(6,'viva colombia','aerolinea colombiana','www.viva.com','2024-05-27'),(7,'emirates','aerolinea emiratos','www.emirates.com','2024-05-28'),(8,'air france','aerolinea francesa','www.france.com','2024-05-29'),(9,'swiss air','aerolinea suiza','www.swiss.com','2024-05-30'),(10,'united','aerolinea usa','www.united.com','2024-05-31'),(11,'qatar air','aerolinea qatar','www.qatar.com','2024-06-10'),(12,'korean air','aerolinea korea','www.korean.com','2024-06-11'),(13,'lufthansa','aerolinea alemana','www.lufthansa.com','2024-06-12'),(14,'japan air','aerolinea japonesa','www.japan.com','2024-06-13'),(15,'aeromexico','aerolinea mexicana','www.aeromexico.com','2024-06-14');
/*!40000 ALTER TABLE `AEROLINEA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,'calzado','zapatos  sandalias','2024-06-22'),(2,'camisas','camisetas  camisas','2024-06-23'),(3,'pantalones','jeans  pantalones','2024-06-24'),(4,'jabones','jabon manos o cara','2024-06-25'),(5,'cremas','crema cuerpo o cara','2024-06-26'),(6,'cuadernos','cuadernos escolares','2024-06-27'),(7,'colores','colores escolares','2024-06-28'),(8,'boligrafos','boligrafos  plumas','2024-06-29'),(9,'chocolates','chocolates en barra','2024-06-30'),(10,'cereal','cereal en caja','2024-07-01'),(11,'galletas','galletas varias','2024-07-02'),(12,'computadores','pc y escritorio','2024-07-03'),(13,'telefonos','celulares y relojes','2024-07-04'),(14,'juguete','juguete chica','2024-07-05'),(15,'balones','balones de deportes','2024-07-06');
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTES` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_pais` int NOT NULL,
  `id_pedido_producto` int DEFAULT NULL,
  `id_pedido_tickete` int DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cliente_pais` (`id_pais`),
  KEY `fk_cliente_pedido_tickete` (`id_pedido_tickete`),
  KEY `fk_cliente_pedido_producto` (`id_pedido_producto`),
  CONSTRAINT `fk_cliente_pais` FOREIGN KEY (`id_pais`) REFERENCES `PAIS` (`id_pais`),
  CONSTRAINT `fk_cliente_pedido_producto` FOREIGN KEY (`id_pedido_producto`) REFERENCES `PEDIDO_PRODUCTO` (`id_pedido_producto`),
  CONSTRAINT `fk_cliente_pedido_tickete` FOREIGN KEY (`id_pedido_tickete`) REFERENCES `PEDIDO_TICKETE` (`id_pedido_tickete`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTES`
--

LOCK TABLES `CLIENTES` WRITE;
/*!40000 ALTER TABLE `CLIENTES` DISABLE KEYS */;
INSERT INTO `CLIENTES` VALUES (1,5,15,NULL,'carlos','sorni','car@g.com','320100100','2024-02-02'),(2,4,14,NULL,'ana','garza','ana@g.com','320999005','2024-02-03'),(3,3,13,NULL,'jhon','urriaga','jho@g.com','320999006','2024-02-04'),(4,2,12,NULL,'jake','bonachera','jak@g.com','320999007','2024-02-05'),(5,1,11,NULL,'sun','voinescu','sun@g.com','320999008','2024-02-06'),(6,10,10,NULL,'claire','fulga','clai@g.com','320999009','2024-02-07'),(7,9,9,15,'thiago','wang','thia@g.com','320999010','2024-02-08'),(8,8,8,13,'brad','anderson','brad@g.com','320999011','2024-03-09'),(9,7,7,13,'james','davis','jame@g.com','320999012','2024-03-10'),(10,6,6,1,'abraham','jones','abrah@g.com','320999013','2024-03-11'),(11,15,NULL,10,'celine','miller','celin@g.com','311460079','2024-03-12'),(12,14,NULL,9,'andrea','moore','andre@g.com','311460080','2024-03-13'),(13,13,NULL,11,'marie','dupont','mari@g.com','311460081','2024-03-14'),(14,12,NULL,3,'paul','petit','pau@g.com','311460082','2024-03-15'),(15,11,NULL,5,'cris','leroy','cris@g.com','311460083','2024-03-16');
/*!40000 ALTER TABLE `CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FABRICANTE`
--

DROP TABLE IF EXISTS `FABRICANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FABRICANTE` (
  `id_fabricante` int NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_fabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FABRICANTE`
--

LOCK TABLES `FABRICANTE` WRITE;
/*!40000 ALTER TABLE `FABRICANTE` DISABLE KEYS */;
INSERT INTO `FABRICANTE` VALUES (1,'Nestle','Empresa de alimentos','nes@gm.com','3113334455','2024-05-22'),(2,'Apple','Empresa de electronica','app@gm.com','3113335566','2024-05-22'),(3,'Scrib','Empresa de papeleria','mic@gm.com','3201234901','2023-05-22'),(4,'Nike','Empresa de confeccion','nik@gm.com','3201234902','2023-05-23'),(5,'Adidas','Empresa de confeccion','adi@gm.com','3201234903','2023-05-24'),(6,'Diesel','Empresa de confeccion','die@gm.com','3201234904','2023-09-25'),(7,'Acer','Empresa de electronica','ace@gm.com','3201234905','2023-09-26'),(8,'Bavaria','Empresa de alimentos','bav@gm.com','3201234906','2023-09-27'),(9,'Colombina','Empresa de alimentos','col@gm.com','3201234907','2023-09-28'),(10,'Carvajal','Empresa de papeleria','car@gm.com','3201234908','2023-09-29'),(11,'ToyUrUs','Empresa de jugueteria','toy@gm.com','3201234909','2023-09-30'),(12,'Dove','Empresa de aseo personal','nut@gm.com','3201234910','2023-10-01'),(13,'Matel','Empresa de jugueteria','mat@gm.com','3201234911','2023-10-02'),(14,'Jumbo','Empresa de papeleria','jum@gm.com','3163180407','2023-10-03'),(15,'Procter','Empresa de aseo personal','pro@gm.com','3113349888','2023-10-04');
/*!40000 ALTER TABLE `FABRICANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIS`
--

DROP TABLE IF EXISTS `PAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAIS` (
  `id_pais` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `continente` varchar(50) NOT NULL,
  `idioma` varchar(50) NOT NULL,
  `poblacion` int NOT NULL,
  `clima` enum('TROPICAL','FRIO','CALIENTE','ESTACIONES') NOT NULL,
  `territorio_km2` int NOT NULL,
  `numero_clientes` int NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIS`
--

LOCK TABLES `PAIS` WRITE;
/*!40000 ALTER TABLE `PAIS` DISABLE KEYS */;
INSERT INTO `PAIS` VALUES (1,'colombia','suramerica','castellano',50000000,'TROPICAL',1142000,30000,'2023-04-23'),(2,'mexico','norte america','castellano',127000000,'TROPICAL',1973000,40000,'2023-04-24'),(3,'japon','asia','japones',125000000,'ESTACIONES',377000,50000,'2023-04-25'),(4,'alemania','europa','aleman',83000000,'ESTACIONES',357000,60000,'2023-04-26'),(5,'korea','asia','koreano',51000000,'ESTACIONES',99000,70000,'2023-04-27'),(6,'qatar','asia','arabe',3000000,'CALIENTE',12000,10000,'2023-04-28'),(7,'canada','norte america','ingles',39000000,'ESTACIONES',9985000,90000,'2023-04-29'),(8,'suiza','europa','aleman',9000000,'ESTACIONES',41000,10000,'2023-04-30'),(9,'francia','europa','frances',68000000,'ESTACIONES',551000,20000,'2023-05-20'),(10,'emiratos arabes','asia','arabe',10000000,'CALIENTE',83000,30000,'2023-05-21'),(11,'usa','norte america','ingles',333000000,'ESTACIONES',9826000,100000,'2023-05-22'),(12,'brasil','suramerica','portugues',215000000,'TROPICAL',8510000,50000,'2023-05-23'),(13,'argentina','suramerica','castellano',46000000,'FRIO',2780000,40000,'2023-05-24'),(14,'israel','asia','hebreo',10000000,'CALIENTE',22000,10000,'2023-05-25'),(15,'peru','suramerica','castellano',34000000,'TROPICAL',1285000,35000,'2023-05-26'),(16,'paraguay','suramerica','castellano',7000000,'TROPICAL',400000,9000,'2025-06-19');
/*!40000 ALTER TABLE `PAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDO_PRODUCTO`
--

DROP TABLE IF EXISTS `PEDIDO_PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PEDIDO_PRODUCTO` (
  `id_pedido_producto` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `precio_ped_producto` int DEFAULT NULL,
  `tipo_compra` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`id_pedido_producto`),
  KEY `fk_pedido_producto_producto` (`id_producto`),
  CONSTRAINT `fk_pedido_producto_producto` FOREIGN KEY (`id_producto`) REFERENCES `PRODUCTO` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO_PRODUCTO`
--

LOCK TABLES `PEDIDO_PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PEDIDO_PRODUCTO` DISABLE KEYS */;
INSERT INTO `PEDIDO_PRODUCTO` VALUES (1,15,5,'online cta usuario','pse','2024-08-24'),(2,14,12,'online cta usuario','pse','2024-08-24'),(3,13,25,'online cta usuario','pse','2024-08-24'),(4,12,25,'online cta usuario','pse','2024-08-25'),(5,11,2,'online cta usuario','pse','2024-08-26'),(6,10,100,'online cta usuario','pse','2024-08-27'),(7,9,20,'online cta usuario','credito','2024-08-28'),(8,8,60,'online cta visitante','credito','2024-08-29'),(9,7,500,'online cta visitante','credito','2024-08-30'),(10,6,5,'online cta visitante','credito','2024-08-31'),(11,5,900,'online cta visitante','credito','2024-09-01'),(12,4,15,'online cta visitante','debito','2024-09-02'),(13,3,1,'online cta visitante','debito','2024-09-02'),(14,2,3,'online cta usuario','debito','2024-09-02'),(15,1,2,'online cta usuario','debito','2024-09-02');
/*!40000 ALTER TABLE `PEDIDO_PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDO_TICKETE`
--

DROP TABLE IF EXISTS `PEDIDO_TICKETE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PEDIDO_TICKETE` (
  `id_pedido_tickete` int NOT NULL,
  `id_aerolinea` int DEFAULT NULL,
  `precio_ped_tickete` int DEFAULT NULL,
  `origen` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_llegada` date NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`id_pedido_tickete`),
  KEY `fk_pedido_tickete_aerolinea` (`id_aerolinea`),
  CONSTRAINT `fk_pedido_tickete_aerolinea` FOREIGN KEY (`id_aerolinea`) REFERENCES `AEROLINEA` (`id_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO_TICKETE`
--

LOCK TABLES `PEDIDO_TICKETE` WRITE;
/*!40000 ALTER TABLE `PEDIDO_TICKETE` DISABLE KEYS */;
INSERT INTO `PEDIDO_TICKETE` VALUES (1,15,300,'mexico df','san salvador','2024-06-15','2024-06-22','2024-06-12'),(2,14,400,'tokio','hong kong','2024-06-16','2024-06-23','2024-06-13'),(3,13,600,'berlin','atenas','2024-06-17','2024-06-24','2024-06-14'),(4,12,400,'seul','tokio','2024-06-18','2024-06-25','2024-06-15'),(5,11,700,'doha','jerusalen','2024-06-19','2024-06-26','2024-06-16'),(6,10,700,'miami','san jose','2024-06-20','2024-06-27','2024-06-17'),(7,9,750,'berna','tailandia','2024-06-21','2024-06-28','2024-06-18'),(8,8,500,'paris','roma','2024-06-22','2024-06-29','2024-06-19'),(9,7,500,'abu dabi','el cairo','2024-06-15','2024-06-25','2024-06-11'),(10,6,500,'cali','lima','2024-06-16','2024-06-26','2024-06-12'),(11,5,500,'new york','filadelfia','2024-06-17','2024-06-27','2024-06-13'),(12,4,500,'los angeles','las vegas','2024-06-18','2024-06-28','2024-06-14'),(13,3,900,'santiago','buenos aires','2024-06-19','2024-06-29','2024-06-15'),(14,2,400,'atlanta','tampa','2024-06-20','2024-06-30','2024-06-16'),(15,1,1000,'cartagena','miami','2024-06-21','2024-07-01','2024-06-17');
/*!40000 ALTER TABLE `PEDIDO_TICKETE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTO` (
  `id_producto` int NOT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_fabricante` int DEFAULT NULL,
  `precio_producto` int DEFAULT NULL,
  `descripcion` varchar(80) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria` (`id_categoria`),
  KEY `fk_producto_fabricante` (`id_fabricante`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CATEGORIA` (`id_categoria`),
  CONSTRAINT `fk_producto_fabricante` FOREIGN KEY (`id_fabricante`) REFERENCES `FABRICANTE` (`id_fabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES (1,9,1,2,'chocolate blanco 50g','2024-07-10'),(2,10,8,3,'granola 100g','2024-07-11'),(3,11,9,1,'galleta vainilla 30gr','2024-07-12'),(4,5,12,15,'crema facial 20g','2024-07-13'),(5,12,2,900,'macBook Air 13p','2024-07-14'),(6,8,3,5,'kit 5 boligrafos','2024-07-15'),(7,13,7,500,'celular android 5p','2024-07-16'),(8,1,4,60,'airJordan zapatillas','2024-07-17'),(9,2,5,20,'camiseta gym','2024-07-18'),(10,3,6,100,'jean noche','2024-07-19'),(11,6,10,2,'cuderno colegio 200pag','2024-07-20'),(12,14,11,25,'juguete chica barbie','2024-07-21'),(13,15,13,25,'balon futbol copa mundo','2024-07-22'),(14,7,14,12,'colores principe azul','2024-07-23'),(15,4,15,5,'jabon cuerpo 40g','2024-07-24');
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-18 12:14:11

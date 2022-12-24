-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: simple
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco` (
  `ID_BANCO` int NOT NULL AUTO_INCREMENT,
  `TIPO_CUENTA` varchar(30) NOT NULL,
  `NUMERO_CUENTA` int NOT NULL,
  `ID_CUENTA_SIMPLE` int NOT NULL,
  PRIMARY KEY (`ID_BANCO`),
  KEY `BANCO_CUENTA` (`ID_CUENTA_SIMPLE`),
  CONSTRAINT `BANCO_CUENTA` FOREIGN KEY (`ID_CUENTA_SIMPLE`) REFERENCES `cuenta` (`ID_CUENTA_SIMPLE`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES (1,'CUENTA CORRIENTE ',12465123,1),(2,'CUENTA CORRIENTE',21211518,2),(3,'CAJA DE AHORRO',13131415,3),(4,'CAJA DE AHORRO',87495117,4),(5,'CUENTA CORRIENTE ',34615263,5),(6,'CUENTA CORRIENTE',46151413,6),(7,'CAJA DE AHORRO',41131524,7),(8,'CAJA DE AHORRO',31211234,8);
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `TIPO_CATEGORIA` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'TELEVISOR'),(2,'CELULARES'),(3,'MICROONDAS'),(4,'HELADERAS'),(5,'COMPUTADORA'),(6,'AUDIO'),(7,'ELECTRODOMESTICOS'),(8,'LAVARROPAS'),(9,'LUMINARIAS');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_publicaciones`
--

DROP TABLE IF EXISTS `categoria_publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_publicaciones` (
  `ID_CATEGORIA_PUBLICACION` int NOT NULL AUTO_INCREMENT,
  `ID_PUBLICACION` int NOT NULL,
  `ID_CATEGORIA` int NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA_PUBLICACION`),
  KEY `CP_PUBLICACION` (`ID_PUBLICACION`),
  KEY `CP_CATEGORIA` (`ID_CATEGORIA`),
  CONSTRAINT `CP_CATEGORIA` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE CASCADE,
  CONSTRAINT `CP_PUBLICACION` FOREIGN KEY (`ID_PUBLICACION`) REFERENCES `publicacion` (`ID_PUBLICACION`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_publicaciones`
--

LOCK TABLES `categoria_publicaciones` WRITE;
/*!40000 ALTER TABLE `categoria_publicaciones` DISABLE KEYS */;
INSERT INTO `categoria_publicaciones` VALUES (1,1,1),(2,2,4),(3,3,6),(4,4,1),(5,5,2),(6,6,3),(7,7,5),(8,8,8),(9,9,7),(10,10,9),(11,11,8),(12,12,2);
/*!40000 ALTER TABLE `categoria_publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprador`
--

DROP TABLE IF EXISTS `comprador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprador` (
  `ID_COMPRADOR` int NOT NULL,
  PRIMARY KEY (`ID_COMPRADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador`
--

LOCK TABLES `comprador` WRITE;
/*!40000 ALTER TABLE `comprador` DISABLE KEYS */;
INSERT INTO `comprador` VALUES (111001),(111002),(111003),(111004);
/*!40000 ALTER TABLE `comprador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `ID_CUENTA_SIMPLE` int NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(30) NOT NULL,
  `CONTRASEÑA` varchar(20) NOT NULL,
  `CUENTA_FECHA` date NOT NULL,
  `ID_COMPRADOR` int DEFAULT NULL,
  `ID_VENDEDOR` int DEFAULT NULL,
  `ID_DNI_PERSONA` int NOT NULL,
  PRIMARY KEY (`ID_CUENTA_SIMPLE`),
  KEY `CUENTA_COMPRADOR` (`ID_COMPRADOR`),
  KEY `CUENTA_VENDEDOR` (`ID_VENDEDOR`),
  KEY `CUENTA_PERSONA` (`ID_DNI_PERSONA`),
  CONSTRAINT `CUENTA_COMPRADOR` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `comprador` (`ID_COMPRADOR`) ON DELETE CASCADE,
  CONSTRAINT `CUENTA_PERSONA` FOREIGN KEY (`ID_DNI_PERSONA`) REFERENCES `persona` (`ID_DNI_PERSONA`) ON DELETE CASCADE,
  CONSTRAINT `CUENTA_VENDEDOR` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'misalinas','nuevacontraseña','0000-00-00',NULL,1,11111111),(2,'nriva','nr1234','0000-00-00',NULL,2,22222222),(3,'Camila','Lopez','0000-00-00',NULL,3,33333333),(4,'fberthet','fb8415','0000-00-00',NULL,4,44444444),(5,'aperez','ap6532','0000-00-00',111001,NULL,55555555),(6,'ddabat','db6819','0000-00-00',111002,NULL,66666666),(7,'lperata','lp9874','0000-00-00',111003,NULL,77777777),(8,'mcardona','mc1664','0000-00-00',111004,NULL,88888888),(10,'bubi','bubi','0000-00-00',NULL,NULL,111111),(12,'Pepe','Mujica','0000-00-00',NULL,NULL,554152);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `ID_FACTURA` int NOT NULL AUTO_INCREMENT,
  `ID_PUBLICACION` int NOT NULL,
  `CANTIDAD_PRODUCTO` int NOT NULL,
  `PRECIO_SIN_IVA` decimal(10,0) NOT NULL,
  `PRECIO_TOTAL` decimal(10,0) NOT NULL,
  `FACTURA_FECHA` date NOT NULL,
  `ID_COMPRADOR` int NOT NULL,
  `ID_VENDEDOR` int NOT NULL,
  PRIMARY KEY (`ID_FACTURA`),
  KEY `FACTURA_PUBLICACION` (`ID_PUBLICACION`),
  KEY `FACTURA_COMPRADOR` (`ID_COMPRADOR`),
  KEY `FACTURA_VENDEDOR` (`ID_VENDEDOR`),
  CONSTRAINT `FACTURA_COMPRADOR` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `comprador` (`ID_COMPRADOR`) ON DELETE CASCADE,
  CONSTRAINT `FACTURA_PUBLICACION` FOREIGN KEY (`ID_PUBLICACION`) REFERENCES `publicacion` (`ID_PUBLICACION`) ON DELETE CASCADE,
  CONSTRAINT `FACTURA_VENDEDOR` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,10,750000,907500,'0000-00-00',111001,1),(2,1,20,1500000,1815000,'0000-00-00',111002,1),(3,2,10,590000,713900,'0000-00-00',111002,1),(4,2,15,885000,1070850,'0000-00-00',111001,1),(5,3,5,450000,544500,'0000-00-00',111003,1),(6,3,7,630000,762300,'0000-00-00',111004,1),(7,4,8,1200000,1452000,'0000-00-00',111003,2),(8,4,11,1650000,1996500,'0000-00-00',111004,2),(9,5,3,600000,726000,'0000-00-00',111001,2),(10,5,5,1000000,1121000,'0000-00-00',111002,2),(11,6,1,250000,302500,'0000-00-00',111004,2),(12,6,2,500000,605000,'0000-00-00',111002,2),(13,7,10,500000,605000,'0000-00-00',111001,3),(14,7,15,750000,907500,'0000-00-00',111004,3),(15,8,15,900000,1089000,'0000-00-00',111001,3),(16,9,4,280000,338800,'0000-00-00',111003,3),(17,10,15,870000,1052700,'0000-00-00',111001,4),(18,11,5,325000,393250,'0000-00-00',111001,4),(19,11,11,715000,865150,'0000-00-00',111004,4),(20,12,10,550000,665500,'0000-00-00',111002,4),(21,12,8,440000,532400,'0000-00-00',111001,4);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_cuenta`
--

DROP TABLE IF EXISTS `new_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_cuenta` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_cuenta_simple` int DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL,
  `cuenta_fecha` date DEFAULT NULL,
  `id_comprador` int DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  `campoNuevo_campoAnterior` varchar(150) DEFAULT NULL,
  `nombreAccion` varchar(50) DEFAULT NULL,
  `nombre_tabla` varchar(50) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_cuenta`
--

LOCK TABLES `new_cuenta` WRITE;
/*!40000 ALTER TABLE `new_cuenta` DISABLE KEYS */;
INSERT INTO `new_cuenta` VALUES (1,10,'bubi','bubi','0000-00-00',NULL,NULL,'bubi-bubi','insert','cuenta','root@localhost','2022-11-08 04:57:42'),(2,1,'michelsalinas','ms2329','0000-00-00',NULL,1,'michelsalinas-ms2329','insert','cuenta','root@localhost','2022-11-08 05:00:04'),(3,1,'msalinasp','ms2329','0000-00-00',NULL,1,'michelsalinas-msalinasp/ms2329-ms2329','insert','cuenta','root@localhost','2022-11-08 05:02:01'),(4,1,'msalinas','ms2329','0000-00-00',NULL,1,'msalinasp - msalinas / ms2329 - ms2329','insert','cuenta','root@localhost','2022-11-08 05:08:06'),(5,1,'misalinas','nuevacontraseña','0000-00-00',NULL,1,'msalinas - misalinas / ms2329 - nuevacontraseña','insert','cuenta','root@localhost','2022-11-08 05:10:02'),(6,12,'Pepe','Mujica','0000-00-00',NULL,NULL,'Pepe-Mujica','insert','cuenta','root@localhost','2022-11-08 05:21:17');
/*!40000 ALTER TABLE `new_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_persona`
--

DROP TABLE IF EXISTS `new_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_persona` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_dni_persona` int DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `campoNuevo_campoAnterior` varchar(150) DEFAULT NULL,
  `nombreAccion` varchar(50) DEFAULT NULL,
  `nombre_tabla` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_persona`
--

LOCK TABLES `new_persona` WRITE;
/*!40000 ALTER TABLE `new_persona` DISABLE KEYS */;
INSERT INTO `new_persona` VALUES (1,554152,'Antonella','Perez',8151245,'aperez@gmail.com','Antonella-Antonella','update','persona','root@localhost','2022-11-08 04:34:42'),(2,554152,'Antonella','Perez',8151245,'antoperez@gmail.com','Antonella-Antonella','update','persona','root@localhost','2022-11-08 04:37:02'),(3,415611,'roberto','gomez',1231211,'rgomez@gmail.com','roberto-gomez','insert','persona','root@localhost','2022-11-08 05:28:04');
/*!40000 ALTER TABLE `new_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `ID_DNI_PERSONA` int NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `APELLIDO` varchar(20) NOT NULL,
  `TELEFONO` bigint NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_DNI_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (111111,'bubi','bubi',45648,'bubi@gmail.com'),(415611,'roberto','gomez',1231211,'rgomez@gmail.com'),(554152,'Antonella','Perez',8151245,'antoperez@gmail.com'),(1135111,'Edith','Pizarro',9845,'epizarro@gmail.com'),(1254859,'Martin','Palermo',6545115,'mpalermo@gmail.com'),(11111111,'Michel','Salinas',98765432,'michelsalinas26@gmail.com'),(22222222,'Nico','Riva',78954128,'nicoriva@gmail.com'),(33333333,'Camila','Lopez',87451217,'sofilopez@gmail.com'),(44444444,'Florencia','Berthet',12345600,'florberthet@gmail.com'),(55555555,'Alejandra','Perez',1324651217,'aleperez@gmail.com'),(65485214,'Roman','Riquelme',54654,'rriquelme@gmail.com'),(65487915,'Franco','Perez',4564541960,'fperez@gmail.com'),(66666666,'Daniel','Dabat',1245171813,'danidabat@gmail.com'),(77777777,'Lucas','Perata',1311171815,'lucasperata@gmail.com'),(88888888,'Maria','Cardona',1311191711,'mariacardona@gmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int NOT NULL AUTO_INCREMENT,
  `PRECIO_UNIDAD` decimal(10,0) NOT NULL,
  `CANTIDAD` int NOT NULL,
  `ID_VENDEDOR` int NOT NULL,
  `MARCA` varchar(30) NOT NULL,
  `MODELO` varchar(30) NOT NULL,
  `PRODUCTO_DESCRIPCION` varchar(200) NOT NULL,
  `PRODUCTO_FECHA` date NOT NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  KEY `PRODUCTO_VENDEDOR` (`ID_VENDEDOR`),
  CONSTRAINT `PRODUCTO_VENDEDOR` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,75000,200,1,'SAMSUNG','SVG-125','ETC...','0000-00-00'),(2,59000,100,1,'SAMSUNG','SVG-300','ETC...','0000-00-00'),(3,90000,250,1,'SAMSUNG','SVG-500','ETC...','0000-00-00'),(4,150000,100,2,'MOTOROLA','MOT-111','ETC...','0000-00-00'),(5,200000,200,2,'MOTOROLA','MOT-222','ETC...','0000-00-00'),(6,250000,250,2,'MOTOROLA','MOT-333','ETC...','0000-00-00'),(7,50000,200,3,'LG','LG-111','ETC...','0000-00-00'),(8,60000,180,3,'LG','LG-222','ETC...','0000-00-00'),(9,70000,250,3,'LG','LG-333','ETC...','0000-00-00'),(10,58000,200,4,'SAMSUNG','SAM-111','ETC...','0000-00-00'),(11,65000,200,4,'SAMSUNG','SAM-112','ETC...','0000-00-00'),(12,55000,200,4,'SAMSUNG','SAM-113','ETC...','0000-00-00');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_categoria`
--

DROP TABLE IF EXISTS `producto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_categoria` (
  `ID_PRODUCTO_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` int NOT NULL,
  `ID_CATEGORIA` int NOT NULL,
  PRIMARY KEY (`ID_PRODUCTO_CATEGORIA`),
  KEY `PC_PRODUCTO` (`ID_PRODUCTO`),
  KEY `PC_CATEGORIA` (`ID_CATEGORIA`),
  CONSTRAINT `PC_CATEGORIA` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE CASCADE,
  CONSTRAINT `PC_PRODUCTO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_categoria`
--

LOCK TABLES `producto_categoria` WRITE;
/*!40000 ALTER TABLE `producto_categoria` DISABLE KEYS */;
INSERT INTO `producto_categoria` VALUES (1,1,1),(2,2,4),(3,3,6),(4,4,1),(5,5,2),(6,6,3),(7,7,5),(8,8,8),(9,9,7),(10,10,9),(11,11,8),(12,12,2);
/*!40000 ALTER TABLE `producto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `ID_PUBLICACION` int NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` int NOT NULL,
  `PUBLICACION_DESCRIPCION` varchar(100) NOT NULL,
  `ID_VENDEDOR` int NOT NULL,
  `TITULO` varchar(80) NOT NULL,
  `PUBLICACION_FECHA` date NOT NULL,
  PRIMARY KEY (`ID_PUBLICACION`),
  KEY `PUBLICACION_PRODUCTO` (`ID_PRODUCTO`),
  KEY `PUBLICACION_VENDEDOR` (`ID_VENDEDOR`),
  CONSTRAINT `PUBLICACION_PRODUCTO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE,
  CONSTRAINT `PUBLICACION_VENDEDOR` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (1,1,'PUBLICACION PRUEBA',1,'VENTA DE PRODUCTO','0000-00-00'),(2,2,'PUBLICACION PRUEBA',1,'VENTA DE PRODUCTO','0000-00-00'),(3,3,'PUBLICACION PRUEBA',2,'VENTA DE PRODUCTO','0000-00-00'),(4,4,'PUBLICACION PRUEBA',2,'VENTA DE PRODUCTO','0000-00-00'),(5,5,'PUBLICACION PRUEBA',3,'VENTA DE PRODUCTO','0000-00-00'),(6,6,'PUBLICACION PRUEBA',3,'VENTA DE PRODUCTO','0000-00-00'),(7,7,'PUBLICACION PRUEBA',4,'VENTA DE PRODUCTO','0000-00-00'),(8,8,'PUBLICACION PRUEBA',4,'VENTA DE PRODUCTO','0000-00-00'),(9,9,'PUBLICACION PRUEBA',1,'VENTA DE PRODUCTO','0000-00-00'),(10,10,'PUBLICACION PRUEBA',2,'VENTA DE PRODUCTO','0000-00-00'),(11,11,'PUBLICACION PRUEBA',3,'VENTA DE PRODUCTO','0000-00-00'),(12,12,'PUBLICACION PRUEBA',4,'VENTA DE PRODUCTO','0000-00-00');
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `ID_TARJETA` int NOT NULL AUTO_INCREMENT,
  `BANCO` varchar(30) NOT NULL,
  `TARJETA_NUMERO` int NOT NULL,
  `FECHA_VENCIMIENTO` date NOT NULL,
  `CODIGO_SEGURIDAD` int NOT NULL,
  `ID_CUENTA_SIMPLE` int NOT NULL,
  PRIMARY KEY (`ID_TARJETA`),
  KEY `TARJETA_CUENTA` (`ID_CUENTA_SIMPLE`),
  CONSTRAINT `TARJETA_CUENTA` FOREIGN KEY (`ID_CUENTA_SIMPLE`) REFERENCES `cuenta` (`ID_CUENTA_SIMPLE`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (1,'GALICIA',11111111,'0000-00-00',135,1),(2,'CREDICOOP',11111112,'0000-00-00',135,2),(3,'BBVA',11111113,'0000-00-00',135,3),(4,'HSBC',11111114,'0000-00-00',135,4),(5,'ICBC',11111115,'0000-00-00',135,5),(6,'NACION',11111116,'0000-00-00',135,6),(7,'FRANCES',11111117,'0000-00-00',135,7),(8,'BRUBANK',11111118,'0000-00-00',135,8);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `ID_VENDEDOR` int NOT NULL,
  PRIMARY KEY (`ID_VENDEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `ID_VENTA` int NOT NULL AUTO_INCREMENT,
  `ID_FACTURA` int NOT NULL,
  `ID_VENDEDOR` int NOT NULL,
  `FECHA_VENTA` date NOT NULL,
  PRIMARY KEY (`ID_VENTA`),
  KEY `VENTA_FACTURA` (`ID_FACTURA`),
  KEY `VENTA_VENDEDOR` (`ID_VENDEDOR`),
  CONSTRAINT `VENTA_FACTURA` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE CASCADE,
  CONSTRAINT `VENTA_VENDEDOR` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,1,'0000-00-00'),(2,2,1,'0000-00-00'),(3,3,1,'0000-00-00'),(4,4,2,'0000-00-00'),(5,5,2,'0000-00-00'),(6,6,2,'0000-00-00'),(7,7,3,'0000-00-00'),(8,8,3,'0000-00-00'),(9,9,3,'0000-00-00'),(10,10,4,'0000-00-00'),(11,11,4,'0000-00-00'),(12,12,4,'0000-00-00'),(13,13,4,'0000-00-00'),(14,14,4,'0000-00-00'),(15,15,4,'0000-00-00'),(16,16,4,'0000-00-00'),(17,17,4,'0000-00-00'),(18,18,4,'0000-00-00'),(19,19,4,'0000-00-00'),(20,20,4,'0000-00-00');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05 23:33:37

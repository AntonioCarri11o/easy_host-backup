-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: easy_host
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alojamiento`
--

DROP TABLE IF EXISTS `alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alojamiento` (
  `disponibilidad_alojamiento` bit(1) NOT NULL,
  `h_recepcion_alojamiento` time(6) NOT NULL,
  `h_salida_alojamiento` time(6) NOT NULL,
  `n_banios_alojamiento` int NOT NULL,
  `n_camas_alojamiento` int NOT NULL,
  `n_huespedes_alojamiento` int NOT NULL,
  `precio_alojamiento` double NOT NULL,
  `fk_anfitrion` bigint NOT NULL,
  `fk_categoria` bigint NOT NULL,
  `fk_estatus` bigint NOT NULL,
  `id_alojamiento` bigint NOT NULL AUTO_INCREMENT,
  `descripcion_alojamiento` varchar(255) NOT NULL,
  `ubicacion_alojamiento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_alojamiento`),
  KEY `FKasbls0yo7wludq312ppam60np` (`fk_anfitrion`),
  KEY `FKhy7krylcioiogktstv70oc3s5` (`fk_categoria`),
  KEY `FKlfwv6bqmnp347mek62mibrpnt` (`fk_estatus`),
  CONSTRAINT `FKasbls0yo7wludq312ppam60np` FOREIGN KEY (`fk_anfitrion`) REFERENCES `anfitrion` (`id_anfitrion`),
  CONSTRAINT `FKhy7krylcioiogktstv70oc3s5` FOREIGN KEY (`fk_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `FKlfwv6bqmnp347mek62mibrpnt` FOREIGN KEY (`fk_estatus`) REFERENCES `estatus` (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamiento`
--

LOCK TABLES `alojamiento` WRITE;
/*!40000 ALTER TABLE `alojamiento` DISABLE KEYS */;
INSERT INTO `alojamiento` VALUES (_binary '','16:00:00.000000','09:00:00.000000',2,3,3,500,1,1,1,1,'Casa ejemplo','Morelos Xochitepec');
/*!40000 ALTER TABLE `alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anfitrion`
--

DROP TABLE IF EXISTS `anfitrion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anfitrion` (
  `fk_usuario` bigint NOT NULL,
  `id_anfitrion` bigint NOT NULL AUTO_INCREMENT,
  `rfc_anfitrion` varchar(13) NOT NULL,
  `curp_anfitrion` varchar(18) NOT NULL,
  `url_imagen_identificacion_anfitrion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_anfitrion`),
  UNIQUE KEY `UK_s62cuex6omrnnnbr8ey9oy34o` (`fk_usuario`),
  UNIQUE KEY `UK_10spelst8j1mr94dk9cop8q0i` (`rfc_anfitrion`),
  UNIQUE KEY `UK_kpqbuho8inp5guo15h1fo5uby` (`curp_anfitrion`),
  CONSTRAINT `FK50hgii9tx6434d8hgrrdjxm21` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anfitrion`
--

LOCK TABLES `anfitrion` WRITE;
/*!40000 ALTER TABLE `anfitrion` DISABLE KEYS */;
INSERT INTO `anfitrion` VALUES (5,1,'VECJ880326','RACW050729MMCSHNA9','https://wallpapercave.com/wp/wp7392497.jpg');
/*!40000 ALTER TABLE `anfitrion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancelacion`
--

DROP TABLE IF EXISTS `cancelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancelacion` (
  `fk_reserva` bigint NOT NULL,
  `id_cancelacion` bigint NOT NULL AUTO_INCREMENT,
  `motivo_cancelacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cancelacion`),
  UNIQUE KEY `UK_jntm14yp2icup4ip7qlqc8xxi` (`fk_reserva`),
  CONSTRAINT `FKhtebpwooislbctkl6aelnlxi5` FOREIGN KEY (`fk_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancelacion`
--

LOCK TABLES `cancelacion` WRITE;
/*!40000 ALTER TABLE `cancelacion` DISABLE KEYS */;
INSERT INTO `cancelacion` VALUES (2,1,'Ya no quise');
/*!40000 ALTER TABLE `cancelacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(16) NOT NULL,
  `descripcion_categoria` varchar(60) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Casa','Edificio de con al menos cuatro muros en una zona urbana'),(2,'Cuarto','Espacio cerrado dentro de una edificación'),(3,'Cabaña','Construcción pequeña de materiales pobres');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo`
--

DROP TABLE IF EXISTS `codigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigo` (
  `fecha_codigo` datetime(6) NOT NULL,
  `id_codigo` bigint NOT NULL AUTO_INCREMENT,
  `valor_codigo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo`
--

LOCK TABLES `codigo` WRITE;
/*!40000 ALTER TABLE `codigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus` (
  `valor_estatus` bit(1) DEFAULT NULL,
  `id_estatus` bigint NOT NULL AUTO_INCREMENT,
  `clave_estatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (_binary '',1,'Activo'),(_binary '\0',2,'Inactivo'),(_binary '',3,'Aprobado'),(_binary '\0',4,'Rechazado'),(_binary '\0',5,'Pendiente'),(_binary '',6,'Reservado'),(_binary '\0',7,'Finalizado'),(_binary '\0',8,'Cancelado');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra`
--

DROP TABLE IF EXISTS `extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra` (
  `id_extra` bigint NOT NULL AUTO_INCREMENT,
  `nombre_extra` varchar(16) NOT NULL,
  `descripcion_extra` varchar(40) NOT NULL,
  `url_imagen_extra` varchar(255) NOT NULL,
  PRIMARY KEY (`id_extra`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra`
--

LOCK TABLES `extra` WRITE;
/*!40000 ALTER TABLE `extra` DISABLE KEYS */;
INSERT INTO `extra` VALUES (1,'WI-FI','Conexión de internet inalhámbrica','https://cdn-icons-png.flaticon.com/512/93/93158.png');
/*!40000 ALTER TABLE `extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_alojamiento`
--

DROP TABLE IF EXISTS `extra_alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_alojamiento` (
  `id_alojamiento` bigint NOT NULL,
  `id_extra` bigint NOT NULL,
  PRIMARY KEY (`id_alojamiento`,`id_extra`),
  KEY `FKql31yevch74id57oufq8unacv` (`id_extra`),
  CONSTRAINT `FK5uwplrkoixoy2w6oj780xkefk` FOREIGN KEY (`id_alojamiento`) REFERENCES `alojamiento` (`id_alojamiento`),
  CONSTRAINT `FKql31yevch74id57oufq8unacv` FOREIGN KEY (`id_extra`) REFERENCES `extra` (`id_extra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_alojamiento`
--

LOCK TABLES `extra_alojamiento` WRITE;
/*!40000 ALTER TABLE `extra_alojamiento` DISABLE KEYS */;
INSERT INTO `extra_alojamiento` VALUES (1,1);
/*!40000 ALTER TABLE `extra_alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `monto_pago` double NOT NULL,
  `fecha_pago` datetime(6) NOT NULL,
  `fk_estatus` bigint NOT NULL,
  `fk_reserva` bigint NOT NULL,
  `id_pago` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `UK_qr5hjf7nhpaatfg2wpf6e2rjf` (`fk_reserva`),
  KEY `FKhal7o21mvmw72yfkoqr9qih5w` (`fk_estatus`),
  CONSTRAINT `FK3cw5t44hw8ii24kyhmg5kx1lf` FOREIGN KEY (`fk_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `FKhal7o21mvmw72yfkoqr9qih5w` FOREIGN KEY (`fk_estatus`) REFERENCES `estatus` (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (500,'2024-04-11 14:00:45.522000',3,3,1);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resenia`
--

DROP TABLE IF EXISTS `resenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resenia` (
  `valoracion_resenia` int DEFAULT NULL,
  `fk_alojamiento` bigint NOT NULL,
  `fk_usuario` bigint NOT NULL,
  `id_resenia` bigint NOT NULL AUTO_INCREMENT,
  `contenido_resenia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_resenia`),
  KEY `FK9ks9x3ns53cey6xf5tqge0jbc` (`fk_alojamiento`),
  KEY `FKmaoqljtl5cdcou4p416jk9cv5` (`fk_usuario`),
  CONSTRAINT `FK9ks9x3ns53cey6xf5tqge0jbc` FOREIGN KEY (`fk_alojamiento`) REFERENCES `alojamiento` (`id_alojamiento`),
  CONSTRAINT `FKmaoqljtl5cdcou4p416jk9cv5` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resenia`
--

LOCK TABLES `resenia` WRITE;
/*!40000 ALTER TABLE `resenia` DISABLE KEYS */;
INSERT INTO `resenia` VALUES (4,1,4,1,'Bonito lugar');
/*!40000 ALTER TABLE `resenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resenia_usuario`
--

DROP TABLE IF EXISTS `resenia_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resenia_usuario` (
  `calificacion_resenia_usuario` int DEFAULT NULL,
  `fk_anfitrion` bigint DEFAULT NULL,
  `fk_usuario` bigint DEFAULT NULL,
  `id_resenia_usuario` bigint NOT NULL AUTO_INCREMENT,
  `valoracion_resenia_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_resenia_usuario`),
  UNIQUE KEY `UK_43k23q6mwmos38c8289q3eurr` (`fk_anfitrion`),
  UNIQUE KEY `UK_7tu6w5gd8gn2y48yosbylg8pu` (`fk_usuario`),
  CONSTRAINT `FKej9bvxyk44ocy7vryqjo77uhv` FOREIGN KEY (`fk_anfitrion`) REFERENCES `anfitrion` (`id_anfitrion`),
  CONSTRAINT `FKo8cuf8ykvge67rbrgwjrxojef` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resenia_usuario`
--

LOCK TABLES `resenia_usuario` WRITE;
/*!40000 ALTER TABLE `resenia_usuario` DISABLE KEYS */;
INSERT INTO `resenia_usuario` VALUES (1,1,4,1,'Muy sucio');
/*!40000 ALTER TABLE `resenia_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `n_huespedes_reserva` int DEFAULT NULL,
  `f_llegada_reserva` datetime(6) DEFAULT NULL,
  `f_salida_reserva` datetime(6) DEFAULT NULL,
  `fk_alojamiento` bigint NOT NULL,
  `fk_estatus` bigint NOT NULL,
  `fk_usuario` bigint NOT NULL,
  `id_reserva` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_reserva`),
  KEY `FKodejmvdmntkv3p9u1ytadabgn` (`fk_alojamiento`),
  KEY `FK8lal1xrx12tkk8swrfnr6i7e0` (`fk_estatus`),
  KEY `FKdbtxgamrn15volbxo4ljr6s6a` (`fk_usuario`),
  CONSTRAINT `FK8lal1xrx12tkk8swrfnr6i7e0` FOREIGN KEY (`fk_estatus`) REFERENCES `estatus` (`id_estatus`),
  CONSTRAINT `FKdbtxgamrn15volbxo4ljr6s6a` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKodejmvdmntkv3p9u1ytadabgn` FOREIGN KEY (`fk_alojamiento`) REFERENCES `alojamiento` (`id_alojamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (0,'2024-04-11 16:00:00.471000','2024-04-12 09:00:00.471000',1,5,2,1),(1,'2024-04-12 16:00:00.485000','2024-04-13 09:00:00.485000',1,8,3,2),(2,'2024-04-13 16:00:00.495000','2024-04-14 09:00:00.495000',1,7,4,3);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` bigint NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(16) DEFAULT NULL,
  `descripcion_rol` varchar(32) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `UK_15ipy0sgs02hc88iasf102v8e` (`descripcion_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ROL_ADMIN','Gestion general'),(2,'ROL_ANFITRION','Crea y renta espacios'),(3,'ROL_HUESPED','Se hospeda en espacios');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `fk_estatus` bigint NOT NULL DEFAULT '5',
  `fk_usuario` bigint DEFAULT NULL,
  `id_solicitud` bigint NOT NULL AUTO_INCREMENT,
  `campos_solicitud` json NOT NULL,
  `tipo_solicitud` varchar(255) NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `FKgkbqwyqt9uo7y31ib6y8eobev` (`fk_estatus`),
  KEY `FKfmo2ca1jrhwfivow3g7nnpiht` (`fk_usuario`),
  CONSTRAINT `FKfmo2ca1jrhwfivow3g7nnpiht` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKgkbqwyqt9uo7y31ib6y8eobev` FOREIGN KEY (`fk_estatus`) REFERENCES `estatus` (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (5,NULL,1,'{\"rfc\": \"LOVA910203123\", \"curp\": \"LOVA910203HMCSRR05\", \"fk_usuario\": \"1\", \"urlImagenIdentificacionAnfitrion\": \"https://wallpapercave.com/wp/wp7392497.jpg\"}','verificacion_anfitrion');
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nonLocked` bit(1) NOT NULL,
  `f_nac_usuario` datetime(6) NOT NULL,
  `fk_codigo` bigint DEFAULT NULL,
  `fk_rol` bigint NOT NULL,
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `telefono_usuario` varchar(10) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `apellidos_usuario` varchar(50) NOT NULL,
  `correo_usuario` varchar(50) NOT NULL,
  `direccion_usuario` varchar(60) NOT NULL,
  `contrasenia_usuario` varchar(255) NOT NULL,
  `genero_usuario` varchar(255) NOT NULL,
  `url_imagen_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UK_3724tvh34vptskv6rl3o4orc2` (`telefono_usuario`),
  UNIQUE KEY `UK_do5kjb0haqlicn34eexyuy1e3` (`correo_usuario`),
  UNIQUE KEY `UK_ed8nuothg5ytpvgiej1dv0kf2` (`fk_codigo`),
  KEY `FKjuueluoxddyqt9w4tyafbahac` (`fk_rol`),
  CONSTRAINT `FKjuueluoxddyqt9w4tyafbahac` FOREIGN KEY (`fk_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `FKp7ibc2cfn45iqwjriinwfoceb` FOREIGN KEY (`fk_codigo`) REFERENCES `codigo` (`id_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (_binary '','2004-04-11 14:00:44.643000',NULL,1,1,'7772735893','Admin','Uno','admin@gmail.com','direccion de admin','$2a$10$38nABFAvacU6OcR8xp0FPe8SfFisEueRuJkmUlIfW0bTksbW5K/42','Hombre',NULL),(_binary '','2004-04-11 14:00:44.798000',NULL,3,2,'1111111111','Huesped1','Uno','huesped@gmail.com','direccion huesped','$2a$10$ITfBgacknoZCvxACprVDje5DRFg26tqL5F5PDbTPTVuFbZB3gggtW','Hombre',NULL),(_binary '','2004-04-11 14:00:44.940000',NULL,3,3,'1111111112','Huesped2','Dos','huesped2@gmail.com','direccion huesped2','$2a$10$jRsIs7TyU3DLByYU./XjHuQYPtFSjIXmVRiR1NIp5dY1m/WbFz0Wi','Hombre',NULL),(_binary '','2004-04-11 14:00:45.088000',NULL,3,4,'1111111113','Huesped3','Tres','huesped3@gmail.com','direccion huesped3','$2a$10$YQt1g6f3f5OxgKac6L1Qyuq9VmJnVeaOLZy8WbWdHarJLBmNRLH8u','Hombre',NULL),(_binary '','2004-04-11 14:00:45.218000',NULL,2,5,'2222222222','Anfitrion','Uno','anfitrion@gmail.com','direccion anfitrion','$2a$10$lCa4OQJ4uaZnirCBUUyZkuinkGZcFmDFk1CdQKkywEUBQ503/bOYO','Hombre',NULL),(_binary '','2004-04-11 14:00:45.734000',NULL,3,6,'1111111114','Usuario','cuatro','usuario_cuatro@gmail.com','direccion usuario cuatro','$2a$10$AZZANpw0mIUylJKfCRm/cubl2lJkH0JAtCsAls/pgiIaZBerbm8NS','Hombre',NULL),(_binary '','2024-04-11 14:00:45.924000',NULL,3,7,'7771111110','Alejandro','García Pérez','Alejandro@email.com','direccion 20','$2a$10$.7Wor7JDL8yzaNDpbrTk4eaHVbWDrOPcI6JVQ69m6k237W/Cl2sIu','Hombre',NULL),(_binary '','2024-04-11 14:00:46.047000',NULL,3,8,'7771111111','Sofía','Rodríguez Martínez','Sofía@email.com','direccion 21','$2a$10$/o30TpcLx26m7.g1xWfuOORrhhz5NQFJq0TGt9VxcHzz4n3i3f8qe','Mujer',NULL),(_binary '','2024-04-11 14:00:46.170000',NULL,3,9,'7771111112','Diego','López González','Diego@email.com','direccion 22','$2a$10$YQ01e04ZKeBY4wCE2h/F6eyFVpEYmHiVhNo0putwEi.xDMxbHbM9a','Hombre',NULL),(_binary '','2024-04-11 14:00:46.292000',NULL,3,10,'7771111113','Valentina','González Rodríguez','Valentina@email.com','direccion 23','$2a$10$lr3.v4iTsclat2FqfTmf/etUSI0/QnDtd13ZqNvsveFXQ/KT7uZRm','Mujer',NULL),(_binary '','2024-04-11 14:00:46.446000',NULL,3,11,'7771111114','Andrés','Martínez López','Andrés@email.com','direccion 24','$2a$10$gTCHfIEMdXof//dPPntqDe8YACyusuxyAsry4jiKxJYfYWii4YF2y','Hombre',NULL),(_binary '','2024-04-11 14:00:46.572000',NULL,3,12,'7771111115','Camila','Sánchez Pérez','Camila@email.com','direccion 25','$2a$10$uaBPCIxjJSx/55w2aXid3uOhNgfIny3ZcVJl..43TbKy8KDZKP3Uq','Mujer',NULL),(_binary '','2024-04-11 14:00:46.695000',NULL,3,13,'7771111116','Javier','Pérez Martínez','Javier@email.com','direccion 26','$2a$10$i2Gs8z2qUzlFclKy3sDUi.EfsU1m8T4gjffwrVtLlawq8JTLM9JXi','Hombre',NULL),(_binary '','2024-04-11 14:00:46.818000',NULL,3,14,'7771111117','Ana','Martínez Sánchez','Ana@email.com','direccion 27','$2a$10$M80bOO8s79rma1Wh.3wPgug9qbzKyJc9w3JjFmUGSa2zWk.lBVcr2','Mujer',NULL),(_binary '','2024-04-11 14:00:46.942000',NULL,3,15,'7771111118','Mateo','Fernández García','Mateo@email.com','direccion 28','$2a$10$XHeoGM9kfQMD18vbmOAobOeodF46jgzSSZxG3jBzqBnJwJWoNW0Ou','Hombre',NULL),(_binary '','2024-04-11 14:00:47.066000',NULL,3,16,'7771111119','Isabella','Ruiz Rodríguez','Isabella@email.com','direccion 29','$2a$10$VTpSCyXHL.ivnDo.WI8wi./sMOQOn5TjqtDKTudh087F.h/C7mtpi','Mujer',NULL),(_binary '','2024-04-11 14:00:47.189000',NULL,3,17,'7772111110','Carlos','Martín López','Carlos@email.com','direccion 210','$2a$10$wFOUU4JefUgmjXOBLDyevOTbwOw6QWqiTyw8nlvRQSXK4fKzoNo3G','Hombre',NULL),(_binary '','2024-04-11 14:00:47.311000',NULL,3,18,'7772111111','Natalia','Hernández González','Natalia@email.com','direccion 211','$2a$10$aOgk8S0iGramzZl2zswvgO1yygYHXdzRGxtfC3btthMyB6802pi3u','Mujer',NULL),(_binary '','2024-04-11 14:00:47.433000',NULL,3,19,'7772111112','Juan','Díaz Pérez','Juan@email.com','direccion 212','$2a$10$407sL2lURS2ufWVIS8R60OR.m4Y8f8CCXgtMuHuKdXSZhJK9xfg/i','Hombre',NULL),(_binary '','2024-04-11 14:00:47.562000',NULL,3,20,'7772111113','Gabriela','Moreno Martínez','Gabriela@email.com','direccion 213','$2a$10$aJFiEvmOyz5we7/fDrbla.3g1trqcXBAi6gt6fitM6RI6BmX/RacK','Mujer',NULL),(_binary '','2024-04-11 14:00:47.686000',NULL,3,21,'7772111114','Luis','Álvarez Rodríguez','Luis@email.com','direccion 214','$2a$10$RD0FMXBAADkFvrmEdc4mGuUNnOaZZZtzBTmYB5D9xeABgVKn6N1T.','Hombre',NULL),(_binary '','2024-04-11 14:00:47.815000',NULL,3,22,'7772111115','Daniela','Gutiérrez López','Daniela@email.com','direccion 215','$2a$10$DOVeVPNB1E2I7xauVHJ8d.zA6Tqnry4RFN9t3dUI049WiL1FP5/uS','Mujer',NULL),(_binary '','2024-04-11 14:00:47.939000',NULL,3,23,'7772111116','Miguel','Romero Pérez','Miguel@email.com','direccion 216','$2a$10$SvQyeDYM5g/fCdQCWqLqzu02U5DwyhDisv7hIGfr3IrevvYPkAb5u','Hombre',NULL),(_binary '','2024-04-11 14:00:48.068000',NULL,3,24,'7772111117','María','Navarro Martínez','María@email.com','direccion 217','$2a$10$eHuotsAYjM2sdGGD5eiV9ukAcFLjw3ldU36QCXb0yrcts3HYxJySu','Mujer',NULL),(_binary '','2024-04-11 14:00:48.197000',NULL,3,25,'7772111118','Pablo','Torres González','Pablo@email.com','direccion 218','$2a$10$r3On1QL6UMjACkPu8mzZbONjMpmebh3PthZgpT/zV6rO10iDQhhS2','Hombre',NULL),(_binary '','2024-04-11 14:00:48.320000',NULL,3,26,'7772111119','Andrea','Domínguez López','Andrea@email.com','direccion 219','$2a$10$f.m6NtgdS0nfl0w02cPLo.I8TpBeQHeZu645l9lHhOhYHNqvhAmI.','Mujer',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 20:40:22

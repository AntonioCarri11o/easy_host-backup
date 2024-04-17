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
  PRIMARY KEY (`id_alojamiento`)
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
  `url_imagen_identificacion_anfitrion` mediumblob NOT NULL,
  PRIMARY KEY (`id_anfitrion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anfitrion`
--

LOCK TABLES `anfitrion` WRITE;
/*!40000 ALTER TABLE `anfitrion` DISABLE KEYS */;
INSERT INTO `anfitrion` VALUES (5,1,'VECJ880326','RACW050729MMCSHNA9',_binary 'https://wallpapercave.com/wp/wp7392497.jpg');
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
  PRIMARY KEY (`id_cancelacion`)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra`
--

LOCK TABLES `extra` WRITE;
/*!40000 ALTER TABLE `extra` DISABLE KEYS */;
INSERT INTO `extra` VALUES (1,'WI-FI','Conexión de internet inalhámbrica','https://cdn-icons-png.flaticon.com/512/93/93158.png'),(2,'Jacuzzi','Piscina pequeña','https://cdn-icons-png.flaticon.com/512/93/93158.png'),(3,'Niñero','Servicio de cuidado de niños','https://cdn-icons-png.flaticon.com/512/93/93158.png');
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
  PRIMARY KEY (`id_alojamiento`,`id_extra`)
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
-- Table structure for table `operaciones_log`
--

DROP TABLE IF EXISTS `operaciones_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaciones_log` (
  `fecha_operacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_estatus` bigint DEFAULT NULL,
  `fk_solicitud` bigint DEFAULT NULL,
  `fk_usuario` bigint DEFAULT NULL,
  `id_log` bigint NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(100) NOT NULL,
  `tipo_operacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones_log`
--

LOCK TABLES `operaciones_log` WRITE;
/*!40000 ALTER TABLE `operaciones_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `operaciones_log` ENABLE KEYS */;
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
  `fk_reserva` bigint DEFAULT NULL,
  `fk_tarjeta` bigint NOT NULL,
  `id_pago` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (500,'2024-04-16 18:18:50.558000',3,1,1,1);
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
  PRIMARY KEY (`id_resenia`)
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
  PRIMARY KEY (`id_resenia_usuario`)
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
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (0,'2024-04-16 16:00:00.469000','2024-04-17 09:00:00.469000',1,5,2,1),(1,'2024-04-17 16:00:00.479000','2024-04-18 09:00:00.479000',1,8,3,2),(2,'2024-04-18 16:00:00.489000','2024-04-19 09:00:00.489000',1,7,4,3);
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
  PRIMARY KEY (`id_rol`)
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
  `fecha_operacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_estatus` bigint NOT NULL DEFAULT '5',
  `fk_usuario` bigint DEFAULT NULL,
  `id_solicitud` bigint NOT NULL AUTO_INCREMENT,
  `campos_solicitud` json NOT NULL,
  `tipo_solicitud` varchar(255) NOT NULL,
  PRIMARY KEY (`id_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `cvv_tarjeta` varchar(3) NOT NULL,
  `fecha_vencimiento_tarjeta` datetime(6) NOT NULL,
  `fk_usuario` bigint NOT NULL,
  `id_tarjeta` bigint NOT NULL AUTO_INCREMENT,
  `numero_tarjeta` varchar(16) NOT NULL,
  `nombre_tarjeta` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES ('123','2023-12-01 00:00:00.000000',2,1,'1234567890123456','Nombre');
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
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
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (_binary '','2004-04-16 18:18:49.812000',NULL,1,1,'7772735893','Admin','Uno','admin@gmail.com','direccion de admin','$2a$10$MS4lzdeM6o0HsPNfhBbkSehbxQtmofvzueH6PVLYkPXIXg8Osxd22','Hombre',NULL),(_binary '','2004-04-16 18:18:49.933000',NULL,3,2,'1111111111','Huesped1','Uno','huesped@gmail.com','direccion huesped','$2a$10$RqvoJDDBJswcE7jbTHNLOO05GLL6AqhHHakFsmGc6mn0Lon8IpBoW','Hombre',NULL),(_binary '','2004-04-16 18:18:50.035000',NULL,3,3,'1111111112','Huesped2','Dos','huesped2@gmail.com','direccion huesped2','$2a$10$Vn4vmP/txktzuYwzCtAVpOPN.FlV9Jxb0zVFgTVH0asRsyAewqbA6','Hombre',NULL),(_binary '','2004-04-16 18:18:50.147000',NULL,3,4,'1111111113','Huesped3','Tres','huesped3@gmail.com','direccion huesped3','$2a$10$4glUyQP0M0/SVXj2sIWjG.G2DKRKP8ohh42hAcxwLz6N92JZH5pF2','Hombre',NULL),(_binary '','2004-04-16 18:18:50.272000',NULL,2,5,'2222222222','Anfitrion','Uno','anfitrion@gmail.com','direccion anfitrion','$2a$10$2EArMXDQej9JVcNiOWRJdOC7bu0Vsp08SXCfvnmxxdG0wTft5y5F2','Hombre',NULL),(_binary '','2004-04-16 18:18:50.748000',NULL,3,6,'1111111114','Usuario','cuatro','usuario_cuatro@gmail.com','direccion usuario cuatro','$2a$10$AYl/ixe1eHwH9lm3MUxEuOEMri/bQ8KPU8IK8pZ6kqDoOZQVOYybi','Hombre',NULL);
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

-- Dump completed on 2024-04-16 18:38:09

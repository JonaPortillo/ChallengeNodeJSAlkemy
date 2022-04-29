-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: disney_api
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

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

drop database if exists api_disney_challenge_alkemy;


create database if not exists api_disney_challenge_alkemy;


use api_disney_challenge_alkemy;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Imagen genero Drama','Drama'),(2,'Imagen genero Accion','Accion'),(3,'Imagen genero Fantasia','Fantasia'),(4,'Imagen genero Aventura','Aventura'),(5,'Imagen genero Musical','Musical');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelis_series`
--

DROP TABLE IF EXISTS `pelis_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelis_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genero` (`genero_id`),
  CONSTRAINT `genero` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelis_series`
--

LOCK TABLES `pelis_series` WRITE;
/*!40000 ALTER TABLE `pelis_series` DISABLE KEYS */;
INSERT INTO `pelis_series` VALUES (1,'Mohana','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Moana.svg/220px-Moana.svg.png','2018-10-09',2,3),(2,'Piratas del Caribe','https://es.wikipedia.org/wiki/Piratas_del_Caribe#/media/Archivo:Piratesofthecaribbean-logo-englisch.svg','2011-03-09',5,2),(3,'Gravity Falls','https://es.wikipedia.org/wiki/Gravity_Falls#/media/Archivo:Gravity_Falls.png','2019-11-05',4,4),(7,'Monsters University','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Monsters_University_Logo.svg/250px-Monsters_University_Logo.svg.png','2009-02-06',4,4);
/*!40000 ALTER TABLE `pelis_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(400) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `historia` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Giffany','https://static.wikia.nocookie.net/disney/images/5/51/Giffany.png',30,50,'Salió de un videojuego porque se enamoró de Soos.'),(2,'Dipper','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS84cRVgWhYh0RloTASS3TmcCOm_-1JTE__Ww&usqp=CAU',10,30,'Gemelo Pines, de gravity falls'),(3,'Agente K','https://static.wikia.nocookie.net/disney/images/8/88/The-replacements-kath-soucie-0.jpg',12,25,'Koala agente secreto.'),(4,'Jack Sparrow','https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg/245px-Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg',35,67,'Pirata más buscado de los 7 mares.'),(5,'Tarzán','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOXt16tuw4mllFywKsq0J4MOp7iV5AunPt_g&usqp=CAU',0,0,'Perdío a sus papás en un ataque de un tigre. Fué criado por los simios.'),(10,'Mike WazoWski','https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Drawing_of_Mike_Wazowski_%2811377516743%29.jpg/245px-Drawing_of_Mike_Wazowski_%2811377516743%29.jpg',22,50,'Es el amigo de Sulley, su compañero de piso, su asistente en Monsters, Inc., y posteriormente su co-presidente en la empresa tras los eventos en la película. '),(16,'Sully','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Sulley_Drawing_%2811377514373%29.jpg/245px-Sulley_Drawing_%2811377514373%29.jpg',24,120,'James P. \'Sulley\' Sullivan es un personaje de las películas de Disney Pixar, Monsters, Inc. y Monsters University. Es un monstruo verde, con manchas moradas, gigante y con dos cuernos en su cabeza  ');
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes_pelis_series`
--

DROP TABLE IF EXISTS `personajes_pelis_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes_pelis_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_peli_serie` int(11) NOT NULL,
  `id_personaje` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personajes_pelis_series_un` (`id_peli_serie`,`id_personaje`),
  KEY `personajes_pelis_series_FK` (`id_personaje`),
  CONSTRAINT `personajes_pelis_series_FK` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `personajes_pelis_series_FK_1` FOREIGN KEY (`id_peli_serie`) REFERENCES `pelis_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes_pelis_series`
--

LOCK TABLES `personajes_pelis_series` WRITE;
/*!40000 ALTER TABLE `personajes_pelis_series` DISABLE KEYS */;
INSERT INTO `personajes_pelis_series` VALUES (3,2,4),(2,3,1),(1,3,2);
/*!40000 ALTER TABLE `personajes_pelis_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estaActivo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'aaaaa','aaaaa',0),(2,'bbbbb','bbbbb',0),(3,'ccccc','ccccc',0),(4,'$2a$10$G17M7sgC1oCoOI2aHuWhyOTQgZ31yBQxilwdw6Mc2Pll7n5X2v1Qy','jonicapo',0),(5,'$2a$10$5o5./KNknvvvN..rrk/mseO.QlZwS/nwirL.D7n6WV9SzxIs40NnC','jonicapo',0),(6,'$2a$10$KFKHVp.e/IaQZ4POiFukEOvzt0NArZ6oQNtJF2KtDIXC8z0fwHPGK','jonicapo@gmail.com',0),(24,'$2a$10$plhlY3qOnUoqHx4cQ4Jshe68SgdbFL4hll3vphxDBYrzCm695q8mO','portillo.jonathan.leonel@gmail.com',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'disney_api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28  2:32:54

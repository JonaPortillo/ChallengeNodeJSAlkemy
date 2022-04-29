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

DROP database IF EXISTS api_disney;


CREATE database IF NOT EXISTS api_disney;

USE api_disney;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(1000) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Drama','Drama'),(2,'Accion','Accion'),(3,'https://i0.wp.com/xn--oo-yjab.cl/wp-content/uploads/2013/11/wonderland-pais-de-las-maravillas-alicia.jpg?resize=662%2C326&ssl=1','Fantasia'),(4,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy70kXa4_4cSphpwJYGmxxnXpVAL7WhC2lLQ&usqp=CAU','Aventura'),(5,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT82kxIYjP7otZRX_KO3KkADNnMw8GHbNLY-Q&usqp=CAU','Musical');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelis_series`
--

LOCK TABLES `pelis_series` WRITE;
/*!40000 ALTER TABLE `pelis_series` DISABLE KEYS */;
INSERT INTO `pelis_series` VALUES (1,'Mohana','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Moana.svg/220px-Moana.svg.png','2018-10-09',2,3),(2,'Piratas del Caribe','https://es.wikipedia.org/wiki/Piratas_del_Caribe#/media/Archivo:Piratesofthecaribbean-logo-englisch.svg','2011-03-09',5,2),(3,'Gravity Falls','https://es.wikipedia.org/wiki/Gravity_Falls#/media/Archivo:Gravity_Falls.png','2019-11-05',4,4),(4,'Los sustitutos','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2PNnC2oXwYOZMIpZ4-ZHplUo5DbrZKp1eO8mD2vsqlUtn2LpnzCC0YnH7yaFbbnag8y0&usqp=CAU','2010-04-08',2,5),(5,'Phineas y Ferb','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/phineas-ferb-pelicula-1590739701.jpeg','2012-04-08',5,1),(6,'Toy Story','https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Toy_Story.svg/220px-Toy_Story.svg.png','1995-04-08',5,3),(7,'Monsters University','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Monsters_University_Logo.svg/250px-Monsters_University_Logo.svg.png','2009-02-06',4,4),(8,'Mulán','https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Mulan_Logo_Black.svg/261px-Mulan_Logo_Black.svg.png','2007-03-07',3,2),(9,'Toy Story 2','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Toy_Story_2_logo.svg/220px-Toy_Story_2_logo.svg.png','1999-04-08',5,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Giffany','https://static.wikia.nocookie.net/disney/images/5/51/Giffany.png',30,50,'Salió de un videojuego porque se enamoró de Soos.'),(2,'Dipper','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS84cRVgWhYh0RloTASS3TmcCOm_-1JTE__Ww&usqp=CAU',10,30,'Gemelo Pines, de gravity falls'),(3,'Agente K','https://static.wikia.nocookie.net/disney/images/8/88/The-replacements-kath-soucie-0.jpg',12,25,'Koala agente secreto.'),(4,'Jack Sparrow','https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg/245px-Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg',35,67,'Pirata más buscado de los 7 mares.'),(5,'Tarzán','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOXt16tuw4mllFywKsq0J4MOp7iV5AunPt_g&usqp=CAU',0,0,'Perdío a sus papás en un ataque de un tigre. Fué criado por los simios.'),(7,'Woody','https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Montreal_Comiccon_2015_-_Woody_%2819458018831%29.jpg/245px-Montreal_Comiccon_2015_-_Woody_%2819458018831%29.jpg',52,0.5,'Vauero de jueguete famoso en los 70.'),(8,'Buzz Lightyear','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/WonderCon_2011_-_Buzz_Lightyear_%285596535109%29.jpg/300px-WonderCon_2011_-_Buzz_Lightyear_%285596535109%29.jpg',3,0.6,'Es un superhéroe de juguete y una figura de acción en la franquicia. Junto con su amigo, el sheriff Woody'),(9,'Mickey Mouse','https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Stamp_of_Albania_-_1999_-_Colnect_186269_-_Mickey_Mouse_writing.jpeg/245px-Stamp_of_Albania_-_1999_-_Colnect_186269_-_Mickey_Mouse_writing.jpeg',22,12,'Ratón que vive muchas aventuras con sus amigos.'),(10,'Mike WazoWski','https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Drawing_of_Mike_Wazowski_%2811377516743%29.jpg/245px-Drawing_of_Mike_Wazowski_%2811377516743%29.jpg',22,50,'Es el amigo de Sulley, su compañero de piso, su asistente en Monsters, Inc., y posteriormente su co-presidente en la empresa tras los eventos en la película. '),(11,'Wall-e','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLGdvOdEBhxArzvPOcri-qFpkPvP5Y8u6GRQXFWu8Nh_ENFflNaXoOmPvtI1Xj0Defs8&usqp=CAU',102,8,'Robot de limpieza que quedó abandonado en la tierra'),(12,'Phineas','https://cinematicos.net/wp-content/uploads/l-intro-1619201629.jpg',10,22,'Niño común que le gusta constrir cosas con su hermano.'),(13,'Kick Butowski','https://static.wikia.nocookie.net/disney/images/b/b4/KickButtowski1.png/revision/latest/top-crop/width/360/height/450?cb=20140103155633&path-prefix=es',12,30,'Niño acróbata amante del peligro.'),(16,'Sullivan','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Sulley_Drawing_%2811377514373%29.jpg/245px-Sulley_Drawing_%2811377514373%29.jpg',24,200,'James P. \'Sulley\' Sullivan es un personaje de las películas de Disney Pixar, Monsters, Inc. y Monsters University. Es un monstruo verde, con manchas moradas, gigante y con dos cuernos en su cabeza  ');
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
  CONSTRAINT `personajes_pelis_series_FK` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personajes_pelis_series_FK_1` FOREIGN KEY (`id_peli_serie`) REFERENCES `pelis_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes_pelis_series`
--

LOCK TABLES `personajes_pelis_series` WRITE;
/*!40000 ALTER TABLE `personajes_pelis_series` DISABLE KEYS */;
INSERT INTO `personajes_pelis_series` VALUES (3,2,4),(2,3,1),(1,3,2),(10,4,3),(11,5,12),(6,6,7),(7,6,8),(4,7,10),(5,7,16),(8,9,7),(9,9,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'$2a$10$dU/AdClDQ8Z0Nn9e25cNKeBoiu9J8dYIfP6IJ3PqRqnOO4rDXaZKa','usuario@ejemplo.com',1);
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

-- Dump completed on 2022-04-29 18:01:02

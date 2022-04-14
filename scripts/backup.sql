-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: db_app_db2
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `leitor`
--

DROP TABLE IF EXISTS `leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitor` (
  `leitor_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `sexo` varchar(100) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  PRIMARY KEY (`leitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--

LOCK TABLES `leitor` WRITE;
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` VALUES (1,'Cassiel Nallem','Masculino','2001-06-06'),(2,'João Marmentini','Masculino','2001-01-01'),(3,'Gustavo Bartelle','Masculino','2001-02-02'),(4,'Victor Queiroz','Masculino','2001-03-03'),(5,'Natanael Verona Minossi','Masculino','2001-04-04'),(6,'Loki','Masculino','2001-05-05'),(7,'Carlito','Masculino','2001-06-06');
/*!40000 ALTER TABLE `leitor` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `amizade`
--

DROP TABLE IF EXISTS `amizade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amizade` (
  `leitor1` int NOT NULL,
  `leitor2` int NOT NULL,
  PRIMARY KEY (`leitor1`,`leitor2`),
  KEY `amizade_leitor2` (`leitor2`),
  CONSTRAINT `amizade_leitor1` FOREIGN KEY (`leitor1`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `amizade_leitor2` FOREIGN KEY (`leitor2`) REFERENCES `leitor` (`leitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amizade`
--

LOCK TABLES `amizade` WRITE;
/*!40000 ALTER TABLE `amizade` DISABLE KEYS */;
INSERT INTO `amizade` VALUES (1,2),(1,3),(2,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(1,6),(2,6),(3,6),(1,7),(2,7);
/*!40000 ALTER TABLE `amizade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autor_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  PRIMARY KEY (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Leonardo Bortolini','2000-05-10'),(2,'Guilherme Giordani','2000-10-08'),(3,'Arthur Bassoto Ziero','2001-02-02'),(4,'Cleber Macieski','1992-12-03');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `livro_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `data_primeira_publicação` date DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `autor` int DEFAULT NULL,
  `tipo_de_capa` varchar(100) DEFAULT NULL,
  `quantidade_paginas` int DEFAULT NULL,
  PRIMARY KEY (`livro_id`),
  KEY `autor_fk` (`autor`),
  CONSTRAINT `autor_fk` FOREIGN KEY (`autor`) REFERENCES `autor` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (29,'Livro do a','2008-06-06','Terror',1,'Dura',150),(30,'Livro do b','2009-06-06','Suspense',2,'Dura',200),(31,'Livro do c','2010-06-06','Ação',2,'Dura',250),(32,'Livro do d','2011-06-06','Drama',3,'Dura',300),(33,'Livro do e','2012-06-06','Infantil',3,'Dura',350),(34,'Livro do f','2013-06-06','Terror',4,'Dura',400),(35,'Livro do g','2013-06-06','Terror',4,'Dura',150),(36,'Livro do h','2013-06-06','Terror',3,'Dura',200),(37,'Livro do i','2013-06-06','Terror',3,'Dura',250),(38,'Livro do j','2013-06-06','Terror',2,'Dura',300),(39,'Livro do l','2013-06-06','Terror',2,'Dura',350),(40,'Livro do m','2013-06-06','Terror',1,'Dura',400),(41,'Livro do n','2013-06-06','Terror',1,'Dura',450),(42,'Livro do 0','2013-06-06','Terror',3,'Dura',150);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `leitura_id` int NOT NULL AUTO_INCREMENT,
  `leitor` int NOT NULL,
  `livro` int NOT NULL,
  `inicio_leitura` date DEFAULT NULL,
  `fim_leitura` date DEFAULT NULL,
  `classificacao` smallint DEFAULT NULL,
  PRIMARY KEY (`leitura_id`),
  KEY `leitura_leitor` (`leitor`),
  KEY `leitura_livro` (`livro`),
  CONSTRAINT `leitura_leitor` FOREIGN KEY (`leitor`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `leitura_livro` FOREIGN KEY (`livro`) REFERENCES `livro` (`livro_id`),
  CONSTRAINT `classificacao_chk` CHECK (((`classificacao` >= 0) and (`classificacao` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
INSERT INTO `leitura` VALUES (1,1,29,'2011-06-06','2012-06-06',9),(2,2,30,'2012-06-06','2013-06-06',8),(3,3,31,'2013-06-06','2014-06-06',7),(4,4,31,'2014-06-06','2015-06-06',10),(5,5,32,'2015-06-06','2016-06-06',6),(6,6,32,'2016-06-06','2017-06-06',6),(7,7,33,'2017-06-06','2018-06-06',6),(8,1,35,'2018-06-06','2019-06-06',9),(9,2,35,'2019-06-06','2020-06-06',8),(10,3,32,'2020-06-06','2021-06-06',5),(11,4,31,'2021-06-06','2022-06-06',3);
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-14 22:56:32
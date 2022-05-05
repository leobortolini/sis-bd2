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
-- Table structure for table `amizade`
--

DROP TABLE IF EXISTS `amizade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amizade` (
  `leitor1` int NOT NULL,
  `leitor2` int NOT NULL,
  PRIMARY KEY (`leitor1`,`leitor2`),
  KEY `amizade_leitor2_fk` (`leitor2`),
  CONSTRAINT `amizade_leitor1_fk` FOREIGN KEY (`leitor1`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `amizade_leitor2_fk` FOREIGN KEY (`leitor2`) REFERENCES `leitor` (`leitor_id`)
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
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `biblioteca_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `leitor_id` int NOT NULL,
  PRIMARY KEY (`biblioteca_id`),
  KEY `biblioteca_leitor_fk` (`leitor_id`),
  CONSTRAINT `biblioteca_leitor_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitor` (`leitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,'Casseteca','Biblioteca padrao do Cassiel',1),(2,'Marmenteca','Biblioteca de livros de leitura cotidiana',2),(3,'Bartelleca','Meus livros favoritos',3),(4,'Viteca','Piores livros que já li',4),(5,'Norteca','Melhores livros que ja li',5),(6,'Loki teca',NULL,6),(7,'Carlitoteca',NULL,7),(8,'Cassiel Selection','Melhores livros',1),(9,'Marmens favorites','Leitura simples',2);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_livro`
--

DROP TABLE IF EXISTS `biblioteca_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_livro` (
  `biblioteca_id` int NOT NULL,
  `livro_id` int NOT NULL,
  PRIMARY KEY (`biblioteca_id`,`livro_id`),
  KEY `biblioteca_livro_livro_fk` (`livro_id`),
  CONSTRAINT `biblioteca_livro_biblioteca_fk` FOREIGN KEY (`biblioteca_id`) REFERENCES `biblioteca` (`biblioteca_id`),
  CONSTRAINT `biblioteca_livro_livro_fk` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_livro`
--

LOCK TABLES `biblioteca_livro` WRITE;
/*!40000 ALTER TABLE `biblioteca_livro` DISABLE KEYS */;
INSERT INTO `biblioteca_livro` VALUES (1,1),(2,1),(6,1),(1,2),(2,2),(3,2),(7,2),(3,3),(8,3),(4,4),(9,4),(1,5),(5,5),(2,6),(6,6),(3,7),(7,7),(4,8),(8,8),(5,9),(9,9),(1,10),(6,10),(2,11),(7,11),(3,12),(8,12),(4,13),(9,13),(1,14),(5,14);
/*!40000 ALTER TABLE `biblioteca_livro` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `leitor_livro`
--

DROP TABLE IF EXISTS `leitor_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitor_livro` (
  `leitor_id` int NOT NULL,
  `livro_id` int NOT NULL,
  PRIMARY KEY (`leitor_id`,`livro_id`),
  KEY `leitor_livro_livro_fk` (`livro_id`),
  CONSTRAINT `leitor_livro_leitor_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `leitor_livro_livro_fk` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor_livro`
--

LOCK TABLES `leitor_livro` WRITE;
/*!40000 ALTER TABLE `leitor_livro` DISABLE KEYS */;
INSERT INTO `leitor_livro` VALUES (1,1),(7,1),(1,2),(2,2),(2,3),(3,3),(4,4),(5,5),(6,6),(7,7),(1,8),(2,9),(3,10),(4,11),(5,12),(6,13);
/*!40000 ALTER TABLE `leitor_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `leitura_id` int NOT NULL AUTO_INCREMENT,
  `leitor_id` int NOT NULL,
  `livro_id` int NOT NULL,
  `inicio_leitura` date DEFAULT NULL,
  `fim_leitura` date DEFAULT NULL,
  `classificacao` smallint DEFAULT NULL,
  PRIMARY KEY (`leitura_id`),
  KEY `leitura_leitor_fk` (`leitor_id`),
  KEY `leitura_livro_fk` (`livro_id`),
  CONSTRAINT `leitura_leitor_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `leitura_livro_fk` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`livro_id`),
  CONSTRAINT `classificacao_chk` CHECK (((`classificacao` >= 0) and (`classificacao` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
INSERT INTO `leitura` VALUES (23,1,1,'2011-06-06','2012-06-06',9),(24,2,1,'2012-06-06','2013-06-06',8),(25,3,2,'2013-06-06','2014-06-06',7),(26,4,2,'2014-06-06','2015-06-06',10),(27,5,2,'2015-06-06','2016-06-06',6),(28,6,3,'2016-06-06','2017-06-06',6),(29,7,3,'2017-06-06','2018-06-06',6),(30,1,3,'2018-06-06','2019-06-06',9),(31,2,4,'2019-06-06','2020-06-06',8),(32,3,4,'2020-06-06','2021-06-06',5),(33,4,4,'2021-06-06','2022-06-06',3);
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
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
  `autor_id` int DEFAULT NULL,
  `tipo_de_capa` varchar(100) DEFAULT NULL,
  `quantidade_paginas` int DEFAULT NULL,
  PRIMARY KEY (`livro_id`),
  KEY `livro_autor_fk` (`autor_id`),
  CONSTRAINT `livro_autor_fk` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Livro do a','2008-06-06','Terror',1,'Dura',150),(2,'Livro do b','2009-06-06','Suspense',2,'Dura',200),(3,'Livro do c','2010-06-06','Ação',2,'Dura',250),(4,'Livro do d','2011-06-06','Drama',3,'Dura',300),(5,'Livro do e','2012-06-06','Infantil',3,'Dura',350),(6,'Livro do f','2013-06-06','Terror',4,'Dura',400),(7,'Livro do g','2013-06-06','Terror',4,'Dura',150),(8,'Livro do h','2013-06-06','Terror',3,'Dura',200),(9,'Livro do i','2013-06-06','Terror',3,'Dura',250),(10,'Livro do j','2013-06-06','Terror',2,'Dura',300),(11,'Livro do l','2013-06-06','Terror',2,'Dura',350),(12,'Livro do m','2013-06-06','Terror',1,'Dura',400),(13,'Livro do n','2013-06-06','Terror',1,'Dura',450),(14,'Livro do 0','2013-06-06','Terror',3,'Dura',150);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15  5:01:40

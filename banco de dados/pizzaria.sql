-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbpizzariafrajolas
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `tbl_ambiente`
--

DROP TABLE IF EXISTS `tbl_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ambiente` (
  `idAmbiente` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(60) NOT NULL,
  `numero` decimal(5,0) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `imagem` varchar(45) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  PRIMARY KEY (`idAmbiente`),
  KEY `fk_ambiente_pr_estado_idx` (`idEstado`),
  CONSTRAINT `fk_ambiente_pr_estado` FOREIGN KEY (`idEstado`) REFERENCES `tblestado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ambiente`
--

LOCK TABLES `tbl_ambiente` WRITE;
/*!40000 ALTER TABLE `tbl_ambiente` DISABLE KEYS */;
INSERT INTO `tbl_ambiente` VALUES (27,'OOO',0,'OOO','55555',1,'arquivos/017.jpg','PPPP'),(29,'Rua do Inferno, 666 456',123,'testesdfsf','40028922',1,'arquivos/pentagrama_dragao.jpg','teste dsfsdfdsf'),(30,'dvdfpvdsf',5456,'fdgdfg','86867868',1,'arquivos/016-s99x66.jpg','fcgd');
/*!40000 ALTER TABLE `tbl_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao`
--

DROP TABLE IF EXISTS `tbl_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) DEFAULT NULL,
  `avaliacao` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produt_idx` (`idProduto`),
  CONSTRAINT `fk_produt` FOREIGN KEY (`idProduto`) REFERENCES `tbl_produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao`
--

LOCK TABLES `tbl_avaliacao` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(80) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `fk_produto_idx` (`idProduto`),
  CONSTRAINT `fk_produtos` FOREIGN KEY (`idProduto`) REFERENCES `tbl_produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_curiosidade`
--

DROP TABLE IF EXISTS `tbl_curiosidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_curiosidade` (
  `idCuriosidade` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `imagem` varchar(45) NOT NULL,
  `conteudo` text NOT NULL,
  PRIMARY KEY (`idCuriosidade`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_curiosidade`
--

LOCK TABLES `tbl_curiosidade` WRITE;
/*!40000 ALTER TABLE `tbl_curiosidade` DISABLE KEYS */;
INSERT INTO `tbl_curiosidade` VALUES (3,'teste','arquivos/738cccd4fda172441f216712a488dca6.jpg','dadad'),(7,'minha curiosidade','arquivos/images.jpg','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.');
/*!40000 ALTER TABLE `tbl_curiosidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel_usuario`
--

DROP TABLE IF EXISTS `tbl_nivel_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nivel_usuario` (
  `idNivel` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nivel_usuario`
--

LOCK TABLES `tbl_nivel_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_nivel_usuario` DISABLE KEYS */;
INSERT INTO `tbl_nivel_usuario` VALUES (1,'camila','1'),(2,'camila','1'),(3,'camila','1'),(5,'coco','zsf'),(6,'mateus','fefe'),(7,'Luana',''),(8,'CATALOGISTA','CT'),(9,'eu','teste eu');
/*!40000 ALTER TABLE `tbl_nivel_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizzames`
--

DROP TABLE IF EXISTS `tbl_pizzames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pizzames` (
  `idPizzaMes` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `imagem` varchar(45) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`idPizzaMes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizzames`
--

LOCK TABLES `tbl_pizzames` WRITE;
/*!40000 ALTER TABLE `tbl_pizzames` DISABLE KEYS */;
INSERT INTO `tbl_pizzames` VALUES (1,'teste','arquivos/016-s99x66.jpg','jk'),(3,'teste','','jkkjkgh8bvju7vbj8i'),(5,'Corrida','arquivos/pentagrama_dragao.jpg','asdasds');
/*!40000 ALTER TABLE `tbl_pizzames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produtos`
--

DROP TABLE IF EXISTS `tbl_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produtos` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `preco` varchar(50) DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `ingrediente` varchar(255) DEFAULT NULL,
  `informacaoNutri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produtos`
--

LOCK TABLES `tbl_produtos` WRITE;
/*!40000 ALTER TABLE `tbl_produtos` DISABLE KEYS */;
INSERT INTO `tbl_produtos` VALUES (1,'teste','100','imgPizza/1900.jpeg','cdsfdsf','dwqdq','qwqwqw'),(2,'testee','44','imgPizza/calabresa.jpg','gdfg','gg','gfg'),(3,'gfdg','56','imgPizza/ggfdf.jpg','dfsdf','fdf','fdf');
/*!40000 ALTER TABLE `tbl_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promocao`
--

DROP TABLE IF EXISTS `tbl_promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_promocao` (
  `idPromocao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  `conteudo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPromocao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promocao`
--

LOCK TABLES `tbl_promocao` WRITE;
/*!40000 ALTER TABLE `tbl_promocao` DISABLE KEYS */;
INSERT INTO `tbl_promocao` VALUES (4,'Minha promoção 2222','arquivos/hqdefault (1).jpg','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.');
/*!40000 ALTER TABLE `tbl_promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sobre`
--

DROP TABLE IF EXISTS `tbl_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sobre` (
  `idSobre` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(155) NOT NULL,
  `conteudo` text,
  PRIMARY KEY (`idSobre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sobre`
--

LOCK TABLES `tbl_sobre` WRITE;
/*!40000 ALTER TABLE `tbl_sobre` DISABLE KEYS */;
INSERT INTO `tbl_sobre` VALUES (11,'sobre','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.');
/*!40000 ALTER TABLE `tbl_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sub_categoria`
--

DROP TABLE IF EXISTS `tbl_sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sub_categoria` (
  `idSub` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSub`),
  KEY `fk_produto_idx` (`idProduto`),
  CONSTRAINT `fk_produto` FOREIGN KEY (`idProduto`) REFERENCES `tbl_produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sub_categoria`
--

LOCK TABLES `tbl_sub_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_sub_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (3,'camila','011 45677889','ff@dsfds','F','camila','123',1),(5,'bcfh','566','77777','F','gfdgf','344',1),(6,'bcfh','566555','tfh','F','gfdgf','344',1),(7,'0000000','011 45677889','ff@dsfds','F','camila','555555',1),(8,'Marcel','1234567898','marcel@gmail.com','M','marcelnt','123',8),(9,'Marcel 123','1234567898','marcel@gmail.com','F','marcelnt','123',1);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestado`
--

DROP TABLE IF EXISTS `tblestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblestado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestado`
--

LOCK TABLES `tblestado` WRITE;
/*!40000 ALTER TABLE `tblestado` DISABLE KEYS */;
INSERT INTO `tblestado` VALUES (1,'AC','Acre'),(2,'AL','Alagoas'),(3,'AP','Amapá'),(4,'AM','Amazonas'),(5,'BA','Bahia'),(6,'CE','Ceará'),(7,'DF','Distrito Federal'),(8,'ES','Espírito Santo'),(9,'GO','Goiás'),(10,'MA','Maranhão'),(11,'MT','Mato Grosso'),(12,'MS','Mato Grosso do Sul'),(13,'MG','Minas Gerais'),(14,'PA','Pará'),(15,'PB','Paraíba'),(16,'PR','Paraná'),(17,'PE','Pernambuco'),(18,'PI','Piauí'),(19,'RJ','Rio de Janeiro'),(20,'RN','Rio Grande do Norte'),(21,'RS','Rio Grande do Sul'),(22,'RO','Rondônia'),(23,'RR','Roraima'),(24,'SC','Santa Catarina'),(25,'SP','São Paulo'),(26,'SE','Sergipe'),(27,'TO','Tocantins');
/*!40000 ALTER TABLE `tblestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfaleconosco`
--

DROP TABLE IF EXISTS `tblfaleconosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfaleconosco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sugestao` varchar(255) DEFAULT NULL,
  `informacao` varchar(255) DEFAULT NULL,
  `profissao` varchar(255) NOT NULL,
  `sexo` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfaleconosco`
--

LOCK TABLES `tblfaleconosco` WRITE;
/*!40000 ALTER TABLE `tblfaleconosco` DISABLE KEYS */;
INSERT INTO `tblfaleconosco` VALUES (6,'cyntia','34344353654','4354664','rerew@dgfg','http://www.css-validator.org/v','http://www.css-validator.org/v','dgsg','gdg','dsf','F'),(7,'Vinny','011 45677889','011 99999999','vv@vv','http://localhost/inf3m/Trabalh','http://localhost/inf3m/Trabalh','eeeeeeeeeeeeeeeeeeeezs dsvcf','rfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrfrf','ew','M'),(8,'Pizzaria','011 45677889','011 99999999','vv@vv','http://localhost/inf3m/Trabalh','http://localhost/inf3m/Trabalh','sfdddddddddddd','ddddssss','ds','F'),(9,'Camila','34344353654','3474367467','rerew@dgfg','http://www.css-validator.org/v','http://www.css-validator.org/v','fsdf','efdsf','ef','F');
/*!40000 ALTER TABLE `tblfaleconosco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-12 10:41:51

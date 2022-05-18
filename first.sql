/*
SQLyog Community Edition- MySQL GUI v7.02 
MySQL - 5.1.59-community : Database - dns
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dns` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dns`;

/*Table structure for table `ipdet` */

DROP TABLE IF EXISTS `ipdet`;

CREATE TABLE `ipdet` (
  `sno` int(100) NOT NULL AUTO_INCREMENT,
  `sourc` varchar(100) DEFAULT NULL,
  `dest` varchar(100) DEFAULT NULL,
  `proto` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `pos` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'noattack',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ipdet` */

/*Table structure for table `managerreg` */

DROP TABLE IF EXISTS `managerreg`;

CREATE TABLE `managerreg` (
  `name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `gen` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `ip1` varchar(100) DEFAULT NULL,
  `macc` varchar(100) DEFAULT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `epass` varchar(100) DEFAULT NULL,
  `egen` varchar(100) DEFAULT NULL,
  `edob` varchar(100) DEFAULT NULL,
  `ema` varchar(100) DEFAULT NULL,
  `econ` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `managerreg` */

insert  into `managerreg`(`name`,`pass`,`gen`,`dob`,`mail`,`contact`,`ip1`,`macc`,`ename`,`epass`,`egen`,`edob`,`ema`,`econ`) values ('Arun','aa','Male','2018-10-04','arunjs46@gmail.com','8870856479','192.168.1.2','00-E0-4C-4C-CC-AB','5455c33e251ab225e5c61c67e1902769','4124bca9335c27f86f24ba207a4912','63889cfb9d3cbe5d1bd2be5cc9953fd','837d31c644171bbdd9385779e9a8d228','fa5ccdebbdd2b2c69d65636a3a2dc5e','d83bc6a79ebbea8a4ba762fae512046'),('vinodh','vv','Male','2018-10-04','vinodhdeva4@gmail.com','08870856479','192.168.1.2','00-E0-4C-4C-CC-AB','471124b6c474adfa1522497965153494','c455e3a20b6b3af3d1059ea446ef6c','63889cfb9d3cbe5d1bd2be5cc9953fd','837d31c644171bbdd9385779e9a8d228','6d376228ea0444a9ca7cb4b54b88f7','83cd20997514aeecb19522c36cd6c4a6'),('suresh','ss','Male','2018-10-10','arunjs46@gmail.com','08870856479','192.168.1.2','00-E0-4C-4C-CC-AB','487cc982f7db39c51695026e4bdc692','3691308f2a4c2f6983f288d32e29c84','63889cfb9d3cbe5d1bd2be5cc9953fd','235db96de9401dbe26cab73c4047544','fa5ccdebbdd2b2c69d65636a3a2dc5e','83cd20997514aeecb19522c36cd6c4a6'),('aakash','aa','Male','2018-10-10','aakash.kanthraj@gmail.com','8870856479','192.168.1.2','00-E0-4C-4C-CC-AB','a870c412ce2eaa3b6a4c59cb786f76','4124bca9335c27f86f24ba207a4912','63889cfb9d3cbe5d1bd2be5cc9953fd','235db96de9401dbe26cab73c4047544','18db191a58d1dda68b354bdf032ce90','d83bc6a79ebbea8a4ba762fae512046');

/*Table structure for table `nodes` */

DROP TABLE IF EXISTS `nodes`;

CREATE TABLE `nodes` (
  `ip1` varchar(100) DEFAULT 'ipadd',
  `nodeAdd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nodes` */

insert  into `nodes`(`ip1`,`nodeAdd`) values ('ipadd','192.168.1.3'),('ipadd','192.168.1.4'),('ipadd','192.168.1.5'),('ipadd','192.168.1.14'),('ipadd','192.168.1.1'),('ipadd','192.168.1.4'),('ipadd','192.168.1.5'),('ipadd','192.168.1.6'),('ipadd','192.168.1.9'),('ipadd','192.168.1.10'),('ipadd','192.168.1.14'),('ipadd','192.168.1.16'),('ipadd','192.168.1.1'),('ipadd','192.168.1.2'),('ipadd','192.168.1.3'),('ipadd','192.168.1.5'),('ipadd','192.168.1.6'),('ipadd','192.168.1.9'),('ipadd','192.168.1.10'),('ipadd','192.168.1.16'),('ipadd','192.168.1.17'),('ipadd','192.168.1.1'),('ipadd','192.168.1.2'),('ipadd','192.168.1.3'),('ipadd','192.168.1.9'),('ipadd','192.168.1.10'),('ipadd','192.168.1.14'),('ipadd','192.168.1.16'),('ipadd','192.168.1.17'),('ipadd','192.168.1.1'),('ipadd','192.168.1.2'),('ipadd','192.168.1.3'),('ipadd','192.168.1.5'),('ipadd','192.168.1.6'),('ipadd','192.168.1.9'),('ipadd','192.168.1.10'),('ipadd','192.168.1.13'),('ipadd','192.168.1.14'),('ipadd','192.168.1.16'),('ipadd','192.168.1.18');

/*Table structure for table `reg` */

DROP TABLE IF EXISTS `reg`;

CREATE TABLE `reg` (
  `name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `con` varchar(100) DEFAULT NULL,
  `sourceip` varchar(100) DEFAULT NULL,
  `mac` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reg` */

insert  into `reg`(`name`,`pass`,`gender`,`dob`,`mail`,`con`,`sourceip`,`mac`) values ('arun','aa','Male','1992-04-01','arunjs46@gmail.com','08870856479','192.168.1.12','20-E4-16-00-61-0C');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

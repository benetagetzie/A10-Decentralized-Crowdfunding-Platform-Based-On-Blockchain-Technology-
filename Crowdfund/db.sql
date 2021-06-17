/*
SQLyog - Free MySQL GUI v5.13
Host - 5.0.22-community-nt : Database - crowdfund
*********************************************************************
Server version : 5.0.22-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `crowdfund`;

USE `crowdfund`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert into `admin` (`username`,`password`) values ('admin','admin');

/*Table structure for table `charity` */

DROP TABLE IF EXISTS `charity`;

CREATE TABLE `charity` (
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `phonenumber` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `charity` */

insert into `charity` (`username`,`password`,`email`,`phonenumber`) values ('Harini','harini','beneta.2303@gmail.com','8754453634');
insert into `charity` (`username`,`password`,`email`,`phonenumber`) values ('Deepika','deepika','abc@gmail.com','8765467812');
insert into `charity` (`username`,`password`,`email`,`phonenumber`) values ('aaaaa','aaa','aaa','123');

/*Table structure for table `donor` */

DROP TABLE IF EXISTS `donor`;

CREATE TABLE `donor` (
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `phonenumber` varchar(200) default NULL,
  `accno` varchar(200) default NULL,
  `ccv` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `donor` */

insert into `donor` (`username`,`password`,`email`,`phonenumber`,`accno`,`ccv`) values ('Beneta','beneta','beneta.2303@gmail.com','8754453634','123456789012','123');

/*Table structure for table `fund` */

DROP TABLE IF EXISTS `fund`;

CREATE TABLE `fund` (
  `name` varchar(200) default NULL,
  `amount` varchar(200) default NULL,
  `phonenumber` varchar(200) default NULL,
  `description` varchar(200) default NULL,
  `date` date default NULL,
  `ad` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fund` */

insert into `fund` (`name`,`amount`,`phonenumber`,`description`,`date`,`ad`) values ('Harini','-10000','8754453634','operation','2021-03-25','984087234512');
insert into `fund` (`name`,`amount`,`phonenumber`,`description`,`date`,`ad`) values ('Deepika','15000','8754432112','Eye disease','2021-03-25','678900876512');
insert into `fund` (`name`,`amount`,`phonenumber`,`description`,`date`,`ad`) values ('aaa','100','123','operation','2021-03-27','12');
insert into `fund` (`name`,`amount`,`phonenumber`,`description`,`date`,`ad`) values ('AAA','20000','9876543210','operation','2021-03-30','12345678012');
insert into `fund` (`name`,`amount`,`phonenumber`,`description`,`date`,`ad`) values ('Aishu','15000','9791672201','operation','2021-03-31','12345678009');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `amount` varchar(200) default NULL,
  `accno` varchar(200) default NULL,
  `email` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert into `payment` (`amount`,`accno`,`email`) values ('15000','123456789102','blessing.2109@gmail.com');
insert into `payment` (`amount`,`accno`,`email`) values ('15000','123456789102','blessing.2109@gmail.com');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `fname` varchar(255) default NULL,
  `frname` varchar(255) default NULL,
  `accno` varchar(255) default NULL,
  `amount` varchar(255) default NULL,
  `date` date NOT NULL,
  `time` varchar(255) default NULL,
  `email` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

insert into `transaction` (`fname`,`frname`,`accno`,`amount`,`date`,`time`,`email`) values ('Beneta','Deepika','123456789012','5000','2021-03-31','14:05','beneta.2303@gmail.com');

SET SQL_MODE=@OLD_SQL_MODE;
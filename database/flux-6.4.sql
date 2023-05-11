
--
-- Table structure for table `accessnumber`
--

DROP TABLE IF EXISTS `accessnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessnumber` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_number` varchar(25) DEFAULT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `description` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active and 1 for inactive',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessnumber`
--

LOCK TABLES `accessnumber` WRITE;
/*!40000 ALTER TABLE `accessnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_unverified`
--

DROP TABLE IF EXISTS `account_unverified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_unverified` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `timezone_id` int NOT NULL,
  `otp` int NOT NULL,
  `retries` int NOT NULL,
  `client_ip` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_unverified`
--

LOCK TABLES `account_unverified` WRITE;
/*!40000 ALTER TABLE `account_unverified` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_unverified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reseller_id` int DEFAULT NULL COMMENT 'Resellers account id',
  `pricelist_id` int NOT NULL COMMENT 'pricelist table id',
  `paypal_permission` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `reference` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:active,1:inactive',
  `sweep_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Sweep list table id',
  `creation` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `credit_limit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `posttoexternal` tinyint(1) NOT NULL DEFAULT '0',
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `password` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(40) NOT NULL DEFAULT '',
  `last_name` varchar(40) NOT NULL DEFAULT '',
  `company_name` varchar(40) NOT NULL DEFAULT '',
  `address_1` varchar(80) NOT NULL DEFAULT '',
  `address_2` varchar(80) NOT NULL DEFAULT '',
  `postal_code` varchar(12) NOT NULL DEFAULT '',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country_id` int NOT NULL DEFAULT '0' COMMENT 'Country table id',
  `telephone_1` varchar(20) NOT NULL DEFAULT '',
  `telephone_2` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `notification_email` varchar(80) NOT NULL DEFAULT '',
  `language_id` int NOT NULL DEFAULT '0' COMMENT 'language table id',
  `currency_id` int NOT NULL DEFAULT '0' COMMENT 'Currency table id',
  `maxchannels` int NOT NULL DEFAULT '1',
  `cps` int NOT NULL DEFAULT '0',
  `dialed_modify` mediumtext NOT NULL,
  `type` tinyint(1) DEFAULT '0',
  `timezone_id` int NOT NULL DEFAULT '0' COMMENT 'timezone table id',
  `inuse` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `notify_credit_limit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `notify_flag` tinyint(1) NOT NULL,
  `notify_email` varchar(80) NOT NULL,
  `commission_rate` int NOT NULL DEFAULT '0',
  `invoice_day` int NOT NULL DEFAULT '0',
  `invoice_interval` int NOT NULL,
  `invoice_note` text NOT NULL,
  `last_bill_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pin` varchar(20) NOT NULL,
  `first_used` datetime NOT NULL,
  `expiry` datetime NOT NULL,
  `validfordays` int NOT NULL DEFAULT '3652',
  `local_call_cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `pass_link_status` tinyint(1) NOT NULL DEFAULT '0',
  `local_call` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:enable,0:disable',
  `charge_per_min` varchar(100) NOT NULL,
  `is_recording` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for On,1 for Off',
  `allow_ip_management` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:enable,0:disable',
  `permission_id` int NOT NULL DEFAULT '0',
  `deleted_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `localization_id` int DEFAULT '0',
  `notifications` tinyint NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `is_distributor` tinyint NOT NULL DEFAULT '1' COMMENT '0 for yes and 1 for No ',
  `generate_invoice` tinyint NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `std_cid_translation` varchar(100) NOT NULL,
  `did_cid_translation` varchar(100) NOT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `pricelist` (`pricelist_id`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin',0,0,0,'',0,2,'2016-07-25 00:00:01',0.00000,0,1.00000,'8xbJv9wZmjA','Administrator','Admin','Your Company','ADDRESS','','','','',28,'','','your@email.com','',1,16,1,0,'',-1,78,0,0,0.00000,0,'0',0,0,0,'','0000-00-00 00:00:00','','2016-07-26 11:26:24','2046-07-25 11:26:24',60000,0.00000,0,0,'1',0,0,0,'1000-01-01 00:00:00',0,0,1,0,'','',NULL),(2,'4727985745',0,1,0,'',0,2,'2016-07-25 11:26:24',0.00000,0,677.00000,'dOxAtqeO7E6A-wGlILTl-RLbYiySAwss','default','customer','FLUX','adress','','','','',28,'','','yourcustomer@test.com','yourcustomer@test.com',0,16,1,0,'',0,78,0,0,0.00000,0,'',0,1,0,'','0000-00-00 00:00:00','4727985745','2016-07-26 11:26:24','2046-07-25 11:26:24',3652,0.00000,0,0,'1',0,0,0,'1000-01-01 00:00:00',0,0,1,0,'','',''),(3,'3673942894',0,1,0,'',0,2,'2016-07-26 15:15:20',0.00000,0,0.00000,'lzq1UjaoM44Ed2D07iQY8RLbYiySAwss','default','provider','FLUX','adress','','','','',28,'','','yourprovider@test.com','',0,16,0,0,'',3,78,0,0,0.00000,0,'',0,1,0,'','0000-00-00 00:00:00','320736','0000-00-00 00:00:00','2026-07-26 15:12:18',0,0.00000,0,0,'',0,0,0,'1000-01-01 00:00:00',0,0,1,0,'','','');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_callerid`
--

DROP TABLE IF EXISTS `accounts_callerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_callerid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL DEFAULT '0',
  `callerid_name` varchar(30) NOT NULL DEFAULT '',
  `callerid_number` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 active 1 inactive',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_callerid`
--

LOCK TABLES `accounts_callerid` WRITE;
/*!40000 ALTER TABLE `accounts_callerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_callerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cdr_summary`
--

DROP TABLE IF EXISTS `accounts_cdr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cdr_summary` (
  `date_hour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `country_id` int NOT NULL,
  `account_entity_id` int NOT NULL,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `total_calls` int NOT NULL,
  `answered_calls` smallint NOT NULL,
  `minutes` smallint NOT NULL,
  `debit` decimal(20,5) NOT NULL,
  `cost` decimal(20,5) NOT NULL,
  `acd` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_hour`,`country_id`,`account_id`,`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cdr_summary`
--

LOCK TABLES `accounts_cdr_summary` WRITE;
/*!40000 ALTER TABLE `accounts_cdr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cdr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(30) NOT NULL,
  `version` varchar(10) NOT NULL,
  `installed_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  `files` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ani_map`
--

DROP TABLE IF EXISTS `ani_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ani_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL DEFAULT '',
  `accountid` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Active,1-inactive',
  `context` varchar(20) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `account` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ani_map`
--

LOCK TABLES `ani_map` WRITE;
/*!40000 ALTER TABLE `ani_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ani_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_database`
--

DROP TABLE IF EXISTS `backup_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_database` (
  `id` int NOT NULL AUTO_INCREMENT,
  `backup_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_database`
--

LOCK TABLES `backup_database` WRITE;
/*!40000 ALTER TABLE `backup_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_patterns`
--

DROP TABLE IF EXISTS `block_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_patterns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL DEFAULT '0',
  `blocked_patterns` varchar(15) NOT NULL DEFAULT '',
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  KEY `blocked_patterns` (`blocked_patterns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_patterns`
--

LOCK TABLES `block_patterns` WRITE;
/*!40000 ALTER TABLE `block_patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calltype`
--

DROP TABLE IF EXISTS `calltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calltype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `call_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active,1 for inactive,2 for delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calltype`
--

LOCK TABLES `calltype` WRITE;
/*!40000 ALTER TABLE `calltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `calltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 active 1 inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Package','PACKAGE','Package',0,'0000-00-00 00:00:00'),(3,'Refill','REFILL','Rfill',0,'0000-00-00 00:00:00'),(4,'DID','DID','DIDs',0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrs`
--

DROP TABLE IF EXISTS `cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs` (
  `uniqueid` varchar(60) NOT NULL DEFAULT '',
  `accountid` int DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `sip_user` varchar(20) NOT NULL DEFAULT '',
  `callerid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `callednum` varchar(30) NOT NULL DEFAULT '',
  `translated_dst` varchar(30) NOT NULL,
  `ct` int NOT NULL DEFAULT '0',
  `billseconds` smallint NOT NULL DEFAULT '0',
  `trunk_id` smallint NOT NULL DEFAULT '0',
  `trunkip` varchar(15) NOT NULL DEFAULT '',
  `callerip` varchar(15) NOT NULL DEFAULT '',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `callstart` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `debit` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_id` int NOT NULL DEFAULT '0',
  `pricelist_id` smallint NOT NULL DEFAULT '0',
  `package_id` int NOT NULL DEFAULT '0',
  `pattern` varchar(20) NOT NULL,
  `notes` varchar(80) NOT NULL,
  `invoiceid` int NOT NULL DEFAULT '0',
  `rate_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reseller_id` int NOT NULL DEFAULT '0',
  `reseller_code` varchar(20) NOT NULL,
  `reseller_code_destination` varchar(80) DEFAULT NULL,
  `reseller_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_code` varchar(20) NOT NULL,
  `provider_code_destination` varchar(80) NOT NULL,
  `provider_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_call_cost` decimal(20,6) NOT NULL,
  `call_direction` enum('outbound','inbound') NOT NULL,
  `calltype` varchar(80) NOT NULL DEFAULT 'Padrao',
  `billmsec` int NOT NULL DEFAULT '0',
  `answermsec` int NOT NULL DEFAULT '0',
  `waitmsec` int NOT NULL DEFAULT '0',
  `progress_mediamsec` int NOT NULL DEFAULT '0',
  `flow_billmsec` int NOT NULL DEFAULT '0',
  `is_recording` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for On,1 for Off',
  `call_request` tinyint NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `end_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `cdr_index` (`callstart`,`reseller_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cdrs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs`
--

LOCK TABLES `cdrs` WRITE;
/*!40000 ALTER TABLE `cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fluxuser`@`localhost`*/ /*!50003 TRIGGER `cdr_records` AFTER INSERT ON `cdrs` FOR EACH ROW BEGIN
   INSERT INTO `cdrs_staging` (`uniqueid`, `accountid`, `type`, `sip_user`, `callerid`, `callednum`, `translated_dst`, `ct`, `billseconds`, `trunk_id`, `trunkip`, `callerip`, `disposition`, `callstart`, `debit`, `cost`, `provider_id`, `pricelist_id`, `package_id`, `pattern`, `notes`, `invoiceid`, `rate_cost`, `reseller_id`, `reseller_code`, `reseller_code_destination`, `reseller_cost`, `provider_code`, `provider_code_destination`, `provider_cost`, `provider_call_cost`, `call_direction`, `calltype`, `billmsec`, `answermsec`, `waitmsec`, `progress_mediamsec`, `flow_billmsec`, `is_recording`, `call_request`, `country_id`,`end_stamp`) VALUES (NEW.uniqueid, NEW.accountid, NEW.type, NEW.sip_user, NEW.callerid, NEW.callednum, NEW.translated_dst, NEW.ct, NEW.billseconds, NEW.trunk_id, NEW.trunkip, NEW.callerip, NEW.disposition, NEW.callstart, NEW.debit, NEW.cost, NEW.provider_id, NEW.pricelist_id, NEW.package_id, NEW.pattern, NEW.notes, NEW.invoiceid, NEW.rate_cost, NEW.reseller_id, NEW.reseller_code, NEW.reseller_code_destination, NEW.reseller_cost, NEW.provider_code, NEW.provider_code_destination, NEW.provider_cost, NEW.provider_call_cost, NEW.call_direction, NEW.calltype, NEW.billmsec, NEW.answermsec, NEW.waitmsec, NEW.progress_mediamsec, NEW.flow_billmsec, NEW.is_recording, NEW.call_request, NEW.country_id,NEW.end_stamp);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cdrs_day_by_summary`
--

DROP TABLE IF EXISTS `cdrs_day_by_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs_day_by_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `type` tinyint NOT NULL,
  `country_id` int NOT NULL,
  `billseconds` int NOT NULL,
  `mcd` int NOT NULL,
  `total_calls` int NOT NULL,
  `debit` decimal(10,5) NOT NULL,
  `cost` decimal(10,5) NOT NULL,
  `total_answered_call` int NOT NULL,
  `total_fail_call` int NOT NULL,
  `unique_date` varchar(50) NOT NULL DEFAULT '00000000',
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`account_id`,`reseller_id`,`country_id`,`unique_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs_day_by_summary`
--

LOCK TABLES `cdrs_day_by_summary` WRITE;
/*!40000 ALTER TABLE `cdrs_day_by_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs_day_by_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrs_staging`
--

DROP TABLE IF EXISTS `cdrs_staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs_staging` (
  `uniqueid` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accountid` int DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `sip_user` varchar(20) NOT NULL DEFAULT '',
  `callerid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `callednum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `translated_dst` varchar(30) NOT NULL,
  `ct` int NOT NULL DEFAULT '0',
  `billseconds` smallint NOT NULL DEFAULT '0',
  `trunk_id` smallint NOT NULL DEFAULT '0',
  `trunkip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `callerip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `disposition` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `callstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `debit` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_id` int NOT NULL DEFAULT '0',
  `pricelist_id` smallint NOT NULL DEFAULT '0',
  `package_id` int NOT NULL DEFAULT '0',
  `pattern` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notes` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `invoiceid` int NOT NULL DEFAULT '0',
  `rate_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reseller_id` int NOT NULL DEFAULT '0',
  `reseller_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reseller_code_destination` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reseller_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provider_code_destination` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provider_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_call_cost` decimal(20,6) NOT NULL,
  `call_direction` enum('outbound','inbound') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calltype` varchar(80) NOT NULL DEFAULT 'Padrao',
  `billmsec` int NOT NULL DEFAULT '0',
  `answermsec` int NOT NULL DEFAULT '0',
  `waitmsec` int NOT NULL DEFAULT '0',
  `progress_mediamsec` int NOT NULL DEFAULT '0',
  `flow_billmsec` int NOT NULL DEFAULT '0',
  `is_recording` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for On,1 for Off',
  `call_request` tinyint NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `end_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs_staging`
--

LOCK TABLES `cdrs_staging` WRITE;
/*!40000 ALTER TABLE `cdrs_staging` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs_staging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) NOT NULL,
  `last_activity` int unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_group`
--

DROP TABLE IF EXISTS `cli_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cli_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL,
  `reseller_id` int DEFAULT '0' COMMENT 'Accoun',
  `mapping_expired_by` char(5) NOT NULL,
  `mapping_expired_after` char(5) NOT NULL,
  `assignment_method` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_access_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_group`
--

LOCK TABLES `cli_group` WRITE;
/*!40000 ALTER TABLE `cli_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `cli_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission`
--

DROP TABLE IF EXISTS `commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '0',
  `amount` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `commission` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `commission_rate` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `commission_status` varchar(10) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission`
--

LOCK TABLES `commission` WRITE;
/*!40000 ALTER TABLE `commission` DISABLE KEYS */;
/*!40000 ALTER TABLE `commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counters`
--

DROP TABLE IF EXISTS `counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL DEFAULT '0',
  `package_id` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL DEFAULT '0',
  `used_seconds` int NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `package_id` (`product_id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counters`
--

LOCK TABLES `counters` WRITE;
/*!40000 ALTER TABLE `counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrycode`
--

DROP TABLE IF EXISTS `countrycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_id` int NOT NULL,
  `iso` char(2) NOT NULL,
  `country` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `countrycode` int NOT NULL,
  `vat` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `capital` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrycode`
--

LOCK TABLES `countrycode` WRITE;
/*!40000 ALTER TABLE `countrycode` DISABLE KEYS */;
INSERT INTO `countrycode` VALUES (1,9,'AF','AFGHANISTAN','Afghanistan','AFG',93,0.00000,'33.9391','67.7100','Kabul'),(2,9,'AL','ALBANIA','Albania','ALB',355,0.00000,'41.153332','  20.168331','Tirana'),(3,2,'DZ','ALGERIA','Algeria','DZA',213,0.00000,'28.0339','1.6596','Algiers'),(4,139,'AS','AMERICAN SAMOA','American Samoa','ASM',1684,0.00000,'-14.270972','-170.132217','Pago Pago'),(5,46,'AD','ANDORRA','Andorra','AND',376,0.00000,'  42.546245','1.601554','Andorra la Vella'),(6,13,'AO','ANGOLA','Angola','AGO',244,0.00000,'-11.202692','  17.873887','Luanda'),(7,39,'AI','ANGUILLA','Anguilla','AIA',1264,0.00000,'18.220554','  -63.068615','Valley'),(8,39,'AG','ANTIGUA & BARBUDA','Antigua_&_Barbuda','ATG',1268,0.00000,'17.060816','  -61.796428','Saint John\'s'),(9,4,'AR','ARGENTINA','Argentina','ARG',54,0.00000,'-38.416097','-63.616672','Buenos Aires'),(10,161,'AM','ARMENIA','Armenia','ARM',374,0.00000,'  40.069099','45.038189','Yerevan'),(11,5,'AW','ARUBA','Aruba','ABW',297,0.00000,'12.52111','  -69.968338','Oranjestad'),(12,6,'AU','AUSTRALIA','Australia','AUS',61,0.00000,'-25.274398','   133.775136','Canberra'),(13,46,'AT','AUSTRIA','Austria','AUT',43,20.00000,'47.516231','  14.550072','Vienna'),(14,163,'AZ','AZERBAIJAN','Azerbaijan','AZE',994,0.00000,'40.143105','47.576927','Baku'),(15,7,'BS','BAHAMAS','Bahamas','BHS',1242,0.00000,'25.03343','77.3963','Nassau'),(16,8,'BH','BAHRAIN','Bahrain','BHR',973,0.00000,'25.930414','50.637772','Manama'),(17,9,'BD','BANGLADESH','Bangladesh','BGD',880,0.00000,'23.684994','90.356331','Dhaka'),(18,164,'BB','BARBADOS','Barbados','BRB',1246,0.00000,'13.193887','-59.543198','Bridgetown'),(19,11,'BY','BELARUS','Belarus','BLR',375,0.00000,'53.709807','27.953389','Minsk'),(20,46,'BE','BELGIUM','Belgium','BEL',32,21.00000,'50.503887','4.469936','Brussels'),(21,12,'BZ','BELIZE','Belize','BLZ',501,0.00000,'17.189877','-88.49765','Belmopan'),(22,24,'BJ','BENIN','Benin','BEN',229,0.00000,'9.30769','2.315834','Porto-Novo'),(23,13,'BM','BERMUDA','Bermuda','BMU',1441,0.00000,'32.3078','64.7505','Hamilton'),(24,14,'BT','BHUTAN','Bhutan','BTN',975,0.00000,'27.514162','90.433601','Thimphu'),(25,15,'BO','BOLIVIA','Bolivia','BOL',591,0.00000,'-16.290154','-63.588653','La Paz'),(26,166,'BA','BOSNIA AND HERZEGOVINA','Bosnia_and_Herzegovina','BIH',387,0.00000,'43.915886','17.679076','Sarajevo'),(27,167,'BW','BOTSWANA','Botswana','BWA',267,0.00000,'-22.328474','24.684866','Gaborone'),(28,16,'BR','BRAZIL','Brazil','BRA',55,0.00000,'-14.235004','-51.92528','Brasilia'),(29,139,'VG','BRITISH VIRGIN ISLANDS','British Virgin Islands','VGB',1284,0.00000,'18.4207','64.6400','Road Town'),(30,18,'BN','BRUNEI','Brunei','BRN',673,0.00000,'4.535277','114.727669','Bandar Seri Begawan'),(31,19,'BG','BULGARIA','Bulgaria','BGR',359,20.00000,'42.733883','25.48583','Sofia'),(32,24,'BF','BURKINA FASO','Burkina_Faso','BFA',226,0.00000,'12.238333','-1.561593','Ouagadougou'),(33,20,'BI','BURUNDI','Burundi','BDI',257,0.00000,'-3.373056','29.918886','Bujumbura'),(34,21,'KH','CAMBODIA','Cambodia','KHM',855,0.00000,'12.5657','104.9910','Phnom Penh'),(35,25,'CM','CAMEROON','Cameroon','CMR',237,0.00000,'7.369722','12.354722','Yaounde'),(36,22,'CA','CANADA','Canada','CAN',1,0.00000,'56.130366','-106.346771','Ottawa'),(37,168,'CV','CAPE VERDE','Cape Verde','CPV',238,0.00000,'16.002082','-24.013197','Praia'),(38,23,'KY','CAYMAN ISLANDS','Cayman Islands','CYM',1345,0.00000,'19.513469','-80.566956','George Town'),(39,25,'CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',236,0.00000,'6.611111','20.939444','Bangui'),(40,25,'TD','CHAD','Chad','TCD',235,0.00000,'15.4542',' 18.7322','N\'Djamena'),(41,26,'CL','CHILE','Chile','CHL',56,0.00000,'-35.675147','-71.542969','Santiago'),(42,27,'CN','CHINA','China','CHN',86,0.00000,'35.86166','104.195397','Beijing'),(43,28,'CO','COLOMBIA','Colombia','COL',57,0.00000,'4.570868','-74.297333','Bogota'),(44,29,'KM','COMOROS','Comoros','COM',269,0.00000,'-11.875001','43.872219','Moroni'),(45,169,'CG','CONGO','Congo','COG',242,0.00000,'-0.228021','15.827659','Kinshasa'),(46,31,'CR','COSTA RICA','Costa Rica','CRI',506,0.00000,'9.748917','-83.753428','San Jose'),(47,32,'HR','CROATIA','Croatia','HRV',385,25.00000,'45.1','15.2','Zagreb'),(48,33,'CU','CUBA','Cuba','CUB',53,0.00000,'21.521757','-77.781167','Havana'),(49,46,'CY','CYPRUS','Cyprus','CYP',357,19.00000,'35.126413','33.429859','Nicosia'),(50,35,'CZ','CZECH REPUBLIC','Czech Republic','CZE',420,21.00000,'49.817492','15.472962','Prague'),(51,10,'CD','DEMOCRATIC REPUBLIC','Democratic Republic','COD',243,0.00000,'4.0383','21.7587','Test'),(52,36,'DK','DENMARK','Denmark','DNK',45,25.00000,'56.26392','9.501785','Copenhagen'),(53,37,'DJ','DJIBOUTI','Djibouti','DJI',253,0.00000,'11.825138','42.590275','Djibouti'),(54,39,'DM','DOMINICA','Dominica','DMA',1767,0.00000,'15.414999','-61.370976','Roseau'),(55,38,'DO','DOMINICAN REPUBLIC','Dominican republic','DOM',1809,0.00000,'18.735693','-70.162651','Santo Domingo'),(56,139,'EC','ECUADOR','Ecuador','ECU',593,0.00000,'-1.831239','-78.183406','Quito'),(57,41,'EG','EGYPT','Egypt','EGY',20,0.00000,'26.820553','30.802498','Cairo'),(58,139,'SV','EL SALVADOR','El Salvador','SLV',503,0.00000,'13.794185','-88.89653','San Salvador'),(59,25,'GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',240,0.00000,'1.650801','10.267895','Malabo'),(60,43,'ER','ERITREA','Eritrea','ERI',291,0.00000,'15.179384','39.782334','Asmara'),(61,43,'EE','ERITREA','Estonia','EST',372,20.00000,'58.595272','25.013607','Tallinn'),(62,45,'ET','ETHIOPIA','Ethiopia','ETH',251,0.00000,'9.145','40.489673','Addis Ababa'),(63,36,'FO','FAEROE ISLANDS','Faeroe Islands','FRO',298,0.00000,'61.892635','-6.911806','Tórshavn'),(64,170,'FJ','FIJI ISLANDS','Fiji Islands','FJI',67970,0.00000,'-16.578193','179.414413','Suva'),(65,46,'FI','FINLAND','Finland','FIN',358,24.00000,'61.92411','25.748151','Helsinki'),(66,46,'FR','FRANCE','France','FRA',33,20.00000,'46.227638','2.213749','Paris'),(67,46,'GF','FRENCH GUIANA','French Guiana','GUF',594,0.00000,'3.933889','-53.125782','Cayenne'),(68,171,'PF','FRENCH POLYNESIA','French Polynesia','PYF',689,0.00000,'-17.679742','-149.406843','Papeete'),(69,25,'GA','GABON','Gabon','GAB',241,0.00000,'-0.803689','11.609444','Libreville'),(70,48,'GM','GAMBIA','Gambia','GMB',220,0.00000,'13.443182','-15.310139','Banjul'),(71,172,'GE','GEORGIA','Georgia','GEO',995,0.00000,'42.315407','43.356892','Tbilisi'),(72,46,'DE','GERMANY','Germany','DEU',49,19.00000,'51.165691','10.451526','Berlin'),(73,49,'GH','GHANA','Ghana','GHA',233,0.00000,'7.946527','7.946527','Accra'),(74,50,'GI','GIBRALTAR','Gibraltar','GIB',350,0.00000,'36.137741','-5.345374','Gibraltar'),(75,46,'GR','GREECE','Greece','GRC',30,23.00000,'39.074208','21.824312','Athens'),(76,39,'GD','GRENADA','Grenada','GRD',1473,0.00000,'12.262776','-61.604171','Saint George\'s'),(77,46,'GP','GUADELOUPE','Guadeloupe','GLP',590,0.00000,'16.995971','-62.067641','Basse-Terre'),(78,139,'GU','GUAM','Guam','GUM',1671,0.00000,'13.444304','144.793731','Hagåtña'),(79,52,'GT','GUATEMALA','Guatemala','GTM',502,0.00000,'15.783471','-90.230759','Guatemala City'),(80,53,'GN','GUINEA','Guinea','GIN',224,0.00000,'9.945587','-9.696645','Conakry'),(81,24,'GW','GUINEA BISSAU','Guinea Bissau','GNB',245,0.00000,'11.803749','-15.180413','Bissau'),(82,150,'GY','GUYANA','Guyana','GUY',592,0.00000,'4.860416','-58.93018','Georgetown'),(83,54,'HT','HAITI','Haiti','HTI',509,0.00000,'18.971187','-72.285215','Port-au-Prince'),(84,55,'HN','HONDURAS','Honduras','HND',504,0.00000,'15.199999','-86.241905','Tegucigalpa'),(85,56,'HK','HONG KONG','Hong Kong','HKG',852,0.00000,'22.396428','114.109497','Central'),(86,57,'HU','HUNGARY','Hungary','HUN',36,27.00000,'47.162494','19.503304','Budapest'),(87,58,'IS','ICELAND','Iceland','ISL',354,0.00000,'64.963051','-19.020835','Reykjavik'),(88,59,'IN','INDIA','India','IND',91,0.00000,'20.5937','78.9629','New Delhi'),(89,60,'ID','INDONESIA','Indonesia','IDN',62,0.00000,'-0.789275','113.921327','Jakarta'),(90,61,'IR','IRAN','Iran','IRN',98,0.00000,'32.427908','53.688046','Tehran'),(91,173,'IQ','IRAQ','Iraq','IRQ',964,0.00000,'33.223191','43.679291','Baghdad'),(92,46,'IE','IRELAND','Ireland','IRL',353,23.00000,'53.41291','-8.24389','Dublin'),(93,62,'IL','ISRAEL','Israel','ISR',972,0.00000,'31.046051','34.851612','Jerusalem'),(94,46,'IT','ITALY','Italy','ITA',39,22.00000,'41.87194','12.56738','Rome'),(95,24,'CI','IVORY COAST','Ivory Coast','CIV',225,0.00000,'7.5400','5.5471','Yamoussoukro'),(96,63,'JM','JAMAICA','Jamaica','JAM',1876,0.00000,'18.109581','-77.297508','Kingston'),(97,64,'JP','JAPAN','Japan','JPN',81,0.00000,'36.204824','138.252924','Tokyo'),(98,65,'JO','JORDAN','Jordan','JOR',962,0.00000,'30.585164','36.238414','Amman'),(99,66,'KZ','KAZAKHSTAN','Kazakhstan','KAZ',7,0.00000,'48.019573','66.923684','Astana'),(100,67,'KE','KENYA','Kenya','KEN',254,0.00000,'-0.023559','37.906193','Nairobi'),(101,46,'KS','KOSOVO','Kosovo','KSV',38128,0.00000,'42.602636','20.902977','Pristina'),(102,69,'KW','KUWAIT','Kuwait','KWT',965,0.00000,'29.31166','47.481766','Kuwait City'),(103,174,'KG','KYRGYZSTAN','Kyrgyzstan','KGZ',996,0.00000,'41.20438','74.766098','Bishkek'),(104,70,'LA','LAOS','Laos','LAO',856,0.00000,'19.85627','102.495496','Vientiane'),(105,46,'LV','LATVIA','Latvia','LVA',371,21.00000,'56.879635','24.603189','Riga'),(106,72,'LB','LEBANON','Lebanon','LBN',961,0.00000,'33.854721','33.854721','Beirut'),(107,73,'LS','LESOTHO','Lesotho','LSO',266,0.00000,'-29.609988','28.233608','Maseru'),(108,175,'LR','LIBERIA','Liberia','LBR',231,0.00000,'6.428055','-9.429499','Monrovia'),(109,74,'LY','LIBYA','Libya','LBY',218,0.00000,'26.3351','17.228331','Tripoli'),(110,131,'LI','LIECHTENSTEIN','Liechtenstein','LIE',423,0.00000,'47.166','9.555373','Vaduz'),(111,75,'LT','LITHUANIA','Lithuania','LTU',370,21.00000,'55.169438','23.881275','Vilnius'),(112,46,'LU','LUXEMBOURG','Luxembourg','LUX',352,17.00000,'49.815273','6.129583','Luxembourg'),(113,76,'MO','MACAU','Macau','MAC',853,0.00000,'22.198745','113.543873','Beijing'),(114,77,'MK','MACEDONIA','Macedonia','MKD',389,0.00000,'41.608635','21.745275','Skopje'),(115,176,'MG','MADAGASCAR','Madagascar','MDG',261,0.00000,'-18.766947','46.869107','Antananarivo'),(116,79,'MW','MALAWI','Malawi','MWI',265,0.00000,'-13.254308','34.301525','Lilongwe'),(117,80,'MY','MALAYSIA','Malaysia','MYS',60,0.00000,'4.210484','101.975766','Kuala Lumpur'),(118,24,'ML','MALI','Mali','MLI',223,0.00000,'17.570692','-3.996166','Bamako'),(119,46,'MT','MALTA','Malta','MLT',356,18.00000,'35.937496','14.375416','Valletta'),(120,139,'MH','MARSHALL ISLANDS','Marshall Islands','MHL',692,0.00000,'7.131474','171.184478','Majuro'),(121,46,'MQ','MARTINIQUE','Martinique','MTQ',596,0.00000,'14.641528','-61.024174','Fort-de-France'),(122,83,'MR','MAURITANIA','Mauritania','MRT',222,0.00000,'21.00789','-10.940835','Nouakchott'),(123,84,'MU','MAURITIUS','Mauritius','MUS',230,0.00000,'-20.348404','57.552152','Port Louis'),(124,85,'MX','MEXICO','Mexico','MEX',52,0.00000,'23.634501','-102.552784','Mexico City'),(125,139,'FM','MICRONESIA','Micronesia','FSM',691,0.00000,'7.4256','150.5508','Palikir'),(126,86,'MD','MOLDOVA','Moldova','MDA',373,0.00000,'47.411631','28.369885','Chisinau'),(127,46,'MC','MONACO','Monaco','MCO',377,0.00000,'43.750298','7.412841','Monaco'),(128,87,'MN','MONGOLIA','Mongolia','MNG',976,0.00000,'46.862496','103.846656','Ulaanbaatar'),(129,46,'ME','MONTENEGRO','Montenegro','MNE',382,0.00000,'42.708678','19.37439','Podgorica'),(130,39,'MS','MONTSERRAT','Montserrat','MSR',1664,0.00000,'16.742498','-62.187366','Brades'),(131,88,'MA','MOROCCO','Morocco','MAR',212,0.00000,'31.791702','-7.09262','Rabat'),(132,89,'MZ','MOZAMBIQUE','Mozambique','MOZ',258,0.00000,'-18.665695','35.529562','Maputo'),(133,177,'MM','MYANMAR','Myanmar','MMR',95,0.00000,'21.913965','95.956223','Rangoon'),(134,90,'NA','NAMIBIA','Namibia','NAM',264,0.00000,'-22.95764','18.49041','Windhoek'),(135,91,'NP','NEPAL','Nepal','NPL',977,0.00000,'28.394857','84.124008','Kathmandu'),(136,46,'NL','NETHERLANDS','Netherlands','NLD',31,21.00000,'52.132633','5.291266','Amsterdam'),(137,171,'NC','NEW CALEDONIA','New Caledonia','NCL',687,0.00000,'-20.904305','165.618042','Nouméa'),(138,94,'NZ','NEW ZEALAND','New Zealand','NZL',64,0.00000,'-40.900557','174.885971','Wellington'),(139,95,'NI','NICARAGUA','Nicaragua','NIC',505,0.00000,'12.865416','-85.207229','Managua'),(140,24,'NE','NIGER','Niger','NER',227,0.00000,'17.607789','8.081666','Niamey'),(141,96,'NG','NIGERIA','Nigeria','NGA',234,0.00000,'9.081999','8.675277','Abuja'),(142,139,'MP','NO. MARIANA ISLANDS','No. Mariana Islands','MNP',1670,0.00000,'17.33083','145.38469','Saipan'),(143,178,'KP','NORTH KOREA','North Korea','PRK',850,0.00000,'40.339852','127.510093','Pyongyang'),(144,97,'NO','NORWAY','Norway','NOR',47,0.00000,'60.472024','8.468946','Oslo'),(145,98,'OM','OMAN','Oman','OMN',968,0.00000,'21.512583','55.923255','Muscat'),(146,100,'PK','PAKISTAN','Pakistan','PAK',92,0.00000,'30.375321','69.345116','Islamabad'),(147,139,'PW','PALAU','Palau','PLW',680,0.00000,'7.51498','134.58252','Melekeok'),(149,102,'PA','PANAMA','Panama','PAN',507,0.00000,'8.537981','-80.782127','Panama City'),(150,104,'PY','PARAGUAY','Paraguay','PRY',595,0.00000,'-23.442503','-58.443832','Asuncion'),(151,179,'PE','PERU','Peru','PER',51,0.00000,'-9.189967','-75.015152','Lima'),(152,106,'PH','PHILIPPINES','Philippines','PHL',63,0.00000,'12.879721','121.774017','Manila'),(153,108,'PL','POLAND','Poland','POL',48,23.00000,'51.919438','19.145136','Warsaw'),(154,46,'PT','PORTUGAL','Portugal','PRT',351,23.00000,'39.399872','-8.224454','Lisbon'),(155,139,'PR','PUERTO RICO','Puerto Rico','PRI',1787,0.00000,'18.220833','-66.590149','San Juan'),(156,109,'QA','QATAR','Qatar','QAT',974,0.00000,'25.354826','51.183884','Doha'),(157,46,'RE','REUNION ISLAND','Reunion Island','REU',262,0.00000,'-21.115141','55.536384','Saint-Denis'),(158,110,'RO','ROMANIA','Romania','ROM',40,20.00000,'45.943161','24.96676','Bucharest'),(159,112,'RU','RUSSIAN FEDERATION','Russian Federation','RUS',70,0.00000,'61.52401','105.318756','Moscow'),(160,113,'RW','RWANDA','Rwanda','RWA',250,0.00000,'-1.940278','29.873888','Kigali'),(161,46,'SM','SAN MARINO','San Marino','SMR',378,0.00000,'43.94236','12.457777','San Marino'),(162,116,'SA','SAUDI ARABIA','Saudi Arabia','SAU',966,0.00000,'23.885942','45.079162','Riyadh'),(163,24,'SN','SENEGAL','Senegal','SEN',221,0.00000,'14.497401','-14.452362','Dakar'),(164,180,'RS','SERBIA','Serbia','SRB',381,0.00000,'44.016521','21.005859','Belgrade'),(165,117,'SC','SEYCHELLES ISLANDS','Seychelles Islands','SYC',248,0.00000,'-4.679574','55.491977','Victoria'),(166,118,'SL','SIERRA LEONE','Sierra Leone','SLE',232,0.00000,'8.460555','-11.779889','Freetown'),(167,120,'SG','SINGAPORE','Singapore','SGP',65,0.00000,'1.352083','103.819836','Singapore'),(168,46,'SK','SLOVAKIA','Slovakia','SVK',421,20.00000,'48.669026','19.699024','Bratislava'),(169,46,'SI','SLOVENIA','Slovenia','SVN',386,22.00000,'46.151241','14.995463','Ljubljana'),(170,123,'SO','SOMALIA','Somalia','SOM',252,0.00000,'5.152149','46.199616','Mogadishu'),(171,124,'ZA','SOUTH AFRICA','South Africa','ZAF',27,0.00000,'-30.559482','22.937506','Cape Town'),(172,181,'KR','SOUTH KOREA','South Korea','KOR',82,0.00000,'35.907757','127.766922','Seoul'),(173,182,'SS','SOUTH SUDAN','South Sudan','SSD',211,0.00000,'6.8770','31.3070','Juba'),(174,46,'ES','SPAIN','Spain','ESP',34,21.00000,'40.463667','-3.74922','Madrid'),(175,125,'LK','SRI LANKA','Sri Lanka','LKA',94,0.00000,'7.873054','80.771797','Colombo'),(176,39,'KN','ST. KITTS','St. Kitts','KNA',1869,0.00000,'17.3578','62.7830','Basseterre'),(177,39,'LC','ST. LUCIA','St. Lucia','LCA',1758,0.00000,'13.9094','60.9789','Castries'),(178,46,'MF','ST. MARTIN','St. Martin','MAF',1721,0.00000,'18.0708','63.0501','Marigot'),(179,46,'PM','ST. PIERRE & MIQUELON','St. Pierre & Miquelon','SPM',508,0.00000,'46.8852','56.3159','Saint-Pierre'),(180,39,'VC','ST. VINCENT','St. Vincent','VCT',1784,0.00000,'12.9843','61.2872','Kingstown'),(181,183,'SD','SUDAN','Sudan','SDN',249,0.00000,'12.862807','30.217636','Khartoum'),(182,184,'SR','SURINAME','Suriname','SUR',597,0.00000,'3.919305','-56.027783','Paramaribo'),(183,129,'SZ','SWAZILAND','Swaziland','SWZ',268,0.00000,'-26.522503','31.465866','Mbabane'),(184,130,'SE','SWEDEN','Sweden','SWE',46,25.00000,'60.128161','18.643501','Stockholm'),(185,131,'CH','SWITZERLAND','Switzerland','CHE',41,0.00000,'46.818188','8.227512','Bern'),(186,132,'SY','SYRIA','Syria','SYR',963,0.00000,'34.802075','38.996815','Damascus'),(187,133,'TW','TAIWAN','Taiwan','TWN',886,0.00000,'23.69781','120.960515','Taipei'),(188,185,'TJ','TAJIKISTAN','Tajikistan','TJK',992,0.00000,'38.861034','71.276093','Dushanbe'),(189,134,'TZ','TANZANIA','Tanzania','TZA',255,0.00000,'-6.369028','34.888822','Dar es Salaam'),(190,135,'TH','THAILAND','Thailand','THA',66,0.00000,'15.870032','100.992541','Bangkok'),(192,137,'TT','TRINIDAD & TOBAGO','Trinidad & Tobago','TTO',1868,0.00000,'10.691803','-61.222503','Port-of-Spain'),(193,138,'TN','TUNISIA','Tunisia','TUN',216,0.00000,'33.886917','9.537499','Tunis'),(194,186,'TR','TURKEY','Turkey','TUR',90,0.00000,'38.963745','35.243322','Ankara'),(195,187,'TM','TURKMENISTAN','Turkmenistan','TKM',7370,0.00000,'38.969719','59.556278','Ashgabat'),(196,139,'TC','TURKS & CAICOS ISLANDS','Turks & Caicos Islands','TCA',1649,0.00000,'21.694025','-71.797928','Cockburn Town'),(197,141,'UG','UGANDA','Uganda','UGA',256,0.00000,'1.373333','32.290275','Kampala'),(198,142,'UA','UKRAINE','Ukraine','UKR',380,0.00000,'48.379433','31.16558','Kyiv'),(199,140,'AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',971,0.00000,'23.424076','53.847818','Abu Dhabi'),(200,188,'GB','UNITED KINGDOM','United Kingdom','GBR',44,20.00000,'55.378051','-3.435973','London'),(201,143,'UY','URUGUAY','Uruguay','URY',598,0.00000,'-32.522779','-55.765835','Montevideo'),(202,139,'VI','US VIRGIN ISLANDS','Us Virgin Islands','VIR',1340,0.00000,'18.335765','-64.896335','Charlotte Amalie'),(203,139,'US','United States','Usa','USA',1,0.00000,'37.09024','-95.712891','Washington, D.C.'),(204,189,'UZ','UZBEKISTAN','Uzbekistan','UZB',998,0.00000,'41.377491','64.585262','Tashkent'),(205,145,'VE','VENEZUELA','Venezuela','VEN',58,0.00000,'6.42375','-66.58973','Caracas'),(206,146,'VN','VIETNAM','Vietnam','VNM',84,0.00000,'14.058324','108.277199','Hanoi'),(207,147,'YE','YEMEN','Yemen','YEM',967,0.00000,'15.552727','48.516388','Sanaa'),(208,148,'ZM','ZAMBIA','Zambia','ZMB',260,0.00000,'-13.133897','27.849332','Lusaka'),(209,149,'ZW','ZIMBABWE','Zimbabwe','ZWE',263,0.00000,'-19.015438','29.154857','Harare'),(211,190,'A','ASCENSION','Ascension','ASC',247,0.00000,'','','Georgetown'),(212,94,'CK','COOK ISLANDS','Cook Islands','COK',682,0.00000,'','','Avarua'),(213,139,'TL','EAST TIMOR','EastTimor','TLS',670,0.00000,'','','Dili'),(214,47,'FK','FALKLAND ISLANDS','FalklandIslands','FLK',500,0.00000,'','','Stanley'),(215,36,'GL','GREENLAND','GreenLand','GRL',299,0.00000,'','','Nuuk'),(216,6,'KI','KIRIBATI','Kiribati','KIR',686,0.00000,'','','South Tarawa'),(217,81,'MV','MALDIVES','Maldives','MDV',960,0.00000,'','','Malé'),(218,6,'NR','NAURU','Nauru','NRU',674,0.00000,'','','Yaren');
/*!40000 ALTER TABLE `countrycode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_settings`
--

DROP TABLE IF EXISTS `cron_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `command` varchar(50) NOT NULL,
  `exec_interval` int NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_execution_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `next_execution_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `file_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_settings`
--

LOCK TABLES `cron_settings` WRITE;
/*!40000 ALTER TABLE `cron_settings` DISABLE KEYS */;
INSERT INTO `cron_settings` VALUES (1,'CDRs Archive','days',1,'2021-05-06 05:31:28','2021-05-06 05:31:28','0000-00-00 00:00:00','2021-05-07 01:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}CDRsArchive/ProcessCDRsArchive'),(2,'Purge Data','days',1,'2021-05-06 05:31:28','2021-05-06 05:31:28','0000-00-00 00:00:00','2021-05-07 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}purge/ProcessPurge/'),(3,'Low Balance Alert','days',1,'2021-05-06 05:31:28','2021-05-06 05:31:28','0000-00-00 00:00:00','2021-05-06 06:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}lowbalance/low_balance/'),(4,'Email Broadcast','minutes',1,'2021-05-06 05:31:28','2021-05-06 05:31:28','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}broadcastemail/broadcast_email/'),(5,'Generate Invoice','days',1,'2021-05-06 05:31:28','2021-05-06 05:31:28','0000-00-00 00:00:00','2021-05-06 02:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}ProcessInvoice/GenerateInvoice/'),(6,'Manage Services','days',1,'2021-05-06 05:31:29','2021-05-06 05:31:29','0000-00-00 00:00:00','2021-05-05 22:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}ProcessInvoice/ManageServices/'),(7,'Update Pending Order Status','minutes',30,'2021-05-06 05:31:29','2021-05-06 05:31:29','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}PaymentStatus/PaymentStatus/'),(8,'Currency Update','days',1,'2021-05-06 05:33:10','2021-05-06 05:33:10','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -q -O- {BASE_URL}currencyupdate/update_currency/');
/*!40000 ALTER TABLE `cron_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) NOT NULL DEFAULT '',
  `currencyname` varchar(40) NOT NULL DEFAULT '',
  `currencyrate` decimal(10,3) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_supported` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `currencyrate` (`currencyrate`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'ALL','Albanian Lek',111.604,'2021-05-06 05:25:10',1),(2,'DZD','Algerian Dinar',119.355,'2021-05-06 05:25:10',1),(4,'ARS','Argentine Peso',43.895,'2021-05-06 05:25:10',1),(5,'AWG','Aruba Florin',1.800,'2021-05-06 05:25:10',1),(6,'AUD','Australian Dollar',1.407,'2021-05-06 05:33:13',0),(7,'BSD','Bahamian Dollar',1.002,'2021-05-06 05:25:10',1),(8,'BHD','Bahraini Dinar',0.377,'2021-05-06 05:25:10',1),(9,'BDT','Bangladesh Taka',84.460,'2021-05-06 05:25:10',1),(10,'BBD','Barbados Dollar',1.991,'2021-05-06 05:25:10',1),(11,'BYR','Belarus Ruble',19600.000,'2021-05-06 05:25:10',1),(12,'BZD','Belize Dollar',2.016,'2021-05-06 05:25:10',1),(13,'BMD','Bermuda Dollar',1.000,'2021-05-06 05:25:10',1),(14,'BTN','Bhutan Ngultrum',69.208,'2021-05-06 05:25:10',1),(15,'BOB','Bolivian Boliviano',6.955,'2021-05-06 05:25:10',1),(16,'BRL','Brazilian Real',3.875,'2021-05-06 05:33:13',0),(17,'GBP','British Pound',0.767,'2021-05-06 05:33:13',0),(18,'BND','Brunei Dollar',1.351,'2021-05-06 05:25:10',1),(19,'BGN','Bulgarian Lev',1.744,'2021-05-06 05:25:10',1),(20,'BIF','Burundi Franc',1835.500,'2021-05-06 05:25:10',1),(21,'KHR','Cambodia Riel',4026.000,'2021-05-06 05:25:10',1),(22,'CAD','Canadian Dollar',1.339,'2021-05-06 05:33:13',0),(23,'KYD','Cayman Islands Dollar',0.833,'2021-05-06 05:25:10',1),(24,'XOF','CFA Franc (BCEAO)',590.000,'2021-05-06 05:25:10',1),(25,'XAF','CFA Franc (BEAC)',584.250,'2021-05-06 05:25:10',1),(26,'CLP','Chilean Peso',665.304,'2021-05-06 05:25:10',1),(27,'CNY','Chinese Yuan',6.718,'2021-05-06 05:33:13',0),(28,'COP','Colombian Peso',3124.500,'2021-05-06 05:25:10',1),(29,'KMF','Comoros Franc',439.104,'2021-05-06 05:25:10',1),(31,'CRC','Costa Rica Colon',606.035,'2021-05-06 05:25:10',1),(32,'HRK','Croatian Kuna',6.628,'2021-05-06 05:25:10',1),(33,'CUP','Cuban Peso',26.500,'2021-05-06 05:25:10',1),(34,'CYP','Cyprus Pound',0.008,'2021-05-06 05:25:10',1),(35,'CZK','Czech Koruna',22.859,'2021-05-06 05:33:13',0),(36,'DKK','Danish Krone',6.656,'2021-05-06 05:33:13',0),(37,'DJF','Dijibouti Franc',177.720,'2021-05-06 05:25:10',1),(38,'DOP','Dominican Peso',50.645,'2021-05-06 05:25:10',1),(39,'XCD','East Caribbean Dollar',2.703,'2021-05-06 05:25:10',1),(40,'ECS','Ecuador Sucre',371.471,'2021-05-06 05:25:10',1),(41,'EGP','Egyptian Pound',17.305,'2021-05-06 05:25:10',1),(42,'SVC','El Salvador Colon',8.749,'2021-05-06 05:25:10',1),(43,'ERN','Eritrea Nakfa',15.000,'2021-05-06 05:25:10',1),(44,'EEK','Estonian Kroon',0.000,'2021-05-06 05:25:10',1),(45,'ETB','Ethiopian Birr',28.904,'2021-05-06 05:25:10',1),(46,'EUR','Euro',0.890,'2021-05-06 05:33:13',0),(47,'FKP','Falkland Islands Pound',0.765,'2021-05-06 05:25:10',1),(48,'GMD','Gambian Dalasi',49.625,'2021-05-06 05:25:10',1),(49,'GHC','Ghanian Cedi',897.330,'2021-05-06 05:25:10',1),(50,'GIP','Gibraltar Pound',0.765,'2021-05-06 05:25:10',1),(52,'GTQ','Guatemala Quetzal',7.672,'2021-05-06 05:25:10',1),(53,'GNF','Guinea Franc',9225.000,'2021-05-06 05:25:10',1),(54,'HTG','Haiti Gourde',84.101,'2021-05-06 05:25:10',1),(55,'HNL','Honduras Lempira',24.520,'2021-05-06 05:25:10',1),(56,'HKD','Hong Kong Dollar',7.851,'2021-05-06 05:33:13',0),(57,'HUF','Hungarian ForINT',286.320,'2021-05-06 05:33:13',0),(58,'ISK','Iceland Krona',118.980,'2021-05-06 05:25:10',1),(59,'INR','Indian Rupee',1.000,'2021-05-06 05:25:10',1),(60,'IDR','Indonesian Rupiah',14117.000,'2021-05-06 05:25:10',1),(61,'IRR','Iran Rial',42105.000,'2021-05-06 05:25:10',1),(62,'ILS','Israeli Shekel',3.577,'2021-05-06 05:33:13',0),(63,'JMD','Jamaican Dollar',127.510,'2021-05-06 05:25:10',1),(64,'JPY','Japanese Yen',111.725,'2021-05-06 05:33:13',0),(65,'JOD','Jordanian Dinar',0.709,'2021-05-06 05:25:10',1),(66,'KZT','Kazakhstan Tenge',379.240,'2021-05-06 05:25:10',1),(67,'KES','Kenyan Shilling',100.690,'2021-05-06 05:25:10',1),(68,'KRW','Korean Won',1137.690,'2021-05-06 05:25:10',1),(69,'KWD','Kuwaiti Dinar',0.305,'2021-05-06 05:25:10',1),(70,'LAK','Lao Kip',8602.504,'2021-05-06 05:25:10',1),(71,'LVL','Latvian Lat',0.605,'2021-05-06 05:25:10',1),(72,'LBP','Lebanese Pound',1511.150,'2021-05-06 05:25:10',1),(73,'LSL','Lesotho Loti',14.090,'2021-05-06 05:25:10',1),(74,'LYD','Libyan Dinar',1.395,'2021-05-06 05:25:10',1),(75,'LTL','Lithuanian Lita',2.953,'2021-05-06 05:25:10',1),(76,'MOP','Macau Pataca',8.086,'2021-05-06 05:25:10',1),(77,'MKD','Macedonian Denar',54.802,'2021-05-06 05:25:10',1),(78,'MGF','Malagasy Franc',5.830,'2021-05-06 05:25:10',1),(79,'MWK','Malawi Kwacha',725.115,'2021-05-06 05:25:10',1),(80,'MYR','Malaysian Ringgit',4.090,'2021-05-06 05:33:13',0),(81,'MVR','Maldives Rufiyaa',15.450,'2021-05-06 05:25:10',1),(82,'MTL','Maltese Lira',0.840,'2021-05-06 05:25:10',1),(83,'MRO','Mauritania Ougulya',357.000,'2021-05-06 05:25:10',1),(84,'MUR','Mauritius Rupee',34.895,'2021-05-06 05:25:10',1),(85,'MXN','Mexican Peso',19.073,'2021-05-06 05:33:13',0),(86,'MDL','Moldovan Leu',17.413,'2021-05-06 05:25:10',1),(87,'MNT','Mongolian Tugrik',2616.500,'2021-05-06 05:25:10',1),(88,'MAD','Moroccan Dirham',9.658,'2021-05-06 05:25:10',1),(89,'MZN','Mozambique Metical',0.000,'2021-05-06 05:25:10',1),(90,'NAD','Namibian Dollar',14.120,'2021-05-06 05:25:10',1),(91,'NPR','Nepalese Rupee',110.925,'2021-05-06 05:25:10',1),(92,'ANG','Neth Antilles Guilder',1.855,'2021-05-06 05:25:10',1),(93,'TRY','New Turkish Lira',5.626,'2021-05-06 05:25:10',1),(94,'NZD','New Zealand Dollar',1.485,'2021-05-06 05:33:13',0),(95,'NIO','Nicaragua Cordoba',32.830,'2021-05-06 05:25:10',1),(96,'NGN','Nigerian Naira',360.504,'2021-05-06 05:25:10',1),(97,'NOK','Norwegian Krone',8.614,'2021-05-06 05:33:13',0),(98,'OMR','Omani Rial',0.385,'2021-05-06 05:25:10',1),(99,'XPF','Pacific Franc',106.780,'2021-05-06 05:25:10',1),(100,'PKR','Pakistani Rupee',141.440,'2021-05-06 05:25:10',1),(102,'PAB','Panama Balboa',1.005,'2021-05-06 05:25:10',1),(103,'PGK','Papua New Guinea Kina',3.380,'2021-05-06 05:25:10',1),(104,'PYG','Paraguayan Guarani',6198.850,'2021-05-06 05:25:10',1),(105,'PEN','Peruvian Nuevo Sol',3.298,'2021-05-06 05:25:10',1),(106,'PHP','Philippine Peso',52.090,'2021-05-06 05:33:13',0),(108,'PLN','Polish Zloty',3.826,'2021-05-06 05:33:13',0),(109,'QAR','Qatar Rial',3.641,'2021-05-06 05:25:10',1),(110,'ROL','Romanian Leu',33.340,'2021-05-06 05:25:10',1),(111,'RON','Romanian New Leu',4.236,'2021-05-06 05:25:10',1),(112,'RUB','Russian Rouble',65.231,'2021-05-06 05:33:13',0),(113,'RWF','Rwanda Franc',900.000,'2021-05-06 05:25:10',1),(114,'WST','Samoa Tala',2.608,'2021-05-06 05:25:10',1),(115,'STD','Sao Tome Dobra',21050.600,'2021-05-06 05:25:10',1),(116,'SAR','Saudi Arabian Riyal',3.754,'2021-05-06 05:25:10',1),(117,'SCR','Seychelles Rupee',13.667,'2021-05-06 05:25:10',1),(118,'SLL','Sierra Leone Leone',8850.000,'2021-05-06 05:25:10',1),(120,'SGD','Singapore Dollar',1.355,'2021-05-06 05:33:13',0),(121,'SKK','Slovak Koruna',33.554,'2021-05-06 05:25:10',1),(122,'SIT','Slovenian Tolar',3.217,'2021-05-06 05:25:10',1),(123,'SOS','Somali Shilling',580.000,'2021-05-06 05:25:10',1),(124,'ZAR','South African Rand',14.096,'2021-05-06 05:25:10',1),(125,'LKR','Sri Lanka Rupee',174.790,'2021-05-06 05:25:10',1),(126,'SHP','St Helena Pound',1.321,'2021-05-06 05:25:10',1),(127,'SDD','Sudanese Dinar',40.366,'2021-05-06 05:25:10',1),(128,'SRG','Surinam Guilder',0.000,'2021-05-06 05:25:10',1),(129,'SZL','Swaziland Lilageni',14.090,'2021-05-06 05:25:10',1),(130,'SEK','Swedish Krona',9.302,'2021-05-06 05:33:13',0),(131,'CHF','Swiss Franc',1.000,'2021-05-06 05:33:13',0),(132,'SYP','Syrian Pound',515.000,'2021-05-06 05:25:10',1),(133,'TWD','Taiwan Dollar',30.804,'2021-05-06 05:33:13',0),(134,'TZS','Tanzanian Shilling',2315.404,'2021-05-06 05:25:10',1),(135,'THB','Thai Baht',31.896,'2021-05-06 05:33:13',0),(136,'TOP','Tonga Paanga',2.266,'2021-05-06 05:25:10',1),(137,'TTD','Trinidad&Tobago Dollar',6.813,'2021-05-06 05:25:10',1),(138,'TND','Tunisian Dinar',3.018,'2021-05-06 05:25:10',1),(139,'USD','U.S. Dollar',1.000,'2021-05-06 05:33:13',0),(140,'AED','UAE Dirham',3.673,'2021-05-06 05:25:10',1),(141,'UGX','Ugandan Shilling',3741.550,'2021-05-06 05:25:10',1),(142,'UAH','Ukraine Hryvnia',27.041,'2021-05-06 05:25:10',1),(143,'UYU','Uruguayan New Peso',33.720,'2021-05-06 05:25:10',1),(144,'VUV','Vanuatu Vatu',112.000,'2021-05-06 05:25:10',1),(145,'VEB','Venezuelan Bolivar',0.000,'2021-05-06 05:25:10',1),(146,'VND','Vietnam Dong',23199.500,'2021-05-06 05:25:10',1),(147,'YER','Yemen Riyal',250.304,'2021-05-06 05:25:10',1),(148,'ZMK','Zambian Kwacha',9001.204,'2021-05-06 05:25:10',1),(149,'ZWD','Zimbabwe Dollar',0.000,'2021-05-06 05:25:10',1),(150,'GYD','Guyana Dollar',209.435,'2021-05-06 05:25:10',1),(160,'AWG','Aruban florin',1.800,'2021-05-06 05:25:10',1),(161,'AMD','Armenian dram',487.420,'2021-05-06 05:25:10',1),(163,'AZN','Azerbaijani manat',1.705,'2021-05-06 05:25:10',1),(164,'BBD','Barbadian dollar',1.991,'2021-05-06 05:25:10',1),(166,'BAM','Bosnian Convertible Marka',1.742,'2021-05-06 05:25:10',1),(167,'BWP','Botswana pula',10.664,'2021-05-06 05:25:10',1),(168,'CVE','Cape Verdean escudo',98.590,'2021-05-06 05:25:10',1),(169,'CDF','Congolese franc',1635.000,'2021-05-06 05:25:10',1),(170,'FJD','Fijian Dollar',2.133,'2021-05-06 05:25:10',1),(171,'XPF','CFP franc',106.780,'2021-05-06 05:25:10',1),(172,'GEL','Georgian lari',2.685,'2021-05-06 05:25:10',1),(173,'IQD','Iraqi dinar',1190.000,'2021-05-06 05:25:10',1),(174,'KGS','Kyrgyzstani som',69.850,'2021-05-06 05:25:10',1),(175,'LRD','Liberian dollar',163.850,'2021-05-06 05:25:10',1),(176,'MGA','Malagasy ariary',3605.000,'2021-05-06 05:25:10',1),(177,'MMK','Burmese Kyat',1505.604,'2021-05-06 05:25:10',1),(178,'KPW','North Korean won',899.987,'2021-05-06 05:25:10',1),(179,'PEN','nuevo sol',3.298,'2021-05-06 05:25:10',1),(180,'RSD','Serbian dinar',105.030,'2021-05-06 05:25:10',1),(181,'KRW','South Korean won',1137.690,'2021-05-06 05:25:10',1),(182,'SSP','South Sudanese pound',0.008,'2021-05-06 05:25:10',1),(183,'SDG','Sudanese pound',47.607,'2021-05-06 05:25:10',1),(184,'SRD','Surinamese dollar',7.458,'2021-05-06 05:25:10',1),(185,'TJS','Tajikistani samani',9.434,'2021-05-06 05:25:10',1),(186,'TRY','Turkish lira',5.626,'2021-05-06 05:25:10',1),(187,'TMT','Turkmenistan manat',3.500,'2021-05-06 05:25:10',1),(188,'GBP','Pound sterling',0.767,'2021-05-06 05:33:13',0),(189,'UZS','Uzbekistani soʻm',8413.504,'2021-05-06 05:25:10',1),(190,'SHP','Saint Helena pound',1.321,'2021-05-06 05:25:10',1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_templates`
--

DROP TABLE IF EXISTS `default_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `subject` varchar(500) NOT NULL,
  `description` varchar(512) NOT NULL,
  `sms_template` varchar(500) NOT NULL,
  `alert_template` varchar(500) NOT NULL,
  `template` mediumtext NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `reseller_id` int NOT NULL DEFAULT '0',
  `is_email_enable` tinyint(1) NOT NULL DEFAULT '0',
  `is_sms_enable` tinyint(1) NOT NULL,
  `is_alert_enable` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_templates`
--

LOCK TABLES `default_templates` WRITE;
/*!40000 ALTER TABLE `default_templates` DISABLE KEYS */;
INSERT INTO `default_templates` VALUES (1,'account_refilled','Your account recharged with #REFILLBALANCE#','Account recharge notification template','Dear #FIRST_NAME#, Your account has been recharged with #REFILLBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#','<p>Your account has been recharged with #REFILLBALANCE#. Your new balance is #BALANCE#.</p>\n','<p>Dear #NAME#,</p>\n\n<p>Your account has been recharged with #REFILLBALANCE#.</p>\n\n<p>Your account new balance is #BALANCE#.</p>\n\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:53:45',0,0,0,0,0),
(3,'create_account','Welcome to #COMPANY_NAME#','New customer welcome notification template','Dear #FIRST_NAME#, Your new account has been created. Your account number is #NUMBER# and Password is #PASSWORD#. Thanks, #COMPANY_NAME#','','<p>Welcome #NAME#,</p>\r\n\r\n<p>Your new account has been created. You can log in into customer portal using below login credential,</p>\r\n\r\n<p>Account Number: #NUMBER#<br />\r\nPassword: #PASSWORD#<p/>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:02:18',0,0,1,0,0),
(4,'create_sip_device','New SIP device added to your account','New SIP Device notification template','Dear #FIRST_NAME#, New SIP Device has been added to your account. Username is #USERNAME# and Password is #PASSWORD#. Thanks, #COMPANY_NAME#','','<p>Dear #NAME#,</p>\n\n<p>New SIP device has been added to your account.</p>\n\n<p><strong>Here is your SIP device information,</strong></p>\n\n<p>Username: #USERNAME#<br />\nPassword: #PASSWORD#</p>\n\n<p>&nbsp;</p>\n\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:02:05',0,0,0,0,0),
(10,'new_invoice','Invoice created #INVOICE_NUMBER#','New invoice notification template','Dear #FIRST_NAME#, A new invoice #INVOICE_NUMBER# has been generated into your account of #AMOUNT#. You can log in into customer portal and pay the invoice. Thanks, #COMPANY_NAME#','<p>A new invoice #INVOICE_NUMBER# has been generated into your account of #AMOUNT#.&nbsp;You can log in into customer portal and pay the invoice.</p>\n','<p>Dear #NAME#,</p>\n\n<p>A new invoice has been generated into your account of #AMOUNT#.</p>\n\n<p><strong>Invoice Information: </strong></p>\n\n<p>Invoice Date: #INVOICE_DATE#<br />\nInvoice Number: #INVOICE_NUMBER#<br />\nDue Amount: #AMOUNT#<br />\nDue Date : #DUE_DATE#</p>\n\n<p>You can log in into customer portal and pay the invoice.</p>\n\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:52:54',0,0,0,0,0),(11,'low_balance','Low Balance notification #NUMBER#','Low balance notification template','Dear #FIRST_NAME#, You currently have #BALANCE# left in your account. Please make a deposit to avoid service interruptions. You can refill your account using our website. Thanks, #COMPANY_NAME#','Your current balance is at #BALANCE# which is below your set threshold. Please refill your account to ensure your services remain consistent.','<p>Dear #NAME#,</p>\n\n<p>Here is a quick reminder that your current balance is at #BALANCE# which is below your set threshold.</p>\n\n<p>You can refill your account from our website to ensure your services will remain consistent.</p>\n\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:51:10',0,0,0,0,0),(12,'signup_confirmation','Confirmation to activate account','Account activation email after signup process','Dear #FIRST_NAME#, Thanks for sign-up with us, Please use otp #OTP# to complete registration.This is usable once & valid for #TIME# min from the request.\r\nThanks,\r\n#COMPANY_NAME#\r\nThanks,\r\n#COMPANY_NAME#','','Dear #NAME#,\r\n\r\nThanks for sign-up with us\r\n\r\nPlease use one time password #OTP# to activate your account and complete registration.This is usable once valid for #TIME# min from the request.\r\n\r\nFor more info Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.\r\n\r\nThanks,\r\n\r\n#COMPANY_NAME#\r\n','2019-01-26 10:04:02',0,0,0,0,0),(13,'new_password','Your account password changed','Change password notification template','Dear #FIRST_NAME#, Your account password has been changed. Thanks, #COMPANY_NAME# ','','<p>Dear #NAME#,</p>\r\n\r\n<p>Your account password has been changed.</p>\r\n\r\n<p>Henceforth, Please use the latest password.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:04:18',0,0,0,0,0),(14,'forgot_password_confirmation','Reset your password','Account confirmation notification template for forgot password','Dear #FIRST_NAME#, Please use otp #OTP# to reset your password.This is usable once & valid for #TIME# min from the request.\r\n\r\n Thanks, #COMPANY_NAME#','','<p>Hi #NAME#,</p>\r\n\r\n<p>Please use one time password #OTP#  to reset your password.</p>\r\n\r\n\r\n<p>This is usable once valid for #TIME# min from the request.</p>\r\n\r\n<p>If you have not raised a request to reset password then please contact us immediately.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,</p>\r\n\r\n<p>#COMPANY_NAME#</p>\r\n','2019-01-26 10:05:29',0,0,1,0,0),(20,'invoice_due_reminder','Invoice due reminder #INVOICE_NUMBER#','Invoice due reminder notification template','Dear #FIRST_NAME#, This is a reminder that your invoice #INVOICE_NUMBER# which was generated on #INVOICE_DATE# is due on #DUE_DATE# for #AMOUNT# amount.  You can log in into the customer portal and pay an invoice. Thanks, #COMPANY_NAME#','<p>Your invoice #INVOICE_NUMBER# which was generated on #INVOICE_DATE# is due on #DUE_DATE# for #AMOUNT# amount.&nbsp;You can log in into the customer portal and pay&nbsp;an invoice.</p>\n','<p>Dear #NAME#,</p>\n\n<p>This is a reminder that your invoice number #INVOICE_NUMBER# which was generated on #INVOICE_DATE# is due on #DUE_DATE#.</p>\n\n<p><strong>Invoice </strong><strong>Information:</strong></p>\n\n<p>Invoice Date: #INVOICE_DATE#<br />\nInvoice Number: #INVOICE_NUMBER#<br />\nDue Amount: #AMOUNT#</p>\n\n<p>You can log in into the customer portal and pay&nbsp;an invoice.</p>\n\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:46:49',0,0,0,0,0),(24,'balance_transfer','You have transferred #AMOUNT# to #RECEIVER_ACCOUNT_NUMBER# account','Balance transfer notification template','Dear #FIRST_NAME#, You have transferred #AMOUNT# from your account to #RECEIVER_ACCOUNT_NUMBER#. Thanks, #COMPANY_NAME#','<p>You have transferred #AMOUNT# from your account to #RECEIVER_ACCOUNT_NUMBER#</p>\n','<p>Dear #NAME#,</p>\n\n<p>You have transferred #AMOUNT# from your account to #RECEIVER_ACCOUNT_NUMBER#.</p>\n\n<p>If you have not raised a request then please contact us immediately.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:44:35',0,1,0,0,0),(29,'product_purchase','#NAME#, New #PRODUCT_NAME# added to your account #NUMBER#','New product allocation to account notification template','Dear #FIRST_NAME#, New #PRODUCT_NAME# added to your account. Thanks, #COMPANY_NAME#','<p>New #PRODUCT_NAME# added to your account</p>\n','<p>Dear #NAME#,</p>\n\n<p>The product #PRODUCT_NAME# has now been added to your account.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nProduct Category: #PRODUCT_CATEGORY#<br />\nPayment Method: #PAYMENT_METHOD#<br />\nProduct Amount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#<br />Quantity:#QUANTITY#<br/>Total Amount:#TOTAL_PRICE# </p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:44:20',0,0,0,0,0),(30,'product_release','#PRODUCT_NAME# released from your account #NUMBER#','Product release notification template','Dear #FIRST_NAME#, #PRODUCT_NAME# released from your account. Thanks, #COMPANY_NAME#','<p>#PRODUCT_NAME# released from your account</p>\n','<p>Dear #NAME#,</p>\r\n\r\n<p>The product #PRODUCT_NAME# is released from #RECEIVER_ACCOUNT_NUMBER#.</p>\r\n\r\n<p><strong>Product Information:</strong><br />\r\nTermination Date: #NEXT_BILL_DATE#</p>\r\n\r\n<p><br />\r\nYou can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:43:56',0,0,0,0,0),(31,'product_renewal_notice','Renewal Notice for #PRODUCT_NAME#, #NUMBER#','Product renewal notice notification template','Dear #FIRST_NAME#, Your product #PRODUCT_NAME# is up for renewal on date #NEXT_BILL_DATE#. Please maintain your balance to ensure your services will remain consistent. Thanks, #COMPANY_NAME#','Your product #PRODUCT_NAME# is up for renewal on date #NEXT_BILL_DATE#.Please maintain your balance to ensure your services will remain consistent.','<p>Dear #NAME#,</p>\n\n<p>Your product #PRODUCT_NAME# is up for renewal, and it will automatically renew on the #NEXT_BILL_DATE#. Please maintain your balance to ensure your services will remain consistent.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nAmount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#</p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:43:39',0,0,0,0,0),(32,'product_renewed','#PRODUCT_NAME# renewed for your account #NUMBER#','Product renewed notification template','Dear #FIRST_NAME#, Your product #PRODUCT_NAME# has been successfully renewed until #NEXT_BILL_DATE#. Thanks, #COMPANY_NAME#','Your product #PRODUCT_NAME# is up for renewal on date #NEXT_BILL_DATE#. Please maintain your balance to ensure your services will remain consistent.','<p>Dear #NAME#,</p>\n\n<p>Your product #PRODUCT_NAME# has been successfully renewed until #NEXT_BILL_DATE#.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nAmount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#<br/>\nQuantity: #QUANTITY#<br/>\nTotal Price: #TOTAL_PRICE# </p>\n\n<p>Remember, You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>','2019-01-26 10:43:13',0,0,0,1,0),(33,'product_commission','Congratulations, Your have received #AMOUNT# for Product #PRODUCT_NAME# commission','Product commission notification template for re-seller','Dear #FIRST_NAME, #Congratulations, Your have received #AMOUNT# for Product #PRODUCT_NAME# commission. Thanks, #COMPANY_NAME#','','<p>Dear #NAME#,</p>\n\n<p>Your have received #AMOUNT# for Product #PRODUCT_NAME# commission. Your updated balance is #BALANCE#.</p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-02-15 09:42:58',0,0,0,0,0),
(36,'reset_password','Your account password has been reset.','Reset password notification template','Dear #FIRST_NAME#, Your account password has been changed. Your new password is #PASSWORD#. Thanks, #COMPANY_NAME# ','','<p>Dear #NAME#,</p>\r\n\r\n<p>Your account password has been changed.</p>\r\n\r\n<p>Please see your new password mentioned below: #PASSWORD#</p>\r\n\r\n<p>Henceforth, Please use the latest password.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-06-14 00:00:00',0,0,0,0,0),
(37,'customer_refill_balance','You Received #AMOUNT# Amount to #SENDER_ACCOUNT_NUMBER# account','Balance transfer notification template','Dear #FIRST_NAME#, You Received #AMOUNT# Amount from your account to #SENDER_ACCOUNT_NUMBER#. Thanks, #COMPANY_NAME#','<p>You Received #AMOUNT# Amount from your account to #SENDER_ACCOUNT_NUMBER#</p>','<p>Dear #NAME#,</p>\r\n\r\n<p>You Received #AMOUNT# from your account to #SENDER_ACCOUNT_NUMBER#.</p>\r\n\r\n<p>If you have not raised a request then please contact us immediately.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:53:45',0,0,0,0,0),
(38,'account_postcharge', 'Your account postcharge with #REFILLBALANCE#', 'Account postcharge notification template', 'Dear #FIRST_NAME#, Your account has been postcharge with #REFILLBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#', '<p>Your account has been postcharge with #REFILLBALANCE#. Your new balance is #BALANCE#.</p>', '<p>Dear #NAME#,</p>\r\n\r\n<p>Your account has been postcharge with #REFILLBALANCE#.</p>\r\n\r\n<p>Your account new balance is #BALANCE#.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n', '2019-01-26 10:53:45', '0', '0', '0', '0', '0');

/*!40000 ALTER TABLE `default_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `did_call_types`
--

DROP TABLE IF EXISTS `did_call_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `did_call_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `call_type_code` varchar(55) NOT NULL,
  `call_type` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `did_call_types`
--

LOCK TABLES `did_call_types` WRITE;
/*!40000 ALTER TABLE `did_call_types` DISABLE KEYS */;
INSERT INTO `did_call_types` VALUES (1,'0','DID-Local'),(2,'1','DID@IP/URL'),(3,'2','Direct-IP'),(4,'3','Other'),(5,'4','PSTN'),(6,'5','SIP-DID');
/*!40000 ALTER TABLE `did_call_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dids`
--

DROP TABLE IF EXISTS `dids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(40) NOT NULL DEFAULT '',
  `accountid` int NOT NULL DEFAULT '0' COMMENT 'Accounts table id',
  `parent_id` int NOT NULL DEFAULT '0',
  `connectcost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `includedseconds` int NOT NULL DEFAULT '0',
  `monthlycost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `cost` double(20,5) NOT NULL DEFAULT '0.00000',
  `init_inc` int NOT NULL DEFAULT '0',
  `inc` int NOT NULL,
  `extensions` varchar(180) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  `provider_id` int NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `setup` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `maxchannels` int NOT NULL DEFAULT '0',
  `call_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'call type',
  `leg_timeout` int NOT NULL DEFAULT '30',
  `product_id` int NOT NULL,
  `always` int NOT NULL,
  `always_destination` varchar(50) NOT NULL,
  `user_busy` int NOT NULL,
  `user_busy_destination` varchar(50) NOT NULL,
  `user_not_registered` int NOT NULL,
  `user_not_registered_destination` varchar(50) NOT NULL,
  `no_answer` int NOT NULL,
  `no_answer_destination` varchar(50) NOT NULL,
  `failover_extensions` varchar(180) NOT NULL,
  `failover_call_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `always_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `user_busy_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `user_not_registered_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `no_answer_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `call_type_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `account` (`accountid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dids`
--

LOCK TABLES `dids` WRITE;
/*!40000 ALTER TABLE `dids` DISABLE KEYS */;
/*!40000 ALTER TABLE `dids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeswich_servers`
--

DROP TABLE IF EXISTS `freeswich_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freeswich_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `freeswitch_host` varchar(100) NOT NULL,
  `freeswitch_password` varchar(50) NOT NULL,
  `freeswitch_port` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active , 1= inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeswich_servers`
--

LOCK TABLES `freeswich_servers` WRITE;
/*!40000 ALTER TABLE `freeswich_servers` DISABLE KEYS */;
INSERT INTO `freeswich_servers` VALUES (1,'127.0.0.1','Flux223304442Dev2516','8021',0,'2016-07-26 15:25:07','2016-07-26 15:25:07');
/*!40000 ALTER TABLE `freeswich_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateways` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sip_profile_id` int NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `gateway_data` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `accountid` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for Active 1 for Inactive',
  `dialplan_variable` varchar(500) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (1,1,'YourProvider','{\"username\":\"USERNAME\",\"password\":\"PASSWORD\",\"proxy\":\"sip.provider.com\",\"register\":\"false\",\"caller-id-in-from\":\"true\"}','2016-07-25 10:59:26',0,0,'','2016-07-26 15:21:09');
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_conf`
--

DROP TABLE IF EXISTS `invoice_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_conf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `city` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `emailaddress` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `invoice_prefix` varchar(11) NOT NULL DEFAULT 'INV_',
  `invoice_start_from` int NOT NULL DEFAULT '1',
  `logo` varchar(100) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `invoice_note` text NOT NULL,
  `invoice_due_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `invoice_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `no_usage_invoice` tinyint NOT NULL DEFAULT '0',
  `interval` varchar(11) NOT NULL,
  `notify_before_day` int NOT NULL DEFAULT '1',
  `invoice_taxes_number` varchar(100) NOT NULL DEFAULT 'ABN 12 345 678 901',
  `domain` varchar(100) NOT NULL,
  `website_title` varchar(100) NOT NULL,
  `website_footer` varchar(100) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_conf`
--

LOCK TABLES `invoice_conf` WRITE;
/*!40000 ALTER TABLE `invoice_conf` DISABLE KEYS */;
INSERT INTO `invoice_conf` VALUES (1,1,'Flux Telecom','R. Joaquim Pedro Soares, 560','Novo Hamburgo','Rio Grande do Sul','28','93510320','08001002500','08001002500','suporte@flux.net.br','flux.net.br','INV_',1,'logo.png','favicon.ico','Invoice Flux',1,1,0,'7',1,'ABC 435 1XX 8XX 3XX','flux.net.br','Flux Telecom - Unindo pessoas e negócios','',0);
/*!40000 ALTER TABLE `invoice_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `invoiceid` int NOT NULL DEFAULT '0',
  `order_item_id` int NOT NULL DEFAULT '0',
  `charge_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_id` int NOT NULL DEFAULT '0',
  `product_category` int NOT NULL DEFAULT '0',
  `is_tax` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 FOR NO AND 1 FOR YES',
  `base_currency` varchar(5) NOT NULL,
  `exchange_rate` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `account_currency` varchar(5) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `debit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `credit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `created_date` datetime NOT NULL,
  `generate_type` int NOT NULL DEFAULT '0' COMMENT '0:Auto 1:manually',
  `before_balance` varchar(100) NOT NULL DEFAULT '0',
  `after_balance` varchar(100) NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1' COMMENT 'Default will be 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '0',
  `from_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `to_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `due_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:paid,1:unpaid,2:partial_payment',
  `generate_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `type` enum('I','R') NOT NULL DEFAULT 'I' COMMENT 'I => Invoice R=> Receipt',
  `generate_type` int NOT NULL DEFAULT '0' COMMENT '0:Auto 1:manually',
  `confirm` int DEFAULT '0' COMMENT '0:not conform 1:conform',
  `notes` longtext NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Not delete 1:delete',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_map`
--

DROP TABLE IF EXISTS `ip_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `accountid` int NOT NULL DEFAULT '0' COMMENT 'Accounts table id',
  `reseller_id` int NOT NULL DEFAULT '0',
  `pricelist_id` int NOT NULL DEFAULT '0',
  `prefix` varchar(20) NOT NULL DEFAULT '',
  `context` varchar(20) NOT NULL DEFAULT 'default',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Active,1-inactive',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `account` (`accountid`),
  KEY `ip` (`ip`),
  KEY `prefix` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_map`
--

LOCK TABLES `ip_map` WRITE;
/*!40000 ALTER TABLE `ip_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL,
  `languagename` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `locale` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'eng','English','en_En');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_key` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `localkey` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localization`
--

DROP TABLE IF EXISTS `localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `country_id` int NOT NULL,
  `in_caller_id_originate` varchar(200) NOT NULL,
  `out_caller_id_originate` varchar(200) NOT NULL,
  `number_originate` varchar(200) NOT NULL,
  `in_caller_id_terminate` varchar(200) NOT NULL,
  `out_caller_id_terminate` varchar(200) NOT NULL,
  `number_terminate` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` datetime DEFAULT '1000-01-01 00:00:00',
  `modified_date` datetime DEFAULT '1000-01-01 00:00:00',
  `dst_base_cid` varchar(200) NOT NULL,
  `custom_rule` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localization`
--

LOCK TABLES `localization` WRITE;
/*!40000 ALTER TABLE `localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_details`
--

DROP TABLE IF EXISTS `mail_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(100) NOT NULL,
  `body` mediumtext NOT NULL,
  `from` varchar(100) NOT NULL,
  `to` varchar(100) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send',
  `template` varchar(100) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `to_number` varchar(20) NOT NULL,
  `sms_body` varchar(500) NOT NULL,
  `sip_user_name` varchar(255) NOT NULL,
  `push_message_body` varchar(555) NOT NULL,
  `callkit_token` varchar(512) NOT NULL,
  `status_code` int NOT NULL,
  `cc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_details`
--

LOCK TABLES `mail_details` WRITE;
/*!40000 ALTER TABLE `mail_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_modules`
--

DROP TABLE IF EXISTS `menu_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_label` varchar(25) NOT NULL,
  `module_name` varchar(25) NOT NULL,
  `module_url` varchar(100) NOT NULL,
  `menu_title` varchar(20) NOT NULL,
  `menu_image` varchar(25) NOT NULL,
  `menu_subtitle` varchar(20) NOT NULL,
  `priority` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_modules`
--

LOCK TABLES `menu_modules` WRITE;
/*!40000 ALTER TABLE `menu_modules` DISABLE KEYS */;
INSERT INTO `menu_modules` VALUES (8,'Invoices','invoice','invoices/invoice_list/','Billing','InvoiceList.png','0',20.1),(9,'Company Profiles','invoice','invoices/invoice_conf_list/','Configuration','InvoiceConf.png','0',90.1),(10,'Calling Cards','callingcards','callingcards/callingcards_list/','Calling Cards','ListCards.png','0',30.1),(11,'Card Brands','brands','callingcards/brands/','Calling Cards','CCBand.png','0',30.2),(12,'Call Report','callingcards','callingcards/callingcards_cdrs/','Calling Cards','CallingCardCDR\'s.png','0',30.3),(13,'DIDs','did','did/did_list/','Inbound','ManageDIDs.png','0',30.1),(14,'Trunks','trunk','trunk/trunk_list/','Carriers','Trunks.png','0',50.2),(15,'Termination Rates','termination','rates/termination_rates_list/','Carriers','OutboundRoutes.png','0',50.3),(16,'Rate Groups','price','pricing/price_list/','Tariff','pricelist.png','0',40.1),(17,'Origination Rates','origination','rates/origination_rates_list/','Tariff','Routes.png','0',40.2),(20,'Live Calls','livecall','freeswitch/livecall_report/','Switch','cdr.png','0',70.3),(26,'Configuration','configuration','systems/configuration/','System Configuration','Configurations.png','System',90.1),(27,'Taxes','taxes','taxes/taxes_list/','Configuration','AccountTaxes.png','0',90.2),(28,'Templates','template','systems/template/','Configuration','TemplateManagement.png','0',90.3),(29,'Opensips devices','opensips','opensips/opensips_list/','Switch','OpensipDevices.png','0',90.2),(31,'Invoices','user','user/user_invoices_list/','Billing','ListAccounts.png','0',1.1),(32,'DIDs','user','user/user_didlist/','Inbound','ManageDIDs.png','0',2.1),(33,'Pinless CLI','user','user/user_animap_list/','Calling Card','Providers.png','0',4.2),(34,'CDRs','user','user/user_cdrs_report/','Reports','cdr.png','0',5.1),(35,'Refill Report','user','user/user_refill_report/','Billing','PaymentReport.png','0',1.3),(36,'SIP Devices','user','user/user_sipdevices/','My Account','freeswitch.png','0',7.2),(37,'Rates','user','user/user_rates_list/','Rates','Routes.png','0',6.1),(40,'Refill Report','refillreport','reports/refillreport/','Billing','PaymentReport.png','0',20.2),(41,'Gateways','fsgateway','freeswitch/fsgateway/','Carriers','Gateway.png','0',50.1),(42,'SIP Profiles','fssipprofile','freeswitch/fssipprofile/','Switch','SipProfiles.png','0',70.1),(48,'Countries','country','systems/country_list/','Configuration','ManageDIDs.png','0',90.4),(49,'Currencies ','currency','systems/currency_list/','Configuration','ManageDIDs.png','0',90.5),(52,'My Rates','resellersrates','rates/resellersrates_list/','Tariff','OutboundRoutes.png','0',52.1),(58,'Opensips','Configuration','systems/configuration/opensips','Configuration','','Settings',80.8),(59,'Callingcard','Configuration','systems/configuration/callingcard','Configuration','','Settings',80.9),(60,'Freeswitch','Configuration','systems/configuration/freeswitch','Configuration','','Settings',80.1),(61,'Paypal','configuration','systems/configuration/paypal','Configuration','','Settings',80.11),(62,'Mass Email1','Configuration','systems/configuration/email','Configuration','','Settings',80.12),(63,'Send Credit','customer','user/user_fund_transfer/','Services','ListAccounts.png','0',3.3),(65,'Signup','Configuration','systems/configuration/signup/','Configuration','','Settings',81),(66,'Refill Coupons','refill','refill_coupon/refill_coupon_list/','Services','cdr.png','0',60.3),(72,'IP Settings','user','user/user_ipmap/','My Account','PaymentReport.png','0',7.3),(73,'Alert Threshold','user','user/user_alert_threshold/','My Account','PaymentReport.png','0',7.5),(74,'Speed Dial','user','user/user_speeddial/','My Account','freeswitch.png','0',7.4),(75,'Provider Outbound','user','user/user_provider_cdrs_report/','Reports','cdr.png','0',4.3),(76,'Opensips','user','user/user_opensips/','Configuration','OpensipDevices.png','0',90.2),(77,'','addons','addons/addons_list/','','','0',74),(79,'Ratedeck','ratedeck','ratedeck/ratedeck_list/','Tariff','Routes.png','0',40.3),(84,'Localizations','localization','localization/localization_list/','Configuration','','0',80.6),(88,'Call Types','calltype','calltype/calltype_list/','Tariff','packages.png','0',55),(89,'Access Numbers','accessnumber','accessnumber/accessnumber_list/','Inbound','','0',30.3),(91,'Products','products','products/products_list/','Services','Routes.png','0',60.1),(92,'Orders','orders','orders/orders_list/','Services','Routes.png','0',60.2),(93,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(100,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(107,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(114,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(121,'Localizations','localization','localization/localization_list/','Switch','','0',70.4),(131,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(138,'Localizations','localization','localization/localization_list/','Switch','','0',70.4),(148,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(149,'SIP Devices','fssipdevices','freeswitch/fssipdevices/','Accounts','Devices.png','Customers',10.2),(150,'IP Settings','ipmap','ipmap/ipmap_detail/','Accounts','Gateway.png','Customers',10.3),(151,'Caller IDs','animap','animap/animap_detail/','Accounts','Gateway.png','Customers',10.4),(152,'Resellers','reseller','accounts/reseller_list/','Accounts','reseller.png','0',10.4),(153,'Admins','admin','accounts/admin_list/','Accounts','ListAccounts.png','0',10.5),(154,'Roles & Permission','permissions','permissions/permissions_list/','Accounts','','0',10.6),(155,'Localizations','localization','localization/localization_list/','Switch','','0',70.4),(165,'Customer','customerReport','reports/customerReport/','Reports','cdr.png','Call Detail Reports',80.1),(166,'Reseller','resellerReport','reports/resellerReport/','Reports','cdr.png','Call Detail Reports',80.2),(167,'Provider Outbound','providerReport','reports/providerReport/','Reports','cdr.png','Call Detail Reports',80.3),(168,'Customer Summary','customer','summary/customer/','Reports','cdr.png','Call Summary Reports',81.1),(169,'Reseller Summary','reseller','summary/reseller/','Reports','cdr.png','Call Summary Reports',81.2),(170,'Provider','provider','summary/provider/','Reports','cdr.png','Call Summary Reports',81.3),(171,'Email History','email','email/email_history_list/','Reports','ListAccounts.png','0',82.1),(172,'Audit Log','audit','audit/audit_list/','Reports','','0',82.2),(177,'Database Backup','database','systems/database_restore/','Configuration','Configurations.png','0',90.6),(179,'Crons','cronsettings','cronsettings/cronsettings_list/','Configuration','Configurations.png','0',90.8),(180,'Settings','configuration','systems/configuration/global','Configuration','Configurations.png','0',90.9),(182,'Products','user','user/user_products_list/','Services','ListAccounts.png','0',3.1),(183,'Settings','configuration','systems/configuration/payment_methods','Configuration','Configurations.png','0',90.12),(396,'Order New','user','user/user_available_products/','Services','Routes.png','0',3.2),(397,'Pin','user','user/user_pin_add/','Calling Card','','0',4.3),(398,'Access Numbers','accessnumber','accessnumber/accessnumber_list/','Calling Card','','0',4.1),(399,'Profile','user','user/user_myprofile/','My Account','0','0',7.1),(400,'Dashboard','user','user/user/','Home','','0',0),(401,'Change Password','user','user/user_change_password','My Account','0','0',7.6),(543,'Product Summary Reports','product','summary/product/','Reports','','0',82.4),(544,'Product Summary Reports','product','summary/product/','Reports','','0',82.4),(546,'','','products/products_list/','','','',0),(547,'','','products/products_list/','','','',0),(548,'TopUp','products','products/products_topuplist/','Services','Routes.png','0',60.4),(550,'Refill Coupon','refill','user/user_refill_coupon_list/','Services','ListAccounts.png','0',3.4),(555,'Pin','user','user/user_pin_add/','Calling Card','','0',4.3),(556,'Product Summary Reports','product','summary/product/','Reports','ListAccounts.png','0',82.4),(557,'Languages','languages','systems/languages_list/','Configuration','Configurations.png','Languages',91.1),(558,'Translations','translation','systems/translation_list/','Configuration','Configurations.png','Languages',91.2),(559,'Commission Report','commission','reports/commission_report_list/','Billing','0','0',83.1),(560,'Timezone','systems','systems/timezone_list/','Configuration','','0',90.7),(561,'Low Balance','low_balance','low_balance/low_balance_list/','Reports','','0',89.3);
/*!40000 ALTER TABLE `menu_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_category` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `setup_fee` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `billing_type` int NOT NULL,
  `billing_days` int NOT NULL DEFAULT '0',
  `free_minutes` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL,
  `billing_date` datetime NOT NULL,
  `next_billing_date` datetime NOT NULL,
  `is_terminated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 FOR NO AND 1 FOR YES',
  `termination_date` datetime NOT NULL,
  `termination_note` varchar(255) NOT NULL,
  `from_currency` varchar(3) NOT NULL,
  `exchange_rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `to_currency` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `parent_order_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `order_generated_by` int NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_routes`
--

DROP TABLE IF EXISTS `outbound_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound_routes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(15) DEFAULT NULL,
  `comment` varchar(80) DEFAULT '',
  `connectcost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `includedseconds` int NOT NULL DEFAULT '0',
  `cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `trunk_id` int NOT NULL DEFAULT '0',
  `inc` int NOT NULL,
  `strip` varchar(40) NOT NULL DEFAULT '',
  `prepend` varchar(40) NOT NULL DEFAULT '',
  `precedence` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  `init_inc` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pattern2` (`pattern`,`trunk_id`),
  KEY `trunk` (`trunk_id`),
  KEY `pattern` (`pattern`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_routes`
--

LOCK TABLES `outbound_routes` WRITE;
/*!40000 ALTER TABLE `outbound_routes` DISABLE KEYS */;
INSERT INTO `outbound_routes` VALUES (1,'^1.*','USA',0.00000,0,0.10000,1,60,'','',0,0,0,30,'2016-07-26 20:12:02','2016-07-26 20:12:49');
/*!40000 ALTER TABLE `outbound_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_patterns`
--

DROP TABLE IF EXISTS `package_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_patterns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `patterns` varchar(50) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`country_id`,`patterns`),
  KEY `package_id` (`product_id`),
  KEY `patterns` (`patterns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_patterns`
--

LOCK TABLES `package_patterns` WRITE;
/*!40000 ALTER TABLE `package_patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `packages_view`
--

DROP TABLE IF EXISTS `packages_view`;
/*!50001 DROP VIEW IF EXISTS `packages_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `packages_view` AS SELECT 
 1 AS `id`,
 1 AS `product_id`,
 1 AS `package_name`,
 1 AS `free_minutes`,
 1 AS `applicable_for`,
 1 AS `accountid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `amount` decimal(20,5) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `actual_amount` decimal(20,5) NOT NULL,
  `payment_fee` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `reseller_id` int NOT NULL DEFAULT '0',
  `transaction_id` varchar(50) NOT NULL,
  `customer_ip` varchar(100) NOT NULL,
  `user_currency` varchar(50) NOT NULL,
  `currency_rate` decimal(10,5) NOT NULL COMMENT 'user currency rate against base currency rate',
  `transaction_details` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `login_type` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text NOT NULL,
  `edit_permissions` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,'reseller',0,'reseller',1,'{\"accounts\":{\"customer_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"mass_create\":\"0\",\"export\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"callerid\":\"0\",\"payment\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"reseller_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"callerid\":\"0\",\"payment\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"}},\"freeswitch\":{\"fssipdevices\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"ipmap\":{\"ipmap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"animap\":{\"animap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"invoices\":{\"invoice_list\":{\"main\":\"0\",\"list\":\"0\",\"download\":\"0\",\"edit\":\"0\",\"generate\":\"0\",\"search\":\"0\",\"delete\":\"0\",\"payment\":\"0\"},\"invoice_conf_list\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\"}},\"reports\":{\"refillreport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"commission_report_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\",\"edit\":\"0\"},\"customerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"resellerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"}},\"did\":{\"did_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"forward\":\"0\",\"search\":\"0\",\"purchase\":\"0\",\"buy_did\":\"0\",\"available_did\":\"0\"},\"did_available_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"accessnumber\":{\"accessnumber_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"pricing\":{\"price_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"duplicate\":\"0\"}},\"rates\":{\"origination_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"resellersrates_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"custom_rates\":{\"custom_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"delete\":\"0\",\"export\":\"0\"}},\"products\":{\"products_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"products_listing\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"products_topuplist\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"payment\":\"0\"}},\"orders\":{\"orders_list\":{\"main\":\"0\",\"list\":\"0\",\"new\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"refill_coupon\":{\"refill_coupon_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\"}},\"summary\":{\"customer\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"reseller\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"product\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"systems\":{\"template\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\",\"search\":\"0\"}}}','','2019-06-04 11:58:46','2021-05-06 05:43:31'),(3,'Admin_permission',0,'Permissions',0,'{\"accounts\":{\"customer_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"mass_create\":\"0\",\"create_provider\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"callerid\":\"0\",\"payment\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"reseller_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"payment\":\"0\"},\"admin_list\":{\"main\":\"0\",\"list\":\"0\",\"create_admin\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"freeswitch\":{\"fssipdevices\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"livecall_report\":{\"main\":\"0\",\"list\":\"0\"}},\"ipmap\":{\"ipmap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"animap\":{\"animap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"permissions\":{\"permissions_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"invoices\":{\"invoice_list\":{\"main\":\"0\",\"list\":\"0\",\"download\":\"0\",\"edit\":\"0\",\"generate\":\"0\",\"search\":\"0\",\"delete\":\"0\"},\"invoice_conf_list\":{\"main\":\"0\",\"list\":\"0\"}},\"reports\":{\"refillreport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"commission_report_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"customerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"resellerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"providerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"}},\"did\":{\"did_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"forward\":\"0\",\"search\":\"0\",\"purchase\":\"0\"}},\"accessnumber\":{\"accessnumber_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"pricing\":{\"price_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"duplicate\":\"0\"}},\"rates\":{\"origination_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"}},\"products\":{\"products_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"assign\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"orders\":{\"orders_list\":{\"main\":\"0\",\"list\":\"0\",\"new\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"low_balance\":{\"low_balance_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"summary\":{\"product\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"taxes\":{\"taxes_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"systems\":{\"template\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\",\"search\":\"0\"}}}','null','2019-01-26 07:41:03','2021-05-06 05:42:26');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelists`
--

DROP TABLE IF EXISTS `pricelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricelists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `markup` varchar(50) NOT NULL DEFAULT '0',
  `routing_type` tinyint(1) NOT NULL DEFAULT '0',
  `initially_increment` int NOT NULL,
  `inc` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active,1 for inactive,2 for delete',
  `reseller_id` int NOT NULL DEFAULT '0' COMMENT 'Accounts table id',
  `pricelist_id_admin` int NOT NULL DEFAULT '0',
  `routing_prefix` varchar(100) NOT NULL,
  `call_count` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `reseller_id` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelists`
--

LOCK TABLES `pricelists` WRITE;
/*!40000 ALTER TABLE `pricelists` DISABLE KEYS */;
INSERT INTO `pricelists` VALUES (1,'default','0',0,0,60,0,0,0,'',0,'2016-07-25 00:00:00','2016-07-26 00:00:00');
/*!40000 ALTER TABLE `pricelists` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fluxuser`@`localhost`*/ /*!50003 TRIGGER `updateRates` AFTER UPDATE ON `pricelists` FOR EACH ROW BEGIN
   if new.status = '2'
   then
       Delete from routes where pricelist_id = new.id;
   end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_id` int NOT NULL,
  `description` varchar(500) NOT NULL,
  `product_category` int NOT NULL,
  `buy_cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `price` decimal(20,5) DEFAULT '0.00000',
  `setup_fee` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `can_resell` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for no,0 for yes',
  `commission` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `billing_type` tinyint(1) NOT NULL,
  `billing_days` int NOT NULL DEFAULT '0',
  `free_minutes` int NOT NULL DEFAULT '0',
  `applicable_for` int NOT NULL,
  `apply_on_existing_account` tinyint(1) NOT NULL,
  `apply_on_rategroups` varchar(50) NOT NULL,
  `destination_rategroups` varchar(50) NOT NULL,
  `destination_countries` varchar(256) NOT NULL,
  `destination_calltypes` varchar(50) NOT NULL,
  `release_no_balance` tinyint(1) NOT NULL,
  `can_purchase` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for yes, 1 for no',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active,1 for inactive',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0 for no,1 for yes',
  `created_by` int NOT NULL,
  `reseller_id` int NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_cdr_summary`
--

DROP TABLE IF EXISTS `provider_cdr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_cdr_summary` (
  `date_hour` varchar(25) NOT NULL,
  `country_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `trunk_id` int NOT NULL,
  `total_calls` int NOT NULL,
  `answered_calls` int NOT NULL,
  `minutes` varchar(50) NOT NULL,
  `cost` decimal(15,3) NOT NULL,
  PRIMARY KEY (`date_hour`,`country_id`,`provider_id`,`trunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_cdr_summary`
--

LOCK TABLES `provider_cdr_summary` WRITE;
/*!40000 ALTER TABLE `provider_cdr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_cdr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q850code`
--

DROP TABLE IF EXISTS `q850code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `q850code` (
  `cause` varchar(70) NOT NULL,
  `code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q850code`
--

LOCK TABLES `q850code` WRITE;
/*!40000 ALTER TABLE `q850code` DISABLE KEYS */;
INSERT INTO `q850code` VALUES ('UNSPECIFIED',0),('UNALLOCATED_NUMBER',1),('NO_ROUTE_TRANSIT_NET',2),('NO_ROUTE_DESTINATION',3),('CHANNEL_UNACCEPTABLE',6),('CALL_AWARDED_DELIVERED',7),('NORMAL_CLEARING',16),('USER_BUSY',17),('NO_USER_RESPONSE',18),('NO_ANSWER',19),('SUBSCRIBER_ABSENT',20),('CALL_REJECTED',21),('NUMBER_CHANGED',22),('REDIRECTION_TO_NEW_DESTINATION',23),('EXCHANGE_ROUTING_ERROR',25),('DESTINATION_OUT_OF_ORDER',27),('INVALID_NUMBER_FORMAT',28),('FACILITY_REJECTED',29),('RESPONSE_TO_STATUS_ENQUIRY',30),('NORMAL_UNSPECIFIED',31),('NORMAL_CIRCUIT_CONGESTION',34),('NETWORK_OUT_OF_ORDER',38),('NORMAL_TEMPORARY_FAILURE',41),('SWITCH_CONGESTION',42),('ACCESS_INFO_DISCARDED',43),('REQUESTED_CHAN_UNAVAIL',44),('PRE_EMPTED',45),('FACILITY_NOT_SUBSCRIBED',50),('OUTGOING_CALL_BARRED',52),('INCOMING_CALL_BARRED',54),('BEARERCAPABILITY_NOTAUTH',57),('BEARERCAPABILITY_NOTAVAIL',58),('SERVICE_UNAVAILABLE',63),('BEARERCAPABILITY_NOTIMPL',65),('CHAN_NOT_IMPLEMENTED',66),('FACILITY_NOT_IMPLEMENTED',69),('SERVICE_NOT_IMPLEMENTED',79),('INVALID_CALL_REFERENCE',81),('INCOMPATIBLE_DESTINATION',88),('INVALID_MSG_UNSPECIFIED',95),('MANDATORY_IE_MISSING',96),('MESSAGE_TYPE_NONEXIST',97),('WRONG_MESSAGE',98),('IE_NONEXIST',99),('INVALID_IE_CONTENTS',100),('WRONG_CALL_STATE',101),('RECOVERY_ON_TIMER_EXPIRE',102),('MANDATORY_IE_LENGTH_ERROR',103),('PROTOCOL_ERROR',111),('INTERWORKING',127),('ORIGINATOR_CANCEL',487),('CRASH',500),('SYSTEM_SHUTDOWN',501),('LOSE_RACE',502),('MANAGER_REQUEST',503),('BLIND_TRANSFER',600),('ATTENDED_TRANSFER',601),('ALLOTTED_TIMEOUT',602),('USER_CHALLENGE',603),('MEDIA_TIMEOUT',604),('PICKED_OFF',605),('USER_NOT_REGISTERED',606),('PROGRESS_TIMEOUT',607),('GATEWAY_DOWN',609);
/*!40000 ALTER TABLE `q850code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratedeck`
--

DROP TABLE IF EXISTS `ratedeck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratedeck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `destination` varchar(80) NOT NULL,
  `country_id` int NOT NULL,
  `pattern` varchar(40) NOT NULL,
  `call_type` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 = Disabled / Inactive / False / No , 0 = Enable / Active / True / Yes,2->Deleted',
  `reseller_id` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pattern` (`pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratedeck`
--

LOCK TABLES `ratedeck` WRITE;
/*!40000 ALTER TABLE `ratedeck` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratedeck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refill_coupon`
--

DROP TABLE IF EXISTS `refill_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refill_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL,
  `amount` decimal(20,5) NOT NULL,
  `description` varchar(55) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Active,1=Inactive,2-Inuse',
  `firstused` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refill_coupon`
--

LOCK TABLES `refill_coupon` WRITE;
/*!40000 ALTER TABLE `refill_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `refill_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_process_list`
--

DROP TABLE IF EXISTS `reports_process_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_process_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_execution_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_process_list`
--

LOCK TABLES `reports_process_list` WRITE;
/*!40000 ALTER TABLE `reports_process_list` DISABLE KEYS */;
INSERT INTO `reports_process_list` VALUES (1,'2021-05-06 05:43:55','get_cdr_records');
/*!40000 ALTER TABLE `reports_process_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_cdrs`
--

DROP TABLE IF EXISTS `reseller_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_cdrs` (
  `uniqueid` varchar(60) NOT NULL DEFAULT '',
  `accountid` int DEFAULT '0',
  `callerid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `callednum` varchar(30) NOT NULL DEFAULT '',
  `translated_dst` varchar(30) NOT NULL,
  `billseconds` smallint NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `callstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `debit` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `pricelist_id` smallint NOT NULL DEFAULT '0',
  `package_id` smallint NOT NULL DEFAULT '0',
  `pattern` varchar(20) NOT NULL,
  `notes` varchar(80) NOT NULL,
  `calltype` varchar(80) NOT NULL DEFAULT 'Padrao',
  `reseller_id` int NOT NULL DEFAULT '0',
  `rate_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reseller_code` varchar(20) NOT NULL DEFAULT '',
  `reseller_code_destination` varchar(80) NOT NULL DEFAULT '',
  `reseller_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `call_direction` enum('outbound','inbound') NOT NULL,
  `call_request` tinyint NOT NULL DEFAULT '0',
  `country_id` int NOT NULL,
  `end_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trunk_id` int NOT NULL,
  KEY `rs_cdr_index` (`callstart`,`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cdrs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_cdrs`
--

LOCK TABLES `reseller_cdrs` WRITE;
/*!40000 ALTER TABLE `reseller_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_cdrs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fluxuser`@`localhost`*/ /*!50003 TRIGGER `reseller_cdrs_records` AFTER INSERT ON `reseller_cdrs` FOR EACH ROW BEGIN
   INSERT INTO `cdrs_staging` (`uniqueid`, `accountid`, `callerid`, `callednum`, `billseconds`, `disposition`, `callstart`, `debit`, `cost`, `pricelist_id`, `package_id`, `pattern`, `notes`, `calltype`, `reseller_id`, `rate_cost`, `reseller_code`, `reseller_code_destination`, `reseller_cost`, `call_direction`, `call_request`, `country_id`,`end_stamp`) VALUES ( NEW.uniqueid, NEW.accountid, NEW.callerid, NEW.callednum, NEW.billseconds, NEW.disposition, NEW.callstart, NEW.debit, NEW.cost, NEW.pricelist_id, NEW.package_id, NEW.pattern, NEW.notes, NEW.calltype, NEW.reseller_id, NEW.rate_cost, NEW.reseller_code, NEW.reseller_code_destination, NEW.reseller_cost, NEW.call_direction, NEW.call_request, NEW.country_id,NEW.end_stamp);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reseller_products`
--

DROP TABLE IF EXISTS `reseller_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint NOT NULL,
  `buy_cost` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `free_minutes` int NOT NULL DEFAULT '0',
  `commission` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `setup_fee` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `billing_days` int NOT NULL,
  `billing_type` tinyint NOT NULL COMMENT '0 for onetime,1 for recurring',
  `is_owner` tinyint NOT NULL COMMENT '0 for yes, 1 for no',
  `is_optin` tinyint NOT NULL DEFAULT '1' COMMENT '0 for yes, 1 for no',
  `optin_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`account_id`,`reseller_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_products`
--

LOCK TABLES `reseller_products` WRITE;
/*!40000 ALTER TABLE `reseller_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_and_permission`
--

DROP TABLE IF EXISTS `roles_and_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_and_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Admin,1:Reseller',
  `permission_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Main,1:Edit',
  `menu_name` varchar(50) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `sub_module_name` varchar(50) NOT NULL,
  `module_url` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `permissions` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Active,1:Inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `priority` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_and_permission`
--

LOCK TABLES `roles_and_permission` WRITE;
/*!40000 ALTER TABLE `roles_and_permission` DISABLE KEYS */;
INSERT INTO `roles_and_permission` VALUES (1,0,0,'accounts','accounts','customers','customer_list','Customers','[\"main\",\"list\",\"create\",\"mass_create\",\"create_provider\",\"export\",\"import\",\"delete\",\"edit\",\"callerid\",\"payment\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:03',1.10000),(2,0,0,'accounts','freeswitch','customers','fssipdevices','Sip Devices','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.20000),(3,0,0,'accounts','ipmap','customers','ipmap_detail','IP Settings','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.30000),(4,0,0,'accounts','animap','customers','animap_detail','Caller IDs','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.40000),(5,0,0,'accounts','accounts','','reseller_list','Resellers','[\"main\",\"list\",\"create\",\"export\",\"delete\",\"edit\",\"search\",\"payment\"]',0,'2019-01-25 09:01:03',1.50000),(6,0,0,'accounts','accounts','','admin_list','Admins','[\"main\",\"list\",\"create_admin\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:03',1.60000),(7,0,0,'accounts','permissions','','permissions_list','Roles & Permission','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:03',1.70000),(8,0,0,'billing','invoices','','invoice_list','Invoices','[\"main\",\"list\",\"download\",\"edit\",\"generate\",\"search\",\"delete\"]',0,'2019-01-25 09:01:03',2.10000),(9,0,0,'billing','reports','','refillreport','Refill Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:03',2.20000),(12,0,0,'inbound','did','','did_list','DIDs','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"forward\",\"search\",\"purchase\"]',0,'2019-01-25 09:01:05',3.10000),(13,0,0,'inbound','accessnumber','','accessnumber_list','Access Numbers','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',3.20000),(14,0,0,'tariff','pricing','','price_list','Rate Groups','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"duplicate\"]',0,'2019-01-25 09:01:05',4.10000),(15,0,0,'tariff','rates','','origination_rates_list','Origination Rates','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:05',4.20000),(18,0,0,'services','products','','products_list','Products','[\"main\",\"list\",\"create\",\"assign\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.10000),(19,0,0,'services','orders','','orders_list','Orders','[\"main\",\"list\",\"new\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.20000),(23,0,0,'switch','freeswitch','','livecall_report','Live Calls','[\"main\",\"list\"]',0,'2019-01-25 09:01:05',6.20000),(26,0,0,'reports','reports','call_detail_reports','customerReport','Customer','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.10000),(27,0,0,'reports','reports','call_detail_reports','resellerReport','Reseller','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.20000),(28,0,0,'reports','reports','call_detail_reports','providerReport','Provider Outbound','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.30000),(34,0,0,'reports','summary','product','product','Product Summary Report','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',7.90000),(35,0,0,'configuration','invoices','','invoice_conf_list','Profiles','[\"main\",\"list\"]',0,'2019-01-25 09:01:06',8.10000),(36,0,0,'configuration','taxes','','taxes_list','Taxes','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:06',8.20000),(37,0,0,'configuration','systems','','template','Templates','[\"main\",\"list\",\"edit\",\"search\"]',0,'2019-01-25 09:01:06',8.30000),(39,1,0,'accounts','accounts','customers','customer_list','Customers','[\"main\",\"list\",\"create\",\"mass_create\",\"export\",\"delete\",\"edit\",\"callerid\",\"payment\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:03',1.10000),(40,1,0,'accounts','freeswitch','customers','fssipdevices','Sip Devices','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.20000),(41,1,0,'accounts','ipmap','customers','ipmap_detail','IP Settings','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.30000),(42,1,0,'accounts','animap','customers','animap_detail','Caller IDs','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.40000),(43,1,0,'accounts','accounts','','reseller_list','Resellers','[\"main\",\"list\",\"create\",\"export\",\"delete\",\"edit\",\"callerid\",\"payment\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:03',1.50000),(44,1,0,'billing','invoices','','invoice_list','Invoices','[\"main\",\"list\",\"download\",\"edit\",\"generate\",\"search\",\"delete\",\"payment\"]',0,'2019-01-25 09:01:03',2.10000),(45,1,0,'billing','reports','','refillreport','Refill Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:03',2.20000),(47,1,0,'billing','reports','commission_report','commission_report_list','Commission Reports','[\"main\",\"list\",\"export\",\"search\",\"edit\"]',0,'2019-01-25 09:01:06',2.40000),(48,1,0,'inbound','did','','did_list','DIDs','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"forward\",\"search\",\"purchase\",\"buy_did\",\"available_did\"]',0,'2019-01-25 09:01:05',3.10000),(49,1,0,'inbound','accessnumber','','accessnumber_list','Access Numbers','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:05',3.20000),(50,1,0,'tariff','pricing','','price_list','Rate Groups','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"duplicate\"]',0,'2019-01-25 09:01:05',4.10000),(51,1,0,'tariff','rates','','origination_rates_list','Origination Rates','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:05',4.20000),(52,1,0,'tariff','rates','resellersrates','resellersrates_list','My Rates','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',4.30000),(53,1,0,'services','products','','products_list','Products','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.10000),(54,1,0,'services','orders','','orders_list','Orders','[\"main\",\"list\",\"new\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.20000),(55,1,0,'services','products','','products_topuplist','TopUp','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"payment\"]',0,'2019-02-04 11:49:27',5.30000),(56,1,0,'reports','reports','call_detail_reports','customerReport','Customer','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.10000),(57,1,0,'reports','reports','call_detail_reports','resellerReport','Reseller','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.20000),(58,1,0,'reports','summary','call_summary_reports','customer','Customer Summary','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.30000),(59,1,0,'reports','summary','call_summary_reports','reseller','Reseller Summary','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.40000),(60,1,0,'configuration','invoices','','invoice_conf_list','Profile','[\"main\",\"list\",\"edit\"]',0,'2019-01-25 09:01:06',7.10000),(61,1,0,'configuration','systems','','template','Templates','[\"main\",\"list\",\"edit\",\"search\"]',0,'2019-01-25 09:01:06',7.20000),(112,1,0,'services','refill_coupon','','refill_coupon_list','Refill Coupon','[\"main\",\"list\",\"search\",\"create\",\"export\",\"import\",\"delete\"]',0,'1000-01-01 00:00:00',5.30000),(113,1,0,'services','products','','products_listing','Parent Products','[\"main\",\"list\",\"search\"]',0,'1000-01-01 00:00:00',5.20000),(150,1,0,'tariff','custom_rates','0','custom_rates_list','Custom Rates','[\"main\",\"list\",\"search\",\"create\",\"edit\",\"delete\",\"export\"]',0,'2019-01-25 09:01:03',4.21000),(168,1,0,'inbound','did','','did_available_list','Available DIDs','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:05',3.30000),(169,1,0,'reports','summary','product','product','Product Summary Report','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',7.90000),(170,0,0,'reports','low_balance',' ','low_balance_list','Low Balance','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',7.80000),(171,0,0,'billing','reports',' ','commission_report_list','Commission Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:03',2.30000);
/*!40000 ALTER TABLE `roles_and_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(40) DEFAULT '',
  `comment` varchar(80) DEFAULT '',
  `connectcost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `includedseconds` int NOT NULL,
  `cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `pricelist_id` int DEFAULT '0',
  `inc` int DEFAULT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `call_type` varchar(20) NOT NULL,
  `routing_type` varchar(50) NOT NULL,
  `percentage` varchar(50) NOT NULL,
  `call_count` int NOT NULL,
  `accountid` int DEFAULT '0',
  `reseller_id` int DEFAULT '0',
  `precedence` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  `trunk_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Trunk id for force routing',
  `init_inc` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_rg_accid_key` (`pattern`,`pricelist_id`,`accountid`),
  KEY `pattern` (`pattern`),
  KEY `pricelist` (`pricelist_id`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'^1.*','USA',0.00000,0,0.20000,1,60,0,'','','',0,0,0,0,0,'0',30,'2016-07-26 15:11:50','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routing`
--

DROP TABLE IF EXISTS `routing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pricelist_id` int NOT NULL,
  `trunk_id` int NOT NULL,
  `routes_id` int NOT NULL DEFAULT '0',
  `percentage` varchar(20) NOT NULL,
  `call_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routing`
--

LOCK TABLES `routing` WRITE;
/*!40000 ALTER TABLE `routing` DISABLE KEYS */;
INSERT INTO `routing` VALUES (1,1,1,0,'',0),(11,3,1,0,'',0);
/*!40000 ALTER TABLE `routing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_devices`
--

DROP TABLE IF EXISTS `sip_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sip_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `sip_profile_id` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL DEFAULT '0',
  `dir_params` longtext NOT NULL,
  `dir_vars` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:active,1:inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `call_waiting` int NOT NULL DEFAULT '0' COMMENT '0:Enable 1:Disable',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_devices`
--

LOCK TABLES `sip_devices` WRITE;
/*!40000 ALTER TABLE `sip_devices` DISABLE KEYS */;
INSERT INTO `sip_devices` VALUES (1,'4727985745',1,0,2,'{\"password\":\"+AZ9X9cwwX@w-hyX\",\"vm-enabled\":\"true\",\"vm-password\":\"mfpV9CY|.2gX\",\"vm-mailto\":\"\",\"vm-attach-file\":\"true\",\"vm-keep-local-after-email\":\"true\",\"vm-email-all-messages\":\"true\"}','{\"effective_caller_id_name\":\"FLUX\",\"effective_caller_id_number\":\"4810338297\"}',0,'2016-07-26 15:19:43','2019-03-05 08:53:21',0);
/*!40000 ALTER TABLE `sip_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_profiles`
--

DROP TABLE IF EXISTS `sip_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sip_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `sip_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sip_port` varchar(6) NOT NULL DEFAULT '',
  `profile_data` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `accountid` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_profiles`
--

LOCK TABLES `sip_profiles` WRITE;
/*!40000 ALTER TABLE `sip_profiles` DISABLE KEYS */;
INSERT INTO `sip_profiles` VALUES (1,'default','$${local_ip_v4}','5060','{"rtp-ip":"$${local_ip_v4}","dialplan":"XML","debug":"0","sip-trace":"no","tls":"false","inbound-reg-force-matching-username":"true","disable-transcoding":"true","all-reg-options-ping":"false","unregister-on-options-fail":"true","log-auth-failures":"true","status":"0","inbound-bypass-media":"false","inbound-proxy-media":"false","disable-transfer":"false","enable-100rel":"false","rtp-timeout-sec":"300","dtmf-duration":"2000","manual-redirect":"true","aggressive-nat-detection":"true","enable-timer":"false","minimum-session-expires":"120","session-timeout-pt":"1800","auth-calls":"true","apply-inbound-acl":"default","inbound-codec-prefs":"PCMA,PCMU","outbound-codec-prefs":"PCMA,PCMU","inbound-late-negotiation":"false","sip-capture":"no","forward-unsolicited-mwi-notify":"false","context":"default","rfc2833-pt":"101","rtp-timer-name":"soft","hold-music":"$${hold_music}","manage-presence":"true","presence-hosts":"$${domain},$${local_ip_v4}","presence-privacy":"$${presence_privacy}","inbound-codec-negotiation":"generous","auth-all-packets":"false","ext-rtp-ip":"$${local_ip_v4}","ext-sip-ip":"$${local_ip_v4}","rtp-hold-timeout-sec":"1800","force-register-domain":"$${domain}","force-subscription-domain":"$${domain}","force-register-db-domain":"$${domain}","user-agent-string":"Flux SBC 6.0","challenge-realm":"auto_from","nonce-ttl":"60","pass-callee-id":"false", "dtmf_type":"rfc2833"}','2015-01-21 17:25:01','2019-03-05 08:25:47',0,0);
/*!40000 ALTER TABLE `sip_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speed_dial`
--

DROP TABLE IF EXISTS `speed_dial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speed_dial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speed_num` int NOT NULL,
  `number` varchar(15) NOT NULL,
  `accountid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speed_dial`
--

LOCK TABLES `speed_dial` WRITE;
/*!40000 ALTER TABLE `speed_dial` DISABLE KEYS */;
/*!40000 ALTER TABLE `speed_dial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sweeplist`
--

DROP TABLE IF EXISTS `sweeplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sweeplist` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sweep` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sweeplist`
--

LOCK TABLES `sweeplist` WRITE;
/*!40000 ALTER TABLE `sweeplist` DISABLE KEYS */;
INSERT INTO `sweeplist` VALUES (0,'Daily'),(2,'Monthly');
/*!40000 ALTER TABLE `sweeplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(48) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `field_type` varchar(250) NOT NULL DEFAULT 'default_system_input',
  `comment` varchar(255) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT '2019-04-01 00:00:00',
  `reseller_id` int NOT NULL,
  `is_display` tinyint(1) NOT NULL DEFAULT '0',
  `group_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sub_group` varchar(100) NOT NULL,
  `field_rules` varchar(80) NOT NULL DEFAULT '' COMMENT 'CI Rules for validation',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (11,'opensips_dbengine','Opensips DB Engine','MySQL','default_system_input','For now this must be MySQL','2019-05-24 19:03:37',0,1,'signup','opensips',''),(12,'opensips','Opensips','1','enable_disable_option','Set enable to add opensips support','2019-05-24 19:03:37',0,1,'signup','opensips',''),(13,'opensips_dbname','Opensips DB Name','opensips','default_system_input','Set opensips database name','2019-05-24 19:03:37',0,1,'signup','opensips',''),(14,'opensips_dbuser','Opensips DB User','DB_USER','default_system_input','Set opensips database user','2019-05-24 19:03:37',0,1,'signup','opensips',''),(15,'opensips_dbhost','Opensips DB Host','DB_HOST','default_system_input','Set opensips database host','2019-05-24 19:03:37',0,1,'signup','opensips',''),(16,'opensips_dbpass','Opensips DB Pass','DB_PASSWORD','default_system_input','Set opensips database password','2019-05-24 19:03:37',0,1,'signup','opensips',''),(17,'opensips_domain','Opensips Domain','127.0.0.1','default_system_input','Set opensips domain','2019-05-24 19:03:37',0,1,'signup','opensips',''),(22,'email','Email Notifications','0','enable_disable_option','Set enable to send email notifications','2019-05-24 19:03:37',0,0,'notifications','Email',''),(26,'starting_digit','Starting Digit','0','default_system_input','Set the digits that all calling cards must start with. 0=disabled. Example : 1234','2019-05-24 19:03:37',0,0,'signup','',''),(35,'card_length','Card Length','10','default_system_input','Set number of digits for calling cards','2019-05-24 19:03:37',0,0,'signup','',''),(42,'pin_length','Pin Length','6','default_system_input','Set number of digits for pin numbers','2019-05-24 19:03:37',0,0,'signup','',''),(44,'decimal_points','Decimal Points','4','default_system_input','Set decimal points to use through out system','2019-05-24 19:03:37',0,0,'global','General',''),(54,'pin_retries','Pin retries','3','default_system_input','Set number of retries to validate pin number','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(135,'calling_cards_rate_announce','Rate Announcement','1','enable_disable_option','Enable it to announce rate of the call','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(141,'calling_cards_number_input_timeout','Card Input Timeout','15000','default_system_input','How long do we wait when entering the calling card number?  Specified in MS','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(142,'calling_cards_dial_input_timeout','Dial Input Timeout','15000','default_system_input','How long do we wait when entering the destination number in calling cards? Specified in MS','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(143,'calling_cards_general_input_timeout','General Input Timeout','15000','default_system_input','How long do we wait for input in general menus?  Specified in MS','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(144,'calling_cards_welcome_file','Welcome File','flux-welcome.wav','default_system_input','Set your calling card welcome file','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(174,'base_currency','Base Currency','BRL','base_currency','Set base currency of system.','2019-05-24 19:03:37',0,0,'global','General',''),(179,'default_timezone','Timezone','78','default_timezone','Set default timezone for accounts','2013-05-06 19:34:39',0,0,'signup','',''),(181,'country','Country','28','country','Set default country for accounts','2019-05-24 19:03:37',0,0,'signup','',''),(191,'version','Version','5.0','default_system_input','Current version of FLUX','2019-05-24 19:03:37',0,1,'global','',''),(192,'ivr_count','IVR Count','3','default_system_input','Number of time IVR should play in call','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(193,'calling_cards_balance_announce','Balance Announcement','0','enable_disable_option','To enable balance playback in call','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(196,'smtp','SMTP','1','enable_disable_option','Set yes to use SMTP connection to send email and no to use sendmail connection to send email','2019-05-24 19:03:37',0,0,'notifications','Email',''),(197,'smtp_host','SMTP Host','SMTP_HOST','default_system_input','Set SMTP hostname ','2019-05-24 19:03:37',0,0,'notifications','Email',''),(198,'smtp_port','SMTP Port','25','default_system_input','Set SMTP port','2019-05-24 19:03:37',0,0,'notifications','Email',''),(199,'smtp_user','SMTP User','SMTP_USER_NAME','default_system_input','Set SMTP username','2019-05-24 19:03:37',0,0,'notifications','Email',''),(200,'smtp_pass','SMTP Pass','SMTP_PASS','default_system_input','Set SMTP user password','2019-05-24 19:03:37',0,0,'notifications','Email',''),(204,'default_signup_rategroup','Rate Group','','default_signup_rategroup','Set default rategroup for singup customers','2019-05-24 19:03:37',0,0,'signup','',''),(205,'enable_signup','Enable Signup','0','enable_disable_option','Set enable to add signup module','2019-05-24 19:03:37',0,0,'signup','',''),(206,'create_sipdevice','Create SIP Device','0','enable_disable_option','Set yes to create sip device when customer will do singup in system','2019-05-24 19:03:37',0,0,'signup','',''),(207,'balance','Initial Balance','0','default_system_input','Set balance for newly created customer','2019-05-24 19:03:37',0,0,'signup','',''),(208,'refill_coupon_length','Refill Coupon Length','8','default_system_input','Set refill coupon generation length','2019-05-24 19:03:37',0,0,'global','General',''),(209,'minimum_fund_transfer','Minimum Fund Transfer','1','default_system_input','Set minimum amount for fund transfer','2019-05-24 19:03:37',0,0,'global','General',''),(215,'enterprise','Enterprise','0','enable_disable_option','0:Enable 1:Disable','2019-05-24 19:03:37',0,1,'global','',''),(216,'automatic_invoice','Default Invoice Mode','0','automatic_invoice','Draft will give possibility to admin and reseller to modify invoice after generation whereas Confirmed invoices will be readonly.','2019-05-24 19:03:37',0,0,'global','General',''),(217,'log_path','Log Path','/var/log/flux/','default_system_input','FLUX log files path','2019-05-24 19:03:37',0,0,'global','General',''),(220,'homer_capture_server','Capture Server','','default_system_input','Set enable to capture logs in homer. Format : udp:192.168.1.200:9060','2019-05-24 19:03:37',0,0,'homer','',''),(221,'did_global_translation','DID Localization','0','set_localization_verification','If you wish to translate DID number with some defined number then use this feature. This will be applicable to all DIDs.','2019-05-24 19:03:37',0,0,'calls','General',''),(222,'tax_type','Default Tax','0,1','tax_type','Set Default taxes for tax_description','2019-05-24 19:03:37',0,0,'signup','',''),(223,'notifications','Account Notification','0','enable_disable_option','Set enable to account notification','2019-05-24 19:03:37',0,0,'signup','',''),(224,'paypal_permission','Payment Gateway Permission','0','enable_disable_option','Set paypal permission','2019-05-24 19:03:37',0,0,'signup','',''),(225,'generate_pin','Generate Pin','0','set_prorate','Allow to Generate Pin','2019-05-24 19:03:37',0,0,'signup','',''),(226,'cps','CPS','0','default_system_input','Allow to CPS','2019-05-24 19:03:37',0,0,'signup','',''),(227,'maxchannels','Concurrent Calls','0','default_system_input','Allow to Concurrent Calls','2019-05-24 19:03:37',0,0,'signup','',''),(228,'password_type','Password Strength','0','default_password_input','Set Password Security Type For New Password Creation','2019-05-24 19:03:37',0,0,'global','General',''),(229,'charge_per_min','LC Charge / Min','0','default_system_input','Allow to LC Charge / Min','2019-05-24 19:03:37',0,0,'signup','',''),(231,'is_recording','Allow Recording','1','set_prorate','Allow to Recording','2019-05-24 19:03:37',0,0,'signup','',''),(232,'allow_ip_management','Allow IP Management','1','set_prorate','Allow to IP Management','2019-05-24 19:03:37',0,0,'signup','',''),(233,'local_call','Allow Local Calls','0','set_prorate','Allow to Local Calls','2019-05-24 19:03:37',0,0,'signup','',''),(234,'notify_flag','Email Alerts ?','0','set_prorate','Allow to Email Alerts','2019-05-24 19:03:37',0,0,'signup','',''),(235,'validfordays','Account Valid Days','3650','default_system_input','Allow to Valid Days','2019-05-24 19:03:37',0,0,'signup','',''),(236,'localization_id','Localization','','set_localization_verification','Allow Localization','2019-05-24 19:03:37',0,0,'signup','',''),(238,'trunk_count','Trunk Count','2','default_system_input','Priority trunk count','2019-05-24 19:03:37',0,1,'global','',''),(239,'notify_credit_limit','Balance Below','5','default_system_input','Balance Below','2019-05-24 19:03:37',0,0,'signup','',''),(249,'ewallet_payment','Ewallet Payment Gateway','paypal','ewallet_payment_gateway','Set your ewallet payment gateway','2019-05-24 19:03:37',0,1,'global','',''),(261,'playback_audio_notification','Play Audio Notifications','1','enable_disable_option','Set enable to play audio notification in call','2019-05-24 19:03:37',0,0,'calls','General',''),(264,'voicemail_number','Voicemail Number','7777','default_system_input','Voicemail listen number','2019-05-24 19:03:37',0,0,'calls','General',''),(282,'allow_retires','Allow Max Retries','10','0','Set max retries of signup with same number or email. If exceed then block account and inform user to contact adminstrator','2019-05-24 19:03:37',0,0,'signup','',''),(283,'enable_database','Archive','1','enable_disable_option','Set enable to activate CDR archive feature','2019-05-24 19:03:37',0,0,'database','database',''),(284,'default_database_type','Interval','1','default_system_type','Select Interval of archive cdrs. Example: If Half Year selected then older than 6 Months records will be archived automatically.','2019-05-24 19:03:37',0,0,'database','database',''),(285,'purge_recordings','Recording Files Older Than Days','-1','default_system_input','Remove recordings from directory older than defined days','2019-05-24 19:03:37',0,0,'purge','',''),(286,'purge_audio_log','Audit Logs Older Than Days','-1','default_system_input','Remove audit log from table older than defined days','2019-05-24 19:03:37',0,0,'purge','',''),(287,'purge_cdrs','CDRs Older Than Days','-1','default_system_input','Remove CDRs from table older than defined days','2019-05-24 19:03:37',0,0,'purge','',''),(288,'purge_emails','Emails Older Than Days','-1','default_system_input','Remove emails from table older than defined days','2019-05-24 19:03:37',0,0,'purge','',''),(289,'purge_invoices','Invoices Older Than Days','-1','default_system_input','Remove invoices from table older than defined days','2019-05-24 19:03:37',0,0,'purge','',''),(290,'purge_accounts_expired','Expired Accounts After Days','-1','default_system_input','Removed expired accounts from table after defined days','2019-05-24 19:03:37',0,0,'purge','',''),(298,'mail_log','Mail Log','/var/log/flux/','default_system_input','2019-05-24 19:03:37','2019-05-24 19:03:37',0,0,'notifications','Email',''),(299,'sms_notications','SMS Notifications','1','enable_disable_option','Set Enable To Use SMS Notification ','2019-05-24 19:03:37',0,0,'notifications','SMS',''),(300,'sms_api_key','Nexmo API Key','EnterAPIKey','default_system_input','Set your API Key for SMS','2019-05-24 19:03:37',0,0,'notifications','SMS',''),(301,'sms_secret_key','Nexmo Secret Key','EnterSecretKey','default_system_input','Set your API Secret Key ','2019-05-24 19:03:37',0,0,'notifications','SMS',''),(302,'alert_notications','Push Notifications','1','enable_disable_option','Set enable to send notifications to accounts','2019-05-24 19:03:37',0,0,'notifications','Alert Notifications',''),(320,'paypal_url','Live Url','https://www.paypal.com/cgi-bin/webscr','default_system_input','Set enable to add paypal as payment gateway option','2019-05-24 19:03:37',0,0,'payment_methods','Paypal',''),(321,'paypal_sandbox_url','Sandbox Url','https://www.sandbox.paypal.com/cgi-bin/webscr','default_system_input','Set paypal sandbox url for testing','2019-05-24 19:03:37',0,0,'payment_methods','Paypal',''),(322,'paypal_id','Live Id','your@paypal.com','default_system_input','Set paypal live account id','2019-05-24 19:03:37',0,0,'payment_methods','Paypal',''),(323,'paypal_sandbox_id','Sandbox Id','your@paypal.com','default_system_input','Set paypal sandbox account id for testing','2019-05-24 19:03:37',0,0,'payment_methods','Paypal',''),(325,'paypal_fee','Fee','1','enable_disable_option','Set who should pay paypal fee','2019-05-24 19:03:37',0,0,'payment_methods','Paypal',''),(326,'free_inbound','Rate check for DID','1','set_prorate','Whether to apply rate for inbound calls or not','2019-05-24 19:03:37',0,0,'calls','General',''),(366,'telephone_as_account','Telephone as account number','1','set_prorate','Set Yes to use Telephone number as account number','2019-05-24 19:03:37',0,0,'signup','',''),(371,'currency_conv_api_key','Fixer Key','YourKeyGoesHere','default_system_input','Set your API Key for currency rate','2019-05-24 19:03:37',0,0,'global','General',''),(372,'currency_conv_loss_pct','Currency Conversion Loss Percentage','0','default_system_input','What percentage to allow for currency conversion losses','2019-05-24 19:03:37',0,0,'global','General',''),(386,'purge_accounts_deleted','Deleted Accounts After Days','-1','default_system_input','Remove deleted accounts from table after defined days','2019-05-24 19:03:37',0,0,'purge','',''),(390,'balance_announce','Balance Announcement','1','enable_disable_option','To enable balance playback in call','2019-05-24 19:03:37',0,0,'calls','General',''),(391,'debug','Debug','1','enable_disable_option','To enable call debug, set it to Enable. Logs will appear at /var/log/flux/flux.log','2019-05-24 19:03:37',0,0,'calls','General',''),(392,'call_max_length','Call Max Length','100','default_system_input','Set maximum length (in minute) for call.','2019-05-24 19:03:37',0,0,'calls','General',''),(396,'max_free_length','Max Free Length','100','default_system_input','Set maximum length (In minutes) for calls that are at no charge','2019-05-24 19:03:37',0,0,'calls','General',''),(397,'minutes_announce','Minutes Announcement','1','enable_disable_option','To enable minutes playback in call','2019-05-24 19:03:37',0,0,'calls','General',''),(398,'leg_timeout','Local Call Timeout (Sec.)','60','default_system_input','Define Local SIP2SIP Call Leg Timeout. Default 30 seconds','2019-05-24 19:03:37',0,0,'calls','General',''),(399,'card_retries','Card Retries','3','default_system_input','Set number of retries to validate card number','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(401,'calling_cards_pin_input_timeout','Pin Input Timeout','15000','default_system_input','How long do we wait when entering the pin number? Specified in MS','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(402,'cc_ani_auth','Pinless Authentication','0','enable_disable_option','Set enable to use ANI Authentication','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(403,'calling_cards_timelimit_announce','Timelimit Announcement','0','enable_disable_option','Enable it to announce the time-limit on call','2019-05-24 19:03:37',0,0,'calls','Calling Card',''),(404,'outbound_fax','Outbound Fax','0','enable_disable_option','Set yes to allow outbound fax in call','2019-05-24 19:03:37',0,0,'calls','Fax',''),(405,'inbound_fax','Inbound Fax','0','enable_disable_option','Set enable to allow inbound fax in call','2019-05-24 19:03:37',0,0,'calls','Fax',''),(406,'paypal_tax','Tax','0','default_system_input','Set paypal tax rate (in percentage) apply to recharge amount','2019-05-24 19:03:37',0,0,'payment_methods','Paypal',''),(408,'verification_by','Account Verification By','2','set_prorate_verification','Set verification mode','2019-05-24 19:03:37',0,0,'signup','',''),(548,'generate_invoice','Generate Invoice','0','set_prorate','Allow to Generate Invoice','2019-05-24 19:03:37',0,0,'signup','',''),(577,'otp_expire','OTP Expire Time(min)','10','default_system_input','Set OTP expire time for signup','2019-04-08 10:31:11',0,0,'signup','',''),(579,'number_of_default_rows','Number Of Default Rows','10','default_pagination_size','Set your pagination size','2019-04-01 00:00:00',0,0,'global','General',''),(580,'account_number_editable','Account Number Editable','1','set_prorate','Create new entity account number set editable','2019-04-01 10:32:33',0,0,'global','General',''),(581,'mobile_dialer','Mobile Dialer','1','enable_disable_option','Set Mobile dialer for update password of account same as sip device','2019-04-01 10:32:33',0,0,'global','General',''),(591,'paypal_id','Live Id','your@paypal.com','default_system_input','Set paypal live account id','0000-00-00 00:00:00',11,0,'payment_methods','Paypal',''),(594,'audit_log','Audit Log','0','enable_disable_option','You can enable/disable audit logs','2019-04-01 00:00:00',0,0,'global','General',''),(596,'status','Status','1','set_status','Set enable to activate CDR archive feature','2019-11-08 19:07:34',0,0,'term_and_condition','',''),(597,'url','Url','1','default_system_input','Set enable to activate CDR archive feature','2019-11-08 19:07:34',0,0,'term_and_condition','',''),(598,'text','Text','1','textarea','Set enable to activate CDR archive feature','2019-11-08 19:07:34',0,0,'term_and_condition','',''),(599,'datacoll','Datacoll Details','2021-05-06','default_system_input',NULL,'2019-04-01 00:00:00',0,1,'payment_methods','',''),(600, 'paypal_status', 'Paypal', '1', 'enable_disable_option', 'Set enable to add paypal as payment gateway option', '0000-00-00 00:00:00.000000', '0', '0', 'payment_methods', 'Paypal', ''),(601, 'paypal_mode', 'Environment', '1', 'paypal_mode', 'Set paypal mode. Sandbox for testing', '0000-00-00 00:00:00.000000', '0', '0', 'payment_methods', 'Paypal', '');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxes_priority` int DEFAULT '1',
  `taxes_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `tax_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Default,1:Other',
  `taxes_rate` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `taxes_description` varchar(255) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  PRIMARY KEY (`id`),
  KEY `taxes_priority` (`taxes_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes_to_accounts`
--

DROP TABLE IF EXISTS `taxes_to_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes_to_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL DEFAULT '0',
  `taxes_id` int NOT NULL DEFAULT '0',
  `taxes_priority` tinyint NOT NULL DEFAULT '0',
  `assign_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  KEY `taxes_id` (`taxes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes_to_accounts`
--

LOCK TABLES `taxes_to_accounts` WRITE;
/*!40000 ALTER TABLE `taxes_to_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes_to_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gmttime` varchar(255) DEFAULT NULL,
  `gmtoffset` bigint NOT NULL DEFAULT '0',
  `timezone_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timezone_digit` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES (1,'GMT+01:00',3600,'Europe/Andorra','1'),(2,'GMT+04:00',14400,'Asia/Dubai','4'),(3,'GMT+04:30',16200,'Asia/Kabul','4'),(4,'GMT-04:00',-14400,'America/Antigua','-4'),(5,'GMT-04:00',-14400,'America/Anguilla','-4'),(6,'GMT+01:00',3600,'Europe/Tirane','1'),(7,'GMT+04:00',14400,'Asia/Yerevan','4'),(8,'GMT+01:00',3600,'Africa/Luanda','1'),(9,'GMT+11:00',39600,'Antarctica/Casey','11'),(10,'GMT+07:00',25200,'Antarctica/Davis','7'),(11,'GMT+10:00',36000,'Antarctica/DumontDUrville','10'),(12,'GMT+05:00',18000,'Antarctica/Mawson','5'),(13,'GMT+13:00',46800,'Antarctica/McMurdo','13'),(14,'GMT-03:00',-10800,'Antarctica/Palmer','-3'),(15,'GMT-03:00',-10800,'Antarctica/Rothera','-3'),(16,'GMT+03:00',10800,'Antarctica/Syowa','3'),(17,'GMT+00:00',0,'Antarctica/Troll','0'),(18,'GMT+06:00',21600,'Antarctica/Vostok','6'),(19,'GMT-03:00',-10800,'America/Argentina/Buenos_Aires','-3'),(20,'GMT-03:00',-10800,'America/Argentina/Catamarca','-3'),(21,'GMT-03:00',-10800,'America/Argentina/Cordoba','-3'),(22,'GMT-03:00',-10800,'America/Argentina/Jujuy','-3'),(23,'GMT-03:00',-10800,'America/Argentina/La_Rioja','-3'),(24,'GMT-03:00',-10800,'America/Argentina/Mendoza','-3'),(25,'GMT-03:00',-10800,'America/Argentina/Rio_Gallegos','-3'),(26,'GMT-03:00',-10800,'America/Argentina/Salta','-3'),(27,'GMT-03:00',-10800,'America/Argentina/San_Juan','-3'),(28,'GMT-03:00',-10800,'America/Argentina/San_Luis','-3'),(29,'GMT-03:00',-10800,'America/Argentina/Tucuman','-3'),(30,'GMT-03:00',-10800,'America/Argentina/Ushuaia','-3'),(31,'GMT-11:00',-39600,'Pacific/Pago_Pago','-11'),(32,'GMT+01:00',3600,'Europe/Vienna','1'),(33,'GMT+11:00',39600,'Antarctica/Macquarie','11'),(34,'GMT+10:30',37800,'Australia/Adelaide','10'),(35,'GMT+10:00',36000,'Australia/Brisbane','10'),(36,'GMT+10:30',37800,'Australia/Broken_Hill','10'),(37,'GMT+11:00',39600,'Australia/Currie','11'),(38,'GMT+09:30',34200,'Australia/Darwin','9'),(39,'GMT+08:45',31500,'Australia/Eucla','8'),(40,'GMT+11:00',39600,'Australia/Hobart','11'),(41,'GMT+10:00',36000,'Australia/Lindeman','10'),(42,'GMT+11:00',39600,'Australia/Lord_Howe','11'),(43,'GMT+11:00',39600,'Australia/Melbourne','11'),(44,'GMT+08:00',28800,'Australia/Perth','8'),(45,'GMT+11:00',39600,'Australia/Sydney','11'),(46,'GMT-04:00',-14400,'America/Aruba','-4'),(47,'GMT+02:00',7200,'Europe/Mariehamn','2'),(48,'GMT+04:00',14400,'Asia/Baku','4'),(49,'GMT+01:00',3600,'Europe/Sarajevo','1'),(50,'GMT-04:00',-14400,'America/Barbados','-4'),(51,'GMT+06:00',21600,'Asia/Dhaka','6'),(52,'GMT+01:00',3600,'Europe/Brussels','1'),(53,'GMT+00:00',0,'Africa/Ouagadougou','0'),(54,'GMT+02:00',7200,'Europe/Sofia','2'),(55,'GMT+03:00',10800,'Asia/Bahrain','3'),(56,'GMT+02:00',7200,'Africa/Bujumbura','2'),(57,'GMT+01:00',3600,'Africa/Porto-Novo','1'),(58,'GMT-04:00',-14400,'America/St_Barthelemy','-4'),(59,'GMT-04:00',-14400,'Atlantic/Bermuda','-4'),(60,'GMT+08:00',28800,'Asia/Brunei','8'),(61,'GMT-04:00',-14400,'America/La_Paz','-4'),(62,'GMT-04:00',-14400,'America/Kralendijk','-4'),(63,'GMT-03:00',-10800,'America/Araguaina','-3'),(64,'GMT-03:00',-10800,'America/Bahia','-3'),(65,'GMT-03:00',-10800,'America/Belem','-3'),(66,'GMT-04:00',-14400,'America/Boa_Vista','-4'),(67,'GMT-04:00',-14400,'America/Campo_Grande','-4'),(68,'GMT-04:00',-14400,'America/Cuiaba','-4'),(69,'GMT-05:00',-18000,'America/Eirunepe','-5'),(70,'GMT-03:00',-10800,'America/Fortaleza','-3'),(71,'GMT-03:00',-10800,'America/Maceio','-3'),(72,'GMT-04:00',-14400,'America/Manaus','-4'),(73,'GMT-02:00',-7200,'America/Noronha','-2'),(74,'GMT-04:00',-14400,'America/Porto_Velho','-4'),(75,'GMT-03:00',-10800,'America/Recife','-3'),(76,'GMT-05:00',-18000,'America/Rio_Branco','-5'),(77,'GMT-03:00',-10800,'America/Santarem','-3'),(78,'GMT-03:00',-10800,'America/Sao_Paulo','-3'),(79,'GMT-05:00',-18000,'America/Nassau','-5'),(80,'GMT+06:00',21600,'Asia/Thimphu','6'),(81,'GMT+02:00',7200,'Africa/Gaborone','2'),(82,'GMT+03:00',10800,'Europe/Minsk','3'),(83,'GMT-06:00',-21600,'America/Belize','-6'),(84,'GMT-05:00',-18000,'America/Atikokan','-5'),(85,'GMT-04:00',-14400,'America/Blanc-Sablon','-4'),(86,'GMT-07:00',-25200,'America/Cambridge_Bay','-7'),(87,'GMT-07:00',-25200,'America/Creston','-7'),(88,'GMT-07:00',-25200,'America/Dawson','-7'),(89,'GMT-07:00',-25200,'America/Dawson_Creek','-7'),(90,'GMT-07:00',-25200,'America/Edmonton','-7'),(91,'GMT-07:00',-25200,'America/Fort_Nelson','-7'),(92,'GMT-04:00',-14400,'America/Glace_Bay','-4'),(93,'GMT-04:00',-14400,'America/Goose_Bay','-4'),(94,'GMT-04:00',-14400,'America/Halifax','-4'),(95,'GMT-07:00',-25200,'America/Inuvik','-7'),(96,'GMT-05:00',-18000,'America/Iqaluit','-5'),(97,'GMT-04:00',-14400,'America/Moncton','-4'),(98,'GMT-05:00',-18000,'America/Nipigon','-5'),(99,'GMT-05:00',-18000,'America/Pangnirtung','-5'),(100,'GMT-06:00',-21600,'America/Rainy_River','-6'),(101,'GMT-06:00',-21600,'America/Rankin_Inlet','-6'),(102,'GMT-06:00',-21600,'America/Regina','-6'),(103,'GMT-06:00',-21600,'America/Resolute','-6'),(104,'GMT-03:30',-12600,'America/St_Johns','-4'),(105,'GMT-06:00',-21600,'America/Swift_Current','-6'),(106,'GMT-05:00',-18000,'America/Thunder_Bay','-5'),(107,'GMT-05:00',-18000,'America/Toronto','-5'),(108,'GMT-08:00',-28800,'America/Vancouver','-8'),(109,'GMT-07:00',-25200,'America/Whitehorse','-7'),(110,'GMT-06:00',-21600,'America/Winnipeg','-6'),(111,'GMT-07:00',-25200,'America/Yellowknife','-7'),(112,'GMT+06:30',23400,'Indian/Cocos','6'),(113,'GMT+01:00',3600,'Africa/Kinshasa','1'),(114,'GMT+02:00',7200,'Africa/Lubumbashi','2'),(115,'GMT+01:00',3600,'Africa/Bangui','1'),(116,'GMT+01:00',3600,'Africa/Brazzaville','1'),(117,'GMT+01:00',3600,'Europe/Zurich','1'),(118,'GMT+00:00',0,'Africa/Abidjan','0'),(119,'GMT-10:00',-36000,'Pacific/Rarotonga','-10'),(120,'GMT-03:00',-10800,'America/Punta_Arenas','-3'),(121,'GMT-03:00',-10800,'America/Santiago','-3'),(122,'GMT-05:00',-18000,'Pacific/Easter','-5'),(123,'GMT+01:00',3600,'Africa/Douala','1'),(124,'GMT+08:00',28800,'Asia/Shanghai','8'),(125,'GMT+06:00',21600,'Asia/Urumqi','6'),(126,'GMT-05:00',-18000,'America/Bogota','-5'),(127,'GMT-06:00',-21600,'America/Costa_Rica','-6'),(128,'GMT-05:00',-18000,'America/Havana','-5'),(129,'GMT-01:00',-3600,'Atlantic/Cape_Verde','-1'),(130,'GMT-04:00',-14400,'America/Curacao','-4'),(131,'GMT+07:00',25200,'Indian/Christmas','7'),(132,'GMT+02:00',7200,'Asia/Famagusta','2'),(133,'GMT+02:00',7200,'Asia/Nicosia','2'),(134,'GMT+01:00',3600,'Europe/Prague','1'),(135,'GMT+01:00',3600,'Europe/Berlin','1'),(136,'GMT+01:00',3600,'Europe/Busingen','1'),(137,'GMT+03:00',10800,'Africa/Djibouti','3'),(138,'GMT+01:00',3600,'Europe/Copenhagen','1'),(139,'GMT-04:00',-14400,'America/Dominica','-4'),(140,'GMT-04:00',-14400,'America/Santo_Domingo','-4'),(141,'GMT+01:00',3600,'Africa/Algiers','1'),(142,'GMT-05:00',-18000,'America/Guayaquil','-5'),(143,'GMT-06:00',-21600,'Pacific/Galapagos','-6'),(144,'GMT+02:00',7200,'Europe/Tallinn','2'),(145,'GMT+02:00',7200,'Africa/Cairo','2'),(146,'GMT+01:00',3600,'Africa/El_Aaiun','1'),(147,'GMT+03:00',10800,'Africa/Asmara','3'),(148,'GMT+01:00',3600,'Africa/Ceuta','1'),(149,'GMT+00:00',0,'Atlantic/Canary','0'),(150,'GMT+01:00',3600,'Europe/Madrid','1'),(151,'GMT+03:00',10800,'Africa/Addis_Ababa','3'),(152,'GMT+02:00',7200,'Europe/Helsinki','2'),(153,'GMT+13:00',46800,'Pacific/Fiji','13'),(154,'GMT-03:00',-10800,'Atlantic/Stanley','-3'),(155,'GMT+10:00',36000,'Pacific/Chuuk','10'),(156,'GMT+11:00',39600,'Pacific/Kosrae','11'),(157,'GMT+11:00',39600,'Pacific/Pohnpei','11'),(158,'GMT+00:00',0,'Atlantic/Faroe','0'),(159,'GMT+01:00',3600,'Europe/Paris','1'),(160,'GMT+01:00',3600,'Africa/Libreville','1'),(161,'GMT+00:00',0,'Europe/London','0'),(162,'GMT-04:00',-14400,'America/Grenada','-4'),(163,'GMT+04:00',14400,'Asia/Tbilisi','4'),(164,'GMT-03:00',-10800,'America/Cayenne','-3'),(165,'GMT+00:00',0,'Europe/Guernsey','0'),(166,'GMT+00:00',0,'Africa/Accra','0'),(167,'GMT+01:00',3600,'Europe/Gibraltar','1'),(168,'GMT+00:00',0,'America/Danmarkshavn','0'),(169,'GMT-03:00',-10800,'America/Nuuk','-3'),(170,'GMT-01:00',-3600,'America/Scoresbysund','-1'),(171,'GMT-04:00',-14400,'America/Thule','-4'),(172,'GMT+00:00',0,'Africa/Banjul','0'),(173,'GMT+00:00',0,'Africa/Conakry','0'),(174,'GMT-04:00',-14400,'America/Guadeloupe','-4'),(175,'GMT+01:00',3600,'Africa/Malabo','1'),(176,'GMT+02:00',7200,'Europe/Athens','2'),(177,'GMT-02:00',-7200,'Atlantic/South_Georgia','-2'),(178,'GMT-06:00',-21600,'America/Guatemala','-6'),(179,'GMT+10:00',36000,'Pacific/Guam','10'),(180,'GMT+00:00',0,'Africa/Bissau','0'),(181,'GMT-04:00',-14400,'America/Guyana','-4'),(182,'GMT+08:00',28800,'Asia/Hong_Kong','8'),(183,'GMT-06:00',-21600,'America/Tegucigalpa','-6'),(184,'GMT+01:00',3600,'Europe/Zagreb','1'),(185,'GMT-05:00',-18000,'America/Port-au-Prince','-5'),(186,'GMT+01:00',3600,'Europe/Budapest','1'),(187,'GMT+07:00',25200,'Asia/Jakarta','7'),(188,'GMT+09:00',32400,'Asia/Jayapura','9'),(189,'GMT+08:00',28800,'Asia/Makassar','8'),(190,'GMT+07:00',25200,'Asia/Pontianak','7'),(191,'GMT+00:00',0,'Europe/Dublin','0'),(192,'GMT+02:00',7200,'Asia/Jerusalem','2'),(193,'GMT+00:00',0,'Europe/Isle_of_Man','0'),(194,'GMT+05:30',19800,'Asia/Kolkata','5'),(195,'GMT+06:00',21600,'Indian/Chagos','6'),(196,'GMT+03:00',10800,'Asia/Baghdad','3'),(197,'GMT+03:30',12600,'Asia/Tehran','3'),(198,'GMT+00:00',0,'Atlantic/Reykjavik','0'),(199,'GMT+01:00',3600,'Europe/Rome','1'),(200,'GMT+00:00',0,'Europe/Jersey','0'),(201,'GMT-05:00',-18000,'America/Jamaica','-5'),(202,'GMT+02:00',7200,'Asia/Amman','2'),(203,'GMT+09:00',32400,'Asia/Tokyo','9'),(204,'GMT+03:00',10800,'Africa/Nairobi','3'),(205,'GMT+06:00',21600,'Asia/Bishkek','6'),(206,'GMT+07:00',25200,'Asia/Phnom_Penh','7'),(207,'GMT+13:00',46800,'Pacific/Enderbury','13'),(208,'GMT+14:00',50400,'Pacific/Kiritimati','14'),(209,'GMT+12:00',43200,'Pacific/Tarawa','12'),(210,'GMT+03:00',10800,'Indian/Comoro','3'),(211,'GMT-04:00',-14400,'America/St_Kitts','-4'),(212,'GMT+09:00',32400,'Asia/Pyongyang','9'),(213,'GMT+09:00',32400,'Asia/Seoul','9'),(214,'GMT+03:00',10800,'Asia/Kuwait','3'),(215,'GMT-05:00',-18000,'America/Cayman','-5'),(216,'GMT+06:00',21600,'Asia/Almaty','6'),(217,'GMT+05:00',18000,'Asia/Aqtau','5'),(218,'GMT+05:00',18000,'Asia/Aqtobe','5'),(219,'GMT+05:00',18000,'Asia/Atyrau','5'),(220,'GMT+05:00',18000,'Asia/Oral','5'),(221,'GMT+06:00',21600,'Asia/Qostanay','6'),(222,'GMT+05:00',18000,'Asia/Qyzylorda','5'),(223,'GMT+07:00',25200,'Asia/Vientiane','7'),(224,'GMT+02:00',7200,'Asia/Beirut','2'),(225,'GMT-04:00',-14400,'America/St_Lucia','-4'),(226,'GMT+01:00',3600,'Europe/Vaduz','1'),(227,'GMT+05:30',19800,'Asia/Colombo','5'),(228,'GMT+00:00',0,'Africa/Monrovia','0'),(229,'GMT+02:00',7200,'Africa/Maseru','2'),(230,'GMT+02:00',7200,'Europe/Vilnius','2'),(231,'GMT+01:00',3600,'Europe/Luxembourg','1'),(232,'GMT+02:00',7200,'Europe/Riga','2'),(233,'GMT+02:00',7200,'Africa/Tripoli','2'),(234,'GMT+01:00',3600,'Africa/Casablanca','1'),(235,'GMT+01:00',3600,'Europe/Monaco','1'),(236,'GMT+02:00',7200,'Europe/Chisinau','2'),(237,'GMT+01:00',3600,'Europe/Podgorica','1'),(238,'GMT-04:00',-14400,'America/Marigot','-4'),(239,'GMT+03:00',10800,'Indian/Antananarivo','3'),(240,'GMT+12:00',43200,'Pacific/Kwajalein','12'),(241,'GMT+12:00',43200,'Pacific/Majuro','12'),(242,'GMT+01:00',3600,'Europe/Skopje','1'),(243,'GMT+00:00',0,'Africa/Bamako','0'),(244,'GMT+06:30',23400,'Asia/Yangon','6'),(245,'GMT+08:00',28800,'Asia/Choibalsan','8'),(246,'GMT+07:00',25200,'Asia/Hovd','7'),(247,'GMT+08:00',28800,'Asia/Ulaanbaatar','8'),(248,'GMT+08:00',28800,'Asia/Macau','8'),(249,'GMT+10:00',36000,'Pacific/Saipan','10'),(250,'GMT-04:00',-14400,'America/Martinique','-4'),(251,'GMT+00:00',0,'Africa/Nouakchott','0'),(252,'GMT-04:00',-14400,'America/Montserrat','-4'),(253,'GMT+01:00',3600,'Europe/Malta','1'),(254,'GMT+04:00',14400,'Indian/Mauritius','4'),(255,'GMT+05:00',18000,'Indian/Maldives','5'),(256,'GMT+02:00',7200,'Africa/Blantyre','2'),(257,'GMT-06:00',-21600,'America/Bahia_Banderas','-6'),(258,'GMT-05:00',-18000,'America/Cancun','-5'),(259,'GMT-07:00',-25200,'America/Chihuahua','-7'),(260,'GMT-07:00',-25200,'America/Hermosillo','-7'),(261,'GMT-06:00',-21600,'America/Matamoros','-6'),(262,'GMT-07:00',-25200,'America/Mazatlan','-7'),(263,'GMT-06:00',-21600,'America/Merida','-6'),(264,'GMT-06:00',-21600,'America/Mexico_City','-6'),(265,'GMT-06:00',-21600,'America/Monterrey','-6'),(266,'GMT-07:00',-25200,'America/Ojinaga','-7'),(267,'GMT-08:00',-28800,'America/Tijuana','-8'),(268,'GMT+08:00',28800,'Asia/Kuala_Lumpur','8'),(269,'GMT+08:00',28800,'Asia/Kuching','8'),(270,'GMT+02:00',7200,'Africa/Maputo','2'),(271,'GMT+02:00',7200,'Africa/Windhoek','2'),(272,'GMT+11:00',39600,'Pacific/Noumea','11'),(273,'GMT+01:00',3600,'Africa/Niamey','1'),(274,'GMT+12:00',43200,'Pacific/Norfolk','12'),(275,'GMT+01:00',3600,'Africa/Lagos','1'),(276,'GMT-06:00',-21600,'America/Managua','-6'),(277,'GMT+01:00',3600,'Europe/Amsterdam','1'),(278,'GMT+01:00',3600,'Europe/Oslo','1'),(279,'GMT+05:45',20700,'Asia/Kathmandu','5'),(280,'GMT+12:00',43200,'Pacific/Nauru','12'),(281,'GMT-11:00',-39600,'Pacific/Niue','-11'),(282,'GMT+13:00',46800,'Pacific/Auckland','13'),(283,'GMT+13:45',49500,'Pacific/Chatham','13'),(284,'GMT+04:00',14400,'Asia/Muscat','4'),(285,'GMT-05:00',-18000,'America/Panama','-5'),(286,'GMT-05:00',-18000,'America/Lima','-5'),(287,'GMT-09:00',-32400,'Pacific/Gambier','-9'),(288,'GMT-09:30',-34200,'Pacific/Marquesas','-10'),(289,'GMT-10:00',-36000,'Pacific/Tahiti','-10'),(290,'GMT+11:00',39600,'Pacific/Bougainville','11'),(291,'GMT+10:00',36000,'Pacific/Port_Moresby','10'),(292,'GMT+08:00',28800,'Asia/Manila','8'),(293,'GMT+05:00',18000,'Asia/Karachi','5'),(294,'GMT+01:00',3600,'Europe/Warsaw','1'),(295,'GMT-03:00',-10800,'America/Miquelon','-3'),(296,'GMT-08:00',-28800,'Pacific/Pitcairn','-8'),(297,'GMT-04:00',-14400,'America/Puerto_Rico','-4'),(298,'GMT+02:00',7200,'Asia/Gaza','2'),(299,'GMT+02:00',7200,'Asia/Hebron','2'),(300,'GMT-01:00',-3600,'Atlantic/Azores','-1'),(301,'GMT+00:00',0,'Atlantic/Madeira','0'),(302,'GMT+00:00',0,'Europe/Lisbon','0'),(303,'GMT+09:00',32400,'Pacific/Palau','9'),(304,'GMT-03:00',-10800,'America/Asuncion','-3'),(305,'GMT+03:00',10800,'Asia/Qatar','3'),(306,'GMT+04:00',14400,'Indian/Reunion','4'),(307,'GMT+02:00',7200,'Europe/Bucharest','2'),(308,'GMT+01:00',3600,'Europe/Belgrade','1'),(309,'GMT+12:00',43200,'Asia/Anadyr','12'),(310,'GMT+07:00',25200,'Asia/Barnaul','7'),(311,'GMT+09:00',32400,'Asia/Chita','9'),(312,'GMT+08:00',28800,'Asia/Irkutsk','8'),(313,'GMT+12:00',43200,'Asia/Kamchatka','12'),(314,'GMT+09:00',32400,'Asia/Khandyga','9'),(315,'GMT+07:00',25200,'Asia/Krasnoyarsk','7'),(316,'GMT+11:00',39600,'Asia/Magadan','11'),(317,'GMT+07:00',25200,'Asia/Novokuznetsk','7'),(318,'GMT+07:00',25200,'Asia/Novosibirsk','7'),(319,'GMT+06:00',21600,'Asia/Omsk','6'),(320,'GMT+11:00',39600,'Asia/Sakhalin','11'),(321,'GMT+11:00',39600,'Asia/Srednekolymsk','11'),(322,'GMT+07:00',25200,'Asia/Tomsk','7'),(323,'GMT+10:00',36000,'Asia/Ust-Nera','10'),(324,'GMT+10:00',36000,'Asia/Vladivostok','10'),(325,'GMT+09:00',32400,'Asia/Yakutsk','9'),(326,'GMT+05:00',18000,'Asia/Yekaterinburg','5'),(327,'GMT+04:00',14400,'Europe/Astrakhan','4'),(328,'GMT+02:00',7200,'Europe/Kaliningrad','2'),(329,'GMT+03:00',10800,'Europe/Kirov','3'),(330,'GMT+03:00',10800,'Europe/Moscow','3'),(331,'GMT+04:00',14400,'Europe/Samara','4'),(332,'GMT+04:00',14400,'Europe/Saratov','4'),(333,'GMT+04:00',14400,'Europe/Ulyanovsk','4'),(334,'GMT+03:00',10800,'Europe/Volgograd','3'),(335,'GMT+02:00',7200,'Africa/Kigali','2'),(336,'GMT+03:00',10800,'Asia/Riyadh','3'),(337,'GMT+11:00',39600,'Pacific/Guadalcanal','11'),(338,'GMT+04:00',14400,'Indian/Mahe','4'),(339,'GMT+02:00',7200,'Africa/Khartoum','2'),(340,'GMT+01:00',3600,'Europe/Stockholm','1'),(341,'GMT+08:00',28800,'Asia/Singapore','8'),(342,'GMT+00:00',0,'Atlantic/St_Helena','0'),(343,'GMT+01:00',3600,'Europe/Ljubljana','1'),(344,'GMT+01:00',3600,'Arctic/Longyearbyen','1'),(345,'GMT+01:00',3600,'Europe/Bratislava','1'),(346,'GMT+00:00',0,'Africa/Freetown','0'),(347,'GMT+01:00',3600,'Europe/San_Marino','1'),(348,'GMT+00:00',0,'Africa/Dakar','0'),(349,'GMT+03:00',10800,'Africa/Mogadishu','3'),(350,'GMT-03:00',-10800,'America/Paramaribo','-3'),(351,'GMT+03:00',10800,'Africa/Juba','3'),(352,'GMT+00:00',0,'Africa/Sao_Tome','0'),(353,'GMT-06:00',-21600,'America/El_Salvador','-6'),(354,'GMT-04:00',-14400,'America/Lower_Princes','-4'),(355,'GMT+02:00',7200,'Asia/Damascus','2'),(356,'GMT+02:00',7200,'Africa/Mbabane','2'),(357,'GMT-05:00',-18000,'America/Grand_Turk','-5'),(358,'GMT+01:00',3600,'Africa/Ndjamena','1'),(359,'GMT+05:00',18000,'Indian/Kerguelen','5'),(360,'GMT+00:00',0,'Africa/Lome','0'),(361,'GMT+07:00',25200,'Asia/Bangkok','7'),(362,'GMT+05:00',18000,'Asia/Dushanbe','5'),(363,'GMT+13:00',46800,'Pacific/Fakaofo','13'),(364,'GMT+09:00',32400,'Asia/Dili','9'),(365,'GMT+05:00',18000,'Asia/Ashgabat','5'),(366,'GMT+01:00',3600,'Africa/Tunis','1'),(367,'GMT+13:00',46800,'Pacific/Tongatapu','13'),(368,'GMT+03:00',10800,'Europe/Istanbul','3'),(369,'GMT-04:00',-14400,'America/Port_of_Spain','-4'),(370,'GMT+12:00',43200,'Pacific/Funafuti','12'),(371,'GMT+08:00',28800,'Asia/Taipei','8'),(372,'GMT+03:00',10800,'Africa/Dar_es_Salaam','3'),(373,'GMT+02:00',7200,'Europe/Kiev','2'),(374,'GMT+03:00',10800,'Europe/Simferopol','3'),(375,'GMT+02:00',7200,'Europe/Uzhgorod','2'),(376,'GMT+02:00',7200,'Europe/Zaporozhye','2'),(377,'GMT+03:00',10800,'Africa/Kampala','3'),(378,'GMT-11:00',-39600,'Pacific/Midway','-11'),(379,'GMT+12:00',43200,'Pacific/Wake','12'),(380,'GMT-10:00',-36000,'America/Adak','-10'),(381,'GMT-09:00',-32400,'America/Anchorage','-9'),(382,'GMT-07:00',-25200,'America/Boise','-7'),(383,'GMT-06:00',-21600,'America/Chicago','-6'),(384,'GMT-07:00',-25200,'America/Denver','-7'),(385,'GMT-05:00',-18000,'America/Detroit','-5'),(386,'GMT-05:00',-18000,'America/Indiana/Indianapolis','-5'),(387,'GMT-06:00',-21600,'America/Indiana/Knox','-6'),(388,'GMT-05:00',-18000,'America/Indiana/Marengo','-5'),(389,'GMT-05:00',-18000,'America/Indiana/Petersburg','-5'),(390,'GMT-06:00',-21600,'America/Indiana/Tell_City','-6'),(391,'GMT-05:00',-18000,'America/Indiana/Vevay','-5'),(392,'GMT-05:00',-18000,'America/Indiana/Vincennes','-5'),(393,'GMT-05:00',-18000,'America/Indiana/Winamac','-5'),(394,'GMT-09:00',-32400,'America/Juneau','-9'),(395,'GMT-05:00',-18000,'America/Kentucky/Louisville','-5'),(396,'GMT-05:00',-18000,'America/Kentucky/Monticello','-5'),(397,'GMT-08:00',-28800,'America/Los_Angeles','-8'),(398,'GMT-06:00',-21600,'America/Menominee','-6'),(399,'GMT-09:00',-32400,'America/Metlakatla','-9'),(400,'GMT-05:00',-18000,'America/New_York','-5'),(401,'GMT-09:00',-32400,'America/Nome','-9'),(402,'GMT-06:00',-21600,'America/North_Dakota/Beulah','-6'),(403,'GMT-06:00',-21600,'America/North_Dakota/Center','-6'),(404,'GMT-06:00',-21600,'America/North_Dakota/New_Salem','-6'),(405,'GMT-07:00',-25200,'America/Phoenix','-7'),(406,'GMT-09:00',-32400,'America/Sitka','-9'),(407,'GMT-09:00',-32400,'America/Yakutat','-9'),(408,'GMT-10:00',-36000,'Pacific/Honolulu','-10'),(409,'GMT-03:00',-10800,'America/Montevideo','-3'),(410,'GMT+05:00',18000,'Asia/Samarkand','5'),(411,'GMT+05:00',18000,'Asia/Tashkent','5'),(412,'GMT+01:00',3600,'Europe/Vatican','1'),(413,'GMT-04:00',-14400,'America/St_Vincent','-4'),(414,'GMT-04:00',-14400,'America/Caracas','-4'),(415,'GMT-04:00',-14400,'America/Tortola','-4'),(416,'GMT-04:00',-14400,'America/St_Thomas','-4'),(417,'GMT+07:00',25200,'Asia/Ho_Chi_Minh','7'),(418,'GMT+11:00',39600,'Pacific/Efate','11'),(419,'GMT+12:00',43200,'Pacific/Wallis','12'),(420,'GMT+14:00',50400,'Pacific/Apia','14'),(421,'GMT+03:00',10800,'Asia/Aden','3'),(422,'GMT+03:00',10800,'Indian/Mayotte','3'),(423,'GMT+02:00',7200,'Africa/Johannesburg','2'),(424,'GMT+02:00',7200,'Africa/Lusaka','2'),(425,'GMT+02:00',7200,'Africa/Harare','2');
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `en_En` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `en_En` (`en_En`)
) ENGINE=InnoDB AUTO_INCREMENT=2304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'Access Number','Access Number'),(2,'Access Numbers','Access Numbers'),(3,'Account','Account'),(4,'Account Type','Account Type'),(5,'Account Valid Days','Account Valid Days'),(6,'Account Verification By','Account Verification By'),(7,'Accounts','Accounts'),(8,'Accounts Report','Accounts Report'),(9,'ACD','ACD'),(10,'Action','Action'),(11,'Action Type','Action Type'),(12,'Add','Add'),(13,'Add Country','Add Country'),(14,'Add Currency','Add Currency'),(15,'Add Destination','Add Destination'),(16,'Add Ratedeck','Add Ratedeck'),(17,'Address1','Address1'),(18,'Administrator','Administrator'),(19,'Administrator Admin','Administrator Admin'),(20,'Admins','Admins'),(21,'After Balance','After Balance'),(22,'Alarm','Alarm'),(23,'Alert Status','Alert Status'),(24,'Allow integration with Fraud detection','Allow integration with Fraud detection'),(25,'Allow IP Management','Allow IP Management'),(26,'Allow Local Call','Allow Local Call'),(27,'Allow Local Calls','Allow Local Calls'),(28,'Allow Loss Less Routing','Allow Loss Less Routing'),(29,'Allow Max Retries','Allow Max Retries'),(30,'Allow Recording','Allow Recording'),(31,'Amount','Amount'),(32,'Amount INR','Amount INR'),(33,'Answered Calls','Answered Calls'),(34,'Applicable For','Applicable For'),(35,'Apply on existing accounts','Apply on existing accounts'),(36,'Archive','Archive'),(37,'ASR','ASR'),(38,'Attachement','Attachement'),(39,'Attempted Calls','Attempted Calls'),(40,'Audit','Audit'),(41,'Audit Log','Audit Log'),(42,'Audit Logs Older Than Days','Audit Logs Older Than Days'),(43,'Authorize.net','Authorize.net'),(44,'Automatically','Automatically'),(45,'Balance','Balance'),(46,'Balance Announcement','Balance Announcement'),(47,'Balance Below','Balance Below'),(48,'Base Currency','Base Currency'),(49,'Basic','Basic'),(50,'Basic Information','Basic Information'),(51,'Batch Update','Batch Update'),(52,'Before Balance INR','Before Balance INR'),(53,'Begins With','Begins With'),(54,'Beta','Beta'),(55,'Billable','Billable'),(56,'Billing','Billing'),(57,'Billing Cycle','Billing Cycle'),(58,'Billing Days','Billing Days'),(59,'Billing Information','Billing Information'),(60,'Billing Type','Billing Type'),(61,'Body','Body'),(62,'Buy Cost','Buy Cost'),(63,'Call Barring','Call Barring'),(64,'Call Date','Call Date'),(65,'Call Detail Reports','Call Detail Reports'),(66,'Call Max Length','Call Max Length'),(67,'Call State','Call State'),(68,'Call Summary Reports','Call Summary Reports'),(69,'Call Timeout','Call Timeout'),(70,'Call Type','Call Type'),(71,'Call Types','Call Types'),(72,'Called Number','Called Number'),(73,'Caller ID','Caller ID'),(74,'Caller IDs','Caller IDs'),(75,'Caller IP','Caller IP'),(76,'Caller Name','Caller Name'),(77,'Caller Number','Caller Number'),(78,'Caller-Id-In-From','Caller-Id-In-From'),(79,'Calling Card','Calling Card'),(80,'Calls','Calls'),(81,'Calls Breakdown','Calls Breakdown'),(82,'Calltype Information','Calltype Information'),(83,'Can be purchased?','Can be purchased?'),(84,'Capital','Capital'),(85,'Capture Server','Capture Server'),(86,'Card Input Timeout','Card Input Timeout'),(87,'Card Length','Card Length'),(88,'Card Retries','Card Retries'),(89,'Carriers','Carriers'),(90,'Category','Category'),(91,'CC','CC'),(92,'CDRs Older Than Days','CDRs Older Than Days'),(93,'Charge Type','Charge Type'),(94,'Charges Breakdown','Charges Breakdown'),(95,'Charges History','Charges History'),(96,'CID','CID'),(97,'City','City'),(98,'Clear','Clear'),(99,'Client IP','Client IP'),(100,'Client User Agent','Client User Agent'),(101,'Code','Code'),(102,'Codecs','Codecs'),(103,'Commission','Commission'),(104,'Commission Rate','Commission Rate'),(105,'Commission Reports','Commission Reports'),(106,'Company','Company'),(107,'Company Profiles','Company Profiles'),(108,'Company Tax number','Company Tax number'),(109,'Completed Calls','Completed Calls'),(110,'Concurrent Calls','Concurrent Calls'),(111,'Configuration','Configuration'),(112,'Confirmed','Confirmed'),(113,'Connection Cost','Connection Cost'),(114,'Contains','Contains'),(115,'Cost','Cost'),(116,'Cost/Min','Cost/Min'),(117,'Countries','Countries'),(118,'Country','Country'),(119,'Country Code','Country Code'),(120,'Country List','Country List'),(121,'Country Reports','Country Reports'),(122,'Coupon Information','Coupon Information'),(123,'Coupon Number','Coupon Number'),(124,'CPS','CPS'),(125,'Create','Create'),(126,'Create Admin','Create Admin'),(127,'Create calltype','Create calltype'),(128,'Create Company Profile','Create Company Profile'),(129,'Create Customer','Create Customer'),(130,'Create Origination Rate','Create Origination Rate'),(131,'Create Product','Create Product'),(132,'Create Provider','Create Provider'),(133,'Create Rate Group','Create Rate Group'),(134,'Create Refill Coupon','Create Refill Coupon'),(135,'Create SIP Device','Create SIP Device'),(136,'Create Tax','Create Tax'),(137,'Created Date','Created Date'),(138,'Creation Date','Creation Date'),(139,'Credit','Credit'),(140,'Credit Limit','Credit Limit'),(141,'Crons','Crons'),(142,'Currency','Currency'),(143,'Currency Conversion Loss Percentage','Currency Conversion Loss Percentage'),(144,'Currency List','Currency List'),(145,'Customer','Customer'),(146,'Customer CDRs Report','Customer CDRs Report'),(147,'Customer Summary','Customer Summary'),(148,'Customer Summary Report','Customer Summary Report'),(149,'Customers','Customers'),(150,'Dashboard','Dashboard'),(151,'Database','Database'),(152,'Date','Date'),(153,'Debit','Debit'),(154,'Debug','Debug'),(155,'Decimal Points','Decimal Points'),(156,'Default Increment','Default Increment'),(157,'Default Invoice Mode','Default Invoice Mode'),(158,'Default Tax','Default Tax'),(159,'Delete','Delete'),(160,'Deleted Accounts After Days','Deleted Accounts After Days'),(161,'Description','Description'),(162,'Destination','Destination'),(163,'Dial Input Timeout','Dial Input Timeout'),(164,'DID','DID'),(165,'DIDs','DIDs'),(166,'Direction','Direction'),(167,'Disable','Disable'),(168,'Display records in','Display records in'),(169,'Disposition','Disposition'),(170,'Documentation','Documentation'),(171,'Doesnt Contain','Doesnt Contain'),(172,'Domain','Domain'),(173,'Draft','Draft'),(174,'Due Date','Due Date'),(175,'Duplicate','Duplicate'),(176,'Duration','Duration'),(177,'Email','Email'),(178,'Email Alerts ?','Email Alerts ?'),(179,'Email History','Email History'),(180,'Email History List','Email History List'),(181,'Email Notification','Email Notification'),(182,'Email Notifications','Email Notifications'),(183,'Email Status','Email Status'),(184,'Email Template','Email Template'),(185,'Emails Older Than Days','Emails Older Than Days'),(186,'En','En'),(187,'Enable','Enable'),(188,'Enable Signup','Enable Signup'),(189,'Ends With','Ends With'),(190,'Enterprise','Enterprise'),(191,'Entity Type','Entity Type'),(192,'Environment','Environment'),(193,'Ewallet Payment Gateway','Ewallet Payment Gateway'),(194,'Expired Accounts After Days','Expired Accounts After Days'),(195,'Expiry Date','Expiry Date'),(196,'Export','Export'),(197,'Failover  GW Name #1','Failover  GW Name #1'),(198,'Failover GW Name #2','Failover GW Name #2'),(199,'Favicon','Favicon'),(200,'Fax','Fax'),(201,'Fee','Fee'),(202,'File Path','File Path'),(203,'Filter','Filter'),(204,'First Name','First Name'),(205,'First Used','First Used'),(206,'Fixer Key','Fixer Key'),(207,'FMAddon','FMAddon'),(208,'Footer','Footer'),(209,'Fraud Detection','Fraud Detection'),(210,'Free Minutes','Free Minutes'),(211,'FreeSwitch Servers','FreeSwitch Servers'),(212,'From','From'),(213,'From Date','From Date'),(214,'From Timestamp','From Timestamp'),(215,'Gateway Name','Gateway Name'),(216,'Gateways','Gateways'),(217,'General','General'),(218,'General Input Timeout','General Input Timeout'),(219,'Generate Invoice','Generate Invoice'),(220,'Generate Pin','Generate Pin'),(221,'Generates Alarm From System','Generates Alarm From System'),(222,'Generates Local Number system','Generates Local Number system'),(223,'Generates ticket of issues from system','Generates ticket of issues from system'),(224,'Generates Various Alarms From System','Generates Various Alarms From System'),(225,'Generates Various Country Reports From System','Generates Various Country Reports From System'),(226,'Generates various reports from system','Generates various reports from system'),(227,'Get Addons','Get Addons'),(228,'Get App','Get App'),(229,'Global','Global'),(230,'Grace Time','Grace Time'),(231,'Grand Total','Grand Total'),(232,'Group By','Group By'),(233,'Group By #1','Group By #1'),(234,'Group By #2','Group By #2'),(235,'Group By #3','Group By #3'),(236,'Group By #Time','Group By #Time'),(237,'Header','Header'),(238,'Homer','Homer'),(239,'Host','Host'),(240,'Import','Import'),(241,'Import Customers','Import Customers'),(242,'Import with field map','Import with field map'),(243,'Inbound','Inbound'),(244,'Inbound Fax','Inbound Fax'),(245,'Included Seconds','Included Seconds'),(246,'Increment','Increment'),(247,'Initial Balance','Initial Balance'),(248,'Initial Increment','Initial Increment'),(249,'Inovices Older Than Days','Inovices Older Than Days'),(250,'Install','Install'),(251,'Installed','Installed'),(252,'Interval','Interval'),(253,'Interval Type','Interval Type'),(254,'Invoice Configuration','Invoice Configuration'),(255,'Invoice Date','Invoice Date'),(256,'Invoice Due Days','Invoice Due Days'),(257,'Invoice Due Notification','Invoice Due Notification'),(258,'Invoice Notification','Invoice Notification'),(259,'Invoice Number','Invoice Number'),(260,'Invoice Prefix','Invoice Prefix'),(261,'Invoice Start Form','Invoice Start Form'),(262,'Invoices','Invoices'),(263,'IP','IP'),(264,'IP Settings','IP Settings'),(265,'Is Equal To','Is Equal To'),(266,'Is Not Equal To','Is Not Equal To'),(267,'Is Purchased?','Is Purchased?'),(268,'Iso','Iso'),(269,'Iso3','Iso3'),(270,'IVR Count','IVR Count'),(271,'Languages','Languages'),(272,'Last Execution Date','Last Execution Date'),(273,'Last Modified Date','Last Modified Date'),(274,'Last Name','Last Name'),(275,'Last Paid Date','Last Paid Date'),(276,'Latest Orders','Latest Orders'),(277,'LC Charge / Min','LC Charge / Min'),(278,'LC Charge/Min','LC Charge/Min'),(279,'Live','Live'),(280,'Live Call Report','Live Call Report'),(281,'Live Id','Live Id'),(282,'Live Key','Live Key'),(283,'Live Url','Live Url'),(284,'Local Call Timeout','Local Call Timeout'),(285,'Local Number','Local Number'),(286,'Local Numbers','Local Numbers'),(287,'Locale code','Locale code'),(288,'Localization','Localization'),(289,'Localization Type','Localization Type'),(290,'Localizations','Localizations'),(291,'Log out','Log out'),(292,'Log Path','Log Path'),(293,'Logo','Logo'),(294,'Low balance Alert?','Low balance Alert?'),(295,'Mail Log','Mail Log'),(296,'Manually','Manually'),(297,'Markup','Markup'),(298,'Mass Create','Mass Create'),(299,'Mass Email','Mass Email'),(300,'Max Free Length','Max Free Length'),(301,'MCD','MCD'),(302,'Minimum Fund Transfer','Minimum Fund Transfer'),(303,'Minutes','Minutes'),(304,'Minutes Announcement','Minutes Announcement'),(305,'Minutes Breakdown','Minutes Breakdown'),(306,'Moderate','Moderate'),(307,'Modified Date','Modified Date'),(308,'Module','Module'),(309,'Name','Name'),(310,'New Accounts','New Accounts'),(311,'Nexmo API Key','Nexmo API Key'),(312,'Nexmo Secret Key','Nexmo Secret Key'),(313,'Next Execution Date','Next Execution Date'),(314,'Nickname','Nickname'),(315,'No','No'),(316,'No Records Found','No Records Found'),(317,'Notes','Notes'),(318,'Notifications','Notifications'),(319,'Notify before due days','Notify before due days'),(320,'Number','Number'),(321,'Number Type','Number Type'),(322,' of ',' of '),(323,'Opensips','Opensips'),(324,'Opensips DB Engine','Opensips DB Engine'),(325,'Opensips DB Host','Opensips DB Host'),(326,'Opensips DB Name','Opensips DB Name'),(327,'Opensips DB Pass','Opensips DB Pass'),(328,'Opensips DB User','Opensips DB User'),(329,'Opensips Domain','Opensips Domain'),(330,'Opensource','Opensource'),(331,'Order','Order'),(332,'Order Amount','Order Amount'),(333,'Order Date','Order Date'),(334,'Order ID','Order ID'),(335,'Order Now','Order Now'),(336,'Orders','Orders'),(337,'Org. Cost','Org. Cost'),(338,'Org. Destination','Org. Destination'),(339,'Org. Pefix','Org. Pefix'),(340,'Origination Rates','Origination Rates'),(341,'Outbound Fax','Outbound Fax'),(342,'Outstanding Amount INR','Outstanding Amount INR'),(343,'Page ','Page '),(344,'Password','Password'),(345,'Password Strength','Password Strength'),(346,'Payment Method','Payment Method'),(347,'Payment Methods','Payment Methods'),(348,'Payment Status','Payment Status'),(349,'Paypal','Paypal'),(350,'Per Minute Cost','Per Minute Cost'),(351,'Phone','Phone'),(352,'Pin Input Timeout','Pin Input Timeout'),(353,'Pin Length','Pin Length'),(354,'Pin retries','Pin retries'),(355,'Pinless Authentication','Pinless Authentication'),(356,'Place Order','Place Order'),(357,'Playback Audio Notifications','Playback Audio Notifications'),(358,'Port','Port'),(359,'Portal personalization','Portal personalization'),(360,'Powered by FLUX','Powered by FLUX'),(361,'Prefix','Prefix'),(362,'Prepend','Prepend'),(363,'Preserve','Preserve'),(364,'Price','Price'),(365,'Priority','Priority'),(366,'Product Category','Product Category'),(367,'Product Details','Product Details'),(368,'Product Name','Product Name'),(369,'Products','Products'),(370,'Profile Action','Profile Action'),(371,'Profit','Profit'),(372,'Provider','Provider'),(373,'Provider CDRs Report','Provider CDRs Report'),(374,'Provider Outbound','Provider Outbound'),(375,'Provider Outbound Report','Provider Outbound Report'),(376,'Provider Summary Report','Provider Summary Report'),(377,'Province','Province'),(378,'Province/State','Province/State'),(379,'Proxy','Proxy'),(380,'Purge','Purge'),(381,'Push Notifications','Push Notifications'),(382,'Quantity','Quantity'),(383,'Rate','Rate'),(384,'Rate Announcement','Rate Announcement'),(385,'Rate Count','Rate Count'),(386,'Rate Group','Rate Group'),(387,'Rate Groups','Rate Groups'),(388,'Rate Information','Rate Information'),(389,'Ratedeck','Ratedeck'),(390,'Ratedeck Information','Ratedeck Information'),(391,'Rates Count','Rates Count'),(392,'Realtime Billing','Realtime Billing'),(393,'Receiver Email','Receiver Email'),(394,'Recording Files Older Than Days','Recording Files Older Than Days'),(395,' Records',' Records'),(396,'Referer Page','Referer Page'),(397,'Refill By','Refill By'),(398,'Refill Coupon Length','Refill Coupon Length'),(399,'Refill Coupons','Refill Coupons'),(400,'Refill Report','Refill Report'),(401,'Refills','Refills'),(402,'Register','Register'),(403,'Release if no balance','Release if no balance'),(404,'Report a Bug','Report a Bug'),(405,'Reports','Reports'),(406,'Request URI','Request URI'),(407,'Reseller','Reseller'),(408,'Reseller can resell','Reseller can resell'),(409,'Reseller Summary','Reseller Summary'),(410,'Reseller Summary Report','Reseller Summary Report'),(411,'Resellers','Resellers'),(412,'Resellers CDRs Report','Resellers CDRs Report'),(413,'Resend Mail','Resend Mail'),(414,'Role','Role'),(415,'Roles & Permission','Roles & Permission'),(416,'Roles & Permissions','Roles & Permissions'),(417,'Routing Prefix','Routing Prefix'),(418,'Routing Type','Routing Type'),(419,'Sandbox','Sandbox'),(420,'Sandbox Id','Sandbox Id'),(421,'Sandbox Key','Sandbox Key'),(422,'Sandbox Name','Sandbox Name'),(423,'Sandbox Url','Sandbox Url'),(424,'Save','Save'),(425,'Schedule Reports','Schedule Reports'),(426,'Search','Search'),(427,'Select File','Select File'),(428,'Select Year','Select Year'),(429,'Services','Services'),(430,'Set Maximum Add card limit','Set Maximum Add card limit'),(431,'Settings','Settings'),(432,'Setup Fee','Setup Fee'),(433,'Signup','Signup'),(434,'SIP Devices','SIP Devices'),(435,'SIP IP','SIP IP'),(436,'SIP Port','SIP Port'),(437,'SIP Profile','SIP Profile'),(438,'SIP Profiles','SIP Profiles'),(439,'SMS','SMS'),(440,'SMS Body','SMS Body'),(441,'SMS Notifications','SMS Notifications'),(442,'SMS Status','SMS Status'),(443,'SMTP','SMTP'),(444,'SMTP Host','SMTP Host'),(445,'SMTP Pass','SMTP Pass'),(446,'SMTP Port','SMTP Port'),(447,'SMTP User','SMTP User'),(448,'Start prefix','Start prefix'),(449,'Starting Digit','Starting Digit'),(450,'Status','Status'),(451,'Strip','Strip'),(452,'Strong','Strong'),(453,'Subject','Subject'),(454,'Subscription','Subscription'),(455,'Supportticket','Supportticket'),(456,'Switch','Switch'),(457,'Tariff','Tariff'),(458,'Tax','Tax'),(459,'Tax Information','Tax Information'),(460,'Telephone','Telephone'),(461,'Telephone as account number','Telephone as account number'),(462,'Templates','Templates'),(463,'Term. Cost','Term. Cost'),(464,'Term. Destination','Term. Destination'),(465,'Term. Prefix','Term. Prefix'),(466,'Term. Trunk','Term. Trunk'),(467,'Termination Rates','Termination Rates'),(468,'Third Party','Third Party'),(469,'This Month','This Month'),(470,'This Week','This Week'),(471,'Timelimit Announcement','Timelimit Announcement'),(472,'Timestamp','Timestamp'),(473,'Timezone','Timezone'),(474,'To','To'),(475,'To Number','To Number'),(476,'To Timestamp','To Timestamp'),(477,'Today','Today'),(478,'Top 10 Accounts','Top 10 Accounts'),(479,'Top 10 Destinations','Top 10 Destinations'),(480,'Total Calls','Total Calls'),(481,'Total Charges','Total Charges'),(482,'Total Minutes','Total Minutes'),(483,'Transaction ID','Transaction ID'),(484,'Translations','Translations'),(485,'Translations Language','Translations Language'),(486,'Trunk','Trunk'),(487,'Trunks','Trunks'),(488,'Type','Type'),(489,'Unpaid','Unpaid'),(490,'Update','Update'),(491,'Used','Used'),(492,'Used Date','Used Date'),(493,'Username','Username'),(494,'Version','Version'),(495,'Version 4.0 Beta','Version 4.0 Beta'),(496,'View All','View All'),(498,'Voicemail','Voicemail'),(500,'Panel Access','Panel Access'),(501,'Profile','Profile'),(502,'Billing Settings','Billing Settings'),(503,'Pin','Pin'),(504,'Account Settings','Account Settings'),(505,'Notification Email','Notification Email'),(506,'Address','Address'),(507,'NON-CLI Rate Group','NON-CLI Rate Group'),(508,'Billing Schedule','Billing Schedule'),(509,'Billing Day','Billing Day'),(510,'Tax Number','Tax Number'),(511,'Invoice Note','Invoice Note'),(512,'Reference','Reference'),(513,'Cancel','Cancel'),(514,'Device Information','Device Information'),(515,'Voicemail Options','Voicemail Options'),(516,'Mail To','Mail To'),(517,'Attach File','Attach File'),(518,'Local After Email','Local After Email'),(519,'Send all Message','Send all Message'),(520,'Close','Close'),(521,'IP map','IP map'),(522,'Identificador de llamadas','Identificador de llamadas'),(523,'Add Caller ID','Add Caller ID'),(524,'Create Reseller','Create Reseller'),(525,'Role Name','Role Name'),(526,'Outstanding Amount','Outstanding Amount'),(527,'To Date','To Date'),(528,'Before Balance','Before Balance'),(529,'Commission Report','Commission Report'),(530,'MonthlyFee','MonthlyFee'),(531,'Grace Time (Sec.)','Grace Time (Sec.)'),(532,'Import DIDs','Import DIDs'),(533,'File must be in the following format','File must be in the following format'),(534,'DID Import Process','DID Import Process'),(535,'Get Sample file','Get Sample file'),(536,'Check Header','Check Header'),(537,'Select the file','Select the file'),(538,'Account Count','Account Count'),(539,'Acc. Number Length','Acc. Number Length'),(540,'Valid Days','Valid Days'),(541,'Create Access Number','Create Access Number'),(542,'Information','Information'),(543,'Import Access Numbers','Import Access Numbers'),(544,'Access Numbers Import Process','Access Numbers Import Process'),(545,'DIDs Bulk Assign','DIDs Bulk Assign'),(546,'Bulk DID Purchase','Bulk DID Purchase'),(547,'Provience','Provience'),(548,'Assign Number','Assign Number'),(549,'DID Destination','DID Destination'),(550,'DID Forward','DID Forward'),(551,'Always','Always'),(552,'If Busy','If Busy'),(553,'If SIP Not Registered','If SIP Not Registered'),(554,'If No Answer','If No Answer'),(555,'New Rate Group Name','New Rate Group Name'),(556,'Duplicate Rate Group Information','Duplicate Rate Group Information'),(557,'Import Origination Rates','Import Origination Rates'),(558,'Force Trunk','Force Trunk'),(559,'Please select atleast one record to dele','Please select atleast one record to dele'),(560,'Import Ratedeck','Import Ratedeck'),(561,'Optional Information','Optional Information'),(562,'From- Domain','From- Domain'),(563,'From User','From User'),(564,'Extension','Extension'),(565,'Extension-In-Contact','Extension-In-Contact'),(566,'Ping','Ping'),(567,'Contact Params','Contact Params'),(568,'Retry-Seconds','Retry-Seconds'),(569,'Register-Proxy','Register-Proxy'),(570,'Channel','Channel'),(571,'Failover GW Name','Failover GW Name'),(572,'Create Trunk','Create Trunk'),(573,'Import Termination Rates','Import Termination Rates'),(574,'Call Timeout (Sec.)','Call Timeout (Sec.)'),(575,'Trunk List','Trunk List'),(576,'Reset','Reset'),(577,'Create SIP Profile','Create SIP Profile'),(578,'Create Freeswitch Server','Create Freeswitch Server'),(579,'Live Calls','Live Calls'),(580,'Term Cost','Term Cost'),(581,'Term Destination','Term Destination'),(582,'Term Prefix','Term Prefix'),(583,'Localizaciones','Localizaciones'),(584,'Create Localization','Create Localization'),(585,'Origination','Origination'),(586,'Termination','Termination'),(587,'Inbound Callerid Translation','Inbound Callerid Translation'),(588,'Destination Number Translation','Destination Number Translation'),(589,'Outbound Callerid Translation','Outbound Callerid Translation'),(590,'Create Call Barring','Create Call Barring'),(591,'Callbarring Settings','Callbarring Settings'),(592,'Product Summary Report','Product Summary Report'),(593,'SIP User','SIP User'),(594,'Product','Product'),(595,'Taxes','Taxes'),(596,'Update Currencies','Update Currencies'),(597,'File Name','File Name'),(598,'Database Information','Database Information'),(599,'Database Backup','Database Backup'),(600,'Command','Command'),(601,'Cron Settings','Cron Settings'),(602,'Create Cron Settings','Create Cron Settings'),(603,'Stripe','Stripe'),(604,'Live Secret key','Live Secret key'),(605,'Live Publishable key','Live Publishable key'),(606,'Set Percentage Charges','Set Percentage Charges'),(607,'Set Fix Charges','Set Fix Charges'),(608,'Stripe Mode','Stripe Mode'),(609,'Sandbox secret key','Sandbox secret key'),(610,'Sandbox publishable key','Sandbox publishable key'),(611,'Version 4.0 Enterprise','Version 4.0 Enterprise'),(612,'Powered by','Powered by'),(613,'Import Customer Using Field Mapper','Import Customer Using Field Mapper'),(614,'You must either select a field from your','You must either select a field from your'),(615,'Records with duplicate account number an','Records with duplicate account number an'),(616,'Account Import Error','Account Import Error'),(617,'Back to Customer List','Back to Customer List'),(618,'Duplicate accounts with account number /','Duplicate accounts with account number /'),(619,'Records imported successfully','Records imported successfully'),(620,'Records not imported','Records not imported'),(621,'Error In CSV File','Error In CSV File'),(622,'Invoice Summary','Invoice Summary'),(623,'Customer Details','Customer Details'),(624,'Invoice Details','Invoice Details'),(625,'Account Number','Account Number'),(626,'Invoice Amount','Invoice Amount'),(627,'Invoice Item','Invoice Item'),(628,'Sub Total','Sub Total'),(629,'Total Due','Total Due'),(630,'Once you confirm the invoice, you will n','Once you confirm the invoice, you will n'),(631,'Note','Note'),(632,'Add Setting','Add Setting'),(633,'Edit SIP Profile','Edit SIP Profile'),(634,'New','New'),(635,'Used?','Used?'),(636,'View Email','View Email'),(637,'Active','Active'),(638,'Inactive','Inactive'),(639,'Black List','Black List'),(640,'White List','White List'),(641,'Freeswitch Server Information','Freeswitch Server Information'),(642,'Currencies','Currencies'),(643,'Edit Currency','Edit Currency'),(644,'Is Distributor','Is Distributor'),(645,'Package created successfully!','Package created successfully!'),(646,'DID Removed Successfully.','DID Removed Successfully.'),(647,'DID not found.','DID not found.'),(648,'Password changed Sucessfully....!!!','Password changed Sucessfully....!!!'),(649,'New Password & Conformpassword not match','New Password & Conformpassword not match'),(650,'Invalid old passwword.','Invalid old passwword.'),(651,'Permission Denied!','Permission Denied!'),(652,'Refill Coupon amount is added successful','Refill Coupon amount is added successful'),(653,'PLease upload maximum file','PLease upload maximum file'),(654,'files added successfully!','files added successfully!'),(655,'File Uploading Fail Please Try Again','File Uploading Fail Please Try Again'),(656,'Please upload only image!','Please upload only image!'),(657,'Invoice config updated successfully!','Invoice config updated successfully!'),(658,'Your Profile Updated Successfully!','Your Profile Updated Successfully!'),(659,'Something wrong.Please contact to admini','Something wrong.Please contact to admini'),(660,'DID Released Successfully!','DID Released Successfully!'),(661,'IP already exist in system.','IP already exist in system.'),(662,'IP Added Sucessfully.','IP Added Sucessfully.'),(663,'IP Removed Sucessfully.','IP Removed Sucessfully.'),(664,'SIP Device Updated Successfully!','SIP Device Updated Successfully!'),(665,'SIP Device Added Successfully!','SIP Device Added Successfully!'),(666,'SIP Device Removed Sucessfully!','SIP Device Removed Sucessfully!'),(667,'Caller ID Added Sucessfully!','Caller ID Added Sucessfully!'),(668,'Please Enter Caller ID value.','Please Enter Caller ID value.'),(669,'Caller ID already Exists.','Caller ID already Exists.'),(670,'Caller ID removed sucessfully!','Caller ID removed sucessfully!'),(671,'Alert Threshold Updated Successfully!','Alert Threshold Updated Successfully!'),(672,'Can not trnasfer fund to postpaid custom','Can not trnasfer fund to postpaid custom'),(673,'Access Denied! unable transfer fund to t','Access Denied! unable transfer fund to t'),(674,'You can not transfer fund in same accoun','You can not transfer fund in same account'),(675,'You can only transfer fund in same level','You can only transfer fund in same level'),(676,'Please enter To account number.','Please enter To account number.'),(677,'Please enter valid amount.','Please enter valid amount.'),(678,'You have insufficient balance.','You have insufficient balance.'),(679,'Please enter valid account number.','Please enter valid account number.'),(680,'Please enter amount greater then 0.','Please enter amount greater then 0.'),(681,'You need to enter minimum for fund trans','You need to enter minimum for fund trans'),(682,'Please enter valid account number!','Please enter valid account number!'),(683,'Insuffiecient amount !','Insuffiecient amount !'),(684,'Transfer successfully!','Transfer successfully!'),(685,'Account number not found.','Account number not found.'),(686,'OpenSips updated successfully!','OpenSips updated successfully!'),(687,'Duplicate Username Found.Username Must b','Duplicate Username Found.Username Must b'),(688,'User name is required field.','User name is required field.'),(689,'Opensips Device Removed Successfully!.','Opensips Device Removed Successfully!.'),(690,'Speed-dial Number Added Successfully!','Speed-dial Number Added Successfully!'),(691,'Can not delete blank speeddial number','Can not delete blank speeddial number'),(692,'Speed-dial Number Removed Successfully!','Speed-dial Number Removed Successfully!'),(693,'Pin Updated Successfully!','Pin Updated Successfully!'),(694,'DID Updated Successfully!','DID Updated Successfully!'),(695,'for fund transfer.','for fund transfer.'),(696,'You need to enter minimum','You need to enter minimum'),(697,'please enter recharge value','please enter recharge value'),(698,'New Password','New Password'),(699,'Old Password','Old Password'),(700,'Conform Password','Conform Password'),(701,'Letters only please','Letters only please'),(702,'IP Mapping','IP Mapping'),(703,'The Coupon Number field must contain onl','The Coupon Number field must contain onl'),(704,'The Coupon Number field have inactive re','The Coupon Number field have inactive re'),(705,'This Coupon Number is already in use.','This Coupon Number is already in use.'),(706,'This Coupon Number is not found.','This Coupon Number is not found.'),(707,'The Coupon Number field is required.','The Coupon Number field is required.'),(708,'REFILL COUPON RECHARGE','REFILL COUPON RECHARGE'),(709,'You just recharged','You just recharged'),(710,'account with The new balance will be','account with The new balance will be'),(711,'My Profile','My Profile'),(712,'My Account','My Account'),(713,'Alert Threshold','Alert Threshold'),(714,'The Caller ID field is required.','The Caller ID field is required.'),(715,'Change Password','Change Password'),(716,'Bill Type','Bill Type'),(717,'Bill Days','Bill Days'),(718,'New Products','New Products'),(719,'Active Products','Active Products'),(720,'Outstanding','Outstanding'),(721,'Todays Calls','Todays Calls'),(722,'Recent Calls','Recent Calls'),(723,'The Available DIDs field is required.','The Available DIDs field is required.'),(724,'Please enter your password','Please enter your password'),(725,'Please enter your first name','Please enter your first name'),(726,'Please enter your email','Please enter your email'),(727,'Please enter valid email','Please enter valid email'),(728,'This field is required.','This field is required.'),(729,'Email Setting','Email Setting'),(730,'SMTP Password','SMTP Password'),(731,'Are you sure want to remove logo?','Are you sure want to remove logo?'),(732,'The IP field must contain a unique value','The IP field must contain a unique value'),(733,'The IP field have not valid IP.','The IP field have not valid IP.'),(734,'The IP field is required.','The IP field is required.'),(735,'The Name field is required.','The Name field is required.'),(736,'Please enter only alpha-numeric value','Please enter only alpha-numeric value'),(737,'Are you sure want to delete speed dial r','Are you sure want to delete speed dial r'),(738,'Generated Date','Generated Date'),(739,'My Products','My Products'),(740,'Pinless CLI','Pinless CLI'),(741,'Refill Coupon','Refill Coupon'),(742,'TopUp','TopUp'),(743,'Pay with Paypal','Pay with Paypal'),(744,'Pay with Card','Pay with Card'),(745,'Assign','Assign'),(746,'Send Credit','Send Credit'),(747,'To Account','To Account'),(748,'From Account','From Account'),(749,'Transfer','Transfer'),(750,'Telephone 1','Telephone 1'),(751,'Telephone 2','Telephone 2'),(752,'Address 2','Address 2'),(753,'Zip/Postal Code','Zip/Postal Code'),(754,'User Profile','User Profile'),(755,'Low Balance Alert Level','Low Balance Alert Level'),(756,'Enable Email Alerts ?','Enable Email Alerts ?'),(757,'Low Balance Alert Email','Low Balance Alert Email'),(758,'User name','User name'),(759,'Something went to wrong !','Something went to wrong !'),(760,'Product Purchased successfully !','Product Purchased successfully !'),(761,'Insufficent Balance to purchase product','Insufficent Balance to purchase product'),(762,'Product assigned successfully!','Product assigned successfully!'),(763,'Something went wrong !','Something went wrong !'),(764,'Product Not Found','Product Not Found'),(765,'Transaction has been failed','Transaction has been failed'),(766,'not inserted. Transaction has been faile','not inserted. Transaction has been faile'),(767,'Select Customer.','Select Customer.'),(768,'Product Information','Product Information'),(769,'Price+SetUp Fee','Price+SetUp Fee'),(770,'Use Voucher','Use Voucher'),(771,'Amount Without Tax','Amount Without Tax'),(772,'Total Tax','Total Tax'),(773,'Amount With Tax','Amount With Tax'),(774,'Parent Products','Parent Products'),(775,'Edit Product','Edit Product'),(776,'Product updated successfully!','Product updated successfully!'),(777,'Product added successfully!','Product added successfully!'),(778,'Product removed successfully!','Product removed successfully!'),(779,'Product optin successfully!','Product optin successfully!'),(780,'Edit Info','Edit Info'),(781,'Product assign successfully','Product assign successfully'),(782,'Insufficient balance to assign product!','Insufficient balance to assign product!'),(783,'Terminated Updated Successfully!','Terminated Updated Successfully!'),(784,'Terminated','Terminated'),(785,'Setup Cost','Setup Cost'),(786,'Order New','Order New'),(787,'Caller ID updated successfully!','Caller ID updated successfully!'),(788,'Caller ID added successfully!','Caller ID added successfully!'),(789,'Caller ID removed successfully!','Caller ID removed successfully!'),(790,'Name is not contain any space','Name is not contain any space'),(791,'Name already exist in system.','Name already exist in system.'),(792,'Callbarring Settings Updated Successfull','Callbarring Settings Updated Successfull'),(793,'allbarring Settings Added Successfully!','allbarring Settings Added Successfully!'),(794,'Call Barring Removed Successfully!','Call Barring Removed Successfully!'),(795,'Calltype already exist in system.','Calltype already exist in system.'),(796,'Calltype Updated Successfully!','Calltype Updated Successfully!'),(797,'Calltype Added Successfully!','Calltype Added Successfully!'),(798,'calltype removed successfully!','calltype removed successfully!'),(799,'File must be in the following format(.cs','File must be in the following format(.cs'),(800,'Import Package Codes:','Import Package Codes:'),(801,'Code, Destination.','Code, Destination.'),(802,'Records Imported Successfully:','Records Imported Successfully:'),(803,'Records Not Imported :','Records Not Imported :'),(804,'Download Errors','Download Errors'),(805,'Back to Package Patterns List','Back to Package Patterns List'),(806,'Add To List','Add To List'),(807,'Routing Prefix already exist in system.','Routing Prefix already exist in system.'),(808,'Rate Group Updated Successfully!','Rate Group Updated Successfully!'),(809,'Rate Group Added Successfully!','Rate Group Added Successfully!'),(810,'Duplicate Rate Group Added Successfully!','Duplicate Rate Group Added Successfully!'),(811,'Routing Prefix (Enterprise)','Routing Prefix (Enterprise)'),(812,'Priority (Enterprise)','Priority (Enterprise)'),(813,'Percentage (WIP) (Enterprise)','Percentage (WIP) (Enterprise)'),(814,'LCR','LCR'),(815,'Percentage','Percentage'),(816,'Tax removed successfully!','Tax removed successfully!'),(817,'Tax added successfully!','Tax added successfully!'),(818,'Tax updated successfully!','Tax updated successfully!'),(819,'Charges List','Charges List'),(820,'Trunk Updated Successfully!','Trunk Updated Successfully!'),(821,'Trunk Added Successfully!','Trunk Added Successfully!'),(822,'Trunk removed successfully!','Trunk removed successfully!'),(823,'setting updated successfully!','setting updated successfully!'),(824,'Template Updated Successfully!','Template Updated Successfully!'),(825,'Template Added Successfully!','Template Added Successfully!'),(826,'Country Updated successfully!','Country Updated successfully!'),(827,'Country Added successfully!','Country Added successfully!'),(828,'Country removed successfully!','Country removed successfully!'),(829,'Currency Updated Successfully!','Currency Updated Successfully!'),(830,'My Rates','My Rates'),(831,'Cost / Min','Cost / Min'),(832,'Purchase','Purchase'),(833,'Available DIDs','Available DIDs'),(834,'New IP','New IP'),(835,'Digits','Digits'),(836,'Email Address','Email Address'),(837,'Call Forward','Call Forward'),(838,'If Busy:','If Busy:'),(839,'If SIP Not Registered:','If SIP Not Registered:'),(840,'If No Answer:','If No Answer:'),(841,'Pay Now','Pay Now'),(842,'Pay with Account','Pay with Account'),(843,'Please wait, your order is being processed and you will be redirected to the paypal website.','Please wait, your order is being processed and you will be redirected to the paypal website.'),(844,'Coupon Number:','Coupon Number:'),(845,'Add Voucher','Add Voucher'),(846,'Selected Plan','Selected Plan'),(847,'My Product','My Product'),(848,'Parent Product','Parent Product'),(849,'Edit Email Template','Edit Email Template'),(850,'Details','Details'),(851,'KEY','KEY'),(852,'VALUE','VALUE'),(853,'Records with duplicate account number and email will be ignored.','Records with duplicate account number and email will be ignored.'),(854,'Account Details','Account Details'),(855,'Mass Customer','Mass Customer'),(856,'Daily','Daily'),(857,'Monthly','Monthly'),(858,'Prepaid','Prepaid'),(859,'Postpaid','Postpaid'),(860,'Force Caller ID','Force Caller ID'),(861,'Customer Profile','Customer Profile'),(862,'Caller Id Name','Caller Id Name'),(863,'Caller Id Number','Caller Id Number'),(864,'Blocked Codes','Blocked Codes'),(865,'Page will display only receipts and confirmed invoices.','Page will display only receipts and confirmed invoices.'),(866,'Accessnumber Updated Successfully!','Accessnumber Updated Successfully!'),(867,'Accessnumber Removed Successfully!','Accessnumber Removed Successfully!'),(868,'Invalid file format : Only CSV file allows to import records(Can\'t import empty file)','Invalid file format : Only CSV file allows to import records(Can\'t import empty file)'),(869,'Access Number,Country','Access Number,Country'),(870,'Please Select File.','Please Select File.'),(871,'are required','are required'),(872,'is Required','is Required'),(873,'is not Valid','is not Valid'),(874,'Duplicate accessnumber found from database','Duplicate accessnumber found from database'),(875,'Duplicate accessnumber found from import file.','Duplicate accessnumber found from import file.'),(876,'Total','Total'),(877,'AccessNumber Imported Successfully!','AccessNumber Imported Successfully!'),(878,'Records Not Imported:','Records Not Imported:'),(879,'Back to AccessNumber List','Back to AccessNumber List'),(880,'Speed Dial Number Updated Successfully','Speed Dial Number Updated Successfully'),(881,'Please insert only numeric value!','Please insert only numeric value!'),(882,'Speed Dial Number Removed Successfully','Speed Dial Number Removed Successfully'),(883,'Speed Dial Number is Empty','Speed Dial Number is Empty'),(884,'Sip Device removed successfully!','Sip Device removed successfully!'),(885,'Sip updated successfully!','Sip updated successfully!'),(886,'Block Code Removed Sucessfully!','Block Code Removed Sucessfully!'),(887,'Your Account Limit has been reached.Please Change Your Prefix.','Your Account Limit has been reached.Please Change Your Prefix.'),(888,'Please Enter Proper Account Length.','Please Enter Proper Account Length.'),(889,'Bulk customer generate successfully!','Bulk customer generate successfully!'),(890,'Recharge successfully!','Recharge successfully!'),(891,'Post charge applied successfully.','Post charge applied successfully.'),(892,'Account callerID updated successfully!','Account callerID updated successfully!'),(893,'Account callerID added successfully!','Account callerID added successfully!'),(894,'Reseller updated successfully!','Reseller updated successfully!'),(895,'Reseller added successfully!','Reseller added successfully!'),(896,'Updated successfully!','Updated successfully!'),(897,'Added Successfully!','Added Successfully!'),(898,'Customer batch updated successfully!','Customer batch updated successfully!'),(899,'Reseller batch updated successfully!','Reseller batch updated successfully!'),(900,'Customer Removed Successfully!','Customer Removed Successfully!'),(901,'Reseller Removed Successfully!','Reseller Removed Successfully!'),(902,'Provider Removed Successfully!','Provider Removed Successfully!'),(903,'Admin Removed Successfully!','Admin Removed Successfully!'),(904,'Sub Admin Removed Successfully!','Sub Admin Removed Successfully!'),(905,'DID Added Successfully.','DID Added Successfully.'),(906,'DID Already Removed Before.','DID Already Removed Before.'),(907,'Account Tax Added Successfully!','Account Tax Added Successfully!'),(908,'Account Tax Removed Successfully!','Account Tax Removed Successfully!'),(909,'Product Removed Sucessfully.','Product Removed Sucessfully.'),(910,'Email Resend Successfully!','Email Resend Successfully!'),(911,'Email List Updated Successfully!','Email List Updated Successfully!'),(912,'Email List Added Successfully!','Email List Added Successfully!'),(913,'Email Removed Successfully!','Email Removed Successfully!'),(914,'Please Try Again!','Please Try Again!'),(915,'Email BroadCast Successfully!','Email BroadCast Successfully!'),(916,'No Record Found!','No Record Found!'),(917,'Email Address Not Found!','Email Address Not Found!'),(918,'Edit Freeswitch SIP Devices','Edit Freeswitch SIP Devices'),(919,'Create Freeswitch SIP Devices','Create Freeswitch SIP Devices'),(920,'Gateway Updated Successfully!','Gateway Updated Successfully!'),(921,'Gateways already exist in system.','Gateways already exist in system.'),(922,'Gateway name must not have any space.','Gateway name must not have any space.'),(923,'Gateway Added Successfully!','Gateway Added Successfully!'),(924,'Gateway Removed Successfully!','Gateway Removed Successfully!'),(925,'Please enter All profile value!','Please enter All profile value!'),(926,'SIP Profile name must not have any space!','SIP Profile name must not have any space!'),(927,'Duplicate SIP IP OR Port found it must be unique!','Duplicate SIP IP OR Port found it must be unique!'),(928,'SIP Profile Added Successfully!','SIP Profile Added Successfully!'),(929,'Name must be unique!','Name must be unique!'),(930,'SIP Profile Updated Successfully!','SIP Profile Updated Successfully!'),(931,'SIP Setting Added Successfully!','SIP Setting Added Successfully!'),(932,'SIP Setting Updated Successfully!','SIP Setting Updated Successfully!'),(933,'SIP Setting Removed Successfully!','SIP Setting Removed Successfully!'),(934,'SIP Profile Removed Successfully!','SIP Profile Removed Successfully!'),(935,'Host Already Exist in System.','Host Already Exist in System.'),(936,'Freeswitch Server Updated Successfully!','Freeswitch Server Updated Successfully!'),(937,'Freeswitch Server Added Successfully!','Freeswitch Server Added Successfully!'),(938,'Freeswitch Server Removed Successfully!','Freeswitch Server Removed Successfully!'),(939,'Invoice updated successfully!','Invoice updated successfully!'),(940,'Invoice payment done successfully!','Invoice payment done successfully!'),(941,'Account Not Found.','Account Not Found.'),(942,'Invoice payment amount should be higher then the invoice amount.','Invoice payment amount should be higher then the invoice amount.'),(943,'The Favicon file size shoud not exceed 1MB!','The Favicon file size shoud not exceed 1MB!'),(944,'Please upload 250 * 60 size file','Please upload 250 * 60 size file'),(945,'Logo only allows file types of JPG and JPEG.','Logo only allows file types of JPG and JPEG.'),(946,'Favicon only allows file types of ICO, PNG, JPG and JPEG.','Favicon only allows file types of ICO, PNG, JPG and JPEG.'),(947,'Please upload 16 * 16 size of favicon.','Please upload 16 * 16 size of favicon.'),(948,'Company profile updated sucessfully!','Company profile updated sucessfully!'),(949,'Company profile added sucessfully!','Company profile added sucessfully!'),(950,'Permission Denied.','Permission Denied.'),(951,'is Deleted Sucessfully!','is Deleted Sucessfully!'),(952,'To date should not be greater than current date.','To date should not be greater than current date.'),(953,'Invoice generation completed.','Invoice generation completed.'),(954,'No data found','No data found'),(955,'Invoices removed successfully','Invoices removed successfully'),(956,'The Prefix field must contain a unique value.','The Prefix field must contain a unique value.'),(957,'The IP field must contain a unique value.','The IP field must contain a unique value.'),(958,'IP Map added successfully!','IP Map added successfully!'),(959,'IP Map removed successfully!','IP Map removed successfully!'),(960,'Localization Added Successfully!','Localization Added Successfully!'),(961,'Localization Updated Successfully!','Localization Updated Successfully!'),(962,'Localization Removed Successfully!','Localization Removed Successfully!'),(963,'Globalization is already exist in this system','Globalization is already exist in this system'),(964,'Dispatcher Updated Successfully!','Dispatcher Updated Successfully!'),(965,'Dispatcher Added Successfully!','Dispatcher Added Successfully!'),(966,'Dispatcher Removed Successfully!','Dispatcher Removed Successfully!'),(967,'Code is already in system','Code is already in system'),(968,'Country is already in system','Country is already in system'),(969,'Ratedeck updated successfully!','Ratedeck updated successfully!'),(970,'Ratedeck added successfully!','Ratedeck added successfully!'),(971,'Ratedeck removed successfully!','Ratedeck removed successfully!'),(972,'Code,Destination,Province/State,City,Status','Code,Destination,Province/State,City,Status'),(973,'Duplicate Ratedeck Number found from import file.','Duplicate Ratedeck Number found from import file.'),(974,'Ratedeck Imported Successfully!','Ratedeck Imported Successfully!'),(975,'Ratedeck Import Error','Ratedeck Import Error'),(976,'Back to Ratedeck List','Back to Ratedeck List'),(977,'Origination Rate Imported Successfully!','Origination Rate Imported Successfully!'),(978,'Origination Rate Updated Successfully!','Origination Rate Updated Successfully!'),(979,'Origination Rate Added Successfully!','Origination Rate Added Successfully!'),(980,'Termination Rates Batch Updated Successfully!','Termination Rates Batch Updated Successfully!'),(981,'Map CSV to Termination Rates','Map CSV to Termination Rates'),(982,'Data Example','Data Example'),(983,'Map to Field','Map to Field'),(984,'PREFIX/DEFAULT VALUE','PREFIX/DEFAULT VALUE'),(985,'FLUX Field','FLUX Field'),(986,'Created','Created'),(987,'Modified','Modified'),(988,'You can not create','You can not create'),(989,'Refill coupon with','Refill coupon with'),(990,'You can create maximum','You can create maximum'),(991,'Refill coupon created successfully!','Refill coupon created successfully!'),(992,'Currency Added Successfully!','Currency Added Successfully!'),(993,'Currency Removed Successfully!','Currency Removed Successfully!'),(994,'Backup Exported Successfully!','Backup Exported Successfully!'),(995,'An error occur when the system tried to backup of the database. Please check yours system settings for the backup section','An error occur when the system tried to backup of the database. Please check yours system settings for the backup section'),(996,'Database Restore successfully.','Database Restore successfully.'),(997,'File not exists!','File not exists!'),(998,'There is a some issue or invalid file format.','There is a some issue or invalid file format.'),(999,'Database backup deleted successfully.','Database backup deleted successfully.'),(1000,'Languages updated successfully!','Languages updated successfully!'),(1001,'Languages removed successfully!','Languages removed successfully!'),(1002,'Languages added successfully!','Languages added successfully!'),(1003,'Translation updated successfully!','Translation updated successfully!'),(1004,'Translation added successfully!','Translation added successfully!'),(1005,'Update Languages','Update Languages'),(1006,'Speed Dial','Speed Dial'),(1007,'Payment','Payment'),(1008,'Method','Method'),(1009,'Once you confirm the invoice, you will no longer able to update it again.','Once you confirm the invoice, you will no longer able to update it again.'),(1010,'Payment Gateway Permission','Payment Gateway Permission'),(1011,'Zip Code','Zip Code'),(1012,'Yes','Yes'),(1013,'Back','Back'),(1014,'Edit Reseller','Edit Reseller'),(1015,'Asignar DID a granel','Asignar DID a granel'),(1016,'DIDs Search','DIDs Search'),(1017,'By Month','By Month'),(1018,'Create Gateway','Create Gateway'),(1019,'Calling Card Language','Calling Card Language'),(1020,'Last','Last'),(1021,'Pay Date','Pay Date'),(1022,'Purchase DID','Purchase DID'),(1023,'Caller-ID-A-Form','Caller-ID-A-Form'),(1024,'Expire Seconds','Expire Seconds'),(1025,'Termination Date','Termination Date'),(1026,'Registration Date','Registration Date'),(1027,'Payment By','Payment By'),(1028,'Product Status','Product Status'),(1029,'Minute','Minute'),(1030,'Hour','Hour'),(1031,'Day','Day'),(1032,'Month','Month'),(1033,'Year','Year'),(1034,'List','List'),(1035,'Edit','Edit'),(1036,'Not Avaialable any Subscription.','Not Avaialable any Subscription.'),(1037,'Not Avaialable any Package for this Country.','Not Avaialable any Package for this Country.'),(1038,'You can only transfer fund in same level account.','You can only transfer fund in same level account.'),(1039,'You can not transfer fund in same account.','You can not transfer fund in same account.'),(1040,'Monthly Fee','Monthly Fee'),(1041,'Bulk DID Assign','Bulk DID Assign'),(1042,'Invoice Start From','Invoice Start From'),(1043,'Edit Gateway','Edit Gateway'),(1044,'Number Of Default Rows','Number Of Default Rows'),(1045,'Mobile Dialer','Mobile Dialer'),(1046,'Trunk Count','Trunk Count'),(1047,'Welcome File','Welcome File'),(1048,'Local Call Timeout (Sec.)','Local Call Timeout (Sec.)'),(1049,'Rate check for DID','Rate check for DID'),(1050,'DID Localization','DID Localization'),(1051,'Voicemail Number','Voicemail Number'),(1052,'OTP Expire Time(min)','OTP Expire Time(min)'),(1053,'Edit Provider','Edit Provider'),(1054,'Product Summary Reports','Product Summary Reports'),(1055,'Edit Origination Rate','Edit Origination Rate'),(1056,'Dialplan Variable','Dialplan Variable'),(1057,'Uninstall','Uninstall'),(1058,'Call Stat','Call Stat'),(1059,'Failed Calls','Failed Calls'),(1060,'Top 10 Countries','Top 10 Countries'),(1061,'By Minutes','By Minutes'),(1062,'By Calls','By Calls'),(1063,'Profit per day','Profit per day'),(1064,'January','January'),(1065,'February','February'),(1066,'March','March'),(1067,'April','April'),(1068,'May','May'),(1069,'June','June'),(1070,'July','July'),(1071,'August','August'),(1072,'September','September'),(1073,'October','October'),(1074,'November','November'),(1075,'December','December'),(1076,'Doesn\'t Contain','Doesn\'t Contain'),(1077,'Greater Than','Greater Than'),(1078,'Less Than','Less Than'),(1079,'Greater Or Equal Than','Greater Or Equal Than'),(1080,'Less Or Equal Than','Less Or Equal Than'),(1081,'Set To','Set To'),(1082,'Increase By','Increase By'),(1083,'Decrease By','Decrease By'),(1084,'Community','Community'),(1085,'You must either select a field from your file OR provide a default value for the following fields:','You must either select a field from your file OR provide a default value for the following fields:'),(1086,'Account Number,Password,First Name,Last Name,Company,Phone,Mobile,Email,Address,city,Province/State,Zip/Postal Code,Number Translation,Out Callerid Translation,In Callerid Translation,Concurrent Calls,CPS,Balance,Credit Limit,SIP Username,SIP Password','Account Number,Password,First Name,Last Name,Company,Phone,Mobile,Email,Address,city,Province/State,Zip/Postal Code,Number Translation,Out Callerid Translation,In Callerid Translation,Concurrent Calls,CPS,Balance,Credit Limit,SIP Username,SIP Password'),(1087,'Note : Records with duplicate account number and email will be ignored.','Note : Records with duplicate account number and email will be ignored.'),(1088,'Map CSV to Customers','Map CSV to Customers'),(1089,'Account Information','Account Information'),(1090,'Select Account','Select Account'),(1091,'DEFAULT VALUE','DEFAULT VALUE'),(1092,'SIP Username','SIP Username'),(1093,'sip_username','sip_username'),(1094,'SIP Password','SIP Password'),(1095,'Same as Password','Same as Password'),(1096,'Same as Account Number','Same as Account Number'),(1097,'Random','Random'),(1098,'Import File Data.','Import File Data.'),(1099,'Process Records','Process Records'),(1100,'Note : Duplicate accounts with account number / email are ignored.','Note : Duplicate accounts with account number / email are ignored.'),(1101,'Remove','Remove'),(1102,'Number of Account','Number of Account'),(1103,'Account Number Length','Account Number Length'),(1104,'DID (CLI Match, If not matched then use random allocated DID)','DID (CLI Match, If not matched then use random allocated DID)'),(1105,'Caller Id (CLI Match, If not matched then use random allocated Caller Id)','Caller Id (CLI Match, If not matched then use random allocated Caller Id)'),(1106,'Use NON-CLI Rate Group (If CLI not match with DID)','Use NON-CLI Rate Group (If CLI not match with DID)'),(1107,'Use NON-CLI Rate Group (If CLI not match with Caller ID)','Use NON-CLI Rate Group (If CLI not match with Caller ID)'),(1108,'Use NON-CLI Rate Group (If CLI not match with DID & Caller id)','Use NON-CLI Rate Group (If CLI not match with DID & Caller id)'),(1109,'Reject Call (If CLI not match with DID)','Reject Call (If CLI not match with DID)'),(1110,'Reject Call (If CLI not match with Caller ID)','Reject Call (If CLI not match with Caller ID)'),(1111,'Reject Call (If CLI not match with DID & Caller id)','Reject Call (If CLI not match with DID & Caller id)'),(1112,'--Select--','--Select--'),(1113,'Test Mail','Test Mail'),(1114,'Reset Password','Reset Password'),(1115,'country','AFGHANISTAN'),(1116,'country','ALBANIA'),(1117,'country','ALGERIA'),(1118,'country','AMERICAN SAMOA'),(1119,'country','ANDORRA'),(1120,'country','ANGOLA'),(1121,'country','ANGUILLA'),(1122,'country','ANTIGUA & BARBUDA'),(1123,'country','ARGENTINA'),(1124,'country','ARMENIA'),(1125,'country','ARUBA'),(1126,'country','AUSTRALIA'),(1127,'country','AUSTRIA'),(1128,'country','AZERBAIJAN'),(1129,'country','BAHAMAS'),(1130,'country','BAHRAIN'),(1131,'country','BANGLADESH'),(1132,'country','BARBADOS'),(1133,'country','BELARUS'),(1134,'country','BELGIUM'),(1135,'country','BELIZE'),(1136,'country','BENIN'),(1137,'country','BERMUDA'),(1138,'country','BHUTAN'),(1139,'country','BOLIVIA'),(1140,'country','BOSNIA AND HERZEGOVINA'),(1141,'country','BOTSWANA'),(1142,'country','BRAZIL'),(1143,'country','BRITISH VIRGIN ISLANDS'),(1144,'country','BRUNEI'),(1145,'country','BULGARIA'),(1146,'country','BURKINA FASO'),(1147,'country','BURUNDI'),(1148,'country','CAMBODIA'),(1149,'country','CAMEROON'),(1150,'country','CANADA'),(1151,'country','CAPE VERDE'),(1152,'country','CAYMAN ISLANDS'),(1153,'country','CENTRAL AFRICAN REPUBLIC'),(1154,'country','CHAD'),(1155,'country','CHILE'),(1156,'country','CHINA'),(1157,'country','COLOMBIA'),(1158,'country','COMOROS'),(1159,'country','CONGO'),(1160,'country','COSTA RICA'),(1161,'country','CROATIA'),(1162,'country','CUBA'),(1163,'country','CYPRUS'),(1164,'country','CZECH REPUBLIC'),(1165,'country','DEMOCRATIC REPUBLIC'),(1166,'country','DENMARK'),(1167,'country','DJIBOUTI'),(1168,'country','DOMINICA'),(1169,'country','DOMINICAN REPUBLIC'),(1170,'country','ECUADOR'),(1171,'country','EGYPT'),(1172,'country','EL SALVADOR'),(1173,'country','EQUATORIAL GUINEA'),(1174,'country','ERITREA'),(1175,'country','ETHIOPIA'),(1176,'country','FAEROE ISLANDS'),(1177,'country','FIJI ISLANDS'),(1178,'country','FINLAND'),(1179,'country','FRANCE'),(1180,'country','FRENCH GUIANA'),(1181,'country','FRENCH POLYNESIA'),(1182,'country','GABON'),(1183,'country','GAMBIA'),(1184,'country','GEORGIA'),(1185,'country','GERMANY'),(1186,'country','GHANA'),(1187,'country','GIBRALTAR'),(1188,'country','GREECE'),(1189,'country','GRENADA'),(1190,'country','GUADELOUPE'),(1191,'country','GUAM'),(1192,'country','GUATEMALA'),(1193,'country','GUINEA'),(1194,'country','GUINEA BISSAU'),(1195,'country','GUYANA'),(1196,'country','HAITI'),(1197,'country','HONDURAS'),(1198,'country','HONG KONG'),(1199,'country','HUNGARY'),(1200,'country','ICELAND'),(1201,'country','INDIA'),(1202,'country','INDONESIA'),(1203,'country','IRAN'),(1204,'country','IRAQ'),(1205,'country','IRELAND'),(1206,'country','ISRAEL'),(1207,'country','ITALY'),(1208,'country','IVORY COAST'),(1209,'country','JAMAICA'),(1210,'country','JAPAN'),(1211,'country','JORDAN'),(1212,'country','KAZAKHSTAN'),(1213,'country','KENYA'),(1214,'country','KOSOVO'),(1215,'country','KUWAIT'),(1216,'country','KYRGYZSTAN'),(1217,'country','LAOS'),(1218,'country','LATVIA'),(1219,'country','LEBANON'),(1220,'country','LESOTHO'),(1221,'country','LIBERIA'),(1222,'country','LIBYA'),(1223,'country','LIECHTENSTEIN'),(1224,'country','LITHUANIA'),(1225,'country','LUXEMBOURG'),(1226,'country','MACAU'),(1227,'country','MACEDONIA'),(1228,'country','MADAGASCAR'),(1229,'country','MALAWI'),(1230,'country','MALAYSIA'),(1231,'country','MALI'),(1232,'country','MALTA'),(1233,'country','MARSHALL ISLANDS'),(1234,'country','MARTINIQUE'),(1235,'country','MAURITANIA'),(1236,'country','MAURITIUS'),(1237,'country','MEXICO'),(1238,'country','MICRONESIA'),(1239,'country','MOLDOVA'),(1240,'country','MONACO'),(1241,'country','MONGOLIA'),(1242,'country','MONTENEGRO'),(1243,'country','MONTSERRAT'),(1244,'country','MOROCCO'),(1245,'country','MOZAMBIQUE'),(1246,'country','MYANMAR'),(1247,'country','NAMIBIA'),(1248,'country','NEPAL'),(1249,'country','NETHERLANDS'),(1250,'country','NEW CALEDONIA'),(1251,'country','NEW ZEALAND'),(1252,'country','NICARAGUA'),(1253,'country','NIGER'),(1254,'country','NIGERIA'),(1255,'country','NO. MARIANA ISLANDS'),(1256,'country','NORTH KOREA'),(1257,'country','NORWAY'),(1258,'country','OMAN'),(1259,'country','PAKISTAN'),(1260,'country','PALAU'),(1261,'country','PANAMA'),(1262,'country','PARAGUAY'),(1263,'country','PERU'),(1264,'country','PHILIPPINES'),(1265,'country','POLAND'),(1266,'country','PORTUGAL'),(1267,'country','PUERTO RICO'),(1268,'country','QATAR'),(1269,'country','REUNION ISLAND'),(1270,'country','ROMANIA'),(1271,'country','RUSSIAN FEDERATION'),(1272,'country','RWANDA'),(1273,'country','SAN MARINO'),(1274,'country','SAUDI ARABIA'),(1275,'country','SENEGAL'),(1276,'country','SERBIA'),(1277,'country','SEYCHELLES ISLANDS'),(1278,'country','SIERRA LEONE'),(1279,'country','SINGAPORE'),(1280,'country','SLOVAKIA'),(1281,'country','SLOVENIA'),(1282,'country','SOMALIA'),(1283,'country','SOUTH AFRICA'),(1284,'country','SOUTH KOREA'),(1285,'country','SOUTH SUDAN'),(1286,'country','SPAIN'),(1287,'country','SRI LANKA'),(1288,'country','ST. KITTS'),(1289,'country','ST. LUCIA'),(1290,'country','ST. MARTIN'),(1291,'country','ST. PIERRE & MIQUELON'),(1292,'country','ST. VINCENT'),(1293,'country','SUDAN'),(1294,'country','SURINAME'),(1295,'country','SWAZILAND'),(1296,'country','SWEDEN'),(1297,'country','SWITZERLAND'),(1298,'country','SYRIA'),(1299,'country','TAIWAN'),(1300,'country','TAJIKISTAN'),(1301,'country','TANZANIA'),(1302,'country','THAILAND'),(1303,'country','TRINIDAD & TOBAGO'),(1304,'country','TUNISIA'),(1305,'country','TURKEY'),(1306,'country','TURKMENISTAN'),(1307,'country','TURKS & CAICOS ISLANDS'),(1308,'country','UGANDA'),(1309,'country','UKRAINE'),(1310,'country','UNITED ARAB EMIRATES'),(1311,'country','UNITED KINGDOM'),(1312,'country','URUGUAY'),(1313,'country','US VIRGIN ISLANDS'),(1314,'country','United States'),(1315,'country','UZBEKISTAN'),(1316,'country','VENEZUELA'),(1317,'country','VIETNAM'),(1318,'country','YEMEN'),(1319,'country','ZAMBIA'),(1320,'country','ZIMBABWE'),(1321,'currency','ASCENSION'),(1322,'currency','COOK ISLANDS'),(1323,'currency','EAST TIMOR'),(1324,'currency','FALKLAND ISLANDS'),(1325,'currency','GREENLAND'),(1326,'currency','KIRIBATI'),(1327,'currency','MALDIVES'),(1328,'currency','NAURU'),(1329,'currency','Albanian Lek'),(1330,'currency','Algerian Dinar'),(1331,'currency','Aluminium Ounces'),(1332,'currency','Argentine Peso'),(1333,'currency','Aruba Florin'),(1334,'currency','Australian Dollar'),(1335,'currency','Bahamian Dollar'),(1336,'currency','Bahraini Dinar'),(1337,'currency','Bangladesh Taka'),(1338,'currency','Barbados Dollar'),(1339,'currency','Belarus Ruble'),(1340,'currency','Belize Dollar'),(1341,'currency','Bermuda Dollar'),(1342,'currency','Bhutan Ngultrum'),(1343,'currency','Bolivian Boliviano'),(1344,'currency','Brazilian Real'),(1345,'currency','British Pound'),(1346,'currency','Brunei Dollar'),(1347,'currency','Bulgarian Lev'),(1348,'currency','Burundi Franc'),(1349,'currency','Cambodia Riel'),(1350,'currency','Canadian Dollar'),(1351,'currency','Cayman Islands Dollar'),(1352,'currency','CFA Franc (BCEAO)'),(1353,'currency','CFA Franc (BEAC)'),(1354,'currency','Chilean Peso'),(1355,'currency','Chinese Yuan'),(1356,'currency','Colombian Peso'),(1357,'currency','Comoros Franc'),(1358,'currency','Copper Ounces'),(1359,'currency','Costa Rica Colon'),(1360,'currency','Croatian Kuna'),(1361,'currency','Cuban Peso'),(1362,'currency','Cyprus Pound'),(1363,'currency','Czech Koruna'),(1364,'currency','Danish Krone'),(1365,'currency','Dijibouti Franc'),(1366,'currency','Dominican Peso'),(1367,'currency','East Caribbean Dollar'),(1368,'currency','Ecuador Sucre'),(1369,'currency','Egyptian Pound'),(1370,'currency','El Salvador Colon'),(1371,'currency','Eritrea Nakfa'),(1372,'currency','Estonian Kroon'),(1373,'currency','Ethiopian Birr'),(1374,'currency','Euro'),(1375,'currency','Falkland Islands Pound'),(1376,'currency','Gambian Dalasi'),(1377,'currency','Ghanian Cedi'),(1378,'currency','Gibraltar Pound'),(1379,'currency','Gold Ounces'),(1380,'currency','Guatemala Quetzal'),(1381,'currency','Guinea Franc'),(1382,'currency','Haiti Gourde'),(1383,'currency','Honduras Lempira'),(1384,'currency','Hong Kong Dollar'),(1385,'currency','Hungarian ForINT'),(1386,'currency','Iceland Krona'),(1387,'currency','Indian Rupee'),(1388,'currency','Indonesian Rupiah'),(1389,'currency','Iran Rial'),(1390,'currency','Israeli Shekel'),(1391,'currency','Jamaican Dollar'),(1392,'currency','Japanese Yen'),(1393,'currency','Jordanian Dinar'),(1394,'currency','Kazakhstan Tenge'),(1395,'currency','Kenyan Shilling'),(1396,'currency','Korean Won'),(1397,'currency','Kuwaiti Dinar'),(1398,'currency','Lao Kip'),(1399,'currency','Latvian Lat'),(1400,'currency','Lebanese Pound'),(1401,'currency','Lesotho Loti'),(1402,'currency','Libyan Dinar'),(1403,'currency','Lithuanian Lita'),(1404,'currency','Macau Pataca'),(1405,'currency','Macedonian Denar'),(1406,'currency','Malagasy Franc'),(1407,'currency','Malawi Kwacha'),(1408,'currency','Malaysian Ringgit'),(1409,'currency','Maldives Rufiyaa'),(1410,'currency','Maltese Lira'),(1411,'currency','Mauritania Ougulya'),(1412,'currency','Mauritius Rupee'),(1413,'currency','Mexican Peso'),(1414,'currency','Moldovan Leu'),(1415,'currency','Mongolian Tugrik'),(1416,'currency','Moroccan Dirham'),(1417,'currency','Mozambique Metical'),(1418,'currency','Namibian Dollar'),(1419,'currency','Nepalese Rupee'),(1420,'currency','Neth Antilles Guilder'),(1421,'currency','New Turkish Lira'),(1422,'currency','New Zealand Dollar'),(1423,'currency','Nicaragua Cordoba'),(1424,'currency','Nigerian Naira'),(1425,'currency','Norwegian Krone'),(1426,'currency','Omani Rial'),(1427,'currency','Pacific Franc'),(1428,'currency','Pakistani Rupee'),(1429,'currency','Palladium Ounces'),(1430,'currency','Panama Balboa'),(1431,'currency','Papua New Guinea Kina'),(1432,'currency','Paraguayan Guarani'),(1433,'currency','Peruvian Nuevo Sol'),(1434,'currency','Philippine Peso'),(1435,'currency','Platinum Ounces'),(1436,'currency','Polish Zloty'),(1437,'currency','Qatar Rial'),(1438,'currency','Romanian Leu'),(1439,'currency','Romanian New Leu'),(1440,'currency','Russian Rouble'),(1441,'currency','Rwanda Franc'),(1442,'currency','Samoa Tala'),(1443,'currency','Sao Tome Dobra'),(1444,'currency','Saudi Arabian Riyal'),(1445,'currency','Seychelles Rupee'),(1446,'currency','Sierra Leone Leone'),(1447,'currency','Silver Ounces'),(1448,'currency','Singapore Dollar'),(1449,'currency','Slovak Koruna'),(1450,'currency','Slovenian Tolar'),(1451,'currency','Somali Shilling'),(1452,'currency','South African Rand'),(1453,'currency','Sri Lanka Rupee'),(1454,'currency','St Helena Pound'),(1455,'currency','Sudanese Dinar'),(1456,'currency','Surinam Guilder'),(1457,'currency','Swaziland Lilageni'),(1458,'currency','Swedish Krona'),(1459,'currency','Swiss Franc'),(1460,'currency','Syrian Pound'),(1461,'currency','Taiwan Dollar'),(1462,'currency','Tanzanian Shilling'),(1463,'currency','Thai Baht'),(1464,'currency','Tonga Paanga'),(1465,'currency','Trinidad&Tobago Dollar'),(1466,'currency','Tunisian Dinar'),(1467,'currency','U.S. Dollar'),(1468,'currency','UAE Dirham'),(1469,'currency','Ugandan Shilling'),(1470,'currency','Ukraine Hryvnia'),(1471,'currency','Uruguayan New Peso'),(1472,'currency','Vanuatu Vatu'),(1473,'currency','Venezuelan Bolivar'),(1474,'currency','Vietnam Dong'),(1475,'currency','Yemen Riyal'),(1476,'currency','Zambian Kwacha'),(1477,'currency','Zimbabwe Dollar'),(1478,'currency','Guyana Dollar'),(1479,'currency','Aruban florin'),(1480,'currency','Armenian dram'),(1481,'currency','Azerbaijani manat'),(1482,'currency','Barbadian dollar'),(1483,'currency','Bosnian Convertible Marka'),(1484,'currency','Botswana pula'),(1485,'currency','Cape Verdean escudo'),(1486,'currency','Congolese franc'),(1487,'currency','Fijian Dollar'),(1488,'currency','CFP franc'),(1489,'currency','Georgian lari'),(1490,'currency','Iraqi dinar'),(1491,'currency','Kyrgyzstani som'),(1492,'currency','Liberian dollar'),(1493,'currency','Malagasy ariary'),(1494,'currency','Burmese Kyat'),(1495,'currency','North Korean won'),(1496,'currency','nuevo sol'),(1497,'currency','Serbian dinar'),(1498,'currency','South Korean won'),(1499,'currency','South Sudanese pound'),(1500,'currency','Sudanese pound'),(1501,'currency','Surinamese dollar'),(1502,'currency','Tajikistani samani'),(1503,'currency','Turkish lira'),(1504,'currency','Turkmenistan manat'),(1505,'currency','Pound sterling'),(1506,'currency','Uzbekistani soʻm'),(1507,'currency','Saint Helena pound'),(1508,'currency','Indian Rupees'),(1509,'login and signup','Telephone number is only numeric'),(1510,'login and signup','Please enter valid Captcha code'),(1511,'login and signup','Please contact to administrator'),(1512,'login and signup','Requested email is already exist'),(1513,'login and signup','Requested number is already exist'),(1514,'login and signup','Please enter correct words!'),(1515,'login and signup','THIS IS REQUIRED!'),(1516,'login and signup','Your account has been deleted. Please contact administrator for more information.'),(1517,'login and signup','Your account is inactive. Please contact administrator for more information.'),(1518,'login and signup','Please enter proper Email.'),(1519,'login and signup','Please enter proper Username.'),(1520,'login and signup','This Username or Email is not valid.'),(1521,'login and signup','FLUX - A Smart TelePhony Platform'),(1522,'login and signup','Forgot Password'),(1523,'login and signup','FLUX work best with JavaScript enabled'),(1524,'login and signup','Enter Your Password'),(1525,'login and signup','Confirm Password'),(1526,'login and signup','The Email field is Required'),(1527,'login and signup','The Account Number field is Required'),(1528,'login and signup','Set Default Language'),(1529,'login and signup','Please Re-login to get Impact of selected language.'),(1530,'login and signup','Default Language'),(1531,'login and signup','Signup now!'),(1532,'login and signup','Forgot Password?'),(1533,'login and signup','Sign in'),(1534,'login and signup','Username OR Email'),(1535,'login and signup','Username is Required'),(1536,'login and signup','Password is Required'),(1537,'login and signup','Please Check Your account is deleted or inactive from admin side, please contact to your administrator'),(1538,'login and signup','Please do not use default or less secure password for your account!! You must change password from'),(1539,'login and signup','HERE'),(1540,'login and signup','Login unsuccessful. Please make sure you entered the correct username and password, and that your account is active'),(1541,'login and signup','Please enter Username/email and Password.'),(1542,'login and signup','Payment transaction invalid. Please contact Administrator.'),(1543,'login and signup','Log In'),(1544,'login and signup','Please Enter Password'),(1545,'login and signup','Password must be at least 8 characters and must contain at least one lower case letter, one upper case letter and one digit'),(1546,'login and signup','Please Enter Confirm Password'),(1547,'login and signup','Confirm Password is not match'),(1548,'login and signup','We sent update password link.'),(1549,'login and signup','Please check your Email!'),(1550,'login and signup','Login'),(1551,'login and signup','OTP Verification'),(1552,'login and signup','OTP Number is Required'),(1553,'login and signup','Your account created successfully and account details sent to your registered email address'),(1554,'login and signup','Your password change successfully and new password sent to your registered email address'),(1555,'login and signup','OTP Number is Wrong Please try again Or OTP expire Please Resend'),(1556,'login and signup','OTP has been sent on your email or Telephone number'),(1557,'login and signup','OTP'),(1558,'login and signup','Resend OTP'),(1559,'login and signup','OTP Sent time Out'),(1560,'login and signup','Not Get OTP ?'),(1561,'login and signup','Note:'),(1562,'login and signup','Please make sure do not refresh the page or don\'t go back'),(1563,'login and signup','Login unsuccessful. Please make sure you entered the correct username and password, and that your account is active.'),(1564,'login and signup','Your account has been created successfully!'),(1565,'login and signup','Here is your login information'),(1566,'login and signup','Link is Expire Please Try Again'),(1567,'login and signup','Sorry, we cannot process for singup at this time.'),(1568,'login and signup','Please contact administrator for more information'),(1569,'login and signup','Successful!'),(1570,'login and signup','Captcha is required'),(1571,'login and signup','First Name is Required'),(1572,'login and signup','Telephone is Required'),(1573,'login and signup','Email is Required'),(1574,'login and signup','Please enter a valid email address'),(1575,'login and signup','Please make sure you entered the correct username and password, and that your account is active.'),(1576,'login and signup','Company Name'),(1577,'login and signup','Enter above Captcha'),(1578,'login and signup','Sign up'),(1579,'login and signup','Already Registered !'),(1580,'CLI Pool','CLI Pool'),(1581,'Download','Download'),(1582,'True','True'),(1583,'False','False'),(1584,'--Select Type--','--Select Type--'),(1585,'One Time','One Time'),(1586,'Recurring','Recurring'),(1587,'Recurring Monthly','Recurring Monthly'),(1588,'Outbound','Outbound'),(1589,'Default','Default'),(1590,'Speed Dial Number Added Successfully','Speed Dial Number Added Successfully'),(1591,'Are you sure want to confirm this invoice ? once you confirm it, can not able to edit invoice again.','Are you sure want to confirm this invoice ? once you confirm it, can not able to edit invoice again.'),(1592,'DIDs already purchased by someone.','DIDs already purchased by someone.'),(1593,'DIDs Assigned sucessfully!','DIDs Assigned sucessfully!'),(1594,'Something wrong.Please contact to administrator.','Something wrong.Please contact to administrator.'),(1595,'Duplicate DID found from database','Duplicate DID found from database'),(1596,'Account have not sufficient amount to purchase this DID.','Account have not sufficient amount to purchase this DID.'),(1597,'Account not found or assign to invalid account','Account not found or assign to invalid account'),(1598,'Duplicate DID found from import file.','Duplicate DID found from import file.'),(1599,'DIDs Imported Successfully!','DIDs Imported Successfully!'),(1600,'Insuffiecient fund to purchase this DID.','Insuffiecient fund to purchase this DID.'),(1601,'Balance Below Notification','Balance Below Notification'),(1602,'Edit SIP device','Edit SIP device'),(1603,'Note : Page will display only receipts and confirmed invoices.','Note : Page will display only receipts and confirmed invoices.'),(1604,'Termination Rate Updated Successfully!','Termination Rate Updated Successfully!'),(1605,'Import Termination Rates Using Field Mapper','Import Termination Rates Using Field Mapper'),(1606,'Edit Roles & Permissions','Edit Roles & Permissions'),(1607,'Create Roles & Permissions','Create Roles & Permissions'),(1608,'Edit Admin','Edit Admin'),(1609,'Pin Updated Successfully!.','Pin Updated Successfully!.'),(1610,'Create Termination Rate','Create Termination Rate'),(1611,'Edit Company Profile','Edit Company Profile'),(1612,'Website','Website'),(1613,'Generate Invoice for no usage','Generate Invoice for no usage'),(1614,'Commission Repots','Commission Repots'),(1615,'Top Up','Top Up'),(1616,'Purchase DIDs','Purchase DIDs'),(1617,'Package','Package'),(1618,'Setup','Setup'),(1619,'DID Purchased Successfully.','DID Purchased Successfully.'),(1620,'release','release'),(1621,'DID Batch Updated Successfully!','DID Batch Updated Successfully!'),(1622,'DID forwading set sucessfully!','DID forwading set sucessfully!'),(1623,'Are you sure want to release DID?','Are you sure want to release DID?'),(1624,'Please select atleast one record','Please select atleast one record'),(1625,'Account Balance','Account Balance'),(1626,'Next Bill Date','Next Bill Date'),(1627,'TOTAL AMOUNT','TOTAL AMOUNT'),(1628,'Invoice','Invoice'),(1629,'IP Address','IP Address'),(1630,'Terminate','Terminate'),(1631,'Seconds','Seconds'),(1632,'Recording','Recording'),(1633,'Rates','Rates'),(1634,'Paid','Paid'),(1635,'No Records','No Records'),(1636,'Please select from date','Please select from date'),(1637,'Please select to date','Please select to date'),(1638,'Please select to date bigger than from date','Please select to date bigger than from date'),(1639,'Confirm','Confirm'),(1640,'Edit Country','Edit Country'),(1641,'Skip Header','Skip Header'),(1642,'Origination_rate_error','Origination_rate_error'),(1643,'Termination_rate_error','Termination_rate_error'),(1644,'Termination_Rates','Termination_Rates'),(1645,'Origination_Rates','Origination_Rates'),(1646,'refill_coupon','refill_coupon'),(1647,'Edit Calltype','Edit Calltype'),(1648,'Invoice generation completed .','Invoice generation completed .'),(1649,'No data found.','No data found.'),(1650,'DID added successfully!','DID added successfully!'),(1651,'File must be in the following format(.csv):','File must be in the following format(.csv):'),(1652,'Process','Process'),(1653,'DID Import Error','DID Import Error'),(1654,'Back to DID List','Back to DID List'),(1655,'Accessnumber Added Successfully!','Accessnumber Added Successfully!'),(1656,'Accessnumber Import Error','Accessnumber Import Error'),(1657,'Origination Rates Preview','Origination Rates Preview'),(1658,'Origination Rates Import Error','Origination Rates Import Error'),(1659,'Back to Origination Rates List','Back to Origination Rates List'),(1660,'Origination Rates Batch Updated Successfully!','Origination Rates Batch Updated Successfully!'),(1661,'Import Ratedeck Preview','Import Ratedeck Preview'),(1662,'CALLTYPE','CALLTYPE'),(1663,'Outbound-Proxy','Outbound-Proxy'),(1664,'Edit Trunk','Edit Trunk'),(1665,'Termination Rate Added Successfully!','Termination Rate Added Successfully!'),(1666,'Edit Termination Rate','Edit Termination Rate'),(1667,'Termination Rates Import Error','Termination Rates Import Error'),(1668,'Termination Rates Imported Successfully!','Termination Rates Imported Successfully!'),(1669,'Select','Select'),(1670,'pattern','pattern'),(1671,'comment','comment'),(1672,'connectcost','connectcost'),(1673,'includedseconds','includedseconds'),(1674,'init_inc','init_inc'),(1675,'inc','inc'),(1676,'Country Name','Country Name'),(1677,'PENDING','PENDING'),(1678,'FAIL','FAIL'),(1679,'Terminate Order','Terminate Order'),(1680,'Compose Email','Compose Email'),(1681,'Message','Message'),(1682,'Send','Send'),(1683,'Start','Start'),(1684,'SIP Port is Required.','SIP Port is Required.'),(1685,'SIP IP is Required.','SIP IP is Required.'),(1686,'Name is Required.','Name is Required.'),(1687,'The SIP Port field is Required.','The SIP Port field is Required.'),(1688,'The SIP Port field must contain only numbers.','The SIP Port field must contain only numbers.'),(1689,'The SIP Port field can not exceed 5 characters in length.','The SIP Port field can not exceed 5 characters in length.'),(1690,'Value is Required.','Value is Required.'),(1691,'Update Setting','Update Setting'),(1692,'Edit Freeswitch Server','Edit Freeswitch Server'),(1693,'CUT','CUT'),(1694,'Edit Localization','Edit Localization'),(1695,'Callbarring Settings Added Successfully!','Callbarring Settings Added Successfully!'),(1696,'Edit Call Barring','Edit Call Barring'),(1697,'Callbarring Settings Updated Successfully!','Callbarring Settings Updated Successfully!'),(1698,'Database import allows only gzfile types of file.','Database import allows only gzfile types of file.'),(1699,'File must be in (.gz) format :','File must be in (.gz) format :'),(1700,'The Coupon Number field must contain only numbers.','The Coupon Number field must contain only numbers.'),(1701,'The Coupon Number field have inactive refill coupon.','The Coupon Number field have inactive refill coupon.'),(1702,'Please enter proper email','Please enter proper email'),(1703,'This field is require','This field is require'),(1704,'Please Enter Valid Account Number','Please Enter Valid Account Number'),(1705,'Main','Main'),(1706,'--Select Disposition--','--Select Disposition--'),(1707,'Active User','Active User'),(1708,'Used Minutes','Used Minutes'),(1709,'Available Minutes','Available Minutes'),(1710,'Total Price','Total Price'),(1711,'Total User','Total User'),(1712,'Restore','Restore'),(1713,'View Details','View Details'),(1714,'Other','Other'),(1715,'Edit Tax','Edit Tax'),(1716,'Download Database','Download Database'),(1717,'Import Database','Import Database'),(1718,'File must be in (.gz) format','File must be in (.gz) format'),(1719,'Please enter name and select file.','Please enter name and select file.'),(1720,'Edit Cron Settings','Edit Cron Settings'),(1721,'Global Settings updated sucessfully!','Global Settings updated sucessfully!'),(1722,'Alert Notifications','Alert Notifications'),(1723,'Fraud Configuration','Fraud Configuration'),(1724,'Configuration add','Configuration add'),(1725,'Alarm Configuration','Alarm Configuration'),(1726,'Please select atleast one pattern.','Please select atleast one pattern.'),(1727,'Problem In Add Patterns to account.','Problem In Add Patterns to account.'),(1728,'Please Enter Switch command','Please Enter Switch command'),(1729,'are you sure to delete?','are you sure to delete?'),(1730,'Are you sure want to confirm this invoice ? once you confirm it','Are you sure want to confirm this invoice ? once you confirm it'),(1731,'can not able to edit invoice again.','can not able to edit invoice again.'),(1732,'Maximum Logo upload size is 1MB','Maximum Logo upload size is 1MB'),(1733,'Please enter number','Please enter number'),(1734,'Import Customer','Import Customer'),(1735,'Processing','Processing'),(1736,'please wait','please wait'),(1737,'Asia/Dubai','Asia/Dubai'),(1738,'Europe/Andorra','Europe/Andorra'),(1739,'Asia/Kabul','Asia/Kabul'),(1740,'America/Antigua','America/Antigua'),(1741,'America/Anguilla','America/Anguilla'),(1742,'Europe/Tirane','Europe/Tirane'),(1743,'Asia/Yerevan','Asia/Yerevan'),(1744,'Africa/Luanda','Africa/Luanda'),(1745,'Antarctica/Casey','Antarctica/Casey'),(1746,'Antarctica/Davis','Antarctica/Davis'),(1747,'Antarctica/DumontDUrville','Antarctica/DumontDUrville'),(1748,'Antarctica/Mawson','Antarctica/Mawson'),(1749,'Antarctica/McMurdo','Antarctica/McMurdo'),(1750,'Antarctica/Palmer','Antarctica/Palmer'),(1751,'Antarctica/Rothera','Antarctica/Rothera'),(1752,'Antarctica/Syowa','Antarctica/Syowa'),(1753,'Antarctica/Troll','Antarctica/Troll'),(1754,'Antarctica/Vostok','Antarctica/Vostok'),(1755,'America/Argentina/Buenos_Aires','America/Argentina/Buenos_Aires'),(1756,'America/Argentina/Catamarca','America/Argentina/Catamarca'),(1757,'America/Argentina/Cordoba','America/Argentina/Cordoba'),(1758,'America/Argentina/Jujuy','America/Argentina/Jujuy'),(1759,'America/Argentina/La_Rioja','America/Argentina/La_Rioja'),(1760,'America/Argentina/Mendoza','America/Argentina/Mendoza'),(1761,'America/Argentina/Rio_Gallegos','America/Argentina/Rio_Gallegos'),(1762,'America/Argentina/Salta','America/Argentina/Salta'),(1763,'America/Argentina/San_Juan','America/Argentina/San_Juan'),(1764,'America/Argentina/San_Luis','America/Argentina/San_Luis'),(1765,'America/Argentina/Tucuman','America/Argentina/Tucuman'),(1766,'America/Argentina/Ushuaia','America/Argentina/Ushuaia'),(1767,'Pacific/Pago_Pago','Pacific/Pago_Pago'),(1768,'Europe/Vienna','Europe/Vienna'),(1769,'Antarctica/Macquarie','Antarctica/Macquarie'),(1770,'Australia/Adelaide','Australia/Adelaide'),(1771,'Australia/Brisbane','Australia/Brisbane'),(1772,'Australia/Broken_Hill','Australia/Broken_Hill'),(1773,'Australia/Currie','Australia/Currie'),(1774,'Australia/Darwin','Australia/Darwin'),(1775,'Australia/Eucla','Australia/Eucla'),(1776,'Australia/Hobart','Australia/Hobart'),(1777,'Australia/Lindeman','Australia/Lindeman'),(1778,'Australia/Lord_Howe','Australia/Lord_Howe'),(1779,'Australia/Melbourne','Australia/Melbourne'),(1780,'Australia/Perth','Australia/Perth'),(1781,'Australia/Sydney','Australia/Sydney'),(1782,'America/Aruba','America/Aruba'),(1783,'Europe/Mariehamn','Europe/Mariehamn'),(1784,'Asia/Baku','Asia/Baku'),(1785,'Europe/Sarajevo','Europe/Sarajevo'),(1786,'America/Barbados','America/Barbados'),(1787,'Asia/Dhaka','Asia/Dhaka'),(1788,'Europe/Brussels','Europe/Brussels'),(1789,'Africa/Ouagadougou','Africa/Ouagadougou'),(1790,'Europe/Sofia','Europe/Sofia'),(1791,'Asia/Bahrain','Asia/Bahrain'),(1792,'Africa/Bujumbura','Africa/Bujumbura'),(1793,'Africa/Porto-Novo','Africa/Porto-Novo'),(1794,'America/St_Barthelemy','America/St_Barthelemy'),(1795,'Atlantic/Bermuda','Atlantic/Bermuda'),(1796,'Asia/Brunei','Asia/Brunei'),(1797,'America/La_Paz','America/La_Paz'),(1798,'America/Kralendijk','America/Kralendijk'),(1799,'America/Araguaina','America/Araguaina'),(1800,'America/Bahia','America/Bahia'),(1801,'America/Belem','America/Belem'),(1802,'America/Boa_Vista','America/Boa_Vista'),(1803,'America/Campo_Grande','America/Campo_Grande'),(1804,'America/Cuiaba','America/Cuiaba'),(1805,'America/Eirunepe','America/Eirunepe'),(1806,'America/Fortaleza','America/Fortaleza'),(1807,'America/Maceio','America/Maceio'),(1808,'America/Manaus','America/Manaus'),(1809,'America/Noronha','America/Noronha'),(1810,'America/Porto_Velho','America/Porto_Velho'),(1811,'America/Recife','America/Recife'),(1812,'America/Rio_Branco','America/Rio_Branco'),(1813,'America/Santarem','America/Santarem'),(1814,'America/Sao_Paulo','America/Sao_Paulo'),(1815,'America/Nassau','America/Nassau'),(1816,'Asia/Thimphu','Asia/Thimphu'),(1817,'Africa/Gaborone','Africa/Gaborone'),(1818,'Europe/Minsk','Europe/Minsk'),(1819,'America/Belize','America/Belize'),(1820,'America/Atikokan','America/Atikokan'),(1821,'America/Blanc-Sablon','America/Blanc-Sablon'),(1822,'America/Cambridge_Bay','America/Cambridge_Bay'),(1823,'America/Creston','America/Creston'),(1824,'America/Dawson','America/Dawson'),(1825,'America/Dawson_Creek','America/Dawson_Creek'),(1826,'America/Edmonton','America/Edmonton'),(1827,'America/Fort_Nelson','America/Fort_Nelson'),(1828,'America/Glace_Bay','America/Glace_Bay'),(1829,'America/Goose_Bay','America/Goose_Bay'),(1830,'America/Halifax','America/Halifax'),(1831,'America/Inuvik','America/Inuvik'),(1832,'America/Iqaluit','America/Iqaluit'),(1833,'America/Moncton','America/Moncton'),(1834,'America/Nipigon','America/Nipigon'),(1835,'America/Pangnirtung','America/Pangnirtung'),(1836,'America/Rainy_River','America/Rainy_River'),(1837,'America/Rankin_Inlet','America/Rankin_Inlet'),(1838,'America/Regina','America/Regina'),(1839,'America/Resolute','America/Resolute'),(1840,'America/St_Johns','America/St_Johns'),(1841,'America/Swift_Current','America/Swift_Current'),(1842,'America/Thunder_Bay','America/Thunder_Bay'),(1843,'America/Toronto','America/Toronto'),(1844,'America/Vancouver','America/Vancouver'),(1845,'America/Whitehorse','America/Whitehorse'),(1846,'America/Winnipeg','America/Winnipeg'),(1847,'America/Yellowknife','America/Yellowknife'),(1848,'Indian/Cocos','Indian/Cocos'),(1849,'Africa/Kinshasa','Africa/Kinshasa'),(1850,'Africa/Lubumbashi','Africa/Lubumbashi'),(1851,'Africa/Bangui','Africa/Bangui'),(1852,'Africa/Brazzaville','Africa/Brazzaville'),(1853,'Europe/Zurich','Europe/Zurich'),(1854,'Africa/Abidjan','Africa/Abidjan'),(1855,'Pacific/Rarotonga','Pacific/Rarotonga'),(1856,'America/Punta_Arenas','America/Punta_Arenas'),(1857,'America/Santiago','America/Santiago'),(1858,'Pacific/Easter','Pacific/Easter'),(1859,'Africa/Douala','Africa/Douala'),(1860,'Asia/Shanghai','Asia/Shanghai'),(1861,'Asia/Urumqi','Asia/Urumqi'),(1862,'America/Bogota','America/Bogota'),(1863,'America/Costa_Rica','America/Costa_Rica'),(1864,'America/Havana','America/Havana'),(1865,'Atlantic/Cape_Verde','Atlantic/Cape_Verde'),(1866,'America/Curacao','America/Curacao'),(1867,'Indian/Christmas','Indian/Christmas'),(1868,'Asia/Famagusta','Asia/Famagusta'),(1869,'Asia/Nicosia','Asia/Nicosia'),(1870,'Europe/Prague','Europe/Prague'),(1871,'Europe/Berlin','Europe/Berlin'),(1872,'Europe/Busingen','Europe/Busingen'),(1873,'Africa/Djibouti','Africa/Djibouti'),(1874,'Europe/Copenhagen','Europe/Copenhagen'),(1875,'America/Dominica','America/Dominica'),(1876,'America/Santo_Domingo','America/Santo_Domingo'),(1877,'Africa/Algiers','Africa/Algiers'),(1878,'America/Guayaquil','America/Guayaquil'),(1879,'Pacific/Galapagos','Pacific/Galapagos'),(1880,'Europe/Tallinn','Europe/Tallinn'),(1881,'Africa/Cairo','Africa/Cairo'),(1882,'Africa/El_Aaiun','Africa/El_Aaiun'),(1883,'Africa/Asmara','Africa/Asmara'),(1884,'Africa/Ceuta','Africa/Ceuta'),(1885,'Atlantic/Canary','Atlantic/Canary'),(1886,'Europe/Madrid','Europe/Madrid'),(1887,'Africa/Addis_Ababa','Africa/Addis_Ababa'),(1888,'Europe/Helsinki','Europe/Helsinki'),(1889,'Pacific/Fiji','Pacific/Fiji'),(1890,'Atlantic/Stanley','Atlantic/Stanley'),(1891,'Pacific/Chuuk','Pacific/Chuuk'),(1892,'Pacific/Kosrae','Pacific/Kosrae'),(1893,'Pacific/Pohnpei','Pacific/Pohnpei'),(1894,'Atlantic/Faroe','Atlantic/Faroe'),(1895,'Europe/Paris','Europe/Paris'),(1896,'Africa/Libreville','Africa/Libreville'),(1897,'Europe/London','Europe/London'),(1898,'America/Grenada','America/Grenada'),(1899,'Asia/Tbilisi','Asia/Tbilisi'),(1900,'America/Cayenne','America/Cayenne'),(1901,'Europe/Guernsey','Europe/Guernsey'),(1902,'Africa/Accra','Africa/Accra'),(1903,'Europe/Gibraltar','Europe/Gibraltar'),(1904,'America/Danmarkshavn','America/Danmarkshavn'),(1905,'America/Nuuk','America/Nuuk'),(1906,'America/Scoresbysund','America/Scoresbysund'),(1907,'America/Thule','America/Thule'),(1908,'Africa/Banjul','Africa/Banjul'),(1909,'Africa/Conakry','Africa/Conakry'),(1910,'America/Guadeloupe','America/Guadeloupe'),(1911,'Africa/Malabo','Africa/Malabo'),(1912,'Europe/Athens','Europe/Athens'),(1913,'Atlantic/South_Georgia','Atlantic/South_Georgia'),(1914,'America/Guatemala','America/Guatemala'),(1915,'Pacific/Guam','Pacific/Guam'),(1916,'Africa/Bissau','Africa/Bissau'),(1917,'America/Guyana','America/Guyana'),(1918,'Asia/Hong_Kong','Asia/Hong_Kong'),(1919,'America/Tegucigalpa','America/Tegucigalpa'),(1920,'Europe/Zagreb','Europe/Zagreb'),(1921,'America/Port-au-Prince','America/Port-au-Prince'),(1922,'Europe/Budapest','Europe/Budapest'),(1923,'Asia/Jakarta','Asia/Jakarta'),(1924,'Asia/Jayapura','Asia/Jayapura'),(1925,'Asia/Makassar','Asia/Makassar'),(1926,'Asia/Pontianak','Asia/Pontianak'),(1927,'Europe/Dublin','Europe/Dublin'),(1928,'Asia/Jerusalem','Asia/Jerusalem'),(1929,'Europe/Isle_of_Man','Europe/Isle_of_Man'),(1930,'Asia/Kolkata','Asia/Kolkata'),(1931,'Indian/Chagos','Indian/Chagos'),(1932,'Asia/Baghdad','Asia/Baghdad'),(1933,'Asia/Tehran','Asia/Tehran'),(1934,'Atlantic/Reykjavik','Atlantic/Reykjavik'),(1935,'Europe/Rome','Europe/Rome'),(1936,'Europe/Jersey','Europe/Jersey'),(1937,'America/Jamaica','America/Jamaica'),(1938,'Asia/Amman','Asia/Amman'),(1939,'Asia/Tokyo','Asia/Tokyo'),(1940,'Africa/Nairobi','Africa/Nairobi'),(1941,'Asia/Bishkek','Asia/Bishkek'),(1942,'Asia/Phnom_Penh','Asia/Phnom_Penh'),(1943,'Pacific/Enderbury','Pacific/Enderbury'),(1944,'Pacific/Kiritimati','Pacific/Kiritimati'),(1945,'Pacific/Tarawa','Pacific/Tarawa'),(1946,'Indian/Comoro','Indian/Comoro'),(1947,'America/St_Kitts','America/St_Kitts'),(1948,'Asia/Pyongyang','Asia/Pyongyang'),(1949,'Asia/Seoul','Asia/Seoul'),(1950,'Asia/Kuwait','Asia/Kuwait'),(1951,'America/Cayman','America/Cayman'),(1952,'Asia/Almaty','Asia/Almaty'),(1953,'Asia/Aqtau','Asia/Aqtau'),(1954,'Asia/Aqtobe','Asia/Aqtobe'),(1955,'Asia/Atyrau','Asia/Atyrau'),(1956,'Asia/Oral','Asia/Oral'),(1957,'Asia/Qostanay','Asia/Qostanay'),(1958,'Asia/Qyzylorda','Asia/Qyzylorda'),(1959,'Asia/Vientiane','Asia/Vientiane'),(1960,'Asia/Beirut','Asia/Beirut'),(1961,'America/St_Lucia','America/St_Lucia'),(1962,'Europe/Vaduz','Europe/Vaduz'),(1963,'Asia/Colombo','Asia/Colombo'),(1964,'Africa/Monrovia','Africa/Monrovia'),(1965,'Africa/Maseru','Africa/Maseru'),(1966,'Europe/Vilnius','Europe/Vilnius'),(1967,'Europe/Luxembourg','Europe/Luxembourg'),(1968,'Europe/Riga','Europe/Riga'),(1969,'Africa/Tripoli','Africa/Tripoli'),(1970,'Africa/Casablanca','Africa/Casablanca'),(1971,'Europe/Monaco','Europe/Monaco'),(1972,'Europe/Chisinau','Europe/Chisinau'),(1973,'Europe/Podgorica','Europe/Podgorica'),(1974,'America/Marigot','America/Marigot'),(1975,'Indian/Antananarivo','Indian/Antananarivo'),(1976,'Pacific/Kwajalein','Pacific/Kwajalein'),(1977,'Pacific/Majuro','Pacific/Majuro'),(1978,'Europe/Skopje','Europe/Skopje'),(1979,'Africa/Bamako','Africa/Bamako'),(1980,'Asia/Yangon','Asia/Yangon'),(1981,'Asia/Choibalsan','Asia/Choibalsan'),(1982,'Asia/Hovd','Asia/Hovd'),(1983,'Asia/Ulaanbaatar','Asia/Ulaanbaatar'),(1984,'Asia/Macau','Asia/Macau'),(1985,'Pacific/Saipan','Pacific/Saipan'),(1986,'America/Martinique','America/Martinique'),(1987,'Africa/Nouakchott','Africa/Nouakchott'),(1988,'America/Montserrat','America/Montserrat'),(1989,'Europe/Malta','Europe/Malta'),(1990,'Indian/Mauritius','Indian/Mauritius'),(1991,'Indian/Maldives','Indian/Maldives'),(1992,'Africa/Blantyre','Africa/Blantyre'),(1993,'America/Bahia_Banderas','America/Bahia_Banderas'),(1994,'America/Cancun','America/Cancun'),(1995,'America/Chihuahua','America/Chihuahua'),(1996,'America/Hermosillo','America/Hermosillo'),(1997,'America/Matamoros','America/Matamoros'),(1998,'America/Mazatlan','America/Mazatlan'),(1999,'America/Merida','America/Merida'),(2000,'America/Mexico_City','America/Mexico_City'),(2001,'America/Monterrey','America/Monterrey'),(2002,'America/Ojinaga','America/Ojinaga'),(2003,'America/Tijuana','America/Tijuana'),(2004,'Asia/Kuala_Lumpur','Asia/Kuala_Lumpur'),(2005,'Asia/Kuching','Asia/Kuching'),(2006,'Africa/Maputo','Africa/Maputo'),(2007,'Africa/Windhoek','Africa/Windhoek'),(2008,'Pacific/Noumea','Pacific/Noumea'),(2009,'Africa/Niamey','Africa/Niamey'),(2010,'Pacific/Norfolk','Pacific/Norfolk'),(2011,'Africa/Lagos','Africa/Lagos'),(2012,'America/Managua','America/Managua'),(2013,'Europe/Amsterdam','Europe/Amsterdam'),(2014,'Europe/Oslo','Europe/Oslo'),(2015,'Asia/Kathmandu','Asia/Kathmandu'),(2016,'Pacific/Nauru','Pacific/Nauru'),(2017,'Pacific/Niue','Pacific/Niue'),(2018,'Pacific/Auckland','Pacific/Auckland'),(2019,'Pacific/Chatham','Pacific/Chatham'),(2020,'Asia/Muscat','Asia/Muscat'),(2021,'America/Panama','America/Panama'),(2022,'America/Lima','America/Lima'),(2023,'Pacific/Gambier','Pacific/Gambier'),(2024,'Pacific/Marquesas','Pacific/Marquesas'),(2025,'Pacific/Tahiti','Pacific/Tahiti'),(2026,'Pacific/Bougainville','Pacific/Bougainville'),(2027,'Pacific/Port_Moresby','Pacific/Port_Moresby'),(2028,'Asia/Manila','Asia/Manila'),(2029,'Asia/Karachi','Asia/Karachi'),(2030,'Europe/Warsaw','Europe/Warsaw'),(2031,'America/Miquelon','America/Miquelon'),(2032,'Pacific/Pitcairn','Pacific/Pitcairn'),(2033,'America/Puerto_Rico','America/Puerto_Rico'),(2034,'Asia/Gaza','Asia/Gaza'),(2035,'Asia/Hebron','Asia/Hebron'),(2036,'Atlantic/Azores','Atlantic/Azores'),(2037,'Atlantic/Madeira','Atlantic/Madeira'),(2038,'Europe/Lisbon','Europe/Lisbon'),(2039,'Pacific/Palau','Pacific/Palau'),(2040,'America/Asuncion','America/Asuncion'),(2041,'Asia/Qatar','Asia/Qatar'),(2042,'Indian/Reunion','Indian/Reunion'),(2043,'Europe/Bucharest','Europe/Bucharest'),(2044,'Europe/Belgrade','Europe/Belgrade'),(2045,'Asia/Anadyr','Asia/Anadyr'),(2046,'Asia/Barnaul','Asia/Barnaul'),(2047,'Asia/Chita','Asia/Chita'),(2048,'Asia/Irkutsk','Asia/Irkutsk'),(2049,'Asia/Kamchatka','Asia/Kamchatka'),(2050,'Asia/Khandyga','Asia/Khandyga'),(2051,'Asia/Krasnoyarsk','Asia/Krasnoyarsk'),(2052,'Asia/Magadan','Asia/Magadan'),(2053,'Asia/Novokuznetsk','Asia/Novokuznetsk'),(2054,'Asia/Novosibirsk','Asia/Novosibirsk'),(2055,'Asia/Omsk','Asia/Omsk'),(2056,'Asia/Sakhalin','Asia/Sakhalin'),(2057,'Asia/Srednekolymsk','Asia/Srednekolymsk'),(2058,'Asia/Tomsk','Asia/Tomsk'),(2059,'Asia/Ust-Nera','Asia/Ust-Nera'),(2060,'Asia/Vladivostok','Asia/Vladivostok'),(2061,'Asia/Yakutsk','Asia/Yakutsk'),(2062,'Asia/Yekaterinburg','Asia/Yekaterinburg'),(2063,'Europe/Astrakhan','Europe/Astrakhan'),(2064,'Europe/Kaliningrad','Europe/Kaliningrad'),(2065,'Europe/Kirov','Europe/Kirov'),(2066,'Europe/Moscow','Europe/Moscow'),(2067,'Europe/Samara','Europe/Samara'),(2068,'Europe/Saratov','Europe/Saratov'),(2069,'Europe/Ulyanovsk','Europe/Ulyanovsk'),(2070,'Europe/Volgograd','Europe/Volgograd'),(2071,'Africa/Kigali','Africa/Kigali'),(2072,'Asia/Riyadh','Asia/Riyadh'),(2073,'Pacific/Guadalcanal','Pacific/Guadalcanal'),(2074,'Indian/Mahe','Indian/Mahe'),(2075,'Africa/Khartoum','Africa/Khartoum'),(2076,'Europe/Stockholm','Europe/Stockholm'),(2077,'Asia/Singapore','Asia/Singapore'),(2078,'Atlantic/St_Helena','Atlantic/St_Helena'),(2079,'Europe/Ljubljana','Europe/Ljubljana'),(2080,'Arctic/Longyearbyen','Arctic/Longyearbyen'),(2081,'Europe/Bratislava','Europe/Bratislava'),(2082,'Africa/Freetown','Africa/Freetown'),(2083,'Europe/San_Marino','Europe/San_Marino'),(2084,'Africa/Dakar','Africa/Dakar'),(2085,'Africa/Mogadishu','Africa/Mogadishu'),(2086,'America/Paramaribo','America/Paramaribo'),(2087,'Africa/Juba','Africa/Juba'),(2088,'Africa/Sao_Tome','Africa/Sao_Tome'),(2089,'America/El_Salvador','America/El_Salvador'),(2090,'America/Lower_Princes','America/Lower_Princes'),(2091,'Asia/Damascus','Asia/Damascus'),(2092,'Africa/Mbabane','Africa/Mbabane'),(2093,'America/Grand_Turk','America/Grand_Turk'),(2094,'Africa/Ndjamena','Africa/Ndjamena'),(2095,'Indian/Kerguelen','Indian/Kerguelen'),(2096,'Africa/Lome','Africa/Lome'),(2097,'Asia/Bangkok','Asia/Bangkok'),(2098,'Asia/Dushanbe','Asia/Dushanbe'),(2099,'Pacific/Fakaofo','Pacific/Fakaofo'),(2100,'Asia/Dili','Asia/Dili'),(2101,'Asia/Ashgabat','Asia/Ashgabat'),(2102,'Africa/Tunis','Africa/Tunis'),(2103,'Pacific/Tongatapu','Pacific/Tongatapu'),(2104,'Europe/Istanbul','Europe/Istanbul'),(2105,'America/Port_of_Spain','America/Port_of_Spain'),(2106,'Pacific/Funafuti','Pacific/Funafuti'),(2107,'Asia/Taipei','Asia/Taipei'),(2108,'Africa/Dar_es_Salaam','Africa/Dar_es_Salaam'),(2109,'Europe/Kiev','Europe/Kiev'),(2110,'Europe/Simferopol','Europe/Simferopol'),(2111,'Europe/Uzhgorod','Europe/Uzhgorod'),(2112,'Europe/Zaporozhye','Europe/Zaporozhye'),(2113,'Africa/Kampala','Africa/Kampala'),(2114,'Pacific/Midway','Pacific/Midway'),(2115,'Pacific/Wake','Pacific/Wake'),(2116,'America/Adak','America/Adak'),(2117,'America/Anchorage','America/Anchorage'),(2118,'America/Boise','America/Boise'),(2119,'America/Chicago','America/Chicago'),(2120,'America/Denver','America/Denver'),(2121,'America/Detroit','America/Detroit'),(2122,'America/Indiana/Indianapolis','America/Indiana/Indianapolis'),(2123,'America/Indiana/Knox','America/Indiana/Knox'),(2124,'America/Indiana/Marengo','America/Indiana/Marengo'),(2125,'America/Indiana/Petersburg','America/Indiana/Petersburg'),(2126,'America/Indiana/Tell_City','America/Indiana/Tell_City'),(2127,'America/Indiana/Vevay','America/Indiana/Vevay'),(2128,'America/Indiana/Vincennes','America/Indiana/Vincennes'),(2129,'America/Indiana/Winamac','America/Indiana/Winamac'),(2130,'America/Juneau','America/Juneau'),(2131,'America/Kentucky/Louisville','America/Kentucky/Louisville'),(2132,'America/Kentucky/Monticello','America/Kentucky/Monticello'),(2133,'America/Los_Angeles','America/Los_Angeles'),(2134,'America/Menominee','America/Menominee'),(2135,'America/Metlakatla','America/Metlakatla'),(2136,'America/New_York','America/New_York'),(2137,'America/Nome','America/Nome'),(2138,'America/North_Dakota/Beulah','America/North_Dakota/Beulah'),(2139,'America/North_Dakota/Center','America/North_Dakota/Center'),(2140,'America/North_Dakota/New_Salem','America/North_Dakota/New_Salem'),(2141,'America/Phoenix','America/Phoenix'),(2142,'America/Sitka','America/Sitka'),(2143,'America/Yakutat','America/Yakutat'),(2144,'Pacific/Honolulu','Pacific/Honolulu'),(2145,'America/Montevideo','America/Montevideo'),(2146,'Asia/Samarkand','Asia/Samarkand'),(2147,'Asia/Tashkent','Asia/Tashkent'),(2148,'Europe/Vatican','Europe/Vatican'),(2149,'America/St_Vincent','America/St_Vincent'),(2150,'America/Caracas','America/Caracas'),(2151,'America/Tortola','America/Tortola'),(2152,'America/St_Thomas','America/St_Thomas'),(2153,'Asia/Ho_Chi_Minh','Asia/Ho_Chi_Minh'),(2154,'Pacific/Efate','Pacific/Efate'),(2155,'Pacific/Wallis','Pacific/Wallis'),(2156,'Pacific/Apia','Pacific/Apia'),(2157,'Asia/Aden','Asia/Aden'),(2158,'Indian/Mayotte','Indian/Mayotte'),(2159,'Africa/Johannesburg','Africa/Johannesburg'),(2160,'Africa/Lusaka','Africa/Lusaka'),(2161,'Africa/Harare','Africa/Harare'),(2162,'Low Balance','Low Balance'),(2163,'Trunk Statistics','Trunk Statistics'),(2164,'Current Balance','Current Balance'),(2165,'Emails','Emails'),(2166,'Add IP Settings','Add IP Settings'),(2167,'Edit IP Settings','Edit IP Settings'),(2168,'Edit Caller ID','Edit Caller ID'),(2169,'Invoice Date Interval','Invoice Date Interval'),(2170,'Use same credential for Invoice Config','Use same credential for Invoice Config'),(2171,'Registration URL','Registration URL'),(2172,'Account Status','Account Status'),(2173,'Admin','Admin'),(2174,'Sub Admin','Sub Admin'),(2175,'Edit Accessnumber','Edit Accessnumber'),(2176,'Edit Rate Group','Edit Rate Group'),(2177,'Percentage (Enterprise)','Percentage (Enterprise)'),(2178,'Edit Ratedeck','Edit Ratedeck'),(2179,'Realm','Realm'),(2180,'Reg-Transport','Reg-Transport'),(2181,'Failover','Failover'),(2182,'GW Name #1','GW Name #1'),(2183,'GW Name #2','GW Name #2'),(2184,'Gateway','Gateway'),(2185,'Count','Count'),(2186,'Both','Both'),(2187,'Stop','Stop'),(2188,'Reload','Reload'),(2189,'Rescan','Rescan'),(2190,'Org.','Org.'),(2191,'Read','Read'),(2192,'Write','Write'),(2193,'STANDARD','STANDARD'),(2194,'CALLINGCARD','CALLINGCARD'),(2195,'FREE','FREE'),(2196,'LOCAL','LOCAL'),(2197,'ACCOUNT_INACTIVE_DELETED','ACCOUNT_INACTIVE_DELETED'),(2198,'ACCOUNT_EXPIRE','ACCOUNT_EXPIRE'),(2199,'ALLOTTED_TIMEOUT','ALLOTTED_TIMEOUT'),(2200,'AUTHENTICATION_FAIL','AUTHENTICATION_FAIL'),(2201,'BEARERCAPABILITY_NOTAUTH','BEARERCAPABILITY_NOTAUTH'),(2202,'BEARERCAPABILITY_NOTAVAIL','BEARERCAPABILITY_NOTAVAIL'),(2203,'BEARERCAPABILITY_NOTIMPL','BEARERCAPABILITY_NOTIMPL'),(2204,'CALL_REJECTED','CALL_REJECTED'),(2205,'CHAN_NOT_IMPLEMENTED','CHAN_NOT_IMPLEMENTED'),(2206,'CHANNEL_UNACCEPTABLE','CHANNEL_UNACCEPTABLE'),(2207,'DESTINATION_OUT_OF_ORDER','DESTINATION_OUT_OF_ORDER'),(2208,'DESTINATION_BLOCKED','DESTINATION_BLOCKED'),(2209,'DID_DESTINATION_NOT_FOUND','DID_DESTINATION_NOT_FOUND'),(2210,'FACILITY_REJECTED','FACILITY_REJECTED'),(2211,'FACILITY_NOT_SUBSCRIBED','FACILITY_NOT_SUBSCRIBED'),(2212,'FACILITY_NOT_IMPLEMENTED','FACILITY_NOT_IMPLEMENTED'),(2213,'FRAUD_CALL_PER_ACCOUNT','FRAUD_CALL_PER_ACCOUNT'),(2214,'FRAUD_CALL_PER_DESTINATION','FRAUD_CALL_PER_DESTINATION'),(2215,'FRAUD_COST_PER_ACCOUNT','FRAUD_COST_PER_ACCOUNT'),(2216,'FRAUD_COST_PER_DESTINATION','FRAUD_COST_PER_DESTINATION'),(2217,'INVALID_NUMBER_FORMAT','INVALID_NUMBER_FORMAT'),(2218,'INCOMPATIBLE_DESTINATION','INCOMPATIBLE_DESTINATION'),(2219,'MANAGER_REQUEST','MANAGER_REQUEST'),(2220,'MEDIA_TIMEOUT','MEDIA_TIMEOUT'),(2221,'NO_ROUTE_DESTINATION','NO_ROUTE_DESTINATION'),(2222,'NORMAL_CLEARING','NORMAL_CLEARING'),(2223,'NETWORK_OUT_OF_ORDER','NETWORK_OUT_OF_ORDER'),(2224,'NORMAL_UNSPECIFIED','NORMAL_UNSPECIFIED'),(2225,'NORMAL_CIRCUIT_CONGESTION','NORMAL_CIRCUIT_CONGESTION'),(2226,'NORMAL_TEMPORARY_FAILURE','NORMAL_TEMPORARY_FAILURE'),(2227,'NO_SUFFICIENT_FUND','NO_SUFFICIENT_FUND'),(2228,'NO_USER_RESPONSE','NO_USER_RESPONSE'),(2229,'NO_ANSWER','NO_ANSWER'),(2230,'NUMBER_CHANGED','NUMBER_CHANGED'),(2231,'ORIGINATOR_CANCEL','ORIGINATOR_CANCEL'),(2232,'ORIGNATION_RATE_NOT_FOUND','ORIGNATION_RATE_NOT_FOUND'),(2233,'OUTGOING_CALL_BARRED','OUTGOING_CALL_BARRED'),(2234,'PROGRESS_TIMEOUT','PROGRESS_TIMEOUT'),(2235,'RECOVERY_ON_TIMER_EXPIRE','RECOVERY_ON_TIMER_EXPIRE'),(2236,'RESELLER_COST_CHEAP','RESELLER_COST_CHEAP'),(2237,'SERVICE_NOT_IMPLEMENTED','SERVICE_NOT_IMPLEMENTED'),(2238,'SERVICE_UNAVAILABLE','SERVICE_UNAVAILABLE'),(2239,'SUCCESS','SUCCESS'),(2240,'SWITCH_CONGESTION','SWITCH_CONGESTION'),(2241,'TERMINATION_RATE_NOT_FOUND','TERMINATION_RATE_NOT_FOUND'),(2242,'UNSPECIFIED','UNSPECIFIED'),(2243,'UNALLOCATED_NUMBER','UNALLOCATED_NUMBER'),(2244,'USER_BUSY','USER_BUSY'),(2245,'USER_NOT_REGISTERED','USER_NOT_REGISTERED'),(2246,'REQUESTED_CHAN_UNAVAIL','REQUESTED_CHAN_UNAVAIL'),(2247,'Resend Email','Resend Email'),(2248,'Resent Email','Resent Email'),(2249,'Sent','Sent'),(2250,'Account Number Editable','Account Number Editable'),(2251,'Play Audio Notifications','Play Audio Notifications'),(2252,'Invoices Older Than Days','Invoices Older Than Days'),(2253,'Half Year','Half Year'),(2254,'Last Pay Date','Last Pay Date'),(2255,'Buy DIDs','Buy DIDs'),(2256,'Purchased DID','Purchased DID'),(2257,'DID Information','DID Information'),(2258,'Sell Cost','Sell Cost'),(2259,'Admin Rate Group','Admin Rate Group'),(2260,'Search My Rates','Search My Rates'),(2261,'Optin','Optin'),(2262,'Bal','Bal'),(2263,'Managed & Maintained by','Managed & Maintained by'),(2264,'Flux Telecom','Flux Telecom'),(2265,'All Rights Reserved.','All Rights Reserved.'),(2266,'module_name','module_name'),(2267,'English','English'),(2268,'Chinese','Chinese'),(2269,'French','French'),(2270,'German','German'),(2271,'Greek','Greek'),(2272,'Italian','Italian'),(2273,'Spanish','Spanish'),(2274,'Russian','Russian'),(2275,'Japanese','Japanese'),(2276,'Portuguese','Portuguese'),(2277,'Romanian','Romanian'),(2278,'Create Translation Languages','Create Translation Languages'),(2279,'Module Name','Module Name'),(2280,'Edit Translation Language','Edit Translation Language'),(2281,'Distributor','Distributor'),(2282,'Commission Based','Commission Based'),(2283,'Reseller Type','Reseller Type'),(2284,'Callerid','Callerid'),(2285,'Opensips Dispatcher','Opensips Dispatcher'),(2286,'Generate','Generate'),(2287,'Forward','Forward'),(2288,'Add White List','Add White List'),(2289,'Report','Report'),(2290,'Profiles','Profiles'),(2291,'Create Duplicate Rate Group','Create Duplicate Rate Group'),(2292,'Add Timezone','Add Timezone'),(2293,'Timezone List','Timezone List'),(2294,'GMT Offset','GMT Offset'),(2295,'Edit Timezone','Edit Timezone'),(2296,'Account Notification','Account Notification'),(2297,'Both (Email & SMS)','Both (Email & SMS)'),(2298,'Terms & Condition','Terms & Condition'),(2299,'Term And Condition','Term And Condition'),(2300,'Url','Url'),(2301,'Text','Text'),(2302,'Custom Rates','Custom Rates'),(2303,'(Price+SetUp Fee)','(Price+SetUp Fee)');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trunks`
--

DROP TABLE IF EXISTS `trunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trunks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tech` varchar(10) NOT NULL DEFAULT '',
  `gateway_id` int NOT NULL DEFAULT '0',
  `failover_gateway_id` int NOT NULL DEFAULT '0' COMMENT 'Fail over Gateway id',
  `failover_gateway_id1` int NOT NULL DEFAULT '0',
  `provider_id` int DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dialed_modify` mediumtext NOT NULL,
  `resellers_id` varchar(11) NOT NULL DEFAULT '0',
  `precedence` int NOT NULL DEFAULT '0',
  `maxchannels` int NOT NULL DEFAULT '0',
  `cps` int NOT NULL DEFAULT '0',
  `codec` varchar(100) NOT NULL,
  `leg_timeout` int NOT NULL DEFAULT '30',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cid_translation` varchar(100) NOT NULL,
  `localization_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider` (`provider_id`),
  KEY `resellers_id` (`resellers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trunks`
--

LOCK TABLES `trunks` WRITE;
/*!40000 ALTER TABLE `trunks` DISABLE KEYS */;
INSERT INTO `trunks` VALUES (1,'YourTrunk','',1,0,0,3,0,'','0',0,0,0,'PCMA,G729,PCMA',30,'0000-00-00 00:00:00','2016-07-26 15:16:00','',0);
/*!40000 ALTER TABLE `trunks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fluxuser`@`localhost`*/ /*!50003 TRIGGER `updateTerminationRates` AFTER UPDATE ON `trunks` FOR EACH ROW BEGIN
   if new.status = '2'
   then
        Delete from outbound_routes where trunk_id = new.id;
   end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userlevels`
--

DROP TABLE IF EXISTS `userlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlevels` (
  `userlevelid` int NOT NULL,
  `userlevelname` varchar(15) NOT NULL,
  `module_permissions` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userlevelid`),
  KEY `userlevelname` (`userlevelname`),
  KEY `module_permissions` (`module_permissions`(1024))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlevels`
--

LOCK TABLES `userlevels` WRITE;
/*!40000 ALTER TABLE `userlevels` DISABLE KEYS */;
INSERT INTO `userlevels` VALUES (-1,'Administrator','1,2,4,5,3,8,9,13,14,15,16,17,18,19,20,21,22,25,26,27,28,7,29,45,38,39,40,41,42,43,44,48,49,51,53,54,55,66,68,69,77,78,79,80,81,83,84,85,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,177,178,179,180,149,184,185,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,221,226,227,228,229,230,231,232,233,234,235,236,237,238,243,244,245,246,247,248,249,250,251,252,253,254,255,256,269,270,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,551,552,553,554,556,557,558,415,559,560,561'),(0,'Customer','31,32,37,36,34,35,33,63,64,67,70,71,73,74,72,82,181,182,396,397,398,399,401,414,419,421,423,425,427,429,431,433,486,487,489,508,510,511,513,514,516,550,552,612,614,616,618,619,621,622,624,625,636,637,639,640,642,643,645,646,648,649,651,652,654,655,657,658,660,661,668,670,550,555,548,548,555'),(1,'Reseller','1,2,7,8,13,16,17,18,19,21,25,28,38,40,44,45,46,52,9,29,53,54,66,55,68,79,81,93,94,95,96,97,100,101,102,103,104,107,108,109,110,111,114,115,116,117,118,123,124,126,127,131,132,133,134,135,140,141,143,144,148,149,150,151,152,157,158,160,161,165,166,168,169,91,149,92,183,277,281,285,289,293,297,302,355,357,359,361,363,365,369,371,372,374,378,392,89,403,406,410,413,415,418,420,422,424,426,428,430,432,418,420,422,424,426,428,430,432,435,437,439,441,443,445,447,463,471,476,478,480,483,486,487,488,493,502,508,509,511,512,514,515,517,524,548,549,551,570,574,584,586,588,594,598,602,606,611,613,615,617,619,620,622,623,625,635,637,638,640,641,643,644,646,647,649,650,652,653,655,656,658,659,661,668,669,679,556,558,559,561,564,568,570,577,579,581,585,589,593,600,604,608,612,616,620,624,628,632,636,640,644,648,652,656,660,664,665,666,667,26,672,673,675,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,66,559,556'),(2,'Admin','1,2,3,4,5,7,8,9,13,14,15,16,17,18,19,20,21,22,25,26,27,28,29,38,40,41,42,43,44,45,65,93,94,97,100,101,104,107,108,111,114,115,118,123,124,125,131,132,135,140,141,142,148,149,152,157,158,159,165,166,167,149,229,230,231,232,233,234,235,236,237,238,275,276,306,307,376,377,390,391,506,507,578,579,580,581,582,583,592,593,626,627,91,92,561,153,154,150,151,89,556,559'),(3,'Provider','31,32,37,36,34,35,33,63,64,67,70,71,73,74,75,356,358,360,362,364,366,370,373,375,398,33,399,401,82,411,419,421,423,425,427,429,431,433,436,438,440,442,444,446,448,464,477,479,481,484,486,487,489,508,510,511,513,514,516,585,587,589,668,670,680,182,396,550,676,548,555,555');
/*!40000 ALTER TABLE `userlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertracking`
--

DROP TABLE IF EXISTS `usertracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `request_uri` mediumtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `client_ip` varchar(50) NOT NULL,
  `client_user_agent` mediumtext NOT NULL,
  `referer_page` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertracking`
--

LOCK TABLES `usertracking` WRITE;
/*!40000 ALTER TABLE `usertracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_dids`
--

DROP TABLE IF EXISTS `view_dids`;
/*!50001 DROP VIEW IF EXISTS `view_dids`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_dids` AS SELECT 
 1 AS `id`,
 1 AS `number`,
 1 AS `reseller_product_id`,
 1 AS `account_id`,
 1 AS `reseller_id`,
 1 AS `buyer_accountid`,
 1 AS `country_id`,
 1 AS `cost`,
 1 AS `call_type`,
 1 AS `city`,
 1 AS `province`,
 1 AS `leg_timeout`,
 1 AS `maxchannels`,
 1 AS `extensions`,
 1 AS `buy_cost`,
 1 AS `setup_fee`,
 1 AS `price`,
 1 AS `billing_type`,
 1 AS `billing_days`,
 1 AS `product_id`,
 1 AS `modified_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_invoices`
--

DROP TABLE IF EXISTS `view_invoices`;
/*!50001 DROP VIEW IF EXISTS `view_invoices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_invoices` AS SELECT 
 1 AS `id`,
 1 AS `number`,
 1 AS `accountid`,
 1 AS `reseller_id`,
 1 AS `from_date`,
 1 AS `to_date`,
 1 AS `due_date`,
 1 AS `status`,
 1 AS `is_paid`,
 1 AS `generate_date`,
 1 AS `type`,
 1 AS `payment_id`,
 1 AS `generate_type`,
 1 AS `confirm`,
 1 AS `notes`,
 1 AS `is_deleted`,
 1 AS `debit`,
 1 AS `debit_exchange_rate`,
 1 AS `credit`,
 1 AS `credit_exchange_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `packages_view`
--

/*!50001 DROP VIEW IF EXISTS `packages_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `packages_view` AS select `O`.`order_id` AS `id`,`P`.`id` AS `product_id`,`P`.`name` AS `package_name`,`O`.`free_minutes` AS `free_minutes`,`P`.`applicable_for` AS `applicable_for`,`O`.`accountid` AS `accountid` from (`products` `P` join `order_items` `O`) where ((`P`.`id` = `O`.`product_id`) and (`P`.`product_category` = 1) and (`P`.`status` = 0) and ((`O`.`termination_date` >= utc_timestamp()) or (`O`.`termination_date` = '0000-00-00 00:00:00'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_dids`
--

/*!50001 DROP VIEW IF EXISTS `view_dids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_dids` AS select `dids`.`id` AS `id`,`dids`.`number` AS `number`,`reseller_products`.`id` AS `reseller_product_id`,`reseller_products`.`account_id` AS `account_id`,`reseller_products`.`reseller_id` AS `reseller_id`,if((`dids`.`parent_id` <> `reseller_products`.`account_id`),(select `subrpro`.`account_id` from `reseller_products` `subrpro` where (`subrpro`.`id` > `reseller_products`.`id`) order by `subrpro`.`id` limit 1),`dids`.`accountid`) AS `buyer_accountid`,`dids`.`country_id` AS `country_id`,`dids`.`cost` AS `cost`,`dids`.`call_type` AS `call_type`,`dids`.`city` AS `city`,`dids`.`province` AS `province`,`dids`.`leg_timeout` AS `leg_timeout`,`dids`.`maxchannels` AS `maxchannels`,`dids`.`extensions` AS `extensions`,`reseller_products`.`buy_cost` AS `buy_cost`,`reseller_products`.`setup_fee` AS `setup_fee`,`reseller_products`.`price` AS `price`,`reseller_products`.`billing_type` AS `billing_type`,`reseller_products`.`billing_days` AS `billing_days`,`reseller_products`.`product_id` AS `product_id`,`reseller_products`.`modified_date` AS `modified_date` from (`reseller_products` join `dids` on((`dids`.`product_id` = `reseller_products`.`product_id`))) where (`reseller_products`.`is_optin` = 0) order by `reseller_products`.`account_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_invoices`
--

/*!50001 DROP VIEW IF EXISTS `view_invoices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_invoices` AS select `invoices`.`id` AS `id`,concat(`invoices`.`prefix`,`invoices`.`number`) AS `number`,`invoices`.`accountid` AS `accountid`,`invoices`.`reseller_id` AS `reseller_id`,`invoices`.`from_date` AS `from_date`,`invoices`.`to_date` AS `to_date`,`invoices`.`due_date` AS `due_date`,`invoices`.`status` AS `status`,if(((select `accounts`.`posttoexternal` from `accounts` where (`accounts`.`id` = `invoices`.`accountid`)) = 0),0,if(((sum(`invoice_details`.`debit`) - sum(`invoice_details`.`credit`)) = 0),0,1)) AS `is_paid`,`invoices`.`generate_date` AS `generate_date`,`invoices`.`type` AS `type`,`invoices`.`payment_id` AS `payment_id`,`invoices`.`generate_type` AS `generate_type`,`invoices`.`confirm` AS `confirm`,`invoices`.`notes` AS `notes`,`invoices`.`is_deleted` AS `is_deleted`,sum(`invoice_details`.`debit`) AS `debit`,sum((`invoice_details`.`debit` * `invoice_details`.`exchange_rate`)) AS `debit_exchange_rate`,sum(`invoice_details`.`credit`) AS `credit`,sum((`invoice_details`.`credit` * `invoice_details`.`exchange_rate`)) AS `credit_exchange_rate` from (`invoices` join `invoice_details` on((`invoices`.`id` = `invoice_details`.`invoiceid`))) group by `invoice_details`.`invoiceid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE='+00:00' */;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-06 11:14:55

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cdr_records` (IN `last_execution_time` DATETIME, IN `end_date` DATETIME)  BEGIN
INSERT INTO `cdrs_day_by_summary` (`account_id`, `reseller_id`, `type`, `country_id`, `billseconds`, `mcd`, `total_calls`, `debit`, `cost`, `total_answered_call`, `total_fail_call`, `unique_date`, `calldate`) (SELECT `accountid`, `reseller_id`, `type`, `country_id`, SUM(`billseconds`) AS `billseconds`, MAX(`billseconds`) AS `mcd`, COUNT(*) AS `total_calls`, SUM(`debit`) AS `debit`, SUM(`cost`) AS `cost`, COUNT(CASE WHEN `billseconds` > 0 THEN 1 END) AS `total_answered_call`, COUNT(CASE WHEN `billseconds`=0 THEN 1 END) AS `total_fail_call`, DATE_FORMAT(`callstart`, "%Y%m%d") AS `unique_date`, DATE_FORMAT(`callstart`, "%Y-%m-%d") AS `calldate` FROM `cdrs_staging` WHERE `end_stamp`>=`last_execution_time` AND `end_stamp` < `end_date` GROUP BY `accountid`, `country_id`, `reseller_id`, `unique_date`) ON DUPLICATE KEY UPDATE `billseconds`=(`billseconds` + VALUES(`billseconds`)), `debit`=(`debit` + VALUES(`debit`)), `cost`=(`cost` + VALUES(`cost`)), `total_answered_call`=(`total_answered_call` + VALUES(`total_answered_call`)), `total_fail_call`=(`total_fail_call` + VALUES(`total_fail_call`)), `calldate`=`calldate`, `mcd`=GREATEST(VALUES(`mcd`), `mcd`), `total_calls`=(`total_calls` + VALUES(`total_calls`));
UPDATE `reports_process_list` SET `last_execution_date`=`end_date` WHERE `name`='get_cdr_records';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `master_pro` ()  NO SQL
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE rpl_id INT;
DECLARE rpl_name VARCHAR(50);
DECLARE rpl_date DATETIME;
DECLARE cur1 CURSOR 
FOR 
SELECT id,name,last_execution_date FROM reports_process_list;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur1;
read_loop: LOOP
  FETCH cur1 into rpl_id, rpl_name, rpl_date;
  IF done THEN
    LEAVE read_loop;
  END IF;
    SET @t1 =CONCAT("CALL ",rpl_name,"('",rpl_date,"','",UTC_TIMESTAMP(),"')");
  PREPARE stmt3 FROM @t1;
  EXECUTE stmt3;
  
END LOOP;

CLOSE cur1;
END$$

DELIMITER ;


DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `remove_cdrs_records` ON SCHEDULE EVERY 1 HOUR STARTS '2019-05-24 19:03:57' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM cdrs_staging where end_stamp <= (NOW()- INTERVAL 120 MINUTE)$$

CREATE DEFINER=`root`@`localhost` EVENT `staging_cdrs` ON SCHEDULE EVERY 1 MINUTE STARTS '2019-05-24 19:03:55' ON COMPLETION NOT PRESERVE ENABLE DO CALL master_pro()$$

DELIMITER ;
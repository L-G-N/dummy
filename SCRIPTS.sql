-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.5107
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cmt
CREATE DATABASE IF NOT EXISTS `cmt` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cmt`;

-- Dumping structure for table cmt.wp_cmt_accountdetails
CREATE TABLE IF NOT EXISTS `wp_cmt_accountdetails` (
  `Id` int(11) NOT NULL,
  `AccountNumber` int(11) DEFAULT NULL,
  `OriginalLoanAmt` varchar(50) DEFAULT NULL,
  `Asset` varchar(50) DEFAULT NULL,
  `CCIInsurance` varchar(50) DEFAULT NULL,
  `CCIInsurer` varchar(50) DEFAULT NULL,
  `ProductType` varchar(50) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_wp_cmt_accountdetails_wp_cmt_customerdetails` (`CustomerId`),
  CONSTRAINT `FK_wp_cmt_accountdetails_wp_cmt_customerdetails` FOREIGN KEY (`CustomerId`) REFERENCES `wp_cmt_customerdetails` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_accountdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_accountdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_accountdetails` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_case
CREATE TABLE IF NOT EXISTS `wp_cmt_case` (
  `Id` int(11) NOT NULL,
  `AssistStatus` varchar(50) DEFAULT NULL,
  `StatusReason` varchar(50) DEFAULT NULL,
  `StatusDate` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Creator` varchar(50) DEFAULT NULL,
  `LastActioner` varchar(50) DEFAULT NULL,
  `LastActionDate` datetime DEFAULT NULL,
  `AssistApprovalDate` datetime DEFAULT NULL,
  `AssistDeclinedDate` datetime DEFAULT NULL,
  `WithdrawalDate` datetime DEFAULT NULL,
  `CompletedDate` datetime DEFAULT NULL,
  `ScheduleDate` datetime DEFAULT NULL,
  `AssistReferralDate` datetime DEFAULT NULL,
  `ChannelSource` varchar(50) DEFAULT NULL,
  `InbasketmvmtDate` datetime DEFAULT NULL,
  `AssistApprovedBy` varchar(50) DEFAULT NULL,
  `InitialAssistDate` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `InbasketId` int(11) DEFAULT NULL,
  `AccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_wp_cmt_case_wp_cmt_customerdetails` (`CustomerId`),
  KEY `FK_wp_cmt_case_wp_cmt_inbasket` (`InbasketId`),
  KEY `FK_wp_cmt_case_wp_cmt_accountdetails` (`AccountId`),
  CONSTRAINT `FK_wp_cmt_case_wp_cmt_customerdetails` FOREIGN KEY (`CustomerId`) REFERENCES `wp_cmt_customerdetails` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_wp_cmt_case_wp_cmt_inbasket` FOREIGN KEY (`InbasketId`) REFERENCES `wp_cmt_inbasket` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_wp_cmt_case_wp_cmt_accountdetails` FOREIGN KEY (`AccountId`) REFERENCES `wp_cmt_accountdetails` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_case: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_case` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_customerdetails
CREATE TABLE IF NOT EXISTS `wp_cmt_customerdetails` (
  `Id` int(11) NOT NULL,
  `CustomerNumber` int(11) DEFAULT NULL,
  `CustomerType` varchar(50) DEFAULT NULL,
  `BusinessName` varchar(50) DEFAULT NULL,
  `SurName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `PostCode` int(11) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_customerdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_customerdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_customerdetails` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_ded
CREATE TABLE IF NOT EXISTS `wp_cmt_ded` (
  `Id` int(11) NOT NULL,
  `AssistanceReason` varchar(50) DEFAULT NULL,
  `AssistType1` varchar(50) DEFAULT NULL,
  `HardshipAmt` varchar(50) DEFAULT NULL,
  `HardshipStartDate` varchar(50) DEFAULT NULL,
  `HardshipEndDate` datetime DEFAULT NULL,
  `HardshipinstaltDate` datetime DEFAULT NULL,
  `ServiceabilityInstalment` varchar(50) DEFAULT NULL,
  `ServiceabilityStartDate` datetime DEFAULT NULL,
  `ServiceabilityDueDate` datetime DEFAULT NULL,
  `ServiceabilityFirstMMPDueDate` datetime DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_wp_cmt_ded_wp_cmt_case` (`CaseId`),
  CONSTRAINT `FK_wp_cmt_ded_wp_cmt_case` FOREIGN KEY (`CaseId`) REFERENCES `wp_cmt_case` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_ded: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_ded` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_ded` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_event
CREATE TABLE IF NOT EXISTS `wp_cmt_event` (
  `Id` int(11) NOT NULL,
  `EventName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Creator` varchar(50) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LastActioner` varchar(50) DEFAULT NULL,
  `LastActionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_event: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_event` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_history
CREATE TABLE IF NOT EXISTS `wp_cmt_history` (
  `Id` int(11) NOT NULL,
  `ActivityNotes` varchar(50) DEFAULT NULL,
  `ScheduleDate` datetime DEFAULT NULL,
  `ActivityTime` datetime DEFAULT NULL,
  `Actioner` varchar(50) DEFAULT NULL,
  `EventId` int(11) DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_wp_cmt_history_wp_cmt_event` (`EventId`),
  KEY `FK_wp_cmt_history_wp_cmt_case` (`CaseId`),
  CONSTRAINT `FK_wp_cmt_history_wp_cmt_event` FOREIGN KEY (`EventId`) REFERENCES `wp_cmt_event` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_wp_cmt_history_wp_cmt_case` FOREIGN KEY (`CaseId`) REFERENCES `wp_cmt_case` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_history` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_inbasket
CREATE TABLE IF NOT EXISTS `wp_cmt_inbasket` (
  `Id` int(11) NOT NULL,
  `InBasketName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Criteria` varchar(1000) DEFAULT NULL,
  `Creator` varchar(50) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LastActioner` varchar(50) DEFAULT NULL,
  `LastActionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_inbasket: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_inbasket` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_inbasket` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_inbaskettransition
CREATE TABLE IF NOT EXISTS `wp_cmt_inbaskettransition` (
  `Id` int(11) NOT NULL,
  `AssistStatus` varchar(50) DEFAULT NULL,
  `StatusReason` varchar(50) DEFAULT NULL,
  `LastActioner` varchar(50) DEFAULT NULL,
  `LastActionDate` datetime DEFAULT NULL,
  `EventId` int(11) DEFAULT NULL,
  `CurrentInbasketId` int(11) DEFAULT NULL,
  `NextInbasketId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_wp_cmt_inbaskettransition_wp_cmt_event` (`EventId`),
  KEY `FK_wp_cmt_inbaskettransition_wp_cmt_inbasket` (`CurrentInbasketId`),
  CONSTRAINT `FK_wp_cmt_inbaskettransition_wp_cmt_event` FOREIGN KEY (`EventId`) REFERENCES `wp_cmt_event` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_wp_cmt_inbaskettransition_wp_cmt_inbasket` FOREIGN KEY (`CurrentInbasketId`) REFERENCES `wp_cmt_inbasket` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_inbaskettransition: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_inbaskettransition` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_inbaskettransition` ENABLE KEYS */;

-- Dumping structure for table cmt.wp_cmt_mmpaccountdetails
CREATE TABLE IF NOT EXISTS `wp_cmt_mmpaccountdetails` (
  `Id` int(4) NOT NULL,
  `CurrentBalanceOwing` int(4) DEFAULT NULL,
  `MMPAmount` int(4) DEFAULT NULL,
  `MMPDate` datetime DEFAULT NULL,
  `MMPType` varchar(50) DEFAULT NULL,
  `SeekingAssist12MthsLoanStatus` varchar(2) DEFAULT NULL,
  `PastDueAmt` varchar(50) DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_wp_cmt_mmpaccountdetails_wp_cmt_case` (`CaseId`),
  CONSTRAINT `FK_wp_cmt_mmpaccountdetails_wp_cmt_case` FOREIGN KEY (`CaseId`) REFERENCES `wp_cmt_case` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cmt.wp_cmt_mmpaccountdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `wp_cmt_mmpaccountdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_cmt_mmpaccountdetails` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

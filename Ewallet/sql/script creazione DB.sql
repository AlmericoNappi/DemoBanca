DROP DATABASE IF EXISTS `ewallet`;
CREATE DATABASE IF NOT EXISTS `ewallet`; 
USE `ewallet`;

DROP TABLE IF EXISTS `conto_corrente`;
CREATE TABLE IF NOT EXISTS `conto_corrente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IBAN` int DEFAULT NULL,
  `INTESTATARIO` varchar(100) DEFAULT NULL,
  `SALDO` int DEFAULT NULL,
  `DATA_CREAZIONE` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ;

DROP TABLE IF EXISTS `tipo_movimento`;
CREATE TABLE IF NOT EXISTS `tipo_movimento` (
  `ID_TIPO_MOVIMENTO` int NOT NULL AUTO_INCREMENT,
  `DESCRIZIONE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_MOVIMENTO`) USING BTREE
) ;

DROP TABLE IF EXISTS `movimenti`;
CREATE TABLE IF NOT EXISTS `movimenti` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CONTO_CORRENTE` int DEFAULT NULL,
  `IMPORTO` int DEFAULT NULL,
  `ID_TIPO_MOVIMENTO` int DEFAULT NULL,
  `DATA_MOVIMENTO` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_lista_movimenti_conto_corrente` (`ID_CONTO_CORRENTE`),
  KEY `FK_lista_movimenti_tipo_versamento` (`ID_TIPO_MOVIMENTO`) USING BTREE,
  CONSTRAINT `FK_lista_movimenti_conto_corrente` FOREIGN KEY (`ID_CONTO_CORRENTE`) REFERENCES `conto_corrente` (`ID`),
  CONSTRAINT `FK_movimenti_tipo_movimento` FOREIGN KEY (`ID_TIPO_MOVIMENTO`) REFERENCES `tipo_movimento` (`ID_TIPO_MOVIMENTO`)
);



CREATE DATABASE IF NOT EXISTS `rfid` 
USE `rfid`;


CREATE TABLE IF NOT EXISTS `cliente` (
  `ID_client` smallint(6) NOT NULL DEFAULT 0,
  `Morada` varchar(200) NOT NULL,
  `morada_id` smallint(6) NOT NULL DEFAULT 0,
  `ID_user` smallint(6) NOT NULL AUTO_INCREMENT,
  KEY `ID_user` (`ID_user`),
  KEY `morada_id` (`morada_id`),
  KEY `ID_client` (`ID_client`),
  KEY `Morada` (`Morada`),
  CONSTRAINT `FK_cliente_user` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;


INSERT INTO `cliente` (`ID_client`, `Morada`, `morada_id`, `ID_user`) VALUES
	(423, 'Rua do PD de Tellheiras', 4, 4),
	(423, 'Cais de Entrega do PD de Telheiras', 5, 4),
	(531, 'Continente de Rio de Mouro', 3, 3),
	(257, 'Auchan de Sintra', 2, 2),
	(154, 'Auchan da Amadora', 1, 1);


CREATE TABLE IF NOT EXISTS `encomenda` (
  `ID_enc` smallint(6) NOT NULL,
  `ID_fatura` varchar(250) NOT NULL DEFAULT '0',
  `ID_tag` smallint(6) NOT NULL,
  `ID_cliente` smallint(6) NOT NULL,
  `notas` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_enc`),
  KEY `ID_tag` (`ID_tag`),
  KEY `ID_cliente` (`ID_cliente`),
  CONSTRAINT `FK_encomenda_cliente` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_encomenda_tags` FOREIGN KEY (`ID_tag`) REFERENCES `tags` (`ID_tag`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_encomenda_tags_2` FOREIGN KEY (`ID_enc`) REFERENCES `tags` (`ID_enc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `encomenda` (`ID_enc`, `ID_fatura`, `ID_tag`, `ID_cliente`, `notas`) VALUES
	(2342, 'F#2342', 1, 423, NULL),
	(2523, 'F#2523', 2, 423, NULL),
	(6634, 'F#6634\r\n', 3, 531, NULL),
	(10872, 'F#10872', 422, 154, NULL);


CREATE TABLE IF NOT EXISTS `localização` (
  `ID_tag` smallint(6) NOT NULL,
  `cord_x` float(11) NOT NULL DEFAULT 0,
  `cord_y` float(11) NOT NULL DEFAULT 0,
  `estado` enum('Em trânsito','Entregue') NOT NULL,
  `destino` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_tag`),
  KEY `FK_localização_morada` (`destino`),
  CONSTRAINT `FK_localização_morada` FOREIGN KEY (`destino`) REFERENCES `morada` (`rua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_localização_tags` FOREIGN KEY (`ID_tag`) REFERENCES `tags` (`ID_tag`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `localização` (`ID_tag`, `cord_x`, `cord_y`, `estado`, `destino`) VALUES
	(1, 0, 0, 'Entregue', 'Rua do PD de Tellheiras'),
	(2, 0, 0, 'Em trânsito', 'Cais de Entrega do PD de Telheiras'),
	(3, 0, 0, 'Entregue', 'Continente de Rio de Mouro'),
	(422, 0, 0, 'Em trânsito', 'Auchan da Amadora');


CREATE TABLE IF NOT EXISTS `morada` (
  `morada_id` smallint(6) NOT NULL,
  `codigo_postal` smallint(6) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `concelho` varchar(200) NOT NULL,
  PRIMARY KEY (`morada_id`),
  KEY `rua` (`rua`),
  CONSTRAINT `FK_morada_cliente` FOREIGN KEY (`morada_id`) REFERENCES `cliente` (`morada_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_morada_cliente_2` FOREIGN KEY (`rua`) REFERENCES `cliente` (`Morada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `morada` (`morada_id`, `codigo_postal`, `rua`, `concelho`) VALUES
	(1, 2000, 'Auchan da Amadora', 'Amadora'),
	(2, 2725, 'Auchan de Sintra', 'Sintra'),
	(3, 2100, 'Continente de Rio de Mouro', 'Rio de Mouro'),
	(4, 1600, 'Rua do PD de Tellheiras', 'Lisboa'),
	(5, 1600, 'Cais de Entrega do PD de Telheiras', 'Lisboa');


CREATE TABLE IF NOT EXISTS `tags` (
  `ID_tag` smallint(6) NOT NULL DEFAULT 0,
  `ID_user` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_enc` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_tag`) USING BTREE,
  KEY `ID_user` (`ID_user`),
  KEY `ID_enc` (`ID_enc`),
  CONSTRAINT `FK_tags_user` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;


INSERT INTO `tags` (`ID_tag`, `ID_user`, `ID_enc`) VALUES
	(1, 4, 2342),
	(2, 4, 2523),
	(3, 3, 6634),
	(422, 1, 10872);


CREATE TABLE IF NOT EXISTS `user` (
  `ID_user` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_role` enum('Admin','user') NOT NULL,
  `user_status` enum('Ativo','Inativo') NOT NULL,
  PRIMARY KEY (`ID_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


INSERT INTO `user` (`ID_user`, `username`, `password`, `user_role`, `user_status`) VALUES
	(1, 'auchanAmadora', 'auchan231', 'user', 'Ativo'),
	(2, 'auchanSintra', 'auchan331', 'user', 'Ativo'),
	(3, 'ContinenteRiodeMouro', 'continente142', 'user', 'Ativo'),
	(4, 'pdTelheiras', 'pd752', 'user', 'Ativo');


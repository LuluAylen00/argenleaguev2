
DROP DATABASE IF EXISTS `argenleague`;
CREATE DATABASE `argenleague`;
USE `argenleague`;

DROP TABLE IF EXISTS `partidasFinales`;
DROP TABLE IF EXISTS `partidas`;
DROP TABLE IF EXISTS `fechas_grupos`;
DROP TABLE IF EXISTS `jugadores`;
DROP TABLE IF EXISTS `fechas`;
DROP TABLE IF EXISTS `grupos`;
DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `numero` INT NOT NULL
);
INSERT INTO `categorias` (`numero`) VALUES (1),
    (2),
    (3),
    (4);

CREATE TABLE `grupos` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `numero` INT NOT NULL
);
INSERT INTO `grupos` (`numero`) VALUES (1),
    (2),
    (3),
    (4);

CREATE TABLE `fechas` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `numero` INT NOT NULL
);
INSERT INTO `fechas` (`numero`) VALUES (1),
    (2),
    (3);

CREATE TABLE `jugadores` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nick` VARCHAR(255) NOT NULL,
    `semilla` INT NOT NULL,
    `elo` DECIMAL(10,1) NOT NULL,
    `categoriaId` INT,
    `grupoId` INT,
    FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`),
    FOREIGN KEY (`grupoId`) REFERENCES `grupos` (`id`)
);
INSERT INTO jugadores (nick, semilla, elo, categoriaId, grupoId) VALUES 
    ("TWIGG",1,"2467.5",1,null),
    ("DEAKER",2,"2464.5",1,null),
    ("LUCKY_ZZ",3,"2461",1,null),
    ("DS_BIRY",4,"2421",1,null),
    ("MONOZ_ZZ",5,"2415",1,null),
    ("XEVER | PRISMA09",6,"2344.5",1,null),
    ("XEVER | NAHUE05",7,"2318.5",1,null),
    ("DS_PELA",8,"2287",1,null),
    ("DS_VARVARUS",9,"2281",1,null),
    ("DS_CARBO",10,"2193",1,null),
    ("CHELO",11,"2173",1,null),
    ("AAOE | REDLASH",12,"2149",1,null),
    ("XEVER | FREAKINDABS",13,"2110.5",1,null),
    ("RODRIXXXS",14,"2096.5",1,null),
    ("XEVER | ESKABE",15,"2091.5",1,null),
    ("XEVER | TATENGUE",16,"2068",1,null),
    ("GERGISKAN",17,"2064.5",2,null),
    ("LEAN",18,"2057.5",2,null),
    ("DS_CHOPI",19,"2042.5",2,null),
    ("XEVER | TIGGER KING",20,"2026",2,null),
    ("MICA",21,"2007",2,null),
    ("IVANENKO",22,"2005.5",2,null),
    ("S2.BUCHI",23,"2002",2,null),
    ("ASSASSINOSCURO",24,"1996.5",2,null),
    ("S2.HURRICANE",25,"1956.5",2,null),
    ("DGHIR | ANAKIN",26,"1910",2,null),
    ("MAGO_ZZ",27,"1909",2,null),
    ("XEVER | FREAKINLANDY",28,"1893",2,null),
    ("TM EL QUE MANEJA LA COMBI",29,"1881.5",2,null),
    ("CORP_MARTHYN",30,"1876",2,null),
    ("FACUN97",31,"1874",2,null),
    ("[KT] RAINBOWLUCHO",32,"1860.5",2,null),
    ("__97_LECHUGA_ARG",33,"1843.5",3,null),
    ("XEVER | EL TI REX",34,"1836.5",3,null),
    ("DHIR | YESICO",35,"1834",3,null),
    ("__90_SQUALL_ARG",36,"1833.5",3,null),
    ("TM KNOLTE",37,"1833",3,null),
    ("CORP_NACHOMONTES",38,"1825",3,null),
    ("SABALERO",39,"1822.5",3,null),
    ("TM WEBBER",40,"1816",3,null),
    ("S2.MIMO",41,"1812",3,null),
    ("TM PEKE",42,"1808.5",3,null),
    ("IXAM",43,"1792.5",3,null),
    ("TM PABLOG6",44,"1791",3,null),
    ("XEVER | MARTYYIN",45,"1790.5",3,null),
    ("CORP_KVOTHE",46,"1785.5",3,null),
    ("DGHIR | NUÑEZ KNIGHT",47,"1776",3,null),
    ("S2.VELEZ Y VINO",48,"1767",3,null),
    ("RAOFI",49,"1743.5",4,null),
    ("TCHAICOV",50,"1738.5",4,null),
    ("DS_ADRIAN",51,"1731",4,null),
    ("DS_RAMSAY",52,"1723.5",4,null),
    ("__33_FUNE_ARG",53,"1718.5",4,null),
    ("MOAII",54,"1697",4,null),
    ("MASCHERANO",55,"1694",4,null),
    ("XEVER | LOCOSER",56,"1690",4,null),
    ("XEVER | BLACKSPOT",57,"1687.5",4,null),
    ("[SIG] CHASQUIIX",58,"1677.5",4,null),
    ("__199_AL3JANDR0.MAGN00_ARG",59,"1660",4,null),
    ("[r1k0h] SUBLIME",60,"1652",4,null),
    ("VINCENT",61,"1647.5",4,null),
    ("LANDON",62,"1647",4,null),
    ("R | THC_LOBO",63,"1639.5",4,null),
    ("XEVER | RORRO PIRRORO",64,"1636",4,null);

CREATE TABLE `fechas_grupos` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `grupoId` INT NOT NULL,
    `fechaId` INT NOT NULL,
    FOREIGN KEY (`grupoId`) REFERENCES `grupos` (`id`),
    FOREIGN KEY (`fechaId`) REFERENCES `fechas` (`id`)
);

CREATE TABLE `partidas` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `jugadorUnoId` INT DEFAULT NULL,
    `jugadorDosId` INT DEFAULT NULL,
    `fechaId` INT NOT NULL,
    `categoriaId` INT NOT NULL,
    `horario` DATETIME,
    `draft` VARCHAR(255),
    `ganador` TINYINT(3) DEFAULT NULL,
    `grupoId` INT NOT NULL,
    FOREIGN KEY (`jugadorUnoId`) REFERENCES `jugadores` (`id`),
    FOREIGN KEY (`jugadorDosId`) REFERENCES `jugadores` (`id`),
    FOREIGN KEY (`grupoId`) REFERENCES `grupos` (`id`),
    FOREIGN KEY (`fechaId`) REFERENCES `fechas` (`id`)
);
INSERT INTO partidas (jugadorUnoId, jugadorDosId, fechaId, horario, draft, categoriaId, grupoId) VALUES (4,9,1, null, null,1,1),
    (null,null,1, null, null,1,1),
    (null,null,2, null, null,1,1),
    (null,null,2, null, null,1,1),
    (null,null,3, null, null,1,1),
    (null,null,1, null, null,1,2),
    (null,null,1, null, null,1,2),
    (null,null,2, null, null,1,2),
    (null,null,2, null, null,1,2),
    (null,null,3, null, null,1,2),
    (null,null,1, null, null,1,3),
    (null,null,1, null, null,1,3),
    (null,null,2, null, null,1,3),
    (null,null,2, null, null,1,3),
    (null,null,3, null, null,1,3),
    (null,null,1, null, null,1,4),
    (null,null,1, null, null,1,4),
    (null,null,2, null, null,1,4),
    (null,null,2, null, null,1,4),
    (null,null,3, null, null,1,4);
INSERT INTO partidas (jugadorUnoId, jugadorDosId, fechaId, horario, draft, categoriaId, grupoId) VALUES (17,27,1, null, null,2,1),
    (null,null,1, null, null,2,1),
    (null,null,2, null, null,2,1),
    (null,null,2, null, null,2,1),
    (null,null,3, null, null,2,1),
    (null,null,1, null, null,2,2),
    (null,null,1, null, null,2,2),
    (null,null,2, null, null,2,2),
    (null,null,2, null, null,2,2),
    (null,null,3, null, null,2,2),
    (null,null,1, null, null,2,3),
    (null,null,1, null, null,2,3),
    (null,null,2, null, null,2,3),
    (null,null,2, null, null,2,3),
    (null,null,3, null, null,2,3),
    (null,null,1, null, null,2,4),
    (null,null,1, null, null,2,4),
    (null,null,2, null, null,2,4),
    (null,null,2, null, null,2,4),
    (null,null,3, null, null,2,4);
INSERT INTO partidas (jugadorUnoId, jugadorDosId, fechaId, horario, draft, categoriaId, grupoId) VALUES (34,42,1, null, null,3,1),
    (null,null,1, null, null,3,1),
    (null,null,2, null, null,3,1),
    (null,null,2, null, null,3,1),
    (null,null,3, null, null,3,1),
    (null,null,1, null, null,3,2),
    (null,null,1, null, null,3,2),
    (null,null,2, null, null,3,2),
    (null,null,2, null, null,3,2),
    (null,null,3, null, null,3,2),
    (null,null,1, null, null,3,3),
    (null,null,1, null, null,3,3),
    (null,null,2, null, null,3,3),
    (null,null,2, null, null,3,3),
    (null,null,3, null, null,3,3),
    (null,null,1, null, null,3,4),
    (null,null,1, null, null,3,4),
    (null,null,2, null, null,3,4),
    (null,null,2, null, null,3,4),
    (null,null,3, null, null,3,4);

CREATE TABLE `partidasFinales` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `jugadorUnoId` INT DEFAULT NULL,
    `jugadorDosId` INT DEFAULT NULL,
    `etapaId` INT NOT NULL,
    `categoriaId` INT NOT NULL,
    `ganador` TINYINT(1) DEFAULT NULL,
    FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`),
    FOREIGN KEY (`jugadorUnoId`) REFERENCES `jugadores` (`id`),
    FOREIGN KEY (`jugadorDosId`) REFERENCES `jugadores` (`id`)
);
INSERT INTO partidasFinales (etapaId,categoriaId) VALUES (1,1),
    (1,1),
    (1,1),
    (1,1),
    (2,1),
    (2,1),
    (3,1),
    (4,1),
    (1,2),
    (1,2),
    (1,2),
    (1,2),
    (2,2),
    (2,2),
    (3,2),
    (4,2),
    (1,3),
    (1,3),
    (1,3),
    (1,3),
    (2,3),
    (2,3),
    (3,3),
    (4,3);
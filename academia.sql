/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : academia

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2013-11-16 10:19:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `alumno`
-- ----------------------------
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `Alumno_ID` int(11) NOT NULL,
  `ubigeo_ID` int(11) NOT NULL,
  `Institucioneducativa_ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255) NOT NULL,
  `dni` int(11) NOT NULL,
  `sexo` smallint(6) NOT NULL,
  `telefono_movil` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `grado` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`Alumno_ID`),
  KEY `FK_Ubigeo78` (`ubigeo_ID`),
  KEY `FK_Institucioneducativa_ID78` (`Institucioneducativa_ID`),
  CONSTRAINT `FK_Institucioneducativa_ID78` FOREIGN KEY (`Institucioneducativa_ID`) REFERENCES `institucioneducativa` (`Institucioneducativa_ID`),
  CONSTRAINT `FK_Ubigeo78` FOREIGN KEY (`ubigeo_ID`) REFERENCES `ubigeo` (`Ubigeo_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of alumno
-- ----------------------------
INSERT INTO `alumno` VALUES ('1', '1969', '1', 'PEDRO', 'PEREZ', 'NUÃ‘EZ', '88885685', '1', '49586896', 'PEDRO@HOTMAIL.COM', '2013-08-06', '0', '1');
INSERT INTO `alumno` VALUES ('2', '1903', '1', 'ANDERSON', 'GARCIA', 'MUÃ‘OZ', '4657688', '1', '996658656', 'SG@HOTMAIL.COM', '1997-06-25', '0', '1');
INSERT INTO `alumno` VALUES ('3', '1394', '3', 'MARCIA', 'GODOY', 'ALAMO', '48586886', '0', '996658656', 'MR@HOTMAIL.COM', '1990-01-11', '0', '1');
INSERT INTO `alumno` VALUES ('4', '1386', '2', 'FIORELA', 'VILLARREAL', 'COTRINA', '46792532', '0', '996658762', 'FVC@HOTMAIL.COM', '1990-01-25', '0', '1');
INSERT INTO `alumno` VALUES ('5', '1978', '1', 'ROSA', 'PEREZ', 'GODOY', '46792543', '0', '996658656', 'RS@HOTMAIL.COM', '1986-01-10', '0', '1');

-- ----------------------------
-- Table structure for `amortizacion_pago`
-- ----------------------------
DROP TABLE IF EXISTS `amortizacion_pago`;
CREATE TABLE `amortizacion_pago` (
  `monto` double NOT NULL,
  `movimiento_caja_ID` int(11) NOT NULL,
  `Cronograma_pago_ID` int(11) NOT NULL,
  PRIMARY KEY (`movimiento_caja_ID`,`Cronograma_pago_ID`),
  KEY `FK_Cronograma_pago_ID59` (`Cronograma_pago_ID`),
  CONSTRAINT `FK_Cronograma_pago_ID59` FOREIGN KEY (`Cronograma_pago_ID`) REFERENCES `cronograma_pago` (`Cronograma_pago_ID`),
  CONSTRAINT `FK_movimiento_caja_ID69` FOREIGN KEY (`movimiento_caja_ID`) REFERENCES `movimiento_caja` (`movimiento_caja_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of amortizacion_pago
-- ----------------------------

-- ----------------------------
-- Table structure for `apoderado`
-- ----------------------------
DROP TABLE IF EXISTS `apoderado`;
CREATE TABLE `apoderado` (
  `Apoderado_ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `dni` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`Apoderado_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apoderado
-- ----------------------------
INSERT INTO `apoderado` VALUES ('1', 'GIMEL', 'GARCIA ', 'CHACALN', 'JR: LIMA', 'ESTUDIANTE', '2013-11-14', '467926253', '1');
INSERT INTO `apoderado` VALUES ('2', 'JHIMI', 'PESO', 'MORI', 'JR: PERU', 'COMERCIANTE', '1950-01-11', '4685868', '1');
INSERT INTO `apoderado` VALUES ('3', 'RUT', 'GARCIA', 'MUÃ‘OZ', 'JR: LAMAS', 'AMA DE CASA', '1950-01-17', '4858686', '1');
INSERT INTO `apoderado` VALUES ('4', 'HARUMY', 'MEDINA', 'SANCHEZ', 'JR:ESPAÃ‘A', 'AMA DE CASA', '1950-01-12', '586686967', '0');

-- ----------------------------
-- Table structure for `asiento`
-- ----------------------------
DROP TABLE IF EXISTS `asiento`;
CREATE TABLE `asiento` (
  `debe` double NOT NULL,
  `haber` double NOT NULL,
  `planilla_contable_ID` int(11) NOT NULL,
  `Planilla_movimiento_ID` int(11) NOT NULL,
  PRIMARY KEY (`planilla_contable_ID`,`Planilla_movimiento_ID`),
  KEY `FK_Planilla_movimiento_ID19` (`Planilla_movimiento_ID`),
  CONSTRAINT `FK_planilla_contable_ID19` FOREIGN KEY (`planilla_contable_ID`) REFERENCES `planilla_contable` (`planilla_contable_ID`),
  CONSTRAINT `FK_Planilla_movimiento_ID19` FOREIGN KEY (`Planilla_movimiento_ID`) REFERENCES `planilla_movimiento` (`Planilla_movimiento_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asiento
-- ----------------------------

-- ----------------------------
-- Table structure for `asistencia`
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `fecha` date NOT NULL,
  `estado` smallint(6) NOT NULL,
  `justificacion` smallint(6) NOT NULL,
  `Cursos_ID` int(11) NOT NULL,
  `Matricula_ID` int(11) NOT NULL,
  `Horario_ID` int(11) NOT NULL,
  PRIMARY KEY (`Cursos_ID`,`Matricula_ID`,`Horario_ID`),
  KEY `FK_Horaio_ID09` (`Horario_ID`),
  KEY `FK_Matricula_ID19` (`Matricula_ID`),
  CONSTRAINT `FK_Cursos_ID99` FOREIGN KEY (`Cursos_ID`) REFERENCES `cursos_matricula` (`Cursos_ID`),
  CONSTRAINT `FK_Horaio_ID09` FOREIGN KEY (`Horario_ID`) REFERENCES `horario` (`Horario_ID`),
  CONSTRAINT `FK_Matricula_ID19` FOREIGN KEY (`Matricula_ID`) REFERENCES `cursos_matricula` (`Matricula_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asistencia
-- ----------------------------

-- ----------------------------
-- Table structure for `caja`
-- ----------------------------
DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja` (
  `monto` double NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `caja_ID` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`caja_ID`),
  KEY `FK_Empleado_ID69` (`id_empleado`),
  CONSTRAINT `FK_Empleado_ID69` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caja
-- ----------------------------

-- ----------------------------
-- Table structure for `concepto`
-- ----------------------------
DROP TABLE IF EXISTS `concepto`;
CREATE TABLE `concepto` (
  `descripcion` varchar(255) NOT NULL,
  `monto` double NOT NULL,
  `estado` smallint(6) NOT NULL,
  `concepto_ID` int(11) NOT NULL,
  `tipo_movimiento_ID` int(11) NOT NULL,
  PRIMARY KEY (`concepto_ID`),
  KEY `FK_tipo_movimiento_ID89` (`tipo_movimiento_ID`),
  CONSTRAINT `FK_tipo_movimiento_ID89` FOREIGN KEY (`tipo_movimiento_ID`) REFERENCES `tipo_movimiento` (`tipo_movimiento_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of concepto
-- ----------------------------

-- ----------------------------
-- Table structure for `cronograma_pago`
-- ----------------------------
DROP TABLE IF EXISTS `cronograma_pago`;
CREATE TABLE `cronograma_pago` (
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  `estado` smallint(6) NOT NULL,
  `Cronograma_pago_ID` int(11) NOT NULL,
  `Matricula_ID` int(11) NOT NULL,
  PRIMARY KEY (`Cronograma_pago_ID`),
  KEY `FK_Matricula_IDD89` (`Matricula_ID`),
  CONSTRAINT `FK_Matricula_IDD89` FOREIGN KEY (`Matricula_ID`) REFERENCES `matricula` (`Matricula_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cronograma_pago
-- ----------------------------

-- ----------------------------
-- Table structure for `cursos`
-- ----------------------------
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `Cursos_ID` int(11) NOT NULL,
  `nombre_curso` varchar(255) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cursos_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cursos
-- ----------------------------
INSERT INTO `cursos` VALUES ('1', 'MATEMATICA', '1');
INSERT INTO `cursos` VALUES ('2', 'LENGUAJE', '1');
INSERT INTO `cursos` VALUES ('3', 'QUIMICA', '1');
INSERT INTO `cursos` VALUES ('4', 'GEOMETRIA', '0');
INSERT INTO `cursos` VALUES ('5', 'TRIGONOMETRIA', '1');
INSERT INTO `cursos` VALUES ('6', 'ALGEBRA', '1');

-- ----------------------------
-- Table structure for `cursos_matricula`
-- ----------------------------
DROP TABLE IF EXISTS `cursos_matricula`;
CREATE TABLE `cursos_matricula` (
  `descripcion` varchar(255) NOT NULL,
  `Cursos_ID` int(11) NOT NULL,
  `Matricula_ID` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `Horario_ID` int(11) NOT NULL,
  PRIMARY KEY (`Cursos_ID`,`Matricula_ID`),
  KEY `FK_Empleado_ID79` (`id_empleado`),
  KEY `FK_Matricula_ID79` (`Matricula_ID`),
  CONSTRAINT `FK_Cursos_ID79` FOREIGN KEY (`Cursos_ID`) REFERENCES `cursos` (`Cursos_ID`),
  CONSTRAINT `FK_Empleado_ID79` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `FK_Matricula_ID79` FOREIGN KEY (`Matricula_ID`) REFERENCES `matricula` (`Matricula_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cursos_matricula
-- ----------------------------

-- ----------------------------
-- Table structure for `empleado`
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `estadocivil` varchar(15) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `FK_tipo_empleado_ID78` (`id_perfil`),
  CONSTRAINT `FK_tipo_empleado_ID78` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'EVER', 'CARLOS ROJAS', 'JR. TOMAS VILLACORTA 125', '46792643', '2012-01-27', 'SOLTERO(A)', '1', 'EVER', 'ROJAS', '1', '990403531');
INSERT INTO `empleado` VALUES ('2', 'NEISER', 'YPLAC PESO', 'JR: LIMA', '46793657', '1950-01-09', 'SOLTERO(A)', '1', 'NEISER', 'NEISER', '4', '9499568956');
INSERT INTO `empleado` VALUES ('3', 'JHIMY', 'PESO MORI', 'JR: LIMA', '46792627', '1950-01-10', 'CASADO(A)', '1', 'JHIMY', 'JHIMY', '5', '996658565');

-- ----------------------------
-- Table structure for `horario`
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `Horario_ID` int(11) NOT NULL,
  `turno` varchar(255) NOT NULL,
  `Dia` varchar(255) NOT NULL,
  `Hora_inicio` varchar(255) NOT NULL,
  `hora_fin` varchar(255) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`Horario_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES ('1', 'MAÑANA', 'LUNES', '7', '12', '1');
INSERT INTO `horario` VALUES ('2', 'TARDE', 'MARTES', '2', '4', '1');
INSERT INTO `horario` VALUES ('3', 'MAÃ‘ANA', 'MIERCOLES', '6', '10', '1');
INSERT INTO `horario` VALUES ('4', 'MAÃ‘ANA', 'DOMINGO', '7', '10', '1');

-- ----------------------------
-- Table structure for `institucioneducativa`
-- ----------------------------
DROP TABLE IF EXISTS `institucioneducativa`;
CREATE TABLE `institucioneducativa` (
  `Institucioneducativa_ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `curricula` varchar(255) NOT NULL,
  `telefono_fijo` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`Institucioneducativa_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of institucioneducativa
-- ----------------------------
INSERT INTO `institucioneducativa` VALUES ('1', 'OFELIA', '2010-II', '996658656', 'JR: MOYO', '1');
INSERT INTO `institucioneducativa` VALUES ('2', 'VENCEDORES DEL COMIANA', '2010-II', '996658656', 'JR:PERÃš', '1');
INSERT INTO `institucioneducativa` VALUES ('3', 'SANTA ROSA', '2010-II', '996657384', 'JR: LIMAS', '1');
INSERT INTO `institucioneducativa` VALUES ('4', 'MIRAFLORES', '2010-I', '8686859', 'J:LIMA', '0');

-- ----------------------------
-- Table structure for `matricula`
-- ----------------------------
DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `fecha_matricula` date NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `reserva` int(11) NOT NULL,
  `estado` smallint(6) NOT NULL,
  `Matricula_ID` int(11) NOT NULL,
  `Alumno_ID` int(11) NOT NULL,
  `Apoderado_ID` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`Matricula_ID`),
  KEY `FK_Empleado_ID89` (`id_empleado`),
  KEY `FK_Apoderado_ID89` (`Apoderado_ID`),
  KEY `FK_Alumno_ID89` (`Alumno_ID`),
  CONSTRAINT `FK_Alumno_ID89` FOREIGN KEY (`Alumno_ID`) REFERENCES `alumno` (`Alumno_ID`),
  CONSTRAINT `FK_Apoderado_ID89` FOREIGN KEY (`Apoderado_ID`) REFERENCES `apoderado` (`Apoderado_ID`),
  CONSTRAINT `FK_Empleado_ID89` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of matricula
-- ----------------------------

-- ----------------------------
-- Table structure for `modulos`
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos` (
  `idmodulo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  `idmodulo_padre` int(11) NOT NULL,
  PRIMARY KEY (`idmodulo`),
  KEY `modulos_idmodulo_padre_fkey9` (`idmodulo_padre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES ('0', 'MODULO PADRE', '#', '0', '0');
INSERT INTO `modulos` VALUES ('1', 'SEGURIDAD', '#', '1', '0');
INSERT INTO `modulos` VALUES ('3', 'MODULOS', 'MODULOS', '1', '1');
INSERT INTO `modulos` VALUES ('4', 'PERMISOS', 'PERMISOS', '1', '1');
INSERT INTO `modulos` VALUES ('5', 'PERFIL', 'PERFILES', '1', '1');
INSERT INTO `modulos` VALUES ('6', 'CONFIGURAR BD', 'CONFIGURARBD', '1', '1');
INSERT INTO `modulos` VALUES ('7', 'GESTIONACADEMICA', 'GESTIONACADEMICA', '1', '0');
INSERT INTO `modulos` VALUES ('8', 'ASISTENCIA', 'ASISTENCIA', '1', '7');
INSERT INTO `modulos` VALUES ('9', 'HORARIO', 'HORARIO', '1', '7');
INSERT INTO `modulos` VALUES ('10', 'CURSOS', 'CURSOS', '1', '7');
INSERT INTO `modulos` VALUES ('11', 'EMPLEADO', 'EMPLEADO', '1', '7');
INSERT INTO `modulos` VALUES ('12', 'CAJA', 'CAJA', '1', '0');
INSERT INTO `modulos` VALUES ('13', 'CAJA', 'CAJA', '1', '12');
INSERT INTO `modulos` VALUES ('14', 'CONTABILIDAD', 'CONTABILIDAD', '1', '12');
INSERT INTO `modulos` VALUES ('15', 'CRONOGRAMAPAGO', 'CRONOGRAMAPAGO', '1', '12');
INSERT INTO `modulos` VALUES ('16', 'AMORTIZACION', 'AMORTIZACION', '1', '12');
INSERT INTO `modulos` VALUES ('17', 'MATRICULA', 'MATRICULA', '1', '0');
INSERT INTO `modulos` VALUES ('18', 'MATRICULA', 'MATRICULA', '1', '17');
INSERT INTO `modulos` VALUES ('19', 'ALUMNO', 'ALUMNO', '1', '17');
INSERT INTO `modulos` VALUES ('20', 'APODERADO', 'APODERADO', '1', '17');
INSERT INTO `modulos` VALUES ('21', 'INSTITUCIONEDUCATIVA', 'INSTITUCIONEDUCATIVA', '1', '17');
INSERT INTO `modulos` VALUES ('22', 'REPORTES', 'REPORTES', '1', '0');
INSERT INTO `modulos` VALUES ('23', 'REPORTES GRAFICOS', 'REPORTESGRAFICOS', '1', '22');
INSERT INTO `modulos` VALUES ('24', 'REPORTES', 'REPORTES', '1', '22');

-- ----------------------------
-- Table structure for `movimiento_caja`
-- ----------------------------
DROP TABLE IF EXISTS `movimiento_caja`;
CREATE TABLE `movimiento_caja` (
  `monto` double NOT NULL,
  `estado` smallint(6) NOT NULL,
  `glosa` varchar(255) NOT NULL,
  `movimiento_caja_ID` int(11) NOT NULL,
  `caja_ID` int(11) NOT NULL,
  `concepto_ID` int(11) NOT NULL,
  PRIMARY KEY (`movimiento_caja_ID`),
  KEY `FK_Caja_ID69` (`caja_ID`),
  KEY `FK_concepto_ID69` (`concepto_ID`),
  CONSTRAINT `FK_Caja_ID69` FOREIGN KEY (`caja_ID`) REFERENCES `caja` (`caja_ID`),
  CONSTRAINT `FK_concepto_ID69` FOREIGN KEY (`concepto_ID`) REFERENCES `concepto` (`concepto_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of movimiento_caja
-- ----------------------------

-- ----------------------------
-- Table structure for `paises`
-- ----------------------------
DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `idpais` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `idcontinente` int(11) NOT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of paises
-- ----------------------------
INSERT INTO `paises` VALUES ('0', '', '', '0');
INSERT INTO `paises` VALUES ('1', 'BOUVET ISLAND', '9001', '1');
INSERT INTO `paises` VALUES ('2', 'COTE D IVOIRE', '9002', '1');
INSERT INTO `paises` VALUES ('3', 'FALKLAND ISLANDS (MALVINAS)', '9003', '1');
INSERT INTO `paises` VALUES ('4', 'FRANCE, METROPOLITAN', '9004', '1');
INSERT INTO `paises` VALUES ('5', 'FRENCH SOUTHERN TERRITORIES', '9005', '1');
INSERT INTO `paises` VALUES ('6', 'HEARD AND MC DONALD ISLANDS', '9006', '1');
INSERT INTO `paises` VALUES ('7', 'MAYOTTE', '9007', '1');
INSERT INTO `paises` VALUES ('8', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', '9008', '1');
INSERT INTO `paises` VALUES ('9', 'SVALBARD AND JAN MAYEN ISLANDS', '9009', '1');
INSERT INTO `paises` VALUES ('10', 'UNITED STATES MINOR OUTLYING ISLANDS', '9010', '1');
INSERT INTO `paises` VALUES ('11', 'OTROS PAISES O LUGARES', '9011', '1');
INSERT INTO `paises` VALUES ('12', 'AFGANISTAN', '9013', '1');
INSERT INTO `paises` VALUES ('13', 'ALBANIA', '9017', '1');
INSERT INTO `paises` VALUES ('14', 'ALDERNEY', '9019', '1');
INSERT INTO `paises` VALUES ('15', 'ALEMANIA', '9023', '1');
INSERT INTO `paises` VALUES ('16', 'ARMENIA', '9026', '1');
INSERT INTO `paises` VALUES ('17', 'ARUBA', '9027', '1');
INSERT INTO `paises` VALUES ('18', 'ASCENCION', '9028', '1');
INSERT INTO `paises` VALUES ('19', 'BOSNIA-HERZEGOVINA', '9029', '1');
INSERT INTO `paises` VALUES ('20', 'BURKINA FASO', '9031', '1');
INSERT INTO `paises` VALUES ('21', 'ANDORRA', '9037', '1');
INSERT INTO `paises` VALUES ('22', 'ANGOLA', '9040', '1');
INSERT INTO `paises` VALUES ('23', 'ANGUILLA', '9041', '1');
INSERT INTO `paises` VALUES ('24', 'ANTIGUA Y BARBUDA', '9043', '1');
INSERT INTO `paises` VALUES ('25', 'ANTILLAS HOLANDESAS', '9047', '1');
INSERT INTO `paises` VALUES ('26', 'ARABIA SAUDITA', '9053', '1');
INSERT INTO `paises` VALUES ('27', 'ARGELIA', '9059', '1');
INSERT INTO `paises` VALUES ('28', 'ARGENTINA', '9063', '1');
INSERT INTO `paises` VALUES ('29', 'AUSTRALIA', '9069', '1');
INSERT INTO `paises` VALUES ('30', 'AUSTRIA', '9072', '1');
INSERT INTO `paises` VALUES ('31', 'AZERBAIJAN', '9074', '1');
INSERT INTO `paises` VALUES ('32', 'BAHAMAS', '9077', '1');
INSERT INTO `paises` VALUES ('33', 'BAHREIN', '9080', '1');
INSERT INTO `paises` VALUES ('34', 'BANGLADESH', '9081', '1');
INSERT INTO `paises` VALUES ('35', 'BARBADOS', '9083', '1');
INSERT INTO `paises` VALUES ('36', 'BELGICA', '9087', '1');
INSERT INTO `paises` VALUES ('37', 'BELICE', '9088', '1');
INSERT INTO `paises` VALUES ('38', 'BERMUDAS', '9090', '1');
INSERT INTO `paises` VALUES ('39', 'BELARUS', '9091', '1');
INSERT INTO `paises` VALUES ('40', 'MYANMAR', '9093', '1');
INSERT INTO `paises` VALUES ('41', 'BOLIVIA', '9097', '1');
INSERT INTO `paises` VALUES ('42', 'BOTSWANA', '9101', '1');
INSERT INTO `paises` VALUES ('43', 'BRASIL', '9105', '1');
INSERT INTO `paises` VALUES ('44', 'BRUNEI DARUSSALAM', '9108', '1');
INSERT INTO `paises` VALUES ('45', 'BULGARIA', '9111', '1');
INSERT INTO `paises` VALUES ('46', 'BURUNDI', '9115', '1');
INSERT INTO `paises` VALUES ('47', 'BUTAN', '9119', '1');
INSERT INTO `paises` VALUES ('48', 'CABO VERDE', '9127', '1');
INSERT INTO `paises` VALUES ('49', 'CAIMAN,ISLAS', '9137', '1');
INSERT INTO `paises` VALUES ('50', 'CAMBOYA', '9141', '1');
INSERT INTO `paises` VALUES ('51', 'CAMERUN,REPUBLICA UNIDA DEL', '9145', '1');
INSERT INTO `paises` VALUES ('52', 'CAMPIONE D TALIA', '9147', '1');
INSERT INTO `paises` VALUES ('53', 'CANADA', '9149', '1');
INSERT INTO `paises` VALUES ('54', 'CANAL (NORMANDAS), ISLAS', '9155', '1');
INSERT INTO `paises` VALUES ('55', 'CANTON Y ENDERBURRY', '9157', '1');
INSERT INTO `paises` VALUES ('56', 'SANTA SEDE', '9159', '1');
INSERT INTO `paises` VALUES ('57', 'COCOS (KEELING),ISLAS', '9165', '1');
INSERT INTO `paises` VALUES ('58', 'COLOMBIA', '9169', '1');
INSERT INTO `paises` VALUES ('59', 'COMORAS', '9173', '1');
INSERT INTO `paises` VALUES ('60', 'CONGO', '9177', '1');
INSERT INTO `paises` VALUES ('61', 'COOK, ISLAS', '9183', '1');
INSERT INTO `paises` VALUES ('62', 'COREA (NORTE), REPUBLICA POPULAR DEMOCRATICA DE', '9187', '1');
INSERT INTO `paises` VALUES ('63', 'COREA (SUR), REPUBLICA DE', '9190', '1');
INSERT INTO `paises` VALUES ('64', 'COSTA DE MARFIL', '9193', '1');
INSERT INTO `paises` VALUES ('65', 'COSTA RICA', '9196', '1');
INSERT INTO `paises` VALUES ('66', 'CROACIA', '9198', '1');
INSERT INTO `paises` VALUES ('67', 'CUBA', '9199', '1');
INSERT INTO `paises` VALUES ('68', 'CHAD', '9203', '1');
INSERT INTO `paises` VALUES ('69', 'CHECOSLOVAQUIA', '9207', '1');
INSERT INTO `paises` VALUES ('70', 'CHILE', '9211', '1');
INSERT INTO `paises` VALUES ('71', 'CHINA', '9215', '1');
INSERT INTO `paises` VALUES ('72', 'TAIWAN (FORMOSA)', '9218', '1');
INSERT INTO `paises` VALUES ('73', 'CHIPRE', '9221', '1');
INSERT INTO `paises` VALUES ('74', 'BENIN', '9229', '1');
INSERT INTO `paises` VALUES ('75', 'DINAMARCA', '9232', '1');
INSERT INTO `paises` VALUES ('76', 'DOMINICA', '9235', '1');
INSERT INTO `paises` VALUES ('77', 'ECUADOR', '9239', '1');
INSERT INTO `paises` VALUES ('78', 'EGIPTO', '9240', '1');
INSERT INTO `paises` VALUES ('79', 'EL SALVADOR', '9242', '1');
INSERT INTO `paises` VALUES ('80', 'ERITREA', '9243', '1');
INSERT INTO `paises` VALUES ('81', 'EMIRATOS ARABES UNIDOS', '9244', '1');
INSERT INTO `paises` VALUES ('82', 'ESPANA', '9245', '1');
INSERT INTO `paises` VALUES ('83', 'ESLOVAQUIA', '9246', '1');
INSERT INTO `paises` VALUES ('84', 'ESLOVENIA', '9247', '1');
INSERT INTO `paises` VALUES ('85', 'ESTADOS UNIDOS', '9249', '1');
INSERT INTO `paises` VALUES ('86', 'ESTONIA', '9251', '1');
INSERT INTO `paises` VALUES ('87', 'ETIOPIA', '9253', '1');
INSERT INTO `paises` VALUES ('88', 'FEROE, ISLAS', '9259', '1');
INSERT INTO `paises` VALUES ('89', 'FILIPINAS', '9267', '1');
INSERT INTO `paises` VALUES ('90', 'FINLANDIA', '9271', '1');
INSERT INTO `paises` VALUES ('91', 'FRANCIA', '9275', '1');
INSERT INTO `paises` VALUES ('92', 'GABON', '9281', '1');
INSERT INTO `paises` VALUES ('93', 'GAMBIA', '9285', '1');
INSERT INTO `paises` VALUES ('94', 'GAZA Y JERICO', '9286', '1');
INSERT INTO `paises` VALUES ('95', 'GEORGIA', '9287', '1');
INSERT INTO `paises` VALUES ('96', 'GHANA', '9289', '1');
INSERT INTO `paises` VALUES ('97', 'GIBRALTAR', '9293', '1');
INSERT INTO `paises` VALUES ('98', 'GRANADA', '9297', '1');
INSERT INTO `paises` VALUES ('99', 'GRECIA', '9301', '1');
INSERT INTO `paises` VALUES ('100', 'GROENLANDIA', '9305', '1');
INSERT INTO `paises` VALUES ('101', 'GUADALUPE', '9309', '1');
INSERT INTO `paises` VALUES ('102', 'GUAM', '9313', '1');
INSERT INTO `paises` VALUES ('103', 'GUATEMALA', '9317', '1');
INSERT INTO `paises` VALUES ('104', 'GUAYANA FRANCESA', '9325', '1');
INSERT INTO `paises` VALUES ('105', 'GUERNSEY', '9327', '1');
INSERT INTO `paises` VALUES ('106', 'GUINEA', '9329', '1');
INSERT INTO `paises` VALUES ('107', 'GUINEA ECUATORIAL', '9331', '1');
INSERT INTO `paises` VALUES ('108', 'GUINEA-BISSAU', '9334', '1');
INSERT INTO `paises` VALUES ('109', 'GUYANA', '9337', '1');
INSERT INTO `paises` VALUES ('110', 'HAITI', '9341', '1');
INSERT INTO `paises` VALUES ('111', 'HONDURAS', '9345', '1');
INSERT INTO `paises` VALUES ('112', 'HONDURAS BRITANICAS', '9348', '1');
INSERT INTO `paises` VALUES ('113', 'HONG KONG', '9351', '1');
INSERT INTO `paises` VALUES ('114', 'HUNGRIA', '9355', '1');
INSERT INTO `paises` VALUES ('115', 'INDIA', '9361', '1');
INSERT INTO `paises` VALUES ('116', 'INDONESIA', '9365', '1');
INSERT INTO `paises` VALUES ('117', 'IRAK', '9369', '1');
INSERT INTO `paises` VALUES ('118', 'IRAN, REPUBLICA ISLAMICA DEL', '9372', '1');
INSERT INTO `paises` VALUES ('119', 'IRLANDA (EIRE)', '9375', '1');
INSERT INTO `paises` VALUES ('120', 'ISLA AZORES', '9377', '1');
INSERT INTO `paises` VALUES ('121', 'ISLA DEL MAN', '9378', '1');
INSERT INTO `paises` VALUES ('122', 'ISLANDIA', '9379', '1');
INSERT INTO `paises` VALUES ('123', 'ISLAS CANARIAS', '9380', '1');
INSERT INTO `paises` VALUES ('124', 'ISLAS DE CHRISTMAS', '9381', '1');
INSERT INTO `paises` VALUES ('125', 'ISLAS QESHM', '9382', '1');
INSERT INTO `paises` VALUES ('126', 'ISRAEL', '9383', '1');
INSERT INTO `paises` VALUES ('127', 'ITALIA', '9386', '1');
INSERT INTO `paises` VALUES ('128', 'JAMAICA', '9391', '1');
INSERT INTO `paises` VALUES ('129', 'JONSTON, ISLAS', '9395', '1');
INSERT INTO `paises` VALUES ('130', 'JAPON', '9399', '1');
INSERT INTO `paises` VALUES ('131', 'JERSEY', '9401', '1');
INSERT INTO `paises` VALUES ('132', 'JORDANIA', '9403', '1');
INSERT INTO `paises` VALUES ('133', 'KAZAJSTAN', '9406', '1');
INSERT INTO `paises` VALUES ('134', 'KENIA', '9410', '1');
INSERT INTO `paises` VALUES ('135', 'KIRIBATI', '9411', '1');
INSERT INTO `paises` VALUES ('136', 'KIRGUIZISTAN', '9412', '1');
INSERT INTO `paises` VALUES ('137', 'KUWAIT', '9413', '1');
INSERT INTO `paises` VALUES ('138', 'LABUN', '9418', '1');
INSERT INTO `paises` VALUES ('139', 'LAOS, REPUBLICA POPULAR DEMOCRATICA DE', '9420', '1');
INSERT INTO `paises` VALUES ('140', 'LESOTHO', '9426', '1');
INSERT INTO `paises` VALUES ('141', 'LETONIA', '9429', '1');
INSERT INTO `paises` VALUES ('142', 'LIBANO', '9431', '1');
INSERT INTO `paises` VALUES ('143', 'LIBERIA', '9434', '1');
INSERT INTO `paises` VALUES ('144', 'LIBIA', '9438', '1');
INSERT INTO `paises` VALUES ('145', 'LIECHTENSTEIN', '9440', '1');
INSERT INTO `paises` VALUES ('146', 'LITUANIA', '9443', '1');
INSERT INTO `paises` VALUES ('147', 'LUXEMBURGO', '9445', '1');
INSERT INTO `paises` VALUES ('148', 'MACAO', '9447', '1');
INSERT INTO `paises` VALUES ('149', 'MACEDONIA', '9448', '1');
INSERT INTO `paises` VALUES ('150', 'MADAGASCAR', '9450', '1');
INSERT INTO `paises` VALUES ('151', 'MADEIRA', '9453', '1');
INSERT INTO `paises` VALUES ('152', 'MALAYSIA', '9455', '1');
INSERT INTO `paises` VALUES ('153', 'MALAWI', '9458', '1');
INSERT INTO `paises` VALUES ('154', 'MALDIVAS', '9461', '1');
INSERT INTO `paises` VALUES ('155', 'MALI', '9464', '1');
INSERT INTO `paises` VALUES ('156', 'MALTA', '9467', '1');
INSERT INTO `paises` VALUES ('157', 'MARIANAS DEL NORTE, ISLAS', '9469', '1');
INSERT INTO `paises` VALUES ('158', 'MARSHALL, ISLAS', '9472', '1');
INSERT INTO `paises` VALUES ('159', 'MARRUECOS', '9474', '1');
INSERT INTO `paises` VALUES ('160', 'MARTINICA', '9477', '1');
INSERT INTO `paises` VALUES ('161', 'MAURICIO', '9485', '1');
INSERT INTO `paises` VALUES ('162', 'MAURITANIA', '9488', '1');
INSERT INTO `paises` VALUES ('163', 'MEXICO', '9493', '1');
INSERT INTO `paises` VALUES ('164', 'MICRONESIA, ESTADOS FEDERADOS DE', '9494', '1');
INSERT INTO `paises` VALUES ('165', 'MIDWAY ISLAS', '9495', '1');
INSERT INTO `paises` VALUES ('166', 'MOLDAVIA', '9496', '1');
INSERT INTO `paises` VALUES ('167', 'MONGOLIA', '9497', '1');
INSERT INTO `paises` VALUES ('168', 'MONACO', '9498', '1');
INSERT INTO `paises` VALUES ('169', 'MONTSERRAT, ISLA', '9501', '1');
INSERT INTO `paises` VALUES ('170', 'MOZAMBIQUE', '9505', '1');
INSERT INTO `paises` VALUES ('171', 'NAMIBIA', '9507', '1');
INSERT INTO `paises` VALUES ('172', 'NAURU', '9508', '1');
INSERT INTO `paises` VALUES ('173', 'NAVIDAD (CHRISTMAS), ISLA', '9511', '1');
INSERT INTO `paises` VALUES ('174', 'NEPAL', '9517', '1');
INSERT INTO `paises` VALUES ('175', 'NICARAGUA', '9521', '1');
INSERT INTO `paises` VALUES ('176', 'NIGER', '9525', '1');
INSERT INTO `paises` VALUES ('177', 'NIGERIA', '9528', '1');
INSERT INTO `paises` VALUES ('178', 'NIUE, ISLA', '9531', '1');
INSERT INTO `paises` VALUES ('179', 'NORFOLK, ISLA', '9535', '1');
INSERT INTO `paises` VALUES ('180', 'NORUEGA', '9538', '1');
INSERT INTO `paises` VALUES ('181', 'NUEVA CALEDONIA', '9542', '1');
INSERT INTO `paises` VALUES ('182', 'PAPUASIA NUEVA GUINEA', '9545', '1');
INSERT INTO `paises` VALUES ('183', 'NUEVA ZELANDA', '9548', '1');
INSERT INTO `paises` VALUES ('184', 'VANUATU', '9551', '1');
INSERT INTO `paises` VALUES ('185', 'OMAN', '9556', '1');
INSERT INTO `paises` VALUES ('186', 'PACIFICO, ISLAS DEL', '9566', '1');
INSERT INTO `paises` VALUES ('187', 'PAISES BAJOS', '9573', '1');
INSERT INTO `paises` VALUES ('188', 'PAKISTAN', '9576', '1');
INSERT INTO `paises` VALUES ('189', 'PALAU, ISLAS', '9578', '1');
INSERT INTO `paises` VALUES ('190', 'TERRITORIO AUTONOMO DE PALESTINA.', '9579', '1');
INSERT INTO `paises` VALUES ('191', 'PANAMA', '9580', '1');
INSERT INTO `paises` VALUES ('192', 'PARAGUAY', '9586', '1');
INSERT INTO `paises` VALUES ('193', 'PERU', '9589', '1');
INSERT INTO `paises` VALUES ('194', 'PITCAIRN, ISLA', '9593', '1');
INSERT INTO `paises` VALUES ('195', 'POLINESIA FRANCESA', '9599', '1');
INSERT INTO `paises` VALUES ('196', 'POLONIA', '9603', '1');
INSERT INTO `paises` VALUES ('197', 'PORTUGAL', '9607', '1');
INSERT INTO `paises` VALUES ('198', 'PUERTO RICO', '9611', '1');
INSERT INTO `paises` VALUES ('199', 'QATAR', '9618', '1');
INSERT INTO `paises` VALUES ('200', 'REINO UNIDO', '9628', '1');
INSERT INTO `paises` VALUES ('201', 'ESCOCIA', '9629', '1');
INSERT INTO `paises` VALUES ('202', 'REPUBLICA ARABE UNIDA', '9633', '1');
INSERT INTO `paises` VALUES ('203', 'REPUBLICA CENTROAFRICANA', '9640', '1');
INSERT INTO `paises` VALUES ('204', 'REPUBLICA CHECA', '9644', '1');
INSERT INTO `paises` VALUES ('205', 'REPUBLICA DE SWAZILANDIA', '9645', '1');
INSERT INTO `paises` VALUES ('206', 'REPUBLICA DE TUNEZ', '9646', '1');
INSERT INTO `paises` VALUES ('207', 'REPUBLICA DOMINICANA', '9647', '1');
INSERT INTO `paises` VALUES ('208', 'REUNION', '9660', '1');
INSERT INTO `paises` VALUES ('209', 'ZIMBABWE', '9665', '1');
INSERT INTO `paises` VALUES ('210', 'RUMANIA', '9670', '1');
INSERT INTO `paises` VALUES ('211', 'RUANDA', '9675', '1');
INSERT INTO `paises` VALUES ('212', 'RUSIA', '9676', '1');
INSERT INTO `paises` VALUES ('213', 'SALOMON, ISLAS', '9677', '1');
INSERT INTO `paises` VALUES ('214', 'SAHARA OCCIDENTAL', '9685', '1');
INSERT INTO `paises` VALUES ('215', 'SAMOA OCCIDENTAL', '9687', '1');
INSERT INTO `paises` VALUES ('216', 'SAMOA NORTEAMERICANA', '9690', '1');
INSERT INTO `paises` VALUES ('217', 'SAN CRISTOBAL Y NIEVES', '9695', '1');
INSERT INTO `paises` VALUES ('218', 'SAN MARINO', '9697', '1');
INSERT INTO `paises` VALUES ('219', 'SAN PEDRO Y MIQUELON', '9700', '1');
INSERT INTO `paises` VALUES ('220', 'SAN VICENTE Y LAS GRANADINAS', '9705', '1');
INSERT INTO `paises` VALUES ('221', 'SANTA ELENA', '9710', '1');
INSERT INTO `paises` VALUES ('222', 'SANTA LUCIA', '9715', '1');
INSERT INTO `paises` VALUES ('223', 'SANTO TOME Y PRINCIPE', '9720', '1');
INSERT INTO `paises` VALUES ('224', 'SENEGAL', '9728', '1');
INSERT INTO `paises` VALUES ('225', 'SEYCHELLES', '9731', '1');
INSERT INTO `paises` VALUES ('226', 'SIERRA LEONA', '9735', '1');
INSERT INTO `paises` VALUES ('227', 'SINGAPUR', '9741', '1');
INSERT INTO `paises` VALUES ('228', 'SIRIA, REPUBLICA ARABE DE', '9744', '1');
INSERT INTO `paises` VALUES ('229', 'SOMALIA', '9748', '1');
INSERT INTO `paises` VALUES ('230', 'SRI LANKA', '9750', '1');
INSERT INTO `paises` VALUES ('231', 'SUDAFRICA, REPUBLICA DE', '9756', '1');
INSERT INTO `paises` VALUES ('232', 'SUDAN', '9759', '1');
INSERT INTO `paises` VALUES ('233', 'SUECIA', '9764', '1');
INSERT INTO `paises` VALUES ('234', 'SUIZA', '9767', '1');
INSERT INTO `paises` VALUES ('235', 'SURINAM', '9770', '1');
INSERT INTO `paises` VALUES ('236', 'SAWSILANDIA', '9773', '1');
INSERT INTO `paises` VALUES ('237', 'TADJIKISTAN', '9774', '1');
INSERT INTO `paises` VALUES ('238', 'TAILANDIA', '9776', '1');
INSERT INTO `paises` VALUES ('239', 'TANZANIA, REPUBLICA UNIDA DE', '9780', '1');
INSERT INTO `paises` VALUES ('240', 'DJIBOUTI', '9783', '1');
INSERT INTO `paises` VALUES ('241', 'TERRITORIO ANTARTICO BRITANICO', '9786', '1');
INSERT INTO `paises` VALUES ('242', 'TERRITORIO BRITANICO DEL OCEANO INDICO', '9787', '1');
INSERT INTO `paises` VALUES ('243', 'TIMOR DEL ESTE', '9788', '1');
INSERT INTO `paises` VALUES ('244', 'TOGO', '9800', '1');
INSERT INTO `paises` VALUES ('245', 'TOKELAU', '9805', '1');
INSERT INTO `paises` VALUES ('246', 'TONGA', '9810', '1');
INSERT INTO `paises` VALUES ('247', 'TRINIDAD Y TOBAGO', '9815', '1');
INSERT INTO `paises` VALUES ('248', 'TRISTAN DA CUNHA', '9816', '1');
INSERT INTO `paises` VALUES ('249', 'TUNICIA', '9820', '1');
INSERT INTO `paises` VALUES ('250', 'TURCAS Y CAICOS, ISLAS', '9823', '1');
INSERT INTO `paises` VALUES ('251', 'TURKMENISTAN', '9825', '1');
INSERT INTO `paises` VALUES ('252', 'TURQUIA', '9827', '1');
INSERT INTO `paises` VALUES ('253', 'TUVALU', '9828', '1');
INSERT INTO `paises` VALUES ('254', 'UCRANIA', '9830', '1');
INSERT INTO `paises` VALUES ('255', 'UGANDA', '9833', '1');
INSERT INTO `paises` VALUES ('256', 'URSS', '9840', '1');
INSERT INTO `paises` VALUES ('257', 'URUGUAY', '9845', '1');
INSERT INTO `paises` VALUES ('258', 'UZBEKISTAN', '9847', '1');
INSERT INTO `paises` VALUES ('259', 'VENEZUELA', '9850', '1');
INSERT INTO `paises` VALUES ('260', 'VIET NAM', '9855', '1');
INSERT INTO `paises` VALUES ('261', 'VIETNAM (DEL NORTE)', '9858', '1');
INSERT INTO `paises` VALUES ('262', 'VIRGENES, ISLAS (BRITANICAS)', '9863', '1');
INSERT INTO `paises` VALUES ('263', 'VIRGENES, ISLAS (NORTEAMERICANAS)', '9866', '1');
INSERT INTO `paises` VALUES ('264', 'FIJI', '9870', '1');
INSERT INTO `paises` VALUES ('265', 'WAKE, ISLA', '9873', '1');
INSERT INTO `paises` VALUES ('266', 'WALLIS Y FORTUNA, ISLAS', '9875', '1');
INSERT INTO `paises` VALUES ('267', 'YEMEN', '9880', '1');
INSERT INTO `paises` VALUES ('268', 'YUGOSLAVIA', '9885', '1');
INSERT INTO `paises` VALUES ('269', 'ZAIRE', '9888', '1');
INSERT INTO `paises` VALUES ('270', 'ZAMBIA', '9890', '1');
INSERT INTO `paises` VALUES ('271', 'ZONA DEL CANAL DE PANAMA', '9895', '1');
INSERT INTO `paises` VALUES ('272', 'ZONA LIBRE OSTRAVA', '9896', '1');
INSERT INTO `paises` VALUES ('273', 'ZONA NEUTRAL (PALESTINA)', '9897', '1');

-- ----------------------------
-- Table structure for `perfil`
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'ADMINISTRADOR', '1');
INSERT INTO `perfil` VALUES ('2', 'Cajero', '0');
INSERT INTO `perfil` VALUES ('3', 'Cajero', '0');
INSERT INTO `perfil` VALUES ('4', 'CAJERO', '1');
INSERT INTO `perfil` VALUES ('5', 'VENDEDOR', '1');
INSERT INTO `perfil` VALUES ('6', 'APROBAR', '0');

-- ----------------------------
-- Table structure for `permisos`
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id_perfil` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `estado` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`,`idmodulo`),
  KEY `permisos_idmodulo_fkey9` (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES ('1', '0', '1');
INSERT INTO `permisos` VALUES ('1', '1', '1');
INSERT INTO `permisos` VALUES ('1', '2', '1');
INSERT INTO `permisos` VALUES ('1', '3', '1');
INSERT INTO `permisos` VALUES ('1', '4', '1');
INSERT INTO `permisos` VALUES ('1', '5', '1');
INSERT INTO `permisos` VALUES ('1', '6', '1');
INSERT INTO `permisos` VALUES ('1', '8', '1');
INSERT INTO `permisos` VALUES ('1', '9', '1');
INSERT INTO `permisos` VALUES ('1', '10', '1');
INSERT INTO `permisos` VALUES ('1', '11', '1');
INSERT INTO `permisos` VALUES ('1', '13', '1');
INSERT INTO `permisos` VALUES ('1', '14', '1');
INSERT INTO `permisos` VALUES ('1', '15', '1');
INSERT INTO `permisos` VALUES ('1', '16', '1');
INSERT INTO `permisos` VALUES ('1', '18', '1');
INSERT INTO `permisos` VALUES ('1', '19', '1');
INSERT INTO `permisos` VALUES ('1', '20', '1');
INSERT INTO `permisos` VALUES ('1', '21', '1');
INSERT INTO `permisos` VALUES ('1', '23', '1');
INSERT INTO `permisos` VALUES ('1', '24', '1');
INSERT INTO `permisos` VALUES ('5', '23', '1');

-- ----------------------------
-- Table structure for `planilla_contable`
-- ----------------------------
DROP TABLE IF EXISTS `planilla_contable`;
CREATE TABLE `planilla_contable` (
  `descripcion` varchar(255) NOT NULL,
  `planilla_contable_ID` int(11) NOT NULL,
  `planilla_contable_FK` int(11) NOT NULL,
  PRIMARY KEY (`planilla_contable_ID`),
  KEY `FK_planilla_contable_ID69` (`planilla_contable_FK`),
  CONSTRAINT `FK_planilla_contable_ID69` FOREIGN KEY (`planilla_contable_FK`) REFERENCES `planilla_contable` (`planilla_contable_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planilla_contable
-- ----------------------------

-- ----------------------------
-- Table structure for `planilla_movimiento`
-- ----------------------------
DROP TABLE IF EXISTS `planilla_movimiento`;
CREATE TABLE `planilla_movimiento` (
  `descripcion` varchar(255) NOT NULL,
  `Planilla_movimiento_ID` int(11) NOT NULL,
  PRIMARY KEY (`Planilla_movimiento_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planilla_movimiento
-- ----------------------------

-- ----------------------------
-- Table structure for `tipo_movimiento`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_movimiento`;
CREATE TABLE `tipo_movimiento` (
  `descripcion` varchar(255) NOT NULL,
  `tipo_movimiento_ID` int(11) NOT NULL,
  PRIMARY KEY (`tipo_movimiento_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_movimiento
-- ----------------------------

-- ----------------------------
-- Table structure for `ubigeo`
-- ----------------------------
DROP TABLE IF EXISTS `ubigeo`;
CREATE TABLE `ubigeo` (
  `Ubigeo_ID` int(11) NOT NULL,
  `codigo_region` varchar(50) DEFAULT NULL,
  `codigo_provincia` varchar(50) DEFAULT NULL,
  `codigo_distrito` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `idpais` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ubigeo_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ubigeo
-- ----------------------------
INSERT INTO `ubigeo` VALUES ('0', '', '', '', '', '0');
INSERT INTO `ubigeo` VALUES ('1', '01', '00', '00', 'AMAZONAS', '193');
INSERT INTO `ubigeo` VALUES ('2', '01', '01', '00', 'CHACHAPOYAS', '193');
INSERT INTO `ubigeo` VALUES ('3', '01', '01', '01', 'CHACHAPOYAS', '193');
INSERT INTO `ubigeo` VALUES ('4', '01', '01', '02', 'ASUNCION', '193');
INSERT INTO `ubigeo` VALUES ('5', '01', '01', '03', 'BALSAS', '193');
INSERT INTO `ubigeo` VALUES ('6', '01', '01', '04', 'CHETO', '193');
INSERT INTO `ubigeo` VALUES ('7', '01', '01', '05', 'CHILIQUIN', '193');
INSERT INTO `ubigeo` VALUES ('8', '01', '01', '06', 'CHUQUIBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('9', '01', '01', '07', 'GRANADA', '193');
INSERT INTO `ubigeo` VALUES ('10', '01', '01', '08', 'HUANCAS', '193');
INSERT INTO `ubigeo` VALUES ('11', '01', '01', '09', 'LA JALCA', '193');
INSERT INTO `ubigeo` VALUES ('12', '01', '01', '10', 'LEIMEBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('13', '01', '01', '11', 'LEVANTO', '193');
INSERT INTO `ubigeo` VALUES ('14', '01', '01', '12', 'MAGDALENA', '193');
INSERT INTO `ubigeo` VALUES ('15', '01', '01', '13', 'MARISCAL CASTILLA', '193');
INSERT INTO `ubigeo` VALUES ('16', '01', '01', '14', 'MOLINOPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('17', '01', '01', '15', 'MONTEVIDEO', '193');
INSERT INTO `ubigeo` VALUES ('18', '01', '01', '16', 'OLLEROS', '193');
INSERT INTO `ubigeo` VALUES ('19', '01', '01', '17', 'QUINJALCA', '193');
INSERT INTO `ubigeo` VALUES ('20', '01', '01', '18', 'SAN FRANCISCO DE DAGUAS', '193');
INSERT INTO `ubigeo` VALUES ('21', '01', '01', '19', 'SAN ISIDRO DE MAINO', '193');
INSERT INTO `ubigeo` VALUES ('22', '01', '01', '20', 'SOLOCO', '193');
INSERT INTO `ubigeo` VALUES ('23', '01', '01', '21', 'SONCHE', '193');
INSERT INTO `ubigeo` VALUES ('24', '01', '02', '00', 'BAGUA', '193');
INSERT INTO `ubigeo` VALUES ('25', '01', '02', '01', 'BAGUA', '193');
INSERT INTO `ubigeo` VALUES ('26', '01', '02', '02', 'ARAMANGO', '193');
INSERT INTO `ubigeo` VALUES ('27', '01', '02', '03', 'COPALLIN', '193');
INSERT INTO `ubigeo` VALUES ('28', '01', '02', '04', 'EL PARCO', '193');
INSERT INTO `ubigeo` VALUES ('29', '01', '02', '05', 'IMAZA', '193');
INSERT INTO `ubigeo` VALUES ('30', '01', '02', '06', 'LA PECA', '193');
INSERT INTO `ubigeo` VALUES ('31', '01', '03', '00', 'BONGARA', '193');
INSERT INTO `ubigeo` VALUES ('32', '01', '03', '01', 'JUMBILLA', '193');
INSERT INTO `ubigeo` VALUES ('33', '01', '03', '02', 'CHISQUILLA', '193');
INSERT INTO `ubigeo` VALUES ('34', '01', '03', '03', 'CHURUJA', '193');
INSERT INTO `ubigeo` VALUES ('35', '01', '03', '04', 'COROSHA', '193');
INSERT INTO `ubigeo` VALUES ('36', '01', '03', '05', 'CUISPES', '193');
INSERT INTO `ubigeo` VALUES ('37', '01', '03', '06', 'FLORIDA', '193');
INSERT INTO `ubigeo` VALUES ('38', '01', '03', '07', 'JAZAN', '193');
INSERT INTO `ubigeo` VALUES ('39', '01', '03', '08', 'RECTA', '193');
INSERT INTO `ubigeo` VALUES ('40', '01', '03', '09', 'SAN CARLOS', '193');
INSERT INTO `ubigeo` VALUES ('41', '01', '03', '10', 'SHIPASBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('42', '01', '03', '11', 'VALERA', '193');
INSERT INTO `ubigeo` VALUES ('43', '01', '03', '12', 'YAMBRASBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('44', '01', '04', '00', 'CONDORCANQUI', '193');
INSERT INTO `ubigeo` VALUES ('45', '01', '04', '01', 'NIEVA', '193');
INSERT INTO `ubigeo` VALUES ('46', '01', '04', '02', 'EL CENEPA', '193');
INSERT INTO `ubigeo` VALUES ('47', '01', '04', '03', 'RIO SANTIAGO', '193');
INSERT INTO `ubigeo` VALUES ('48', '01', '05', '00', 'LUYA', '193');
INSERT INTO `ubigeo` VALUES ('49', '01', '05', '01', 'LAMUD', '193');
INSERT INTO `ubigeo` VALUES ('50', '01', '05', '02', 'CAMPORREDONDO', '193');
INSERT INTO `ubigeo` VALUES ('51', '01', '05', '03', 'COCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('52', '01', '05', '04', 'COLCAMAR', '193');
INSERT INTO `ubigeo` VALUES ('53', '01', '05', '05', 'CONILA', '193');
INSERT INTO `ubigeo` VALUES ('54', '01', '05', '06', 'INGUILPATA', '193');
INSERT INTO `ubigeo` VALUES ('55', '01', '05', '07', 'LONGUITA', '193');
INSERT INTO `ubigeo` VALUES ('56', '01', '05', '08', 'LONYA CHICO', '193');
INSERT INTO `ubigeo` VALUES ('57', '01', '05', '09', 'LUYA', '193');
INSERT INTO `ubigeo` VALUES ('58', '01', '05', '10', 'LUYA VIEJO', '193');
INSERT INTO `ubigeo` VALUES ('59', '01', '05', '11', 'MARIA', '193');
INSERT INTO `ubigeo` VALUES ('60', '01', '05', '12', 'OCALLI', '193');
INSERT INTO `ubigeo` VALUES ('61', '01', '05', '13', 'OCUMAL', '193');
INSERT INTO `ubigeo` VALUES ('62', '01', '05', '14', 'PISUQUIA', '193');
INSERT INTO `ubigeo` VALUES ('63', '01', '05', '15', 'PROVIDENCIA', '193');
INSERT INTO `ubigeo` VALUES ('64', '01', '05', '16', 'SAN CRISTOBAL', '193');
INSERT INTO `ubigeo` VALUES ('65', '01', '05', '17', 'SAN FRANCISCO DEL YESO', '193');
INSERT INTO `ubigeo` VALUES ('66', '01', '05', '18', 'SAN JERONIMO', '193');
INSERT INTO `ubigeo` VALUES ('67', '01', '05', '19', 'SAN JUAN DE LOPECANCHA', '193');
INSERT INTO `ubigeo` VALUES ('68', '01', '05', '20', 'SANTA CATALINA', '193');
INSERT INTO `ubigeo` VALUES ('69', '01', '05', '21', 'SANTO TOMAS', '193');
INSERT INTO `ubigeo` VALUES ('70', '01', '05', '22', 'TINGO', '193');
INSERT INTO `ubigeo` VALUES ('71', '01', '05', '23', 'TRITA', '193');
INSERT INTO `ubigeo` VALUES ('72', '01', '06', '00', 'RODRIGUEZ DE MENDOZA', '193');
INSERT INTO `ubigeo` VALUES ('73', '01', '06', '01', 'SAN NICOLAS', '193');
INSERT INTO `ubigeo` VALUES ('74', '01', '06', '02', 'CHIRIMOTO', '193');
INSERT INTO `ubigeo` VALUES ('75', '01', '06', '03', 'COCHAMAL', '193');
INSERT INTO `ubigeo` VALUES ('76', '01', '06', '04', 'HUAMBO', '193');
INSERT INTO `ubigeo` VALUES ('77', '01', '06', '05', 'LIMABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('78', '01', '06', '06', 'LONGAR', '193');
INSERT INTO `ubigeo` VALUES ('79', '01', '06', '07', 'MARISCAL BENAVIDES', '193');
INSERT INTO `ubigeo` VALUES ('80', '01', '06', '08', 'MILPUC', '193');
INSERT INTO `ubigeo` VALUES ('81', '01', '06', '09', 'OMIA', '193');
INSERT INTO `ubigeo` VALUES ('82', '01', '06', '10', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('83', '01', '06', '11', 'TOTORA', '193');
INSERT INTO `ubigeo` VALUES ('84', '01', '06', '12', 'VISTA ALEGRE', '193');
INSERT INTO `ubigeo` VALUES ('85', '01', '07', '00', 'UTCUBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('86', '01', '07', '01', 'BAGUA GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('87', '01', '07', '02', 'CAJARURO', '193');
INSERT INTO `ubigeo` VALUES ('88', '01', '07', '03', 'CUMBA', '193');
INSERT INTO `ubigeo` VALUES ('89', '01', '07', '04', 'EL MILAGRO', '193');
INSERT INTO `ubigeo` VALUES ('90', '01', '07', '05', 'JAMALCA', '193');
INSERT INTO `ubigeo` VALUES ('91', '01', '07', '06', 'LONYA GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('92', '01', '07', '07', 'YAMON', '193');
INSERT INTO `ubigeo` VALUES ('93', '02', '00', '00', 'ANCASH', '193');
INSERT INTO `ubigeo` VALUES ('94', '02', '01', '00', 'HUARAZ', '193');
INSERT INTO `ubigeo` VALUES ('95', '02', '01', '01', 'HUARAZ', '193');
INSERT INTO `ubigeo` VALUES ('96', '02', '01', '02', 'COCHABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('97', '02', '01', '03', 'COLCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('98', '02', '01', '04', 'HUANCHAY', '193');
INSERT INTO `ubigeo` VALUES ('99', '02', '01', '05', 'INDEPENDENCIA', '193');
INSERT INTO `ubigeo` VALUES ('100', '02', '01', '06', 'JANGAS', '193');
INSERT INTO `ubigeo` VALUES ('101', '02', '01', '07', 'LA LIBERTAD', '193');
INSERT INTO `ubigeo` VALUES ('102', '02', '01', '08', 'OLLEROS', '193');
INSERT INTO `ubigeo` VALUES ('103', '02', '01', '09', 'PAMPAS', '193');
INSERT INTO `ubigeo` VALUES ('104', '02', '01', '10', 'PARIACOTO', '193');
INSERT INTO `ubigeo` VALUES ('105', '02', '01', '11', 'PIRA', '193');
INSERT INTO `ubigeo` VALUES ('106', '02', '01', '12', 'TARICA', '193');
INSERT INTO `ubigeo` VALUES ('107', '02', '02', '00', 'AIJA', '193');
INSERT INTO `ubigeo` VALUES ('108', '02', '02', '01', 'AIJA', '193');
INSERT INTO `ubigeo` VALUES ('109', '02', '02', '02', 'CORIS', '193');
INSERT INTO `ubigeo` VALUES ('110', '02', '02', '03', 'HUACLLAN', '193');
INSERT INTO `ubigeo` VALUES ('111', '02', '02', '04', 'LA MERCED', '193');
INSERT INTO `ubigeo` VALUES ('112', '02', '02', '05', 'SUCCHA', '193');
INSERT INTO `ubigeo` VALUES ('113', '02', '03', '00', 'ANTONIO RAYMONDI', '193');
INSERT INTO `ubigeo` VALUES ('114', '02', '03', '01', 'LLAMELLIN', '193');
INSERT INTO `ubigeo` VALUES ('115', '02', '03', '02', 'ACZO', '193');
INSERT INTO `ubigeo` VALUES ('116', '02', '03', '03', 'CHACCHO', '193');
INSERT INTO `ubigeo` VALUES ('117', '02', '03', '04', 'CHINGAS', '193');
INSERT INTO `ubigeo` VALUES ('118', '02', '03', '05', 'MIRGAS', '193');
INSERT INTO `ubigeo` VALUES ('119', '02', '03', '06', 'SAN JUAN DE RONTOY', '193');
INSERT INTO `ubigeo` VALUES ('120', '02', '04', '00', 'ASUNCION', '193');
INSERT INTO `ubigeo` VALUES ('121', '02', '04', '01', 'CHACAS', '193');
INSERT INTO `ubigeo` VALUES ('122', '02', '04', '02', 'ACOCHACA', '193');
INSERT INTO `ubigeo` VALUES ('123', '02', '05', '00', 'BOLOGNESI', '193');
INSERT INTO `ubigeo` VALUES ('124', '02', '05', '01', 'CHIQUIAN', '193');
INSERT INTO `ubigeo` VALUES ('125', '02', '05', '02', 'ABELARDO PARDO LEZAMETA', '193');
INSERT INTO `ubigeo` VALUES ('126', '02', '05', '03', 'ANTONIO RAYMONDI', '193');
INSERT INTO `ubigeo` VALUES ('127', '02', '05', '04', 'AQUIA', '193');
INSERT INTO `ubigeo` VALUES ('128', '02', '05', '05', 'CAJACAY', '193');
INSERT INTO `ubigeo` VALUES ('129', '02', '05', '06', 'CANIS', '193');
INSERT INTO `ubigeo` VALUES ('130', '02', '05', '07', 'COLQUIOC', '193');
INSERT INTO `ubigeo` VALUES ('131', '02', '05', '08', 'HUALLANCA', '193');
INSERT INTO `ubigeo` VALUES ('132', '02', '05', '09', 'HUASTA', '193');
INSERT INTO `ubigeo` VALUES ('133', '02', '05', '10', 'HUAYLLACAYAN', '193');
INSERT INTO `ubigeo` VALUES ('134', '02', '05', '11', 'LA PRIMAVERA', '193');
INSERT INTO `ubigeo` VALUES ('135', '02', '05', '12', 'MANGAS', '193');
INSERT INTO `ubigeo` VALUES ('136', '02', '05', '13', 'PACLLON', '193');
INSERT INTO `ubigeo` VALUES ('137', '02', '05', '14', 'SAN MIGUEL DE CORPANQUI', '193');
INSERT INTO `ubigeo` VALUES ('138', '02', '05', '15', 'TICLLOS', '193');
INSERT INTO `ubigeo` VALUES ('139', '02', '06', '00', 'CARHUAZ', '193');
INSERT INTO `ubigeo` VALUES ('140', '02', '06', '01', 'CARHUAZ', '193');
INSERT INTO `ubigeo` VALUES ('141', '02', '06', '02', 'ACOPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('142', '02', '06', '03', 'AMASHCA', '193');
INSERT INTO `ubigeo` VALUES ('143', '02', '06', '04', 'ANTA', '193');
INSERT INTO `ubigeo` VALUES ('144', '02', '06', '05', 'ATAQUERO', '193');
INSERT INTO `ubigeo` VALUES ('145', '02', '06', '06', 'MARCARA', '193');
INSERT INTO `ubigeo` VALUES ('146', '02', '06', '07', 'PARIAHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('147', '02', '06', '08', 'SAN MIGUEL DE ACO', '193');
INSERT INTO `ubigeo` VALUES ('148', '02', '06', '09', 'SHILLA', '193');
INSERT INTO `ubigeo` VALUES ('149', '02', '06', '10', 'TINCO', '193');
INSERT INTO `ubigeo` VALUES ('150', '02', '06', '11', 'YUNGAR', '193');
INSERT INTO `ubigeo` VALUES ('151', '02', '07', '00', 'CARLOS FERMIN FITZCARRALD', '193');
INSERT INTO `ubigeo` VALUES ('152', '02', '07', '01', 'SAN LUIS', '193');
INSERT INTO `ubigeo` VALUES ('153', '02', '07', '02', 'SAN NICOLAS', '193');
INSERT INTO `ubigeo` VALUES ('154', '02', '07', '03', 'YAUYA', '193');
INSERT INTO `ubigeo` VALUES ('155', '02', '08', '00', 'CASMA', '193');
INSERT INTO `ubigeo` VALUES ('156', '02', '08', '01', 'CASMA', '193');
INSERT INTO `ubigeo` VALUES ('157', '02', '08', '02', 'BUENA VISTA ALTA', '193');
INSERT INTO `ubigeo` VALUES ('158', '02', '08', '03', 'COMANDANTE NOEL', '193');
INSERT INTO `ubigeo` VALUES ('159', '02', '08', '04', 'YAUTAN', '193');
INSERT INTO `ubigeo` VALUES ('160', '02', '09', '00', 'CORONGO', '193');
INSERT INTO `ubigeo` VALUES ('161', '02', '09', '01', 'CORONGO', '193');
INSERT INTO `ubigeo` VALUES ('162', '02', '09', '02', 'ACO', '193');
INSERT INTO `ubigeo` VALUES ('163', '02', '09', '03', 'BAMBAS', '193');
INSERT INTO `ubigeo` VALUES ('164', '02', '09', '04', 'CUSCA', '193');
INSERT INTO `ubigeo` VALUES ('165', '02', '09', '05', 'LA PAMPA', '193');
INSERT INTO `ubigeo` VALUES ('166', '02', '09', '06', 'YANAC', '193');
INSERT INTO `ubigeo` VALUES ('167', '02', '09', '07', 'YUPAN', '193');
INSERT INTO `ubigeo` VALUES ('168', '02', '10', '00', 'HUARI', '193');
INSERT INTO `ubigeo` VALUES ('169', '02', '10', '01', 'HUARI', '193');
INSERT INTO `ubigeo` VALUES ('170', '02', '10', '02', 'ANRA', '193');
INSERT INTO `ubigeo` VALUES ('171', '02', '10', '03', 'CAJAY', '193');
INSERT INTO `ubigeo` VALUES ('172', '02', '10', '04', 'CHAVIN DE HUANTAR', '193');
INSERT INTO `ubigeo` VALUES ('173', '02', '10', '05', 'HUACACHI', '193');
INSERT INTO `ubigeo` VALUES ('174', '02', '10', '06', 'HUACCHIS', '193');
INSERT INTO `ubigeo` VALUES ('175', '02', '10', '07', 'HUACHIS', '193');
INSERT INTO `ubigeo` VALUES ('176', '02', '10', '08', 'HUANTAR', '193');
INSERT INTO `ubigeo` VALUES ('177', '02', '10', '09', 'MASIN', '193');
INSERT INTO `ubigeo` VALUES ('178', '02', '10', '10', 'PAUCAS', '193');
INSERT INTO `ubigeo` VALUES ('179', '02', '10', '11', 'PONTO', '193');
INSERT INTO `ubigeo` VALUES ('180', '02', '10', '12', 'RAHUAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('181', '02', '10', '13', 'RAPAYAN', '193');
INSERT INTO `ubigeo` VALUES ('182', '02', '10', '14', 'SAN MARCOS', '193');
INSERT INTO `ubigeo` VALUES ('183', '02', '10', '15', 'SAN PEDRO DE CHANA', '193');
INSERT INTO `ubigeo` VALUES ('184', '02', '10', '16', 'UCO', '193');
INSERT INTO `ubigeo` VALUES ('185', '02', '11', '00', 'HUARMEY', '193');
INSERT INTO `ubigeo` VALUES ('186', '02', '11', '01', 'HUARMEY', '193');
INSERT INTO `ubigeo` VALUES ('187', '02', '11', '02', 'COCHAPETI', '193');
INSERT INTO `ubigeo` VALUES ('188', '02', '11', '03', 'CULEBRAS', '193');
INSERT INTO `ubigeo` VALUES ('189', '02', '11', '04', 'HUAYAN', '193');
INSERT INTO `ubigeo` VALUES ('190', '02', '11', '05', 'MALVAS', '193');
INSERT INTO `ubigeo` VALUES ('191', '02', '12', '00', 'HUAYLAS', '193');
INSERT INTO `ubigeo` VALUES ('192', '02', '12', '01', 'CARAZ', '193');
INSERT INTO `ubigeo` VALUES ('193', '02', '12', '02', 'HUALLANCA', '193');
INSERT INTO `ubigeo` VALUES ('194', '02', '12', '03', 'HUATA', '193');
INSERT INTO `ubigeo` VALUES ('195', '02', '12', '04', 'HUAYLAS', '193');
INSERT INTO `ubigeo` VALUES ('196', '02', '12', '05', 'MATO', '193');
INSERT INTO `ubigeo` VALUES ('197', '02', '12', '06', 'PAMPAROMAS', '193');
INSERT INTO `ubigeo` VALUES ('198', '02', '12', '07', 'PUEBLO LIBRE', '193');
INSERT INTO `ubigeo` VALUES ('199', '02', '12', '08', 'SANTA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('200', '02', '12', '09', 'SANTO TORIBIO', '193');
INSERT INTO `ubigeo` VALUES ('201', '02', '12', '10', 'YURACMARCA', '193');
INSERT INTO `ubigeo` VALUES ('202', '02', '13', '00', 'MARISCAL LUZURIAGA', '193');
INSERT INTO `ubigeo` VALUES ('203', '02', '13', '01', 'PISCOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('204', '02', '13', '02', 'CASCA', '193');
INSERT INTO `ubigeo` VALUES ('205', '02', '13', '03', 'ELEAZAR GUZMAN BARRON', '193');
INSERT INTO `ubigeo` VALUES ('206', '02', '13', '04', 'FIDEL OLIVAS ESCUDERO', '193');
INSERT INTO `ubigeo` VALUES ('207', '02', '13', '05', 'LLAMA', '193');
INSERT INTO `ubigeo` VALUES ('208', '02', '13', '06', 'LLUMPA', '193');
INSERT INTO `ubigeo` VALUES ('209', '02', '13', '07', 'LUCMA', '193');
INSERT INTO `ubigeo` VALUES ('210', '02', '13', '08', 'MUSGA', '193');
INSERT INTO `ubigeo` VALUES ('211', '02', '14', '00', 'OCROS', '193');
INSERT INTO `ubigeo` VALUES ('212', '02', '14', '01', 'OCROS', '193');
INSERT INTO `ubigeo` VALUES ('213', '02', '14', '02', 'ACAS', '193');
INSERT INTO `ubigeo` VALUES ('214', '02', '14', '03', 'CAJAMARQUILLA', '193');
INSERT INTO `ubigeo` VALUES ('215', '02', '14', '04', 'CARHUAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('216', '02', '14', '05', 'COCHAS', '193');
INSERT INTO `ubigeo` VALUES ('217', '02', '14', '06', 'CONGAS', '193');
INSERT INTO `ubigeo` VALUES ('218', '02', '14', '07', 'LLIPA', '193');
INSERT INTO `ubigeo` VALUES ('219', '02', '14', '08', 'SAN CRISTOBAL DE RAJAN', '193');
INSERT INTO `ubigeo` VALUES ('220', '02', '14', '09', 'SAN PEDRO', '193');
INSERT INTO `ubigeo` VALUES ('221', '02', '14', '10', 'SANTIAGO DE CHILCAS', '193');
INSERT INTO `ubigeo` VALUES ('222', '02', '15', '00', 'PALLASCA', '193');
INSERT INTO `ubigeo` VALUES ('223', '02', '15', '01', 'CABANA', '193');
INSERT INTO `ubigeo` VALUES ('224', '02', '15', '02', 'BOLOGNESI', '193');
INSERT INTO `ubigeo` VALUES ('225', '02', '15', '03', 'CONCHUCOS', '193');
INSERT INTO `ubigeo` VALUES ('226', '02', '15', '04', 'HUACASCHUQUE', '193');
INSERT INTO `ubigeo` VALUES ('227', '02', '15', '05', 'HUANDOVAL', '193');
INSERT INTO `ubigeo` VALUES ('228', '02', '15', '06', 'LACABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('229', '02', '15', '07', 'LLAPO', '193');
INSERT INTO `ubigeo` VALUES ('230', '02', '15', '08', 'PALLASCA', '193');
INSERT INTO `ubigeo` VALUES ('231', '02', '15', '09', 'PAMPAS', '193');
INSERT INTO `ubigeo` VALUES ('232', '02', '15', '10', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('233', '02', '15', '11', 'TAUCA', '193');
INSERT INTO `ubigeo` VALUES ('234', '02', '16', '00', 'POMABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('235', '02', '16', '01', 'POMABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('236', '02', '16', '02', 'HUAYLLAN', '193');
INSERT INTO `ubigeo` VALUES ('237', '02', '16', '03', 'PAROBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('238', '02', '16', '04', 'QUINUABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('239', '02', '17', '00', 'RECUAY', '193');
INSERT INTO `ubigeo` VALUES ('240', '02', '17', '01', 'RECUAY', '193');
INSERT INTO `ubigeo` VALUES ('241', '02', '17', '02', 'CATAC', '193');
INSERT INTO `ubigeo` VALUES ('242', '02', '17', '03', 'COTAPARACO', '193');
INSERT INTO `ubigeo` VALUES ('243', '02', '17', '04', 'HUAYLLAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('244', '02', '17', '05', 'LLACLLIN', '193');
INSERT INTO `ubigeo` VALUES ('245', '02', '17', '06', 'MARCA', '193');
INSERT INTO `ubigeo` VALUES ('246', '02', '17', '07', 'PAMPAS CHICO', '193');
INSERT INTO `ubigeo` VALUES ('247', '02', '17', '08', 'PARARIN', '193');
INSERT INTO `ubigeo` VALUES ('248', '02', '17', '09', 'TAPACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('249', '02', '17', '10', 'TICAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('250', '02', '18', '00', 'SANTA', '193');
INSERT INTO `ubigeo` VALUES ('251', '02', '18', '01', 'CHIMBOTE', '193');
INSERT INTO `ubigeo` VALUES ('252', '02', '18', '02', 'CACERES DEL PERU', '193');
INSERT INTO `ubigeo` VALUES ('253', '02', '18', '03', 'COISHCO', '193');
INSERT INTO `ubigeo` VALUES ('254', '02', '18', '04', 'MACATE', '193');
INSERT INTO `ubigeo` VALUES ('255', '02', '18', '05', 'MORO', '193');
INSERT INTO `ubigeo` VALUES ('256', '02', '18', '06', 'NEPEÑA', '193');
INSERT INTO `ubigeo` VALUES ('257', '02', '18', '07', 'SAMANCO', '193');
INSERT INTO `ubigeo` VALUES ('258', '02', '18', '08', 'SANTA', '193');
INSERT INTO `ubigeo` VALUES ('259', '02', '18', '09', 'NUEVO CHIMBOTE', '193');
INSERT INTO `ubigeo` VALUES ('260', '02', '19', '00', 'SIHUAS', '193');
INSERT INTO `ubigeo` VALUES ('261', '02', '19', '01', 'SIHUAS', '193');
INSERT INTO `ubigeo` VALUES ('262', '02', '19', '02', 'ACOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('263', '02', '19', '03', 'ALFONSO UGARTE', '193');
INSERT INTO `ubigeo` VALUES ('264', '02', '19', '04', 'CASHAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('265', '02', '19', '05', 'CHINGALPO', '193');
INSERT INTO `ubigeo` VALUES ('266', '02', '19', '06', 'HUAYLLABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('267', '02', '19', '07', 'QUICHES', '193');
INSERT INTO `ubigeo` VALUES ('268', '02', '19', '08', 'RAGASH', '193');
INSERT INTO `ubigeo` VALUES ('269', '02', '19', '09', 'SAN JUAN', '193');
INSERT INTO `ubigeo` VALUES ('270', '02', '19', '10', 'SICSIBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('271', '02', '20', '00', 'YUNGAY', '193');
INSERT INTO `ubigeo` VALUES ('272', '02', '20', '01', 'YUNGAY', '193');
INSERT INTO `ubigeo` VALUES ('273', '02', '20', '02', 'CASCAPARA', '193');
INSERT INTO `ubigeo` VALUES ('274', '02', '20', '03', 'MANCOS', '193');
INSERT INTO `ubigeo` VALUES ('275', '02', '20', '04', 'MATACOTO', '193');
INSERT INTO `ubigeo` VALUES ('276', '02', '20', '05', 'QUILLO', '193');
INSERT INTO `ubigeo` VALUES ('277', '02', '20', '06', 'RANRAHIRCA', '193');
INSERT INTO `ubigeo` VALUES ('278', '02', '20', '07', 'SHUPLUY', '193');
INSERT INTO `ubigeo` VALUES ('279', '02', '20', '08', 'YANAMA', '193');
INSERT INTO `ubigeo` VALUES ('280', '03', '00', '00', 'APURIMAC', '193');
INSERT INTO `ubigeo` VALUES ('281', '03', '01', '00', 'ABANCAY', '193');
INSERT INTO `ubigeo` VALUES ('282', '03', '01', '01', 'ABANCAY', '193');
INSERT INTO `ubigeo` VALUES ('283', '03', '01', '02', 'CHACOCHE', '193');
INSERT INTO `ubigeo` VALUES ('284', '03', '01', '03', 'CIRCA', '193');
INSERT INTO `ubigeo` VALUES ('285', '03', '01', '04', 'CURAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('286', '03', '01', '05', 'HUANIPACA', '193');
INSERT INTO `ubigeo` VALUES ('287', '03', '01', '06', 'LAMBRAMA', '193');
INSERT INTO `ubigeo` VALUES ('288', '03', '01', '07', 'PICHIRHUA', '193');
INSERT INTO `ubigeo` VALUES ('289', '03', '01', '08', 'SAN PEDRO DE CACHORA', '193');
INSERT INTO `ubigeo` VALUES ('290', '03', '01', '09', 'TAMBURCO', '193');
INSERT INTO `ubigeo` VALUES ('291', '03', '02', '00', 'ANDAHUAYLAS', '193');
INSERT INTO `ubigeo` VALUES ('292', '03', '02', '01', 'ANDAHUAYLAS', '193');
INSERT INTO `ubigeo` VALUES ('293', '03', '02', '02', 'ANDARAPA', '193');
INSERT INTO `ubigeo` VALUES ('294', '03', '02', '03', 'CHIARA', '193');
INSERT INTO `ubigeo` VALUES ('295', '03', '02', '04', 'HUANCARAMA', '193');
INSERT INTO `ubigeo` VALUES ('296', '03', '02', '05', 'HUANCARAY', '193');
INSERT INTO `ubigeo` VALUES ('297', '03', '02', '06', 'HUAYANA', '193');
INSERT INTO `ubigeo` VALUES ('298', '03', '02', '07', 'KISHUARA', '193');
INSERT INTO `ubigeo` VALUES ('299', '03', '02', '08', 'PACOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('300', '03', '02', '09', 'PACUCHA', '193');
INSERT INTO `ubigeo` VALUES ('301', '03', '02', '10', 'PAMPACHIRI', '193');
INSERT INTO `ubigeo` VALUES ('302', '03', '02', '11', 'POMACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('303', '03', '02', '12', 'SAN ANTONIO DE CACHI', '193');
INSERT INTO `ubigeo` VALUES ('304', '03', '02', '13', 'SAN JERONIMO', '193');
INSERT INTO `ubigeo` VALUES ('305', '03', '02', '14', 'SAN MIGUEL DE CHACCRAMPA', '193');
INSERT INTO `ubigeo` VALUES ('306', '03', '02', '15', 'SANTA MARIA DE CHICMO', '193');
INSERT INTO `ubigeo` VALUES ('307', '03', '02', '16', 'TALAVERA', '193');
INSERT INTO `ubigeo` VALUES ('308', '03', '02', '17', 'TUMAY HUARACA', '193');
INSERT INTO `ubigeo` VALUES ('309', '03', '02', '18', 'TURPO', '193');
INSERT INTO `ubigeo` VALUES ('310', '03', '02', '19', 'KAQUIABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('311', '03', '03', '00', 'ANTABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('312', '03', '03', '01', 'ANTABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('313', '03', '03', '02', 'EL ORO', '193');
INSERT INTO `ubigeo` VALUES ('314', '03', '03', '03', 'HUAQUIRCA', '193');
INSERT INTO `ubigeo` VALUES ('315', '03', '03', '04', 'JUAN ESPINOZA MEDRANO', '193');
INSERT INTO `ubigeo` VALUES ('316', '03', '03', '05', 'OROPESA', '193');
INSERT INTO `ubigeo` VALUES ('317', '03', '03', '06', 'PACHACONAS', '193');
INSERT INTO `ubigeo` VALUES ('318', '03', '03', '07', 'SABAINO', '193');
INSERT INTO `ubigeo` VALUES ('319', '03', '04', '00', 'AYMARAES', '193');
INSERT INTO `ubigeo` VALUES ('320', '03', '04', '01', 'CHALHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('321', '03', '04', '02', 'CAPAYA', '193');
INSERT INTO `ubigeo` VALUES ('322', '03', '04', '03', 'CARAYBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('323', '03', '04', '04', 'CHAPIMARCA', '193');
INSERT INTO `ubigeo` VALUES ('324', '03', '04', '05', 'COLCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('325', '03', '04', '06', 'COTARUSE', '193');
INSERT INTO `ubigeo` VALUES ('326', '03', '04', '07', 'HUAYLLO', '193');
INSERT INTO `ubigeo` VALUES ('327', '03', '04', '08', 'JUSTO APU SAHUARAURA', '193');
INSERT INTO `ubigeo` VALUES ('328', '03', '04', '09', 'LUCRE', '193');
INSERT INTO `ubigeo` VALUES ('329', '03', '04', '10', 'POCOHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('330', '03', '04', '11', 'SAN JUAN DE CHACÑA', '193');
INSERT INTO `ubigeo` VALUES ('331', '03', '04', '12', 'SAÑAYCA', '193');
INSERT INTO `ubigeo` VALUES ('332', '03', '04', '13', 'SORAYA', '193');
INSERT INTO `ubigeo` VALUES ('333', '03', '04', '14', 'TAPAIRIHUA', '193');
INSERT INTO `ubigeo` VALUES ('334', '03', '04', '15', 'TINTAY', '193');
INSERT INTO `ubigeo` VALUES ('335', '03', '04', '16', 'TORAYA', '193');
INSERT INTO `ubigeo` VALUES ('336', '03', '04', '17', 'YANACA', '193');
INSERT INTO `ubigeo` VALUES ('337', '03', '05', '00', 'COTABAMBAS', '193');
INSERT INTO `ubigeo` VALUES ('338', '03', '05', '01', 'TAMBOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('339', '03', '05', '02', 'COTABAMBAS', '193');
INSERT INTO `ubigeo` VALUES ('340', '03', '05', '03', 'COYLLURQUI', '193');
INSERT INTO `ubigeo` VALUES ('341', '03', '05', '04', 'HAQUIRA', '193');
INSERT INTO `ubigeo` VALUES ('342', '03', '05', '05', 'MARA', '193');
INSERT INTO `ubigeo` VALUES ('343', '03', '05', '06', 'CHALLHUAHUACHO', '193');
INSERT INTO `ubigeo` VALUES ('344', '03', '06', '00', 'CHINCHEROS', '193');
INSERT INTO `ubigeo` VALUES ('345', '03', '06', '01', 'CHINCHEROS', '193');
INSERT INTO `ubigeo` VALUES ('346', '03', '06', '02', 'ANCO_HUALLO', '193');
INSERT INTO `ubigeo` VALUES ('347', '03', '06', '03', 'COCHARCAS', '193');
INSERT INTO `ubigeo` VALUES ('348', '03', '06', '04', 'HUACCANA', '193');
INSERT INTO `ubigeo` VALUES ('349', '03', '06', '05', 'OCOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('350', '03', '06', '06', 'ONGOY', '193');
INSERT INTO `ubigeo` VALUES ('351', '03', '06', '07', 'URANMARCA', '193');
INSERT INTO `ubigeo` VALUES ('352', '03', '06', '08', 'RANRACANCHA', '193');
INSERT INTO `ubigeo` VALUES ('353', '03', '07', '00', 'GRAU', '193');
INSERT INTO `ubigeo` VALUES ('354', '03', '07', '01', 'CHUQUIBAMBILLA', '193');
INSERT INTO `ubigeo` VALUES ('355', '03', '07', '02', 'CURPAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('356', '03', '07', '03', 'GAMARRA', '193');
INSERT INTO `ubigeo` VALUES ('357', '03', '07', '04', 'HUAYLLATI', '193');
INSERT INTO `ubigeo` VALUES ('358', '03', '07', '05', 'MAMARA', '193');
INSERT INTO `ubigeo` VALUES ('359', '03', '07', '06', 'MICAELA BASTIDAS', '193');
INSERT INTO `ubigeo` VALUES ('360', '03', '07', '07', 'PATAYPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('361', '03', '07', '08', 'PROGRESO', '193');
INSERT INTO `ubigeo` VALUES ('362', '03', '07', '09', 'SAN ANTONIO', '193');
INSERT INTO `ubigeo` VALUES ('363', '03', '07', '10', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('364', '03', '07', '11', 'TURPAY', '193');
INSERT INTO `ubigeo` VALUES ('365', '03', '07', '12', 'VILCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('366', '03', '07', '13', 'VIRUNDO', '193');
INSERT INTO `ubigeo` VALUES ('367', '03', '07', '14', 'CURASCO', '193');
INSERT INTO `ubigeo` VALUES ('368', '04', '00', '00', 'AREQUIPA', '193');
INSERT INTO `ubigeo` VALUES ('369', '04', '01', '00', 'AREQUIPA', '193');
INSERT INTO `ubigeo` VALUES ('370', '04', '01', '01', 'AREQUIPA', '193');
INSERT INTO `ubigeo` VALUES ('371', '04', '01', '02', 'ALTO SELVA ALEGRE', '193');
INSERT INTO `ubigeo` VALUES ('372', '04', '01', '03', 'CAYMA', '193');
INSERT INTO `ubigeo` VALUES ('373', '04', '01', '04', 'CERRO COLORADO', '193');
INSERT INTO `ubigeo` VALUES ('374', '04', '01', '05', 'CHARACATO', '193');
INSERT INTO `ubigeo` VALUES ('375', '04', '01', '06', 'CHIGUATA', '193');
INSERT INTO `ubigeo` VALUES ('376', '04', '01', '07', 'JACOBO HUNTER', '193');
INSERT INTO `ubigeo` VALUES ('377', '04', '01', '08', 'LA JOYA', '193');
INSERT INTO `ubigeo` VALUES ('378', '04', '01', '09', 'MARIANO MELGAR', '193');
INSERT INTO `ubigeo` VALUES ('379', '04', '01', '10', 'MIRAFLORES', '193');
INSERT INTO `ubigeo` VALUES ('380', '04', '01', '11', 'MOLLEBAYA', '193');
INSERT INTO `ubigeo` VALUES ('381', '04', '01', '12', 'PAUCARPATA', '193');
INSERT INTO `ubigeo` VALUES ('382', '04', '01', '13', 'POCSI', '193');
INSERT INTO `ubigeo` VALUES ('383', '04', '01', '14', 'POLOBAYA', '193');
INSERT INTO `ubigeo` VALUES ('384', '04', '01', '15', 'QUEQUEÑA', '193');
INSERT INTO `ubigeo` VALUES ('385', '04', '01', '16', 'SABANDIA', '193');
INSERT INTO `ubigeo` VALUES ('386', '04', '01', '17', 'SACHACA', '193');
INSERT INTO `ubigeo` VALUES ('387', '04', '01', '18', 'SAN JUAN DE SIGUAS', '193');
INSERT INTO `ubigeo` VALUES ('388', '04', '01', '19', 'SAN JUAN DE TARUCANI', '193');
INSERT INTO `ubigeo` VALUES ('389', '04', '01', '20', 'SANTA ISABEL DE SIGUAS', '193');
INSERT INTO `ubigeo` VALUES ('390', '04', '01', '21', 'SANTA RITA DE SIGUAS', '193');
INSERT INTO `ubigeo` VALUES ('391', '04', '01', '22', 'SOCABAYA', '193');
INSERT INTO `ubigeo` VALUES ('392', '04', '01', '23', 'TIABAYA', '193');
INSERT INTO `ubigeo` VALUES ('393', '04', '01', '24', 'UCHUMAYO', '193');
INSERT INTO `ubigeo` VALUES ('394', '04', '01', '25', 'VITOR', '193');
INSERT INTO `ubigeo` VALUES ('395', '04', '01', '26', 'YANAHUARA', '193');
INSERT INTO `ubigeo` VALUES ('396', '04', '01', '27', 'YARABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('397', '04', '01', '28', 'YURA', '193');
INSERT INTO `ubigeo` VALUES ('398', '04', '01', '29', 'JOSE LUIS BUSTAMANTE Y RIVERO', '193');
INSERT INTO `ubigeo` VALUES ('399', '04', '02', '00', 'CAMANA', '193');
INSERT INTO `ubigeo` VALUES ('400', '04', '02', '01', 'CAMANA', '193');
INSERT INTO `ubigeo` VALUES ('401', '04', '02', '02', 'JOSE MARIA QUIMPER', '193');
INSERT INTO `ubigeo` VALUES ('402', '04', '02', '03', 'MARIANO NICOLAS VALCARCEL', '193');
INSERT INTO `ubigeo` VALUES ('403', '04', '02', '04', 'MARISCAL CACERES', '193');
INSERT INTO `ubigeo` VALUES ('404', '04', '02', '05', 'NICOLAS DE PIEROLA', '193');
INSERT INTO `ubigeo` VALUES ('405', '04', '02', '06', 'OCOÑA', '193');
INSERT INTO `ubigeo` VALUES ('406', '04', '02', '07', 'QUILCA', '193');
INSERT INTO `ubigeo` VALUES ('407', '04', '02', '08', 'SAMUEL PASTOR', '193');
INSERT INTO `ubigeo` VALUES ('408', '04', '03', '00', 'CARAVELI', '193');
INSERT INTO `ubigeo` VALUES ('409', '04', '03', '01', 'CARAVELI', '193');
INSERT INTO `ubigeo` VALUES ('410', '04', '03', '02', 'ACARI', '193');
INSERT INTO `ubigeo` VALUES ('411', '04', '03', '03', 'ATICO', '193');
INSERT INTO `ubigeo` VALUES ('412', '04', '03', '04', 'ATIQUIPA', '193');
INSERT INTO `ubigeo` VALUES ('413', '04', '03', '05', 'BELLA UNION', '193');
INSERT INTO `ubigeo` VALUES ('414', '04', '03', '06', 'CAHUACHO', '193');
INSERT INTO `ubigeo` VALUES ('415', '04', '03', '07', 'CHALA', '193');
INSERT INTO `ubigeo` VALUES ('416', '04', '03', '08', 'CHAPARRA', '193');
INSERT INTO `ubigeo` VALUES ('417', '04', '03', '09', 'HUANUHUANU', '193');
INSERT INTO `ubigeo` VALUES ('418', '04', '03', '10', 'JAQUI', '193');
INSERT INTO `ubigeo` VALUES ('419', '04', '03', '11', 'LOMAS', '193');
INSERT INTO `ubigeo` VALUES ('420', '04', '03', '12', 'QUICACHA', '193');
INSERT INTO `ubigeo` VALUES ('421', '04', '03', '13', 'YAUCA', '193');
INSERT INTO `ubigeo` VALUES ('422', '04', '04', '00', 'CASTILLA', '193');
INSERT INTO `ubigeo` VALUES ('423', '04', '04', '01', 'APLAO', '193');
INSERT INTO `ubigeo` VALUES ('424', '04', '04', '02', 'ANDAGUA', '193');
INSERT INTO `ubigeo` VALUES ('425', '04', '04', '03', 'AYO', '193');
INSERT INTO `ubigeo` VALUES ('426', '04', '04', '04', 'CHACHAS', '193');
INSERT INTO `ubigeo` VALUES ('427', '04', '04', '05', 'CHILCAYMARCA', '193');
INSERT INTO `ubigeo` VALUES ('428', '04', '04', '06', 'CHOCO', '193');
INSERT INTO `ubigeo` VALUES ('429', '04', '04', '07', 'HUANCARQUI', '193');
INSERT INTO `ubigeo` VALUES ('430', '04', '04', '08', 'MACHAGUAY', '193');
INSERT INTO `ubigeo` VALUES ('431', '04', '04', '09', 'ORCOPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('432', '04', '04', '10', 'PAMPACOLCA', '193');
INSERT INTO `ubigeo` VALUES ('433', '04', '04', '11', 'TIPAN', '193');
INSERT INTO `ubigeo` VALUES ('434', '04', '04', '12', 'UÑON', '193');
INSERT INTO `ubigeo` VALUES ('435', '04', '04', '13', 'URACA', '193');
INSERT INTO `ubigeo` VALUES ('436', '04', '04', '14', 'VIRACO', '193');
INSERT INTO `ubigeo` VALUES ('437', '04', '05', '00', 'CAYLLOMA', '193');
INSERT INTO `ubigeo` VALUES ('438', '04', '05', '01', 'CHIVAY', '193');
INSERT INTO `ubigeo` VALUES ('439', '04', '05', '02', 'ACHOMA', '193');
INSERT INTO `ubigeo` VALUES ('440', '04', '05', '03', 'CABANACONDE', '193');
INSERT INTO `ubigeo` VALUES ('441', '04', '05', '04', 'CALLALLI', '193');
INSERT INTO `ubigeo` VALUES ('442', '04', '05', '05', 'CAYLLOMA', '193');
INSERT INTO `ubigeo` VALUES ('443', '04', '05', '06', 'COPORAQUE', '193');
INSERT INTO `ubigeo` VALUES ('444', '04', '05', '07', 'HUAMBO', '193');
INSERT INTO `ubigeo` VALUES ('445', '04', '05', '08', 'HUANCA', '193');
INSERT INTO `ubigeo` VALUES ('446', '04', '05', '09', 'ICHUPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('447', '04', '05', '10', 'LARI', '193');
INSERT INTO `ubigeo` VALUES ('448', '04', '05', '11', 'LLUTA', '193');
INSERT INTO `ubigeo` VALUES ('449', '04', '05', '12', 'MACA', '193');
INSERT INTO `ubigeo` VALUES ('450', '04', '05', '13', 'MADRIGAL', '193');
INSERT INTO `ubigeo` VALUES ('451', '04', '05', '14', 'SAN ANTONIO DE CHUCA', '193');
INSERT INTO `ubigeo` VALUES ('452', '04', '05', '15', 'SIBAYO', '193');
INSERT INTO `ubigeo` VALUES ('453', '04', '05', '16', 'TAPAY', '193');
INSERT INTO `ubigeo` VALUES ('454', '04', '05', '17', 'TISCO', '193');
INSERT INTO `ubigeo` VALUES ('455', '04', '05', '18', 'TUTI', '193');
INSERT INTO `ubigeo` VALUES ('456', '04', '05', '19', 'YANQUE', '193');
INSERT INTO `ubigeo` VALUES ('457', '04', '05', '20', 'MAJES', '193');
INSERT INTO `ubigeo` VALUES ('458', '04', '06', '00', 'CONDESUYOS', '193');
INSERT INTO `ubigeo` VALUES ('459', '04', '06', '01', 'CHUQUIBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('460', '04', '06', '02', 'ANDARAY', '193');
INSERT INTO `ubigeo` VALUES ('461', '04', '06', '03', 'CAYARANI', '193');
INSERT INTO `ubigeo` VALUES ('462', '04', '06', '04', 'CHICHAS', '193');
INSERT INTO `ubigeo` VALUES ('463', '04', '06', '05', 'IRAY', '193');
INSERT INTO `ubigeo` VALUES ('464', '04', '06', '06', 'RIO GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('465', '04', '06', '07', 'SALAMANCA', '193');
INSERT INTO `ubigeo` VALUES ('466', '04', '06', '08', 'YANAQUIHUA', '193');
INSERT INTO `ubigeo` VALUES ('467', '04', '07', '00', 'ISLAY', '193');
INSERT INTO `ubigeo` VALUES ('468', '04', '07', '01', 'MOLLENDO', '193');
INSERT INTO `ubigeo` VALUES ('469', '04', '07', '02', 'COCACHACRA', '193');
INSERT INTO `ubigeo` VALUES ('470', '04', '07', '03', 'DEAN VALDIVIA', '193');
INSERT INTO `ubigeo` VALUES ('471', '04', '07', '04', 'ISLAY', '193');
INSERT INTO `ubigeo` VALUES ('472', '04', '07', '05', 'MEJIA', '193');
INSERT INTO `ubigeo` VALUES ('473', '04', '07', '06', 'PUNTA DE BOMBON', '193');
INSERT INTO `ubigeo` VALUES ('474', '04', '08', '00', 'LA UNION', '193');
INSERT INTO `ubigeo` VALUES ('475', '04', '08', '01', 'COTAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('476', '04', '08', '02', 'ALCA', '193');
INSERT INTO `ubigeo` VALUES ('477', '04', '08', '03', 'CHARCANA', '193');
INSERT INTO `ubigeo` VALUES ('478', '04', '08', '04', 'HUAYNACOTAS', '193');
INSERT INTO `ubigeo` VALUES ('479', '04', '08', '05', 'PAMPAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('480', '04', '08', '06', 'PUYCA', '193');
INSERT INTO `ubigeo` VALUES ('481', '04', '08', '07', 'QUECHUALLA', '193');
INSERT INTO `ubigeo` VALUES ('482', '04', '08', '08', 'SAYLA', '193');
INSERT INTO `ubigeo` VALUES ('483', '04', '08', '09', 'TAURIA', '193');
INSERT INTO `ubigeo` VALUES ('484', '04', '08', '10', 'TOMEPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('485', '04', '08', '11', 'TORO', '193');
INSERT INTO `ubigeo` VALUES ('486', '05', '00', '00', 'AYACUCHO', '193');
INSERT INTO `ubigeo` VALUES ('487', '05', '01', '00', 'HUAMANGA', '193');
INSERT INTO `ubigeo` VALUES ('488', '05', '01', '01', 'AYACUCHO', '193');
INSERT INTO `ubigeo` VALUES ('489', '05', '01', '02', 'ACOCRO', '193');
INSERT INTO `ubigeo` VALUES ('490', '05', '01', '03', 'ACOS VINCHOS', '193');
INSERT INTO `ubigeo` VALUES ('491', '05', '01', '04', 'CARMEN ALTO', '193');
INSERT INTO `ubigeo` VALUES ('492', '05', '01', '05', 'CHIARA', '193');
INSERT INTO `ubigeo` VALUES ('493', '05', '01', '06', 'OCROS', '193');
INSERT INTO `ubigeo` VALUES ('494', '05', '01', '07', 'PACAYCASA', '193');
INSERT INTO `ubigeo` VALUES ('495', '05', '01', '08', 'QUINUA', '193');
INSERT INTO `ubigeo` VALUES ('496', '05', '01', '09', 'SAN JOSE DE TICLLAS', '193');
INSERT INTO `ubigeo` VALUES ('497', '05', '01', '10', 'SAN JUAN BAUTISTA', '193');
INSERT INTO `ubigeo` VALUES ('498', '05', '01', '11', 'SANTIAGO DE PISCHA', '193');
INSERT INTO `ubigeo` VALUES ('499', '05', '01', '12', 'SOCOS', '193');
INSERT INTO `ubigeo` VALUES ('500', '05', '01', '13', 'TAMBILLO', '193');
INSERT INTO `ubigeo` VALUES ('501', '05', '01', '14', 'VINCHOS', '193');
INSERT INTO `ubigeo` VALUES ('502', '05', '01', '15', 'JESUS NAZARENO', '193');
INSERT INTO `ubigeo` VALUES ('503', '05', '02', '00', 'CANGALLO', '193');
INSERT INTO `ubigeo` VALUES ('504', '05', '02', '01', 'CANGALLO', '193');
INSERT INTO `ubigeo` VALUES ('505', '05', '02', '02', 'CHUSCHI', '193');
INSERT INTO `ubigeo` VALUES ('506', '05', '02', '03', 'LOS MOROCHUCOS', '193');
INSERT INTO `ubigeo` VALUES ('507', '05', '02', '04', 'MARIA PARADO DE BELLIDO', '193');
INSERT INTO `ubigeo` VALUES ('508', '05', '02', '05', 'PARAS', '193');
INSERT INTO `ubigeo` VALUES ('509', '05', '02', '06', 'TOTOS', '193');
INSERT INTO `ubigeo` VALUES ('510', '05', '03', '00', 'HUANCA SANCOS', '193');
INSERT INTO `ubigeo` VALUES ('511', '05', '03', '01', 'SANCOS', '193');
INSERT INTO `ubigeo` VALUES ('512', '05', '03', '02', 'CARAPO', '193');
INSERT INTO `ubigeo` VALUES ('513', '05', '03', '03', 'SACSAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('514', '05', '03', '04', 'SANTIAGO DE LUCANAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('515', '05', '04', '00', 'HUANTA', '193');
INSERT INTO `ubigeo` VALUES ('516', '05', '04', '01', 'HUANTA', '193');
INSERT INTO `ubigeo` VALUES ('517', '05', '04', '02', 'AYAHUANCO', '193');
INSERT INTO `ubigeo` VALUES ('518', '05', '04', '03', 'HUAMANGUILLA', '193');
INSERT INTO `ubigeo` VALUES ('519', '05', '04', '04', 'IGUAIN', '193');
INSERT INTO `ubigeo` VALUES ('520', '05', '04', '05', 'LURICOCHA', '193');
INSERT INTO `ubigeo` VALUES ('521', '05', '04', '06', 'SANTILLANA', '193');
INSERT INTO `ubigeo` VALUES ('522', '05', '04', '07', 'SIVIA', '193');
INSERT INTO `ubigeo` VALUES ('523', '05', '04', '08', 'LLOCHEGUA', '193');
INSERT INTO `ubigeo` VALUES ('524', '05', '05', '00', 'LA MAR', '193');
INSERT INTO `ubigeo` VALUES ('525', '05', '05', '01', 'SAN MIGUEL', '193');
INSERT INTO `ubigeo` VALUES ('526', '05', '05', '02', 'ANCO', '193');
INSERT INTO `ubigeo` VALUES ('527', '05', '05', '03', 'AYNA', '193');
INSERT INTO `ubigeo` VALUES ('528', '05', '05', '04', 'CHILCAS', '193');
INSERT INTO `ubigeo` VALUES ('529', '05', '05', '05', 'CHUNGUI', '193');
INSERT INTO `ubigeo` VALUES ('530', '05', '05', '06', 'LUIS CARRANZA', '193');
INSERT INTO `ubigeo` VALUES ('531', '05', '05', '07', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('532', '05', '05', '08', 'TAMBO', '193');
INSERT INTO `ubigeo` VALUES ('533', '05', '05', '09', 'SAMUGARI', '193');
INSERT INTO `ubigeo` VALUES ('534', '05', '06', '00', 'LUCANAS', '193');
INSERT INTO `ubigeo` VALUES ('535', '05', '06', '01', 'PUQUIO', '193');
INSERT INTO `ubigeo` VALUES ('536', '05', '06', '02', 'AUCARA', '193');
INSERT INTO `ubigeo` VALUES ('537', '05', '06', '03', 'CABANA', '193');
INSERT INTO `ubigeo` VALUES ('538', '05', '06', '04', 'CARMEN SALCEDO', '193');
INSERT INTO `ubigeo` VALUES ('539', '05', '06', '05', 'CHAVIÑA', '193');
INSERT INTO `ubigeo` VALUES ('540', '05', '06', '06', 'CHIPAO', '193');
INSERT INTO `ubigeo` VALUES ('541', '05', '06', '07', 'HUAC-HUAS', '193');
INSERT INTO `ubigeo` VALUES ('542', '05', '06', '08', 'LARAMATE', '193');
INSERT INTO `ubigeo` VALUES ('543', '05', '06', '09', 'LEONCIO PRADO', '193');
INSERT INTO `ubigeo` VALUES ('544', '05', '06', '10', 'LLAUTA', '193');
INSERT INTO `ubigeo` VALUES ('545', '05', '06', '11', 'LUCANAS', '193');
INSERT INTO `ubigeo` VALUES ('546', '05', '06', '12', 'OCAÑA', '193');
INSERT INTO `ubigeo` VALUES ('547', '05', '06', '13', 'OTOCA', '193');
INSERT INTO `ubigeo` VALUES ('548', '05', '06', '14', 'SAISA', '193');
INSERT INTO `ubigeo` VALUES ('549', '05', '06', '15', 'SAN CRISTOBAL', '193');
INSERT INTO `ubigeo` VALUES ('550', '05', '06', '16', 'SAN JUAN', '193');
INSERT INTO `ubigeo` VALUES ('551', '05', '06', '17', 'SAN PEDRO', '193');
INSERT INTO `ubigeo` VALUES ('552', '05', '06', '18', 'SAN PEDRO DE PALCO', '193');
INSERT INTO `ubigeo` VALUES ('553', '05', '06', '19', 'SANCOS', '193');
INSERT INTO `ubigeo` VALUES ('554', '05', '06', '20', 'SANTA ANA DE HUAYCAHUACHO', '193');
INSERT INTO `ubigeo` VALUES ('555', '05', '06', '21', 'SANTA LUCIA', '193');
INSERT INTO `ubigeo` VALUES ('556', '05', '07', '00', 'PARINACOCHAS', '193');
INSERT INTO `ubigeo` VALUES ('557', '05', '07', '01', 'CORACORA', '193');
INSERT INTO `ubigeo` VALUES ('558', '05', '07', '02', 'CHUMPI', '193');
INSERT INTO `ubigeo` VALUES ('559', '05', '07', '03', 'CORONEL CASTAÑEDA', '193');
INSERT INTO `ubigeo` VALUES ('560', '05', '07', '04', 'PACAPAUSA', '193');
INSERT INTO `ubigeo` VALUES ('561', '05', '07', '05', 'PULLO', '193');
INSERT INTO `ubigeo` VALUES ('562', '05', '07', '06', 'PUYUSCA', '193');
INSERT INTO `ubigeo` VALUES ('563', '05', '07', '07', 'SAN FRANCISCO DE RAVACAYCO', '193');
INSERT INTO `ubigeo` VALUES ('564', '05', '07', '08', 'UPAHUACHO', '193');
INSERT INTO `ubigeo` VALUES ('565', '05', '08', '00', 'PAUCAR DEL SARA SARA', '193');
INSERT INTO `ubigeo` VALUES ('566', '05', '08', '01', 'PAUSA', '193');
INSERT INTO `ubigeo` VALUES ('567', '05', '08', '02', 'COLTA', '193');
INSERT INTO `ubigeo` VALUES ('568', '05', '08', '03', 'CORCULLA', '193');
INSERT INTO `ubigeo` VALUES ('569', '05', '08', '04', 'LAMPA', '193');
INSERT INTO `ubigeo` VALUES ('570', '05', '08', '05', 'MARCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('571', '05', '08', '06', 'OYOLO', '193');
INSERT INTO `ubigeo` VALUES ('572', '05', '08', '07', 'PARARCA', '193');
INSERT INTO `ubigeo` VALUES ('573', '05', '08', '08', 'SAN JAVIER DE ALPABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('574', '05', '08', '09', 'SAN JOSE DE USHUA', '193');
INSERT INTO `ubigeo` VALUES ('575', '05', '08', '10', 'SARA SARA', '193');
INSERT INTO `ubigeo` VALUES ('576', '05', '09', '00', 'SUCRE', '193');
INSERT INTO `ubigeo` VALUES ('577', '05', '09', '01', 'QUEROBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('578', '05', '09', '02', 'BELEN', '193');
INSERT INTO `ubigeo` VALUES ('579', '05', '09', '03', 'CHALCOS', '193');
INSERT INTO `ubigeo` VALUES ('580', '05', '09', '04', 'CHILCAYOC', '193');
INSERT INTO `ubigeo` VALUES ('581', '05', '09', '05', 'HUACAÑA', '193');
INSERT INTO `ubigeo` VALUES ('582', '05', '09', '06', 'MORCOLLA', '193');
INSERT INTO `ubigeo` VALUES ('583', '05', '09', '07', 'PAICO', '193');
INSERT INTO `ubigeo` VALUES ('584', '05', '09', '08', 'SAN PEDRO DE LARCAY', '193');
INSERT INTO `ubigeo` VALUES ('585', '05', '09', '09', 'SAN SALVADOR DE QUIJE', '193');
INSERT INTO `ubigeo` VALUES ('586', '05', '09', '10', 'SANTIAGO DE PAUCARAY', '193');
INSERT INTO `ubigeo` VALUES ('587', '05', '09', '11', 'SORAS', '193');
INSERT INTO `ubigeo` VALUES ('588', '05', '10', '00', 'VICTOR FAJARDO', '193');
INSERT INTO `ubigeo` VALUES ('589', '05', '10', '01', 'HUANCAPI', '193');
INSERT INTO `ubigeo` VALUES ('590', '05', '10', '02', 'ALCAMENCA', '193');
INSERT INTO `ubigeo` VALUES ('591', '05', '10', '03', 'APONGO', '193');
INSERT INTO `ubigeo` VALUES ('592', '05', '10', '04', 'ASQUIPATA', '193');
INSERT INTO `ubigeo` VALUES ('593', '05', '10', '05', 'CANARIA', '193');
INSERT INTO `ubigeo` VALUES ('594', '05', '10', '06', 'CAYARA', '193');
INSERT INTO `ubigeo` VALUES ('595', '05', '10', '07', 'COLCA', '193');
INSERT INTO `ubigeo` VALUES ('596', '05', '10', '08', 'HUAMANQUIQUIA', '193');
INSERT INTO `ubigeo` VALUES ('597', '05', '10', '09', 'HUANCARAYLLA', '193');
INSERT INTO `ubigeo` VALUES ('598', '05', '10', '10', 'HUAYA', '193');
INSERT INTO `ubigeo` VALUES ('599', '05', '10', '11', 'SARHUA', '193');
INSERT INTO `ubigeo` VALUES ('600', '05', '10', '12', 'VILCANCHOS', '193');
INSERT INTO `ubigeo` VALUES ('601', '05', '11', '00', 'VILCAS HUAMAN', '193');
INSERT INTO `ubigeo` VALUES ('602', '05', '11', '01', 'VILCAS HUAMAN', '193');
INSERT INTO `ubigeo` VALUES ('603', '05', '11', '02', 'ACCOMARCA', '193');
INSERT INTO `ubigeo` VALUES ('604', '05', '11', '03', 'CARHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('605', '05', '11', '04', 'CONCEPCION', '193');
INSERT INTO `ubigeo` VALUES ('606', '05', '11', '05', 'HUAMBALPA', '193');
INSERT INTO `ubigeo` VALUES ('607', '05', '11', '06', 'INDEPENDENCIA', '193');
INSERT INTO `ubigeo` VALUES ('608', '05', '11', '07', 'SAURAMA', '193');
INSERT INTO `ubigeo` VALUES ('609', '05', '11', '08', 'VISCHONGO', '193');
INSERT INTO `ubigeo` VALUES ('610', '06', '00', '00', 'CAJAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('611', '06', '01', '00', 'CAJAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('612', '06', '01', '01', 'CAJAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('613', '06', '01', '02', 'ASUNCION', '193');
INSERT INTO `ubigeo` VALUES ('614', '06', '01', '03', 'CHETILLA', '193');
INSERT INTO `ubigeo` VALUES ('615', '06', '01', '04', 'COSPAN', '193');
INSERT INTO `ubigeo` VALUES ('616', '06', '01', '05', 'ENCAÑADA', '193');
INSERT INTO `ubigeo` VALUES ('617', '06', '01', '06', 'JESUS', '193');
INSERT INTO `ubigeo` VALUES ('618', '06', '01', '07', 'LLACANORA', '193');
INSERT INTO `ubigeo` VALUES ('619', '06', '01', '08', 'LOS BAÑOS DEL INCA', '193');
INSERT INTO `ubigeo` VALUES ('620', '06', '01', '09', 'MAGDALENA', '193');
INSERT INTO `ubigeo` VALUES ('621', '06', '01', '10', 'MATARA', '193');
INSERT INTO `ubigeo` VALUES ('622', '06', '01', '11', 'NAMORA', '193');
INSERT INTO `ubigeo` VALUES ('623', '06', '01', '12', 'SAN JUAN', '193');
INSERT INTO `ubigeo` VALUES ('624', '06', '02', '00', 'CAJABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('625', '06', '02', '01', 'CAJABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('626', '06', '02', '02', 'CACHACHI', '193');
INSERT INTO `ubigeo` VALUES ('627', '06', '02', '03', 'CONDEBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('628', '06', '02', '04', 'SITACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('629', '06', '03', '00', 'CELENDIN', '193');
INSERT INTO `ubigeo` VALUES ('630', '06', '03', '01', 'CELENDIN', '193');
INSERT INTO `ubigeo` VALUES ('631', '06', '03', '02', 'CHUMUCH', '193');
INSERT INTO `ubigeo` VALUES ('632', '06', '03', '03', 'CORTEGANA', '193');
INSERT INTO `ubigeo` VALUES ('633', '06', '03', '04', 'HUASMIN', '193');
INSERT INTO `ubigeo` VALUES ('634', '06', '03', '05', 'JORGE CHAVEZ', '193');
INSERT INTO `ubigeo` VALUES ('635', '06', '03', '06', 'JOSE GALVEZ', '193');
INSERT INTO `ubigeo` VALUES ('636', '06', '03', '07', 'MIGUEL IGLESIAS', '193');
INSERT INTO `ubigeo` VALUES ('637', '06', '03', '08', 'OXAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('638', '06', '03', '09', 'SOROCHUCO', '193');
INSERT INTO `ubigeo` VALUES ('639', '06', '03', '10', 'SUCRE', '193');
INSERT INTO `ubigeo` VALUES ('640', '06', '03', '11', 'UTCO', '193');
INSERT INTO `ubigeo` VALUES ('641', '06', '03', '12', 'LA LIBERTAD DE PALLAN', '193');
INSERT INTO `ubigeo` VALUES ('642', '06', '04', '00', 'CHOTA', '193');
INSERT INTO `ubigeo` VALUES ('643', '06', '04', '01', 'CHOTA', '193');
INSERT INTO `ubigeo` VALUES ('644', '06', '04', '02', 'ANGUIA', '193');
INSERT INTO `ubigeo` VALUES ('645', '06', '04', '03', 'CHADIN', '193');
INSERT INTO `ubigeo` VALUES ('646', '06', '04', '04', 'CHIGUIRIP', '193');
INSERT INTO `ubigeo` VALUES ('647', '06', '04', '05', 'CHIMBAN', '193');
INSERT INTO `ubigeo` VALUES ('648', '06', '04', '06', 'CHOROPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('649', '06', '04', '07', 'COCHABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('650', '06', '04', '08', 'CONCHAN', '193');
INSERT INTO `ubigeo` VALUES ('651', '06', '04', '09', 'HUAMBOS', '193');
INSERT INTO `ubigeo` VALUES ('652', '06', '04', '10', 'LAJAS', '193');
INSERT INTO `ubigeo` VALUES ('653', '06', '04', '11', 'LLAMA', '193');
INSERT INTO `ubigeo` VALUES ('654', '06', '04', '12', 'MIRACOSTA', '193');
INSERT INTO `ubigeo` VALUES ('655', '06', '04', '13', 'PACCHA', '193');
INSERT INTO `ubigeo` VALUES ('656', '06', '04', '14', 'PION', '193');
INSERT INTO `ubigeo` VALUES ('657', '06', '04', '15', 'QUEROCOTO', '193');
INSERT INTO `ubigeo` VALUES ('658', '06', '04', '16', 'SAN JUAN DE LICUPIS', '193');
INSERT INTO `ubigeo` VALUES ('659', '06', '04', '17', 'TACABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('660', '06', '04', '18', 'TOCMOCHE', '193');
INSERT INTO `ubigeo` VALUES ('661', '06', '04', '19', 'CHALAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('662', '06', '05', '00', 'CONTUMAZA', '193');
INSERT INTO `ubigeo` VALUES ('663', '06', '05', '01', 'CONTUMAZA', '193');
INSERT INTO `ubigeo` VALUES ('664', '06', '05', '02', 'CHILETE', '193');
INSERT INTO `ubigeo` VALUES ('665', '06', '05', '03', 'CUPISNIQUE', '193');
INSERT INTO `ubigeo` VALUES ('666', '06', '05', '04', 'GUZMANGO', '193');
INSERT INTO `ubigeo` VALUES ('667', '06', '05', '05', 'SAN BENITO', '193');
INSERT INTO `ubigeo` VALUES ('668', '06', '05', '06', 'SANTA CRUZ DE TOLED', '193');
INSERT INTO `ubigeo` VALUES ('669', '06', '05', '07', 'TANTARICA', '193');
INSERT INTO `ubigeo` VALUES ('670', '06', '05', '08', 'YONAN', '193');
INSERT INTO `ubigeo` VALUES ('671', '06', '06', '00', 'CUTERVO', '193');
INSERT INTO `ubigeo` VALUES ('672', '06', '06', '01', 'CUTERVO', '193');
INSERT INTO `ubigeo` VALUES ('673', '06', '06', '02', 'CALLAYUC', '193');
INSERT INTO `ubigeo` VALUES ('674', '06', '06', '03', 'CHOROS', '193');
INSERT INTO `ubigeo` VALUES ('675', '06', '06', '04', 'CUJILLO', '193');
INSERT INTO `ubigeo` VALUES ('676', '06', '06', '05', 'LA RAMADA', '193');
INSERT INTO `ubigeo` VALUES ('677', '06', '06', '06', 'PIMPINGOS', '193');
INSERT INTO `ubigeo` VALUES ('678', '06', '06', '07', 'QUEROCOTILLO', '193');
INSERT INTO `ubigeo` VALUES ('679', '06', '06', '08', 'SAN ANDRES DE CUTERVO', '193');
INSERT INTO `ubigeo` VALUES ('680', '06', '06', '09', 'SAN JUAN DE CUTERVO', '193');
INSERT INTO `ubigeo` VALUES ('681', '06', '06', '10', 'SAN LUIS DE LUCMA', '193');
INSERT INTO `ubigeo` VALUES ('682', '06', '06', '11', 'SANTA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('683', '06', '06', '12', 'SANTO DOMINGO DE LA CAPILLA', '193');
INSERT INTO `ubigeo` VALUES ('684', '06', '06', '13', 'SANTO TOMAS', '193');
INSERT INTO `ubigeo` VALUES ('685', '06', '06', '14', 'SOCOTA', '193');
INSERT INTO `ubigeo` VALUES ('686', '06', '06', '15', 'TORIBIO CASANOVA', '193');
INSERT INTO `ubigeo` VALUES ('687', '06', '07', '00', 'HUALGAYOC', '193');
INSERT INTO `ubigeo` VALUES ('688', '06', '07', '01', 'BAMBAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('689', '06', '07', '02', 'CHUGUR', '193');
INSERT INTO `ubigeo` VALUES ('690', '06', '07', '03', 'HUALGAYOC', '193');
INSERT INTO `ubigeo` VALUES ('691', '06', '08', '00', 'JAEN', '193');
INSERT INTO `ubigeo` VALUES ('692', '06', '08', '01', 'JAEN', '193');
INSERT INTO `ubigeo` VALUES ('693', '06', '08', '02', 'BELLAVISTA', '193');
INSERT INTO `ubigeo` VALUES ('694', '06', '08', '03', 'CHONTALI', '193');
INSERT INTO `ubigeo` VALUES ('695', '06', '08', '04', 'COLASAY', '193');
INSERT INTO `ubigeo` VALUES ('696', '06', '08', '05', 'HUABAL', '193');
INSERT INTO `ubigeo` VALUES ('697', '06', '08', '06', 'LAS PIRIAS', '193');
INSERT INTO `ubigeo` VALUES ('698', '06', '08', '07', 'POMAHUACA', '193');
INSERT INTO `ubigeo` VALUES ('699', '06', '08', '08', 'PUCARA', '193');
INSERT INTO `ubigeo` VALUES ('700', '06', '08', '09', 'SALLIQUE', '193');
INSERT INTO `ubigeo` VALUES ('701', '06', '08', '10', 'SAN FELIPE', '193');
INSERT INTO `ubigeo` VALUES ('702', '06', '08', '11', 'SAN JOSE DEL ALTO', '193');
INSERT INTO `ubigeo` VALUES ('703', '06', '08', '12', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('704', '06', '09', '00', 'SAN IGNACIO', '193');
INSERT INTO `ubigeo` VALUES ('705', '06', '09', '01', 'SAN IGNACIO', '193');
INSERT INTO `ubigeo` VALUES ('706', '06', '09', '02', 'CHIRINOS', '193');
INSERT INTO `ubigeo` VALUES ('707', '06', '09', '03', 'HUARANGO', '193');
INSERT INTO `ubigeo` VALUES ('708', '06', '09', '04', 'LA COIPA', '193');
INSERT INTO `ubigeo` VALUES ('709', '06', '09', '05', 'NAMBALLE', '193');
INSERT INTO `ubigeo` VALUES ('710', '06', '09', '06', 'SAN JOSE DE LOURDES', '193');
INSERT INTO `ubigeo` VALUES ('711', '06', '09', '07', 'TABACONAS', '193');
INSERT INTO `ubigeo` VALUES ('712', '06', '10', '00', 'SAN MARCOS', '193');
INSERT INTO `ubigeo` VALUES ('713', '06', '10', '01', 'PEDRO GALVEZ', '193');
INSERT INTO `ubigeo` VALUES ('714', '06', '10', '02', 'CHANCAY', '193');
INSERT INTO `ubigeo` VALUES ('715', '06', '10', '03', 'EDUARDO VILLANUEVA', '193');
INSERT INTO `ubigeo` VALUES ('716', '06', '10', '04', 'GREGORIO PITA', '193');
INSERT INTO `ubigeo` VALUES ('717', '06', '10', '05', 'ICHOCAN', '193');
INSERT INTO `ubigeo` VALUES ('718', '06', '10', '06', 'JOSE MANUEL QUIROZ', '193');
INSERT INTO `ubigeo` VALUES ('719', '06', '10', '07', 'JOSE SABOGAL', '193');
INSERT INTO `ubigeo` VALUES ('720', '06', '11', '00', 'SAN MIGUEL', '193');
INSERT INTO `ubigeo` VALUES ('721', '06', '11', '01', 'SAN MIGUEL', '193');
INSERT INTO `ubigeo` VALUES ('722', '06', '11', '02', 'BOLIVAR', '193');
INSERT INTO `ubigeo` VALUES ('723', '06', '11', '03', 'CALQUIS', '193');
INSERT INTO `ubigeo` VALUES ('724', '06', '11', '04', 'CATILLUC', '193');
INSERT INTO `ubigeo` VALUES ('725', '06', '11', '05', 'EL PRADO', '193');
INSERT INTO `ubigeo` VALUES ('726', '06', '11', '06', 'LA FLORIDA', '193');
INSERT INTO `ubigeo` VALUES ('727', '06', '11', '07', 'LLAPA', '193');
INSERT INTO `ubigeo` VALUES ('728', '06', '11', '08', 'NANCHOC', '193');
INSERT INTO `ubigeo` VALUES ('729', '06', '11', '09', 'NIEPOS', '193');
INSERT INTO `ubigeo` VALUES ('730', '06', '11', '10', 'SAN GREGORIO', '193');
INSERT INTO `ubigeo` VALUES ('731', '06', '11', '11', 'SAN SILVESTRE DE COCHAN', '193');
INSERT INTO `ubigeo` VALUES ('732', '06', '11', '12', 'TONGOD', '193');
INSERT INTO `ubigeo` VALUES ('733', '06', '11', '13', 'UNION AGUA BLANCA', '193');
INSERT INTO `ubigeo` VALUES ('734', '06', '12', '00', 'SAN PABLO', '193');
INSERT INTO `ubigeo` VALUES ('735', '06', '12', '01', 'SAN PABLO', '193');
INSERT INTO `ubigeo` VALUES ('736', '06', '12', '02', 'SAN BERNARDINO', '193');
INSERT INTO `ubigeo` VALUES ('737', '06', '12', '03', 'SAN LUIS', '193');
INSERT INTO `ubigeo` VALUES ('738', '06', '12', '04', 'TUMBADEN', '193');
INSERT INTO `ubigeo` VALUES ('739', '06', '13', '00', 'SANTA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('740', '06', '13', '01', 'SANTA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('741', '06', '13', '02', 'ANDABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('742', '06', '13', '03', 'CATACHE', '193');
INSERT INTO `ubigeo` VALUES ('743', '06', '13', '04', 'CHANCAYBAÑOS', '193');
INSERT INTO `ubigeo` VALUES ('744', '06', '13', '05', 'LA ESPERANZA', '193');
INSERT INTO `ubigeo` VALUES ('745', '06', '13', '06', 'NINABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('746', '06', '13', '07', 'PULAN', '193');
INSERT INTO `ubigeo` VALUES ('747', '06', '13', '08', 'SAUCEPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('748', '06', '13', '09', 'SEXI', '193');
INSERT INTO `ubigeo` VALUES ('749', '06', '13', '10', 'UTICYACU', '193');
INSERT INTO `ubigeo` VALUES ('750', '06', '13', '11', 'YAUYUCAN', '193');
INSERT INTO `ubigeo` VALUES ('751', '07', '00', '00', 'CALLAO', '193');
INSERT INTO `ubigeo` VALUES ('752', '07', '01', '00', 'CALLAO', '193');
INSERT INTO `ubigeo` VALUES ('753', '07', '01', '01', 'CALLAO', '193');
INSERT INTO `ubigeo` VALUES ('754', '07', '01', '02', 'BELLAVISTA', '193');
INSERT INTO `ubigeo` VALUES ('755', '07', '01', '03', 'CARMEN DE LA LEGUA REYNOSO', '193');
INSERT INTO `ubigeo` VALUES ('756', '07', '01', '04', 'LA PERLA', '193');
INSERT INTO `ubigeo` VALUES ('757', '07', '01', '05', 'LA PUNTA', '193');
INSERT INTO `ubigeo` VALUES ('758', '07', '01', '06', 'VENTANILLA', '193');
INSERT INTO `ubigeo` VALUES ('759', '08', '00', '00', 'CUSCO', '193');
INSERT INTO `ubigeo` VALUES ('760', '08', '01', '00', 'CUSCO', '193');
INSERT INTO `ubigeo` VALUES ('761', '08', '01', '01', 'CUSCO', '193');
INSERT INTO `ubigeo` VALUES ('762', '08', '01', '02', 'CCORCA', '193');
INSERT INTO `ubigeo` VALUES ('763', '08', '01', '03', 'POROY', '193');
INSERT INTO `ubigeo` VALUES ('764', '08', '01', '04', 'SAN JERONIMO', '193');
INSERT INTO `ubigeo` VALUES ('765', '08', '01', '05', 'SAN SEBASTIAN', '193');
INSERT INTO `ubigeo` VALUES ('766', '08', '01', '06', 'SANTIAGO', '193');
INSERT INTO `ubigeo` VALUES ('767', '08', '01', '07', 'SAYLLA', '193');
INSERT INTO `ubigeo` VALUES ('768', '08', '01', '08', 'WANCHAQ', '193');
INSERT INTO `ubigeo` VALUES ('769', '08', '02', '00', 'ACOMAYO', '193');
INSERT INTO `ubigeo` VALUES ('770', '08', '02', '01', 'ACOMAYO', '193');
INSERT INTO `ubigeo` VALUES ('771', '08', '02', '02', 'ACOPIA', '193');
INSERT INTO `ubigeo` VALUES ('772', '08', '02', '03', 'ACOS', '193');
INSERT INTO `ubigeo` VALUES ('773', '08', '02', '04', 'MOSOC LLACTA', '193');
INSERT INTO `ubigeo` VALUES ('774', '08', '02', '05', 'POMACANCHI', '193');
INSERT INTO `ubigeo` VALUES ('775', '08', '02', '06', 'RONDOCAN', '193');
INSERT INTO `ubigeo` VALUES ('776', '08', '02', '07', 'SANGARARA', '193');
INSERT INTO `ubigeo` VALUES ('777', '08', '03', '00', 'ANTA', '193');
INSERT INTO `ubigeo` VALUES ('778', '08', '03', '01', 'ANTA', '193');
INSERT INTO `ubigeo` VALUES ('779', '08', '03', '02', 'ANCAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('780', '08', '03', '03', 'CACHIMAYO', '193');
INSERT INTO `ubigeo` VALUES ('781', '08', '03', '04', 'CHINCHAYPUJIO', '193');
INSERT INTO `ubigeo` VALUES ('782', '08', '03', '05', 'HUAROCONDO', '193');
INSERT INTO `ubigeo` VALUES ('783', '08', '03', '06', 'LIMATAMBO', '193');
INSERT INTO `ubigeo` VALUES ('784', '08', '03', '07', 'MOLLEPATA', '193');
INSERT INTO `ubigeo` VALUES ('785', '08', '03', '08', 'PUCYURA', '193');
INSERT INTO `ubigeo` VALUES ('786', '08', '03', '09', 'ZURITE', '193');
INSERT INTO `ubigeo` VALUES ('787', '08', '04', '00', 'CALCA', '193');
INSERT INTO `ubigeo` VALUES ('788', '08', '04', '01', 'CALCA', '193');
INSERT INTO `ubigeo` VALUES ('789', '08', '04', '02', 'COYA', '193');
INSERT INTO `ubigeo` VALUES ('790', '08', '04', '03', 'LAMAY', '193');
INSERT INTO `ubigeo` VALUES ('791', '08', '04', '04', 'LARES', '193');
INSERT INTO `ubigeo` VALUES ('792', '08', '04', '05', 'PISAC', '193');
INSERT INTO `ubigeo` VALUES ('793', '08', '04', '06', 'SAN SALVADOR', '193');
INSERT INTO `ubigeo` VALUES ('794', '08', '04', '07', 'TARAY', '193');
INSERT INTO `ubigeo` VALUES ('795', '08', '04', '08', 'YANATILE', '193');
INSERT INTO `ubigeo` VALUES ('796', '08', '05', '00', 'CANAS', '193');
INSERT INTO `ubigeo` VALUES ('797', '08', '05', '01', 'YANAOCA', '193');
INSERT INTO `ubigeo` VALUES ('798', '08', '05', '02', 'CHECCA', '193');
INSERT INTO `ubigeo` VALUES ('799', '08', '05', '03', 'KUNTURKANKI', '193');
INSERT INTO `ubigeo` VALUES ('800', '08', '05', '04', 'LANGUI', '193');
INSERT INTO `ubigeo` VALUES ('801', '08', '05', '05', 'LAYO', '193');
INSERT INTO `ubigeo` VALUES ('802', '08', '05', '06', 'PAMPAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('803', '08', '05', '07', 'QUEHUE', '193');
INSERT INTO `ubigeo` VALUES ('804', '08', '05', '08', 'TUPAC AMARU', '193');
INSERT INTO `ubigeo` VALUES ('805', '08', '06', '00', 'CANCHIS', '193');
INSERT INTO `ubigeo` VALUES ('806', '08', '06', '01', 'SICUANI', '193');
INSERT INTO `ubigeo` VALUES ('807', '08', '06', '02', 'CHECACUPE', '193');
INSERT INTO `ubigeo` VALUES ('808', '08', '06', '03', 'COMBAPATA', '193');
INSERT INTO `ubigeo` VALUES ('809', '08', '06', '04', 'MARANGANI', '193');
INSERT INTO `ubigeo` VALUES ('810', '08', '06', '05', 'PITUMARCA', '193');
INSERT INTO `ubigeo` VALUES ('811', '08', '06', '06', 'SAN PABLO', '193');
INSERT INTO `ubigeo` VALUES ('812', '08', '06', '07', 'SAN PEDRO', '193');
INSERT INTO `ubigeo` VALUES ('813', '08', '06', '08', 'TINTA', '193');
INSERT INTO `ubigeo` VALUES ('814', '08', '07', '00', 'CHUMBIVILCAS', '193');
INSERT INTO `ubigeo` VALUES ('815', '08', '07', '01', 'SANTO TOMAS', '193');
INSERT INTO `ubigeo` VALUES ('816', '08', '07', '02', 'CAPACMARCA', '193');
INSERT INTO `ubigeo` VALUES ('817', '08', '07', '03', 'CHAMACA', '193');
INSERT INTO `ubigeo` VALUES ('818', '08', '07', '04', 'COLQUEMARCA', '193');
INSERT INTO `ubigeo` VALUES ('819', '08', '07', '05', 'LIVITACA', '193');
INSERT INTO `ubigeo` VALUES ('820', '08', '07', '06', 'LLUSCO', '193');
INSERT INTO `ubigeo` VALUES ('821', '08', '07', '07', 'QUIÑOTA', '193');
INSERT INTO `ubigeo` VALUES ('822', '08', '07', '08', 'VELILLE', '193');
INSERT INTO `ubigeo` VALUES ('823', '08', '08', '00', 'ESPINAR', '193');
INSERT INTO `ubigeo` VALUES ('824', '08', '08', '01', 'ESPINAR', '193');
INSERT INTO `ubigeo` VALUES ('825', '08', '08', '02', 'CONDOROMA', '193');
INSERT INTO `ubigeo` VALUES ('826', '08', '08', '03', 'COPORAQUE', '193');
INSERT INTO `ubigeo` VALUES ('827', '08', '08', '04', 'OCORURO', '193');
INSERT INTO `ubigeo` VALUES ('828', '08', '08', '05', 'PALLPATA', '193');
INSERT INTO `ubigeo` VALUES ('829', '08', '08', '06', 'PICHIGUA', '193');
INSERT INTO `ubigeo` VALUES ('830', '08', '08', '07', 'SUYCKUTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('831', '08', '08', '08', 'ALTO PICHIGUA', '193');
INSERT INTO `ubigeo` VALUES ('832', '08', '09', '00', 'LA CONVENCION', '193');
INSERT INTO `ubigeo` VALUES ('833', '08', '09', '01', 'SANTA ANA', '193');
INSERT INTO `ubigeo` VALUES ('834', '08', '09', '02', 'ECHARATE', '193');
INSERT INTO `ubigeo` VALUES ('835', '08', '09', '03', 'HUAYOPATA', '193');
INSERT INTO `ubigeo` VALUES ('836', '08', '09', '04', 'MARANURA', '193');
INSERT INTO `ubigeo` VALUES ('837', '08', '09', '05', 'OCOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('838', '08', '09', '06', 'QUELLOUNO', '193');
INSERT INTO `ubigeo` VALUES ('839', '08', '09', '07', 'KIMBIRI', '193');
INSERT INTO `ubigeo` VALUES ('840', '08', '09', '08', 'SANTA TERESA', '193');
INSERT INTO `ubigeo` VALUES ('841', '08', '09', '09', 'VILCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('842', '08', '09', '10', 'PICHARI', '193');
INSERT INTO `ubigeo` VALUES ('843', '08', '10', '00', 'PARURO', '193');
INSERT INTO `ubigeo` VALUES ('844', '08', '10', '01', 'PARURO', '193');
INSERT INTO `ubigeo` VALUES ('845', '08', '10', '02', 'ACCHA', '193');
INSERT INTO `ubigeo` VALUES ('846', '08', '10', '03', 'CCAPI', '193');
INSERT INTO `ubigeo` VALUES ('847', '08', '10', '04', 'COLCHA', '193');
INSERT INTO `ubigeo` VALUES ('848', '08', '10', '05', 'HUANOQUITE', '193');
INSERT INTO `ubigeo` VALUES ('849', '08', '10', '06', 'OMACHA', '193');
INSERT INTO `ubigeo` VALUES ('850', '08', '10', '07', 'PACCARITAMBO', '193');
INSERT INTO `ubigeo` VALUES ('851', '08', '10', '08', 'PILLPINTO', '193');
INSERT INTO `ubigeo` VALUES ('852', '08', '10', '09', 'YAURISQUE', '193');
INSERT INTO `ubigeo` VALUES ('853', '08', '11', '00', 'PAUCARTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('854', '08', '11', '01', 'PAUCARTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('855', '08', '11', '02', 'CAICAY', '193');
INSERT INTO `ubigeo` VALUES ('856', '08', '11', '03', 'CHALLABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('857', '08', '11', '04', 'COLQUEPATA', '193');
INSERT INTO `ubigeo` VALUES ('858', '08', '11', '05', 'HUANCARANI', '193');
INSERT INTO `ubigeo` VALUES ('859', '08', '11', '06', 'KOSÑIPATA', '193');
INSERT INTO `ubigeo` VALUES ('860', '08', '12', '00', 'QUISPICANCHI', '193');
INSERT INTO `ubigeo` VALUES ('861', '08', '12', '01', 'URCOS', '193');
INSERT INTO `ubigeo` VALUES ('862', '08', '12', '02', 'ANDAHUAYLILLAS', '193');
INSERT INTO `ubigeo` VALUES ('863', '08', '12', '03', 'CAMANTI', '193');
INSERT INTO `ubigeo` VALUES ('864', '08', '12', '04', 'CCARHUAYO', '193');
INSERT INTO `ubigeo` VALUES ('865', '08', '12', '05', 'CCATCA', '193');
INSERT INTO `ubigeo` VALUES ('866', '08', '12', '06', 'CUSIPATA', '193');
INSERT INTO `ubigeo` VALUES ('867', '08', '12', '07', 'HUARO', '193');
INSERT INTO `ubigeo` VALUES ('868', '08', '12', '08', 'LUCRE', '193');
INSERT INTO `ubigeo` VALUES ('869', '08', '12', '09', 'MARCAPATA', '193');
INSERT INTO `ubigeo` VALUES ('870', '08', '12', '10', 'OCONGATE', '193');
INSERT INTO `ubigeo` VALUES ('871', '08', '12', '11', 'OROPESA', '193');
INSERT INTO `ubigeo` VALUES ('872', '08', '12', '12', 'QUIQUIJANA', '193');
INSERT INTO `ubigeo` VALUES ('873', '08', '13', '00', 'URUBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('874', '08', '13', '01', 'URUBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('875', '08', '13', '02', 'CHINCHERO', '193');
INSERT INTO `ubigeo` VALUES ('876', '08', '13', '03', 'HUAYLLABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('877', '08', '13', '04', 'MACHUPICCHU', '193');
INSERT INTO `ubigeo` VALUES ('878', '08', '13', '05', 'MARAS', '193');
INSERT INTO `ubigeo` VALUES ('879', '08', '13', '06', 'OLLANTAYTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('880', '08', '13', '07', 'YUCAY', '193');
INSERT INTO `ubigeo` VALUES ('881', '09', '00', '00', 'HUANCAVELICA', '193');
INSERT INTO `ubigeo` VALUES ('882', '09', '01', '00', 'HUANCAVELICA', '193');
INSERT INTO `ubigeo` VALUES ('883', '09', '01', '01', 'HUANCAVELICA', '193');
INSERT INTO `ubigeo` VALUES ('884', '09', '01', '02', 'ACOBAMBILLA', '193');
INSERT INTO `ubigeo` VALUES ('885', '09', '01', '03', 'ACORIA', '193');
INSERT INTO `ubigeo` VALUES ('886', '09', '01', '04', 'CONAYCA', '193');
INSERT INTO `ubigeo` VALUES ('887', '09', '01', '05', 'CUENCA', '193');
INSERT INTO `ubigeo` VALUES ('888', '09', '01', '06', 'HUACHOCOLPA', '193');
INSERT INTO `ubigeo` VALUES ('889', '09', '01', '07', 'HUAYLLAHUARA', '193');
INSERT INTO `ubigeo` VALUES ('890', '09', '01', '08', 'IZCUCHACA', '193');
INSERT INTO `ubigeo` VALUES ('891', '09', '01', '09', 'LARIA', '193');
INSERT INTO `ubigeo` VALUES ('892', '09', '01', '10', 'MANTA', '193');
INSERT INTO `ubigeo` VALUES ('893', '09', '01', '11', 'MARISCAL CACERES', '193');
INSERT INTO `ubigeo` VALUES ('894', '09', '01', '12', 'MOYA', '193');
INSERT INTO `ubigeo` VALUES ('895', '09', '01', '13', 'NUEVO OCCORO', '193');
INSERT INTO `ubigeo` VALUES ('896', '09', '01', '14', 'PALCA', '193');
INSERT INTO `ubigeo` VALUES ('897', '09', '01', '15', 'PILCHACA', '193');
INSERT INTO `ubigeo` VALUES ('898', '09', '01', '16', 'VILCA', '193');
INSERT INTO `ubigeo` VALUES ('899', '09', '01', '17', 'YAULI', '193');
INSERT INTO `ubigeo` VALUES ('900', '09', '01', '18', 'ASCENSION', '193');
INSERT INTO `ubigeo` VALUES ('901', '09', '01', '19', 'HUANDO', '193');
INSERT INTO `ubigeo` VALUES ('902', '09', '02', '00', 'ACOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('903', '09', '02', '01', 'ACOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('904', '09', '02', '02', 'ANDABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('905', '09', '02', '03', 'ANTA', '193');
INSERT INTO `ubigeo` VALUES ('906', '09', '02', '04', 'CAJA', '193');
INSERT INTO `ubigeo` VALUES ('907', '09', '02', '05', 'MARCAS', '193');
INSERT INTO `ubigeo` VALUES ('908', '09', '02', '06', 'PAUCARA', '193');
INSERT INTO `ubigeo` VALUES ('909', '09', '02', '07', 'POMACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('910', '09', '02', '08', 'ROSARIO', '193');
INSERT INTO `ubigeo` VALUES ('911', '09', '03', '00', 'ANGARAES', '193');
INSERT INTO `ubigeo` VALUES ('912', '09', '03', '01', 'LIRCAY', '193');
INSERT INTO `ubigeo` VALUES ('913', '09', '03', '02', 'ANCHONGA', '193');
INSERT INTO `ubigeo` VALUES ('914', '09', '03', '03', 'CALLANMARCA', '193');
INSERT INTO `ubigeo` VALUES ('915', '09', '03', '04', 'CCOCHACCASA', '193');
INSERT INTO `ubigeo` VALUES ('916', '09', '03', '05', 'CHINCHO', '193');
INSERT INTO `ubigeo` VALUES ('917', '09', '03', '06', 'CONGALLA', '193');
INSERT INTO `ubigeo` VALUES ('918', '09', '03', '07', 'HUANCA-HUANCA', '193');
INSERT INTO `ubigeo` VALUES ('919', '09', '03', '08', 'HUAYLLAY GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('920', '09', '03', '09', 'JULCAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('921', '09', '03', '10', 'SAN ANTONIO DE ANTAPARCO', '193');
INSERT INTO `ubigeo` VALUES ('922', '09', '03', '11', 'SANTO TOMAS DE PATA', '193');
INSERT INTO `ubigeo` VALUES ('923', '09', '03', '12', 'SECCLLA', '193');
INSERT INTO `ubigeo` VALUES ('924', '09', '04', '00', 'CASTROVIRREYNA', '193');
INSERT INTO `ubigeo` VALUES ('925', '09', '04', '01', 'CASTROVIRREYNA', '193');
INSERT INTO `ubigeo` VALUES ('926', '09', '04', '02', 'ARMA', '193');
INSERT INTO `ubigeo` VALUES ('927', '09', '04', '03', 'AURAHUA', '193');
INSERT INTO `ubigeo` VALUES ('928', '09', '04', '04', 'CAPILLAS', '193');
INSERT INTO `ubigeo` VALUES ('929', '09', '04', '05', 'CHUPAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('930', '09', '04', '06', 'COCAS', '193');
INSERT INTO `ubigeo` VALUES ('931', '09', '04', '07', 'HUACHOS', '193');
INSERT INTO `ubigeo` VALUES ('932', '09', '04', '08', 'HUAMATAMBO', '193');
INSERT INTO `ubigeo` VALUES ('933', '09', '04', '09', 'MOLLEPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('934', '09', '04', '10', 'SAN JUAN', '193');
INSERT INTO `ubigeo` VALUES ('935', '09', '04', '11', 'SANTA ANA', '193');
INSERT INTO `ubigeo` VALUES ('936', '09', '04', '12', 'TANTARA', '193');
INSERT INTO `ubigeo` VALUES ('937', '09', '04', '13', 'TICRAPO', '193');
INSERT INTO `ubigeo` VALUES ('938', '09', '05', '00', 'CHURCAMPA', '193');
INSERT INTO `ubigeo` VALUES ('939', '09', '05', '01', 'CHURCAMPA', '193');
INSERT INTO `ubigeo` VALUES ('940', '09', '05', '02', 'ANCO', '193');
INSERT INTO `ubigeo` VALUES ('941', '09', '05', '03', 'CHINCHIHUASI', '193');
INSERT INTO `ubigeo` VALUES ('942', '09', '05', '04', 'EL CARMEN', '193');
INSERT INTO `ubigeo` VALUES ('943', '09', '05', '05', 'LA MERCED', '193');
INSERT INTO `ubigeo` VALUES ('944', '09', '05', '06', 'LOCROJA', '193');
INSERT INTO `ubigeo` VALUES ('945', '09', '05', '07', 'PAUCARBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('946', '09', '05', '08', 'SAN MIGUEL DE MAYOCC', '193');
INSERT INTO `ubigeo` VALUES ('947', '09', '05', '09', 'SAN PEDRO DE CORIS', '193');
INSERT INTO `ubigeo` VALUES ('948', '09', '05', '10', 'PACHAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('949', '09', '05', '11', 'COSME', '193');
INSERT INTO `ubigeo` VALUES ('950', '09', '06', '00', 'HUAYTARA', '193');
INSERT INTO `ubigeo` VALUES ('951', '09', '06', '01', 'HUAYTARA', '193');
INSERT INTO `ubigeo` VALUES ('952', '09', '06', '02', 'AYAVI', '193');
INSERT INTO `ubigeo` VALUES ('953', '09', '06', '03', 'CORDOVA', '193');
INSERT INTO `ubigeo` VALUES ('954', '09', '06', '04', 'HUAYACUNDO ARMA', '193');
INSERT INTO `ubigeo` VALUES ('955', '09', '06', '05', 'LARAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('956', '09', '06', '06', 'OCOYO', '193');
INSERT INTO `ubigeo` VALUES ('957', '09', '06', '07', 'PILPICHACA', '193');
INSERT INTO `ubigeo` VALUES ('958', '09', '06', '08', 'QUERCO', '193');
INSERT INTO `ubigeo` VALUES ('959', '09', '06', '09', 'QUITO-ARMA', '193');
INSERT INTO `ubigeo` VALUES ('960', '09', '06', '10', 'SAN ANTONIO DE CUSICANCHA', '193');
INSERT INTO `ubigeo` VALUES ('961', '09', '06', '11', 'SAN FRANCISCO DE SANGAYAICO', '193');
INSERT INTO `ubigeo` VALUES ('962', '09', '06', '12', 'SAN ISIDRO', '193');
INSERT INTO `ubigeo` VALUES ('963', '09', '06', '13', 'SANTIAGO DE CHOCORVOS', '193');
INSERT INTO `ubigeo` VALUES ('964', '09', '06', '14', 'SANTIAGO DE QUIRAHUARA', '193');
INSERT INTO `ubigeo` VALUES ('965', '09', '06', '15', 'SANTO DOMINGO DE CAPILLAS', '193');
INSERT INTO `ubigeo` VALUES ('966', '09', '06', '16', 'TAMBO', '193');
INSERT INTO `ubigeo` VALUES ('967', '09', '07', '00', 'TAYACAJA', '193');
INSERT INTO `ubigeo` VALUES ('968', '09', '07', '01', 'PAMPAS', '193');
INSERT INTO `ubigeo` VALUES ('969', '09', '07', '02', 'ACOSTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('970', '09', '07', '03', 'ACRAQUIA', '193');
INSERT INTO `ubigeo` VALUES ('971', '09', '07', '04', 'AHUAYCHA', '193');
INSERT INTO `ubigeo` VALUES ('972', '09', '07', '05', 'COLCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('973', '09', '07', '06', 'DANIEL HERNANDEZ', '193');
INSERT INTO `ubigeo` VALUES ('974', '09', '07', '07', 'HUACHOCOLPA', '193');
INSERT INTO `ubigeo` VALUES ('975', '09', '07', '09', 'HUARIBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('976', '09', '07', '10', 'ÑAHUIMPUQUIO', '193');
INSERT INTO `ubigeo` VALUES ('977', '09', '07', '11', 'PAZOS', '193');
INSERT INTO `ubigeo` VALUES ('978', '09', '07', '13', 'QUISHUAR', '193');
INSERT INTO `ubigeo` VALUES ('979', '09', '07', '14', 'SALCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('980', '09', '07', '15', 'SALCAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('981', '09', '07', '16', 'SAN MARCOS DE ROCCHAC', '193');
INSERT INTO `ubigeo` VALUES ('982', '09', '07', '17', 'SURCUBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('983', '09', '07', '18', 'TINTAY PUNCU', '193');
INSERT INTO `ubigeo` VALUES ('984', '10', '00', '00', 'HUANUCO', '193');
INSERT INTO `ubigeo` VALUES ('985', '10', '01', '00', 'HUANUCO', '193');
INSERT INTO `ubigeo` VALUES ('986', '10', '01', '01', 'HUANUCO', '193');
INSERT INTO `ubigeo` VALUES ('987', '10', '01', '02', 'AMARILIS', '193');
INSERT INTO `ubigeo` VALUES ('988', '10', '01', '03', 'CHINCHAO', '193');
INSERT INTO `ubigeo` VALUES ('989', '10', '01', '04', 'CHURUBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('990', '10', '01', '05', 'MARGOS', '193');
INSERT INTO `ubigeo` VALUES ('991', '10', '01', '06', 'QUISQUI (KICHKI)', '193');
INSERT INTO `ubigeo` VALUES ('992', '10', '01', '07', 'SAN FRANCISCO DE CAYRAN', '193');
INSERT INTO `ubigeo` VALUES ('993', '10', '01', '08', 'SAN PEDRO DE CHAULAN', '193');
INSERT INTO `ubigeo` VALUES ('994', '10', '01', '09', 'SANTA MARIA DEL VALLE', '193');
INSERT INTO `ubigeo` VALUES ('995', '10', '01', '10', 'YARUMAYO', '193');
INSERT INTO `ubigeo` VALUES ('996', '10', '01', '11', 'PILLCO MARCA', '193');
INSERT INTO `ubigeo` VALUES ('997', '10', '01', '12', 'YACUS', '193');
INSERT INTO `ubigeo` VALUES ('998', '10', '02', '00', 'AMBO', '193');
INSERT INTO `ubigeo` VALUES ('999', '10', '02', '01', 'AMBO', '193');
INSERT INTO `ubigeo` VALUES ('1000', '10', '02', '02', 'CAYNA', '193');
INSERT INTO `ubigeo` VALUES ('1001', '10', '02', '03', 'COLPAS', '193');
INSERT INTO `ubigeo` VALUES ('1002', '10', '02', '04', 'CONCHAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1003', '10', '02', '05', 'HUACAR', '193');
INSERT INTO `ubigeo` VALUES ('1004', '10', '02', '06', 'SAN FRANCISCO', '193');
INSERT INTO `ubigeo` VALUES ('1005', '10', '02', '07', 'SAN RAFAEL', '193');
INSERT INTO `ubigeo` VALUES ('1006', '10', '02', '08', 'TOMAY KICHWA', '193');
INSERT INTO `ubigeo` VALUES ('1007', '10', '03', '00', 'DOS DE MAYO', '193');
INSERT INTO `ubigeo` VALUES ('1008', '10', '03', '01', 'LA UNION', '193');
INSERT INTO `ubigeo` VALUES ('1009', '10', '03', '07', 'CHUQUIS', '193');
INSERT INTO `ubigeo` VALUES ('1010', '10', '03', '11', 'MARIAS', '193');
INSERT INTO `ubigeo` VALUES ('1011', '10', '03', '13', 'PACHAS', '193');
INSERT INTO `ubigeo` VALUES ('1012', '10', '03', '16', 'QUIVILLA', '193');
INSERT INTO `ubigeo` VALUES ('1013', '10', '03', '17', 'RIPAN', '193');
INSERT INTO `ubigeo` VALUES ('1014', '10', '03', '21', 'SHUNQUI', '193');
INSERT INTO `ubigeo` VALUES ('1015', '10', '03', '22', 'SILLAPATA', '193');
INSERT INTO `ubigeo` VALUES ('1016', '10', '03', '23', 'YANAS', '193');
INSERT INTO `ubigeo` VALUES ('1017', '10', '04', '00', 'HUACAYBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1018', '10', '04', '01', 'HUACAYBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1019', '10', '04', '02', 'CANCHABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1020', '10', '04', '03', 'COCHABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1021', '10', '04', '04', 'PINRA', '193');
INSERT INTO `ubigeo` VALUES ('1022', '10', '05', '00', 'HUAMALIES', '193');
INSERT INTO `ubigeo` VALUES ('1023', '10', '05', '01', 'LLATA', '193');
INSERT INTO `ubigeo` VALUES ('1024', '10', '05', '02', 'ARANCAY', '193');
INSERT INTO `ubigeo` VALUES ('1025', '10', '05', '03', 'CHAVIN DE PARIARCA', '193');
INSERT INTO `ubigeo` VALUES ('1026', '10', '05', '04', 'JACAS GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('1027', '10', '05', '05', 'JIRCAN', '193');
INSERT INTO `ubigeo` VALUES ('1028', '10', '05', '06', 'MIRAFLORES', '193');
INSERT INTO `ubigeo` VALUES ('1029', '10', '05', '07', 'MONZON', '193');
INSERT INTO `ubigeo` VALUES ('1030', '10', '05', '08', 'PUNCHAO', '193');
INSERT INTO `ubigeo` VALUES ('1031', '10', '05', '09', 'PUÑOS', '193');
INSERT INTO `ubigeo` VALUES ('1032', '10', '05', '10', 'SINGA', '193');
INSERT INTO `ubigeo` VALUES ('1033', '10', '05', '11', 'TANTAMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1034', '10', '06', '00', 'LEONCIO PRADO', '193');
INSERT INTO `ubigeo` VALUES ('1035', '10', '06', '01', 'RUPA-RUPA', '193');
INSERT INTO `ubigeo` VALUES ('1036', '10', '06', '02', 'DANIEL ALOMIA ROBLES', '193');
INSERT INTO `ubigeo` VALUES ('1037', '10', '06', '03', 'HERMILIO VALDIZAN', '193');
INSERT INTO `ubigeo` VALUES ('1038', '10', '06', '04', 'JOSE CRESPO Y CASTILLO', '193');
INSERT INTO `ubigeo` VALUES ('1039', '10', '06', '05', 'LUYANDO', '193');
INSERT INTO `ubigeo` VALUES ('1040', '10', '06', '06', 'MARIANO DAMASO BERAUN', '193');
INSERT INTO `ubigeo` VALUES ('1041', '10', '07', '00', 'MARAÑON', '193');
INSERT INTO `ubigeo` VALUES ('1042', '10', '07', '01', 'HUACRACHUCO', '193');
INSERT INTO `ubigeo` VALUES ('1043', '10', '07', '02', 'CHOLON', '193');
INSERT INTO `ubigeo` VALUES ('1044', '10', '07', '03', 'SAN BUENAVENTURA', '193');
INSERT INTO `ubigeo` VALUES ('1045', '10', '08', '00', 'PACHITEA', '193');
INSERT INTO `ubigeo` VALUES ('1046', '10', '08', '01', 'PANAO', '193');
INSERT INTO `ubigeo` VALUES ('1047', '10', '08', '02', 'CHAGLLA', '193');
INSERT INTO `ubigeo` VALUES ('1048', '10', '08', '03', 'MOLINO', '193');
INSERT INTO `ubigeo` VALUES ('1049', '10', '08', '04', 'UMARI', '193');
INSERT INTO `ubigeo` VALUES ('1050', '10', '09', '00', 'PUERTO INCA', '193');
INSERT INTO `ubigeo` VALUES ('1051', '10', '09', '01', 'PUERTO INCA', '193');
INSERT INTO `ubigeo` VALUES ('1052', '10', '09', '02', 'CODO DEL POZUZO', '193');
INSERT INTO `ubigeo` VALUES ('1053', '10', '09', '03', 'HONORIA', '193');
INSERT INTO `ubigeo` VALUES ('1054', '10', '09', '04', 'TOURNAVISTA', '193');
INSERT INTO `ubigeo` VALUES ('1055', '10', '09', '05', 'YUYAPICHIS', '193');
INSERT INTO `ubigeo` VALUES ('1056', '10', '10', '00', 'LAURICOCHA', '193');
INSERT INTO `ubigeo` VALUES ('1057', '10', '10', '01', 'JESUS', '193');
INSERT INTO `ubigeo` VALUES ('1058', '10', '10', '02', 'BAÑOS', '193');
INSERT INTO `ubigeo` VALUES ('1059', '10', '10', '03', 'JIVIA', '193');
INSERT INTO `ubigeo` VALUES ('1060', '10', '10', '04', 'QUEROPALCA', '193');
INSERT INTO `ubigeo` VALUES ('1061', '10', '10', '05', 'RONDOS', '193');
INSERT INTO `ubigeo` VALUES ('1062', '10', '10', '06', 'SAN FRANCISCO DE ASIS', '193');
INSERT INTO `ubigeo` VALUES ('1063', '10', '10', '07', 'SAN MIGUEL DE CAURI', '193');
INSERT INTO `ubigeo` VALUES ('1064', '10', '11', '00', 'YAROWILCA', '193');
INSERT INTO `ubigeo` VALUES ('1065', '10', '11', '01', 'CHAVINILLO', '193');
INSERT INTO `ubigeo` VALUES ('1066', '10', '11', '02', 'CAHUAC', '193');
INSERT INTO `ubigeo` VALUES ('1067', '10', '11', '03', 'CHACABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1068', '10', '11', '04', 'APARICIO POMARES', '193');
INSERT INTO `ubigeo` VALUES ('1069', '10', '11', '05', 'JACAS CHICO', '193');
INSERT INTO `ubigeo` VALUES ('1070', '10', '11', '06', 'OBAS', '193');
INSERT INTO `ubigeo` VALUES ('1071', '10', '11', '07', 'PAMPAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1072', '10', '11', '08', 'CHORAS', '193');
INSERT INTO `ubigeo` VALUES ('1073', '11', '00', '00', 'ICA', '193');
INSERT INTO `ubigeo` VALUES ('1074', '11', '01', '00', 'ICA', '193');
INSERT INTO `ubigeo` VALUES ('1075', '11', '01', '01', 'ICA', '193');
INSERT INTO `ubigeo` VALUES ('1076', '11', '01', '02', 'LA TINGUIÑA', '193');
INSERT INTO `ubigeo` VALUES ('1077', '11', '01', '03', 'LOS AQUIJES', '193');
INSERT INTO `ubigeo` VALUES ('1078', '11', '01', '04', 'OCUCAJE', '193');
INSERT INTO `ubigeo` VALUES ('1079', '11', '01', '05', 'PACHACUTEC', '193');
INSERT INTO `ubigeo` VALUES ('1080', '11', '01', '06', 'PARCONA', '193');
INSERT INTO `ubigeo` VALUES ('1081', '11', '01', '07', 'PUEBLO NUEVO', '193');
INSERT INTO `ubigeo` VALUES ('1082', '11', '01', '08', 'SALAS', '193');
INSERT INTO `ubigeo` VALUES ('1083', '11', '01', '09', 'SAN JOSE DE LOS MOLINOS', '193');
INSERT INTO `ubigeo` VALUES ('1084', '11', '01', '10', 'SAN JUAN BAUTISTA', '193');
INSERT INTO `ubigeo` VALUES ('1085', '11', '01', '11', 'SANTIAGO', '193');
INSERT INTO `ubigeo` VALUES ('1086', '11', '01', '12', 'SUBTANJALLA', '193');
INSERT INTO `ubigeo` VALUES ('1087', '11', '01', '13', 'TATE', '193');
INSERT INTO `ubigeo` VALUES ('1088', '11', '01', '14', 'YAUCA DEL ROSARIO', '193');
INSERT INTO `ubigeo` VALUES ('1089', '11', '02', '00', 'CHINCHA', '193');
INSERT INTO `ubigeo` VALUES ('1090', '11', '02', '01', 'CHINCHA ALTA', '193');
INSERT INTO `ubigeo` VALUES ('1091', '11', '02', '02', 'ALTO LARAN', '193');
INSERT INTO `ubigeo` VALUES ('1092', '11', '02', '03', 'CHAVIN', '193');
INSERT INTO `ubigeo` VALUES ('1093', '11', '02', '04', 'CHINCHA BAJA', '193');
INSERT INTO `ubigeo` VALUES ('1094', '11', '02', '05', 'EL CARMEN', '193');
INSERT INTO `ubigeo` VALUES ('1095', '11', '02', '06', 'GROCIO PRADO', '193');
INSERT INTO `ubigeo` VALUES ('1096', '11', '02', '07', 'PUEBLO NUEVO', '193');
INSERT INTO `ubigeo` VALUES ('1097', '11', '02', '08', 'SAN JUAN DE YANAC', '193');
INSERT INTO `ubigeo` VALUES ('1098', '11', '02', '09', 'SAN PEDRO DE HUACARPANA', '193');
INSERT INTO `ubigeo` VALUES ('1099', '11', '02', '10', 'SUNAMPE', '193');
INSERT INTO `ubigeo` VALUES ('1100', '11', '02', '11', 'TAMBO DE MORA', '193');
INSERT INTO `ubigeo` VALUES ('1101', '11', '03', '00', 'NAZCA', '193');
INSERT INTO `ubigeo` VALUES ('1102', '11', '03', '01', 'NAZCA', '193');
INSERT INTO `ubigeo` VALUES ('1103', '11', '03', '02', 'CHANGUILLO', '193');
INSERT INTO `ubigeo` VALUES ('1104', '11', '03', '03', 'EL INGENIO', '193');
INSERT INTO `ubigeo` VALUES ('1105', '11', '03', '04', 'MARCONA', '193');
INSERT INTO `ubigeo` VALUES ('1106', '11', '03', '05', 'VISTA ALEGRE', '193');
INSERT INTO `ubigeo` VALUES ('1107', '11', '04', '00', 'PALPA', '193');
INSERT INTO `ubigeo` VALUES ('1108', '11', '04', '01', 'PALPA', '193');
INSERT INTO `ubigeo` VALUES ('1109', '11', '04', '02', 'LLIPATA', '193');
INSERT INTO `ubigeo` VALUES ('1110', '11', '04', '03', 'RIO GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('1111', '11', '04', '04', 'SANTA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('1112', '11', '04', '05', 'TIBILLO', '193');
INSERT INTO `ubigeo` VALUES ('1113', '11', '05', '00', 'PISCO', '193');
INSERT INTO `ubigeo` VALUES ('1114', '11', '05', '01', 'PISCO', '193');
INSERT INTO `ubigeo` VALUES ('1115', '11', '05', '02', 'HUANCANO', '193');
INSERT INTO `ubigeo` VALUES ('1116', '11', '05', '03', 'HUMAY', '193');
INSERT INTO `ubigeo` VALUES ('1117', '11', '05', '04', 'INDEPENDENCIA', '193');
INSERT INTO `ubigeo` VALUES ('1118', '11', '05', '05', 'PARACAS', '193');
INSERT INTO `ubigeo` VALUES ('1119', '11', '05', '06', 'SAN ANDRES', '193');
INSERT INTO `ubigeo` VALUES ('1120', '11', '05', '07', 'SAN CLEMENTE', '193');
INSERT INTO `ubigeo` VALUES ('1121', '11', '05', '08', 'TUPAC AMARU INCA', '193');
INSERT INTO `ubigeo` VALUES ('1122', '12', '00', '00', 'JUNIN', '193');
INSERT INTO `ubigeo` VALUES ('1123', '12', '01', '00', 'HUANCAYO', '193');
INSERT INTO `ubigeo` VALUES ('1124', '12', '01', '01', 'HUANCAYO', '193');
INSERT INTO `ubigeo` VALUES ('1125', '12', '01', '04', 'CARHUACALLANGA', '193');
INSERT INTO `ubigeo` VALUES ('1126', '12', '01', '05', 'CHACAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1127', '12', '01', '06', 'CHICCHE', '193');
INSERT INTO `ubigeo` VALUES ('1128', '12', '01', '07', 'CHILCA', '193');
INSERT INTO `ubigeo` VALUES ('1129', '12', '01', '08', 'CHONGOS ALTO', '193');
INSERT INTO `ubigeo` VALUES ('1130', '12', '01', '11', 'CHUPURO', '193');
INSERT INTO `ubigeo` VALUES ('1131', '12', '01', '12', 'COLCA', '193');
INSERT INTO `ubigeo` VALUES ('1132', '12', '01', '13', 'CULLHUAS', '193');
INSERT INTO `ubigeo` VALUES ('1133', '12', '01', '14', 'EL TAMBO', '193');
INSERT INTO `ubigeo` VALUES ('1134', '12', '01', '16', 'HUACRAPUQUIO', '193');
INSERT INTO `ubigeo` VALUES ('1135', '12', '01', '17', 'HUALHUAS', '193');
INSERT INTO `ubigeo` VALUES ('1136', '12', '01', '19', 'HUANCAN', '193');
INSERT INTO `ubigeo` VALUES ('1137', '12', '01', '20', 'HUASICANCHA', '193');
INSERT INTO `ubigeo` VALUES ('1138', '12', '01', '21', 'HUAYUCACHI', '193');
INSERT INTO `ubigeo` VALUES ('1139', '12', '01', '22', 'INGENIO', '193');
INSERT INTO `ubigeo` VALUES ('1140', '12', '01', '24', 'PARIAHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('1141', '12', '01', '25', 'PILCOMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1142', '12', '01', '26', 'PUCARA', '193');
INSERT INTO `ubigeo` VALUES ('1143', '12', '01', '27', 'QUICHUAY', '193');
INSERT INTO `ubigeo` VALUES ('1144', '12', '01', '28', 'QUILCAS', '193');
INSERT INTO `ubigeo` VALUES ('1145', '12', '01', '29', 'SAN AGUSTIN', '193');
INSERT INTO `ubigeo` VALUES ('1146', '12', '01', '30', 'SAN JERONIMO DE TUNAN', '193');
INSERT INTO `ubigeo` VALUES ('1147', '12', '01', '32', 'SAÑO', '193');
INSERT INTO `ubigeo` VALUES ('1148', '12', '01', '33', 'SAPALLANGA', '193');
INSERT INTO `ubigeo` VALUES ('1149', '12', '01', '34', 'SICAYA', '193');
INSERT INTO `ubigeo` VALUES ('1150', '12', '01', '35', 'SANTO DOMINGO DE ACOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1151', '12', '01', '36', 'VIQUES', '193');
INSERT INTO `ubigeo` VALUES ('1152', '12', '02', '00', 'CONCEPCION', '193');
INSERT INTO `ubigeo` VALUES ('1153', '12', '02', '01', 'CONCEPCION', '193');
INSERT INTO `ubigeo` VALUES ('1154', '12', '02', '02', 'ACO', '193');
INSERT INTO `ubigeo` VALUES ('1155', '12', '02', '03', 'ANDAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1156', '12', '02', '04', 'CHAMBARA', '193');
INSERT INTO `ubigeo` VALUES ('1157', '12', '02', '05', 'COCHAS', '193');
INSERT INTO `ubigeo` VALUES ('1158', '12', '02', '06', 'COMAS', '193');
INSERT INTO `ubigeo` VALUES ('1159', '12', '02', '07', 'HEROINAS TOLEDO', '193');
INSERT INTO `ubigeo` VALUES ('1160', '12', '02', '08', 'MANZANARES', '193');
INSERT INTO `ubigeo` VALUES ('1161', '12', '02', '09', 'MARISCAL CASTILLA', '193');
INSERT INTO `ubigeo` VALUES ('1162', '12', '02', '10', 'MATAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('1163', '12', '02', '11', 'MITO', '193');
INSERT INTO `ubigeo` VALUES ('1164', '12', '02', '12', 'NUEVE DE JULIO', '193');
INSERT INTO `ubigeo` VALUES ('1165', '12', '02', '13', 'ORCOTUNA', '193');
INSERT INTO `ubigeo` VALUES ('1166', '12', '02', '14', 'SAN JOSE DE QUERO', '193');
INSERT INTO `ubigeo` VALUES ('1167', '12', '02', '15', 'SANTA ROSA DE OCOPA', '193');
INSERT INTO `ubigeo` VALUES ('1168', '12', '03', '00', 'CHANCHAMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1169', '12', '03', '01', 'CHANCHAMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1170', '12', '03', '02', 'PERENE', '193');
INSERT INTO `ubigeo` VALUES ('1171', '12', '03', '03', 'PICHANAQUI', '193');
INSERT INTO `ubigeo` VALUES ('1172', '12', '03', '04', 'SAN LUIS DE SHUARO', '193');
INSERT INTO `ubigeo` VALUES ('1173', '12', '03', '05', 'SAN RAMON', '193');
INSERT INTO `ubigeo` VALUES ('1174', '12', '03', '06', 'VITOC', '193');
INSERT INTO `ubigeo` VALUES ('1175', '12', '04', '00', 'JAUJA', '193');
INSERT INTO `ubigeo` VALUES ('1176', '12', '04', '01', 'JAUJA', '193');
INSERT INTO `ubigeo` VALUES ('1177', '12', '04', '02', 'ACOLLA', '193');
INSERT INTO `ubigeo` VALUES ('1178', '12', '04', '03', 'APATA', '193');
INSERT INTO `ubigeo` VALUES ('1179', '12', '04', '04', 'ATAURA', '193');
INSERT INTO `ubigeo` VALUES ('1180', '12', '04', '05', 'CANCHAYLLO', '193');
INSERT INTO `ubigeo` VALUES ('1181', '12', '04', '06', 'CURICACA', '193');
INSERT INTO `ubigeo` VALUES ('1182', '12', '04', '07', 'EL MANTARO', '193');
INSERT INTO `ubigeo` VALUES ('1183', '12', '04', '08', 'HUAMALI', '193');
INSERT INTO `ubigeo` VALUES ('1184', '12', '04', '09', 'HUARIPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1185', '12', '04', '10', 'HUERTAS', '193');
INSERT INTO `ubigeo` VALUES ('1186', '12', '04', '11', 'JANJAILLO', '193');
INSERT INTO `ubigeo` VALUES ('1187', '12', '04', '12', 'JULCAN', '193');
INSERT INTO `ubigeo` VALUES ('1188', '12', '04', '13', 'LEONOR ORDOÑEZ', '193');
INSERT INTO `ubigeo` VALUES ('1189', '12', '04', '14', 'LLOCLLAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1190', '12', '04', '15', 'MARCO', '193');
INSERT INTO `ubigeo` VALUES ('1191', '12', '04', '16', 'MASMA', '193');
INSERT INTO `ubigeo` VALUES ('1192', '12', '04', '17', 'MASMA CHICCHE', '193');
INSERT INTO `ubigeo` VALUES ('1193', '12', '04', '18', 'MOLINOS', '193');
INSERT INTO `ubigeo` VALUES ('1194', '12', '04', '19', 'MONOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1195', '12', '04', '20', 'MUQUI', '193');
INSERT INTO `ubigeo` VALUES ('1196', '12', '04', '21', 'MUQUIYAUYO', '193');
INSERT INTO `ubigeo` VALUES ('1197', '12', '04', '22', 'PACA', '193');
INSERT INTO `ubigeo` VALUES ('1198', '12', '04', '23', 'PACCHA', '193');
INSERT INTO `ubigeo` VALUES ('1199', '12', '04', '24', 'PANCAN', '193');
INSERT INTO `ubigeo` VALUES ('1200', '12', '04', '25', 'PARCO', '193');
INSERT INTO `ubigeo` VALUES ('1201', '12', '04', '26', 'POMACANCHA', '193');
INSERT INTO `ubigeo` VALUES ('1202', '12', '04', '27', 'RICRAN', '193');
INSERT INTO `ubigeo` VALUES ('1203', '12', '04', '28', 'SAN LORENZO', '193');
INSERT INTO `ubigeo` VALUES ('1204', '12', '04', '29', 'SAN PEDRO DE CHUNAN', '193');
INSERT INTO `ubigeo` VALUES ('1205', '12', '04', '30', 'SAUSA', '193');
INSERT INTO `ubigeo` VALUES ('1206', '12', '04', '31', 'SINCOS', '193');
INSERT INTO `ubigeo` VALUES ('1207', '12', '04', '32', 'TUNAN MARCA', '193');
INSERT INTO `ubigeo` VALUES ('1208', '12', '04', '33', 'YAULI', '193');
INSERT INTO `ubigeo` VALUES ('1209', '12', '04', '34', 'YAUYOS', '193');
INSERT INTO `ubigeo` VALUES ('1210', '12', '05', '00', 'JUNIN', '193');
INSERT INTO `ubigeo` VALUES ('1211', '12', '05', '01', 'JUNIN', '193');
INSERT INTO `ubigeo` VALUES ('1212', '12', '05', '02', 'CARHUAMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1213', '12', '05', '03', 'ONDORES', '193');
INSERT INTO `ubigeo` VALUES ('1214', '12', '05', '04', 'ULCUMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1215', '12', '06', '00', 'SATIPO', '193');
INSERT INTO `ubigeo` VALUES ('1216', '12', '06', '01', 'SATIPO', '193');
INSERT INTO `ubigeo` VALUES ('1217', '12', '06', '02', 'COVIRIALI', '193');
INSERT INTO `ubigeo` VALUES ('1218', '12', '06', '03', 'LLAYLLA', '193');
INSERT INTO `ubigeo` VALUES ('1219', '12', '06', '05', 'PAMPA HERMOSA', '193');
INSERT INTO `ubigeo` VALUES ('1220', '12', '06', '07', 'RIO NEGRO', '193');
INSERT INTO `ubigeo` VALUES ('1221', '12', '06', '08', 'RIO TAMBO', '193');
INSERT INTO `ubigeo` VALUES ('1222', '12', '06', '99', 'MAZAMARI - PANGOA', '193');
INSERT INTO `ubigeo` VALUES ('1223', '12', '07', '00', 'TARMA', '193');
INSERT INTO `ubigeo` VALUES ('1224', '12', '07', '01', 'TARMA', '193');
INSERT INTO `ubigeo` VALUES ('1225', '12', '07', '02', 'ACOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1226', '12', '07', '03', 'HUARICOLCA', '193');
INSERT INTO `ubigeo` VALUES ('1227', '12', '07', '04', 'HUASAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('1228', '12', '07', '05', 'LA UNION', '193');
INSERT INTO `ubigeo` VALUES ('1229', '12', '07', '06', 'PALCA', '193');
INSERT INTO `ubigeo` VALUES ('1230', '12', '07', '07', 'PALCAMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1231', '12', '07', '08', 'SAN PEDRO DE CAJAS', '193');
INSERT INTO `ubigeo` VALUES ('1232', '12', '07', '09', 'TAPO', '193');
INSERT INTO `ubigeo` VALUES ('1233', '12', '08', '00', 'YAULI', '193');
INSERT INTO `ubigeo` VALUES ('1234', '12', '08', '01', 'LA OROYA', '193');
INSERT INTO `ubigeo` VALUES ('1235', '12', '08', '02', 'CHACAPALPA', '193');
INSERT INTO `ubigeo` VALUES ('1236', '12', '08', '03', 'HUAY-HUAY', '193');
INSERT INTO `ubigeo` VALUES ('1237', '12', '08', '04', 'MARCAPOMACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('1238', '12', '08', '05', 'MOROCOCHA', '193');
INSERT INTO `ubigeo` VALUES ('1239', '12', '08', '06', 'PACCHA', '193');
INSERT INTO `ubigeo` VALUES ('1240', '12', '08', '07', 'SANTA BARBARA DE CARHUACAYAN', '193');
INSERT INTO `ubigeo` VALUES ('1241', '12', '08', '08', 'SANTA ROSA DE SACCO', '193');
INSERT INTO `ubigeo` VALUES ('1242', '12', '08', '09', 'SUITUCANCHA', '193');
INSERT INTO `ubigeo` VALUES ('1243', '12', '08', '10', 'YAULI', '193');
INSERT INTO `ubigeo` VALUES ('1244', '12', '09', '00', 'CHUPACA', '193');
INSERT INTO `ubigeo` VALUES ('1245', '12', '09', '01', 'CHUPACA', '193');
INSERT INTO `ubigeo` VALUES ('1246', '12', '09', '02', 'AHUAC', '193');
INSERT INTO `ubigeo` VALUES ('1247', '12', '09', '03', 'CHONGOS BAJO', '193');
INSERT INTO `ubigeo` VALUES ('1248', '12', '09', '04', 'HUACHAC', '193');
INSERT INTO `ubigeo` VALUES ('1249', '12', '09', '05', 'HUAMANCACA CHICO', '193');
INSERT INTO `ubigeo` VALUES ('1250', '12', '09', '06', 'SAN JUAN DE ISCOS', '193');
INSERT INTO `ubigeo` VALUES ('1251', '12', '09', '07', 'SAN JUAN DE JARPA', '193');
INSERT INTO `ubigeo` VALUES ('1252', '12', '09', '08', 'TRES DE DICIEMBRE', '193');
INSERT INTO `ubigeo` VALUES ('1253', '12', '09', '09', 'YANACANCHA', '193');
INSERT INTO `ubigeo` VALUES ('1254', '13', '00', '00', 'LA LIBERTAD', '193');
INSERT INTO `ubigeo` VALUES ('1255', '13', '01', '00', 'TRUJILLO', '193');
INSERT INTO `ubigeo` VALUES ('1256', '13', '01', '01', 'TRUJILLO', '193');
INSERT INTO `ubigeo` VALUES ('1257', '13', '01', '02', 'EL PORVENIR', '193');
INSERT INTO `ubigeo` VALUES ('1258', '13', '01', '03', 'FLORENCIA DE MORA', '193');
INSERT INTO `ubigeo` VALUES ('1259', '13', '01', '04', 'HUANCHACO', '193');
INSERT INTO `ubigeo` VALUES ('1260', '13', '01', '05', 'LA ESPERANZA', '193');
INSERT INTO `ubigeo` VALUES ('1261', '13', '01', '06', 'LAREDO', '193');
INSERT INTO `ubigeo` VALUES ('1262', '13', '01', '07', 'MOCHE', '193');
INSERT INTO `ubigeo` VALUES ('1263', '13', '01', '08', 'POROTO', '193');
INSERT INTO `ubigeo` VALUES ('1264', '13', '01', '09', 'SALAVERRY', '193');
INSERT INTO `ubigeo` VALUES ('1265', '13', '01', '10', 'SIMBAL', '193');
INSERT INTO `ubigeo` VALUES ('1266', '13', '01', '11', 'VICTOR LARCO HERRERA', '193');
INSERT INTO `ubigeo` VALUES ('1267', '13', '02', '00', 'ASCOPE', '193');
INSERT INTO `ubigeo` VALUES ('1268', '13', '02', '01', 'ASCOPE', '193');
INSERT INTO `ubigeo` VALUES ('1269', '13', '02', '02', 'CHICAMA', '193');
INSERT INTO `ubigeo` VALUES ('1270', '13', '02', '03', 'CHOCOPE', '193');
INSERT INTO `ubigeo` VALUES ('1271', '13', '02', '04', 'MAGDALENA DE CAO', '193');
INSERT INTO `ubigeo` VALUES ('1272', '13', '02', '05', 'PAIJAN', '193');
INSERT INTO `ubigeo` VALUES ('1273', '13', '02', '06', 'RAZURI', '193');
INSERT INTO `ubigeo` VALUES ('1274', '13', '02', '07', 'SANTIAGO DE CAO', '193');
INSERT INTO `ubigeo` VALUES ('1275', '13', '02', '08', 'CASA GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('1276', '13', '03', '00', 'BOLIVAR', '193');
INSERT INTO `ubigeo` VALUES ('1277', '13', '03', '01', 'BOLIVAR', '193');
INSERT INTO `ubigeo` VALUES ('1278', '13', '03', '02', 'BAMBAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1279', '13', '03', '03', 'CONDORMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1280', '13', '03', '04', 'LONGOTEA', '193');
INSERT INTO `ubigeo` VALUES ('1281', '13', '03', '05', 'UCHUMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1282', '13', '03', '06', 'UCUNCHA', '193');
INSERT INTO `ubigeo` VALUES ('1283', '13', '04', '00', 'CHEPEN', '193');
INSERT INTO `ubigeo` VALUES ('1284', '13', '04', '01', 'CHEPEN', '193');
INSERT INTO `ubigeo` VALUES ('1285', '13', '04', '02', 'PACANGA', '193');
INSERT INTO `ubigeo` VALUES ('1286', '13', '04', '03', 'PUEBLO NUEVO', '193');
INSERT INTO `ubigeo` VALUES ('1287', '13', '05', '00', 'JULCAN', '193');
INSERT INTO `ubigeo` VALUES ('1288', '13', '05', '01', 'JULCAN', '193');
INSERT INTO `ubigeo` VALUES ('1289', '13', '05', '02', 'CALAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1290', '13', '05', '03', 'CARABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1291', '13', '05', '04', 'HUASO', '193');
INSERT INTO `ubigeo` VALUES ('1292', '13', '06', '00', 'OTUZCO', '193');
INSERT INTO `ubigeo` VALUES ('1293', '13', '06', '01', 'OTUZCO', '193');
INSERT INTO `ubigeo` VALUES ('1294', '13', '06', '02', 'AGALLPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1295', '13', '06', '04', 'CHARAT', '193');
INSERT INTO `ubigeo` VALUES ('1296', '13', '06', '05', 'HUARANCHAL', '193');
INSERT INTO `ubigeo` VALUES ('1297', '13', '06', '06', 'LA CUESTA', '193');
INSERT INTO `ubigeo` VALUES ('1298', '13', '06', '08', 'MACHE', '193');
INSERT INTO `ubigeo` VALUES ('1299', '13', '06', '10', 'PARANDAY', '193');
INSERT INTO `ubigeo` VALUES ('1300', '13', '06', '11', 'SALPO', '193');
INSERT INTO `ubigeo` VALUES ('1301', '13', '06', '13', 'SINSICAP', '193');
INSERT INTO `ubigeo` VALUES ('1302', '13', '06', '14', 'USQUIL', '193');
INSERT INTO `ubigeo` VALUES ('1303', '13', '07', '00', 'PACASMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1304', '13', '07', '01', 'SAN PEDRO DE LLOC', '193');
INSERT INTO `ubigeo` VALUES ('1305', '13', '07', '02', 'GUADALUPE', '193');
INSERT INTO `ubigeo` VALUES ('1306', '13', '07', '03', 'JEQUETEPEQUE', '193');
INSERT INTO `ubigeo` VALUES ('1307', '13', '07', '04', 'PACASMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1308', '13', '07', '05', 'SAN JOSE', '193');
INSERT INTO `ubigeo` VALUES ('1309', '13', '08', '00', 'PATAZ', '193');
INSERT INTO `ubigeo` VALUES ('1310', '13', '08', '01', 'TAYABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1311', '13', '08', '02', 'BULDIBUYO', '193');
INSERT INTO `ubigeo` VALUES ('1312', '13', '08', '03', 'CHILLIA', '193');
INSERT INTO `ubigeo` VALUES ('1313', '13', '08', '04', 'HUANCASPATA', '193');
INSERT INTO `ubigeo` VALUES ('1314', '13', '08', '05', 'HUAYLILLAS', '193');
INSERT INTO `ubigeo` VALUES ('1315', '13', '08', '06', 'HUAYO', '193');
INSERT INTO `ubigeo` VALUES ('1316', '13', '08', '07', 'ONGON', '193');
INSERT INTO `ubigeo` VALUES ('1317', '13', '08', '08', 'PARCOY', '193');
INSERT INTO `ubigeo` VALUES ('1318', '13', '08', '09', 'PATAZ', '193');
INSERT INTO `ubigeo` VALUES ('1319', '13', '08', '10', 'PIAS', '193');
INSERT INTO `ubigeo` VALUES ('1320', '13', '08', '11', 'SANTIAGO DE CHALLAS', '193');
INSERT INTO `ubigeo` VALUES ('1321', '13', '08', '12', 'TAURIJA', '193');
INSERT INTO `ubigeo` VALUES ('1322', '13', '08', '13', 'URPAY', '193');
INSERT INTO `ubigeo` VALUES ('1323', '13', '09', '00', 'SANCHEZ CARRION', '193');
INSERT INTO `ubigeo` VALUES ('1324', '13', '09', '01', 'HUAMACHUCO', '193');
INSERT INTO `ubigeo` VALUES ('1325', '13', '09', '02', 'CHUGAY', '193');
INSERT INTO `ubigeo` VALUES ('1326', '13', '09', '03', 'COCHORCO', '193');
INSERT INTO `ubigeo` VALUES ('1327', '13', '09', '04', 'CURGOS', '193');
INSERT INTO `ubigeo` VALUES ('1328', '13', '09', '05', 'MARCABAL', '193');
INSERT INTO `ubigeo` VALUES ('1329', '13', '09', '06', 'SANAGORAN', '193');
INSERT INTO `ubigeo` VALUES ('1330', '13', '09', '07', 'SARIN', '193');
INSERT INTO `ubigeo` VALUES ('1331', '13', '09', '08', 'SARTIMBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1332', '13', '10', '00', 'SANTIAGO DE CHUCO', '193');
INSERT INTO `ubigeo` VALUES ('1333', '13', '10', '01', 'SANTIAGO DE CHUCO', '193');
INSERT INTO `ubigeo` VALUES ('1334', '13', '10', '02', 'ANGASMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1335', '13', '10', '03', 'CACHICADAN', '193');
INSERT INTO `ubigeo` VALUES ('1336', '13', '10', '04', 'MOLLEBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1337', '13', '10', '05', 'MOLLEPATA', '193');
INSERT INTO `ubigeo` VALUES ('1338', '13', '10', '06', 'QUIRUVILCA', '193');
INSERT INTO `ubigeo` VALUES ('1339', '13', '10', '07', 'SANTA CRUZ DE CHUCA', '193');
INSERT INTO `ubigeo` VALUES ('1340', '13', '10', '08', 'SITABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1341', '13', '11', '00', 'GRAN CHIMU', '193');
INSERT INTO `ubigeo` VALUES ('1342', '13', '11', '01', 'CASCAS', '193');
INSERT INTO `ubigeo` VALUES ('1343', '13', '11', '02', 'LUCMA', '193');
INSERT INTO `ubigeo` VALUES ('1344', '13', '11', '03', 'MARMOT', '193');
INSERT INTO `ubigeo` VALUES ('1345', '13', '11', '04', 'SAYAPULLO', '193');
INSERT INTO `ubigeo` VALUES ('1346', '13', '12', '00', 'VIRU', '193');
INSERT INTO `ubigeo` VALUES ('1347', '13', '12', '01', 'VIRU', '193');
INSERT INTO `ubigeo` VALUES ('1348', '13', '12', '02', 'CHAO', '193');
INSERT INTO `ubigeo` VALUES ('1349', '13', '12', '03', 'GUADALUPITO', '193');
INSERT INTO `ubigeo` VALUES ('1350', '14', '00', '00', 'LAMBAYEQUE', '193');
INSERT INTO `ubigeo` VALUES ('1351', '14', '01', '00', 'CHICLAYO', '193');
INSERT INTO `ubigeo` VALUES ('1352', '14', '01', '01', 'CHICLAYO', '193');
INSERT INTO `ubigeo` VALUES ('1353', '14', '01', '02', 'CHONGOYAPE', '193');
INSERT INTO `ubigeo` VALUES ('1354', '14', '01', '03', 'ETEN', '193');
INSERT INTO `ubigeo` VALUES ('1355', '14', '01', '04', 'ETEN PUERTO', '193');
INSERT INTO `ubigeo` VALUES ('1356', '14', '01', '05', 'JOSE LEONARDO ORTIZ', '193');
INSERT INTO `ubigeo` VALUES ('1357', '14', '01', '06', 'LA VICTORIA', '193');
INSERT INTO `ubigeo` VALUES ('1358', '14', '01', '07', 'LAGUNAS', '193');
INSERT INTO `ubigeo` VALUES ('1359', '14', '01', '08', 'MONSEFU', '193');
INSERT INTO `ubigeo` VALUES ('1360', '14', '01', '09', 'NUEVA ARICA', '193');
INSERT INTO `ubigeo` VALUES ('1361', '14', '01', '10', 'OYOTUN', '193');
INSERT INTO `ubigeo` VALUES ('1362', '14', '01', '11', 'PICSI', '193');
INSERT INTO `ubigeo` VALUES ('1363', '14', '01', '12', 'PIMENTEL', '193');
INSERT INTO `ubigeo` VALUES ('1364', '14', '01', '13', 'REQUE', '193');
INSERT INTO `ubigeo` VALUES ('1365', '14', '01', '14', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('1366', '14', '01', '15', 'SAÑA', '193');
INSERT INTO `ubigeo` VALUES ('1367', '14', '01', '16', 'CAYALTI', '193');
INSERT INTO `ubigeo` VALUES ('1368', '14', '01', '17', 'PATAPO', '193');
INSERT INTO `ubigeo` VALUES ('1369', '14', '01', '18', 'POMALCA', '193');
INSERT INTO `ubigeo` VALUES ('1370', '14', '01', '19', 'PUCALA', '193');
INSERT INTO `ubigeo` VALUES ('1371', '14', '01', '20', 'TUMAN', '193');
INSERT INTO `ubigeo` VALUES ('1372', '14', '02', '00', 'FERREÑAFE', '193');
INSERT INTO `ubigeo` VALUES ('1373', '14', '02', '01', 'FERREÑAFE', '193');
INSERT INTO `ubigeo` VALUES ('1374', '14', '02', '02', 'CAÑARIS', '193');
INSERT INTO `ubigeo` VALUES ('1375', '14', '02', '03', 'INCAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('1376', '14', '02', '04', 'MANUEL ANTONIO MESONES MURO', '193');
INSERT INTO `ubigeo` VALUES ('1377', '14', '02', '05', 'PITIPO', '193');
INSERT INTO `ubigeo` VALUES ('1378', '14', '02', '06', 'PUEBLO NUEVO', '193');
INSERT INTO `ubigeo` VALUES ('1379', '14', '03', '00', 'LAMBAYEQUE', '193');
INSERT INTO `ubigeo` VALUES ('1380', '14', '03', '01', 'LAMBAYEQUE', '193');
INSERT INTO `ubigeo` VALUES ('1381', '14', '03', '02', 'CHOCHOPE', '193');
INSERT INTO `ubigeo` VALUES ('1382', '14', '03', '03', 'ILLIMO', '193');
INSERT INTO `ubigeo` VALUES ('1383', '14', '03', '04', 'JAYANCA', '193');
INSERT INTO `ubigeo` VALUES ('1384', '14', '03', '05', 'MOCHUMI', '193');
INSERT INTO `ubigeo` VALUES ('1385', '14', '03', '06', 'MORROPE', '193');
INSERT INTO `ubigeo` VALUES ('1386', '14', '03', '07', 'MOTUPE', '193');
INSERT INTO `ubigeo` VALUES ('1387', '14', '03', '08', 'OLMOS', '193');
INSERT INTO `ubigeo` VALUES ('1388', '14', '03', '09', 'PACORA', '193');
INSERT INTO `ubigeo` VALUES ('1389', '14', '03', '10', 'SALAS', '193');
INSERT INTO `ubigeo` VALUES ('1390', '14', '03', '11', 'SAN JOSE', '193');
INSERT INTO `ubigeo` VALUES ('1391', '14', '03', '12', 'TUCUME', '193');
INSERT INTO `ubigeo` VALUES ('1392', '15', '00', '00', 'LIMA', '193');
INSERT INTO `ubigeo` VALUES ('1393', '15', '01', '00', 'LIMA', '193');
INSERT INTO `ubigeo` VALUES ('1394', '15', '01', '01', 'LIMA', '193');
INSERT INTO `ubigeo` VALUES ('1395', '15', '01', '02', 'ANCON', '193');
INSERT INTO `ubigeo` VALUES ('1396', '15', '01', '03', 'ATE', '193');
INSERT INTO `ubigeo` VALUES ('1397', '15', '01', '04', 'BARRANCO', '193');
INSERT INTO `ubigeo` VALUES ('1398', '15', '01', '05', 'BREÑA', '193');
INSERT INTO `ubigeo` VALUES ('1399', '15', '01', '06', 'CARABAYLLO', '193');
INSERT INTO `ubigeo` VALUES ('1400', '15', '01', '07', 'CHACLACAYO', '193');
INSERT INTO `ubigeo` VALUES ('1401', '15', '01', '08', 'CHORRILLOS', '193');
INSERT INTO `ubigeo` VALUES ('1402', '15', '01', '09', 'CIENEGUILLA', '193');
INSERT INTO `ubigeo` VALUES ('1403', '15', '01', '10', 'COMAS', '193');
INSERT INTO `ubigeo` VALUES ('1404', '15', '01', '11', 'EL AGUSTINO', '193');
INSERT INTO `ubigeo` VALUES ('1405', '15', '01', '12', 'INDEPENDENCIA', '193');
INSERT INTO `ubigeo` VALUES ('1406', '15', '01', '13', 'JESUS MARIA', '193');
INSERT INTO `ubigeo` VALUES ('1407', '15', '01', '14', 'LA MOLINA', '193');
INSERT INTO `ubigeo` VALUES ('1408', '15', '01', '15', 'LA VICTORIA', '193');
INSERT INTO `ubigeo` VALUES ('1409', '15', '01', '16', 'LINCE', '193');
INSERT INTO `ubigeo` VALUES ('1410', '15', '01', '17', 'LOS OLIVOS', '193');
INSERT INTO `ubigeo` VALUES ('1411', '15', '01', '18', 'LURIGANCHO', '193');
INSERT INTO `ubigeo` VALUES ('1412', '15', '01', '19', 'LURIN', '193');
INSERT INTO `ubigeo` VALUES ('1413', '15', '01', '20', 'MAGDALENA DEL MAR', '193');
INSERT INTO `ubigeo` VALUES ('1414', '15', '01', '21', 'PUEBLO LIBRE', '193');
INSERT INTO `ubigeo` VALUES ('1415', '15', '01', '22', 'MIRAFLORES', '193');
INSERT INTO `ubigeo` VALUES ('1416', '15', '01', '23', 'PACHACAMAC', '193');
INSERT INTO `ubigeo` VALUES ('1417', '15', '01', '24', 'PUCUSANA', '193');
INSERT INTO `ubigeo` VALUES ('1418', '15', '01', '25', 'PUENTE PIEDRA', '193');
INSERT INTO `ubigeo` VALUES ('1419', '15', '01', '26', 'PUNTA HERMOSA', '193');
INSERT INTO `ubigeo` VALUES ('1420', '15', '01', '27', 'PUNTA NEGRA', '193');
INSERT INTO `ubigeo` VALUES ('1421', '15', '01', '28', 'RIMAC', '193');
INSERT INTO `ubigeo` VALUES ('1422', '15', '01', '29', 'SAN BARTOLO', '193');
INSERT INTO `ubigeo` VALUES ('1423', '15', '01', '30', 'SAN BORJA', '193');
INSERT INTO `ubigeo` VALUES ('1424', '15', '01', '31', 'SAN ISIDRO', '193');
INSERT INTO `ubigeo` VALUES ('1425', '15', '01', '32', 'SAN JUAN DE LURIGANCHO', '193');
INSERT INTO `ubigeo` VALUES ('1426', '15', '01', '33', 'SAN JUAN DE MIRAFLORES', '193');
INSERT INTO `ubigeo` VALUES ('1427', '15', '01', '34', 'SAN LUIS', '193');
INSERT INTO `ubigeo` VALUES ('1428', '15', '01', '35', 'SAN MARTIN DE PORRES', '193');
INSERT INTO `ubigeo` VALUES ('1429', '15', '01', '36', 'SAN MIGUEL', '193');
INSERT INTO `ubigeo` VALUES ('1430', '15', '01', '37', 'SANTA ANITA', '193');
INSERT INTO `ubigeo` VALUES ('1431', '15', '01', '38', 'SANTA MARIA DEL MAR', '193');
INSERT INTO `ubigeo` VALUES ('1432', '15', '01', '39', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('1433', '15', '01', '40', 'SANTIAGO DE SURCO', '193');
INSERT INTO `ubigeo` VALUES ('1434', '15', '01', '41', 'SURQUILLO', '193');
INSERT INTO `ubigeo` VALUES ('1435', '15', '01', '42', 'VILLA EL SALVADOR', '193');
INSERT INTO `ubigeo` VALUES ('1436', '15', '01', '43', 'VILLA MARIA DEL TRIUNFO', '193');
INSERT INTO `ubigeo` VALUES ('1437', '15', '02', '00', 'BARRANCA', '193');
INSERT INTO `ubigeo` VALUES ('1438', '15', '02', '01', 'BARRANCA', '193');
INSERT INTO `ubigeo` VALUES ('1439', '15', '02', '02', 'PARAMONGA', '193');
INSERT INTO `ubigeo` VALUES ('1440', '15', '02', '03', 'PATIVILCA', '193');
INSERT INTO `ubigeo` VALUES ('1441', '15', '02', '04', 'SUPE', '193');
INSERT INTO `ubigeo` VALUES ('1442', '15', '02', '05', 'SUPE PUERTO', '193');
INSERT INTO `ubigeo` VALUES ('1443', '15', '03', '00', 'CAJATAMBO', '193');
INSERT INTO `ubigeo` VALUES ('1444', '15', '03', '01', 'CAJATAMBO', '193');
INSERT INTO `ubigeo` VALUES ('1445', '15', '03', '02', 'COPA', '193');
INSERT INTO `ubigeo` VALUES ('1446', '15', '03', '03', 'GORGOR', '193');
INSERT INTO `ubigeo` VALUES ('1447', '15', '03', '04', 'HUANCAPON', '193');
INSERT INTO `ubigeo` VALUES ('1448', '15', '03', '05', 'MANAS', '193');
INSERT INTO `ubigeo` VALUES ('1449', '15', '04', '00', 'CANTA', '193');
INSERT INTO `ubigeo` VALUES ('1450', '15', '04', '01', 'CANTA', '193');
INSERT INTO `ubigeo` VALUES ('1451', '15', '04', '02', 'ARAHUAY', '193');
INSERT INTO `ubigeo` VALUES ('1452', '15', '04', '03', 'HUAMANTANGA', '193');
INSERT INTO `ubigeo` VALUES ('1453', '15', '04', '04', 'HUAROS', '193');
INSERT INTO `ubigeo` VALUES ('1454', '15', '04', '05', 'LACHAQUI', '193');
INSERT INTO `ubigeo` VALUES ('1455', '15', '04', '06', 'SAN BUENAVENTURA', '193');
INSERT INTO `ubigeo` VALUES ('1456', '15', '04', '07', 'SANTA ROSA DE QUIVES', '193');
INSERT INTO `ubigeo` VALUES ('1457', '15', '05', '00', 'CAÑETE', '193');
INSERT INTO `ubigeo` VALUES ('1458', '15', '05', '01', 'SAN VICENTE DE CAÑETE', '193');
INSERT INTO `ubigeo` VALUES ('1459', '15', '05', '02', 'ASIA', '193');
INSERT INTO `ubigeo` VALUES ('1460', '15', '05', '03', 'CALANGO', '193');
INSERT INTO `ubigeo` VALUES ('1461', '15', '05', '04', 'CERRO AZUL', '193');
INSERT INTO `ubigeo` VALUES ('1462', '15', '05', '05', 'CHILCA', '193');
INSERT INTO `ubigeo` VALUES ('1463', '15', '05', '06', 'COAYLLO', '193');
INSERT INTO `ubigeo` VALUES ('1464', '15', '05', '07', 'IMPERIAL', '193');
INSERT INTO `ubigeo` VALUES ('1465', '15', '05', '08', 'LUNAHUANA', '193');
INSERT INTO `ubigeo` VALUES ('1466', '15', '05', '09', 'MALA', '193');
INSERT INTO `ubigeo` VALUES ('1467', '15', '05', '10', 'NUEVO IMPERIAL', '193');
INSERT INTO `ubigeo` VALUES ('1468', '15', '05', '11', 'PACARAN', '193');
INSERT INTO `ubigeo` VALUES ('1469', '15', '05', '12', 'QUILMANA', '193');
INSERT INTO `ubigeo` VALUES ('1470', '15', '05', '13', 'SAN ANTONIO', '193');
INSERT INTO `ubigeo` VALUES ('1471', '15', '05', '14', 'SAN LUIS', '193');
INSERT INTO `ubigeo` VALUES ('1472', '15', '05', '15', 'SANTA CRUZ DE FLORES', '193');
INSERT INTO `ubigeo` VALUES ('1473', '15', '05', '16', 'ZUÑIGA', '193');
INSERT INTO `ubigeo` VALUES ('1474', '15', '06', '00', 'HUARAL', '193');
INSERT INTO `ubigeo` VALUES ('1475', '15', '06', '01', 'HUARAL', '193');
INSERT INTO `ubigeo` VALUES ('1476', '15', '06', '02', 'ATAVILLOS ALTO', '193');
INSERT INTO `ubigeo` VALUES ('1477', '15', '06', '03', 'ATAVILLOS BAJO', '193');
INSERT INTO `ubigeo` VALUES ('1478', '15', '06', '04', 'AUCALLAMA', '193');
INSERT INTO `ubigeo` VALUES ('1479', '15', '06', '05', 'CHANCAY', '193');
INSERT INTO `ubigeo` VALUES ('1480', '15', '06', '06', 'IHUARI', '193');
INSERT INTO `ubigeo` VALUES ('1481', '15', '06', '07', 'LAMPIAN', '193');
INSERT INTO `ubigeo` VALUES ('1482', '15', '06', '08', 'PACARAOS', '193');
INSERT INTO `ubigeo` VALUES ('1483', '15', '06', '09', 'SAN MIGUEL DE ACOS', '193');
INSERT INTO `ubigeo` VALUES ('1484', '15', '06', '10', 'SANTA CRUZ DE ANDAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1485', '15', '06', '11', 'SUMBILCA', '193');
INSERT INTO `ubigeo` VALUES ('1486', '15', '06', '12', 'VEINTISIETE DE NOVIEMBRE', '193');
INSERT INTO `ubigeo` VALUES ('1487', '15', '07', '00', 'HUAROCHIRI', '193');
INSERT INTO `ubigeo` VALUES ('1488', '15', '07', '01', 'MATUCANA', '193');
INSERT INTO `ubigeo` VALUES ('1489', '15', '07', '02', 'ANTIOQUIA', '193');
INSERT INTO `ubigeo` VALUES ('1490', '15', '07', '03', 'CALLAHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('1491', '15', '07', '04', 'CARAMPOMA', '193');
INSERT INTO `ubigeo` VALUES ('1492', '15', '07', '05', 'CHICLA', '193');
INSERT INTO `ubigeo` VALUES ('1493', '15', '07', '06', 'CUENCA', '193');
INSERT INTO `ubigeo` VALUES ('1494', '15', '07', '07', 'HUACHUPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1495', '15', '07', '08', 'HUANZA', '193');
INSERT INTO `ubigeo` VALUES ('1496', '15', '07', '09', 'HUAROCHIRI', '193');
INSERT INTO `ubigeo` VALUES ('1497', '15', '07', '10', 'LAHUAYTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('1498', '15', '07', '11', 'LANGA', '193');
INSERT INTO `ubigeo` VALUES ('1499', '15', '07', '12', 'LARAOS', '193');
INSERT INTO `ubigeo` VALUES ('1500', '15', '07', '13', 'MARIATANA', '193');
INSERT INTO `ubigeo` VALUES ('1501', '15', '07', '14', 'RICARDO PALMA', '193');
INSERT INTO `ubigeo` VALUES ('1502', '15', '07', '15', 'SAN ANDRES DE TUPICOCHA', '193');
INSERT INTO `ubigeo` VALUES ('1503', '15', '07', '16', 'SAN ANTONIO', '193');
INSERT INTO `ubigeo` VALUES ('1504', '15', '07', '17', 'SAN BARTOLOME', '193');
INSERT INTO `ubigeo` VALUES ('1505', '15', '07', '18', 'SAN DAMIAN', '193');
INSERT INTO `ubigeo` VALUES ('1506', '15', '07', '19', 'SAN JUAN DE IRIS', '193');
INSERT INTO `ubigeo` VALUES ('1507', '15', '07', '20', 'SAN JUAN DE TANTARANCHE', '193');
INSERT INTO `ubigeo` VALUES ('1508', '15', '07', '21', 'SAN LORENZO DE QUINTI', '193');
INSERT INTO `ubigeo` VALUES ('1509', '15', '07', '22', 'SAN MATEO', '193');
INSERT INTO `ubigeo` VALUES ('1510', '15', '07', '23', 'SAN MATEO DE OTAO', '193');
INSERT INTO `ubigeo` VALUES ('1511', '15', '07', '24', 'SAN PEDRO DE CASTA', '193');
INSERT INTO `ubigeo` VALUES ('1512', '15', '07', '25', 'SAN PEDRO DE HUANCAYRE', '193');
INSERT INTO `ubigeo` VALUES ('1513', '15', '07', '26', 'SANGALLAYA', '193');
INSERT INTO `ubigeo` VALUES ('1514', '15', '07', '27', 'SANTA CRUZ DE COCACHACRA', '193');
INSERT INTO `ubigeo` VALUES ('1515', '15', '07', '28', 'SANTA EULALIA', '193');
INSERT INTO `ubigeo` VALUES ('1516', '15', '07', '29', 'SANTIAGO DE ANCHUCAYA', '193');
INSERT INTO `ubigeo` VALUES ('1517', '15', '07', '30', 'SANTIAGO DE TUNA', '193');
INSERT INTO `ubigeo` VALUES ('1518', '15', '07', '31', 'SANTO DOMINGO DE LOS OLLEROS', '193');
INSERT INTO `ubigeo` VALUES ('1519', '15', '07', '32', 'SURCO', '193');
INSERT INTO `ubigeo` VALUES ('1520', '15', '08', '00', 'HUAURA', '193');
INSERT INTO `ubigeo` VALUES ('1521', '15', '08', '01', 'HUACHO', '193');
INSERT INTO `ubigeo` VALUES ('1522', '15', '08', '02', 'AMBAR', '193');
INSERT INTO `ubigeo` VALUES ('1523', '15', '08', '03', 'CALETA DE CARQUIN', '193');
INSERT INTO `ubigeo` VALUES ('1524', '15', '08', '04', 'CHECRAS', '193');
INSERT INTO `ubigeo` VALUES ('1525', '15', '08', '05', 'HUALMAY', '193');
INSERT INTO `ubigeo` VALUES ('1526', '15', '08', '06', 'HUAURA', '193');
INSERT INTO `ubigeo` VALUES ('1527', '15', '08', '07', 'LEONCIO PRADO', '193');
INSERT INTO `ubigeo` VALUES ('1528', '15', '08', '08', 'PACCHO', '193');
INSERT INTO `ubigeo` VALUES ('1529', '15', '08', '09', 'SANTA LEONOR', '193');
INSERT INTO `ubigeo` VALUES ('1530', '15', '08', '10', 'SANTA MARIA', '193');
INSERT INTO `ubigeo` VALUES ('1531', '15', '08', '11', 'SAYAN', '193');
INSERT INTO `ubigeo` VALUES ('1532', '15', '08', '12', 'VEGUETA', '193');
INSERT INTO `ubigeo` VALUES ('1533', '15', '09', '00', 'OYON', '193');
INSERT INTO `ubigeo` VALUES ('1534', '15', '09', '01', 'OYON', '193');
INSERT INTO `ubigeo` VALUES ('1535', '15', '09', '02', 'ANDAJES', '193');
INSERT INTO `ubigeo` VALUES ('1536', '15', '09', '03', 'CAUJUL', '193');
INSERT INTO `ubigeo` VALUES ('1537', '15', '09', '04', 'COCHAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1538', '15', '09', '05', 'NAVAN', '193');
INSERT INTO `ubigeo` VALUES ('1539', '15', '09', '06', 'PACHANGARA', '193');
INSERT INTO `ubigeo` VALUES ('1540', '15', '10', '00', 'YAUYOS', '193');
INSERT INTO `ubigeo` VALUES ('1541', '15', '10', '01', 'YAUYOS', '193');
INSERT INTO `ubigeo` VALUES ('1542', '15', '10', '02', 'ALIS', '193');
INSERT INTO `ubigeo` VALUES ('1543', '15', '10', '03', 'ALLAUCA', '193');
INSERT INTO `ubigeo` VALUES ('1544', '15', '10', '04', 'AYAVIRI', '193');
INSERT INTO `ubigeo` VALUES ('1545', '15', '10', '05', 'AZANGARO', '193');
INSERT INTO `ubigeo` VALUES ('1546', '15', '10', '06', 'CACRA', '193');
INSERT INTO `ubigeo` VALUES ('1547', '15', '10', '07', 'CARANIA', '193');
INSERT INTO `ubigeo` VALUES ('1548', '15', '10', '08', 'CATAHUASI', '193');
INSERT INTO `ubigeo` VALUES ('1549', '15', '10', '09', 'CHOCOS', '193');
INSERT INTO `ubigeo` VALUES ('1550', '15', '10', '10', 'COCHAS', '193');
INSERT INTO `ubigeo` VALUES ('1551', '15', '10', '11', 'COLONIA', '193');
INSERT INTO `ubigeo` VALUES ('1552', '15', '10', '12', 'HONGOS', '193');
INSERT INTO `ubigeo` VALUES ('1553', '15', '10', '13', 'HUAMPARA', '193');
INSERT INTO `ubigeo` VALUES ('1554', '15', '10', '14', 'HUANCAYA', '193');
INSERT INTO `ubigeo` VALUES ('1555', '15', '10', '15', 'HUANGASCAR', '193');
INSERT INTO `ubigeo` VALUES ('1556', '15', '10', '16', 'HUANTAN', '193');
INSERT INTO `ubigeo` VALUES ('1557', '15', '10', '17', 'HUAÑEC', '193');
INSERT INTO `ubigeo` VALUES ('1558', '15', '10', '18', 'LARAOS', '193');
INSERT INTO `ubigeo` VALUES ('1559', '15', '10', '19', 'LINCHA', '193');
INSERT INTO `ubigeo` VALUES ('1560', '15', '10', '20', 'MADEAN', '193');
INSERT INTO `ubigeo` VALUES ('1561', '15', '10', '21', 'MIRAFLORES', '193');
INSERT INTO `ubigeo` VALUES ('1562', '15', '10', '22', 'OMAS', '193');
INSERT INTO `ubigeo` VALUES ('1563', '15', '10', '23', 'PUTINZA', '193');
INSERT INTO `ubigeo` VALUES ('1564', '15', '10', '24', 'QUINCHES', '193');
INSERT INTO `ubigeo` VALUES ('1565', '15', '10', '25', 'QUINOCAY', '193');
INSERT INTO `ubigeo` VALUES ('1566', '15', '10', '26', 'SAN JOAQUIN', '193');
INSERT INTO `ubigeo` VALUES ('1567', '15', '10', '27', 'SAN PEDRO DE PILAS', '193');
INSERT INTO `ubigeo` VALUES ('1568', '15', '10', '28', 'TANTA', '193');
INSERT INTO `ubigeo` VALUES ('1569', '15', '10', '29', 'TAURIPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1570', '15', '10', '30', 'TOMAS', '193');
INSERT INTO `ubigeo` VALUES ('1571', '15', '10', '31', 'TUPE', '193');
INSERT INTO `ubigeo` VALUES ('1572', '15', '10', '32', 'VIÑAC', '193');
INSERT INTO `ubigeo` VALUES ('1573', '15', '10', '33', 'VITIS', '193');
INSERT INTO `ubigeo` VALUES ('1574', '16', '00', '00', 'LORETO', '193');
INSERT INTO `ubigeo` VALUES ('1575', '16', '01', '00', 'MAYNAS', '193');
INSERT INTO `ubigeo` VALUES ('1576', '16', '01', '01', 'IQUITOS', '193');
INSERT INTO `ubigeo` VALUES ('1577', '16', '01', '02', 'ALTO NANAY', '193');
INSERT INTO `ubigeo` VALUES ('1578', '16', '01', '03', 'FERNANDO LORES', '193');
INSERT INTO `ubigeo` VALUES ('1579', '16', '01', '04', 'INDIANA', '193');
INSERT INTO `ubigeo` VALUES ('1580', '16', '01', '05', 'LAS AMAZONAS', '193');
INSERT INTO `ubigeo` VALUES ('1581', '16', '01', '06', 'MAZAN', '193');
INSERT INTO `ubigeo` VALUES ('1582', '16', '01', '07', 'NAPO', '193');
INSERT INTO `ubigeo` VALUES ('1583', '16', '01', '08', 'PUNCHANA', '193');
INSERT INTO `ubigeo` VALUES ('1584', '16', '01', '09', 'PUTUMAYO', '193');
INSERT INTO `ubigeo` VALUES ('1585', '16', '01', '10', 'TORRES CAUSANA', '193');
INSERT INTO `ubigeo` VALUES ('1586', '16', '01', '12', 'BELEN', '193');
INSERT INTO `ubigeo` VALUES ('1587', '16', '01', '13', 'SAN JUAN BAUTISTA', '193');
INSERT INTO `ubigeo` VALUES ('1588', '16', '01', '14', 'TENIENTE MANUEL CLAVERO', '193');
INSERT INTO `ubigeo` VALUES ('1589', '16', '02', '00', 'ALTO AMAZONAS', '193');
INSERT INTO `ubigeo` VALUES ('1590', '16', '02', '01', 'YURIMAGUAS', '193');
INSERT INTO `ubigeo` VALUES ('1591', '16', '02', '02', 'BALSAPUERTO', '193');
INSERT INTO `ubigeo` VALUES ('1592', '16', '02', '05', 'JEBEROS', '193');
INSERT INTO `ubigeo` VALUES ('1593', '16', '02', '06', 'LAGUNAS', '193');
INSERT INTO `ubigeo` VALUES ('1594', '16', '02', '10', 'SANTA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('1595', '16', '02', '11', 'TENIENTE CESAR LOPEZ ROJAS', '193');
INSERT INTO `ubigeo` VALUES ('1596', '16', '03', '00', 'LORETO', '193');
INSERT INTO `ubigeo` VALUES ('1597', '16', '03', '01', 'NAUTA', '193');
INSERT INTO `ubigeo` VALUES ('1598', '16', '03', '02', 'PARINARI', '193');
INSERT INTO `ubigeo` VALUES ('1599', '16', '03', '03', 'TIGRE', '193');
INSERT INTO `ubigeo` VALUES ('1600', '16', '03', '04', 'TROMPETEROS', '193');
INSERT INTO `ubigeo` VALUES ('1601', '16', '03', '05', 'URARINAS', '193');
INSERT INTO `ubigeo` VALUES ('1602', '16', '04', '00', 'MARISCAL RAMON CASTILLA', '193');
INSERT INTO `ubigeo` VALUES ('1603', '16', '04', '01', 'RAMON CASTILLA', '193');
INSERT INTO `ubigeo` VALUES ('1604', '16', '04', '02', 'PEBAS', '193');
INSERT INTO `ubigeo` VALUES ('1605', '16', '04', '03', 'YAVARI', '193');
INSERT INTO `ubigeo` VALUES ('1606', '16', '04', '04', 'SAN PABLO', '193');
INSERT INTO `ubigeo` VALUES ('1607', '16', '05', '00', 'REQUENA', '193');
INSERT INTO `ubigeo` VALUES ('1608', '16', '05', '01', 'REQUENA', '193');
INSERT INTO `ubigeo` VALUES ('1609', '16', '05', '02', 'ALTO TAPICHE', '193');
INSERT INTO `ubigeo` VALUES ('1610', '16', '05', '03', 'CAPELO', '193');
INSERT INTO `ubigeo` VALUES ('1611', '16', '05', '04', 'EMILIO SAN MARTIN', '193');
INSERT INTO `ubigeo` VALUES ('1612', '16', '05', '05', 'MAQUIA', '193');
INSERT INTO `ubigeo` VALUES ('1613', '16', '05', '06', 'PUINAHUA', '193');
INSERT INTO `ubigeo` VALUES ('1614', '16', '05', '07', 'SAQUENA', '193');
INSERT INTO `ubigeo` VALUES ('1615', '16', '05', '08', 'SOPLIN', '193');
INSERT INTO `ubigeo` VALUES ('1616', '16', '05', '09', 'TAPICHE', '193');
INSERT INTO `ubigeo` VALUES ('1617', '16', '05', '10', 'JENARO HERRERA', '193');
INSERT INTO `ubigeo` VALUES ('1618', '16', '05', '11', 'YAQUERANA', '193');
INSERT INTO `ubigeo` VALUES ('1619', '16', '06', '00', 'UCAYALI', '193');
INSERT INTO `ubigeo` VALUES ('1620', '16', '06', '01', 'CONTAMANA', '193');
INSERT INTO `ubigeo` VALUES ('1621', '16', '06', '02', 'INAHUAYA', '193');
INSERT INTO `ubigeo` VALUES ('1622', '16', '06', '03', 'PADRE MARQUEZ', '193');
INSERT INTO `ubigeo` VALUES ('1623', '16', '06', '04', 'PAMPA HERMOSA', '193');
INSERT INTO `ubigeo` VALUES ('1624', '16', '06', '05', 'SARAYACU', '193');
INSERT INTO `ubigeo` VALUES ('1625', '16', '06', '06', 'VARGAS GUERRA', '193');
INSERT INTO `ubigeo` VALUES ('1626', '16', '07', '00', 'DATEM DEL MARAÑON', '193');
INSERT INTO `ubigeo` VALUES ('1627', '16', '07', '01', 'BARRANCA', '193');
INSERT INTO `ubigeo` VALUES ('1628', '16', '07', '02', 'CAHUAPANAS', '193');
INSERT INTO `ubigeo` VALUES ('1629', '16', '07', '03', 'MANSERICHE', '193');
INSERT INTO `ubigeo` VALUES ('1630', '16', '07', '04', 'MORONA', '193');
INSERT INTO `ubigeo` VALUES ('1631', '16', '07', '05', 'PASTAZA', '193');
INSERT INTO `ubigeo` VALUES ('1632', '16', '07', '06', 'ANDOAS', '193');
INSERT INTO `ubigeo` VALUES ('1633', '17', '00', '00', 'MADRE DE DIOS', '193');
INSERT INTO `ubigeo` VALUES ('1634', '17', '01', '00', 'TAMBOPATA', '193');
INSERT INTO `ubigeo` VALUES ('1635', '17', '01', '01', 'TAMBOPATA', '193');
INSERT INTO `ubigeo` VALUES ('1636', '17', '01', '02', 'INAMBARI', '193');
INSERT INTO `ubigeo` VALUES ('1637', '17', '01', '03', 'LAS PIEDRAS', '193');
INSERT INTO `ubigeo` VALUES ('1638', '17', '01', '04', 'LABERINTO', '193');
INSERT INTO `ubigeo` VALUES ('1639', '17', '02', '00', 'MANU', '193');
INSERT INTO `ubigeo` VALUES ('1640', '17', '02', '01', 'MANU', '193');
INSERT INTO `ubigeo` VALUES ('1641', '17', '02', '02', 'FITZCARRALD', '193');
INSERT INTO `ubigeo` VALUES ('1642', '17', '02', '03', 'MADRE DE DIOS', '193');
INSERT INTO `ubigeo` VALUES ('1643', '17', '02', '04', 'HUEPETUHE', '193');
INSERT INTO `ubigeo` VALUES ('1644', '17', '03', '00', 'TAHUAMANU', '193');
INSERT INTO `ubigeo` VALUES ('1645', '17', '03', '01', 'IÑAPARI', '193');
INSERT INTO `ubigeo` VALUES ('1646', '17', '03', '02', 'IBERIA', '193');
INSERT INTO `ubigeo` VALUES ('1647', '17', '03', '03', 'TAHUAMANU', '193');
INSERT INTO `ubigeo` VALUES ('1648', '18', '00', '00', 'MOQUEGUA', '193');
INSERT INTO `ubigeo` VALUES ('1649', '18', '01', '00', 'MARISCAL NIETO', '193');
INSERT INTO `ubigeo` VALUES ('1650', '18', '01', '01', 'MOQUEGUA', '193');
INSERT INTO `ubigeo` VALUES ('1651', '18', '01', '02', 'CARUMAS', '193');
INSERT INTO `ubigeo` VALUES ('1652', '18', '01', '03', 'CUCHUMBAYA', '193');
INSERT INTO `ubigeo` VALUES ('1653', '18', '01', '04', 'SAMEGUA', '193');
INSERT INTO `ubigeo` VALUES ('1654', '18', '01', '05', 'SAN CRISTOBAL', '193');
INSERT INTO `ubigeo` VALUES ('1655', '18', '01', '06', 'TORATA', '193');
INSERT INTO `ubigeo` VALUES ('1656', '18', '02', '00', 'GENERAL SANCHEZ CERRO', '193');
INSERT INTO `ubigeo` VALUES ('1657', '18', '02', '01', 'OMATE', '193');
INSERT INTO `ubigeo` VALUES ('1658', '18', '02', '02', 'CHOJATA', '193');
INSERT INTO `ubigeo` VALUES ('1659', '18', '02', '03', 'COALAQUE', '193');
INSERT INTO `ubigeo` VALUES ('1660', '18', '02', '04', 'ICHUÑA', '193');
INSERT INTO `ubigeo` VALUES ('1661', '18', '02', '05', 'LA CAPILLA', '193');
INSERT INTO `ubigeo` VALUES ('1662', '18', '02', '06', 'LLOQUE', '193');
INSERT INTO `ubigeo` VALUES ('1663', '18', '02', '07', 'MATALAQUE', '193');
INSERT INTO `ubigeo` VALUES ('1664', '18', '02', '08', 'PUQUINA', '193');
INSERT INTO `ubigeo` VALUES ('1665', '18', '02', '09', 'QUINISTAQUILLAS', '193');
INSERT INTO `ubigeo` VALUES ('1666', '18', '02', '10', 'UBINAS', '193');
INSERT INTO `ubigeo` VALUES ('1667', '18', '02', '11', 'YUNGA', '193');
INSERT INTO `ubigeo` VALUES ('1668', '18', '03', '00', 'ILO', '193');
INSERT INTO `ubigeo` VALUES ('1669', '18', '03', '01', 'ILO', '193');
INSERT INTO `ubigeo` VALUES ('1670', '18', '03', '02', 'EL ALGARROBAL', '193');
INSERT INTO `ubigeo` VALUES ('1671', '18', '03', '03', 'PACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('1672', '19', '00', '00', 'PASCO', '193');
INSERT INTO `ubigeo` VALUES ('1673', '19', '01', '00', 'PASCO', '193');
INSERT INTO `ubigeo` VALUES ('1674', '19', '01', '01', 'CHAUPIMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1675', '19', '01', '02', 'HUACHON', '193');
INSERT INTO `ubigeo` VALUES ('1676', '19', '01', '03', 'HUARIACA', '193');
INSERT INTO `ubigeo` VALUES ('1677', '19', '01', '04', 'HUAYLLAY', '193');
INSERT INTO `ubigeo` VALUES ('1678', '19', '01', '05', 'NINACACA', '193');
INSERT INTO `ubigeo` VALUES ('1679', '19', '01', '06', 'PALLANCHACRA', '193');
INSERT INTO `ubigeo` VALUES ('1680', '19', '01', '07', 'PAUCARTAMBO', '193');
INSERT INTO `ubigeo` VALUES ('1681', '19', '01', '08', 'SAN FRANCISCO DE ASIS DE YARUSYACAN', '193');
INSERT INTO `ubigeo` VALUES ('1682', '19', '01', '09', 'SIMON BOLIVAR', '193');
INSERT INTO `ubigeo` VALUES ('1683', '19', '01', '10', 'TICLACAYAN', '193');
INSERT INTO `ubigeo` VALUES ('1684', '19', '01', '11', 'TINYAHUARCO', '193');
INSERT INTO `ubigeo` VALUES ('1685', '19', '01', '12', 'VICCO', '193');
INSERT INTO `ubigeo` VALUES ('1686', '19', '01', '13', 'YANACANCHA', '193');
INSERT INTO `ubigeo` VALUES ('1687', '19', '02', '00', 'DANIEL ALCIDES CARRION', '193');
INSERT INTO `ubigeo` VALUES ('1688', '19', '02', '01', 'YANAHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('1689', '19', '02', '02', 'CHACAYAN', '193');
INSERT INTO `ubigeo` VALUES ('1690', '19', '02', '03', 'GOYLLARISQUIZGA', '193');
INSERT INTO `ubigeo` VALUES ('1691', '19', '02', '04', 'PAUCAR', '193');
INSERT INTO `ubigeo` VALUES ('1692', '19', '02', '05', 'SAN PEDRO DE PILLAO', '193');
INSERT INTO `ubigeo` VALUES ('1693', '19', '02', '06', 'SANTA ANA DE TUSI', '193');
INSERT INTO `ubigeo` VALUES ('1694', '19', '02', '07', 'TAPUC', '193');
INSERT INTO `ubigeo` VALUES ('1695', '19', '02', '08', 'VILCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1696', '19', '03', '00', 'OXAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1697', '19', '03', '01', 'OXAPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1698', '19', '03', '02', 'CHONTABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1699', '19', '03', '03', 'HUANCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1700', '19', '03', '04', 'PALCAZU', '193');
INSERT INTO `ubigeo` VALUES ('1701', '19', '03', '05', 'POZUZO', '193');
INSERT INTO `ubigeo` VALUES ('1702', '19', '03', '06', 'PUERTO BERMUDEZ', '193');
INSERT INTO `ubigeo` VALUES ('1703', '19', '03', '07', 'VILLA RICA', '193');
INSERT INTO `ubigeo` VALUES ('1704', '19', '03', '08', 'CONSTITUCION', '193');
INSERT INTO `ubigeo` VALUES ('1705', '20', '00', '00', 'PIURA', '193');
INSERT INTO `ubigeo` VALUES ('1706', '20', '01', '00', 'PIURA', '193');
INSERT INTO `ubigeo` VALUES ('1707', '20', '01', '01', 'PIURA', '193');
INSERT INTO `ubigeo` VALUES ('1708', '20', '01', '04', 'CASTILLA', '193');
INSERT INTO `ubigeo` VALUES ('1709', '20', '01', '05', 'CATACAOS', '193');
INSERT INTO `ubigeo` VALUES ('1710', '20', '01', '07', 'CURA MORI', '193');
INSERT INTO `ubigeo` VALUES ('1711', '20', '01', '08', 'EL TALLAN', '193');
INSERT INTO `ubigeo` VALUES ('1712', '20', '01', '09', 'LA ARENA', '193');
INSERT INTO `ubigeo` VALUES ('1713', '20', '01', '10', 'LA UNION', '193');
INSERT INTO `ubigeo` VALUES ('1714', '20', '01', '11', 'LAS LOMAS', '193');
INSERT INTO `ubigeo` VALUES ('1715', '20', '01', '14', 'TAMBO GRANDE', '193');
INSERT INTO `ubigeo` VALUES ('1716', '20', '02', '00', 'AYABACA', '193');
INSERT INTO `ubigeo` VALUES ('1717', '20', '02', '01', 'AYABACA', '193');
INSERT INTO `ubigeo` VALUES ('1718', '20', '02', '02', 'FRIAS', '193');
INSERT INTO `ubigeo` VALUES ('1719', '20', '02', '03', 'JILILI', '193');
INSERT INTO `ubigeo` VALUES ('1720', '20', '02', '04', 'LAGUNAS', '193');
INSERT INTO `ubigeo` VALUES ('1721', '20', '02', '05', 'MONTERO', '193');
INSERT INTO `ubigeo` VALUES ('1722', '20', '02', '06', 'PACAIPAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1723', '20', '02', '07', 'PAIMAS', '193');
INSERT INTO `ubigeo` VALUES ('1724', '20', '02', '08', 'SAPILLICA', '193');
INSERT INTO `ubigeo` VALUES ('1725', '20', '02', '09', 'SICCHEZ', '193');
INSERT INTO `ubigeo` VALUES ('1726', '20', '02', '10', 'SUYO', '193');
INSERT INTO `ubigeo` VALUES ('1727', '20', '03', '00', 'HUANCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1728', '20', '03', '01', 'HUANCABAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1729', '20', '03', '02', 'CANCHAQUE', '193');
INSERT INTO `ubigeo` VALUES ('1730', '20', '03', '03', 'EL CARMEN DE LA FRONTERA', '193');
INSERT INTO `ubigeo` VALUES ('1731', '20', '03', '04', 'HUARMACA', '193');
INSERT INTO `ubigeo` VALUES ('1732', '20', '03', '05', 'LALAQUIZ', '193');
INSERT INTO `ubigeo` VALUES ('1733', '20', '03', '06', 'SAN MIGUEL DE EL FAIQUE', '193');
INSERT INTO `ubigeo` VALUES ('1734', '20', '03', '07', 'SONDOR', '193');
INSERT INTO `ubigeo` VALUES ('1735', '20', '03', '08', 'SONDORILLO', '193');
INSERT INTO `ubigeo` VALUES ('1736', '20', '04', '00', 'MORROPON', '193');
INSERT INTO `ubigeo` VALUES ('1737', '20', '04', '01', 'CHULUCANAS', '193');
INSERT INTO `ubigeo` VALUES ('1738', '20', '04', '02', 'BUENOS AIRES', '193');
INSERT INTO `ubigeo` VALUES ('1739', '20', '04', '03', 'CHALACO', '193');
INSERT INTO `ubigeo` VALUES ('1740', '20', '04', '04', 'LA MATANZA', '193');
INSERT INTO `ubigeo` VALUES ('1741', '20', '04', '05', 'MORROPON', '193');
INSERT INTO `ubigeo` VALUES ('1742', '20', '04', '06', 'SALITRAL', '193');
INSERT INTO `ubigeo` VALUES ('1743', '20', '04', '07', 'SAN JUAN DE BIGOTE', '193');
INSERT INTO `ubigeo` VALUES ('1744', '20', '04', '08', 'SANTA CATALINA DE MOSSA', '193');
INSERT INTO `ubigeo` VALUES ('1745', '20', '04', '09', 'SANTO DOMINGO', '193');
INSERT INTO `ubigeo` VALUES ('1746', '20', '04', '10', 'YAMANGO', '193');
INSERT INTO `ubigeo` VALUES ('1747', '20', '05', '00', 'PAITA', '193');
INSERT INTO `ubigeo` VALUES ('1748', '20', '05', '01', 'PAITA', '193');
INSERT INTO `ubigeo` VALUES ('1749', '20', '05', '02', 'AMOTAPE', '193');
INSERT INTO `ubigeo` VALUES ('1750', '20', '05', '03', 'ARENAL', '193');
INSERT INTO `ubigeo` VALUES ('1751', '20', '05', '04', 'COLAN', '193');
INSERT INTO `ubigeo` VALUES ('1752', '20', '05', '05', 'LA HUACA', '193');
INSERT INTO `ubigeo` VALUES ('1753', '20', '05', '06', 'TAMARINDO', '193');
INSERT INTO `ubigeo` VALUES ('1754', '20', '05', '07', 'VICHAYAL', '193');
INSERT INTO `ubigeo` VALUES ('1755', '20', '06', '00', 'SULLANA', '193');
INSERT INTO `ubigeo` VALUES ('1756', '20', '06', '01', 'SULLANA', '193');
INSERT INTO `ubigeo` VALUES ('1757', '20', '06', '02', 'BELLAVISTA', '193');
INSERT INTO `ubigeo` VALUES ('1758', '20', '06', '03', 'IGNACIO ESCUDERO', '193');
INSERT INTO `ubigeo` VALUES ('1759', '20', '06', '04', 'LANCONES', '193');
INSERT INTO `ubigeo` VALUES ('1760', '20', '06', '05', 'MARCAVELICA', '193');
INSERT INTO `ubigeo` VALUES ('1761', '20', '06', '06', 'MIGUEL CHECA', '193');
INSERT INTO `ubigeo` VALUES ('1762', '20', '06', '07', 'QUERECOTILLO', '193');
INSERT INTO `ubigeo` VALUES ('1763', '20', '06', '08', 'SALITRAL', '193');
INSERT INTO `ubigeo` VALUES ('1764', '20', '07', '00', 'TALARA', '193');
INSERT INTO `ubigeo` VALUES ('1765', '20', '07', '01', 'PARIÑAS', '193');
INSERT INTO `ubigeo` VALUES ('1766', '20', '07', '02', 'EL ALTO', '193');
INSERT INTO `ubigeo` VALUES ('1767', '20', '07', '03', 'LA BREA', '193');
INSERT INTO `ubigeo` VALUES ('1768', '20', '07', '04', 'LOBITOS', '193');
INSERT INTO `ubigeo` VALUES ('1769', '20', '07', '05', 'LOS ORGANOS', '193');
INSERT INTO `ubigeo` VALUES ('1770', '20', '07', '06', 'MANCORA', '193');
INSERT INTO `ubigeo` VALUES ('1771', '20', '08', '00', 'SECHURA', '193');
INSERT INTO `ubigeo` VALUES ('1772', '20', '08', '01', 'SECHURA', '193');
INSERT INTO `ubigeo` VALUES ('1773', '20', '08', '02', 'BELLAVISTA DE LA UNION', '193');
INSERT INTO `ubigeo` VALUES ('1774', '20', '08', '03', 'BERNAL', '193');
INSERT INTO `ubigeo` VALUES ('1775', '20', '08', '04', 'CRISTO NOS VALGA', '193');
INSERT INTO `ubigeo` VALUES ('1776', '20', '08', '05', 'VICE', '193');
INSERT INTO `ubigeo` VALUES ('1777', '20', '08', '06', 'RINCONADA LLICUAR', '193');
INSERT INTO `ubigeo` VALUES ('1778', '21', '00', '00', 'PUNO', '193');
INSERT INTO `ubigeo` VALUES ('1779', '21', '01', '00', 'PUNO', '193');
INSERT INTO `ubigeo` VALUES ('1780', '21', '01', '01', 'PUNO', '193');
INSERT INTO `ubigeo` VALUES ('1781', '21', '01', '02', 'ACORA', '193');
INSERT INTO `ubigeo` VALUES ('1782', '21', '01', '03', 'AMANTANI', '193');
INSERT INTO `ubigeo` VALUES ('1783', '21', '01', '04', 'ATUNCOLLA', '193');
INSERT INTO `ubigeo` VALUES ('1784', '21', '01', '05', 'CAPACHICA', '193');
INSERT INTO `ubigeo` VALUES ('1785', '21', '01', '06', 'CHUCUITO', '193');
INSERT INTO `ubigeo` VALUES ('1786', '21', '01', '07', 'COATA', '193');
INSERT INTO `ubigeo` VALUES ('1787', '21', '01', '08', 'HUATA', '193');
INSERT INTO `ubigeo` VALUES ('1788', '21', '01', '09', 'MAÑAZO', '193');
INSERT INTO `ubigeo` VALUES ('1789', '21', '01', '10', 'PAUCARCOLLA', '193');
INSERT INTO `ubigeo` VALUES ('1790', '21', '01', '11', 'PICHACANI', '193');
INSERT INTO `ubigeo` VALUES ('1791', '21', '01', '12', 'PLATERIA', '193');
INSERT INTO `ubigeo` VALUES ('1792', '21', '01', '13', 'SAN ANTONIO', '193');
INSERT INTO `ubigeo` VALUES ('1793', '21', '01', '14', 'TIQUILLACA', '193');
INSERT INTO `ubigeo` VALUES ('1794', '21', '01', '15', 'VILQUE', '193');
INSERT INTO `ubigeo` VALUES ('1795', '21', '02', '00', 'AZANGARO', '193');
INSERT INTO `ubigeo` VALUES ('1796', '21', '02', '01', 'AZANGARO', '193');
INSERT INTO `ubigeo` VALUES ('1797', '21', '02', '02', 'ACHAYA', '193');
INSERT INTO `ubigeo` VALUES ('1798', '21', '02', '03', 'ARAPA', '193');
INSERT INTO `ubigeo` VALUES ('1799', '21', '02', '04', 'ASILLO', '193');
INSERT INTO `ubigeo` VALUES ('1800', '21', '02', '05', 'CAMINACA', '193');
INSERT INTO `ubigeo` VALUES ('1801', '21', '02', '06', 'CHUPA', '193');
INSERT INTO `ubigeo` VALUES ('1802', '21', '02', '07', 'JOSE DOMINGO CHOQUEHUANCA', '193');
INSERT INTO `ubigeo` VALUES ('1803', '21', '02', '08', 'MUÑANI', '193');
INSERT INTO `ubigeo` VALUES ('1804', '21', '02', '09', 'POTONI', '193');
INSERT INTO `ubigeo` VALUES ('1805', '21', '02', '10', 'SAMAN', '193');
INSERT INTO `ubigeo` VALUES ('1806', '21', '02', '11', 'SAN ANTON', '193');
INSERT INTO `ubigeo` VALUES ('1807', '21', '02', '12', 'SAN JOSE', '193');
INSERT INTO `ubigeo` VALUES ('1808', '21', '02', '13', 'SAN JUAN DE SALINAS', '193');
INSERT INTO `ubigeo` VALUES ('1809', '21', '02', '14', 'SANTIAGO DE PUPUJA', '193');
INSERT INTO `ubigeo` VALUES ('1810', '21', '02', '15', 'TIRAPATA', '193');
INSERT INTO `ubigeo` VALUES ('1811', '21', '03', '00', 'CARABAYA', '193');
INSERT INTO `ubigeo` VALUES ('1812', '21', '03', '01', 'MACUSANI', '193');
INSERT INTO `ubigeo` VALUES ('1813', '21', '03', '02', 'AJOYANI', '193');
INSERT INTO `ubigeo` VALUES ('1814', '21', '03', '03', 'AYAPATA', '193');
INSERT INTO `ubigeo` VALUES ('1815', '21', '03', '04', 'COASA', '193');
INSERT INTO `ubigeo` VALUES ('1816', '21', '03', '05', 'CORANI', '193');
INSERT INTO `ubigeo` VALUES ('1817', '21', '03', '06', 'CRUCERO', '193');
INSERT INTO `ubigeo` VALUES ('1818', '21', '03', '07', 'ITUATA', '193');
INSERT INTO `ubigeo` VALUES ('1819', '21', '03', '08', 'OLLACHEA', '193');
INSERT INTO `ubigeo` VALUES ('1820', '21', '03', '09', 'SAN GABAN', '193');
INSERT INTO `ubigeo` VALUES ('1821', '21', '03', '10', 'USICAYOS', '193');
INSERT INTO `ubigeo` VALUES ('1822', '21', '04', '00', 'CHUCUITO', '193');
INSERT INTO `ubigeo` VALUES ('1823', '21', '04', '01', 'JULI', '193');
INSERT INTO `ubigeo` VALUES ('1824', '21', '04', '02', 'DESAGUADERO', '193');
INSERT INTO `ubigeo` VALUES ('1825', '21', '04', '03', 'HUACULLANI', '193');
INSERT INTO `ubigeo` VALUES ('1826', '21', '04', '04', 'KELLUYO', '193');
INSERT INTO `ubigeo` VALUES ('1827', '21', '04', '05', 'PISACOMA', '193');
INSERT INTO `ubigeo` VALUES ('1828', '21', '04', '06', 'POMATA', '193');
INSERT INTO `ubigeo` VALUES ('1829', '21', '04', '07', 'ZEPITA', '193');
INSERT INTO `ubigeo` VALUES ('1830', '21', '05', '00', 'EL COLLAO', '193');
INSERT INTO `ubigeo` VALUES ('1831', '21', '05', '01', 'ILAVE', '193');
INSERT INTO `ubigeo` VALUES ('1832', '21', '05', '02', 'CAPAZO', '193');
INSERT INTO `ubigeo` VALUES ('1833', '21', '05', '03', 'PILCUYO', '193');
INSERT INTO `ubigeo` VALUES ('1834', '21', '05', '04', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('1835', '21', '05', '05', 'CONDURIRI', '193');
INSERT INTO `ubigeo` VALUES ('1836', '21', '06', '00', 'HUANCANE', '193');
INSERT INTO `ubigeo` VALUES ('1837', '21', '06', '01', 'HUANCANE', '193');
INSERT INTO `ubigeo` VALUES ('1838', '21', '06', '02', 'COJATA', '193');
INSERT INTO `ubigeo` VALUES ('1839', '21', '06', '03', 'HUATASANI', '193');
INSERT INTO `ubigeo` VALUES ('1840', '21', '06', '04', 'INCHUPALLA', '193');
INSERT INTO `ubigeo` VALUES ('1841', '21', '06', '05', 'PUSI', '193');
INSERT INTO `ubigeo` VALUES ('1842', '21', '06', '06', 'ROSASPATA', '193');
INSERT INTO `ubigeo` VALUES ('1843', '21', '06', '07', 'TARACO', '193');
INSERT INTO `ubigeo` VALUES ('1844', '21', '06', '08', 'VILQUE CHICO', '193');
INSERT INTO `ubigeo` VALUES ('1845', '21', '07', '00', 'LAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1846', '21', '07', '01', 'LAMPA', '193');
INSERT INTO `ubigeo` VALUES ('1847', '21', '07', '02', 'CABANILLA', '193');
INSERT INTO `ubigeo` VALUES ('1848', '21', '07', '03', 'CALAPUJA', '193');
INSERT INTO `ubigeo` VALUES ('1849', '21', '07', '04', 'NICASIO', '193');
INSERT INTO `ubigeo` VALUES ('1850', '21', '07', '05', 'OCUVIRI', '193');
INSERT INTO `ubigeo` VALUES ('1851', '21', '07', '06', 'PALCA', '193');
INSERT INTO `ubigeo` VALUES ('1852', '21', '07', '07', 'PARATIA', '193');
INSERT INTO `ubigeo` VALUES ('1853', '21', '07', '08', 'PUCARA', '193');
INSERT INTO `ubigeo` VALUES ('1854', '21', '07', '09', 'SANTA LUCIA', '193');
INSERT INTO `ubigeo` VALUES ('1855', '21', '07', '10', 'VILAVILA', '193');
INSERT INTO `ubigeo` VALUES ('1856', '21', '08', '00', 'MELGAR', '193');
INSERT INTO `ubigeo` VALUES ('1857', '21', '08', '01', 'AYAVIRI', '193');
INSERT INTO `ubigeo` VALUES ('1858', '21', '08', '02', 'ANTAUTA', '193');
INSERT INTO `ubigeo` VALUES ('1859', '21', '08', '03', 'CUPI', '193');
INSERT INTO `ubigeo` VALUES ('1860', '21', '08', '04', 'LLALLI', '193');
INSERT INTO `ubigeo` VALUES ('1861', '21', '08', '05', 'MACARI', '193');
INSERT INTO `ubigeo` VALUES ('1862', '21', '08', '06', 'NUÑOA', '193');
INSERT INTO `ubigeo` VALUES ('1863', '21', '08', '07', 'ORURILLO', '193');
INSERT INTO `ubigeo` VALUES ('1864', '21', '08', '08', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('1865', '21', '08', '09', 'UMACHIRI', '193');
INSERT INTO `ubigeo` VALUES ('1866', '21', '09', '00', 'MOHO', '193');
INSERT INTO `ubigeo` VALUES ('1867', '21', '09', '01', 'MOHO', '193');
INSERT INTO `ubigeo` VALUES ('1868', '21', '09', '02', 'CONIMA', '193');
INSERT INTO `ubigeo` VALUES ('1869', '21', '09', '03', 'HUAYRAPATA', '193');
INSERT INTO `ubigeo` VALUES ('1870', '21', '09', '04', 'TILALI', '193');
INSERT INTO `ubigeo` VALUES ('1871', '21', '10', '00', 'SAN ANTONIO DE PUTINA', '193');
INSERT INTO `ubigeo` VALUES ('1872', '21', '10', '01', 'PUTINA', '193');
INSERT INTO `ubigeo` VALUES ('1873', '21', '10', '02', 'ANANEA', '193');
INSERT INTO `ubigeo` VALUES ('1874', '21', '10', '03', 'PEDRO VILCA APAZA', '193');
INSERT INTO `ubigeo` VALUES ('1875', '21', '10', '04', 'QUILCAPUNCU', '193');
INSERT INTO `ubigeo` VALUES ('1876', '21', '10', '05', 'SINA', '193');
INSERT INTO `ubigeo` VALUES ('1877', '21', '11', '00', 'SAN ROMAN', '193');
INSERT INTO `ubigeo` VALUES ('1878', '21', '11', '01', 'JULIACA', '193');
INSERT INTO `ubigeo` VALUES ('1879', '21', '11', '02', 'CABANA', '193');
INSERT INTO `ubigeo` VALUES ('1880', '21', '11', '03', 'CABANILLAS', '193');
INSERT INTO `ubigeo` VALUES ('1881', '21', '11', '04', 'CARACOTO', '193');
INSERT INTO `ubigeo` VALUES ('1882', '21', '12', '00', 'SANDIA', '193');
INSERT INTO `ubigeo` VALUES ('1883', '21', '12', '01', 'SANDIA', '193');
INSERT INTO `ubigeo` VALUES ('1884', '21', '12', '02', 'CUYOCUYO', '193');
INSERT INTO `ubigeo` VALUES ('1885', '21', '12', '03', 'LIMBANI', '193');
INSERT INTO `ubigeo` VALUES ('1886', '21', '12', '04', 'PATAMBUCO', '193');
INSERT INTO `ubigeo` VALUES ('1887', '21', '12', '05', 'PHARA', '193');
INSERT INTO `ubigeo` VALUES ('1888', '21', '12', '06', 'QUIACA', '193');
INSERT INTO `ubigeo` VALUES ('1889', '21', '12', '07', 'SAN JUAN DEL ORO', '193');
INSERT INTO `ubigeo` VALUES ('1890', '21', '12', '08', 'YANAHUAYA', '193');
INSERT INTO `ubigeo` VALUES ('1891', '21', '12', '09', 'ALTO INAMBARI', '193');
INSERT INTO `ubigeo` VALUES ('1892', '21', '12', '10', 'SAN PEDRO DE PUTINA PUNCO', '193');
INSERT INTO `ubigeo` VALUES ('1893', '21', '13', '00', 'YUNGUYO', '193');
INSERT INTO `ubigeo` VALUES ('1894', '21', '13', '01', 'YUNGUYO', '193');
INSERT INTO `ubigeo` VALUES ('1895', '21', '13', '02', 'ANAPIA', '193');
INSERT INTO `ubigeo` VALUES ('1896', '21', '13', '03', 'COPANI', '193');
INSERT INTO `ubigeo` VALUES ('1897', '21', '13', '04', 'CUTURAPI', '193');
INSERT INTO `ubigeo` VALUES ('1898', '21', '13', '05', 'OLLARAYA', '193');
INSERT INTO `ubigeo` VALUES ('1899', '21', '13', '06', 'TINICACHI', '193');
INSERT INTO `ubigeo` VALUES ('1900', '21', '13', '07', 'UNICACHI', '193');
INSERT INTO `ubigeo` VALUES ('1901', '22', '00', '00', 'SAN MARTIN', '193');
INSERT INTO `ubigeo` VALUES ('1902', '22', '01', '00', 'MOYOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1903', '22', '01', '01', 'MOYOBAMBA', '193');
INSERT INTO `ubigeo` VALUES ('1904', '22', '01', '02', 'CALZADA', '193');
INSERT INTO `ubigeo` VALUES ('1905', '22', '01', '03', 'HABANA', '193');
INSERT INTO `ubigeo` VALUES ('1906', '22', '01', '04', 'JEPELACIO', '193');
INSERT INTO `ubigeo` VALUES ('1907', '22', '01', '05', 'SORITOR', '193');
INSERT INTO `ubigeo` VALUES ('1908', '22', '01', '06', 'YANTALO', '193');
INSERT INTO `ubigeo` VALUES ('1909', '22', '02', '00', 'BELLAVISTA', '193');
INSERT INTO `ubigeo` VALUES ('1910', '22', '02', '01', 'BELLAVISTA', '193');
INSERT INTO `ubigeo` VALUES ('1911', '22', '02', '02', 'ALTO BIAVO', '193');
INSERT INTO `ubigeo` VALUES ('1912', '22', '02', '03', 'BAJO BIAVO', '193');
INSERT INTO `ubigeo` VALUES ('1913', '22', '02', '04', 'HUALLAGA', '193');
INSERT INTO `ubigeo` VALUES ('1914', '22', '02', '05', 'SAN PABLO', '193');
INSERT INTO `ubigeo` VALUES ('1915', '22', '02', '06', 'SAN RAFAEL', '193');
INSERT INTO `ubigeo` VALUES ('1916', '22', '03', '00', 'EL DORADO', '193');
INSERT INTO `ubigeo` VALUES ('1917', '22', '03', '01', 'SAN JOSE DE SISA', '193');
INSERT INTO `ubigeo` VALUES ('1918', '22', '03', '02', 'AGUA BLANCA', '193');
INSERT INTO `ubigeo` VALUES ('1919', '22', '03', '03', 'SAN MARTIN', '193');
INSERT INTO `ubigeo` VALUES ('1920', '22', '03', '04', 'SANTA ROSA', '193');
INSERT INTO `ubigeo` VALUES ('1921', '22', '03', '05', 'SHATOJA', '193');
INSERT INTO `ubigeo` VALUES ('1922', '22', '04', '00', 'HUALLAGA', '193');
INSERT INTO `ubigeo` VALUES ('1923', '22', '04', '01', 'SAPOSOA', '193');
INSERT INTO `ubigeo` VALUES ('1924', '22', '04', '02', 'ALTO SAPOSOA', '193');
INSERT INTO `ubigeo` VALUES ('1925', '22', '04', '03', 'EL ESLABON', '193');
INSERT INTO `ubigeo` VALUES ('1926', '22', '04', '04', 'PISCOYACU', '193');
INSERT INTO `ubigeo` VALUES ('1927', '22', '04', '05', 'SACANCHE', '193');
INSERT INTO `ubigeo` VALUES ('1928', '22', '04', '06', 'TINGO DE SAPOSOA', '193');
INSERT INTO `ubigeo` VALUES ('1929', '22', '05', '00', 'LAMAS', '193');
INSERT INTO `ubigeo` VALUES ('1930', '22', '05', '01', 'LAMAS', '193');
INSERT INTO `ubigeo` VALUES ('1931', '22', '05', '02', 'ALONSO DE ALVARADO', '193');
INSERT INTO `ubigeo` VALUES ('1932', '22', '05', '03', 'BARRANQUITA', '193');
INSERT INTO `ubigeo` VALUES ('1933', '22', '05', '04', 'CAYNARACHI', '193');
INSERT INTO `ubigeo` VALUES ('1934', '22', '05', '05', 'CUÑUMBUQUI', '193');
INSERT INTO `ubigeo` VALUES ('1935', '22', '05', '06', 'PINTO RECODO', '193');
INSERT INTO `ubigeo` VALUES ('1936', '22', '05', '07', 'RUMISAPA', '193');
INSERT INTO `ubigeo` VALUES ('1937', '22', '05', '08', 'SAN ROQUE DE CUMBAZA', '193');
INSERT INTO `ubigeo` VALUES ('1938', '22', '05', '09', 'SHANAO', '193');
INSERT INTO `ubigeo` VALUES ('1939', '22', '05', '10', 'TABALOSOS', '193');
INSERT INTO `ubigeo` VALUES ('1940', '22', '05', '11', 'ZAPATERO', '193');
INSERT INTO `ubigeo` VALUES ('1941', '22', '06', '00', 'MARISCAL CACERES', '193');
INSERT INTO `ubigeo` VALUES ('1942', '22', '06', '01', 'JUANJUI', '193');
INSERT INTO `ubigeo` VALUES ('1943', '22', '06', '02', 'CAMPANILLA', '193');
INSERT INTO `ubigeo` VALUES ('1944', '22', '06', '03', 'HUICUNGO', '193');
INSERT INTO `ubigeo` VALUES ('1945', '22', '06', '04', 'PACHIZA', '193');
INSERT INTO `ubigeo` VALUES ('1946', '22', '06', '05', 'PAJARILLO', '193');
INSERT INTO `ubigeo` VALUES ('1947', '22', '07', '00', 'PICOTA', '193');
INSERT INTO `ubigeo` VALUES ('1948', '22', '07', '01', 'PICOTA', '193');
INSERT INTO `ubigeo` VALUES ('1949', '22', '07', '02', 'BUENOS AIRES', '193');
INSERT INTO `ubigeo` VALUES ('1950', '22', '07', '03', 'CASPISAPA', '193');
INSERT INTO `ubigeo` VALUES ('1951', '22', '07', '04', 'PILLUANA', '193');
INSERT INTO `ubigeo` VALUES ('1952', '22', '07', '05', 'PUCACACA', '193');
INSERT INTO `ubigeo` VALUES ('1953', '22', '07', '06', 'SAN CRISTOBAL', '193');
INSERT INTO `ubigeo` VALUES ('1954', '22', '07', '07', 'SAN HILARION', '193');
INSERT INTO `ubigeo` VALUES ('1955', '22', '07', '08', 'SHAMBOYACU', '193');
INSERT INTO `ubigeo` VALUES ('1956', '22', '07', '09', 'TINGO DE PONASA', '193');
INSERT INTO `ubigeo` VALUES ('1957', '22', '07', '10', 'TRES UNIDOS', '193');
INSERT INTO `ubigeo` VALUES ('1958', '22', '08', '00', 'RIOJA', '193');
INSERT INTO `ubigeo` VALUES ('1959', '22', '08', '01', 'RIOJA', '193');
INSERT INTO `ubigeo` VALUES ('1960', '22', '08', '02', 'AWAJUN', '193');
INSERT INTO `ubigeo` VALUES ('1961', '22', '08', '03', 'ELIAS SOPLIN VARGAS', '193');
INSERT INTO `ubigeo` VALUES ('1962', '22', '08', '04', 'NUEVA CAJAMARCA', '193');
INSERT INTO `ubigeo` VALUES ('1963', '22', '08', '05', 'PARDO MIGUEL', '193');
INSERT INTO `ubigeo` VALUES ('1964', '22', '08', '06', 'POSIC', '193');
INSERT INTO `ubigeo` VALUES ('1965', '22', '08', '07', 'SAN FERNANDO', '193');
INSERT INTO `ubigeo` VALUES ('1966', '22', '08', '08', 'YORONGOS', '193');
INSERT INTO `ubigeo` VALUES ('1967', '22', '08', '09', 'YURACYACU', '193');
INSERT INTO `ubigeo` VALUES ('1968', '22', '09', '00', 'SAN MARTIN', '193');
INSERT INTO `ubigeo` VALUES ('1969', '22', '09', '01', 'TARAPOTO', '193');
INSERT INTO `ubigeo` VALUES ('1970', '22', '09', '02', 'ALBERTO LEVEAU', '193');
INSERT INTO `ubigeo` VALUES ('1971', '22', '09', '03', 'CACATACHI', '193');
INSERT INTO `ubigeo` VALUES ('1972', '22', '09', '04', 'CHAZUTA', '193');
INSERT INTO `ubigeo` VALUES ('1973', '22', '09', '05', 'CHIPURANA', '193');
INSERT INTO `ubigeo` VALUES ('1974', '22', '09', '06', 'EL PORVENIR', '193');
INSERT INTO `ubigeo` VALUES ('1975', '22', '09', '07', 'HUIMBAYOC', '193');
INSERT INTO `ubigeo` VALUES ('1976', '22', '09', '08', 'JUAN GUERRA', '193');
INSERT INTO `ubigeo` VALUES ('1977', '22', '09', '09', 'LA BANDA DE SHILCAYO', '193');
INSERT INTO `ubigeo` VALUES ('1978', '22', '09', '10', 'MORALES', '193');
INSERT INTO `ubigeo` VALUES ('1979', '22', '09', '11', 'PAPAPLAYA', '193');
INSERT INTO `ubigeo` VALUES ('1980', '22', '09', '12', 'SAN ANTONIO', '193');
INSERT INTO `ubigeo` VALUES ('1981', '22', '09', '13', 'SAUCE', '193');
INSERT INTO `ubigeo` VALUES ('1982', '22', '09', '14', 'SHAPAJA', '193');
INSERT INTO `ubigeo` VALUES ('1983', '22', '10', '00', 'TOCACHE', '193');
INSERT INTO `ubigeo` VALUES ('1984', '22', '10', '01', 'TOCACHE', '193');
INSERT INTO `ubigeo` VALUES ('1985', '22', '10', '02', 'NUEVO PROGRESO', '193');
INSERT INTO `ubigeo` VALUES ('1986', '22', '10', '03', 'POLVORA', '193');
INSERT INTO `ubigeo` VALUES ('1987', '22', '10', '04', 'SHUNTE', '193');
INSERT INTO `ubigeo` VALUES ('1988', '22', '10', '05', 'UCHIZA', '193');
INSERT INTO `ubigeo` VALUES ('1989', '23', '00', '00', 'TACNA', '193');
INSERT INTO `ubigeo` VALUES ('1990', '23', '01', '00', 'TACNA', '193');
INSERT INTO `ubigeo` VALUES ('1991', '23', '01', '01', 'TACNA', '193');
INSERT INTO `ubigeo` VALUES ('1992', '23', '01', '02', 'ALTO DE LA ALIANZA', '193');
INSERT INTO `ubigeo` VALUES ('1993', '23', '01', '03', 'CALANA', '193');
INSERT INTO `ubigeo` VALUES ('1994', '23', '01', '04', 'CIUDAD NUEVA', '193');
INSERT INTO `ubigeo` VALUES ('1995', '23', '01', '05', 'INCLAN', '193');
INSERT INTO `ubigeo` VALUES ('1996', '23', '01', '06', 'PACHIA', '193');
INSERT INTO `ubigeo` VALUES ('1997', '23', '01', '07', 'PALCA', '193');
INSERT INTO `ubigeo` VALUES ('1998', '23', '01', '08', 'POCOLLAY', '193');
INSERT INTO `ubigeo` VALUES ('1999', '23', '01', '09', 'SAMA', '193');
INSERT INTO `ubigeo` VALUES ('2000', '23', '01', '10', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', '193');
INSERT INTO `ubigeo` VALUES ('2001', '23', '02', '00', 'CANDARAVE', '193');
INSERT INTO `ubigeo` VALUES ('2002', '23', '02', '01', 'CANDARAVE', '193');
INSERT INTO `ubigeo` VALUES ('2003', '23', '02', '02', 'CAIRANI', '193');
INSERT INTO `ubigeo` VALUES ('2004', '23', '02', '03', 'CAMILACA', '193');
INSERT INTO `ubigeo` VALUES ('2005', '23', '02', '04', 'CURIBAYA', '193');
INSERT INTO `ubigeo` VALUES ('2006', '23', '02', '05', 'HUANUARA', '193');
INSERT INTO `ubigeo` VALUES ('2007', '23', '02', '06', 'QUILAHUANI', '193');
INSERT INTO `ubigeo` VALUES ('2008', '23', '03', '00', 'JORGE BASADRE', '193');
INSERT INTO `ubigeo` VALUES ('2009', '23', '03', '01', 'LOCUMBA', '193');
INSERT INTO `ubigeo` VALUES ('2010', '23', '03', '02', 'ILABAYA', '193');
INSERT INTO `ubigeo` VALUES ('2011', '23', '03', '03', 'ITE', '193');
INSERT INTO `ubigeo` VALUES ('2012', '23', '04', '00', 'TARATA', '193');
INSERT INTO `ubigeo` VALUES ('2013', '23', '04', '01', 'TARATA', '193');
INSERT INTO `ubigeo` VALUES ('2014', '23', '04', '02', 'HEROES ALBARRACIN', '193');
INSERT INTO `ubigeo` VALUES ('2015', '23', '04', '03', 'ESTIQUE', '193');
INSERT INTO `ubigeo` VALUES ('2016', '23', '04', '04', 'ESTIQUE-PAMPA', '193');
INSERT INTO `ubigeo` VALUES ('2017', '23', '04', '05', 'SITAJARA', '193');
INSERT INTO `ubigeo` VALUES ('2018', '23', '04', '06', 'SUSAPAYA', '193');
INSERT INTO `ubigeo` VALUES ('2019', '23', '04', '07', 'TARUCACHI', '193');
INSERT INTO `ubigeo` VALUES ('2020', '23', '04', '08', 'TICACO', '193');
INSERT INTO `ubigeo` VALUES ('2021', '24', '00', '00', 'TUMBES', '193');
INSERT INTO `ubigeo` VALUES ('2022', '24', '01', '00', 'TUMBES', '193');
INSERT INTO `ubigeo` VALUES ('2023', '24', '01', '01', 'TUMBES', '193');
INSERT INTO `ubigeo` VALUES ('2024', '24', '01', '02', 'CORRALES', '193');
INSERT INTO `ubigeo` VALUES ('2025', '24', '01', '03', 'LA CRUZ', '193');
INSERT INTO `ubigeo` VALUES ('2026', '24', '01', '04', 'PAMPAS DE HOSPITAL', '193');
INSERT INTO `ubigeo` VALUES ('2027', '24', '01', '05', 'SAN JACINTO', '193');
INSERT INTO `ubigeo` VALUES ('2028', '24', '01', '06', 'SAN JUAN DE LA VIRGEN', '193');
INSERT INTO `ubigeo` VALUES ('2029', '24', '02', '00', 'CONTRALMIRANTE VILLAR', '193');
INSERT INTO `ubigeo` VALUES ('2030', '24', '02', '01', 'ZORRITOS', '193');
INSERT INTO `ubigeo` VALUES ('2031', '24', '02', '02', 'CASITAS', '193');
INSERT INTO `ubigeo` VALUES ('2032', '24', '02', '03', 'CANOAS DE PUNTA SAL', '193');
INSERT INTO `ubigeo` VALUES ('2033', '24', '03', '00', 'ZARUMILLA', '193');
INSERT INTO `ubigeo` VALUES ('2034', '24', '03', '01', 'ZARUMILLA', '193');
INSERT INTO `ubigeo` VALUES ('2035', '24', '03', '02', 'AGUAS VERDES', '193');
INSERT INTO `ubigeo` VALUES ('2036', '24', '03', '03', 'MATAPALO', '193');
INSERT INTO `ubigeo` VALUES ('2037', '24', '03', '04', 'PAPAYAL', '193');
INSERT INTO `ubigeo` VALUES ('2038', '25', '00', '00', 'UCAYALI', '193');
INSERT INTO `ubigeo` VALUES ('2039', '25', '01', '00', 'CORONEL PORTILLO', '193');
INSERT INTO `ubigeo` VALUES ('2040', '25', '01', '01', 'CALLERIA', '193');
INSERT INTO `ubigeo` VALUES ('2041', '25', '01', '02', 'CAMPOVERDE', '193');
INSERT INTO `ubigeo` VALUES ('2042', '25', '01', '03', 'IPARIA', '193');
INSERT INTO `ubigeo` VALUES ('2043', '25', '01', '04', 'MASISEA', '193');
INSERT INTO `ubigeo` VALUES ('2044', '25', '01', '05', 'YARINACOCHA', '193');
INSERT INTO `ubigeo` VALUES ('2045', '25', '01', '06', 'NUEVA REQUENA', '193');
INSERT INTO `ubigeo` VALUES ('2046', '25', '01', '07', 'MANANTAY', '193');
INSERT INTO `ubigeo` VALUES ('2047', '25', '02', '00', 'ATALAYA', '193');
INSERT INTO `ubigeo` VALUES ('2048', '25', '02', '01', 'RAYMONDI', '193');
INSERT INTO `ubigeo` VALUES ('2049', '25', '02', '02', 'SEPAHUA', '193');
INSERT INTO `ubigeo` VALUES ('2050', '25', '02', '03', 'TAHUANIA', '193');
INSERT INTO `ubigeo` VALUES ('2051', '25', '02', '04', 'YURUA', '193');
INSERT INTO `ubigeo` VALUES ('2052', '25', '03', '00', 'PADRE ABAD', '193');
INSERT INTO `ubigeo` VALUES ('2053', '25', '03', '01', 'PADRE ABAD', '193');
INSERT INTO `ubigeo` VALUES ('2054', '25', '03', '02', 'IRAZOLA', '193');
INSERT INTO `ubigeo` VALUES ('2055', '25', '03', '03', 'CURIMANA', '193');
INSERT INTO `ubigeo` VALUES ('2056', '25', '04', '00', 'PURUS', '193');
INSERT INTO `ubigeo` VALUES ('2057', '25', '04', '01', 'PURUS', '193');
INSERT INTO `ubigeo` VALUES ('2058', '', '', '', 'BOUVET ISLAND', '1');
INSERT INTO `ubigeo` VALUES ('2059', '', '', '', 'COTE D IVOIRE', '2');
INSERT INTO `ubigeo` VALUES ('2060', '', '', '', 'FALKLAND ISLANDS (MA', '3');
INSERT INTO `ubigeo` VALUES ('2061', '', '', '', 'FRANCE, METROPOLITAN', '4');
INSERT INTO `ubigeo` VALUES ('2062', '', '', '', 'FRENCH SOUTHERN TERR', '5');
INSERT INTO `ubigeo` VALUES ('2063', '', '', '', 'HEARD AND MC DONALD ', '6');
INSERT INTO `ubigeo` VALUES ('2064', '', '', '', 'MAYOTTE', '7');
INSERT INTO `ubigeo` VALUES ('2065', '', '', '', 'SOUTH GEORGIA AND TH', '8');
INSERT INTO `ubigeo` VALUES ('2066', '', '', '', 'SVALBARD AND JAN MAY', '9');
INSERT INTO `ubigeo` VALUES ('2067', '', '', '', 'UNITED STATES MINOR ', '10');
INSERT INTO `ubigeo` VALUES ('2068', '', '', '', 'OTROS PAISES O LUGAR', '11');
INSERT INTO `ubigeo` VALUES ('2069', '', '', '', 'AFGANISTAN', '12');
INSERT INTO `ubigeo` VALUES ('2070', '', '', '', 'ALBANIA', '13');
INSERT INTO `ubigeo` VALUES ('2071', '', '', '', 'ALDERNEY', '14');
INSERT INTO `ubigeo` VALUES ('2072', '', '', '', 'ALEMANIA', '15');
INSERT INTO `ubigeo` VALUES ('2073', '', '', '', 'ARMENIA', '16');
INSERT INTO `ubigeo` VALUES ('2074', '', '', '', 'ARUBA', '17');
INSERT INTO `ubigeo` VALUES ('2075', '', '', '', 'ASCENCION', '18');
INSERT INTO `ubigeo` VALUES ('2076', '', '', '', 'BOSNIA-HERZEGOVINA', '19');
INSERT INTO `ubigeo` VALUES ('2077', '', '', '', 'BURKINA FASO', '20');
INSERT INTO `ubigeo` VALUES ('2078', '', '', '', 'ANDORRA', '21');
INSERT INTO `ubigeo` VALUES ('2079', '', '', '', 'ANGOLA', '22');
INSERT INTO `ubigeo` VALUES ('2080', '', '', '', 'ANGUILLA', '23');
INSERT INTO `ubigeo` VALUES ('2081', '', '', '', 'ANTIGUA Y BARBUDA', '24');
INSERT INTO `ubigeo` VALUES ('2082', '', '', '', 'ANTILLAS HOLANDESAS', '25');
INSERT INTO `ubigeo` VALUES ('2083', '', '', '', 'ARABIA SAUDITA', '26');
INSERT INTO `ubigeo` VALUES ('2084', '', '', '', 'ARGELIA', '27');
INSERT INTO `ubigeo` VALUES ('2085', '', '', '', 'ARGENTINA', '28');
INSERT INTO `ubigeo` VALUES ('2086', '', '', '', 'AUSTRALIA', '29');
INSERT INTO `ubigeo` VALUES ('2087', '', '', '', 'AUSTRIA', '30');
INSERT INTO `ubigeo` VALUES ('2088', '', '', '', 'AZERBAIJAN', '31');
INSERT INTO `ubigeo` VALUES ('2089', '', '', '', 'BAHAMAS', '32');
INSERT INTO `ubigeo` VALUES ('2090', '', '', '', 'BAHREIN', '33');
INSERT INTO `ubigeo` VALUES ('2091', '', '', '', 'BANGLADESH', '34');
INSERT INTO `ubigeo` VALUES ('2092', '', '', '', 'BARBADOS', '35');
INSERT INTO `ubigeo` VALUES ('2093', '', '', '', 'BELGICA', '36');
INSERT INTO `ubigeo` VALUES ('2094', '', '', '', 'BELICE', '37');
INSERT INTO `ubigeo` VALUES ('2095', '', '', '', 'BERMUDAS', '38');
INSERT INTO `ubigeo` VALUES ('2096', '', '', '', 'BELARUS', '39');
INSERT INTO `ubigeo` VALUES ('2097', '', '', '', 'MYANMAR', '40');
INSERT INTO `ubigeo` VALUES ('2098', '', '', '', 'BOLIVIA', '41');
INSERT INTO `ubigeo` VALUES ('2099', '', '', '', 'BOTSWANA', '42');
INSERT INTO `ubigeo` VALUES ('2100', '', '', '', 'BRASIL', '43');
INSERT INTO `ubigeo` VALUES ('2101', '', '', '', 'BRUNEI DARUSSALAM', '44');
INSERT INTO `ubigeo` VALUES ('2102', '', '', '', 'BULGARIA', '45');
INSERT INTO `ubigeo` VALUES ('2103', '', '', '', 'BURUNDI', '46');
INSERT INTO `ubigeo` VALUES ('2104', '', '', '', 'BUTAN', '47');
INSERT INTO `ubigeo` VALUES ('2105', '', '', '', 'CABO VERDE', '48');
INSERT INTO `ubigeo` VALUES ('2106', '', '', '', 'CAIMAN,ISLAS', '49');
INSERT INTO `ubigeo` VALUES ('2107', '', '', '', 'CAMBOYA', '50');
INSERT INTO `ubigeo` VALUES ('2108', '', '', '', 'CAMERUN,REPUBLICA UN', '51');
INSERT INTO `ubigeo` VALUES ('2109', '', '', '', 'CAMPIONE D TALIA', '52');
INSERT INTO `ubigeo` VALUES ('2110', '', '', '', 'CANADA', '53');
INSERT INTO `ubigeo` VALUES ('2111', '', '', '', 'CANAL (NORMANDAS), I', '54');
INSERT INTO `ubigeo` VALUES ('2112', '', '', '', 'CANTON Y ENDERBURRY', '55');
INSERT INTO `ubigeo` VALUES ('2113', '', '', '', 'SANTA SEDE', '56');
INSERT INTO `ubigeo` VALUES ('2114', '', '', '', 'COCOS (KEELING),ISLA', '57');
INSERT INTO `ubigeo` VALUES ('2115', '', '', '', 'COLOMBIA', '58');
INSERT INTO `ubigeo` VALUES ('2116', '', '', '', 'COMORAS', '59');
INSERT INTO `ubigeo` VALUES ('2117', '', '', '', 'CONGO', '60');
INSERT INTO `ubigeo` VALUES ('2118', '', '', '', 'COOK, ISLAS', '61');
INSERT INTO `ubigeo` VALUES ('2119', '', '', '', 'COREA (NORTE), REPUB', '62');
INSERT INTO `ubigeo` VALUES ('2120', '', '', '', 'COREA (SUR), REPUBLI', '63');
INSERT INTO `ubigeo` VALUES ('2121', '', '', '', 'COSTA DE MARFIL', '64');
INSERT INTO `ubigeo` VALUES ('2122', '', '', '', 'COSTA RICA', '65');
INSERT INTO `ubigeo` VALUES ('2123', '', '', '', 'CROACIA', '66');
INSERT INTO `ubigeo` VALUES ('2124', '', '', '', 'CUBA', '67');
INSERT INTO `ubigeo` VALUES ('2125', '', '', '', 'CHAD', '68');
INSERT INTO `ubigeo` VALUES ('2126', '', '', '', 'CHECOSLOVAQUIA', '69');
INSERT INTO `ubigeo` VALUES ('2127', '', '', '', 'CHILE', '70');
INSERT INTO `ubigeo` VALUES ('2128', '', '', '', 'CHINA', '71');
INSERT INTO `ubigeo` VALUES ('2129', '', '', '', 'TAIWAN (FORMOSA)', '72');
INSERT INTO `ubigeo` VALUES ('2130', '', '', '', 'CHIPRE', '73');
INSERT INTO `ubigeo` VALUES ('2131', '', '', '', 'BENIN', '74');
INSERT INTO `ubigeo` VALUES ('2132', '', '', '', 'DINAMARCA', '75');
INSERT INTO `ubigeo` VALUES ('2133', '', '', '', 'DOMINICA', '76');
INSERT INTO `ubigeo` VALUES ('2134', '', '', '', 'ECUADOR', '77');
INSERT INTO `ubigeo` VALUES ('2135', '', '', '', 'EGIPTO', '78');
INSERT INTO `ubigeo` VALUES ('2136', '', '', '', 'EL SALVADOR', '79');
INSERT INTO `ubigeo` VALUES ('2137', '', '', '', 'ERITREA', '80');
INSERT INTO `ubigeo` VALUES ('2138', '', '', '', 'EMIRATOS ARABES UNID', '81');
INSERT INTO `ubigeo` VALUES ('2139', '', '', '', 'ESPANA', '82');
INSERT INTO `ubigeo` VALUES ('2140', '', '', '', 'ESLOVAQUIA', '83');
INSERT INTO `ubigeo` VALUES ('2141', '', '', '', 'ESLOVENIA', '84');
INSERT INTO `ubigeo` VALUES ('2142', '', '', '', 'ESTADOS UNIDOS', '85');
INSERT INTO `ubigeo` VALUES ('2143', '', '', '', 'ESTONIA', '86');
INSERT INTO `ubigeo` VALUES ('2144', '', '', '', 'ETIOPIA', '87');
INSERT INTO `ubigeo` VALUES ('2145', '', '', '', 'FEROE, ISLAS', '88');
INSERT INTO `ubigeo` VALUES ('2146', '', '', '', 'FILIPINAS', '89');
INSERT INTO `ubigeo` VALUES ('2147', '', '', '', 'FINLANDIA', '90');
INSERT INTO `ubigeo` VALUES ('2148', '', '', '', 'FRANCIA', '91');
INSERT INTO `ubigeo` VALUES ('2149', '', '', '', 'GABON', '92');
INSERT INTO `ubigeo` VALUES ('2150', '', '', '', 'GAMBIA', '93');
INSERT INTO `ubigeo` VALUES ('2151', '', '', '', 'GAZA Y JERICO', '94');
INSERT INTO `ubigeo` VALUES ('2152', '', '', '', 'GEORGIA', '95');
INSERT INTO `ubigeo` VALUES ('2153', '', '', '', 'GHANA', '96');
INSERT INTO `ubigeo` VALUES ('2154', '', '', '', 'GIBRALTAR', '97');
INSERT INTO `ubigeo` VALUES ('2155', '', '', '', 'GRANADA', '98');
INSERT INTO `ubigeo` VALUES ('2156', '', '', '', 'GRECIA', '99');
INSERT INTO `ubigeo` VALUES ('2157', '', '', '', 'GROENLANDIA', '100');
INSERT INTO `ubigeo` VALUES ('2158', '', '', '', 'GUADALUPE', '101');
INSERT INTO `ubigeo` VALUES ('2159', '', '', '', 'GUAM', '102');
INSERT INTO `ubigeo` VALUES ('2160', '', '', '', 'GUATEMALA', '103');
INSERT INTO `ubigeo` VALUES ('2161', '', '', '', 'GUAYANA FRANCESA', '104');
INSERT INTO `ubigeo` VALUES ('2162', '', '', '', 'GUERNSEY', '105');
INSERT INTO `ubigeo` VALUES ('2163', '', '', '', 'GUINEA', '106');
INSERT INTO `ubigeo` VALUES ('2164', '', '', '', 'GUINEA ECUATORIAL', '107');
INSERT INTO `ubigeo` VALUES ('2165', '', '', '', 'GUINEA-BISSAU', '108');
INSERT INTO `ubigeo` VALUES ('2166', '', '', '', 'GUYANA', '109');
INSERT INTO `ubigeo` VALUES ('2167', '', '', '', 'HAITI', '110');
INSERT INTO `ubigeo` VALUES ('2168', '', '', '', 'HONDURAS', '111');
INSERT INTO `ubigeo` VALUES ('2169', '', '', '', 'HONDURAS BRITANICAS', '112');
INSERT INTO `ubigeo` VALUES ('2170', '', '', '', 'HONG KONG', '113');
INSERT INTO `ubigeo` VALUES ('2171', '', '', '', 'HUNGRIA', '114');
INSERT INTO `ubigeo` VALUES ('2172', '', '', '', 'INDIA', '115');
INSERT INTO `ubigeo` VALUES ('2173', '', '', '', 'INDONESIA', '116');
INSERT INTO `ubigeo` VALUES ('2174', '', '', '', 'IRAK', '117');
INSERT INTO `ubigeo` VALUES ('2175', '', '', '', 'IRAN, REPUBLICA ISLA', '118');
INSERT INTO `ubigeo` VALUES ('2176', '', '', '', 'IRLANDA (EIRE)', '119');
INSERT INTO `ubigeo` VALUES ('2177', '', '', '', 'ISLA AZORES', '120');
INSERT INTO `ubigeo` VALUES ('2178', '', '', '', 'ISLA DEL MAN', '121');
INSERT INTO `ubigeo` VALUES ('2179', '', '', '', 'ISLANDIA', '122');
INSERT INTO `ubigeo` VALUES ('2180', '', '', '', 'ISLAS CANARIAS', '123');
INSERT INTO `ubigeo` VALUES ('2181', '', '', '', 'ISLAS DE CHRISTMAS', '124');
INSERT INTO `ubigeo` VALUES ('2182', '', '', '', 'ISLAS QESHM', '125');
INSERT INTO `ubigeo` VALUES ('2183', '', '', '', 'ISRAEL', '126');
INSERT INTO `ubigeo` VALUES ('2184', '', '', '', 'ITALIA', '127');
INSERT INTO `ubigeo` VALUES ('2185', '', '', '', 'JAMAICA', '128');
INSERT INTO `ubigeo` VALUES ('2186', '', '', '', 'JONSTON, ISLAS', '129');
INSERT INTO `ubigeo` VALUES ('2187', '', '', '', 'JAPON', '130');
INSERT INTO `ubigeo` VALUES ('2188', '', '', '', 'JERSEY', '131');
INSERT INTO `ubigeo` VALUES ('2189', '', '', '', 'JORDANIA', '132');
INSERT INTO `ubigeo` VALUES ('2190', '', '', '', 'KAZAJSTAN', '133');
INSERT INTO `ubigeo` VALUES ('2191', '', '', '', 'KENIA', '134');
INSERT INTO `ubigeo` VALUES ('2192', '', '', '', 'KIRIBATI', '135');
INSERT INTO `ubigeo` VALUES ('2193', '', '', '', 'KIRGUIZISTAN', '136');
INSERT INTO `ubigeo` VALUES ('2194', '', '', '', 'KUWAIT', '137');
INSERT INTO `ubigeo` VALUES ('2195', '', '', '', 'LABUN', '138');
INSERT INTO `ubigeo` VALUES ('2196', '', '', '', 'LAOS, REPUBLICA POPU', '139');
INSERT INTO `ubigeo` VALUES ('2197', '', '', '', 'LESOTHO', '140');
INSERT INTO `ubigeo` VALUES ('2198', '', '', '', 'LETONIA', '141');
INSERT INTO `ubigeo` VALUES ('2199', '', '', '', 'LIBANO', '142');
INSERT INTO `ubigeo` VALUES ('2200', '', '', '', 'LIBERIA', '143');
INSERT INTO `ubigeo` VALUES ('2201', '', '', '', 'LIBIA', '144');
INSERT INTO `ubigeo` VALUES ('2202', '', '', '', 'LIECHTENSTEIN', '145');
INSERT INTO `ubigeo` VALUES ('2203', '', '', '', 'LITUANIA', '146');
INSERT INTO `ubigeo` VALUES ('2204', '', '', '', 'LUXEMBURGO', '147');
INSERT INTO `ubigeo` VALUES ('2205', '', '', '', 'MACAO', '148');
INSERT INTO `ubigeo` VALUES ('2206', '', '', '', 'MACEDONIA', '149');
INSERT INTO `ubigeo` VALUES ('2207', '', '', '', 'MADAGASCAR', '150');
INSERT INTO `ubigeo` VALUES ('2208', '', '', '', 'MADEIRA', '151');
INSERT INTO `ubigeo` VALUES ('2209', '', '', '', 'MALAYSIA', '152');
INSERT INTO `ubigeo` VALUES ('2210', '', '', '', 'MALAWI', '153');
INSERT INTO `ubigeo` VALUES ('2211', '', '', '', 'MALDIVAS', '154');
INSERT INTO `ubigeo` VALUES ('2212', '', '', '', 'MALI', '155');
INSERT INTO `ubigeo` VALUES ('2213', '', '', '', 'MALTA', '156');
INSERT INTO `ubigeo` VALUES ('2214', '', '', '', 'MARIANAS DEL NORTE, ', '157');
INSERT INTO `ubigeo` VALUES ('2215', '', '', '', 'MARSHALL, ISLAS', '158');
INSERT INTO `ubigeo` VALUES ('2216', '', '', '', 'MARRUECOS', '159');
INSERT INTO `ubigeo` VALUES ('2217', '', '', '', 'MARTINICA', '160');
INSERT INTO `ubigeo` VALUES ('2218', '', '', '', 'MAURICIO', '161');
INSERT INTO `ubigeo` VALUES ('2219', '', '', '', 'MAURITANIA', '162');
INSERT INTO `ubigeo` VALUES ('2220', '', '', '', 'MEXICO', '163');
INSERT INTO `ubigeo` VALUES ('2221', '', '', '', 'MICRONESIA, ESTADOS ', '164');
INSERT INTO `ubigeo` VALUES ('2222', '', '', '', 'MIDWAY ISLAS', '165');
INSERT INTO `ubigeo` VALUES ('2223', '', '', '', 'MOLDAVIA', '166');
INSERT INTO `ubigeo` VALUES ('2224', '', '', '', 'MONGOLIA', '167');
INSERT INTO `ubigeo` VALUES ('2225', '', '', '', 'MONACO', '168');
INSERT INTO `ubigeo` VALUES ('2226', '', '', '', 'MONTSERRAT, ISLA', '169');
INSERT INTO `ubigeo` VALUES ('2227', '', '', '', 'MOZAMBIQUE', '170');
INSERT INTO `ubigeo` VALUES ('2228', '', '', '', 'NAMIBIA', '171');
INSERT INTO `ubigeo` VALUES ('2229', '', '', '', 'NAURU', '172');
INSERT INTO `ubigeo` VALUES ('2230', '', '', '', 'NAVIDAD (CHRISTMAS),', '173');
INSERT INTO `ubigeo` VALUES ('2231', '', '', '', 'NEPAL', '174');
INSERT INTO `ubigeo` VALUES ('2232', '', '', '', 'NICARAGUA', '175');
INSERT INTO `ubigeo` VALUES ('2233', '', '', '', 'NIGER', '176');
INSERT INTO `ubigeo` VALUES ('2234', '', '', '', 'NIGERIA', '177');
INSERT INTO `ubigeo` VALUES ('2235', '', '', '', 'NIUE, ISLA', '178');
INSERT INTO `ubigeo` VALUES ('2236', '', '', '', 'NORFOLK, ISLA', '179');
INSERT INTO `ubigeo` VALUES ('2237', '', '', '', 'NORUEGA', '180');
INSERT INTO `ubigeo` VALUES ('2238', '', '', '', 'NUEVA CALEDONIA', '181');
INSERT INTO `ubigeo` VALUES ('2239', '', '', '', 'PAPUASIA NUEVA GUINE', '182');
INSERT INTO `ubigeo` VALUES ('2240', '', '', '', 'NUEVA ZELANDA', '183');
INSERT INTO `ubigeo` VALUES ('2241', '', '', '', 'VANUATU', '184');
INSERT INTO `ubigeo` VALUES ('2242', '', '', '', 'OMAN', '185');
INSERT INTO `ubigeo` VALUES ('2243', '', '', '', 'PACIFICO, ISLAS DEL', '186');
INSERT INTO `ubigeo` VALUES ('2244', '', '', '', 'PAISES BAJOS', '187');
INSERT INTO `ubigeo` VALUES ('2245', '', '', '', 'PAKISTAN', '188');
INSERT INTO `ubigeo` VALUES ('2246', '', '', '', 'PALAU, ISLAS', '189');
INSERT INTO `ubigeo` VALUES ('2247', '', '', '', 'TERRITORIO AUTONOMO ', '190');
INSERT INTO `ubigeo` VALUES ('2248', '', '', '', 'PANAMA', '191');
INSERT INTO `ubigeo` VALUES ('2249', '', '', '', 'PARAGUAY', '192');
INSERT INTO `ubigeo` VALUES ('2251', '', '', '', 'PITCAIRN, ISLA', '194');
INSERT INTO `ubigeo` VALUES ('2252', '', '', '', 'POLINESIA FRANCESA', '195');
INSERT INTO `ubigeo` VALUES ('2253', '', '', '', 'POLONIA', '196');
INSERT INTO `ubigeo` VALUES ('2254', '', '', '', 'PORTUGAL', '197');
INSERT INTO `ubigeo` VALUES ('2255', '', '', '', 'PUERTO RICO', '198');
INSERT INTO `ubigeo` VALUES ('2256', '', '', '', 'QATAR', '199');
INSERT INTO `ubigeo` VALUES ('2257', '', '', '', 'REINO UNIDO', '200');
INSERT INTO `ubigeo` VALUES ('2258', '', '', '', 'ESCOCIA', '201');
INSERT INTO `ubigeo` VALUES ('2259', '', '', '', 'REPUBLICA ARABE UNID', '202');
INSERT INTO `ubigeo` VALUES ('2260', '', '', '', 'REPUBLICA CENTROAFRI', '203');
INSERT INTO `ubigeo` VALUES ('2261', '', '', '', 'REPUBLICA CHECA', '204');
INSERT INTO `ubigeo` VALUES ('2262', '', '', '', 'REPUBLICA DE SWAZILA', '205');
INSERT INTO `ubigeo` VALUES ('2263', '', '', '', 'REPUBLICA DE TUNEZ', '206');
INSERT INTO `ubigeo` VALUES ('2264', '', '', '', 'REPUBLICA DOMINICANA', '207');
INSERT INTO `ubigeo` VALUES ('2265', '', '', '', 'REUNION', '208');
INSERT INTO `ubigeo` VALUES ('2266', '', '', '', 'ZIMBABWE', '209');
INSERT INTO `ubigeo` VALUES ('2267', '', '', '', 'RUMANIA', '210');
INSERT INTO `ubigeo` VALUES ('2268', '', '', '', 'RUANDA', '211');
INSERT INTO `ubigeo` VALUES ('2269', '', '', '', 'RUSIA', '212');
INSERT INTO `ubigeo` VALUES ('2270', '', '', '', 'SALOMON, ISLAS', '213');
INSERT INTO `ubigeo` VALUES ('2271', '', '', '', 'SAHARA OCCIDENTAL', '214');
INSERT INTO `ubigeo` VALUES ('2272', '', '', '', 'SAMOA OCCIDENTAL', '215');
INSERT INTO `ubigeo` VALUES ('2273', '', '', '', 'SAMOA NORTEAMERICANA', '216');
INSERT INTO `ubigeo` VALUES ('2274', '', '', '', 'SAN CRISTOBAL Y NIEV', '217');
INSERT INTO `ubigeo` VALUES ('2275', '', '', '', 'SAN MARINO', '218');
INSERT INTO `ubigeo` VALUES ('2276', '', '', '', 'SAN PEDRO Y MIQUELON', '219');
INSERT INTO `ubigeo` VALUES ('2277', '', '', '', 'SAN VICENTE Y LAS GR', '220');
INSERT INTO `ubigeo` VALUES ('2278', '', '', '', 'SANTA ELENA', '221');
INSERT INTO `ubigeo` VALUES ('2279', '', '', '', 'SANTA LUCIA', '222');
INSERT INTO `ubigeo` VALUES ('2280', '', '', '', 'SANTO TOME Y PRINCIP', '223');
INSERT INTO `ubigeo` VALUES ('2281', '', '', '', 'SENEGAL', '224');
INSERT INTO `ubigeo` VALUES ('2282', '', '', '', 'SEYCHELLES', '225');
INSERT INTO `ubigeo` VALUES ('2283', '', '', '', 'SIERRA LEONA', '226');
INSERT INTO `ubigeo` VALUES ('2284', '', '', '', 'SINGAPUR', '227');
INSERT INTO `ubigeo` VALUES ('2285', '', '', '', 'SIRIA, REPUBLICA ARA', '228');
INSERT INTO `ubigeo` VALUES ('2286', '', '', '', 'SOMALIA', '229');
INSERT INTO `ubigeo` VALUES ('2287', '', '', '', 'SRI LANKA', '230');
INSERT INTO `ubigeo` VALUES ('2288', '', '', '', 'SUDAFRICA, REPUBLICA', '231');
INSERT INTO `ubigeo` VALUES ('2289', '', '', '', 'SUDAN', '232');
INSERT INTO `ubigeo` VALUES ('2290', '', '', '', 'SUECIA', '233');
INSERT INTO `ubigeo` VALUES ('2291', '', '', '', 'SUIZA', '234');
INSERT INTO `ubigeo` VALUES ('2292', '', '', '', 'SURINAM', '235');
INSERT INTO `ubigeo` VALUES ('2293', '', '', '', 'SAWSILANDIA', '236');
INSERT INTO `ubigeo` VALUES ('2294', '', '', '', 'TADJIKISTAN', '237');
INSERT INTO `ubigeo` VALUES ('2295', '', '', '', 'TAILANDIA', '238');
INSERT INTO `ubigeo` VALUES ('2296', '', '', '', 'TANZANIA, REPUBLICA ', '239');
INSERT INTO `ubigeo` VALUES ('2297', '', '', '', 'DJIBOUTI', '240');
INSERT INTO `ubigeo` VALUES ('2298', '', '', '', 'TERRITORIO ANTARTICO', '241');
INSERT INTO `ubigeo` VALUES ('2299', '', '', '', 'TERRITORIO BRITANICO', '242');
INSERT INTO `ubigeo` VALUES ('2300', '', '', '', 'TIMOR DEL ESTE', '243');
INSERT INTO `ubigeo` VALUES ('2301', '', '', '', 'TOGO', '244');
INSERT INTO `ubigeo` VALUES ('2302', '', '', '', 'TOKELAU', '245');
INSERT INTO `ubigeo` VALUES ('2303', '', '', '', 'TONGA', '246');
INSERT INTO `ubigeo` VALUES ('2304', '', '', '', 'TRINIDAD Y TOBAGO', '247');
INSERT INTO `ubigeo` VALUES ('2305', '', '', '', 'TRISTAN DA CUNHA', '248');
INSERT INTO `ubigeo` VALUES ('2306', '', '', '', 'TUNICIA', '249');
INSERT INTO `ubigeo` VALUES ('2307', '', '', '', 'TURCAS Y CAICOS, ISL', '250');
INSERT INTO `ubigeo` VALUES ('2308', '', '', '', 'TURKMENISTAN', '251');
INSERT INTO `ubigeo` VALUES ('2309', '', '', '', 'TURQUIA', '252');
INSERT INTO `ubigeo` VALUES ('2310', '', '', '', 'TUVALU', '253');
INSERT INTO `ubigeo` VALUES ('2311', '', '', '', 'UCRANIA', '254');
INSERT INTO `ubigeo` VALUES ('2312', '', '', '', 'UGANDA', '255');
INSERT INTO `ubigeo` VALUES ('2313', '', '', '', 'URSS', '256');
INSERT INTO `ubigeo` VALUES ('2314', '', '', '', 'URUGUAY', '257');
INSERT INTO `ubigeo` VALUES ('2315', '', '', '', 'UZBEKISTAN', '258');
INSERT INTO `ubigeo` VALUES ('2316', '', '', '', 'VENEZUELA', '259');
INSERT INTO `ubigeo` VALUES ('2317', '', '', '', 'VIET NAM', '260');
INSERT INTO `ubigeo` VALUES ('2318', '', '', '', 'VIETNAM (DEL NORTE)', '261');
INSERT INTO `ubigeo` VALUES ('2319', '', '', '', 'VIRGENES, ISLAS (BRI', '262');
INSERT INTO `ubigeo` VALUES ('2320', '', '', '', 'VIRGENES, ISLAS (NOR', '263');
INSERT INTO `ubigeo` VALUES ('2321', '', '', '', 'FIJI', '264');
INSERT INTO `ubigeo` VALUES ('2322', '', '', '', 'WAKE, ISLA', '265');
INSERT INTO `ubigeo` VALUES ('2323', '', '', '', 'WALLIS Y FORTUNA, IS', '266');
INSERT INTO `ubigeo` VALUES ('2324', '', '', '', 'YEMEN', '267');
INSERT INTO `ubigeo` VALUES ('2325', '', '', '', 'YUGOSLAVIA', '268');
INSERT INTO `ubigeo` VALUES ('2326', '', '', '', 'ZAIRE', '269');
INSERT INTO `ubigeo` VALUES ('2327', '', '', '', 'ZAMBIA', '270');
INSERT INTO `ubigeo` VALUES ('2328', '', '', '', 'ZONA DEL CANAL DE PA', '271');
INSERT INTO `ubigeo` VALUES ('2329', '', '', '', 'ZONA LIBRE OSTRAVA', '272');
INSERT INTO `ubigeo` VALUES ('2330', '', '', '', 'ZONA NEUTRAL (PALEST', '273');

-- ----------------------------
-- Procedure structure for `elim_apoderado`
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_apoderado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_apoderado`(p_id_apoderado int)
BEGIN
	#Routine body goes here...
UPDATE apoderado SET estado = 0
WHERE Apoderado_ID = p_id_apoderado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `elim_cursos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_cursos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_cursos`(p_id_horario int)
BEGIN
	#Routine body goes here...
UPDATE cursos SET estado = 0
WHERE Cursos_ID = p_id_horario;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `elim_horario`
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_horario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_horario`(p_id_horario int)
BEGIN
	#Routine body goes here...
UPDATE horario SET estado = 0
WHERE Horario_ID = p_id_horario;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `elim_institucioneducativa`
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_institucioneducativa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_institucioneducativa`(p_id_institucioneducativa int)
BEGIN
	#Routine body goes here...
UPDATE institucioneducativa SET estado = 0
WHERE Institucioneducativa_ID = p_id_institucioneducativa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `ins_act_alumno`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_act_alumno`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_act_alumno`(xidalumno int(11),xidubigeo int(11),xidinstitucion int(11),xnombre varchar(255),xapellido_paterno varchar(255),xapellido_materno varchar(255), xdni int(11),xsexo varchar(2),xtelefono_movil int(11),xemail varchar(255),xfecha_nacimiento datetime,xgrado int(11))
BEGIN

declare xid int;
 DECLARE error INTEGER  default 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET error = 1;
DECLARE CONTINUE HANDLER FOR SQLWARNING  SET error = 1;
START TRANSACTION;
IF (xidalumno=0)
	then
		IF NOT EXISTS (SELECT Alumno_ID FROM alumno)
			THEN
				INSERT into alumno VALUES (
				1,
        xidubigeo,
        xidinstitucion,
				xnombre,
				xapellido_paterno,
        xapellido_materno,
				xdni,
				xsexo,
				xtelefono_movil,
				xemail,
        xfecha_nacimiento,
        xgrado,
				1);
				select 1 as ins_act_alumno;
		ELSE
				SET xid = (SELECT MAX(Alumno_ID) FROM alumno)+1;
				INSERT into alumno(
				Alumno_ID,
        ubigeo_ID,
        Institucioneducativa_ID, 
				nombre,
				apellido_paterno,
        apellido_materno,
				dni,
        sexo,
        telefono_movil,
        email,        
 				fecha_nacimiento,
        grado,
				estado)
				VALUES (
				xid,
        xidubigeo,
        xidinstitucion,
				xnombre,
				xapellido_paterno,
        xapellido_materno,
				xdni,
				xsexo,
				xtelefono_movil,
				xemail,
        xfecha_nacimiento,
			  xgrado,
				1);
				select xid as ins_act_alumno;
			END if;
ELSE
		UPDATE alumno SET
      ubigeo_ID=xidubigeo,  
      Institucioneducativa_ID=xidinstitucion,
			nombre=xnombre,
			apellido_paterno=xapellido_paterno,
      apellido_materno=xapellido_materno,
			dni=xdni,
			sexo=xsexo,
			telefono_movil=xtelefono_movil,
			email=xemail,
      fecha_nacimiento=xfecha_nacimiento,
      grado=xgrado

		WHERE Alumno_ID=xidalumno;
	END if;
commit;
if (error=1)
THEN
rollback;
select "Se ha producido un error.";
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `ins_act_apoderado`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_act_apoderado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_act_apoderado`(xidapoderado int(11),xnombre varchar(255),xapellido_paterno varchar(255),xapellido_materno varchar(255),xdireccion VARCHAR(255),xocupacion VARCHAR(255),xfecha_nacimiento date,xdni int(11))
BEGIN

declare xid int;
 DECLARE error INTEGER  default 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET error = 1;
DECLARE CONTINUE HANDLER FOR SQLWARNING  SET error = 1;
START TRANSACTION;
IF (xidapoderado=0)
	then
		IF NOT EXISTS (SELECT Apoderado_ID FROM apoderado)
			THEN
				INSERT into apoderado VALUES (
				1,
				xnombre,
				xapellido_paterno,
				xapellido_materno,
        xdireccion,
        xocupacion,
        xfecha_nacimiento,
        xdni,
        1
        );
				select 1 as ins_act_apoderado;
		ELSE
				SET xid = (SELECT MAX(Apoderado_ID) FROM apoderado)+1;
				INSERT into apoderado(
				Apoderado_ID,
				nombre,
			  apellido_paterno,
				apellido_materno,
				direccion,
        ocupacion,
        fecha_nacimiento,
        dni,
				estado
        )
				VALUES (
				xid,
				xnombre,
				xapellido_paterno,
				xapellido_materno,
	      xdireccion,
        xocupacion,
        xfecha_nacimiento,
        xdni,
        1
		    );
				select xid as ins_act_apoderado;
			END if;
ELSE
		UPDATE apoderado SET
			nombre=xnombre,
			apellido_paterno=xapellido_paterno,
      apellido_materno=xapellido_materno,
			direccion=xdireccion,
      ocupacion=xocupacion,
      fecha_nacimiento=xfecha_nacimiento,
      dni=xdni

		WHERE Apoderado_ID=xidapoderado;
	END if;
commit;
if (error=1)
THEN
rollback;
select "Se ha producido un error.";
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `ins_act_cursos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_act_cursos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_act_cursos`(xidcurso int(11),xnombre_curso varchar(255))
BEGIN

declare xid int;
 DECLARE error INTEGER  default 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET error = 1;
DECLARE CONTINUE HANDLER FOR SQLWARNING  SET error = 1;
START TRANSACTION;
IF (xidcurso=0)
	then
		IF NOT EXISTS (SELECT Cursos_ID FROM cursos)
			THEN
				INSERT into cursos VALUES (
				1,
				xnombre_curso,
				1);
				select 1 as ins_act_cursos;
		ELSE
				SET xid = (SELECT MAX(cursos_ID) FROM cursos)+1;
				INSERT into cursos(
				cursos_ID,
				nombre_curso,
				estado)
				VALUES (
				xid,
				xnombre_curso,
				1);
				select xid as ins_act_cursos;
			END if;
ELSE
		UPDATE cursos SET
			nombre_curso=xnombre_curso

		WHERE cursos_ID= xidcurso;
	END if;
commit;
if (error=1)
THEN
rollback;
select "Se ha producido un error.";
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `ins_act_empleado`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_act_empleado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_act_empleado`(xidempleado int(11),xnombre varchar(50),xapellido varchar(50),xdireccion varchar(50),xdni char(8),xfechanacimiento datetime,xestadocivil VARCHAR(15),xusuario VARCHAR(50),xclave VARCHAR(50),xid_perfil int(11),xtelefono VARCHAR(15))
BEGIN

declare xid int;
 DECLARE error INTEGER  default 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET error = 1;
DECLARE CONTINUE HANDLER FOR SQLWARNING  SET error = 1;
START TRANSACTION;
IF (xidempleado=0)
	then
		IF NOT EXISTS (SELECT id_empleado FROM empleado)
			THEN
				INSERT into empleado VALUES (
				1,
				xnombre,
				xapellido,
				xdireccion,
        xdni,
        xfechanacimiento,
        xestadocivil,
        1,
        xusuario,
        xclave,
        xid_perfil,
        xtelefono
        );
				select 1 as ins_act_empleado;
		ELSE
				SET xid = (SELECT MAX(id_empleado) FROM empleado)+1;
				INSERT into empleado(
				id_empleado,
				nombre,
			  apellido,
				direccion,
				dni,
        fechanacimiento,
        estadocivil,
				estado,
        usuario,
        clave,
        id_perfil,
        telefono
        )
				VALUES (
				xid,
				xnombre,
				xapellido,
				xdireccion,
				xdni,
        xfechanacimiento,
        xestadocivil,
				1,
        xusuario,
        xclave,
        xid_perfil,
        xtelefono
		    );
				select xid as ins_act_empleado;
			END if;
ELSE
		UPDATE empleado SET
			nombre=xnombre,
			apellido=xapellido,
			direccion=xdireccion,
			dni=xdni,
      fechanacimiento=xfechanacimiento,
      estadocivil=xestadocivil,
      usuario=xusuario,
      clave=xclave,
      id_perfil=xid_perfil,
      telefono=xtelefono
		WHERE id_empleado=xidempleado;
	END if;
commit;
if (error=1)
THEN
rollback;
select "Se ha producido un error.";
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `ins_act_horario`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_act_horario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_act_horario`(xidhorario int(11),xturno varchar(255),xdia varchar(255),xhora_inicio varchar(255),xhora_fin varchar(255))
BEGIN

declare xid int;
 DECLARE error INTEGER  default 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET error = 1;
DECLARE CONTINUE HANDLER FOR SQLWARNING  SET error = 1;
START TRANSACTION;
IF (xidhorario=0)
	then
		IF NOT EXISTS (SELECT Horario_ID FROM horario)
			THEN
				INSERT into horario VALUES (
				1,
				xturno,
				xdia,
				xhora_inicio,
        xhora_fin,
				1);
				select 1 as ins_act_horario;
		ELSE
				SET xid = (SELECT MAX(Horario_ID) FROM horario)+1;
				INSERT into horario(
				Horario_ID,
				turno,
			  dia,
				hora_inicio,
				hora_fin,
				estado)
				VALUES (
				xid,
				xturno,
				xdia,
				xhora_inicio,
				xhora_fin,
				1);
				select xid as ins_act_horario;
			END if;
ELSE
		UPDATE horario SET
			turno=xturno,
			dia=xdia,
			hora_inicio=xhora_inicio,
			hora_fin=xhora_fin

		WHERE Horario_ID=xidhorario;
	END if;
commit;
if (error=1)
THEN
rollback;
select "Se ha producido un error.";
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `ins_act_institucioneducativa`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_act_institucioneducativa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_act_institucioneducativa`(xidinstitucioneducativa int(11),xnombre varchar(255),xcurricula varchar(255),xtelefono_fijo varchar(255),xdireccion varchar(255))
BEGIN

declare xid int;
 DECLARE error INTEGER  default 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET error = 1;
DECLARE CONTINUE HANDLER FOR SQLWARNING  SET error = 1;
START TRANSACTION;
IF (xidinstitucioneducativa=0)
	then
		IF NOT EXISTS (SELECT Institucioneducativa_ID FROM institucioneducativa)
			THEN
				INSERT into institucioneducativa VALUES (
				1,
				xnombre,
				xcurricula,
				xtelefono_fijo,
        xdireccion,
				1);
				select 1 as ins_act_institucioneducativa;
		ELSE
				SET xid = (SELECT MAX(Institucioneducativa_ID) FROM institucioneducativa)+1;
				INSERT into institucioneducativa(
				Institucioneducativa_ID,
				nombre,
			  curricula,
				telefono_fijo,
				direccion,
				estado)
				VALUES (
				xid,
				xnombre,
				xcurricula,
				xtelefono_fijo,
				xdireccion,
				1);
				select xid as ins_act_institucioneducativa;
			END if;
ELSE
		UPDATE institucioneducativa SET
			nombre=xnombre,
			curricula=xcurricula,
			telefono_fijo=xtelefono_fijo,
			direccion=xdireccion

		WHERE Institucioneducativa_ID=xidinstitucioneducativa;
	END if;
commit;
if (error=1)
THEN
rollback;
select "Se ha producido un error.";
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_inserta_actualiza_modulos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_inserta_actualiza_modulos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_inserta_actualiza_modulos`(xidmodulo int, xdescripcion varchar(100), xurl varchar(200), xestado smallint(6), xidmodulo_padre int)
BEGIN
	#Routine body goes here...
declare 
	xid int;
IF (xidmodulo=0)
	THEN
		IF NOT EXISTS (SELECT idmodulo FROM modulos)
			THEN
				INSERT into modulos VALUES (
				1,
				xdescripcion,
				xurl,
				xestado,
				xidmodulo_padre);
		ELSE
				SET xid= (SELECT MAX(idmodulo) FROM modulos)+1;
				INSERT into modulos(
				idmodulo,
				descripcion,
				url,
				estado,
				idmodulo_padre)
				VALUES (
				xid,
				xdescripcion,
				xurl,
				xestado,
				xidmodulo_padre);
			END if;
ELSE
		UPDATE modulos SET 
			descripcion=xdescripcion,
			url=xurl,
			estado=xestado,
			idmodulo_padre= xidmodulo_padre
		WHERE idmodulo=xidmodulo;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_inserta_actualiza_permisos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_inserta_actualiza_permisos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_inserta_actualiza_permisos`(xid_perfil int, xidmodulo int, xestado smallint(6))
BEGIN
	#Routine body goes here...
declare 
	xid integer;
IF NOT EXISTS (select * from permisos where id_perfil=xid_perfil and idmodulo=xidmodulo)
		THEN
		INSERT into permisos(id_perfil, idmodulo, estado) VALUES(xid_perfil,xidmodulo,xestado);	
	ELSE
		UPDATE permisos SET 
				estado=xestado
		WHERE id_perfil=xid_perfil and idmodulo=xidmodulo;
		END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_selecciona_login`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_login`(xusuario varchar(50),xclave varchar(50))
BEGIN
	#Routine body goes here...
IF (xclave=''  )
	THEN

		SELECT *, ''  FROM empleado WHERE usuario=xusuario;

		ELSE

		SELECT e.*, p.descripcion FROM empleado as e inner join perfil as p on e.id_perfil=p.id_perfil
		WHERE e.usuario=xusuario AND e.clave = xclave;

	END if;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_selecciona_modulos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_modulos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_modulos`(xid   int, xdescripcion   varchar(50),xmodulo_padre   varchar(50), xidperfil int)
BEGIN
IF (xid = 0 and xdescripcion='' and xmodulo_padre='')
THEN
	SELECT M.* , P.descripcion as 'modulo_padre' FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
	WHERE M.idmodulo<>0 and m.estado<>0;
END IF;
IF (xid = 0 and xdescripcion<>'' and xmodulo_padre='')
	THEN
	SELECT	M.* , P.descripcion as 'modulo_padre' FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
	WHERE M.idmodulo<>0 and M.descripcion LIKE CONCAT('%',xdescripcion,'%') and m.estado<>0;
	END IF;

IF (xid = 0 and xdescripcion='' and xmodulo_padre<>'')
	THEN
	SELECT	M.* , P.descripcion as 'modulo_padre' FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
	WHERE M.idmodulo<>0 and P.descripcion LIKE CONCAT('%',xmodulo_padre,'%') and m.estado<>0;
	END IF;

IF(xid=9999 and xdescripcion='' and xmodulo_padre='')
	THEN
		select m.idmodulo, m.descripcion, m.url as m_url, m.estado, m.idmodulo_padre, m.descripcion xmodulos, mo.descripcion modulos_hijos, mo.url url,
		mo.descripcion modulo_padre
		from modulos as m inner join modulos as mo on(m.idmodulo=mo.idmodulo_padre)
		inner join permisos as per on  (per.idmodulo=mo.idmodulo)
		where m.idmodulo<>0 and per.id_perfil=xidperfil and per.estado=1 and m.estado=1 and mo.estado=1
		order by m.idmodulo;
ELSE
		IF EXISTS(SELECT * FROM modulos WHERE idmodulo=xid)
			THEN
				SELECT M.* , P.descripcion as 'modulo_padre' FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
				WHERE M.idmodulo=xid AND M.idmodulo<>0 and m.estado<>0;
		ELSE
				SELECT('Este código de módulo no existe en la base de datos.');
			END IF;
		END IF;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_selecciona_modulos_p`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_modulos_p`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_modulos_p`(xid int)
BEGIN
	#Routine body goes here...
IF (xid = 0)
THEN
	SELECT * FROM modulos WHERE idmodulo_padre = 0;

ELSE
IF EXISTS(SELECT * FROM modulos WHERE idmodulo=xid)
then

	SELECT * FROM modulos WHERE idmodulo_padre = 0 AND idmodulo=xid;

		ELSE
			SELECT('NO EXISTE ID EN LA BASE DE DATOS');
			
			END if;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_selecciona_perfil`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_perfil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_perfil`(xid int, xdescripcion varchar(50))
BEGIN
	#Routine body goes here...
IF (xid = 0 and xdescripcion = '')
		THEN 
	
		SELECT * FROM perfil
		where id_perfil<>0 and estado<>0;
	
	END if;
IF (xid = 0 and xdescripcion <> '')
		THEN 
	
		SELECT * FROM perfil
		where id_perfil<>0 and cast(upper(xdescripcion) as char) LIKE concat('%',xdescripcion,'%') and estado<>0;
	
	END if;
IF (xid <> 0 and xdescripcion = '')
		THEN 
		IF EXISTS(SELECT * FROM perfil WHERE id_perfil=xid)
				THEN 
	 
				SELECT * FROM perfil WHERE id_perfil=xid and estado<>0;
		
		ELSE
			SELECT('NO EXISTE EL ID EN LA BASE DE DATOS');
		
			END if;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pa_selecciona_permisos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_permisos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_permisos`(xid_perfil int,xidmodulo int)
BEGIN
	#Routine body goes here...
IF (xid_perfil = 0 AND xidmodulo=0)
		THEN 
	 
		SELECT p.*, per.descripcion, m.descripcion
		FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo);
	END if;
IF (xid_perfil <> 0 AND xidmodulo=0)
		THEN 
	 
				SELECT p.*,per.descripcion, m.descripcion 
				FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo)
						WHERE p.id_perfil=xid_perfil AND p.estado=1;	
		
		ELSE
		IF EXISTS(SELECT permisos.* FROM permisos WHERE permisos.id_perfil=xid_perfil AND permisos.idmodulo=xidmodulo)
				THEN 
	 
				SELECT p.*, per.descripcion, m.descripcion
		FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo)
						WHERE p.id_perfil=xid_perfil AND p.idmodulo=xidmodulo;
		
		ELSE
			SELECT( 'NO EXISTE EL ID EN LA BASE DE DATOS');
		
			END if;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `selmoduoloxurl`
-- ----------------------------
DROP PROCEDURE IF EXISTS `selmoduoloxurl`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selmoduoloxurl`(p_url varchar(200))
BEGIN
			SELECT * FROM modulos where url=p_url and estado = 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_alumno`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_alumno`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_alumno`(xid int,xnombres varchar(60),xdni varchar(12))
BEGIN
	#Routine body goes here...
IF (xid = 0 and xnombres='' and xdni ='')
	THEN
SELECT a.* , date_format(a.fecha_nacimiento,'%d-%m-%Y') as 'fecha_nacimiento', u.descripcion as'ubigeo' , ie.nombre as 'institucion',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idregion',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'region',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idprovincia',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'provincia'
    FROM alumno as a inner join ubigeo as u on(a.ubigeo_ID=u.Ubigeo_ID)
						inner join institucioneducativa as ie on(a.Institucioneducativa_ID=ie.Institucioneducativa_ID)
		where a.Alumno_ID<>0 and a.estado=1
		order by a.Alumno_ID desc;
	END if;

IF (xid <>0 and xnombres='' and xdni ='')
	THEN
		IF EXISTS(SELECT alumno.* FROM alumno WHERE alumno.Alumno_ID=xid)
			THEN
	SELECT a.* , date_format(a.fecha_nacimiento,'%d-%m-%Y') as 'fecha_nacimiento', u.descripcion as'ubigeo' , ie.nombre as 'institucion',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idregion',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'region',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idprovincia',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'provincia'
    FROM alumno as a inner join ubigeo as u on(a.ubigeo_ID=u.Ubigeo_ID)
						inner join institucioneducativa as ie on(a.Institucioneducativa_ID=ie.Institucioneducativa_ID)
		where a.Alumno_ID=xid and a.estado=1
		order by a.Alumno_ID desc;
		ELSE
			select('NO EXISTE ID EN LA BASE DE DATOS');
			END if;
	END if;


IF (xid = 0 and xnombres <>'' and xdni ='')
	THEN
 SELECT a.* , date_format(a.fecha_nacimiento,'%d-%m-%Y') as 'fecha_nacimiento', u.descripcion as'ubigeo' , ie.nombre as 'institucion',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idregion',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'region',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idprovincia',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'provincia'	
    FROM alumno as a inner join ubigeo as u on(a.ubigeo_ID=u.Ubigeo_ID)
						inner join institucioneducativa as ie on(a.Institucioneducativa_ID=ie.Institucioneducativa_ID)
		WHERE a.Alumno_ID <>0 and (a.nombre like concat('%',xnombres,'%') or a.apellido_paterno like concat('%',xnombres,'%') OR a.apellido_materno like concat('%',xnombres,'%') ) and a.estado=1
		order by a.Alumno_ID desc;

end if;



IF (xid = 0 and xnombres='' and xdni <>'')
THEN

SELECT a.* , date_format(a.fecha_nacimiento,'%d-%m-%Y') as 'fecha_nacimiento', u.descripcion as'ubigeo' , ie.nombre as 'institucion',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idregion',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region) as 'region',
	(Select ubigeo.Ubigeo_ID FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'idprovincia',
	(Select ubigeo.descripcion FROM ubigeo WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region) as 'provincia'
		
    FROM alumno as a inner join ubigeo as u on(a.ubigeo_ID=u.Ubigeo_ID)
						inner join institucioneducativa as ie on(a.Institucioneducativa_ID=ie.Institucioneducativa_ID)
		where a.Alumno_ID<>0 and c.dni like concat('%',xdni,'%')  and  a.estado=1
		order by a.Alumno_ID desc;

end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_apoderado`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_apoderado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_apoderado`(p_id_apoderado int, p_nombre varchar(255),p_apellido_paterno VARCHAR(255),p_apellido_materno VARCHAR(255))
BEGIN
	IF (p_id_apoderado = 0 AND p_nombre = '' AND p_apellido_paterno='' AND p_apellido_materno='' )
	THEN
			SELECT * FROM apoderado where  Apoderado_ID<>0 AND estado = 1;
END if;
IF (p_id_apoderado = 0 AND p_nombre  <> '' AND p_apellido_paterno='' AND p_apellido_materno='' )
	THEN
		SELECT * FROM apoderado where Apoderado_ID<>0 and estado = 1 and nombre  LIKE CONCAT('%',p_nombre,'%');
END if;
IF (p_id_apoderado = 0 AND p_nombre='' AND p_apellido_paterno<>'' AND p_apellido_materno='' )
	THEN
		SELECT * FROM apoderado where Apoderado_ID<>0 and estado = 1 and apellido_paterno  LIKE CONCAT('%',p_apellido_paterno,'%');
END if;
IF (p_id_apoderado = 0 AND p_nombre  <> '' AND p_apellido_paterno='' AND p_apellido_materno<>'' )
	THEN
		SELECT * FROM apoderado where Apoderado_ID<>0 and estado = 1 and apellido_materno  LIKE CONCAT('%',p_apellido_materno,'%');
END if;
IF (p_id_apoderado <> 0 AND p_nombre ='' AND p_apellido_paterno='' AND p_apellido_materno = '' )
	THEN
		SELECT * FROM apoderado where Apoderado_ID<>0 and estado = 1 and Apoderado_ID = p_id_apoderado;
END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_cursos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_cursos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_cursos`(p_id_cursos int, p_nombre_curso varchar(50))
BEGIN
	IF (p_id_cursos = 0 AND p_nombre_curso= '')
	THEN
			SELECT * FROM cursos where  Cursos_ID<>0 AND estado = 1;
END if;
IF (p_id_cursos = 0 AND p_nombre_curso <> '')
	THEN
		SELECT * FROM cursos where Cursos_ID<>0 and estado = 1 and nombre_curso  LIKE CONCAT('%',p_nombre_curso,'%');
END if;
IF (p_id_cursos <> 0 AND p_nombre_curso ='')
	THEN
		SELECT * FROM cursos where Cursos_ID<>0 and estado = 1 and Cursos_ID = p_id_cursos;
END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_empleado`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_empleado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_empleado`(p_id_empleado int,p_nombre varchar(50),p_apellido varchar(50),p_usuario varchar(50),p_perfil varchar(50))
BEGIN
	#Routine body goes here...
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '')
	THEN

		SELECT e.*,p.descripcion as pperfil
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil
		WHERE e.estado = 1 and p.estado = 1;

END if;
IF (p_id_empleado = 0 AND p_nombre <> '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '')
	THEN

		SELECT e.*,p.descripcion as pperfil
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil
		WHERE e.estado = 1 and p.estado = 1 and e.nombre LIKE concat('%',p_nombre,'%');

END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido <> '' AND p_usuario = '' AND p_perfil = '')
	THEN

		SELECT e.*,p.descripcion as pperfil
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil
		WHERE e.estado = 1 and p.estado = 1 and e.apellido LIKE concat('%',p_apellido,'%');

END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario <> '' AND p_perfil = '')
	THEN

		SELECT e.*,p.descripcion as pperfil
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil
		WHERE e.estado = 1 and p.estado = 1 and e.usuario LIKE concat('%',p_usuario,'%');

END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil <> '')
	THEN

		SELECT e.*,p.descripcion as pperfil
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil
		WHERE e.estado = 1 and p.estado = 1 and p.descripcion LIKE concat('%',p_perfil,'%');

END if;
IF (p_id_empleado <> 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '')
	THEN

		SELECT e.*,p.descripcion as pperfil
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil
		WHERE e.estado = 1 and p.estado = 1 and e.id_empleado = p_id_empleado;

END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_horario`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_horario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_horario`(p_id_horario int, p_turno varchar(50))
BEGIN
	IF (p_id_horario = 0 AND p_turno= '')
	THEN
			SELECT * FROM horario where  Horario_ID<>0 AND estado = 1;
END if;
IF (p_id_horario = 0 AND p_turno <> '')
	THEN
		SELECT * FROM horario where Horario_ID<>0 and estado = 1 and turno  LIKE CONCAT('%',p_turno,'%');
END if;
IF (p_id_horario <> 0 AND p_turno ='')
	THEN
		SELECT * FROM horario where Horario_ID<>0 and estado = 1 and Horario_ID = p_id_horario;
END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_institucioneducativa`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_institucioneducativa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_institucioneducativa`(p_id_institucioneducativa int, p_nombre varchar(50))
BEGIN
	IF (p_id_institucioneducativa = 0 AND p_nombre= '')
	THEN
			SELECT * FROM institucioneducativa where  Institucioneducativa_ID <>0 AND estado = 1;
END if;
IF (p_id_institucioneducativa = 0 AND p_nombre <> '')
	THEN
		SELECT * FROM institucioneducativa where Institucioneducativa_ID<>0 and estado = 1 and nombre  LIKE CONCAT('%',p_nombre,'%');
END if;
IF (p_id_institucioneducativa <> 0 AND p_nombre ='')
	THEN
		SELECT * FROM institucioneducativa where Institucioneducativa_ID<>0 and estado = 1 and Institucioneducativa_ID = p_id_institucioneducativa;
END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_provincia`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_provincia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_provincia`(xid int, xidregion int)
BEGIN
	#Routine body goes here...
declare xcod_region varchar(50);
IF (xid = 0)
	then
		SET xcod_region =(select ubigeo.codigo_region from ubigeo where ubigeo.ubigeo_ID=xidregion);
		SELECT * FROM ubigeo
		where ubigeo.codigo_region=xcod_region and ubigeo.codigo_provincia<>'00' and ubigeo.codigo_distrito='00';
ELSE
		IF EXISTS(SELECT ubigeo.* FROM ubigeo WHERE ubigeo.ubigeo_ID=xid)
			then
				SELECT ubigeo.* FROM ubigeo WHERE ubigeo.ubigeo_ID=xid;
		ELSE
			SELECT('NO EXISTE ID EN LA BASE DE DATOS');
			END if;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_region`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_region`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_region`(xid int, xidpais int)
BEGIN
	#Routine body goes here...
IF (xid = 0)
		THEN
		SELECT u.* FROM ubigeo as  u inner join paises   as p on(u.idpais=p.idpais)
		where u.idpais=xidpais and u.codigo_provincia='00' and u.codigo_distrito='00';
		ELSE
		IF EXISTS(SELECT ubigeo.* FROM ubigeo WHERE ubigeo.ubigeo_ID=xid)
				THEN
				SELECT ubigeo.* FROM ubigeo WHERE ubigeo.ubigeo_ID=xid;
		ELSE
			SELECT('NO EXISTE ID EN LA BASE DE DATOS');
			END if;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sel_ubigeo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_ubigeo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_ubigeo`(xid int,xidprovincia int, xidpais int)
BEGIN
	#Routine body goes here...
declare
	xcod_provincia VARCHAR(50);
DECLARE xcod_region VARCHAR(50);
DECLARE xpais VARCHAR(50);
IF (xid = 0)
		THEN
	if(xidpais=0)
		THEN
	set xpais ='Perú';
	SET xcod_provincia =(select ubigeo.codigo_provincia from ubigeo where ubigeo.Ubigeo_ID=xidprovincia);
	SET xcod_region =(select ubigeo.codigo_region from ubigeo where ubigeo.Ubigeo_ID=xidprovincia);

		SELECT ubigeo.*, xpais FROM ubigeo
		where ubigeo.codigo_provincia=xcod_provincia
		and xcod_region=ubigeo.codigo_region and ubigeo.codigo_distrito<>'0' and ubigeo.codigo_distrito<>'0' and ubigeo.codigo_region<>'0' and
		ubigeo.Ubigeo_ID<>0;

		ELSE
	SET xpais =(select paises.descripcion from paises where paises.idpais=xidpais);

		SELECT u.*, p.descripcion from ubigeo  as u inner join paises  as p on(u.idpais=p.idpais)
		where u.idpais=xidpais;

	end if;
		ELSE
		IF EXISTS(SELECT ubigeo.* FROM ubigeo WHERE ubigeo.Ubigeo_ID=xid)
				THEN
					 SET xpais ='Perú';

				SELECT ubigeo.*, xpais FROM ubigeo WHERE ubigeo.Ubigeo_ID=xid;

		ELSE
			SELECT('ESTE ID NO EXISTE EN LA BASE DE DATOS');
						END if;
	END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `valida_acceso`
-- ----------------------------
DROP PROCEDURE IF EXISTS `valida_acceso`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_acceso`(xid_perfil int,xmodulo varchar(200))
BEGIN
	#Routine body goes here...
SELECT p.*, per.descripcion, m.descripcion
FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
	inner join modulos as m on(p.idmodulo=m.idmodulo)
	WHERE p.id_perfil=xid_perfil AND m.url=xmodulo AND m.estado = 1 and p.estado=1;
END
;;
DELIMITER ;

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : empresa

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2013-11-06 12:57:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `empleado`
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id_empleado` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  UNIQUE KEY `id_empleado` (`id_empleado`),
  KEY `fk_perfil_empleado` (`id_perfil`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'EVER', 'CARLOS ROJAS', 'JR. TOMAS VILLACORTA 125', '46792643', '2012-01-27', 'SOLTERO(A)', '1', 'EVER', 'ROJAS', '1', '990403531');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES ('0', 'MODULO PADRE', '#', '0', '0');
INSERT INTO `modulos` VALUES ('1', 'SEGURIDAD', '#', '1', '0');
INSERT INTO `modulos` VALUES ('3', 'MODULOS', 'MODULOS', '1', '1');
INSERT INTO `modulos` VALUES ('4', 'PERMISOS', 'PERMISOS', '1', '1');
INSERT INTO `modulos` VALUES ('5', 'PERFIL', 'PERFILES', '1', '1');

-- ----------------------------
-- Table structure for `pasajero`
-- ----------------------------
DROP TABLE IF EXISTS `pasajero`;
CREATE TABLE `pasajero` (
  `idpasajero` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_doc` int(11) NOT NULL,
  `nrodocumento` int(11) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`idpasajero`),
  KEY `fk_pasajero_tipo_documento1` (`idtipo_doc`) USING BTREE,
  CONSTRAINT `fk_pasajero_tipo_documento1` FOREIGN KEY (`idtipo_doc`) REFERENCES `tipo_documento` (`idtipo_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=910 COMMENT='InnoDB free: 11264 kB; (`idtipo_doc`) REFER `bdgilmer/tipo_d';

-- ----------------------------
-- Records of pasajero
-- ----------------------------

-- ----------------------------
-- Table structure for `perfil`
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('2', 'Cajero', '0');
INSERT INTO `perfil` VALUES ('3', 'Cajero', '0');
INSERT INTO `perfil` VALUES ('1', 'ADMINISTRADOR', '1');
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES ('1', '0', '1');
INSERT INTO `permisos` VALUES ('1', '1', '1');
INSERT INTO `permisos` VALUES ('1', '2', '1');
INSERT INTO `permisos` VALUES ('1', '3', '1');
INSERT INTO `permisos` VALUES ('1', '4', '1');
INSERT INTO `permisos` VALUES ('1', '5', '1');

-- ----------------------------
-- Table structure for `tipo_documento`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `idtipo_doc` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtipo_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 COMMENT='LE, DNI, etc.; InnoDB free: 11264 kB';

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------

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

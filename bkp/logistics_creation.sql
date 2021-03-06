-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2021 a las 23:14:17
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `logistics_creation`
--
CREATE DATABASE IF NOT EXISTS `logistics_creation` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `logistics_creation`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE IF NOT EXISTS `puestos` (
  `Id_Puesto` int(10) NOT NULL,
  `Empresa` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 1, NULL, NULL, NULL),
(2, 'Supervisor', 1, NULL, NULL, NULL),
(3, 'Vigilante', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_estado`
--

CREATE TABLE IF NOT EXISTS `tipo_de_estado` (
  `Id_Estado` int(10) NOT NULL,
  `Tipo_de_Estado` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_de_estado`
--

INSERT INTO `tipo_de_estado` (`Id_Estado`, `Tipo_de_Estado`) VALUES
(1, 'Activo'),
(2, 'En vacaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE IF NOT EXISTS `turnos` (
  `Id_Turno` int(10) NOT NULL,
  `Hora_Inicio` time DEFAULT NULL,
  `Hora_Fin` time DEFAULT NULL,
  PRIMARY KEY (`Id_Turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `CC` int(10) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Id_Tipo` int(10) DEFAULT NULL,
  `Id_Estado` int(10) DEFAULT NULL,
  `rol` int(11) NOT NULL DEFAULT 3,
  PRIMARY KEY (`CC`),
  KEY `Id_Tipo` (`Id_Tipo`),
  KEY `Id_Estado` (`Id_Estado`),
  KEY `usuario_ibfk_3` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=78947284 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CC`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`, `Contrasena`, `Fecha_Ingreso`, `Id_Tipo`, `Id_Estado`, `rol`) VALUES
(546465, 'Maria Alejandra', 'Londoño', '', '', 'alejandra@alejandra.com', '4321', NULL, NULL, 1, 3),
(4756654, 'Jorge', 'Cock', '', '', 'jorge@jorge.com', '12345', NULL, NULL, 1, 2),
(78947283, 'Rubiela', 'Castano', '', '', 'rubiela@rubiela.com', '1234', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_puesto_turno`
--

CREATE TABLE IF NOT EXISTS `usuario_puesto_turno` (
  `Fecha` date DEFAULT NULL,
  `CC` int(10) DEFAULT NULL,
  `Id_Puesto` int(10) DEFAULT NULL,
  `Id_Turno` int(10) DEFAULT NULL,
  KEY `CC` (`CC`),
  KEY `Id_Puesto` (`Id_Puesto`),
  KEY `Id_Turno` (`Id_Turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`Id_Estado`) REFERENCES `tipo_de_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_puesto_turno`
--
ALTER TABLE `usuario_puesto_turno`
  ADD CONSTRAINT `usuario_puesto_turno_ibfk_1` FOREIGN KEY (`CC`) REFERENCES `usuario` (`CC`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_puesto_turno_ibfk_2` FOREIGN KEY (`Id_Puesto`) REFERENCES `puestos` (`Id_Puesto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_puesto_turno_ibfk_3` FOREIGN KEY (`Id_Turno`) REFERENCES `turnos` (`Id_Turno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

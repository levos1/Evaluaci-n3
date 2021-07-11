-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-07-2021 a las 02:23:06
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apuntesv2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apunte`
--

DROP TABLE IF EXISTS `apunte`;
CREATE TABLE IF NOT EXISTS `apunte` (
  `id` int NOT NULL,
  `contenido_id` int DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tipoApunte` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contenido_apunte` (`contenido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `apunte`
--

INSERT INTO `apunte` (`id`, `contenido_id`, `nombre`, `url`, `fecha_creacion`, `fecha_actualizacion`, `tipoApunte`) VALUES
(1, 5, 'apunte1', 'https://preview.redd.it/7s6dpd15yv271.jpg?auto=webp&s=29e321668379877c0f9ae9cfd510190e609b177e', '2021-06-07 21:25:32', '2021-06-08 01:25:32', 'IMAGEN'),
(9, 5, 'apunte9', 'https://raw.githubusercontent.com/levos1/evaluacion-2/main/pruebatxt.txt', NULL, NULL, 'TEXTO'),
(10, 5, 'apunte10', 'https://preview.redd.it/7s6dpd15yv271.jpg?auto=webp&s=29e321668379877c0f9ae9cfd510190e609b177e', '2021-06-07 21:35:36', '2021-06-07 21:53:07', 'IMAGEN'),
(11, 5, 'apunte11', 'https://preview.redd.it/7s6dpd15yv271.jpg?auto=webp&s=29e321668379877c0f9ae9cfd510190e609b177e', '2021-06-08 01:53:33', '2021-06-08 01:53:33', 'IMAGEN'),
(12, 5, 'apunte12', 'https://i.redd.it/zg97tal1u4y51.jpg', '2021-07-05 11:07:27', '2021-07-05 11:07:27', 'IMAGEN'),
(13, 5, 'apunte13', 'https://i.pinimg.com/736x/fb/a6/2d/fba62dee7fcaa30c1d1e07d5bbdb2020.jpg', '2021-07-05 11:08:45', '2021-07-05 11:08:45', 'IMAGEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

DROP TABLE IF EXISTS `contenido`;
CREATE TABLE IF NOT EXISTS `contenido` (
  `id` int NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_contenido` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`id`, `nombre`, `descripcion`, `fecha_creacion`, `fecha_actualizacion`, `user_id`) VALUES
(5, 'contenido5', 'asfafsf', '2021-06-07 21:56:22', '2021-06-07 22:17:01', 1),
(6, 'apuntedeprueba', 'asfag', '2021-06-08 01:41:01', '2021-06-08 01:41:01', 1),
(7, 'contenido7', 'asasfasfafa', '2021-06-08 01:49:26', '2021-06-08 01:49:26', 1),
(8, 'contenido8', 'asfjasfajhf', '2021-06-08 01:58:28', '2021-06-08 02:07:12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `tipo_id` int NOT NULL AUTO_INCREMENT,
  `apunte_id` int NOT NULL,
  `tipoApunte` varchar(10) NOT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`tipo_id`, `apunte_id`, `tipoApunte`) VALUES
(1, 1, 'IMAGEN'),
(2, 1, 'IMAGEN'),
(3, 1, 'TEXTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`user_id`, `user_name`, `password`) VALUES
(1, 'omniman', 'thinkmarkthink!');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apunte`
--
ALTER TABLE `apunte`
  ADD CONSTRAINT `contenido_apunte` FOREIGN KEY (`contenido_id`) REFERENCES `contenido` (`id`);

--
-- Filtros para la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD CONSTRAINT `user_contenido` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

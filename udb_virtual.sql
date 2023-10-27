-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2023 a las 05:10:48
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `udb_virtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumno` int(11) NOT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `carnet` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `becario` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `UV` int(11) NOT NULL,
  `codigo` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `idNota` int(11) NOT NULL,
  `idRegistroMateria` int(11) NOT NULL,
  `idTipoEvaluacion` int(11) NOT NULL,
  `nota` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registromaterias`
--

CREATE TABLE `registromaterias` (
  `idRegistro` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `ciclo` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoevaluacion`
--

CREATE TABLE `tipoevaluacion` (
  `idTipoEvaluacion` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumno`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`idNota`),
  ADD KEY `notas_registromaterias_idRegistro_fk` (`idRegistroMateria`),
  ADD KEY `notas_tipoevaluacion_idTipoEvaluacion_fk` (`idTipoEvaluacion`);

--
-- Indices de la tabla `registromaterias`
--
ALTER TABLE `registromaterias`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `registromaterias_alumnos_idAlumno_fk` (`idAlumno`),
  ADD KEY `registromaterias_materias_idMateria_fk` (`idMateria`);

--
-- Indices de la tabla `tipoevaluacion`
--
ALTER TABLE `tipoevaluacion`
  ADD PRIMARY KEY (`idTipoEvaluacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `idNota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registromaterias`
--
ALTER TABLE `registromaterias`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoevaluacion`
--
ALTER TABLE `tipoevaluacion`
  MODIFY `idTipoEvaluacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_registromaterias_idRegistro_fk` FOREIGN KEY (`idRegistroMateria`) REFERENCES `registromaterias` (`idRegistro`),
  ADD CONSTRAINT `notas_tipoevaluacion_idTipoEvaluacion_fk` FOREIGN KEY (`idTipoEvaluacion`) REFERENCES `tipoevaluacion` (`idTipoEvaluacion`);

--
-- Filtros para la tabla `registromaterias`
--
ALTER TABLE `registromaterias`
  ADD CONSTRAINT `registromaterias_alumnos_idAlumno_fk` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`idAlumno`),
  ADD CONSTRAINT `registromaterias_materias_idMateria_fk` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2023 a las 08:23:16
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fotografo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id_abono` int(11) NOT NULL,
  `F_abono` date NOT NULL,
  `monto` double(5,2) NOT NULL,
  `M_restante` double(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atiende`
--

CREATE TABLE `atiende` (
  `N_evento` varchar(64) NOT NULL,
  `N_empleado` varchar(128) NOT NULL,
  `F_trabajo` date NOT NULL,
  `P_atiende` double(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `N_clientes` varchar(128) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edita`
--

CREATE TABLE `edita` (
  `N_evento` varchar(64) NOT NULL,
  `N_empleado` varchar(128) NOT NULL,
  `F_inicio` date NOT NULL,
  `F_fin` date NOT NULL,
  `T_edicion` varchar(64) NOT NULL,
  `P_edicion` double(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `N_empleado` varchar(128) NOT NULL,
  `T_empleado` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `N_eventos` varchar(64) NOT NULL,
  `T_eventos` varchar(64) NOT NULL,
  `F_contratacion` date NOT NULL,
  `F_evento` date NOT NULL,
  `F_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `N_lugar` varchar(128) NOT NULL,
  `E_lugar` varchar(64) NOT NULL,
  `D_lugar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `N_paquete` varchar(128) NOT NULL,
  `precio` double(5,2) DEFAULT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `se_contrata`
--

CREATE TABLE `se_contrata` (
  `N_evento` varchar(64) NOT NULL,
  `N_paquete` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `se_da_en`
--

CREATE TABLE `se_da_en` (
  `N_evento` varchar(64) NOT NULL,
  `N_lugar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `nombre` varchar(128) NOT NULL,
  `correo` varchar(64) NOT NULL,
  `contraseña` varchar(64) NOT NULL,
  `rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `correo`, `contraseña`, `rol`) VALUES
('Hector Garcia', 'admin@admin.com', '$2y$10$FN6o6wdhKZkTVxRc1kZiXuLlyUupA5h/DAIUwc/Wl7gi6IyGdIc96', 1),
('David Garcia', 'user@user.com', '$2y$10$9OQ3q5GS5tpYtoGCnvOYV.vsm83uPXkGWumyENE3HWpAJ8drTlB6a', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id_abono`);

--
-- Indices de la tabla `atiende`
--
ALTER TABLE `atiende`
  ADD KEY `N_evento` (`N_evento`),
  ADD KEY `N_empleado` (`N_empleado`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`N_clientes`);

--
-- Indices de la tabla `edita`
--
ALTER TABLE `edita`
  ADD KEY `N_evento` (`N_evento`),
  ADD KEY `N_empleado` (`N_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`N_empleado`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`N_eventos`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`N_lugar`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`N_paquete`);

--
-- Indices de la tabla `se_contrata`
--
ALTER TABLE `se_contrata`
  ADD KEY `N_evento` (`N_evento`),
  ADD KEY `N_paquete` (`N_paquete`);

--
-- Indices de la tabla `se_da_en`
--
ALTER TABLE `se_da_en`
  ADD KEY `N_evento` (`N_evento`),
  ADD KEY `N_lugar` (`N_lugar`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atiende`
--
ALTER TABLE `atiende`
  ADD CONSTRAINT `atiende_ibfk_1` FOREIGN KEY (`N_evento`) REFERENCES `eventos` (`N_eventos`),
  ADD CONSTRAINT `atiende_ibfk_2` FOREIGN KEY (`N_empleado`) REFERENCES `empleados` (`N_empleado`);

--
-- Filtros para la tabla `edita`
--
ALTER TABLE `edita`
  ADD CONSTRAINT `edita_ibfk_1` FOREIGN KEY (`N_evento`) REFERENCES `eventos` (`N_eventos`),
  ADD CONSTRAINT `edita_ibfk_2` FOREIGN KEY (`N_empleado`) REFERENCES `empleados` (`N_empleado`);

--
-- Filtros para la tabla `se_contrata`
--
ALTER TABLE `se_contrata`
  ADD CONSTRAINT `se_contrata_ibfk_1` FOREIGN KEY (`N_evento`) REFERENCES `eventos` (`N_eventos`),
  ADD CONSTRAINT `se_contrata_ibfk_2` FOREIGN KEY (`N_paquete`) REFERENCES `paquetes` (`N_paquete`);

--
-- Filtros para la tabla `se_da_en`
--
ALTER TABLE `se_da_en`
  ADD CONSTRAINT `se_da_en_ibfk_1` FOREIGN KEY (`N_evento`) REFERENCES `eventos` (`N_eventos`),
  ADD CONSTRAINT `se_da_en_ibfk_2` FOREIGN KEY (`N_lugar`) REFERENCES `lugares` (`N_lugar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

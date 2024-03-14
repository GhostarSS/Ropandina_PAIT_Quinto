-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-03-2024 a las 00:01:01
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intellig_eropandina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(7, 'MUJER', '20240307234441.jpg', 1),
(8, 'HOMBRE', '20240307234450.jpg', 1),
(9, 'NIÑO', '20240307234501.jpg', 1),
(10, 'Accesorios', '20240313224754.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `whatsapp` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `host_smtp` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_smtp` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pass_smtp` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `puerto_smtp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `whatsapp`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'ROPANDINA', '0979376777', 'ropandina.shop@intelligent-clothes.com', '593979376777', 'Quito,Ecuador', 'smtp.gmail.com', 'adictusjuegaxdyt@gmail.com', '', 465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_producto` int NOT NULL,
  `id_venta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `cantidad`, `precio`, `producto`, `id_producto`, `id_venta`) VALUES
(2, 1, 1.00, 'Reloj Negro', 9, 2),
(3, 1, 1.00, 'Reloj Negro', 9, 3),
(4, 1, 1.00, 'Reloj Negro', 9, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `ventas` int NOT NULL DEFAULT '0',
  `imagen` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(8, 'Vestido Verde', 'Vestido Verde De noche Talla X', 10.00, 49, 1, '20240307234523.jpg', 1, 7),
(9, 'Reloj Negro', '', 1.00, 7, 3, '20240313225206.jpg', 1, 10),
(10, 'Camisa Mujer', 'Todas las Tallas', 15.00, 50, 0, '20240313225154.jpg', 1, 7),
(11, 'Camisa Negra', 'Talla X Hasta L', 20.00, 10, 0, '20240313225146.jpg', 1, 8),
(12, 'Chompa', 'Chompa con todas las tallas', 30.00, 50, 0, '20240313225134.jpg', 1, 8),
(13, 'Pantalon Blanco', 'Solo Talla L', 15.00, 50, 0, '20240313225127.jpg', 1, 8),
(14, 'Pantalon Blanco', 'Todas las tallas', 15.00, 0, 0, '20240313225120.jpg', 1, 7),
(15, 'Vestido Largo Rojo', 'Todas las tallas', 20.00, 0, 0, '20240313225109.jpg', 1, 7),
(16, 'Pantalon Rosado', 'Todas las Tallas', 10.00, 0, 0, '20240313225101.jpg', 1, 7),
(17, 'Vestido Azul', 'Todas las Tallas', 20.00, 20, 0, '20240313225051.jpg', 1, 7),
(18, 'Buso Negro', 'Todas las tallas', 15.00, 0, 0, '20240313225038.jpg', 1, 8),
(19, 'Pantalon Naranja', 'Todas las tallas', 10.00, 15, 0, '20240313225030.jpg', 1, 8),
(20, 'Pantalon Beige', 'Todas las tallas', 10.00, 20, 0, '20240313224854.jpg', 1, 8),
(21, 'Pantalon Gris', 'Todas las tallas', 30.00, 20, 0, '20240313224819.jpg', 1, 8),
(22, 'Camisa Para Niño', 'Camisa Roja', 5.00, 50, 0, '20240313230150.jpg', 1, 9),
(23, 'Chompa azul', '', 20.00, 10, 0, '20240313230429.jpg', 1, 9),
(24, 'Chompa Grande Azul', '', 20.00, 50, 0, '20240313230456.jpg', 1, 9),
(25, 'Collar', '', 70.00, 5, 0, '20240313230625.jpg', 1, 10),
(26, 'Gajas Azules', '', 50.00, 10, 0, '20240313232846.jpg', 1, 10),
(27, 'Collar de Perlas', '', 1000.00, 10, 0, '20240313233012.jpg', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clave` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` int NOT NULL,
  `perfil` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verify` int NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'ana.info1999@gmail.com', 'admin', 'ADMINISTRADOR', '$2y$10$YJPEpg7HtOh4dkGwyi2HeeZokS6oJcwi4ttaav/pSDecXaXyuFIGi', 'Ecuador', 1, NULL, 0, NULL, 1),
(5, 'info@gmail.com', 'Ana Lopez', NULL, '$2y$10$IU0DrPBACYGug8YsXmKZyONddMoPawVy0XoRqSmW90Tqh7GEHfHD.', NULL, 2, NULL, 0, NULL, 1),
(6, 'yuli@gmail.com', 'Yuli Lopez', NULL, '$2y$10$1Q3quBslnwBhbuQ1QLJlPOfe92s57H94769tfr2G.YYUL.a8BC132', NULL, 2, NULL, 0, NULL, 1),
(7, 'yuliasencios@gmail.com', 'Yuli Asencios', NULL, '$2y$10$m68Aty7PfV8Rr5uak01byOoh6tZJucKn7W8Vx4UuLPRZGNhzMmqcu', NULL, 2, NULL, 0, NULL, 0),
(8, 'yampier19es@gmail.com', 'oscar', NULL, '$2y$10$DznN1c/FoYXtE4.5FzCWNuoOdj88splT9B66GJLvw5jTaSH3CueEi', NULL, 2, NULL, 0, NULL, 1),
(9, 'andresramos@gmail.com', 'admin', 'administrador', '$2y$10$v6q6YmQkvXgUrWYJB2f5/eK9wYsNC2HZwyyEt7cAL5XTvOBZO8tWC', 'Ecuador', 1, NULL, 0, NULL, 0),
(10, 'virgo13alexa@gmail.com', 'Andrea', NULL, '$2y$10$nslhkvepnIn3.X6wn32Yy.lm9IEUTQRqQGbseDrE/YFdJrH/QjZJ2', NULL, 2, NULL, 0, NULL, 1),
(11, 'frank.sevilla@istpet.edu.ec', 'frank', NULL, '$2y$10$Nd/77t5MHai31DFHIw8/bem7B5R8IlkIBrN5h9cCbSKm2fZcNRQvO', NULL, 2, NULL, 0, NULL, 0),
(12, 'frank.sevilla@mail.com', 'frank', NULL, '$2y$10$Qs8Fwz8ogiuWBIaVyNXbdO.olz3I4QnptTVMiqoNiXelv/z2nryrO', NULL, 2, NULL, 0, NULL, 0),
(13, 'frank.sevilla', 'frank', NULL, '$2y$10$zvkdYwiHvzWa28tJJ.J0eeCnt9EQcOS6JEjgXsDiSDuOx.v99JDpi', NULL, 2, NULL, 0, NULL, 0),
(14, 'frank.sevilla@institutotraversari.edu.ec', 'frank.sevilla@institutotraversari.edu.ec', NULL, '$2y$10$k8.lci7oAGyx7auCbxxkU.jb93JhBxtEsASC1aTVCEZ3w4ucm7kGq', NULL, 2, NULL, 0, NULL, 0),
(15, 'Frank Sevilla', 'Frank Sevilla', NULL, '$2y$10$eD6..WXd5T8BJgwoV4frseQUd1U/MLq.PMhMIazo71QM5CDA1.dty', NULL, 2, NULL, 0, NULL, 0),
(16, 'frank.sevilla@istpet.edu.ec', 'frank', 'sevilla', '$2y$10$jPO/e0nI52Oqmdc7gRf67uO8mQAqFiS97UTcp9YTD90FFrFrWJaui', 'solanda', 1, NULL, 0, NULL, 1),
(17, 'admin@mail.com', 'admin', 'admin', '$2y$10$Wbr.EamYoTTD2O3.ZfrjLOdolQJg5yqeEVqGJ4KpebFH11wJUf1iq', 'admin', 1, NULL, 0, NULL, 0),
(18, 'admin@mail.com', 'admin', 'admin', '$2y$10$n6EXT90GSmqgXTGPoTeQCenbOwxkjb/c/nFMKtvIPO.ougxFNFoQ6', 'a', 1, NULL, 0, NULL, 0),
(19, 'admin', 'admin', '1', '$2y$10$xhN6dGNjb7H2myB.iE8vI.fZivB39LX7ZjCKsC54R667yIWiPhAje', '1', 1, NULL, 0, NULL, 0),
(20, 'admin', 'admin', 'admin', '$2y$10$XU7Y3GG9EJJ895FBNQzp/OYu.4h2DzeQdBD32r75PdLNZ8bBK4EOy', 'admin', 1, NULL, 0, NULL, 0),
(21, 'admin@gmail.com', 'admin', 'admin', '$2y$10$KRZg2KFjIBdRkKGZkBXVTeFhWrzyrVUBwoebYmMqdEkIv67Em1oam', 'admin direccion', 1, NULL, 0, NULL, 1),
(22, 'gerardo.quinaluisa@istpet.edu.ec', 'Gerardo Quinaluisa', NULL, '$2y$10$6SO7V2w4/DbWx3BaqKxyn.86UBiA1Psve.CMUNP4v333JE1A4PUmW', NULL, 2, NULL, 0, NULL, 1),
(23, 'gerardo.quinaluisa@institutotraversari.edu.ec', 'Gerardo Quinaluisa', NULL, '$2y$10$GbYO6HY8sMgKVU8Bic0sCOhrNieJhNftzlxC9XPUxT3KvNKbpG5AO', NULL, 2, NULL, 0, NULL, 1),
(24, 'gerardo.rodriguez196@gmail.com', 'Gabriel Rodriguez', NULL, '$2y$10$smJ3jBpq1j6KyHLnz5i0MeE3Y62r1bn1mOKICgwaBE5Sw1BHQbBwC', NULL, 2, NULL, 0, NULL, 1),
(25, 'gampy18@hotamil.com', 'Edgar', 'Chicaiza', '$2y$10$okqHg9vH5aRg9duJXrMgFuVZcfYBA5thre5NhyuQEE29w9yLAnTfS', 'Quito', 2, NULL, 0, NULL, 1),
(26, 'gampy18@hotmail.com', 'Edgar', 'Chicaiza', '$2y$10$v34lNFVkwSg1KQ3lk.LRDO1oq/N/Z7kCunJ3oUa5NObLJ7/JHf8i2', 'san carlos', 2, NULL, 0, NULL, 1),
(27, 'trasportesmudanzasquality@gmail.com', 'Manuel ', 'Chicaiza', '$2y$10$GD2ZCfZL8nchf3gqghSQmOrY/Oixy89lmcveIuVI.Mui70dTv.1T6', 'Quito', 2, NULL, 0, NULL, 1),
(28, 'guachrichard@gmail.com', 'Richard', 'Guach', '$2y$10$MfMN05YIKAlANVxrKHvLeuPhrUrR5VqYW787PGlZtvPBXffzHeNfS', 'Chillogallo', 2, NULL, 0, NULL, 1),
(29, 'sevila@gmail.com', 'frank', 'sevilla', '$2y$10$lzYzcNrdDzBfxyCSV7VVfO07621kx8QuPUCe7/Pm2cEmdO.OpUP4C', 'solanda', 2, NULL, 0, NULL, 1),
(30, 'sevila@gmail.com1', 'sevila@gmail.com', 'sevila@gmail.com', '$2y$10$mp2KZZkYJ86DqIpYsGxFouRvDVDHDZZCM7f.g7hsz66hYtjPGasSm', 'sevila@gmail.com', 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int NOT NULL,
  `transaccion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nombre` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pais` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cod` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT '0.00',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proceso` int NOT NULL DEFAULT '1',
  `tipo` int NOT NULL DEFAULT '1',
  `estado` int NOT NULL DEFAULT '1',
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `total`, `pago`, `nombre`, `apellido`, `direccion`, `telefono`, `ciudad`, `pais`, `cod`, `envio`, `fecha`, `proceso`, `tipo`, `estado`, `id_usuario`) VALUES
(1, NULL, 10.00, 10.00, 'Ana Lopez ', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '2024-03-08 05:04:30', 1, 2, 1, 16),
(2, NULL, 1.00, 99999999.99, 'Andrea ', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '2024-03-13 06:43:02', 1, 2, 1, 1),
(3, '6GX05437BP860393E', 1.00, 0.00, 'Gerardo', 'Quinaluisa', 'Chillogallo', '0998034695', 'Quito', 'ecuador', '00001', 0.00, '2024-03-13 19:48:59', 2, 1, 1, 24),
(4, '66H71398E9962774F', 1.00, 0.00, 'Richard', 'Guach', 'Chillogallo', '0983078841', 'Quito', 'Ecuaodr', '14522', 0.00, '2024-03-13 21:44:47', 2, 1, 1, 28);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

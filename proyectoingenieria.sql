-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2017 a las 14:30:18
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoingenieria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(150) NOT NULL,
  `Rut` varchar(150) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `id_viña` int(11) DEFAULT NULL,
  `fecha` varchar(12) NOT NULL,
  `autorizar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_user`
--

INSERT INTO `app_user` (`id`, `sso_id`, `password`, `first_name`, `last_name`, `email`, `Rut`, `telefono`, `direccion`, `id_viña`, `fecha`, `autorizar`) VALUES
(15, 'juan', '$2a$10$gs2C7YLW1gw3FXYC91vOMuAPALkQNDCoqNwkw1qvAh1NaLrd1SQ2.', 'pedrin', 'contrerin', 'pecontr@alumnos.ubiobio.cl', '181992948', '+56993982206', 'villa padre hurtado block B-202', 0, '2017-08-28', 1),
(21, 'pedrin', '$2a$10$7pQzGOwDrd6Q48EpDCdBBenizJwEJFX4/fjvEPxkxAA6/wXoCu6oy', 'pedro', 'contreras', 'pecontr@alumnos.ubiobio.cl', '181992948', '+56993982206', 'villa padre hurtado block B-202', 0, '2017-10-05', 1),
(25, 'sami78', '$2a$10$kp8tewuGkswDdR68grZJSOGyTrZjizqXoJwVfn/W4mPeyt3cWIa32', 'samuel', 'ignacio nachito', 'pc.jssk@gmail.com', '18620433-6', '+56993982206', 'villa las carmelitas', NULL, '2017-12-13', 1),
(28, 'maca69', '$2a$10$59/OZg8ZmC8lPym8lG6Mautw1gLD4iQDT.IHsLBVBDjFX1QB5N/nS', 'maca ', 'martinez', 'pc.jssk@gmail.com', '19082967-7', '+56993982206', 'assssss', NULL, '2017-12-14', 1),
(30, 'flo1234', '$2a$10$R.Xmy8xnNh4aeMJQz/qwnOLTUvtbs.NWbanIjhJEz1A0q2ZLipcO6', 'florencia', 'gonzalez', 'naxogonza93@gmail.com', '25868011-1', '+56993982206', 'asdfwwe', NULL, '2017-12-14', 1),
(31, 'eva1234', '$2a$10$/PYlPK9oL56A04F0/laLeOYaCYIV5RRx2VNDC49h8bUACB.DZAFj.', 'eva ', 'cruz', 'naxogonza93@gmail.com', '11047753-8', '+56993982206', 'ppppppppppp', NULL, '2017-12-14', 0),
(32, 'ivan619', '$2a$10$d2NwgjPvE1GsvvGp0Hiv3.Ic3EGzeEFR/cT4s3gnUKEPCWFnB10eW', 'ivan anibal', 'venegas mardonez', 'ivan.venegas1401@alumnos.ubiobio.cl', '18771022-7', '+56942206015', 'poblacion mardones calle leucoton 339', NULL, '2017-12-14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user_user_profile`
--

CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_user_user_profile`
--

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`) VALUES
(15, 2),
(21, 1),
(25, 1),
(28, 1),
(30, 1),
(31, 1),
(32, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profile`
--

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_profile`
--

INSERT INTO `user_profile` (`id`, `type`) VALUES
(2, 'ADMIN'),
(3, 'DBA'),
(1, 'USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viña`
--

CREATE TABLE `viña` (
  `id_viña` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `comuna` varchar(25) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `variedad` varchar(20) NOT NULL,
  `descripcion` varchar(320) NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `autorizar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viña`
--

INSERT INTO `viña` (`id_viña`, `name`, `rut`, `comuna`, `ciudad`, `direccion`, `latitud`, `longitud`, `variedad`, `descripcion`, `email`, `user_id`, `fecha`, `autorizar`) VALUES
(1, 'viña', '18199294-8', 'bulnes', 'bulnes', 'villa padre hurtado', -36.590989571558445, -72.0186852895996, 'Cabernet sauvignon', 'viña san pedrin ', 'pc.jssk@gmail.com', 21, '2017-11-28', 1),
(7, 'viña el origen', '88445445-8', 'chillan', 'chillan', 'andres bello n° 3356', -36.65827750074749, -72.27885676708985, 'Cabernet sauvignon', 'muy buena calidad de vino', 'pecontr@alumnos.ubiobio.cl', 21, '2017-11-28', 1),
(11, 'viña camille', '18199294-8', 'bulnes', 'santa clara', 'las carmelitas numero 2045', -36.74374761725999, -72.29293059999998, 'Merlot', 'el mejor vino de la zona ', 'pc.jssk@gmail.com', 21, '2017-11-28', 1),
(12, 'viña samuel Gonzalez', '19082967-7', 'san carlos ', 'san carlos', 'villa cariño', -36.486158971348466, -72.01930633510744, 'Merlot', 'asdfgh', 'samgonza@alumnos.ubiobio.cl', 25, '2017-12-14', 1),
(13, 'viña el juaco', '18199294-8', 'cabrero', 'monte aguila ', 'las carmelitas numero 20777', -36.60944173014805, -72.2263306557129, 'Merlot', 'asdfg', 'samgonza@alumnos.ubiobio.cl', 25, '2017-12-14', 1),
(14, 'viña el pedrin magico', '18199294-8', 'bulnes ', 'pueblo seco', 'villa padre hurtado block B-202', -36.43121180283852, -71.95104580708005, 'Chardonnay', '33 ectareas', 'pc.jssk@gmail.com', 25, '2017-12-14', 0),
(15, 'ivan taliban', '8945814-5', 'chillan', 'chillan', 'villa las carmelitas 555', -36.56673843037847, -72.07137835869139, 'Merlot', '33 ectareas de merlot', 'pc.jssk@gmail.com', 32, '2017-12-14', 1),
(16, 'el rincon de la uva ', '19082967-7', 'chillan', 'chillan', 'las carmelitas numero 20755', -36.517226574606845, -72.15291731274414, 'Chardonnay', '8 ectareas de pura calidad', 'samgonza@alumnos.ubiobio.cl', 32, '2017-12-14', 1),
(17, 'addsfasfd', '18199294-8', '555555', '555555', '55555555', -36.59747779931014, -72.06468346499025, 'Chardonnay', 'lkjglkjhklhkh', 'pc.jssk@gmail.com', 32, '2017-12-14', 0),
(18, 'asdfasdfas', '18199294-8', 'sdgsdfgsdf', 'jhgfjgjhgf', 'jhgfjhgfjgf', -36.59610151458905, -72.08940300327151, 'Chardonnay', 'jhsdflgjshldkfjhsd', 'pc.jssk@gmail.com', 32, '2017-12-14', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sso_id` (`sso_id`);

--
-- Indices de la tabla `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD PRIMARY KEY (`user_id`,`user_profile_id`),
  ADD KEY `FK_USER_PROFILE` (`user_profile_id`);

--
-- Indices de la tabla `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Indices de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indices de la tabla `viña`
--
ALTER TABLE `viña`
  ADD PRIMARY KEY (`id_viña`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `viña`
--
ALTER TABLE `viña`
  MODIFY `id_viña` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  ADD CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`);

--
-- Filtros para la tabla `viña`
--
ALTER TABLE `viña`
  ADD CONSTRAINT `viña_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

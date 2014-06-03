-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-02-2014 a las 21:24:31
-- Versión del servidor: 5.5.32-0ubuntu7
-- Versión de PHP: 5.5.3-1ubuntu2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sgc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aareacomuns`
--

CREATE TABLE IF NOT EXISTS `aareacomuns` (
  `id_area_comun` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_area_comun`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `aareacomuns`
--

INSERT INTO `aareacomuns` (`id_area_comun`, `descripcion`) VALUES
(1, 'Cancha de Futbol'),
(2, 'Caney para Fiestas Campestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbols`
--

CREATE TABLE IF NOT EXISTS `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `text` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vinculo` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ruta` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `actividad` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=88 ;

--
-- Volcado de datos para la tabla `arbols`
--

INSERT INTO `arbols` (`id`, `tipo`, `text`, `vinculo`, `ruta`, `actividad`, `padre_id`) VALUES
(1, 1, 'Cartelera Informativa', '', '', NULL, 0),
(2, 1, 'Cartelera Informativa', 'javascript:menu(4)', '', NULL, 1),
(3, 1, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 1),
(5, 1, 'Mensajes', 'javascript:menu(5)', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 1),
(6, 1, 'Area Comun', '', '', NULL, 0),
(7, 1, 'Reservacion', 'javascript:menu(17)', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 6),
(8, 1, 'Asamblea', 'javascript:menu(18)', 'javascripts/sgc/formularios/asambleas/presidente.js', NULL, 0),
(9, 1, 'Bancos', '', '', NULL, 0),
(10, 1, 'Cuentas Bancarias', 'javascript:menu(12)', 'javascripts/sgc/formularios/bancos/consultarcuentas.js', NULL, 9),
(11, 1, 'Bancos', 'javascript:menu(46)', 'javascripts/sgc/formularios/bancos/presidente.js', NULL, 9),
(12, 2, 'Cartelera Informativa', '', '', NULL, 0),
(13, 2, 'Cartelera Informativa', 'javascript:menu(4)', '', NULL, 12),
(14, 2, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 12),
(15, 2, 'Mensajes', 'javascript:menu(5)', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 12),
(16, 2, 'Area Comun', '', '', NULL, 0),
(17, 2, 'Reservacion', 'javascript:menu(17)', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 16),
(18, 2, 'Asamblea', 'javascript:menu(18)', 'javascripts/sgc/formularios/asambleas/secretario.js', NULL, 0),
(19, 2, 'Junta de Condominio', '', '', NULL, 0),
(20, 2, 'Miembros', 'javascript:menu(31)', 'javascripts/sgc/formularios/registrarmiembro.js', NULL, 19),
(21, 3, 'Cartelera Informativa', '', '', NULL, 0),
(22, 3, 'Cartelera Informativa', 'javascript:menu(4)\r\n', '', NULL, 21),
(23, 3, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 21),
(24, 3, 'Mensajes\r\n', 'javascript:menu(5)\r\n', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 21),
(25, 3, 'Area Comun', '', '', NULL, 0),
(26, 3, 'Reservacion\r\n', 'javascript:menu(17)\r\n', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 25),
(27, 3, 'Cuota Mensual', '', '', NULL, 0),
(28, 3, 'Cuota Mensual', 'javascript:menu(10)', 'javascripts/sgc/formularios/administrador.js', NULL, 27),
(29, 3, 'Bancos', '', '', NULL, 0),
(30, 3, 'Cuentas Bancarias', 'javascript:menu(12)', 'javascripts/sgc/formularios/bancos/consultarcuentas.js', NULL, 29),
(31, 3, 'Empleados', 'javascript:menu(54)', 'javascripts/sgc/formularios/registrarempleado.js', NULL, 0),
(32, 3, 'Informacion Operacional', 'javascript:menu(14)', 'javascripts/sgc/formularios/informacionoperacional.js', NULL, 0),
(33, 3, 'Informacion Contable', 'javascript:menu(2)', 'javascripts/sgc/formularios/informacioncontable.js', NULL, 0),
(34, 3, 'Nomina', '', '', NULL, 0),
(35, 3, 'Registrar Nomina', 'javascript:menu(29)', 'javascripts/sgc/formularios/nomina/registrarnomina.js', NULL, 34),
(36, 3, 'Junta de Condominio', '', '', NULL, 0),
(37, 3, 'Miembros', 'javascript:menu(31)', 'javascripts/sgc/formularios/registrarmiembros.js', NULL, 36),
(38, 4, 'Cartelera Informativa', '', '', NULL, 0),
(39, 4, 'Cartelera Informativa', 'javascript:menu(4)', '', NULL, 38),
(40, 4, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 38),
(41, 4, 'Mensajes', 'javascript:menu(5)', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 38),
(42, 4, 'Area Comun', '', '', NULL, 0),
(43, 4, 'Reservacion', 'javascript:menu(17)', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 42),
(44, 4, 'Bienes y Servicios', 'javascript:menu(26)', 'javascripts/sgc/formularios/bienes_servicios/webmaster.js', NULL, 0),
(45, 4, 'Copropietarios', 'javascript:menu(24)', 'javascripts/sgc/formularios/copropietarios/webmaster.js', NULL, 0),
(46, 4, 'Condominios', 'javascript:menu(51)', 'javascripts/sgc/formularios/registrarcondominio.js', NULL, 0),
(47, 4, 'Inmuebles', 'javascript:menu(44)', 'javascripts/sgc/formularios/registrarinmueble.js', NULL, 0),
(48, 4, 'Empleados', 'javascript:menu(54)', 'javascripts/sgc/formularios/registrarempleado.js', NULL, 0),
(49, 4, 'Bancos', '', '', NULL, 0),
(50, 4, 'Bancos', 'javascript:menu(20)', 'javascripts/sgc/formularios/bancos/webmaster.js', NULL, 49),
(51, 4, 'Junta de Condominio', '', '', NULL, 0),
(52, 4, 'Miembros', 'javascript:menu(31)', 'javascripts/sgc/formularios/registrarmiembro.js', NULL, 51),
(53, 4, 'Proveedores', 'javascript:menu(36)', 'javascripts/sgc/formularios/proveedores/webmaster.js', NULL, 0),
(54, 1, 'Nomina', '', '', NULL, 0),
(55, 1, 'Informacion de la Nomina', 'javascript:menu(8)', 'javascripts/sgc/formularios/nomina/consultarnomina.js', NULL, 54),
(56, 5, 'Cartelera Informativa', '', '', NULL, 0),
(57, 5, 'Cartelera Informativa', 'javascript:menu(4)', '', NULL, 56),
(58, 5, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 56),
(59, 5, 'Mensajes', 'javascript:menu(5)', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 56),
(60, 5, 'Area Comun', '', '', NULL, 0),
(61, 5, 'Reservacion', 'javascript:menu(17)', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 60),
(62, 5, 'Preveedores', 'javascript:menu(36)', 'javascripts/sgc/formularios/proveedores/almacenista.js', NULL, 0),
(63, 5, 'Bienes y Sevicios', 'javascript:menu(35)', 'javascripts/sgc/formularios/bienes_servicios/almacenista.js', NULL, 0),
(64, 5, 'Inventario', '', '', NULL, 0),
(65, 5, 'Flujo de Entrada', 'javascript:menu(37)', 'javascripts/sgc/formularios/inventario/almacenista.js', NULL, 64),
(66, 5, 'Flujo de Salida', 'javascript:menu(38)', 'javascripts/sgc/formularios/inventario/flujo_salida.js', NULL, 64),
(67, 5, 'Informacion Operacional', 'javascript:menu(14)', 'javascripts/sgc/formularios/informacionoperacional.js', NULL, 0),
(68, 5, 'Nomina', '', '', NULL, 0),
(69, 5, 'Informacion de la Nomina', 'javascript:menu(8)', 'javascripts/sgc/formularios/nomina/consultarnomina.js', NULL, 68),
(70, 6, 'Cartelera Informativa', '', '', NULL, 0),
(71, 6, 'Cartelera Informativa', 'javascript:menu(4)', '', NULL, 70),
(72, 6, 'Mensajes', 'javascript:menu(5)', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 70),
(73, 6, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 70),
(74, 6, 'Area Comun', '', '', NULL, 0),
(75, 6, 'Reservacion', 'javascript:menu(17)', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 74),
(76, 6, 'Visitas', 'javascript:menu(15)', 'javascripts/sgc/formularios/visitas/visitas.js', NULL, 0),
(77, 6, 'Nomina', '', '', NULL, 0),
(78, 6, 'Informacion de la Nomina', 'javascript:menu(8)', 'javascripts/sgc/formularios/nomina/consultarnomina.js', NULL, 77),
(79, 7, 'Cartelera Informativa', '', '', NULL, 0),
(80, 7, 'Cartelera Informativa', 'javascript:menu(4)', '', NULL, 79),
(81, 7, 'Quejas y Sugerencias', 'javascript:menu(5)', '', NULL, 79),
(82, 7, 'Mensajes', 'javascript:menu(5)', 'javascripts/sgc/formularios/enviarmensaje.js', NULL, 79),
(83, 7, 'Area Comun', '', '', NULL, 0),
(84, 7, 'Reservacion', 'javascript:menu(17)', 'javascripts/sgc/formularios/reservarareacomun.js', NULL, 83),
(85, 7, 'Cuota Mensual', '', '', NULL, 0),
(86, 7, 'Cuota Mensual', 'javascript:menu(10)', 'javascripts/sgc/formularios/cuota_mensual/inmueble.js', NULL, 85),
(87, 7, 'Aviso de Cobro', 'javascript:menu(3)', 'javascripts/sgc/formularios/registraravisocobro.js', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areacomuns`
--

CREATE TABLE IF NOT EXISTS `areacomuns` (
  `idareacomun` int(11) NOT NULL AUTO_INCREMENT,
  `codigoareacomun` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionareacomun` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusareacomun` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `capacidadareacomun` int(11) NOT NULL,
  `idcondominioareacomun` int(11) NOT NULL,
  `nombreareacomun` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `precio_hora` float NOT NULL,
  `id_area_comun` int(11) DEFAULT NULL,
  PRIMARY KEY (`idareacomun`),
  KEY `fk_areacomuns_condominios1_idx` (`idcondominioareacomun`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `areacomuns`
--

INSERT INTO `areacomuns` (`idareacomun`, `codigoareacomun`, `descripcionareacomun`, `estatusareacomun`, `capacidadareacomun`, `idcondominioareacomun`, `nombreareacomun`, `precio_hora`, `id_area_comun`) VALUES
(1, '1', 'Piscina con 20 mesas', 'A', 20, 1, 'Piscina A', 0, 1),
(2, '2', 'Cancha de futbol', 'A', 11, 0, 'Cancha A', 0, 1),
(3, '3', 'Cancha de Beisbol', 'A', 40, 1, 'Cancha la bota', 0, 1),
(4, '4', 'Salon de Fiesta Grande', 'A', 200, 1, 'Salon Maritimo', 0, 1),
(5, '5', 'Caney para fiestas campestre', 'A', 10, 0, 'Caney B', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asambleas`
--

CREATE TABLE IF NOT EXISTS `asambleas` (
  `id_asamblea` int(11) NOT NULL AUTO_INCREMENT,
  `id_condominio` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `estatus` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_asamblea`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `asambleas`
--

INSERT INTO `asambleas` (`id_asamblea`, `id_condominio`, `tipo`, `fecha`, `hora_inicio`, `estatus`) VALUES
(1, 1, 1, '2014-03-26', '02:15:00', 'Planificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `codigocondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrebanco` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `rifbanco` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusbanco` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nro_banco` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=117 ;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`idbanco`, `codigocondominio`, `nombrebanco`, `rifbanco`, `estatusbanco`, `nro_banco`) VALUES
(108, '0108', 'Banco Provincial', 'J12345678', 'A', ''),
(116, '0116', 'Bod Banco Universal', 'J98765432', 'A', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienservicioproveedors`
--

CREATE TABLE IF NOT EXISTS `bienservicioproveedors` (
  `id_bs_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `id_bien_servicio` int(11) NOT NULL,
  `precio_neto` float NOT NULL,
  `estatus` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_bs_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienservicios`
--

CREATE TABLE IF NOT EXISTS `bienservicios` (
  `id_bien_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` int(1) NOT NULL,
  PRIMARY KEY (`id_bien_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `codigocargo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecargo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuscargo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `sueldo` float NOT NULL,
  `tipo_menu` int(11) NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idcargo`, `codigocargo`, `nombrecargo`, `estatuscargo`, `sueldo`, `tipo_menu`) VALUES
(1, '1', 'Concerje', 'A', 0, 0),
(2, '2', 'Vigilante', 'A', 0, 6),
(3, '3', 'Administrador', 'A', 3, 0),
(4, '4', 'Presidente', 'A', 0, 1),
(5, '5', 'Tesorero', 'A', 0, 0),
(6, '6', 'Almacenista', 'A', 0, 5),
(7, '7', 'Secretario', 'A', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudads`
--

CREATE TABLE IF NOT EXISTS `ciudads` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `codigociudad` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombreciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusciudad` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idmunicipiociudad` int(11) NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudades_municipios1_idx` (`idmunicipiociudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ciudads`
--

INSERT INTO `ciudads` (`idciudad`, `codigociudad`, `nombreciudad`, `estatusciudad`, `idmunicipiociudad`) VALUES
(1, '1', 'Barquisimeto', 'A', 1),
(2, '2', 'Cabudare', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantedepagos`
--

CREATE TABLE IF NOT EXISTS `comprobantedepagos` (
  `idcomprobantedepago` int(11) NOT NULL AUTO_INCREMENT,
  `codigocomprobantedepago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcioncomprobantedepago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacomprobantedepago` date NOT NULL,
  `montototalcomprobante` float NOT NULL,
  `nombrearchivocomprobantedepago` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatoarchivocomprobantedepago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivocomprobantedepago` blob,
  `estatuscomprobantedepago` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idproveedorxcondominiocomprobantedepago` int(11) NOT NULL,
  PRIMARY KEY (`idcomprobantedepago`),
  KEY `fk_comprobantedepago_proveedorxcondominios1_idx` (`idproveedorxcondominiocomprobantedepago`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `comprobantedepagos`
--

INSERT INTO `comprobantedepagos` (`idcomprobantedepago`, `codigocomprobantedepago`, `descripcioncomprobantedepago`, `fechacomprobantedepago`, `montototalcomprobante`, `nombrearchivocomprobantedepago`, `formatoarchivocomprobantedepago`, `archivocomprobantedepago`, `estatuscomprobantedepago`, `idproveedorxcondominiocomprobantedepago`) VALUES
(1, '1', 'Pago del Agua', '2014-01-01', 12000, 'Comprobante', 'pdf', NULL, 'A', 2),
(2, '2', 'Pago de GAS', '2014-02-02', 200, 'c', 'pdf', NULL, 'A', 3),
(3, '3', 'Compra de Vidrio Puerta Principal', '2014-04-04', 1500, 'c', 'pdf', NULL, 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condominiobancos`
--

CREATE TABLE IF NOT EXISTS `condominiobancos` (
  `id_banco_cond` int(11) NOT NULL AUTO_INCREMENT,
  `id_banco` int(11) NOT NULL,
  `id_condominio` int(11) NOT NULL,
  PRIMARY KEY (`id_banco_cond`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `condominiobancos`
--

INSERT INTO `condominiobancos` (`id_banco_cond`, `id_banco`, `id_condominio`) VALUES
(1, 108, 0),
(2, 108, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condominios`
--

CREATE TABLE IF NOT EXISTS `condominios` (
  `idcondominio` int(11) NOT NULL,
  `rifcondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `direccioncondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `nombredocumentocondominio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatodocumentocondominio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `documentocondominio` blob,
  `interesmoracondominio` float NOT NULL,
  `tiempomoracondominio` int(11) NOT NULL,
  `nombrefotocondominio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotocondominio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotocondominio` blob,
  `estatuscondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idciudadcondominio` int(11) NOT NULL,
  `idtipocondominiocondominio` int(11) NOT NULL,
  `metros_cudrados` float NOT NULL,
  `porc_fondo_reserva` float NOT NULL,
  `monto_fondo_reserva` float NOT NULL,
  `vencimiento_cuota` int(11) NOT NULL,
  PRIMARY KEY (`idcondominio`),
  KEY `fk_condominios_ciudads1_idx` (`idciudadcondominio`),
  KEY `fk_condominios_tipocondominios1_idx` (`idtipocondominiocondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `condominios`
--

INSERT INTO `condominios` (`idcondominio`, `rifcondominio`, `nombrecondominio`, `direccioncondominio`, `nombredocumentocondominio`, `formatodocumentocondominio`, `documentocondominio`, `interesmoracondominio`, `tiempomoracondominio`, `nombrefotocondominio`, `formatofotocondominio`, `fotocondominio`, `estatuscondominio`, `idciudadcondominio`, `idtipocondominiocondominio`, `metros_cudrados`, `porc_fondo_reserva`, `monto_fondo_reserva`, `vencimiento_cuota`) VALUES
(0, 'J11', 'Lara P', 'O', 'Documento', 'Documento', NULL, 0.1, 1, 'Foto', 'foto', NULL, 'A', 1, 2, 0, 0, 0, 0),
(1, 'J12', 'Mercedes', 'Cabudare', 'Documento', 'Documento', NULL, 0.1, 2, 'Foto', 'foto', NULL, 'A', 2, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlsalidas`
--

CREATE TABLE IF NOT EXISTS `controlsalidas` (
  `id_control` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `id_empleado` varchar(5) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_retiro` date NOT NULL,
  PRIMARY KEY (`id_control`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlvisitas`
--

CREATE TABLE IF NOT EXISTS `controlvisitas` (
  `idcontrolvisita` int(11) NOT NULL AUTO_INCREMENT,
  `codigocontrolvisita` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechavisita` date NOT NULL,
  `horavisita` time NOT NULL,
  `idvisitantecontrolvisita` int(11) NOT NULL,
  `idempleadocontrolvisita` int(11) NOT NULL,
  `idinmueblecontrolvisita` int(11) NOT NULL,
  `estatuscontrolvisita` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcontrolvisita`),
  KEY `fk_controlvisitas_visitantes1_idx` (`idvisitantecontrolvisita`),
  KEY `fk_controlvisitas_empleados1_idx` (`idempleadocontrolvisita`),
  KEY `fk_controlvisitas_inmuebles1_idx` (`idinmueblecontrolvisita`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `controlvisitas`
--

INSERT INTO `controlvisitas` (`idcontrolvisita`, `codigocontrolvisita`, `fechavisita`, `horavisita`, `idvisitantecontrolvisita`, `idempleadocontrolvisita`, `idinmueblecontrolvisita`, `estatuscontrolvisita`) VALUES
(1, '1', '2014-01-01', '02:00:00', 1, 2, 1, 'A'),
(2, '2', '2014-01-02', '04:00:00', 2, 2, 2, 'A'),
(3, '3', '2014-02-03', '05:00:00', 1, 3, 3, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copropietarios`
--

CREATE TABLE IF NOT EXISTS `copropietarios` (
  `idcopropietario` int(11) NOT NULL AUTO_INCREMENT,
  `cedulacopropietario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecopropietario` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidocopropietario` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `correocopropietario` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefonocopropietario` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacreacioncopropietario` date NOT NULL,
  `estatuscopropietario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `direccioncopropietario` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechanacimientocopropietario` date NOT NULL,
  `nombrefotocopropietario` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotocopropietario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotocopropietario` blob,
  `twittercopropietario` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idciudadcopropietario` int(11) NOT NULL,
  PRIMARY KEY (`idcopropietario`),
  KEY `fk_copropietarios_ciudads1_idx` (`idciudadcopropietario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `copropietarios`
--

INSERT INTO `copropietarios` (`idcopropietario`, `cedulacopropietario`, `nombrecopropietario`, `apellidocopropietario`, `correocopropietario`, `telefonocopropietario`, `fechacreacioncopropietario`, `estatuscopropietario`, `direccioncopropietario`, `fechanacimientocopropietario`, `nombrefotocopropietario`, `formatofotocopropietario`, `fotocopropietario`, `twittercopropietario`, `idciudadcopropietario`) VALUES
(1, '123', 'Vero', 'Vasquez', 'veronica@yahoo.com', '04168736454', '2014-01-01', 'A', 'Cabudare', '1990-01-01', 'foto', 'foto', NULL, 'vero', 2),
(2, '234', 'Ale', 'Vasquez', 'v@gmail.com', '12345', '2014-01-01', 'A', 'Cabudare', '1990-01-01', 'foto', 'foto', NULL, 'ale', 2),
(3, '345', 'Jose', 'Perez', 'p@gmail.com', '12345', '2014-01-01', 'A', 'Barquisimeto', '1990-01-01', 'foto', 'foto', NULL, 'jose', 2),
(4, '567', 'Xiomara', 'Avila', 'x@gmail.com', '234', '2014-01-01', 'A', 'Barquisimeto', '1990-01-01', 'f', 'f', NULL, 'x', 2),
(5, '238765', 'Yuly', 'Izarra', 'y@gmail.com', '456', '2014-01-01', 'A', 'Barquisimeto', '1990-01-01', 'f', 'f', NULL, 'y', 1),
(6, '34554', 'Zulme', 'Saldivia', 's@gmail.com', '7654', '2014-01-01', 'A', 'Barquisimeto', '1990-01-01', 'f', 'f', NULL, 'z', 1),
(8, '34543', 'Wilmer', 'Ojeda', 'o@gmail.com', '456', '2014-01-01', 'A', 'Barquisimeto', '1990-01-01', 'f', 'f', NULL, 'w', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacions`
--

CREATE TABLE IF NOT EXISTS `cotizacions` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigocotizacion` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcioncotizacion` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacotizacioncotizacion` date NOT NULL,
  `fechavencimientocotizacioncotizacion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `aprobacioncotizacion` tinyint(1) NOT NULL,
  `montocotizacion` float NOT NULL,
  `estatuscotizacion` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idproveedorxcondominiocotizacion` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `fk_cotizacions_proveedorxcondominios1_idx` (`idproveedorxcondominiocotizacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cotizacions`
--

INSERT INTO `cotizacions` (`idcotizacion`, `codigocotizacion`, `descripcioncotizacion`, `fechacotizacioncotizacion`, `fechavencimientocotizacioncotizacion`, `aprobacioncotizacion`, `montocotizacion`, `estatuscotizacion`, `idproveedorxcondominiocotizacion`) VALUES
(1, '1', 'Recibo de agua', '2013-02-01', '2013-03-01', 0, 12000, 'A', 2),
(2, '2', 'Remodelación de piscina', '2014-02-02', '2014-02-03', 0, 20000, 'A', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaporcobrars`
--

CREATE TABLE IF NOT EXISTS `cuentaporcobrars` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `id_inmueble` int(11) NOT NULL,
  `monto_a_cobrar` float NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cuentaporcobrars`
--

INSERT INTO `cuentaporcobrars` (`id_cuenta`, `id_inmueble`, `monto_a_cobrar`) VALUES
(1, 1, -4578);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE IF NOT EXISTS `cuentas` (
  `numerocuenta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `idbancocuenta` int(11) NOT NULL,
  `idcondominiocuenta` int(11) NOT NULL,
  `cedulatitularcuenta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombretitularcuenta` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `tipocuenta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `saldodisponible` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionbanco` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `monto` float NOT NULL,
  `id_banco_cond` int(11) NOT NULL,
  PRIMARY KEY (`numerocuenta`,`idbancocuenta`,`idcondominiocuenta`),
  KEY `fk_cuentas_bancos1_idx` (`idbancocuenta`),
  KEY `fk_cuentas_condominios1_idx` (`idcondominiocuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`numerocuenta`, `idbancocuenta`, `idcondominiocuenta`, `cedulatitularcuenta`, `nombretitularcuenta`, `tipocuenta`, `saldodisponible`, `descripcionbanco`, `monto`, `id_banco_cond`) VALUES
('00015645376878900788', 108, 0, '20186243', 'Euge', '0', '1452', 'dddd', 1500, 1),
('01089903876373839', 108, 1, '12345', 'Vero', '1', '20000', 'Cuenta abierta para fondo de reserva', 0, 0),
('01161234567898765', 116, 0, '12345', 'Ale', '2', '20000', 'Fondo de Prestaciones sociales', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotamensuals`
--

CREATE TABLE IF NOT EXISTS `cuotamensuals` (
  `id_cuota` int(11) NOT NULL AUTO_INCREMENT,
  `id_inmueble` int(11) NOT NULL,
  `nro_inmueble` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `total_cuota_mensual` float NOT NULL,
  `total_gastos_comunes` float NOT NULL,
  `total_gastos_no_comunes` float NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `abono` float NOT NULL,
  `estatus` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_cuota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cuotamensuals`
--

INSERT INTO `cuotamensuals` (`id_cuota`, `id_inmueble`, `nro_inmueble`, `total_cuota_mensual`, `total_gastos_comunes`, `total_gastos_no_comunes`, `fecha_vencimiento`, `abono`, `estatus`) VALUES
(1, 1, 'I_1', 900, 0, 0, '0000-00-00', 0, 'NP'),
(2, 0, '', 0, 0, 0, '0000-00-00', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotapagos`
--

CREATE TABLE IF NOT EXISTS `cuotapagos` (
  `id_pago_cuota` int(11) NOT NULL AUTO_INCREMENT,
  `id_cuota` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  PRIMARY KEY (`id_pago_cuota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cuotapagos`
--

INSERT INTO `cuotapagos` (`id_pago_cuota`, `id_cuota`, `id_pago`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE IF NOT EXISTS `detalles` (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idcomprobantedepagodetalle` int(11) DEFAULT NULL,
  `idcotizaciondetalle` int(11) DEFAULT NULL,
  `descripciondetalle` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `montodetalle` float NOT NULL,
  `idtipoegresodetalle` int(11) NOT NULL,
  `idproveedorxserviciodetalle` int(11) NOT NULL,
  `idformapagodetalle` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_comprobantedepagos1_idx` (`idcomprobantedepagodetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_cotizacions1_idx` (`idcotizaciondetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_tipoegresos1_idx` (`idtipoegresodetalle`),
  KEY `fk_detalledecomprobante_proveedorxservicios1_idx` (`idproveedorxserviciodetalle`),
  KEY `fk_detalles_formapagos1_idx` (`idformapagodetalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`iddetalle`, `idcomprobantedepagodetalle`, `idcotizaciondetalle`, `descripciondetalle`, `montodetalle`, `idtipoegresodetalle`, `idproveedorxserviciodetalle`, `idformapagodetalle`) VALUES
(2, 1, 1, 'Pago del agua', 12000, 1, 2, 1),
(3, 2, NULL, 'Pago de 1 bombona de GAS', 100, 1, 3, 1),
(4, 2, NULL, 'Pago de instalación de bombona', 100, 1, 3, 1),
(5, 3, NULL, 'Compra de vidrio puerta principal', 1500, 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eegresos`
--

CREATE TABLE IF NOT EXISTS `eegresos` (
  `id_egreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_egreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `eegresos`
--

INSERT INTO `eegresos` (`id_egreso`, `codigo`, `tipo`, `descripcion`) VALUES
(1, '', 0, 'Pago a Proveedores'),
(2, '', 0, 'Pago de Nomina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresocondominios`
--

CREATE TABLE IF NOT EXISTS `egresocondominios` (
  `id_egreso_cond` int(11) NOT NULL AUTO_INCREMENT,
  `id_condominio` int(11) NOT NULL,
  `id_egreso` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_egreso_cond`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `egresocondominios`
--

INSERT INTO `egresocondominios` (`id_egreso_cond`, `id_condominio`, `id_egreso`, `descripcion`) VALUES
(1, 3, 1, ''),
(2, 3, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresonocomunxinmuebles`
--

CREATE TABLE IF NOT EXISTS `egresonocomunxinmuebles` (
  `idegresonocomunxinmueble` int(11) NOT NULL AUTO_INCREMENT,
  `idegresosnocomun` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `estatusegresonocomunxinmueble` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idegresonocomunxinmueble`),
  KEY `fk_egresonocomunxinmuebles_egresosnocomuns1_idx` (`idegresosnocomun`),
  KEY `fk_egresonocomunxinmuebles_inmuebles1_idx` (`idinmueble`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `egresonocomunxinmuebles`
--

INSERT INTO `egresonocomunxinmuebles` (`idegresonocomunxinmueble`, `idegresosnocomun`, `idinmueble`, `estatusegresonocomunxinmueble`) VALUES
(1, 1, 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE IF NOT EXISTS `egresos` (
  `idegreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigoegreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionegreso` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `fechaegreso` date NOT NULL,
  `montoegreso` float NOT NULL,
  `estatusegreso` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `iddetalles` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  `idformapagopago` int(11) NOT NULL,
  `tipo` int(1) NOT NULL,
  PRIMARY KEY (`idegreso`),
  KEY `fk_egresos_detalles1_idx` (`iddetalles`),
  KEY `fk_egresos_condominios1_idx` (`idcondominio`),
  KEY `fk_egresos_formapagos1_idx` (`idformapagopago`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`idegreso`, `codigoegreso`, `descripcionegreso`, `fechaegreso`, `montoegreso`, `estatusegreso`, `iddetalles`, `idcondominio`, `idformapagopago`, `tipo`) VALUES
(1, '1', 'Pago por servicios de GAS', '2014-02-02', 100, 'A', 3, 1, 1, 0),
(2, '2', 'Pago por 1 bombona de GAS', '2014-02-02', 100, 'A', 4, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresosnocomuns`
--

CREATE TABLE IF NOT EXISTS `egresosnocomuns` (
  `idegresosnocomun` int(11) NOT NULL AUTO_INCREMENT,
  `codigonocomun` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionnocomun` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `montonocomuns` float NOT NULL,
  `fechanocomun` date NOT NULL,
  `estatusegresonocomun` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `iddetalle` int(11) NOT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idegresosnocomun`),
  KEY `fk_egresosnocomuns_detalles1_idx` (`iddetalle`),
  KEY `fk_egresosnocomuns_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `egresosnocomuns`
--

INSERT INTO `egresosnocomuns` (`idegresosnocomun`, `codigonocomun`, `descripcionnocomun`, `montonocomuns`, `fechanocomun`, `estatusegresonocomun`, `iddetalle`, `idcondominio`) VALUES
(1, '1', 'Compra de Vidrio Puerta Principal', 1500, '2014-02-04', 'A', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresoxrecibos`
--

CREATE TABLE IF NOT EXISTS `egresoxrecibos` (
  `idegresoxrecibo` int(11) NOT NULL AUTO_INCREMENT,
  `montoegresoxrecibo` float NOT NULL,
  `estatusegresoxrecibo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idrecibocobro` int(11) NOT NULL,
  `idegreso` int(11) DEFAULT NULL,
  `idegresonocomunxinmueble` int(11) DEFAULT NULL,
  PRIMARY KEY (`idegresoxrecibo`),
  KEY `fk_egresoxrecibocobroxinmuebles_egresos1_idx` (`idegreso`),
  KEY `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1_idx` (`idrecibocobro`),
  KEY `fk_egresoxrecibo_egresonocomunxinmuebles1_idx` (`idegresonocomunxinmueble`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `egresoxrecibos`
--

INSERT INTO `egresoxrecibos` (`idegresoxrecibo`, `montoegresoxrecibo`, `estatusegresoxrecibo`, `idrecibocobro`, `idegreso`, `idegresonocomunxinmueble`) VALUES
(1, 50, 'A', 1, 1, NULL),
(2, 50, 'A', 1, 2, NULL),
(3, 1500, 'A', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaempledo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombreempledo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidoempledo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `direccionempledo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoempledo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `correoempledo` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechanacimientoempleado` date DEFAULT NULL,
  `nombrefotoempleado` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotoempleado` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotoempleado` blob,
  `sueldobase` float NOT NULL,
  `estatusempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idloginempleado` int(11) NOT NULL,
  `idcondominioempleado` int(11) NOT NULL,
  `idcargoempleado` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_logins1_idx` (`idloginempleado`),
  KEY `fk_empleados_condominios1_idx` (`idcondominioempleado`),
  KEY `fk_empleados_cargo1_idx` (`idcargoempleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idempleado`, `cedulaempledo`, `nombreempledo`, `apellidoempledo`, `direccionempledo`, `telefonoempledo`, `correoempledo`, `fechanacimientoempleado`, `nombrefotoempleado`, `formatofotoempleado`, `fotoempleado`, `sueldobase`, `estatusempleado`, `idloginempleado`, `idcondominioempleado`, `idcargoempleado`) VALUES
(1, '1234', 'Pedro', 'Guanipa', 'Cabudare', '1234', 'pepito@gamail.com', '1957-01-01', 'f', 'f', NULL, 3000, 'A', 3, 1, 1),
(2, '4356346', 'Juan', 'Marquez', 'Quibor', '3456', 'e@g', '1980-01-01', 'f', 'f', NULL, 4000, 'A', 6, 1, 2),
(3, '123', 'Manuel', 'Sevilla', 'cabudare', '1', 'a', '1987-01-01', 'f', 'f', NULL, 5000, 'A', 5, 1, 3),
(4, 'E_1', 'Eugenio', 'ddd', 'ddd', 'ddd', NULL, NULL, NULL, NULL, NULL, 45, 'd', 12, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `codigoestado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombreestado` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusestado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `codigoestado`, `nombreestado`, `estatusestado`) VALUES
(1, '1', 'Lara', 'A'),
(2, '2', 'Falcón', 'A'),
(3, '3', 'Zulia', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacompras`
--

CREATE TABLE IF NOT EXISTS `facturacompras` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_cond_prove` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `nro_factura` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `subtotal` float NOT NULL,
  `monto_iva` float NOT NULL,
  `monto_total` float NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondoreservas`
--

CREATE TABLE IF NOT EXISTS `fondoreservas` (
  `idfondoreserva` int(11) NOT NULL AUTO_INCREMENT,
  `codigofondoreserva` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrefondoreserva` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `objetivofondoreserva` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `cuentas` float NOT NULL,
  `montofijfondoreserva` float NOT NULL,
  `saldoactual` float NOT NULL,
  `estatusfondoreserva` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idcondominiofondoreserva` int(11) NOT NULL,
  PRIMARY KEY (`idfondoreserva`),
  KEY `fk_fondoreservas_condominios1_idx` (`idcondominiofondoreserva`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `fondoreservas`
--

INSERT INTO `fondoreservas` (`idfondoreserva`, `codigofondoreserva`, `nombrefondoreserva`, `objetivofondoreserva`, `cuentas`, `montofijfondoreserva`, `saldoactual`, `estatusfondoreserva`, `idcondominiofondoreserva`) VALUES
(1, '1', 'Fondo para Remodelaciones', 'Remodelar fachada del condominio', 0.1, 200000, 0, 'A', 1),
(2, '2', 'Fondo para Prestaciones Sociales', 'Prestaciones Sociales de Trabajadores', 0.1, 300000, 0, 'A', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapagos`
--

CREATE TABLE IF NOT EXISTS `formapagos` (
  `idformapagopago` int(11) NOT NULL AUTO_INCREMENT,
  `codigoformapago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionforma` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusformadepago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idformapagopago`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `formapagos`
--

INSERT INTO `formapagos` (`idformapagopago`, `codigoformapago`, `descripcionforma`, `estatusformadepago`) VALUES
(1, '1', 'Deposito', 'A'),
(2, '2', 'Transferencia', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencianotificaciones`
--

CREATE TABLE IF NOT EXISTS `frecuencianotificaciones` (
  `idfrecuencianotificaciones` int(11) NOT NULL,
  `codigofrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombrefrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusfrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idfrecuencianotificaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastogenerals`
--

CREATE TABLE IF NOT EXISTS `gastogenerals` (
  `id_gasto` int(11) NOT NULL AUTO_INCREMENT,
  `id_egreso` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `mes` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `monto` float NOT NULL,
  `estatus` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_gasto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `gastogenerals`
--

INSERT INTO `gastogenerals` (`id_gasto`, `id_egreso`, `id_pago`, `id_documento`, `fecha`, `mes`, `descripcion`, `monto`, `estatus`) VALUES
(1, 1, 0, 0, '2014-02-17', 0, '', 4789, 'NR'),
(2, 1, 0, 0, '2014-02-16', 0, '', 5000, 'NR'),
(3, 2, 0, 0, '2014-02-10', 0, '', 1000, 'NR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastoinmuebles`
--

CREATE TABLE IF NOT EXISTS `gastoinmuebles` (
  `id_gasto` int(11) NOT NULL AUTO_INCREMENT,
  `id_egreso` int(11) NOT NULL,
  `id_inmueble` int(11) NOT NULL,
  `id_cuota` int(11) NOT NULL,
  `refer` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id_gasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioareas`
--

CREATE TABLE IF NOT EXISTS `horarioareas` (
  `idhorarioarea` int(11) NOT NULL AUTO_INCREMENT,
  `codigohorario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `diahorario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  `estatushorario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idareacomun` int(11) NOT NULL,
  PRIMARY KEY (`idhorarioarea`),
  KEY `fk_horariopordiadeareas_areacomuns1_idx` (`idareacomun`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `horarioareas`
--

INSERT INTO `horarioareas` (`idhorarioarea`, `codigohorario`, `diahorario`, `horainicio`, `horafin`, `estatushorario`, `idareacomun`) VALUES
(1, '1', 'Martes', '11:00:00', '16:00:00', 'A', 1),
(2, '2', 'Miercoles', '11:00:00', '16:00:00', 'A', 1),
(3, '3', 'Jueves', '11:00:00', '16:00:00', 'A', 1),
(4, '4', 'Viernes', '11:00:00', '16:00:00', 'A', 1),
(5, '5', 'Sabado', '11:00:00', '16:00:00', 'A', 1),
(6, '6', 'Domingo', '11:00:00', '18:00:00', 'A', 1),
(7, '7', 'Lunes', '09:00:00', '21:00:00', 'A', 2),
(8, '8', 'Martes', '09:00:00', '21:00:00', 'A', 2),
(9, '9', 'Miercoles', '09:00:00', '21:00:00', 'A', 2),
(10, '10', 'Jueves', '09:00:00', '21:00:00', 'A', 2),
(11, '11', 'Viernes', '09:00:00', '21:00:00', 'A', 2),
(12, '12', 'Sabado', '09:00:00', '21:00:00', 'A', 2),
(13, '13', 'Domingo', '08:00:00', '21:00:00', 'A', 2),
(14, '14', 'Lunes', '09:00:00', '21:00:00', 'A', 3),
(15, '15', 'Martes', '09:00:00', '21:00:00', 'A', 3),
(16, '16', 'Miercoles', '09:00:00', '21:00:00', 'A', 3),
(17, '17', 'Jueves', '09:00:00', '21:00:00', 'A', 3),
(18, '18', 'Viernes', '09:00:00', '21:00:00', 'A', 3),
(19, '19', 'Sabado', '09:00:00', '21:00:00', 'A', 3),
(20, '20', 'Domingo', '08:00:00', '21:00:00', 'A', 3),
(21, '21', 'Viernes', '18:00:00', '03:00:00', 'A', 4),
(22, '22', 'Sabado', '18:00:00', '03:00:00', 'A', 4),
(23, '23', 'Viernes', '12:00:00', '03:00:00', 'A', 5),
(24, '24', 'Sabado', '12:00:00', '03:00:00', 'A', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariopordiadeempleados`
--

CREATE TABLE IF NOT EXISTS `horariopordiadeempleados` (
  `idhorariopordiadeempleado` int(11) NOT NULL AUTO_INCREMENT,
  `codigohorariopordiadeempleado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `diahorariopordiadeempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `horainiciohorariopordiadeempleado` time NOT NULL,
  `horafinhorariopordiadeempleado` time NOT NULL,
  `estatushorariopordiadeempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idempleadohorariopordiadeempleado` int(11) NOT NULL,
  PRIMARY KEY (`idhorariopordiadeempleado`),
  KEY `fk_horariopordiadeempleados_empleados1_idx` (`idempleadohorariopordiadeempleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `horariopordiadeempleados`
--

INSERT INTO `horariopordiadeempleados` (`idhorariopordiadeempleado`, `codigohorariopordiadeempleado`, `diahorariopordiadeempleado`, `horainiciohorariopordiadeempleado`, `horafinhorariopordiadeempleado`, `estatushorariopordiadeempleado`, `idempleadohorariopordiadeempleado`) VALUES
(1, '1', 'Lunes', '07:00:00', '13:00:00', 'A', 1),
(2, '2', 'Martes', '13:00:00', '21:00:00', 'A', 1),
(3, '3', 'Miercoles', '07:00:00', '13:00:00', 'A', 1),
(4, '4', 'Jueves', '13:00:00', '21:00:00', 'A', 1),
(5, '6', 'Viernes', '07:00:00', '13:00:00', 'A', 1),
(6, '6', 'Sabado', '13:00:00', '21:00:00', 'I', 1),
(7, '7', 'Domingo', '07:00:00', '13:00:00', 'I', 1),
(8, '8', 'Lunes', '07:00:00', '13:00:00', 'A', 2),
(9, '9', 'Miercoles', '07:00:00', '13:00:00', 'A', 2),
(10, '10', 'Jueves', '13:00:00', '21:00:00', 'A', 2),
(11, '11', 'Viernes', '07:00:00', '13:00:00', 'A', 2),
(12, '12', 'Sabado', '13:00:00', '21:00:00', 'I', 2),
(13, '13', 'Domingo', '07:00:00', '13:00:00', 'I', 2),
(14, '14', 'Martes', '07:00:00', '13:00:00', 'A', 2),
(15, '15', 'Miercoles', '07:00:00', '13:00:00', 'A', 3),
(16, '16', 'Jueves', '13:00:00', '21:00:00', 'A', 3),
(17, '17', 'Viernes', '07:00:00', '13:00:00', 'A', 3),
(18, '18', 'Sabado', '13:00:00', '21:00:00', 'I', 3),
(19, '19', 'Domingo', '07:00:00', '13:00:00', 'I', 3),
(20, '20', 'Martes', '07:00:00', '13:00:00', 'A', 3),
(21, '21', 'Lunes', '13:00:00', '21:00:00', 'A', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iingreso`
--

CREATE TABLE IF NOT EXISTS `iingreso` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `tipo` int(1) NOT NULL,
  PRIMARY KEY (`id_ingreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `iingreso`
--

INSERT INTO `iingreso` (`id_ingreso`, `descripcion`, `tipo`) VALUES
(1, 'Pago de Reservacion de Areas Comunes', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores`
--

CREATE TABLE IF NOT EXISTS `indicadores` (
  `idindicadores` int(11) NOT NULL AUTO_INCREMENT,
  `codigoindicadores` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreindicadores` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusindicadores` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idindicadores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresocondominios`
--

CREATE TABLE IF NOT EXISTS `ingresocondominios` (
  `id_ingreso_cond` int(11) NOT NULL AUTO_INCREMENT,
  `id_condominio` int(11) NOT NULL,
  `id_ingreso` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_ingreso_cond`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ingresocondominios`
--

INSERT INTO `ingresocondominios` (`id_ingreso_cond`, `id_condominio`, `id_ingreso`, `descripcion`) VALUES
(1, 0, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresoinmuebles`
--

CREATE TABLE IF NOT EXISTS `ingresoinmuebles` (
  `id_ingreso_inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `id_ingreso` int(11) NOT NULL,
  `id_inmueble` int(11) NOT NULL,
  `id_pago` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id_ingreso_inmueble`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ingresoinmuebles`
--

INSERT INTO `ingresoinmuebles` (`id_ingreso_inmueble`, `id_ingreso`, `id_inmueble`, `id_pago`, `monto`) VALUES
(1, 1, 1, '0', 1500),
(2, 1, 1, '0', 1500),
(3, 1, 1, '0', 1500),
(4, 1, 1, 'R_17', 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE IF NOT EXISTS `ingresos` (
  `idingresos` int(11) NOT NULL,
  `codigoingreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechaingreso` date NOT NULL,
  `montoingreso` float NOT NULL,
  `estatusingreso` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idpagoingreso` int(11) NOT NULL,
  `descripcioningreso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idcondominio` int(11) NOT NULL,
  `tipo` int(1) NOT NULL,
  PRIMARY KEY (`idingresos`),
  KEY `fk_ingresos_pagos1_idx` (`idpagoingreso`),
  KEY `fk_ingresos_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`idingresos`, `codigoingreso`, `fechaingreso`, `montoingreso`, `estatusingreso`, `idpagoingreso`, `descripcioningreso`, `idcondominio`, `tipo`) VALUES
(1, '1', '2014-01-01', 4000, 'A', 3, 'Venta de un activo', 1, 0),
(2, '2', '2014-01-01', 5000, 'A', 3, 'Venta de activo2', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE IF NOT EXISTS `inmuebles` (
  `idinmueble` int(11) NOT NULL AUTO_INCREMENT,
  `codigoinmueble` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `metroscuadradosinmueble` float NOT NULL,
  `alicuotainmueble` float NOT NULL,
  `descripcioninmueble` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `estatusinmueble` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `codigocatastralinmueble` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `idcopropietarioinmueble` int(11) NOT NULL,
  `idlogininmueble` int(11) NOT NULL,
  `idcondominioinmueble` int(11) NOT NULL,
  `piso` int(11) NOT NULL,
  `tipo_menu` int(11) NOT NULL DEFAULT '7',
  PRIMARY KEY (`idinmueble`),
  KEY `fk_inmuebles_copropietarios1_idx` (`idcopropietarioinmueble`),
  KEY `fk_inmuebles_logins1_idx` (`idlogininmueble`),
  KEY `fk_inmuebles_condominios1_idx` (`idcondominioinmueble`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `codigoinmueble`, `metroscuadradosinmueble`, `alicuotainmueble`, `descripcioninmueble`, `estatusinmueble`, `codigocatastralinmueble`, `idcopropietarioinmueble`, `idlogininmueble`, `idcondominioinmueble`, `piso`, `tipo_menu`) VALUES
(1, 'I_1', 200, 0.1, '1 baño, 2 cuartos', 'A', '0001', 1, 1, 0, 0, 7),
(2, '2', 200, 0.2, '2 baños, 3 cuartos', 'A', '0002', 2, 2, 1, 0, 0),
(3, '3', 450, 0.4, '3 baños, 5 cuartos', 'A', '0003', 3, 8, 0, 0, 0),
(4, '4', 200, 0.3, '2 baños, 3 cuartos', 'A', '0004', 4, 9, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE IF NOT EXISTS `inventarios` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `id_bien` int(11) NOT NULL,
  `id_condominio` int(11) NOT NULL,
  `existencia` float NOT NULL,
  `stock_minimo` float NOT NULL,
  `stock_maximo` float NOT NULL,
  PRIMARY KEY (`id_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juntacondominios`
--

CREATE TABLE IF NOT EXISTS `juntacondominios` (
  `idjuntacondominio` int(11) NOT NULL AUTO_INCREMENT,
  `codigojuntacondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechainicio` date NOT NULL,
  `fechaculminacion` date NOT NULL,
  `estatusvigenciacargo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusjuntacondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idloginjuntacondominio` int(11) NOT NULL,
  `idcargojuntacondominio` int(11) NOT NULL,
  `idcondominiocondominio` int(11) NOT NULL,
  `idcopropietario` int(11) NOT NULL,
  PRIMARY KEY (`idjuntacondominio`),
  KEY `fk_juntacondominios_logins1_idx` (`idloginjuntacondominio`),
  KEY `fk_juntacondominios_cargo1_idx` (`idcargojuntacondominio`),
  KEY `fk_juntacondominios_condominios1_idx` (`idcondominiocondominio`),
  KEY `fk_juntacondominios_copropietarios1_idx` (`idcopropietario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `juntacondominios`
--

INSERT INTO `juntacondominios` (`idjuntacondominio`, `codigojuntacondominio`, `fechainicio`, `fechaculminacion`, `estatusvigenciacargo`, `estatusjuntacondominio`, `idloginjuntacondominio`, `idcargojuntacondominio`, `idcondominiocondominio`, `idcopropietario`) VALUES
(1, 'M_1', '2014-01-01', '2015-01-01', 'A', 'A', 4, 4, 1, 1),
(2, '2', '2014-01-01', '2015-01-01', 'A', 'A', 10, 5, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `usuariologin` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `paswordlogin` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecharegistrologin` date NOT NULL,
  `estatuslogin` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idrollogin` int(11) DEFAULT NULL,
  `correo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idlogin`),
  KEY `fk_logins_rols1_idx` (`idrollogin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `logins`
--

INSERT INTO `logins` (`idlogin`, `codigo`, `usuariologin`, `paswordlogin`, `fecharegistrologin`, `estatuslogin`, `idrollogin`, `correo`) VALUES
(1, 'I_1', 'casa1', '1234', '2014-01-01', 'A', 1, ''),
(2, '', 'cas2', '123', '2014-01-01', 'A', 1, ''),
(3, '', 'emp', '123', '2014-01-01', 'A', 3, ''),
(4, 'M_1', 'juntee', '1234', '2014-01-01', 'A', 6, ''),
(5, '', 'empleado', '1234', '2014-01-01', 'A', 2, ''),
(6, '', 'Guachi', '123', '2014-01-01', 'A', 4, ''),
(7, '', 'superusuario', '1234', '2014-01-01', 'A', 5, ''),
(8, '', 'cas3', '123', '2014-01-01', 'A', 1, ''),
(9, '', 'cas4', '123', '2014-01-01', 'A', 1, ''),
(10, '', 'junta2', '123', '2014-01-01', 'A', 6, ''),
(11, '', 'xxxz', '1234', '2014-02-02', 'A', 5, ''),
(12, 'E_1', 'euge17', '123', '2014-02-18', 'A', NULL, 'dddd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `minutas`
--

CREATE TABLE IF NOT EXISTS `minutas` (
  `id_minuta` int(11) NOT NULL AUTO_INCREMENT,
  `id_asamblea` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_minuta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `minutas`
--

INSERT INTO `minutas` (`id_minuta`, `id_asamblea`, `descripcion`) VALUES
(1, 1, 'ffffffff'),
(2, 1, 'tttt458asss');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE IF NOT EXISTS `movimientos` (
  `idmovimientos` int(11) NOT NULL AUTO_INCREMENT,
  `codigomovimiento` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `montomovimiento` float NOT NULL,
  `cuentas_numerocuenta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `cuentas_idbancocuenta` int(11) NOT NULL,
  `idcondominiocuentamovimiento` int(11) NOT NULL,
  PRIMARY KEY (`idmovimientos`),
  KEY `fk_movimientos_cuentas1_idx` (`cuentas_numerocuenta`,`cuentas_idbancocuenta`,`idcondominiocuentamovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE IF NOT EXISTS `multas` (
  `idmulta` int(11) NOT NULL AUTO_INCREMENT,
  `codigomulta` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionmullta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `montomulta` float NOT NULL,
  `fechamulta` date NOT NULL,
  `idtipomultamulta` int(11) NOT NULL,
  `idinmueblemulta` int(11) NOT NULL,
  `idrecibocobro` int(11) NOT NULL,
  PRIMARY KEY (`idmulta`),
  KEY `fk_multas_tipomultas1_idx` (`idtipomultamulta`),
  KEY `fk_multas_inmuebles1_idx` (`idinmueblemulta`),
  KEY `fk_multas_recibocobros1_idx` (`idrecibocobro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `multas`
--

INSERT INTO `multas` (`idmulta`, `codigomulta`, `descripcionmullta`, `montomulta`, `fechamulta`, `idtipomultamulta`, `idinmueblemulta`, `idrecibocobro`) VALUES
(1, '1', 'Dano a Propiedad Comun', 2000, '2014-01-20', 2, 1, 1),
(2, '2', 'Danos de la mascota', 2000, '2014-01-09', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `codigomunicipio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombremunicipio` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `estatusmunicipio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idestadomunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `fk_municipios_estados1_idx` (`idestadomunicipio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`idmunicipio`, `codigomunicipio`, `nombremunicipio`, `estatusmunicipio`, `idestadomunicipio`) VALUES
(1, '1', 'Iribarren', 'A', 1),
(2, '2', 'Palavecino', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominaempleados`
--

CREATE TABLE IF NOT EXISTS `nominaempleados` (
  `idempleado` int(11) NOT NULL,
  `idnomina` int(11) NOT NULL,
  `fechanominaempleado` date NOT NULL,
  `sueldoneto` float NOT NULL,
  `asignacionesnominaempleado` float NOT NULL,
  `deduccionesnominaempleado` float NOT NULL,
  `sueldototal` float NOT NULL,
  `estatusnominaempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `nro_nomina` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_pago` date NOT NULL,
  `nro_movimiento` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idempleado`,`idnomina`),
  KEY `fk_nominaempleados_empleados1_idx` (`idempleado`),
  KEY `fk_nominaempleados_nominas1_idx` (`idnomina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

CREATE TABLE IF NOT EXISTS `nominas` (
  `idnomina` int(11) NOT NULL,
  `codigonominanomina` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechanomina` date NOT NULL,
  `sueldosbasestotalesnomina` float NOT NULL,
  `asignacionestotalesnomina` float NOT NULL,
  `deduccionestotalesnomina` float NOT NULL,
  `sueldostotalesnomina` float NOT NULL,
  `estatusnomina` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idegresonomina` int(11) NOT NULL,
  PRIMARY KEY (`idnomina`),
  KEY `fk_nominas_egresos1_idx` (`idegresonomina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE IF NOT EXISTS `noticias` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `codigonoticia` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechanoticia` date NOT NULL,
  `descripcionnoticia` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `nombrearchivonoticia` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatoarchivonoticia` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivonoticia` blob,
  `estatusnoticia` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idtiponoticiamaestronoticia` int(11) NOT NULL,
  `idloginnoticia` int(11) DEFAULT NULL,
  `cedulaautor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  `id_origen` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `tipo_mensaje` int(11) NOT NULL,
  `asunto` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tipo_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`idnoticia`),
  KEY `fk_noticias_tiponoticiamaestros1_idx` (`idtiponoticiamaestronoticia`),
  KEY `fk_noticias_logins1_idx` (`idloginnoticia`),
  KEY `fk_noticias_rols1_idx` (`idrol`),
  KEY `fk_noticias_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idnoticia`, `codigonoticia`, `fechanoticia`, `descripcionnoticia`, `nombrearchivonoticia`, `formatoarchivonoticia`, `archivonoticia`, `estatusnoticia`, `idtiponoticiamaestronoticia`, `idloginnoticia`, `cedulaautor`, `idrol`, `idcondominio`, `id_origen`, `id_destino`, `tipo_mensaje`, `asunto`, `tipo_solicitud`) VALUES
(1, '1', '2014-02-02', 'Asamblea urgente para tratar cambio de administrador', 'f', 'f', NULL, 'A', 2, 4, '123', 6, 0, 0, 0, 0, '', 0),
(2, '2', '2014-02-02', 'Suspendida la asamblea', 'f', 'f', NULL, 'A', 3, 4, '123', 6, 1, 0, 0, 0, '', 0),
(3, '2', '2014-01-02', 'cerrada la entrada principal', '', '', '', 'A', 3, 5, '1234544634', 3, 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagocuotas`
--

CREATE TABLE IF NOT EXISTS `pagocuotas` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_cuenta` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `pagocuotas`
--

INSERT INTO `pagocuotas` (`id_pago`, `id_cuenta`, `id_forma_pago`, `fecha`, `monto`) VALUES
(1, 108, 3, '2014-02-12', 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE IF NOT EXISTS `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `codigopago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionpago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nrodocumento` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `montopago` float NOT NULL,
  `validacionpago` tinyint(1) NOT NULL,
  `fechapago` date NOT NULL,
  `estatuspago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idformapagopago` int(11) NOT NULL,
  `idrazondepagopago` int(11) NOT NULL,
  `idreservacionpago` int(11) DEFAULT NULL,
  `idrecibocobropago` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  `cidepositante` varchar(8) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idbanco` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pagos_formapagos1_idx` (`idformapagopago`),
  KEY `fk_pagos_razondepagos1_idx` (`idrazondepagopago`),
  KEY `fk_pagos_reservacions1_idx` (`idreservacionpago`),
  KEY `fk_pagos_recibocobros1_idx` (`idrecibocobropago`),
  KEY `fk_pagos_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idpago`, `codigopago`, `descripcionpago`, `nrodocumento`, `montopago`, `validacionpago`, `fechapago`, `estatuspago`, `idformapagopago`, `idrazondepagopago`, `idreservacionpago`, `idrecibocobropago`, `idcondominio`, `cidepositante`, `idbanco`) VALUES
(1, '1', 'Pago del Mes de Febrero', '001', 1500, 0, '2014-03-01', 'A', 1, 1, NULL, 1, 1, '12345', 108),
(2, '2', 'Pago del Mes de Febrero Pendiente', '002', 100, 0, '2014-03-04', 'A', 1, 1, NULL, 1, 1, '12345', 108),
(3, '3', 'Pago por venta de activo', '002', 4000, 1, '2014-02-01', 'A', 1, 1, NULL, NULL, 1, '12345', 108),
(4, '4', '$descripcionpago', '9876', 100, 0, '2014-02-15', 'A', 1, 1, NULL, 1, 1, '123', 108),
(5, '4', 'xxx', '9876', 100, 0, '2014-02-15', 'A', 1, 1, NULL, 1, 1, '123', 108),
(6, '2', 'xxx', '1234', 100, 0, '2014-03-03', 'A', 1, 1, NULL, 1, 1, '123', 108),
(7, '2', 'xxx', '1234', 100, 0, '2014-03-03', 'A', 1, 1, NULL, 1, 1, '123', 108),
(8, '2', 'xxx', '1234', 100, 0, '2014-03-03', 'A', 1, 1, NULL, 1, 1, '123', 108),
(9, '2', 'xxx', '1234', 1000, 0, '2014-03-03', 'A', 1, 1, NULL, 1, 1, '123', 108),
(10, '2', 'xxx', '1234', 1000, 0, '2014-03-03', 'A', 1, 1, NULL, 1, 1, '123', 108),
(11, '2', 'xxx', '1234', 1000, 0, '2014-03-03', 'A', 1, 1, NULL, 1, 1, '123', 108),
(12, '2', 'xxx', '1234', 1000, 0, '2014-03-03', 'A', 1, 1, NULL, 2, 1, '123', 108);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `cedulapersona` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `primernombrepersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `segundonombrepersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `primerapellidopersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `segundoapellidopersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuspersona` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pproveedorcondominio`
--

CREATE TABLE IF NOT EXISTS `pproveedorcondominio` (
  `id_proveedor_cond` int(11) NOT NULL AUTO_INCREMENT,
  `id_condominio` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor_cond`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorcondominios`
--

CREATE TABLE IF NOT EXISTS `proveedorcondominios` (
  `id_proveedor_cond` int(11) NOT NULL AUTO_INCREMENT,
  `id_condominio` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `estatus` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_proveedor_cond`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE IF NOT EXISTS `proveedors` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `rifproveedor` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `razonsocialproveedor` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `correoproveedor` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoproveedor` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusproveesor` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `idciudadproveedor` int(11) NOT NULL,
  `nombreproveedor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccionproveedor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedors_ciudads1_idx` (`idciudadproveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`idproveedor`, `rifproveedor`, `razonsocialproveedor`, `correoproveedor`, `telefonoproveedor`, `estatusproveesor`, `idciudadproveedor`, `nombreproveedor`, `direccionproveedor`) VALUES
(1, 'J10', 'CA', 'a@gmail.com', '12345', 'A', 1, 'Proveedor1', NULL),
(2, 'J12', 'CA', 'b@gmail.com', '12345', 'A', 1, 'Proveedor2', NULL),
(3, 'J13', 'CA', 'c@gmail.com', '12345', 'A', 1, 'Proveedor3', NULL),
(4, 'J4', 'SA', 'p4@gmail.com', '12345', 'A', 1, 'proveedor4', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorxcondominios`
--

CREATE TABLE IF NOT EXISTS `proveedorxcondominios` (
  `idproveedorxcondominio` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedorproveedorxcndominio` int(11) NOT NULL,
  `idcondominioproveedorxcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idproveedorxcondominio`),
  KEY `fk_proveedorxcondominios_proveedors1_idx` (`idproveedorproveedorxcndominio`),
  KEY `fk_proveedorxcondominios_condominios1_idx` (`idcondominioproveedorxcondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `proveedorxcondominios`
--

INSERT INTO `proveedorxcondominios` (`idproveedorxcondominio`, `idproveedorproveedorxcndominio`, `idcondominioproveedorxcondominio`) VALUES
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(6, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorxservicios`
--

CREATE TABLE IF NOT EXISTS `proveedorxservicios` (
  `idproveedorxservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedorxcondominioproveedorxservicio` int(11) NOT NULL,
  `idservicioproveedorxservicio` int(11) NOT NULL,
  `estatusproveedorxservicio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `codigoproveedorxservicio` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproveedorxservicio`),
  KEY `fk_proveedorxservicios_proveedorxcondominios1_idx` (`idproveedorxcondominioproveedorxservicio`),
  KEY `fk_proveedorxservicios_servicios1_idx` (`idservicioproveedorxservicio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `proveedorxservicios`
--

INSERT INTO `proveedorxservicios` (`idproveedorxservicio`, `idproveedorxcondominioproveedorxservicio`, `idservicioproveedorxservicio`, `estatusproveedorxservicio`, `codigoproveedorxservicio`) VALUES
(1, 2, 1, 'A', '1'),
(2, 2, 2, 'A', '2'),
(3, 2, 3, 'A', '3'),
(4, 3, 1, 'A', '4'),
(5, 3, 5, 'A', '5'),
(6, 3, 4, 'A', '6'),
(7, 4, 6, 'A', '7'),
(8, 4, 1, 'A', '8'),
(9, 6, 1, 'A', '9'),
(10, 6, 7, 'A', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razondepagos`
--

CREATE TABLE IF NOT EXISTS `razondepagos` (
  `idrazondepago` int(11) NOT NULL AUTO_INCREMENT,
  `codigorazondepago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrerazondepago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrazondepago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrazondepago`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `razondepagos`
--

INSERT INTO `razondepagos` (`idrazondepago`, `codigorazondepago`, `nombrerazondepago`, `estatusrazondepago`) VALUES
(1, '1', 'Cancelar mensualidad', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibocobros`
--

CREATE TABLE IF NOT EXISTS `recibocobros` (
  `idrecibocobro` int(11) NOT NULL AUTO_INCREMENT,
  `codigorecibocobro` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecharecibocobro` date NOT NULL,
  `cuotapendienterecibo` float NOT NULL,
  `fechavencimientorecibo` date NOT NULL,
  `abonorecibocobro` float NOT NULL,
  `montorecibocobro` float NOT NULL,
  `estatuscancelacionrecibo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrecibocobro` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idinmueblerecibocobro` int(11) NOT NULL,
  PRIMARY KEY (`idrecibocobro`),
  KEY `fk_recibocobros_inmuebles1_idx` (`idinmueblerecibocobro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `recibocobros`
--

INSERT INTO `recibocobros` (`idrecibocobro`, `codigorecibocobro`, `fecharecibocobro`, `cuotapendienterecibo`, `fechavencimientorecibo`, `abonorecibocobro`, `montorecibocobro`, `estatuscancelacionrecibo`, `estatusrecibocobro`, `idinmueblerecibocobro`) VALUES
(1, '1', '2014-02-28', 0, '2014-03-29', 2600, 1600, 'pendiente', 'A', 1),
(2, '2', '2014-03-28', 1000, '2014-04-29', 1000, 2000, 'pendiente', 'A', 1),
(3, '3', '2014-02-28', 1600, '2014-03-29', 0, 1600, 'pendiente', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reciboxfondoreserva`
--

CREATE TABLE IF NOT EXISTS `reciboxfondoreserva` (
  `idreciboxfondoreserva` int(11) NOT NULL AUTO_INCREMENT,
  `idrecibocobroreciboxfondoreserva` int(11) NOT NULL,
  `fondoreservas_idfondoreserva` int(11) NOT NULL,
  PRIMARY KEY (`idreciboxfondoreserva`),
  KEY `fk_recibocobros_has_fondoreservas_fondoreservas1_idx` (`fondoreservas_idfondoreserva`),
  KEY `fk_recibocobros_has_fondoreservas_recibocobros1_idx` (`idrecibocobroreciboxfondoreserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamosugerencias`
--

CREATE TABLE IF NOT EXISTS `reclamosugerencias` (
  `idreclamosugerencia` int(11) NOT NULL AUTO_INCREMENT,
  `codigoreclamosugerencia` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `razonreclamosugerencia` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechareclamosugerencia` date NOT NULL,
  `descripcionreclamosugerencia` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `estatusreclamosugerencia` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idinmueblereclamosugerencia` int(11) NOT NULL,
  `codigoinmuebledestinatario` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idreclamosugerencia`),
  KEY `fk_reclamosugerencias_inmuebles1_idx` (`idinmueblereclamosugerencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `reclamosugerencias`
--

INSERT INTO `reclamosugerencias` (`idreclamosugerencia`, `codigoreclamosugerencia`, `razonreclamosugerencia`, `fechareclamosugerencia`, `descripcionreclamosugerencia`, `estatusreclamosugerencia`, `idinmueblereclamosugerencia`, `codigoinmuebledestinatario`) VALUES
(1, '1', 'Mascota causo daño a mi carro', '2014-02-02', 'El perro de la vecina me daño carroceria de mi automovil', 'A', 1, '2'),
(2, '2', 'Retraso en recoger la basura', '2014-02-05', 'Estan recogiendo la basura muy tarde y hay gusanos ya...', 'A', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacions`
--

CREATE TABLE IF NOT EXISTS `reservacions` (
  `idreservacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigoreservacion` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechareservacion` date DEFAULT NULL,
  `nombrelistainvitadosreservacion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatolistainvitadosreservacion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `listainvitadosreservacion` blob,
  `estatusreservacion` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `montoapagar` float DEFAULT NULL,
  `idareacomunreservacion` int(11) DEFAULT NULL,
  `idinmueblereservacion` int(11) DEFAULT NULL,
  `montoabonado` float DEFAULT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_forma_pago` int(11) DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `nro_movimiento` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idreservacion`),
  KEY `fk_reservacions_areacomuns1_idx` (`idareacomunreservacion`),
  KEY `fk_reservacions_inmuebles1_idx` (`idinmueblereservacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `reservacions`
--

INSERT INTO `reservacions` (`idreservacion`, `codigoreservacion`, `fechareservacion`, `nombrelistainvitadosreservacion`, `formatolistainvitadosreservacion`, `listainvitadosreservacion`, `estatusreservacion`, `montoapagar`, `idareacomunreservacion`, `idinmueblereservacion`, `montoabonado`, `descripcion`, `id_forma_pago`, `id_cuenta`, `fecha_emision`, `nro_movimiento`) VALUES
(1, '1', '2014-09-01', 'f', 'f', NULL, 'A', 2000, 1, 1, 233, '', 0, 0, '0000-00-00', ''),
(2, '2', '2014-03-03', 'f', 'f', NULL, 'A', 3444, 4, 2, 100, '', 0, 0, '0000-00-00', ''),
(3, '3', '2014-03-02', 'f', 'f', NULL, 'A', 2000, 4, 1, 1000, '', 0, 0, '0000-00-00', ''),
(4, '4', '2014-03-01', NULL, NULL, NULL, 'A', 2000, 4, 1, NULL, '', 0, 0, '0000-00-00', ''),
(5, '4', '2014-03-01', NULL, NULL, NULL, 'A', 2000, 4, 1, NULL, '', 0, 0, '0000-00-00', ''),
(6, '4', '2014-04-27', NULL, NULL, NULL, 'A', 2000, 4, 1, NULL, '', 0, 0, '0000-00-00', ''),
(10, NULL, '2014-03-11', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'gggg', 3, 108, '2014-02-12', '12345'),
(11, NULL, '2014-03-11', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'gggg', 3, 108, '2014-02-12', '12345'),
(12, NULL, '2014-03-11', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'gggg', 3, 108, '2014-02-12', '12345'),
(13, NULL, '2014-03-11', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'gggg', 3, 108, '2014-02-12', '12345'),
(14, NULL, '2014-03-11', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'gggg', 3, 108, '2014-02-12', '12345'),
(15, NULL, '2014-03-18', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'ggggg', 3, 108, '2014-02-12', '12345'),
(16, NULL, '2014-03-18', NULL, NULL, NULL, NULL, 1500, 2, 1, NULL, 'gggg', 3, 108, '2014-02-12', '12345'),
(17, NULL, '2014-04-23', NULL, NULL, NULL, NULL, 1500, 5, 1, NULL, 'ggggg', 2, 108, '2014-02-12', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE IF NOT EXISTS `rols` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `codigorol` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrerol` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrol` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `tipo_menu` int(11) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`idrol`, `codigorol`, `nombrerol`, `estatusrol`, `tipo_menu`) VALUES
(1, '1', 'Copropietario', 'A', 0),
(2, '2', 'Administrador', 'A', 0),
(3, '3', 'Empleado', 'A', 0),
(4, '4', 'Vigilante', 'A', 0),
(5, '5', 'superusuario', 'A', 0),
(6, '6', 'Junta de Condominio', 'A', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `codigoservicio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionservicio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusservicio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idservicio`, `codigoservicio`, `descripcionservicio`, `estatusservicio`) VALUES
(1, '1', 'Agua', 'A'),
(2, '2', 'Luz', 'A'),
(3, '3', 'Gas', 'A'),
(4, '4', 'Mantenimiento', 'A'),
(5, '5', 'Jardineria', 'A'),
(6, '6', 'Venta de Vidrios', 'A'),
(7, '7', 'Caminion de Basura', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superusuarios`
--

CREATE TABLE IF NOT EXISTS `superusuarios` (
  `idsuperusuario` int(11) NOT NULL AUTO_INCREMENT,
  `codigosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombresuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `apellidosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `telefonosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombrefotosuperusuario` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotosuperusuario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotosuperusuario` blob,
  `estatussuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idloginsuperusuario` int(11) NOT NULL,
  PRIMARY KEY (`idsuperusuario`),
  KEY `fk_superusuarios_logins1_idx` (`idloginsuperusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `superusuarios`
--

INSERT INTO `superusuarios` (`idsuperusuario`, `codigosuperusuario`, `nombresuperusuario`, `apellidosuperusuario`, `telefonosuperusuario`, `correosuperusuario`, `nombrefotosuperusuario`, `formatofotosuperusuario`, `fotosuperusuario`, `estatussuperusuario`, `idloginsuperusuario`) VALUES
(1, '1', 'Manuel', 'Perez', '1', 'a', 'f', 'f', NULL, 'A', 7),
(2, '2', 'Jorge', 'Perez', '1', 'a', NULL, NULL, NULL, 'A', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocondominios`
--

CREATE TABLE IF NOT EXISTS `tipocondominios` (
  `idtipocondominio` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipocondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombretipocondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatustipocondominio` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipocondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipocondominios`
--

INSERT INTO `tipocondominios` (`idtipocondominio`, `codigotipocondominio`, `nombretipocondominio`, `estatustipocondominio`) VALUES
(1, '1', 'Casas', 'A'),
(2, '2', 'Apartamento', 'A'),
(3, '3', 'Local Comercial', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoegresos`
--

CREATE TABLE IF NOT EXISTS `tipoegresos` (
  `idtipoegreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipoegreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombretipoegreso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatustipoegreso` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipoegreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipoegresos`
--

INSERT INTO `tipoegresos` (`idtipoegreso`, `codigotipoegreso`, `nombretipoegreso`, `estatustipoegreso`) VALUES
(1, '1', 'Ordinario', 'A'),
(2, '2', 'Extraordinario', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomultas`
--

CREATE TABLE IF NOT EXISTS `tipomultas` (
  `idtipomulta` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipomulta` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombremulta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatus` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipomulta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipomultas`
--

INSERT INTO `tipomultas` (`idtipomulta`, `codigotipomulta`, `nombremulta`, `estatus`) VALUES
(1, '1', 'Falta de Convivencia', 'A'),
(2, '2', 'Destruccion de propiedad comun', 'A'),
(3, '3', 'Daños causados por mascota', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiponoticiamaestros`
--

CREATE TABLE IF NOT EXISTS `tiponoticiamaestros` (
  `idtiponoticiamaestro` int(11) NOT NULL AUTO_INCREMENT,
  `nombretiponoticiamaestro` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatustiponoticiamaestro` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `codigotiponoticia` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtiponoticiamaestro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tiponoticiamaestros`
--

INSERT INTO `tiponoticiamaestros` (`idtiponoticiamaestro`, `nombretiponoticiamaestro`, `estatustiponoticiamaestro`, `codigotiponoticia`) VALUES
(1, 'Reunion', 'A', '1'),
(2, 'Asamblea', 'A', '2'),
(3, 'Informacion', 'A', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `idunidades` int(11) NOT NULL AUTO_INCREMENT,
  `codigounidades` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreunidades` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusunidades` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idunidades`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioporindicadores`
--

CREATE TABLE IF NOT EXISTS `usuarioporindicadores` (
  `idusuarioporindicadores` int(11) NOT NULL AUTO_INCREMENT,
  `codigousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `valordemetausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechametausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valoramarillousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valorrojousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valorverdeusuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechaamarillousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fecharojousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechaverdeusuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correoresponsablemetausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idindicadoresusuarioporindicadores` int(11) NOT NULL,
  `idrolusuarioporindicadores` int(11) NOT NULL,
  `idcondominiousuarioporindicadores` int(11) NOT NULL,
  `idfrecuencianotificacionesusuarioporindicadores` int(11) NOT NULL,
  `idunidadesusuarioporindicadores` int(11) NOT NULL,
  PRIMARY KEY (`idusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_indicadores1_idx` (`idindicadoresusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_rols1_idx` (`idrolusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_condominios1_idx` (`idcondominiousuarioporindicadores`),
  KEY `fk_usuarioporindicadores_frecuencianotificaciones1_idx` (`idfrecuencianotificacionesusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_unidades1_idx` (`idunidadesusuarioporindicadores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitantes`
--

CREATE TABLE IF NOT EXISTS `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `cedulavisitante` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `nombrevisitante` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidovisitante` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusvisitante` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idvisitante`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `visitantes`
--

INSERT INTO `visitantes` (`idvisitante`, `cedulavisitante`, `nombrevisitante`, `apellidovisitante`, `estatusvisitante`) VALUES
(1, '987', 'visitante1', 'visitante1', 'A'),
(2, '67809', 'visitante2', 'visitante2', 'A');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `areacomuns`
--
ALTER TABLE `areacomuns`
  ADD CONSTRAINT `fk_areacomuns_condominios1` FOREIGN KEY (`idcondominioareacomun`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ciudads`
--
ALTER TABLE `ciudads`
  ADD CONSTRAINT `fk_ciudades_municipios1` FOREIGN KEY (`idmunicipiociudad`) REFERENCES `municipios` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprobantedepagos`
--
ALTER TABLE `comprobantedepagos`
  ADD CONSTRAINT `fk_comprobantedepago_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominiocomprobantedepago`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `condominios`
--
ALTER TABLE `condominios`
  ADD CONSTRAINT `fk_condominios_ciudads1` FOREIGN KEY (`idciudadcondominio`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_condominios_tipocondominios1` FOREIGN KEY (`idtipocondominiocondominio`) REFERENCES `tipocondominios` (`idtipocondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `controlvisitas`
--
ALTER TABLE `controlvisitas`
  ADD CONSTRAINT `fk_controlvisitas_empleados1` FOREIGN KEY (`idempleadocontrolvisita`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_controlvisitas_inmuebles1` FOREIGN KEY (`idinmueblecontrolvisita`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_controlvisitas_visitantes1` FOREIGN KEY (`idvisitantecontrolvisita`) REFERENCES `visitantes` (`idvisitante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `copropietarios`
--
ALTER TABLE `copropietarios`
  ADD CONSTRAINT `fk_copropietarios_ciudads1` FOREIGN KEY (`idciudadcopropietario`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cotizacions`
--
ALTER TABLE `cotizacions`
  ADD CONSTRAINT `fk_cotizacions_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominiocotizacion`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `fk_cuentas_bancos1` FOREIGN KEY (`idbancocuenta`) REFERENCES `bancos` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuentas_condominios1` FOREIGN KEY (`idcondominiocuenta`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `fk_detallecomprobantecotizacionservicio_comprobantedepagos1` FOREIGN KEY (`idcomprobantedepagodetalle`) REFERENCES `comprobantedepagos` (`idcomprobantedepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detallecomprobantecotizacionservicio_cotizacions1` FOREIGN KEY (`idcotizaciondetalle`) REFERENCES `cotizacions` (`idcotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detallecomprobantecotizacionservicio_tipoegresos1` FOREIGN KEY (`idtipoegresodetalle`) REFERENCES `tipoegresos` (`idtipoegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalledecomprobante_proveedorxservicios1` FOREIGN KEY (`idproveedorxserviciodetalle`) REFERENCES `proveedorxservicios` (`idproveedorxservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalles_formapagos1` FOREIGN KEY (`idformapagodetalle`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresonocomunxinmuebles`
--
ALTER TABLE `egresonocomunxinmuebles`
  ADD CONSTRAINT `fk_egresonocomunxinmuebles_egresosnocomuns1` FOREIGN KEY (`idegresosnocomun`) REFERENCES `egresosnocomuns` (`idegresosnocomun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresonocomunxinmuebles_inmuebles1` FOREIGN KEY (`idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD CONSTRAINT `fk_egresos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresos_detalles1` FOREIGN KEY (`iddetalles`) REFERENCES `detalles` (`iddetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresos_formapagos1` FOREIGN KEY (`idformapagopago`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresosnocomuns`
--
ALTER TABLE `egresosnocomuns`
  ADD CONSTRAINT `fk_egresosnocomuns_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresosnocomuns_detalles1` FOREIGN KEY (`iddetalle`) REFERENCES `detalles` (`iddetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresoxrecibos`
--
ALTER TABLE `egresoxrecibos`
  ADD CONSTRAINT `fk_egresoxrecibocobroxinmuebles_egresos1` FOREIGN KEY (`idegreso`) REFERENCES `egresos` (`idegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1` FOREIGN KEY (`idrecibocobro`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresoxrecibo_egresonocomunxinmuebles1` FOREIGN KEY (`idegresonocomunxinmueble`) REFERENCES `egresonocomunxinmuebles` (`idegresonocomunxinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_cargo1` FOREIGN KEY (`idcargoempleado`) REFERENCES `cargos` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_condominios1` FOREIGN KEY (`idcondominioempleado`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_logins1` FOREIGN KEY (`idloginempleado`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fondoreservas`
--
ALTER TABLE `fondoreservas`
  ADD CONSTRAINT `fk_fondoreservas_condominios1` FOREIGN KEY (`idcondominiofondoreserva`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horarioareas`
--
ALTER TABLE `horarioareas`
  ADD CONSTRAINT `fk_horariopordiadeareas_areacomuns1` FOREIGN KEY (`idareacomun`) REFERENCES `areacomuns` (`idareacomun`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horariopordiadeempleados`
--
ALTER TABLE `horariopordiadeempleados`
  ADD CONSTRAINT `fk_horariopordiadeempleados_empleados1` FOREIGN KEY (`idempleadohorariopordiadeempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `fk_ingresos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingresos_pagos1` FOREIGN KEY (`idpagoingreso`) REFERENCES `pagos` (`idpago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `fk_inmuebles_condominios1` FOREIGN KEY (`idcondominioinmueble`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_copropietarios1` FOREIGN KEY (`idcopropietarioinmueble`) REFERENCES `copropietarios` (`idcopropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_logins1` FOREIGN KEY (`idlogininmueble`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `juntacondominios`
--
ALTER TABLE `juntacondominios`
  ADD CONSTRAINT `fk_juntacondominios_cargo1` FOREIGN KEY (`idcargojuntacondominio`) REFERENCES `cargos` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_juntacondominios_condominios1` FOREIGN KEY (`idcondominiocondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_juntacondominios_copropietarios1` FOREIGN KEY (`idcopropietario`) REFERENCES `copropietarios` (`idcopropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_juntacondominios_logins1` FOREIGN KEY (`idloginjuntacondominio`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `fk_logins_rols1` FOREIGN KEY (`idrollogin`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_movimientos_cuentas1` FOREIGN KEY (`cuentas_numerocuenta`, `cuentas_idbancocuenta`, `idcondominiocuentamovimiento`) REFERENCES `cuentas` (`numerocuenta`, `idbancocuenta`, `idcondominiocuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `fk_multas_inmuebles1` FOREIGN KEY (`idinmueblemulta`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_multas_recibocobros1` FOREIGN KEY (`idrecibocobro`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_multas_tipomultas1` FOREIGN KEY (`idtipomultamulta`) REFERENCES `tipomultas` (`idtipomulta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_municipios_estados1` FOREIGN KEY (`idestadomunicipio`) REFERENCES `estados` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nominaempleados`
--
ALTER TABLE `nominaempleados`
  ADD CONSTRAINT `fk_nominaempleados_empleados1` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nominaempleados_nominas1` FOREIGN KEY (`idnomina`) REFERENCES `nominas` (`idnomina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD CONSTRAINT `fk_nominas_egresos1` FOREIGN KEY (`idegresonomina`) REFERENCES `egresos` (`idegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_logins1` FOREIGN KEY (`idloginnoticia`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_rols1` FOREIGN KEY (`idrol`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_tiponoticiamaestros1` FOREIGN KEY (`idtiponoticiamaestronoticia`) REFERENCES `tiponoticiamaestros` (`idtiponoticiamaestro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_formapagos1` FOREIGN KEY (`idformapagopago`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_razondepagos1` FOREIGN KEY (`idrazondepagopago`) REFERENCES `razondepagos` (`idrazondepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_recibocobros1` FOREIGN KEY (`idrecibocobropago`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_reservacions1` FOREIGN KEY (`idreservacionpago`) REFERENCES `reservacions` (`idreservacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD CONSTRAINT `fk_proveedors_ciudads1` FOREIGN KEY (`idciudadproveedor`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedorxcondominios`
--
ALTER TABLE `proveedorxcondominios`
  ADD CONSTRAINT `fk_proveedorxcondominios_condominios1` FOREIGN KEY (`idcondominioproveedorxcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedorxcondominios_proveedors1` FOREIGN KEY (`idproveedorproveedorxcndominio`) REFERENCES `proveedors` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedorxservicios`
--
ALTER TABLE `proveedorxservicios`
  ADD CONSTRAINT `fk_proveedorxservicios_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominioproveedorxservicio`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedorxservicios_servicios1` FOREIGN KEY (`idservicioproveedorxservicio`) REFERENCES `servicios` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recibocobros`
--
ALTER TABLE `recibocobros`
  ADD CONSTRAINT `fk_recibocobros_inmuebles1` FOREIGN KEY (`idinmueblerecibocobro`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reciboxfondoreserva`
--
ALTER TABLE `reciboxfondoreserva`
  ADD CONSTRAINT `fk_recibocobros_has_fondoreservas_fondoreservas1` FOREIGN KEY (`fondoreservas_idfondoreserva`) REFERENCES `fondoreservas` (`idfondoreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recibocobros_has_fondoreservas_recibocobros1` FOREIGN KEY (`idrecibocobroreciboxfondoreserva`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reclamosugerencias`
--
ALTER TABLE `reclamosugerencias`
  ADD CONSTRAINT `fk_reclamosugerencias_inmuebles1` FOREIGN KEY (`idinmueblereclamosugerencia`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservacions`
--
ALTER TABLE `reservacions`
  ADD CONSTRAINT `fk_reservacions_areacomuns1` FOREIGN KEY (`idareacomunreservacion`) REFERENCES `areacomuns` (`idareacomun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservacions_inmuebles1` FOREIGN KEY (`idinmueblereservacion`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `superusuarios`
--
ALTER TABLE `superusuarios`
  ADD CONSTRAINT `fk_superusuarios_logins1` FOREIGN KEY (`idloginsuperusuario`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioporindicadores`
--
ALTER TABLE `usuarioporindicadores`
  ADD CONSTRAINT `fk_usuarioporindicadores_condominios1` FOREIGN KEY (`idcondominiousuarioporindicadores`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_frecuencianotificaciones1` FOREIGN KEY (`idfrecuencianotificacionesusuarioporindicadores`) REFERENCES `frecuencianotificaciones` (`idfrecuencianotificaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_indicadores1` FOREIGN KEY (`idindicadoresusuarioporindicadores`) REFERENCES `indicadores` (`idindicadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_rols1` FOREIGN KEY (`idrolusuarioporindicadores`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_unidades1` FOREIGN KEY (`idunidadesusuarioporindicadores`) REFERENCES `unidades` (`idunidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

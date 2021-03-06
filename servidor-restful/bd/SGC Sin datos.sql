SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `gestioncondominio` ;
CREATE SCHEMA IF NOT EXISTS `gestioncondominio` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci ;
USE `gestioncondominio` ;

-- -----------------------------------------------------
-- Table `gestioncondominio`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`estados` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `codigoestado` VARCHAR(15) NOT NULL,
  `nombreestado` VARCHAR(25) NOT NULL,
  `estatusestado` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`municipios` (
  `idmunicipio` INT NOT NULL AUTO_INCREMENT,
  `codigomunicipio` VARCHAR(15) NOT NULL,
  `nombremunicipio` VARCHAR(30) NOT NULL,
  `estatusmunicipio` VARCHAR(10) NOT NULL,
  `idestadomunicipio` INT NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  INDEX `fk_municipios_estados1_idx` (`idestadomunicipio` ASC),
  CONSTRAINT `fk_municipios_estados1`
    FOREIGN KEY (`idestadomunicipio`)
    REFERENCES `gestioncondominio`.`estados` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`ciudads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`ciudads` (
  `idciudad` INT NOT NULL AUTO_INCREMENT,
  `codigociudad` VARCHAR(15) NOT NULL,
  `nombreciudad` VARCHAR(25) NOT NULL,
  `estatusciudad` VARCHAR(10) NOT NULL,
  `idmunicipiociudad` INT NOT NULL,
  PRIMARY KEY (`idciudad`),
  INDEX `fk_ciudades_municipios1_idx` (`idmunicipiociudad` ASC),
  CONSTRAINT `fk_ciudades_municipios1`
    FOREIGN KEY (`idmunicipiociudad`)
    REFERENCES `gestioncondominio`.`municipios` (`idmunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`copropietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`copropietarios` (
  `idcopropietario` INT NOT NULL AUTO_INCREMENT,
  `cedulacopropietario` VARCHAR(10) NOT NULL,
  `nombrecopropietario` VARCHAR(25) NOT NULL,
  `apellidocopropietario` VARCHAR(25) NOT NULL,
  `correocopropietario` VARCHAR(25) NULL,
  `telefonocopropietario` VARCHAR(15) NULL,
  `fechacreacioncopropietario` DATE NOT NULL,
  `estatuscopropietario` VARCHAR(10) NOT NULL,
  `direccioncopropietario` VARCHAR(45) NULL,
  `fechanacimientocopropietario` DATE NOT NULL,
  `nombrefotocopropietario` VARCHAR(100) NULL,
  `formatofotocopropietario` VARCHAR(50) NULL,
  `fotocopropietario` BLOB NULL,
  `twittercopropietario` VARCHAR(15) NULL,
  `idciudadcopropietario` INT NOT NULL,
  INDEX `fk_copropietarios_ciudads1_idx` (`idciudadcopropietario` ASC),
  PRIMARY KEY (`idcopropietario`),
  CONSTRAINT `fk_copropietarios_ciudads1`
    FOREIGN KEY (`idciudadcopropietario`)
    REFERENCES `gestioncondominio`.`ciudads` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`rols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`rols` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `codigorol` VARCHAR(15) NOT NULL,
  `nombrerol` VARCHAR(25) NOT NULL,
  `estatusrol` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`logins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`logins` (
  `idlogin` INT NOT NULL AUTO_INCREMENT,
  `usuariologin` VARCHAR(250) NOT NULL,
  `paswordlogin` VARCHAR(15) NOT NULL,
  `fecharegistrologin` DATE NOT NULL,
  `estatuslogin` VARCHAR(10) NOT NULL,
  `idrollogin` INT NOT NULL,
  PRIMARY KEY (`idlogin`),
  INDEX `fk_logins_rols1_idx` (`idrollogin` ASC),
  CONSTRAINT `fk_logins_rols1`
    FOREIGN KEY (`idrollogin`)
    REFERENCES `gestioncondominio`.`rols` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`tipocondominios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`tipocondominios` (
  `idtipocondominio` INT NOT NULL AUTO_INCREMENT,
  `codigotipocondominio` VARCHAR(15) NOT NULL,
  `nombretipocondominio` VARCHAR(25) NOT NULL,
  `estatustipocondominio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipocondominio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`condominios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`condominios` (
  `idcondominio` INT NOT NULL AUTO_INCREMENT,
  `rifcondominio` VARCHAR(10) NOT NULL,
  `nombrecondominio` VARCHAR(25) NOT NULL,
  `direccioncondominio` VARCHAR(25) NOT NULL,
  `nombredocumentocondominio` VARCHAR(100) NULL,
  `formatodocumentocondominio` VARCHAR(50) NULL,
  `documentocondominio` BLOB NULL,
  `interesmoracondominio` FLOAT NOT NULL,
  `tiempomoracondominio` INT NOT NULL,
  `nombrefotocondominio` VARCHAR(100) NULL,
  `formatofotocondominio` VARCHAR(50) NULL,
  `fotocondominio` BLOB NULL,
  `estatuscondominio` VARCHAR(10) NOT NULL,
  `idciudadcondominio` INT NOT NULL,
  `idtipocondominiocondominio` INT NOT NULL,
  PRIMARY KEY (`idcondominio`),
  INDEX `fk_condominios_ciudads1_idx` (`idciudadcondominio` ASC),
  INDEX `fk_condominios_tipocondominios1_idx` (`idtipocondominiocondominio` ASC),
  CONSTRAINT `fk_condominios_ciudads1`
    FOREIGN KEY (`idciudadcondominio`)
    REFERENCES `gestioncondominio`.`ciudads` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_condominios_tipocondominios1`
    FOREIGN KEY (`idtipocondominiocondominio`)
    REFERENCES `gestioncondominio`.`tipocondominios` (`idtipocondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`inmuebles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`inmuebles` (
  `idinmueble` INT NOT NULL AUTO_INCREMENT,
  `codigoinmueble` VARCHAR(15) NOT NULL,
  `metroscuadradosinmueble` FLOAT NOT NULL,
  `alicuotainmueble` FLOAT NOT NULL,
  `descripcioninmueble` VARCHAR(150) NOT NULL,
  `estatusinmueble` VARCHAR(10) NOT NULL,
  `codigocatastralinmueble` VARCHAR(50) NOT NULL,
  `idcopropietarioinmueble` INT NOT NULL,
  `idlogininmueble` INT NOT NULL,
  `idcondominioinmueble` INT NOT NULL,
  PRIMARY KEY (`idinmueble`),
  INDEX `fk_inmuebles_copropietarios1_idx` (`idcopropietarioinmueble` ASC),
  INDEX `fk_inmuebles_logins1_idx` (`idlogininmueble` ASC),
  INDEX `fk_inmuebles_condominios1_idx` (`idcondominioinmueble` ASC),
  CONSTRAINT `fk_inmuebles_copropietarios1`
    FOREIGN KEY (`idcopropietarioinmueble`)
    REFERENCES `gestioncondominio`.`copropietarios` (`idcopropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_logins1`
    FOREIGN KEY (`idlogininmueble`)
    REFERENCES `gestioncondominio`.`logins` (`idlogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_condominios1`
    FOREIGN KEY (`idcondominioinmueble`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`reclamosugerencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`reclamosugerencias` (
  `idreclamosugerencia` INT NOT NULL AUTO_INCREMENT,
  `codigoreclamosugerencia` VARCHAR(30) NOT NULL,
  `razonreclamosugerencia` VARCHAR(50) NOT NULL,
  `fechareclamosugerencia` DATE NOT NULL,
  `descripcionreclamosugerencia` VARCHAR(250) NOT NULL,
  `estatusreclamosugerencia` VARCHAR(10) NOT NULL,
  `idinmueblereclamosugerencia` INT NOT NULL,
  `codigoinmuebledestinatario` VARCHAR(30) NULL,
  PRIMARY KEY (`idreclamosugerencia`),
  INDEX `fk_reclamosugerencias_inmuebles1_idx` (`idinmueblereclamosugerencia` ASC),
  CONSTRAINT `fk_reclamosugerencias_inmuebles1`
    FOREIGN KEY (`idinmueblereclamosugerencia`)
    REFERENCES `gestioncondominio`.`inmuebles` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`cargos` (
  `idcargo` INT NOT NULL AUTO_INCREMENT COMMENT '	',
  `codigocargo` VARCHAR(15) NOT NULL,
  `nombrecargo` VARCHAR(45) NOT NULL,
  `estatuscargo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`juntacondominios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`juntacondominios` (
  `idjuntacondominio` INT NOT NULL AUTO_INCREMENT,
  `codigojuntacondominio` VARCHAR(15) NOT NULL,
  `fechainicio` DATE NOT NULL,
  `fechaculminacion` DATE NOT NULL,
  `estatusvigenciacargo` VARCHAR(10) NOT NULL,
  `estatusjuntacondominio` VARCHAR(10) NOT NULL,
  `idloginjuntacondominio` INT NOT NULL,
  `idcargojuntacondominio` INT NOT NULL,
  `idcondominiocondominio` INT NOT NULL,
  `idcopropietario` INT NOT NULL,
  PRIMARY KEY (`idjuntacondominio`),
  INDEX `fk_juntacondominios_logins1_idx` (`idloginjuntacondominio` ASC),
  INDEX `fk_juntacondominios_cargo1_idx` (`idcargojuntacondominio` ASC),
  INDEX `fk_juntacondominios_condominios1_idx` (`idcondominiocondominio` ASC),
  INDEX `fk_juntacondominios_copropietarios1_idx` (`idcopropietario` ASC),
  CONSTRAINT `fk_juntacondominios_logins1`
    FOREIGN KEY (`idloginjuntacondominio`)
    REFERENCES `gestioncondominio`.`logins` (`idlogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_juntacondominios_cargo1`
    FOREIGN KEY (`idcargojuntacondominio`)
    REFERENCES `gestioncondominio`.`cargos` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_juntacondominios_condominios1`
    FOREIGN KEY (`idcondominiocondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_juntacondominios_copropietarios1`
    FOREIGN KEY (`idcopropietario`)
    REFERENCES `gestioncondominio`.`copropietarios` (`idcopropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`formapagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`formapagos` (
  `idformapagopago` INT NOT NULL AUTO_INCREMENT,
  `codigoformapago` VARCHAR(15) NOT NULL,
  `descripcionforma` VARCHAR(50) NOT NULL,
  `estatusformadepago` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idformapagopago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`razondepagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`razondepagos` (
  `idrazondepago` INT NOT NULL AUTO_INCREMENT,
  `codigorazondepago` VARCHAR(15) NOT NULL,
  `nombrerazondepago` VARCHAR(45) NOT NULL,
  `estatusrazondepago` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idrazondepago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`areacomuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`areacomuns` (
  `idareacomun` INT NOT NULL AUTO_INCREMENT,
  `codigoareacomun` VARCHAR(15) NOT NULL,
  `descripcionareacomun` VARCHAR(50) NOT NULL,
  `estatusareacomun` VARCHAR(2) NOT NULL,
  `capacidadareacomun` INT NOT NULL,
  `idcondominioareacomun` INT NOT NULL,
  `nombreareacomun` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idareacomun`),
  INDEX `fk_areacomuns_condominios1_idx` (`idcondominioareacomun` ASC),
  CONSTRAINT `fk_areacomuns_condominios1`
    FOREIGN KEY (`idcondominioareacomun`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`reservacions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`reservacions` (
  `idreservacion` INT NOT NULL AUTO_INCREMENT,
  `codigoreservacion` VARCHAR(15) NOT NULL,
  `fechareservacion` DATE NOT NULL,
  `nombrelistainvitadosreservacion` VARCHAR(100) NULL,
  `formatolistainvitadosreservacion` VARCHAR(50) NULL,
  `listainvitadosreservacion` BLOB NULL,
  `estatusreservacion` VARCHAR(10) NOT NULL,
  `montoapagar` FLOAT NOT NULL,
  `idareacomunreservacion` INT NOT NULL,
  `idinmueblereservacion` INT NOT NULL,
  `montoabonado` FLOAT NULL,
  PRIMARY KEY (`idreservacion`),
  INDEX `fk_reservacions_areacomuns1_idx` (`idareacomunreservacion` ASC),
  INDEX `fk_reservacions_inmuebles1_idx` (`idinmueblereservacion` ASC),
  CONSTRAINT `fk_reservacions_areacomuns1`
    FOREIGN KEY (`idareacomunreservacion`)
    REFERENCES `gestioncondominio`.`areacomuns` (`idareacomun`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservacions_inmuebles1`
    FOREIGN KEY (`idinmueblereservacion`)
    REFERENCES `gestioncondominio`.`inmuebles` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`recibocobros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`recibocobros` (
  `idrecibocobro` INT NOT NULL AUTO_INCREMENT,
  `codigorecibocobro` VARCHAR(15) NOT NULL,
  `fecharecibocobro` DATE NOT NULL,
  `cuotapendienterecibo` FLOAT NOT NULL,
  `fechavencimientorecibo` DATE NOT NULL,
  `abonorecibocobro` FLOAT NOT NULL,
  `montorecibocobro` FLOAT NOT NULL,
  `estatuscancelacionrecibo` VARCHAR(10) NOT NULL,
  `estatusrecibocobro` VARCHAR(10) NOT NULL,
  `idinmueblerecibocobro` INT NOT NULL,
  PRIMARY KEY (`idrecibocobro`),
  INDEX `fk_recibocobros_inmuebles1_idx` (`idinmueblerecibocobro` ASC),
  CONSTRAINT `fk_recibocobros_inmuebles1`
    FOREIGN KEY (`idinmueblerecibocobro`)
    REFERENCES `gestioncondominio`.`inmuebles` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`pagos` (
  `idpago` INT NOT NULL AUTO_INCREMENT,
  `codigopago` VARCHAR(15) NOT NULL,
  `descripcionpago` VARCHAR(45) NOT NULL,
  `nrodocumento` VARCHAR(20) NOT NULL,
  `montopago` FLOAT NOT NULL,
  `validacionpago` TINYINT(1) NOT NULL,
  `fechapago` DATE NOT NULL,
  `estatuspago` VARCHAR(10) NOT NULL,
  `idformapagopago` INT NOT NULL,
  `idrazondepagopago` INT NOT NULL,
  `idreservacionpago` INT NULL,
  `idrecibocobropago` INT NULL,
  `idcondominio` INT NOT NULL,
  `idbanco` INT NULL,
  `cidepositante` VARCHAR(8) NULL,
  PRIMARY KEY (`idpago`),
  INDEX `fk_pagos_formapagos1_idx` (`idformapagopago` ASC),
  INDEX `fk_pagos_razondepagos1_idx` (`idrazondepagopago` ASC),
  INDEX `fk_pagos_reservacions1_idx` (`idreservacionpago` ASC),
  INDEX `fk_pagos_recibocobros1_idx` (`idrecibocobropago` ASC),
  INDEX `fk_pagos_condominios1_idx` (`idcondominio` ASC),
  CONSTRAINT `fk_pagos_formapagos1`
    FOREIGN KEY (`idformapagopago`)
    REFERENCES `gestioncondominio`.`formapagos` (`idformapagopago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_razondepagos1`
    FOREIGN KEY (`idrazondepagopago`)
    REFERENCES `gestioncondominio`.`razondepagos` (`idrazondepago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_reservacions1`
    FOREIGN KEY (`idreservacionpago`)
    REFERENCES `gestioncondominio`.`reservacions` (`idreservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_recibocobros1`
    FOREIGN KEY (`idrecibocobropago`)
    REFERENCES `gestioncondominio`.`recibocobros` (`idrecibocobro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_condominios1`
    FOREIGN KEY (`idcondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`proveedors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`proveedors` (
  `idproveedor` INT NOT NULL AUTO_INCREMENT,
  `rifproveedor` VARCHAR(12) NOT NULL,
  `razonsocialproveedor` VARCHAR(25) NOT NULL,
  `correoproveedor` VARCHAR(15) NOT NULL,
  `telefonoproveedor` VARCHAR(45) NOT NULL,
  `estatusproveesor` VARCHAR(2) NOT NULL,
  `idciudadproveedor` INT NOT NULL,
  `nombreproveedor` VARCHAR(45) NULL,
  `direccionproveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idproveedor`),
  INDEX `fk_proveedors_ciudads1_idx` (`idciudadproveedor` ASC),
  CONSTRAINT `fk_proveedors_ciudads1`
    FOREIGN KEY (`idciudadproveedor`)
    REFERENCES `gestioncondominio`.`ciudads` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`proveedorxcondominios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`proveedorxcondominios` (
  `idproveedorxcondominio` INT NOT NULL AUTO_INCREMENT,
  `idproveedorproveedorxcndominio` INT NOT NULL,
  `idcondominioproveedorxcondominio` INT NOT NULL,
  INDEX `fk_proveedorxcondominios_proveedors1_idx` (`idproveedorproveedorxcndominio` ASC),
  INDEX `fk_proveedorxcondominios_condominios1_idx` (`idcondominioproveedorxcondominio` ASC),
  PRIMARY KEY (`idproveedorxcondominio`),
  CONSTRAINT `fk_proveedorxcondominios_proveedors1`
    FOREIGN KEY (`idproveedorproveedorxcndominio`)
    REFERENCES `gestioncondominio`.`proveedors` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedorxcondominios_condominios1`
    FOREIGN KEY (`idcondominioproveedorxcondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`comprobantedepagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`comprobantedepagos` (
  `idcomprobantedepago` INT NOT NULL AUTO_INCREMENT,
  `codigocomprobantedepago` VARCHAR(15) NOT NULL,
  `descripcioncomprobantedepago` VARCHAR(50) NULL,
  `fechacomprobantedepago` DATE NOT NULL,
  `montototalcomprobante` FLOAT NOT NULL,
  `nombrearchivocomprobantedepago` VARCHAR(100) NULL,
  `formatoarchivocomprobantedepago` VARCHAR(50) NULL,
  `archivocomprobantedepago` BLOB NULL,
  `estatuscomprobantedepago` VARCHAR(10) NULL,
  `idproveedorxcondominiocomprobantedepago` INT NOT NULL,
  PRIMARY KEY (`idcomprobantedepago`),
  INDEX `fk_comprobantedepago_proveedorxcondominios1_idx` (`idproveedorxcondominiocomprobantedepago` ASC),
  CONSTRAINT `fk_comprobantedepago_proveedorxcondominios1`
    FOREIGN KEY (`idproveedorxcondominiocomprobantedepago`)
    REFERENCES `gestioncondominio`.`proveedorxcondominios` (`idproveedorxcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`cotizacions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`cotizacions` (
  `idcotizacion` INT NOT NULL AUTO_INCREMENT,
  `codigocotizacion` VARCHAR(15) NOT NULL,
  `descripcioncotizacion` VARCHAR(45) NULL,
  `fechacotizacioncotizacion` DATE NOT NULL,
  `fechavencimientocotizacioncotizacion` VARCHAR(45) NOT NULL,
  `aprobacioncotizacion` TINYINT(1) NOT NULL,
  `montocotizacion` FLOAT NOT NULL,
  `estatuscotizacion` VARCHAR(10) NOT NULL,
  `idproveedorxcondominiocotizacion` INT NOT NULL,
  PRIMARY KEY (`idcotizacion`),
  INDEX `fk_cotizacions_proveedorxcondominios1_idx` (`idproveedorxcondominiocotizacion` ASC),
  CONSTRAINT `fk_cotizacions_proveedorxcondominios1`
    FOREIGN KEY (`idproveedorxcondominiocotizacion`)
    REFERENCES `gestioncondominio`.`proveedorxcondominios` (`idproveedorxcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`tipoegresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`tipoegresos` (
  `idtipoegreso` INT NOT NULL AUTO_INCREMENT,
  `codigotipoegreso` VARCHAR(15) NOT NULL,
  `nombretipoegreso` VARCHAR(45) NOT NULL,
  `estatustipoegreso` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idtipoegreso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`servicios` (
  `idservicio` INT NOT NULL AUTO_INCREMENT,
  `codigoservicio` VARCHAR(15) NOT NULL,
  `descripcionservicio` VARCHAR(50) NOT NULL,
  `estatusservicio` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`proveedorxservicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`proveedorxservicios` (
  `idproveedorxservicio` INT NOT NULL AUTO_INCREMENT,
  `idproveedorxcondominioproveedorxservicio` INT NOT NULL,
  `idservicioproveedorxservicio` INT NOT NULL,
  `estatusproveedorxservicio` VARCHAR(10) NOT NULL,
  `codigoproveedorxservicio` VARCHAR(15) NULL,
  PRIMARY KEY (`idproveedorxservicio`),
  INDEX `fk_proveedorxservicios_proveedorxcondominios1_idx` (`idproveedorxcondominioproveedorxservicio` ASC),
  INDEX `fk_proveedorxservicios_servicios1_idx` (`idservicioproveedorxservicio` ASC),
  CONSTRAINT `fk_proveedorxservicios_proveedorxcondominios1`
    FOREIGN KEY (`idproveedorxcondominioproveedorxservicio`)
    REFERENCES `gestioncondominio`.`proveedorxcondominios` (`idproveedorxcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedorxservicios_servicios1`
    FOREIGN KEY (`idservicioproveedorxservicio`)
    REFERENCES `gestioncondominio`.`servicios` (`idservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`detalles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`detalles` (
  `iddetalle` INT NOT NULL AUTO_INCREMENT,
  `idcomprobantedepagodetalle` INT NULL,
  `idcotizaciondetalle` INT NULL,
  `descripciondetalle` VARCHAR(50) NOT NULL,
  `montodetalle` FLOAT NOT NULL,
  `idtipoegresodetalle` INT NOT NULL,
  `idproveedorxserviciodetalle` INT NOT NULL,
  `idformapagodetalle` INT NOT NULL,
  INDEX `fk_detallecomprobantecotizacionservicio_comprobantedepagos1_idx` (`idcomprobantedepagodetalle` ASC),
  INDEX `fk_detallecomprobantecotizacionservicio_cotizacions1_idx` (`idcotizaciondetalle` ASC),
  PRIMARY KEY (`iddetalle`),
  INDEX `fk_detallecomprobantecotizacionservicio_tipoegresos1_idx` (`idtipoegresodetalle` ASC),
  INDEX `fk_detalledecomprobante_proveedorxservicios1_idx` (`idproveedorxserviciodetalle` ASC),
  INDEX `fk_detalles_formapagos1_idx` (`idformapagodetalle` ASC),
  CONSTRAINT `fk_detallecomprobantecotizacionservicio_comprobantedepagos1`
    FOREIGN KEY (`idcomprobantedepagodetalle`)
    REFERENCES `gestioncondominio`.`comprobantedepagos` (`idcomprobantedepago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallecomprobantecotizacionservicio_cotizacions1`
    FOREIGN KEY (`idcotizaciondetalle`)
    REFERENCES `gestioncondominio`.`cotizacions` (`idcotizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallecomprobantecotizacionservicio_tipoegresos1`
    FOREIGN KEY (`idtipoegresodetalle`)
    REFERENCES `gestioncondominio`.`tipoegresos` (`idtipoegreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalledecomprobante_proveedorxservicios1`
    FOREIGN KEY (`idproveedorxserviciodetalle`)
    REFERENCES `gestioncondominio`.`proveedorxservicios` (`idproveedorxservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_formapagos1`
    FOREIGN KEY (`idformapagodetalle`)
    REFERENCES `gestioncondominio`.`formapagos` (`idformapagopago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`egresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`egresos` (
  `idegreso` INT NOT NULL AUTO_INCREMENT,
  `codigoegreso` VARCHAR(15) NOT NULL,
  `descripcionegreso` VARCHAR(25) NOT NULL,
  `fechaegreso` DATE NOT NULL,
  `montoegreso` FLOAT NOT NULL,
  `estatusegreso` VARCHAR(2) NOT NULL,
  `iddetalles` INT NULL,
  `idcondominio` INT NOT NULL,
  `idformapagopago` INT NOT NULL,
  PRIMARY KEY (`idegreso`),
  INDEX `fk_egresos_detalles1_idx` (`iddetalles` ASC),
  INDEX `fk_egresos_condominios1_idx` (`idcondominio` ASC),
  INDEX `fk_egresos_formapagos1_idx` (`idformapagopago` ASC),
  CONSTRAINT `fk_egresos_detalles1`
    FOREIGN KEY (`iddetalles`)
    REFERENCES `gestioncondominio`.`detalles` (`iddetalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresos_condominios1`
    FOREIGN KEY (`idcondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresos_formapagos1`
    FOREIGN KEY (`idformapagopago`)
    REFERENCES `gestioncondominio`.`formapagos` (`idformapagopago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`egresosnocomuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`egresosnocomuns` (
  `idegresosnocomun` INT NOT NULL AUTO_INCREMENT,
  `codigonocomun` VARCHAR(15) NOT NULL,
  `descripcionnocomun` VARCHAR(25) NOT NULL,
  `montonocomuns` FLOAT NOT NULL,
  `fechanocomun` DATE NOT NULL,
  `estatusegresonocomun` VARCHAR(10) NOT NULL,
  `iddetalle` INT NOT NULL,
  `idcondominio` INT NOT NULL,
  `egresosnocomunscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idegresosnocomun`),
  INDEX `fk_egresosnocomuns_detalles1_idx` (`iddetalle` ASC),
  INDEX `fk_egresosnocomuns_condominios1_idx` (`idcondominio` ASC),
  CONSTRAINT `fk_egresosnocomuns_detalles1`
    FOREIGN KEY (`iddetalle`)
    REFERENCES `gestioncondominio`.`detalles` (`iddetalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresosnocomuns_condominios1`
    FOREIGN KEY (`idcondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`egresonocomunxinmuebles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`egresonocomunxinmuebles` (
  `idegresonocomunxinmueble` INT NOT NULL AUTO_INCREMENT,
  `idegresosnocomun` INT NOT NULL,
  `idinmueble` INT NOT NULL,
  `estatusegresonocomunxinmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idegresonocomunxinmueble`),
  INDEX `fk_egresonocomunxinmuebles_egresosnocomuns1_idx` (`idegresosnocomun` ASC),
  INDEX `fk_egresonocomunxinmuebles_inmuebles1_idx` (`idinmueble` ASC),
  CONSTRAINT `fk_egresonocomunxinmuebles_egresosnocomuns1`
    FOREIGN KEY (`idegresosnocomun`)
    REFERENCES `gestioncondominio`.`egresosnocomuns` (`idegresosnocomun`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresonocomunxinmuebles_inmuebles1`
    FOREIGN KEY (`idinmueble`)
    REFERENCES `gestioncondominio`.`inmuebles` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`egresoxrecibos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`egresoxrecibos` (
  `idegresoxrecibo` INT NOT NULL AUTO_INCREMENT,
  `montoegresoxrecibo` FLOAT NOT NULL,
  `estatusegresoxrecibo` VARCHAR(10) NOT NULL,
  `idrecibocobro` INT NOT NULL,
  `idegreso` INT NULL,
  `idegresonocomunxinmueble` INT NULL,
  INDEX `fk_egresoxrecibocobroxinmuebles_egresos1_idx` (`idegreso` ASC),
  INDEX `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1_idx` (`idrecibocobro` ASC),
  PRIMARY KEY (`idegresoxrecibo`),
  INDEX `fk_egresoxrecibo_egresonocomunxinmuebles1_idx` (`idegresonocomunxinmueble` ASC),
  CONSTRAINT `fk_egresoxrecibocobroxinmuebles_egresos1`
    FOREIGN KEY (`idegreso`)
    REFERENCES `gestioncondominio`.`egresos` (`idegreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1`
    FOREIGN KEY (`idrecibocobro`)
    REFERENCES `gestioncondominio`.`recibocobros` (`idrecibocobro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresoxrecibo_egresonocomunxinmuebles1`
    FOREIGN KEY (`idegresonocomunxinmueble`)
    REFERENCES `gestioncondominio`.`egresonocomunxinmuebles` (`idegresonocomunxinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`ingresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`ingresos` (
  `idingresos` INT NOT NULL,
  `codigoingreso` VARCHAR(15) NOT NULL,
  `fechaingreso` DATE NOT NULL,
  `montoingreso` FLOAT NOT NULL,
  `estatusingreso` VARCHAR(10) NOT NULL,
  `idpagoingreso` INT NOT NULL,
  `descripcioningreso` VARCHAR(45) NOT NULL,
  `idcondominio` INT NOT NULL,
  PRIMARY KEY (`idingresos`),
  INDEX `fk_ingresos_pagos1_idx` (`idpagoingreso` ASC),
  INDEX `fk_ingresos_condominios1_idx` (`idcondominio` ASC),
  CONSTRAINT `fk_ingresos_pagos1`
    FOREIGN KEY (`idpagoingreso`)
    REFERENCES `gestioncondominio`.`pagos` (`idpago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresos_condominios1`
    FOREIGN KEY (`idcondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`bancos` (
  `idbanco` INT NOT NULL AUTO_INCREMENT,
  `codigocondominio` VARCHAR(15) NOT NULL,
  `nombrebanco` VARCHAR(25) NOT NULL,
  `rifbanco` VARCHAR(10) NOT NULL,
  `estatusbanco` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idbanco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`empleados` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `cedulaempledo` VARCHAR(10) NOT NULL,
  `nombreempledo` VARCHAR(25) NOT NULL,
  `apellidoempledo` VARCHAR(25) NOT NULL,
  `direccionempledo` VARCHAR(50) NOT NULL,
  `telefonoempledo` VARCHAR(15) NOT NULL,
  `correoempledo` VARCHAR(25) NULL,
  `fechanacimientoempleado` DATE NULL,
  `nombrefotoempleado` VARCHAR(100) NULL,
  `formatofotoempleado` VARCHAR(50) NULL,
  `fotoempleado` BLOB NULL,
  `sueldobase` FLOAT NOT NULL,
  `estatusempleado` VARCHAR(10) NOT NULL,
  `idloginempleado` INT NOT NULL,
  `idcondominioempleado` INT NOT NULL,
  `idcargoempleado` INT NOT NULL,
  PRIMARY KEY (`idempleado`),
  INDEX `fk_empleados_logins1_idx` (`idloginempleado` ASC),
  INDEX `fk_empleados_condominios1_idx` (`idcondominioempleado` ASC),
  INDEX `fk_empleados_cargo1_idx` (`idcargoempleado` ASC),
  CONSTRAINT `fk_empleados_logins1`
    FOREIGN KEY (`idloginempleado`)
    REFERENCES `gestioncondominio`.`logins` (`idlogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_condominios1`
    FOREIGN KEY (`idcondominioempleado`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_cargo1`
    FOREIGN KEY (`idcargoempleado`)
    REFERENCES `gestioncondominio`.`cargos` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`nominas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`nominas` (
  `idnomina` INT NOT NULL,
  `codigonominanomina` VARCHAR(15) NOT NULL,
  `fechanomina` DATE NOT NULL,
  `sueldosbasestotalesnomina` FLOAT NOT NULL,
  `asignacionestotalesnomina` FLOAT NOT NULL,
  `deduccionestotalesnomina` FLOAT NOT NULL,
  `sueldostotalesnomina` FLOAT NOT NULL,
  `estatusnomina` VARCHAR(10) NOT NULL,
  `idegresonomina` INT NOT NULL,
  PRIMARY KEY (`idnomina`),
  INDEX `fk_nominas_egresos1_idx` (`idegresonomina` ASC),
  CONSTRAINT `fk_nominas_egresos1`
    FOREIGN KEY (`idegresonomina`)
    REFERENCES `gestioncondominio`.`egresos` (`idegreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`nominaempleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`nominaempleados` (
  `idempleado` INT NOT NULL,
  `idnomina` INT NOT NULL,
  `fechanominaempleado` DATE NOT NULL,
  `sueldoneto` FLOAT NOT NULL,
  `asignacionesnominaempleado` FLOAT NOT NULL,
  `deduccionesnominaempleado` FLOAT NOT NULL,
  `sueldototal` FLOAT NOT NULL,
  `estatusnominaempleado` VARCHAR(10) NOT NULL,
  INDEX `fk_nominaempleados_empleados1_idx` (`idempleado` ASC),
  INDEX `fk_nominaempleados_nominas1_idx` (`idnomina` ASC),
  PRIMARY KEY (`idempleado`, `idnomina`),
  CONSTRAINT `fk_nominaempleados_empleados1`
    FOREIGN KEY (`idempleado`)
    REFERENCES `gestioncondominio`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nominaempleados_nominas1`
    FOREIGN KEY (`idnomina`)
    REFERENCES `gestioncondominio`.`nominas` (`idnomina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`visitantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`visitantes` (
  `idvisitante` INT NOT NULL AUTO_INCREMENT,
  `cedulavisitante` VARCHAR(11) NOT NULL,
  `nombrevisitante` VARCHAR(25) NOT NULL,
  `apellidovisitante` VARCHAR(25) NOT NULL,
  `estatusvisitante` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idvisitante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`controlvisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`controlvisitas` (
  `idcontrolvisita` INT NOT NULL AUTO_INCREMENT,
  `codigocontrolvisita` VARCHAR(15) NOT NULL,
  `fechavisita` DATE NOT NULL,
  `horavisita` TIME NOT NULL,
  `idvisitantecontrolvisita` INT NOT NULL,
  `idempleadocontrolvisita` INT NOT NULL,
  `idinmueblecontrolvisita` INT NOT NULL,
  `estatuscontrolvisita` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idcontrolvisita`),
  INDEX `fk_controlvisitas_visitantes1_idx` (`idvisitantecontrolvisita` ASC),
  INDEX `fk_controlvisitas_empleados1_idx` (`idempleadocontrolvisita` ASC),
  INDEX `fk_controlvisitas_inmuebles1_idx` (`idinmueblecontrolvisita` ASC),
  CONSTRAINT `fk_controlvisitas_visitantes1`
    FOREIGN KEY (`idvisitantecontrolvisita`)
    REFERENCES `gestioncondominio`.`visitantes` (`idvisitante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controlvisitas_empleados1`
    FOREIGN KEY (`idempleadocontrolvisita`)
    REFERENCES `gestioncondominio`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controlvisitas_inmuebles1`
    FOREIGN KEY (`idinmueblecontrolvisita`)
    REFERENCES `gestioncondominio`.`inmuebles` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`cuentas` (
  `numerocuenta` VARCHAR(20) NOT NULL,
  `idbancocuenta` INT NOT NULL,
  `idcondominiocuenta` INT NOT NULL,
  `cedulatitularcuenta` VARCHAR(10) NOT NULL,
  `nombretitularcuenta` VARCHAR(25) NOT NULL,
  `tipocuenta` VARCHAR(10) NOT NULL,
  `saldodisponible` VARCHAR(45) NOT NULL,
  `descripcionbanco` VARCHAR(50) NOT NULL,
  INDEX `fk_cuentas_bancos1_idx` (`idbancocuenta` ASC),
  INDEX `fk_cuentas_condominios1_idx` (`idcondominiocuenta` ASC),
  PRIMARY KEY (`numerocuenta`, `idbancocuenta`, `idcondominiocuenta`),
  CONSTRAINT `fk_cuentas_bancos1`
    FOREIGN KEY (`idbancocuenta`)
    REFERENCES `gestioncondominio`.`bancos` (`idbanco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuentas_condominios1`
    FOREIGN KEY (`idcondominiocuenta`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`horarioareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`horarioareas` (
  `idhorarioarea` INT NOT NULL AUTO_INCREMENT,
  `codigohorario` VARCHAR(15) NOT NULL,
  `diahorario` VARCHAR(10) NOT NULL,
  `horainicio` TIME NOT NULL,
  `horafin` TIME NOT NULL,
  `estatushorario` VARCHAR(45) NOT NULL,
  `idareacomun` INT NOT NULL,
  PRIMARY KEY (`idhorarioarea`),
  INDEX `fk_horariopordiadeareas_areacomuns1_idx` (`idareacomun` ASC),
  CONSTRAINT `fk_horariopordiadeareas_areacomuns1`
    FOREIGN KEY (`idareacomun`)
    REFERENCES `gestioncondominio`.`areacomuns` (`idareacomun`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`tiponoticiamaestros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`tiponoticiamaestros` (
  `idtiponoticiamaestro` INT NOT NULL AUTO_INCREMENT,
  `nombretiponoticiamaestro` VARCHAR(45) NOT NULL,
  `estatustiponoticiamaestro` VARCHAR(45) NOT NULL,
  `codigotiponoticia` VARCHAR(45) NULL,
  PRIMARY KEY (`idtiponoticiamaestro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`noticias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`noticias` (
  `idnoticia` INT NOT NULL AUTO_INCREMENT,
  `codigonoticia` VARCHAR(50) NOT NULL,
  `fechanoticia` DATE NOT NULL,
  `descripcionnoticia` VARCHAR(100) NOT NULL,
  `nombrearchivonoticia` VARCHAR(100) NULL,
  `formatoarchivonoticia` VARCHAR(50) NULL,
  `archivonoticia` BLOB NULL,
  `estatusnoticia` VARCHAR(45) NOT NULL,
  `idtiponoticiamaestronoticia` INT NOT NULL,
  `idloginnoticia` INT NULL,
  `cedulaautor` VARCHAR(45) NULL,
  `idrol` INT NULL,
  `idcondominio` INT NOT NULL,
  PRIMARY KEY (`idnoticia`),
  INDEX `fk_noticias_tiponoticiamaestros1_idx` (`idtiponoticiamaestronoticia` ASC),
  INDEX `fk_noticias_logins1_idx` (`idloginnoticia` ASC),
  INDEX `fk_noticias_rols1_idx` (`idrol` ASC),
  INDEX `fk_noticias_condominios1_idx` (`idcondominio` ASC),
  CONSTRAINT `fk_noticias_tiponoticiamaestros1`
    FOREIGN KEY (`idtiponoticiamaestronoticia`)
    REFERENCES `gestioncondominio`.`tiponoticiamaestros` (`idtiponoticiamaestro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticias_logins1`
    FOREIGN KEY (`idloginnoticia`)
    REFERENCES `gestioncondominio`.`logins` (`idlogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticias_rols1`
    FOREIGN KEY (`idrol`)
    REFERENCES `gestioncondominio`.`rols` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticias_condominios1`
    FOREIGN KEY (`idcondominio`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`fondoreservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`fondoreservas` (
  `idfondoreserva` INT NOT NULL AUTO_INCREMENT,
  `codigofondoreserva` VARCHAR(15) NOT NULL,
  `nombrefondoreserva` VARCHAR(45) NOT NULL,
  `objetivofondoreserva` VARCHAR(45) NOT NULL,
  `cuentas` FLOAT NOT NULL,
  `montofijfondoreserva` FLOAT NOT NULL,
  `saldoactual` FLOAT NOT NULL,
  `estatusfondoreserva` VARCHAR(10) NOT NULL,
  `idcondominiofondoreserva` INT NOT NULL,
  PRIMARY KEY (`idfondoreserva`),
  INDEX `fk_fondoreservas_condominios1_idx` (`idcondominiofondoreserva` ASC),
  CONSTRAINT `fk_fondoreservas_condominios1`
    FOREIGN KEY (`idcondominiofondoreserva`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`tipomultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`tipomultas` (
  `idtipomulta` INT NOT NULL AUTO_INCREMENT,
  `codigotipomulta` VARCHAR(15) NOT NULL,
  `nombremulta` VARCHAR(45) NOT NULL,
  `estatus` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idtipomulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`multas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`multas` (
  `idmulta` INT NOT NULL AUTO_INCREMENT,
  `codigomulta` VARCHAR(15) NOT NULL,
  `descripcionmullta` VARCHAR(45) NOT NULL,
  `montomulta` FLOAT NOT NULL,
  `fechamulta` DATE NOT NULL,
  `idtipomultamulta` INT NOT NULL,
  `idinmueblemulta` INT NOT NULL,
  `idrecibocobro` INT NOT NULL,
  PRIMARY KEY (`idmulta`),
  INDEX `fk_multas_tipomultas1_idx` (`idtipomultamulta` ASC),
  INDEX `fk_multas_inmuebles1_idx` (`idinmueblemulta` ASC),
  INDEX `fk_multas_recibocobros1_idx` (`idrecibocobro` ASC),
  CONSTRAINT `fk_multas_tipomultas1`
    FOREIGN KEY (`idtipomultamulta`)
    REFERENCES `gestioncondominio`.`tipomultas` (`idtipomulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_multas_inmuebles1`
    FOREIGN KEY (`idinmueblemulta`)
    REFERENCES `gestioncondominio`.`inmuebles` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_multas_recibocobros1`
    FOREIGN KEY (`idrecibocobro`)
    REFERENCES `gestioncondominio`.`recibocobros` (`idrecibocobro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`indicadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`indicadores` (
  `idindicadores` INT NOT NULL AUTO_INCREMENT,
  `codigoindicadores` VARCHAR(45) NULL,
  `nombreindicadores` VARCHAR(25) NOT NULL,
  `estatusindicadores` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idindicadores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`unidades` (
  `idunidades` INT NOT NULL AUTO_INCREMENT,
  `codigounidades` VARCHAR(50) NULL,
  `nombreunidades` VARCHAR(45) NOT NULL,
  `estatusunidades` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idunidades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`frecuencianotificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`frecuencianotificaciones` (
  `idfrecuencianotificaciones` INT NOT NULL,
  `codigofrecuencianotificaciones` VARCHAR(45) NULL,
  `nombrefrecuencianotificaciones` VARCHAR(45) NOT NULL,
  `estatusfrecuencianotificaciones` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfrecuencianotificaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`usuarioporindicadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`usuarioporindicadores` (
  `idusuarioporindicadores` INT NOT NULL AUTO_INCREMENT,
  `codigousuarioporindicadores` VARCHAR(45) NULL,
  `valordemetausuarioporindicadores` VARCHAR(45) NOT NULL,
  `fechametausuarioporindicadores` VARCHAR(45) NOT NULL,
  `valoramarillousuarioporindicadores` VARCHAR(45) NOT NULL,
  `valorrojousuarioporindicadores` VARCHAR(45) NOT NULL,
  `valorverdeusuarioporindicadores` VARCHAR(45) NOT NULL,
  `fechaamarillousuarioporindicadores` VARCHAR(45) NOT NULL,
  `fecharojousuarioporindicadores` VARCHAR(45) NOT NULL,
  `fechaverdeusuarioporindicadores` VARCHAR(45) NOT NULL,
  `correoresponsablemetausuarioporindicadores` VARCHAR(45) NOT NULL,
  `idindicadoresusuarioporindicadores` INT NOT NULL,
  `idrolusuarioporindicadores` INT NOT NULL,
  `idcondominiousuarioporindicadores` INT NOT NULL,
  `idfrecuencianotificacionesusuarioporindicadores` INT NOT NULL,
  `idunidadesusuarioporindicadores` INT NOT NULL,
  PRIMARY KEY (`idusuarioporindicadores`),
  INDEX `fk_usuarioporindicadores_indicadores1_idx` (`idindicadoresusuarioporindicadores` ASC),
  INDEX `fk_usuarioporindicadores_rols1_idx` (`idrolusuarioporindicadores` ASC),
  INDEX `fk_usuarioporindicadores_condominios1_idx` (`idcondominiousuarioporindicadores` ASC),
  INDEX `fk_usuarioporindicadores_frecuencianotificaciones1_idx` (`idfrecuencianotificacionesusuarioporindicadores` ASC),
  INDEX `fk_usuarioporindicadores_unidades1_idx` (`idunidadesusuarioporindicadores` ASC),
  CONSTRAINT `fk_usuarioporindicadores_indicadores1`
    FOREIGN KEY (`idindicadoresusuarioporindicadores`)
    REFERENCES `gestioncondominio`.`indicadores` (`idindicadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_rols1`
    FOREIGN KEY (`idrolusuarioporindicadores`)
    REFERENCES `gestioncondominio`.`rols` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_condominios1`
    FOREIGN KEY (`idcondominiousuarioporindicadores`)
    REFERENCES `gestioncondominio`.`condominios` (`idcondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_frecuencianotificaciones1`
    FOREIGN KEY (`idfrecuencianotificacionesusuarioporindicadores`)
    REFERENCES `gestioncondominio`.`frecuencianotificaciones` (`idfrecuencianotificaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioporindicadores_unidades1`
    FOREIGN KEY (`idunidadesusuarioporindicadores`)
    REFERENCES `gestioncondominio`.`unidades` (`idunidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`superusuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`superusuarios` (
  `idsuperusuario` INT NOT NULL AUTO_INCREMENT,
  `codigosuperusuario` VARCHAR(45) NOT NULL,
  `nombresuperusuario` VARCHAR(45) NOT NULL,
  `apellidosuperusuario` VARCHAR(45) NOT NULL,
  `telefonosuperusuario` VARCHAR(45) NOT NULL,
  `correosuperusuario` VARCHAR(45) NOT NULL,
  `nombrefotosuperusuario` VARCHAR(100) NULL,
  `formatofotosuperusuario` VARCHAR(50) NULL,
  `fotosuperusuario` BLOB NULL,
  `estatussuperusuario` VARCHAR(45) NOT NULL,
  `idloginsuperusuario` INT NOT NULL,
  PRIMARY KEY (`idsuperusuario`),
  INDEX `fk_superusuarios_logins1_idx` (`idloginsuperusuario` ASC),
  CONSTRAINT `fk_superusuarios_logins1`
    FOREIGN KEY (`idloginsuperusuario`)
    REFERENCES `gestioncondominio`.`logins` (`idlogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`horariopordiadeempleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`horariopordiadeempleados` (
  `idhorariopordiadeempleado` INT NOT NULL AUTO_INCREMENT,
  `codigohorariopordiadeempleado` VARCHAR(15) NOT NULL,
  `diahorariopordiadeempleado` DATE NOT NULL,
  `horainiciohorariopordiadeempleado` TIME NOT NULL,
  `horafinhorariopordiadeempleado` TIME NOT NULL,
  `estatushorariopordiadeempleado` VARCHAR(10) NOT NULL,
  `idempleadohorariopordiadeempleado` INT NOT NULL,
  PRIMARY KEY (`idhorariopordiadeempleado`),
  INDEX `fk_horariopordiadeempleados_empleados1_idx` (`idempleadohorariopordiadeempleado` ASC),
  CONSTRAINT `fk_horariopordiadeempleados_empleados1`
    FOREIGN KEY (`idempleadohorariopordiadeempleado`)
    REFERENCES `gestioncondominio`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`personas` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `cedulapersona` VARCHAR(10) NOT NULL,
  `primernombrepersona` VARCHAR(45) NOT NULL,
  `segundonombrepersona` VARCHAR(45) NOT NULL,
  `primerapellidopersona` VARCHAR(45) NOT NULL,
  `segundoapellidopersona` VARCHAR(45) NOT NULL,
  `estatuspersona` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`movimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`movimientos` (
  `idmovimientos` INT NOT NULL AUTO_INCREMENT,
  `codigomovimiento` VARCHAR(50) NOT NULL,
  `montomovimiento` FLOAT NOT NULL,
  `cuentas_numerocuenta` VARCHAR(20) NOT NULL,
  `cuentas_idbancocuenta` INT NOT NULL,
  `idcondominiocuentamovimiento` INT NOT NULL,
  PRIMARY KEY (`idmovimientos`),
  INDEX `fk_movimientos_cuentas1_idx` (`cuentas_numerocuenta` ASC, `cuentas_idbancocuenta` ASC, `idcondominiocuentamovimiento` ASC),
  CONSTRAINT `fk_movimientos_cuentas1`
    FOREIGN KEY (`cuentas_numerocuenta` , `cuentas_idbancocuenta` , `idcondominiocuentamovimiento`)
    REFERENCES `gestioncondominio`.`cuentas` (`numerocuenta` , `idbancocuenta` , `idcondominiocuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`reciboxfondoreserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`reciboxfondoreserva` (
  `idreciboxfondoreserva` INT NOT NULL AUTO_INCREMENT,
  `idrecibocobroreciboxfondoreserva` INT NOT NULL,
  `fondoreservas_idfondoreserva` INT NOT NULL,
  INDEX `fk_recibocobros_has_fondoreservas_fondoreservas1_idx` (`fondoreservas_idfondoreserva` ASC),
  INDEX `fk_recibocobros_has_fondoreservas_recibocobros1_idx` (`idrecibocobroreciboxfondoreserva` ASC),
  PRIMARY KEY (`idreciboxfondoreserva`),
  CONSTRAINT `fk_recibocobros_has_fondoreservas_recibocobros1`
    FOREIGN KEY (`idrecibocobroreciboxfondoreserva`)
    REFERENCES `gestioncondominio`.`recibocobros` (`idrecibocobro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibocobros_has_fondoreservas_fondoreservas1`
    FOREIGN KEY (`fondoreservas_idfondoreserva`)
    REFERENCES `gestioncondominio`.`fondoreservas` (`idfondoreserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestioncondominio`.`arbols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioncondominio`.`arbols` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` INT(11) NULL,
  `text` VARCHAR(25) NULL,
  `vinculo` VARCHAR(100) NULL,
  `padre_id` INT(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

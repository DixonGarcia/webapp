<?php
/*********************************************************************************/
/*                 Despachador.php
/*********************************************************************************/
/*
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/
require_once("LibreriadelDespachador.php");
class Despachador {

 function despachar()
 {
  $servicio = $_REQUEST['servicio'];
  $objServicio = new Servicios();
  switch ($servicio) {
//Servicios del Sistema SGC
    case 1:
        //Servicio buscar una persona dada su cedula
  	$cedula = $_REQUEST['cedula'];
        $contenido = $objServicio->Servicio001($cedula);
        break;
    case 2:
        //Servicio buscar todos los estados de Venezuela
        $contenido = $objServicio->Servicio002();
        break;
    case 3:
        //Servicio buscar todos los municipios de un estado
	$estado = $_REQUEST['estado'];
        $contenido = $objServicio->Servicio003($estado);
        break;
    case 4:
        //Servicio buscar todas las ciudades de un estado
	$estado = $_REQUEST['estado'];
        $contenido = $objServicio->Servicio004($estado);
        break;
    case 5:
        //Servicio buscar todas las ciudades de un municipio de un estado
	$municipio = $_REQUEST['municipio'];
	$estado = $_REQUEST['estado'];
        $contenido = $objServicio->Servicio005($municipio,$estado);
        break;
    case 6:
        //Servicio buscar RIF
	$rif = $_REQUEST['rif'];
        $contenido = $objServicio->Servicio006($rif);
        break;
    case 7:
        //Servicio Consultar Cuenta Bancaria
	$cuentabancaria = $_REQUEST['cuentabancaria'];
        $contenido = $objServicio->Servicio007($cuentabancaria);
        break;

    case 8:
        //Servicio Abonar TDC
	$numtarjeta = $_REQUEST['numtarjeta'];
	$cedtitular= $_REQUEST['cedtitular'];
	$mesexpiracion= $_REQUEST['mesexpiracion'];
	$annoexpiracion= $_REQUEST['annoexpiracion'];
	$codseguridad= $_REQUEST['codseguridad'];
	$monto= $_REQUEST['monto'];
        $contenido = $objServicio->Servicio008($numtarjeta,$cedtitular,$mesexpiracion,$annoexpiracion,$codseguridad,$monto);
        break;
    case 9:
        //Servicio Validar Transaccion Bancaria
	$numreferencia = $_REQUEST['numreferencia'];
	$idbanco= $_REQUEST['idbanco'];
	$cedula= $_REQUEST['cedula'];
	$monto= $_REQUEST['monto'];
	$fecha= $_REQUEST['fecha'];
	$contenido = $objServicio->Servicio009($numreferencia,$idbanco,$cedula,$monto,$fecha);
        break;
    case 10:
        //Servicio Consultar Bancos
	$contenido = $objServicio->Servicio010();
        break;
    case 11:
        //Servicio Verificar Copropietario de Inmueble
	$cedpropietario = $_REQUEST['cedcopropietario'];
	$codcatastral= $_REQUEST['codcatastral'];
	$contenido = $objServicio->Servicio011($cedpropietario,$codcatastral);
        break;
    case 12:
        //Servicio Consultar Inmueble
	$codcatastral= $_REQUEST['codcatastral'];
	$contenido = $objServicio->Servicio012($codcatastral);
        break;
//Servicios para los móviles
    case 13:
        //Servicio Listado de Areas Comunes
	$idcondominio= $_REQUEST['idcondominio'];
	$contenido = $objServicio->Servicio013($idcondominio);
        break;
    case 14:
        //Servicio Consultar Reservacion de Area Comun por id de reservacion
	$idreservacion= $_REQUEST['idreservacion'];
	$contenido = $objServicio->Servicio014($idreservacion);
        break;
    case 15:
        //Servicio Listado de Reservaciones de Areas Comunes en rango de fechas
	$idcondominio= $_REQUEST['idcondominio'];
	$fecha1= $_REQUEST['fecha1'];
	$fecha2= $_REQUEST['fecha2'];
	$contenido = $objServicio->Servicio015($idcondominio, $fecha1, $fecha2);
        break;
    case 16:
        //Servicio Registrar Reservacion de Area Comun 
	$codigoreservacion=$_REQUEST['codigoreservacion']; 
	$fechareservacion=$_REQUEST['fechareservacion']; 
	$estatusreservacion=$_REQUEST['estatusreservacion']; 
	$montoapagar=$_REQUEST['montoapagar']; 
	$idareacomunreservacion=$_REQUEST['idareacomun']; 
	$idinmueblereservacion=$_REQUEST['idinmueble'];
	$contenido = $objServicio->Servicio016($codigoreservacion, $fechareservacion, $estatusreservacion, $montoapagar, $idareacomunreservacion, $idinmueblereservacion);
        break;
    case 17:
        //Servicio Consultar Disponibilidad de Area Comun en una fecha
	$fecha=$_REQUEST['fecha']; 
	$idarea=$_REQUEST['idareacomun']; 
	$idcondominio=$_REQUEST['idcondominio'];
	$contenido = $objServicio->Servicio017($idarea, $idcondominio, $fecha);
        break;
    case 18:
        //Servicio Consultar Total por cobrar del  Condominio en recibos de cobro 
	$idcondominio=$_REQUEST['idcondominio'];
	$contenido = $objServicio->Servicio018($idcondominio);
        break;
    case 19:
 		//Servicio Consultar listado de todos los Recibos  de Cobro de un Condominio por estatus
	$idcondominio=$_REQUEST['idcondominio'];
	$estatus=strtolower($_REQUEST['estatus']);
	$contenido = $objServicio->Servicio019($idcondominio, $estatus);
        break;
   case 20:
 		//Servicio Listado de todos los Condominios
 		$contenido=$objServicio->Servicio020();
        break;
   case 21:
 		//Servicio Consultar Copropietario
 		$cedula=$_REQUEST['cedula'];
 		$contenido=$objServicio->Servicio021($cedula);
        break;
   
   case 22:
 		//Servicio Listado de Copropietarios
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio022($idcondominio);
        break;
   
   case 23:
 		//Servicio Listado de Cuentas Bancarias
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio023($idcondominio);
        break;
   case 24:
 		//Servicio Consultar Egreso
 		$idegreso=$_REQUEST['idegreso'];
 		$contenido=$objServicio->Servicio024($idegreso);
        break;
   case 25:
 		//Servicio Listado Egresos Comunes de un recibo
 		$idrecibo=$_REQUEST['idrecibo'];
 		$contenido=$objServicio->Servicio025($idrecibo);
        break;
   case 26:
 		//Servicio Listado Egresos No Comunes de un recibo
 		$idrecibo=$_REQUEST['idrecibo'];
 		$contenido=$objServicio->Servicio026($idrecibo);
        break;
   case 27:
 		//Servicio Listado Egresos Comunes en rango de fechas
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$contenido=$objServicio->Servicio027($idcondominio, $fecha1, $fecha2);
        break;
   case 28:
 		//Servicio Actualizar Empleado
 		$cedula=$_REQUEST['cedula'];
 		$direccion=$_REQUEST['direccion'];
 		$telefono=$_REQUEST['telefono'];
 		$correo=$_REQUEST['correo'];
 		$contenido=$objServicio->Servicio028($cedula, $direccion, $telefono, $correo);
        break;
   case 29:
 		//Servicio Consultar Empleado
 		$idempleado=$_REQUEST['idempleado'];
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio029($idempleado, $idcondominio);
        break;
  case 30:
 		//Servicio Listado Empleados
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio030($idcondominio);
        break;
  case 31:
 		//Servicio Listado de Pagos de Nomina de Empleados
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$idempleado=$_REQUEST['idempleado'];
 		$contenido=$objServicio->Servicio031($idcondominio,$idempleado, $fecha1, $fecha2);
        break;
  case 32:
 		//Servicio Listado de Fondos de Reserva
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio032($idcondominio);
        break;
  case 33:
 		//Servicio Consultar Ingreso
 		$idingreso=$_REQUEST['idingreso'];
 		$contenido=$objServicio->Servicio033($idingreso);
        break;
  case 34:
 		//Servicio Listado de Ingresos
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$contenido=$objServicio->Servicio034($idcondominio, $fecha1, $fecha2);
        break;
  case 35:
 		//Servicio Consultar Deuda de Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idinmueble=$_REQUEST['idinmueble'];
 		$contenido=$objServicio->Servicio035($idinmueble, $idcondominio);
        break;
  case 36:
 		//Servicio Consultar Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idinmueble=$_REQUEST['idinmueble'];
 		$contenido=$objServicio->Servicio036($idinmueble, $idcondominio);
        break;
  case 37:
 		//Servicio Listado Inmuebles de Copropietario
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idcopropietario=$_REQUEST['idcopropietario'];
 		$contenido=$objServicio->Servicio037($idcondominio, $idcopropietario);
        break;
  case 38:
 		//Servicio Consultar Recibo de Cobro de Inmueble por mes
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idinmueble=$_REQUEST['idinmueble'];
 		$mes=$_REQUEST['mes'];
 		$contenido=$objServicio->Servicio038($idinmueble, $idcondominio, $mes);
        break;
  case 39:
 		//Servicio Listado de Recibos de Cobro de Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$codigoinmueble=$_REQUEST['codigoinmueble'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$estatus=strtolower($_REQUEST['estatus']);
 		$contenido=$objServicio->Servicio039($idcondominio, $codigoinmueble, $fecha1, $fecha2, $estatus);
        break;
        
  case 40:
 		//Servicio Listado de Inmuebles de un Condominio
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio040($idcondominio);
        break;
  case 41:
 		//Servicio Listado de Inmuebles Morosos de un Condominio
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio041($idcondominio);
        break;
  case 42:
 		//Servicio Listado de Recibos de Pago de Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$codigoinmueble=$_REQUEST['codigoinmueble'];
 		$npagos=$_REQUEST['npagos'];
 		$contenido=$objServicio->Servicio042($codigoinmueble, $idcondominio, $npagos);
        break;
  case 43:
 		//Servicio Consultar Junta Condominio Actual
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio043($idcondominio);
        break;
  case 44:
 		//Servicio Listado de Telefonos de personas
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio044($idcondominio);
        break;
  case 45:
 		//Servicio Listado de Multas de Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idinmueble=$_REQUEST['idinmueble'];
 		$contenido=$objServicio->Servicio045($idinmueble, $idcondominio);
        break;
  case 46:
 		//Servicio Listado de Multas de Condominio
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$contenido=$objServicio->Servicio046($idcondominio, $fecha1, $fecha2);
        break;
  case 47:
 		//Servicio Listado de Noticias de Condominio
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$nnoticias=$_REQUEST['nnoticias'];
 		$contenido=$objServicio->Servicio047($idcondominio, $fecha1, $fecha2, $nnoticias);
        break;
  case 48:
 		//Servicio Consultar Reclamo/Sugerencia
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idreclamosugerencia=$_REQUEST['idreclamosugerencia'];
 		$contenido=$objServicio->Servicio048($idcondominio, $idreclamosugerencia);
        break;
  case 49:
 		//Servicio Listado Reclamo/Sugerencia hechas por Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idinmueble=$_REQUEST['idinmueble'];
 		$contenido=$objServicio->Servicio049($idcondominio, $idinmueble);
        break;
  case 50:
 		//Servicio Registrar Noticia
 		$idcondominio=$_REQUEST['idcondominio'];
 		$codigonoticia=$_REQUEST['codigonoticia'];
 		$fechanoticia=$_REQUEST['fechanoticia']; 
 		$descripcionnoticia=$_REQUEST['descripcionnoticia']; 
 		$estatusnoticia=$_REQUEST['estatusnoticia']; 
 		$idtiponoticiamaestronoticia=$_REQUEST['idtiponoticiamaestronoticia']; 
 		$idloginnoticia=$_REQUEST['idloginnoticia']; 
 		$cedulaautor=$_REQUEST['cedulaautor']; 
 		$idrol=$_REQUEST['idrol'];
 		$archivonoticia=$_REQUEST['archivonoticia']; 
 		$nombrearchivo=$_REQUEST['nombrearchivonoticia']; 
 		$formatoarchivonoticia=$_REQUEST['formatoarchivonoticia'];
 		$contenido=$objServicio->Servicio050($codigonoticia, $fechanoticia, $descripcionnoticia,
 		$estatusnoticia,$idtiponoticiamaestronoticia, $idloginnoticia, $cedulaautor, $idrol, $idcondominio, 
 		$nombrearchivo, $archivonoticia, $formatoarchivonoticia);
        break;
  case 51:
 		//Servicio Consultar Pago
 		$idpago=$_REQUEST['idpago'];
 		$contenido=$objServicio->Servicio051($idpago);
        break;
  case 52:
 		//Servicio Listado Formas de Pago
 		$contenido=$objServicio->Servicio052();
        break;
        
  case 53:
 		//Servicio Listado de Proveedores por Servicio
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idservicio=$_REQUEST['idservicio'];
 		$contenido=$objServicio->Servicio053($idcondominio,$idservicio);
        break;
  case 54:
 		//Servicio Listado de Servicios por Proveedor
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idproveedor=$_REQUEST['idproveedor'];
 		$contenido=$objServicio->Servicio054($idcondominio,$idproveedor);
        break;
  case 55:
 		//Servicio Listado de Facturas por Proveedor
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idproveedor=$_REQUEST['idproveedor'];
 		$contenido=$objServicio->Servicio055($idcondominio,$idproveedor);
        break;
  case 56:
 		//Servicio Listado de Proveedores
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio056($idcondominio);
        break;
  case 57:
 		//Servicio Listado de Pagos hechos a Proveedores
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$contenido=$objServicio->Servicio057($idcondominio,$fecha1,$fecha2);
        break;
  case 58:
 		//Servicio Listado de Invitados de una Reservacion de Area Comun
 		$idcondominio=$_REQUEST['idcondominio'];
 		$idreservacion=$_REQUEST['idreservacion'];
 		$fechareservacion=$_REQUEST['fechareservacion'];
 		$contenido=$objServicio->Servicio058($idreservacion, $idcondominio, $fechareservacion);
        break;
  case 59:
 		//Servicio Actualizar Usuario
 		if(isset($_REQUEST['codigopersona']))
  			$codigopersona=$_REQUEST['codigopersona'];
  		else
  			$codigopersona="";
  		if(isset($_REQUEST['codigoinmueble']))
  			$codigoinmueble=$_REQUEST['codigoinmueble'];
  		else
  			$codigoinmueble="";
  		if(isset($_REQUEST['direccion']))
  			$direccion=$_REQUEST['direccion'];
  		else
  			$direccion="";
  		
  			
  		$idrol=$_REQUEST['idrol']; 
  		$usuario=$_REQUEST['usuario']; 
  		$nuevaclave=$_REQUEST['nuevaclave']; 
  		$correo=$_REQUEST['correo'];
  		$telefono=$_REQUEST['telefono'];
 		$contenido=$objServicio->Servicio059($codigopersona, $codigoinmueble, $idrol, $usuario, $nuevaclave, $correo, $direccion, $telefono);
        break;
  case 60:
 		//Servicio Iniciar Sesion
 		$usuario=$_REQUEST['usuario'];
 		$clave=$_REQUEST['clave'];
 		$contenido=$objServicio->Servicio060($usuario, $clave);
        break;
  case 61:
 		//Servicio Consultar Visitante
 		$idvisitante=$_REQUEST['idvisitante'];
 		$contenido=$objServicio->Servicio061($idvisitante);
        break;
  case 62:
 		//Servicio Consultar Noticia
 		$idnoticia=$_REQUEST['idnoticia'];
 		$contenido=$objServicio->Servicio062($idnoticia);
        break;
  case 63:
 		//Servicio Consultar Cotizacion
 		$idcotizacion=$_REQUEST['idcotizacion'];
 		$contenido=$objServicio->Servicio063($idcotizacion);
        break;
  case 64:
 		//Servicio Consultar Cotizaciones por Proveedor
 		$idproveedor=$_REQUEST['idproveedor'];
 		$contenido=$objServicio->Servicio064($idproveedor);
        break;
  case 65:
 		//Servicio Listado de Reclamos/Sugerencias en rango de fechas
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$contenido=$objServicio->Servicio065($fecha1, $fecha2);
        break;
  case 66:
 		//Servicio Consultar Visita
 		$idcontrolvisita=$_REQUEST['idcontrolvisita'];
 		$idcondominio=$_REQUEST['idcondominio'];
 		$contenido=$objServicio->Servicio066($idcontrolvisita, $idcondominio);
        break;
  case 67:
 		//Servicio Listado de Noticias Reunion de Condominio
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$contenido=$objServicio->Servicio067($idcondominio, $fecha1, $fecha2);
        break;
  case 68:
 		//Servicio Consultar Area Comun
 		$idcondominio=$_REQUEST['idcondominio'];
 		$codigoareacomun=$_REQUEST['codigoareacomun'];
 		$contenido=$objServicio->Servicio068($idcondominio, $codigoareacomun);
        break;
  case 69:
 		//Servicio Listado de Reservaciones por Area Comun en Rango de Fechas
 		$idcondominio=$_REQUEST['idcondominio'];
 		$fecha1=$_REQUEST['fecha1'];
 		$fecha2=$_REQUEST['fecha2'];
 		$idareacomun=$_REQUEST['idareacomun'];
 		$contenido=$objServicio->Servicio069($idcondominio, $fecha1, $fecha2, $idareacomun);
        break;
  case 70:
 		//Servicio Listado Reclamo/Sugerencia hechas a Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$codigoinmueble=$_REQUEST['codigoinmueble'];
 		$contenido=$objServicio->Servicio070($idcondominio, $codigoinmueble);
        break;
  case 71:
 		//Servicio Registrar Pago de Inmueble
 		$idcondominio=$_REQUEST['idcondominio'];
 		$codigopago=$_REQUEST['codigopago'];
 		$idrecibocobro=$_REQUEST['idrecibocobro'];
 		$descripcionpago=$_REQUEST['descripcionpago'];
 		$nrodocumento=$_REQUEST['nrodocumento'];
 		$montopago=$_REQUEST['montopago'];
 		$fechapago=$_REQUEST['fechapago'];
 		$estatuspago=$_REQUEST['estatuspago'];
 		$idformadepago=$_REQUEST['idformapago'];
 		$idrazonpago=$_REQUEST['idrazonpago'];
 		$cidepositante=$_REQUEST['ceddepositante'];
 		$idbanco=$_REQUEST['idbanco'];
 		$contenido=$objServicio->Servicio071($codigopago, $idrecibocobro, $descripcionpago, $nrodocumento, $montopago, $fechapago, $estatuspago, $idformadepago, $idrazonpago, $idcondominio, $cidepositante, $idbanco);
        break;
//Servicios externos continuacion
  
 case 72:
 		//CONSULTAR TIPO DE TRANSACCION
 		$idtipotransaccion=$_REQUEST['idtipotransaccion'];
 		$contenido = $objServicio->Servicio072($idtipotransaccion);
        break;
case 73:
 		//CONSULTAR antecedentes
 		$cedula=$_REQUEST['cedula'];
 		$contenido = $objServicio->Servicio073($cedula);
        break;
        
/*SERVICIOS OTROS*/
     case 74:
        // para guardar un registro de pago
        $CodigoP = $_REQUEST['codigoP'];
        $ObservacionesP = $_REQUEST['observacionesP'];
        $ReferenciaP = $_REQUEST['referenciaP'];
        $MontoP = $_REQUEST['montoP'];
        $ValidacionP = $_REQUEST['validacionP'];
        $FechaP = $_REQUEST['fechaP'];
        $EstatusP = $_REQUEST['estatusP'];
        $FormaP = $_REQUEST['formaP']; 
        $IdrecibocobroP = $_REQUEST['idrecibocobroP'];
        $Idcondominio = $_REQUEST['idcondominio'];   
        /*http://localhost/servidor-restful/Despachador.php?servicio=4&codigoP=1003&observacionesP=hola&referenciaP=8888&montoP=1000&validacionP=0&fechaP=2014/06/04&estatusP=a&formaP=1&idrecibocobroP=4*/
        $contenido = $objServicio->Servicio004($CodigoP,$ObservacionesP,$ReferenciaP,$MontoP,$ValidacionP,$FechaP,$EstatusP,$FormaP,$IdrecibocobroP,$Idcondominio);
        break;
      case 75:
        //Servicio buscar un usuario dado el usuario y clave
        $Usuario = $_REQUEST['usuario'];
        $Clave = $_REQUEST['clave']; 

        $contenido = $objServicio->Servicio075($Usuario,$Clave);
        break;
      case 76:
        //Servicio buscar todos los miembros de la junta de condominio
        $contenido = $objServicio->Servicio076();
        break; 
      case 77:
          $Idinmueble = $_REQUEST['idinmueble'];
        //Servicio buscar el monto deudor por inmueble
        $contenido = $objServicio->Servicio077($Idinmueble);
        break; 
      case 78:
        $Idinmueble = $_REQUEST['idinmueble'];
        //Servicio buscar el monto deudor por inmueble
        $contenido = $objServicio->Servicio078($Idinmueble);
        break; 
      case 79:
      //Servicio buscar los recibos que ya ha cancelado un copropietario
        $Idinmueble = $_REQUEST['idinmueble'];
        $contenido = $objServicio->Servicio079($Idinmueble);
        break; 
      case 80:
      //Servicio buscar el detalle de un pago de un recibo de cobro
        $idrecibocobropago = $_REQUEST['idrecibocobropago'];
        $contenido = $objServicio->Servicio080($idrecibocobropago);
        break; 
      case 81:
      //Servicio buscar los recibos que ya ha cancelado un copropietario
        $Idinmueble = $_REQUEST['idinmueble'];
        $contenido = $objServicio->Servicio081($Idinmueble);
        break;
      case 82:
        //Servicio buscar las areas comunes de un condominio en particular
        $Idcondominio = $_REQUEST['idcondominio'];
        $contenido = $objServicio->Servicio082($Idcondominio);
        break;
      case 83:
        //Servicio verificar si existe una reservacion dado una fecha y el id del area comun
        $Fecha = $_REQUEST['fecha'];
        $Idareacomun = $_REQUEST['idareacomun']; 
         $Idinmueblereservacion = $_REQUEST['idinmueblereservacion']; 

        $contenido = $objServicio->Servicio083($Fecha,$Idareacomun,$Idinmueblereservacion);
        break;
      case 84:
        $Fecha = $_REQUEST['fecha'];
        $Estatus = $_REQUEST['estatus'];
        $MontoPagar = $_REQUEST['montoPagar'];
        $Idreserva = $_REQUEST['idreserva'];
        $Idinmueblereservacion = $_REQUEST['idinmueblereservacion'];
        $MontoAbonado = $_REQUEST['montoAbonado']; 
        //Servicio buscar todos los usuarios sin parametros y sin fotos
        /*http://localhost/servidor-restful/Despachador.php?servicio=4&codigoP=1003&observacionesP=hola&referenciaP=8888&montoP=1000&validacionP=0&fechaP=2014/06/04&estatusP=a&formaP=1&idrecibocobroP=4*/
        $contenido = $objServicio->Servicio084($Fecha,$Estatus,$MontoPagar,$Idreserva,$Idinmueblereservacion,$MontoAbonado);
        break;
      case 85:
        //Servicio buscar las noticias del condominio
        $Idcondominio = $_REQUEST['idcondominio'];
        $contenido = $objServicio->Servicio085($Idcondominio);
        break;
      case 86:
        //servicio para guardar una publicacion
        $Fecha = $_REQUEST['fechaActual'];
        $Descripcion = $_REQUEST['descripcion'];
        $Estatus = $_REQUEST['estatus'];
        $Tiponoticia = $_REQUEST['tiponoticia'];
        $Idlogin = $_REQUEST['idlogin'];
        $Cedula = $_REQUEST['cedula'];
        $Idcondominio = $_REQUEST['idcondominio'];        
        $contenido = $objServicio->Servicio086($Fecha,$Descripcion,$Estatus,$Tiponoticia,$Idlogin,$Cedula,$Idcondominio);
        break;
        
       case 87:
        //servicio para equipo EUGENIO retorna las opciones del arbol para ese usuario.
       $usuario=$_REQUEST['usuario'];
 		$clave=$_REQUEST['clave'];
 		$contenido=$objServicio->Servicio087($usuario,$clave);
        break;

       case 88:
	//Servicio Actualizar Usuario
	if(isset($_REQUEST['codigopersona']))
		$codigopersona=$_REQUEST['codigopersona'];
	else
		$codigopersona="";
	if(isset($_REQUEST['codigoinmueble']))
		$codigoinmueble=$_REQUEST['codigoinmueble'];
	else
		$codigoinmueble="";
	if(isset($_REQUEST['direccion']))
		$direccion=$_REQUEST['direccion'];
	else
		$direccion="";
	
	$nombrefoto=$_REQUEST['nombrefoto'];
	$formatofoto=$_REQUEST['formatofoto'];
	$fotousuario=$_REQUEST['fotousuario'];
	$idrol=$_REQUEST['idrol']; 
	$usuario=$_REQUEST['usuario']; 
	$nuevaclave=$_REQUEST['nuevaclave']; 
	$correo=$_REQUEST['correo'];
	$telefono=$_REQUEST['telefono'];
	$contenido=$objServicio->Servicio088($codigopersona, $codigoinmueble, $idrol, $usuario, $nuevaclave, $correo, $direccion, $telefono, $nombrefoto, $formatofoto,$fotousuario);
        break;
        
      case 89:
	//Servicio Listado de Cuentas Bancarias
	$idcondominio=$_REQUEST['idcondominio'];
	$contenido=$objServicio->Servicio089($idcondominio);
        break;
      case 90:
	//Servicio Actualizar Copropietario
	if(isset($_REQUEST['idcopropietario']))
	$idcopropietario=$_REQUEST['idcopropietario'];
	else
	$idcopropietario="";
	
	if(isset($_REQUEST['direccion']))
	$direccion=$_REQUEST['direccion'];
	else
	$direccion="";
	$correo=$_REQUEST['correo'];
	$telefono=$_REQUEST['telefono'];
	$contenido=$objServicio->Servicio090($idcopropietario,$correo,$direccion,$telefono);
	
	break;
	
      case 91:
	//Servicio Listado tipo de Noticias
	$contenido=$objServicio->Servicio091();
	break;
    
    case 92:
	//Servicio Consultar Nomina del Empleado
	$idempleado=$_REQUEST['idempleado'];
	$mes=$_REQUEST['mes'];
	$contenido=$objServicio->Servicio092($idempleado, $mes);
        break;
    
    case 93:
	//Servicio Registrar Reclamo
	$codigoreclamo=$_REQUEST['codigoreclamo'];
	$razonreclamo=$_REQUEST['razonreclamo'];
	$fecha=$_REQUEST['fecha']; 
	$descripcion=$_REQUEST['descripcion']; 
	$estatus=$_REQUEST['estatus']; 
	$idinmueblereclamo=$_REQUEST['idinmueblereclamo']; 
	$idtiporeclamo=$_REQUEST['idtiporeclamo']; 
	if(isset($_REQUEST['codigoinmuebledestino']))
		$codigoinmuebledestinatario=$_REQUEST['codigoinmuebledestino']; 
	else
		$codigoinmuebledestinatario="";
	
	
	$contenido=$objServicio->Servicio093($codigoreclamo, $razonreclamo, $fecha, $descripcion, $estatus, $idinmueblereclamo, 
						$codigoinmuebledestinatario, $idtiporeclamo);
        break;
    case 94:
	//Servicio Listado tipos de Reclamos
	$contenido=$objServicio->Servicio094();
	break;

  }
  echo $contenido;
  return true;
 }
}
$objDespachador = new Despachador();
$objDespachador->despachar();

//Laboratorio III. Dreamteam A. / EAI SERVICIOS 
?>

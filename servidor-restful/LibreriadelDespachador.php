<?php
/* 
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/

require_once("saime.php");
require_once("seniat.php");
require_once("banco.php");
require_once("vivienda.php");
require_once("moviles.php");

class Servicios {
 function Servicio001($Cedula)
 {
  try {
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Saime();
       $datos = $objetoDatos->BuscarPersona($Cedula);
       if ($datos[0]=="true")	
       {
        $datos1 = $datos1.'{"existe":"true",';
        $datos1 = $datos1.'"nombre":"'.$datos[1].'",';
        $datos1 = $datos1.'"apellido":"'.$datos[2].'",';
        $datos1 = $datos1.'"direccion":"'.$datos[3].'",';
        $datos1 = $datos1.'"telefono":"'.$datos[4].'",';
        $datos1 = $datos1.'"correo":"'.$datos[5].'",';
        $datos1 = $datos1.'"estadocivil":"'.$datos[6].'",';
        $datos1 = $datos1.'"ciudad":"'.$datos[7].'",';
        $datos1 = $datos1.'"municipio":"'.$datos[8].'",';
        $datos1 = $datos1.'"estado":"'.$datos[9].'"}';
       }
       else
       {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"existe":"'.$datos[0].'"}';
     }   
    return $datos1;
 }
 
 //Servicio buscar todos los estados de Venezuela
 function Servicio002()
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Saime();
       $datos = $objetoDatos->BuscarEstados();
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "estados":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
            $datos1 = $datos1.'{"idestado":"'.$datos[$i+2]['idestado'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}, ';
          }
	  else
	  {
	    $datos1 = $datos1.'{"idestado":"'.$datos[$i+2]['idestado'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}]}';
            
	  }
	}
        
        }
       else {
        $datos1 = '{"exito":"'.$datos[0].'"}';
        }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
      }   
     return $datos1;
 }
 
 //Servicio buscar todos los municipios de un estado de Venezuela
 function Servicio003($estado)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Saime();
       $datos = $objetoDatos->BuscarMunicipios($estado);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "municipios":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
            $datos1 = $datos1.'{"idmunicipio":"'.$datos[$i+2]['idmunicipio'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}, ';
          }
	  else
	  {
	    $datos1 = $datos1.'{"idmunicipio":"'.$datos[$i+2]['idmunicipio'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}]}';
            
	  }
	}
        
       }
       else {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
     }   
     return $datos1;
 }

 //Servicio buscar todas las ciudades de un estado de Venezuela
 function Servicio004($estado)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Saime();
       $datos = $objetoDatos->BuscarCiudadesEstado($estado);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "ciudades":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
            $datos1 = $datos1.'{"idciudad":"'.$datos[$i+2]['idciudad'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}, ';
          }
	  else
	  {
	    $datos1 = $datos1.'{"idciudad":"'.$datos[$i+2]['idciudad'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}]}';
            
	  }
	}
        
       }
       else {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
     }   
     return $datos1;
 }
//Servicio buscar todas las ciudades de un municipio de Venezuela
 function Servicio005($municipio,$estado)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Saime();
       $datos = $objetoDatos->BuscarCiudadesMunicipio($municipio,$estado);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "ciudades":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
            $datos1 = $datos1.'{"idciudad":"'.$datos[$i+2]['idciudad'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}, ';
          }
	  else
	  {
	    $datos1 = $datos1.'{"idciudad":"'.$datos[$i+2]['idciudad'].'", ';
            $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'"}]}';
            
	  }
	}
        
       }
       else {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
     }   
     return $datos1;
 }
//Servicio buscar rif
 function Servicio006($rif)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Seniat();
       $datos = $objetoDatos->BuscarRif($rif);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"existe":"'.$datos[0].'" ,"nombre":"'.$datos[1].'" ,"razonsocial":"'.$datos[2].'" }';
      
       }
       else {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"existe":"'.$datos[0].'"}';
      }   
     return $datos1;
 }

//Servicio consultar cuenta bancaria
 function Servicio007($cuentabancaria)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Banco();
       $datos = $objetoDatos->ConsultarCuentaBancaria($cuentabancaria);

       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"existe":"'.$datos[0].'" ,"tipocuenta":"'.$datos[1].'" ,"personaid":"'.$datos[2].'","banco":"'.$datos[3].'","saldo":"'.$datos[4].'" }';
             }
       else {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"existe":"'.$datos[0].'"}';
     }   
     return $datos1;
 }

//Servicio abonar TDC
 function Servicio008($numtarjeta,$cedtitular,$mesexpiracion,$annoexpiracion,$codseguridad,$monto)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Banco();
       $datos = $objetoDatos->AbonarTDC($numtarjeta,$cedtitular,$mesexpiracion,$annoexpiracion,$codseguridad,$monto);
       
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" }';
       }
       else 
	{
        $datos1 = '{"exito":"'.$datos[0].'","error":"'.$datos[1].'" }';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'","error":"'.$datos[1].'"}';
      }   
     return $datos1;
 }

//Servicio Validar Transaccion Bancaria
 function Servicio009($numreferencia,$idbanco,$cedula,$monto,$fecha)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Banco();
       $datos = $objetoDatos->ValidarTransaccion($numreferencia,$idbanco,$cedula,$monto,$fecha);
       
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"true","tipotransaccion":"'.$datos[1].'","cuentaabonada":"'.$datos[2].'" }';
       }
       else 
	{
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
      }   
     return $datos1;
 }
// Servicio Consultar Bancos
function Servicio010()
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Banco();
       $datos = $objetoDatos->ConsultarBancos();
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "bancos":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
            $datos1 = $datos1.'{"idbanco":"'.$datos[$i+2]['idbanco'].'", ';
	    $datos1 = $datos1.'"rif":"'.$datos[$i+2]['rif'].'", ';
            $datos1 = $datos1.'"nombre":"'.$datos[$i+2]['nombre'].'"}, ';
          }
	  else
	  {
	    $datos1 = $datos1.'{"idbanco":"'.$datos[$i+2]['idbanco'].'", ';
	    $datos1 = $datos1.'"rif":"'.$datos[$i+2]['rif'].'", ';
            $datos1 = $datos1.'"nombre":"'.$datos[$i+2]['nombre'].'"}]}';
            
	  }
	}
        1;
       }
       else {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
     }   
     return $datos1;
 }
//Servicio Validar Copropietario de Inmueble
 function Servicio011($cedcopropietario,$codcatastral)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Vivienda();
       $datos = $objetoDatos->ValidarCopropietarioInmueble($cedcopropietario,$codcatastral);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'"}';
       }
       else 
	{
        $datos1 = '{"exito":"'.$datos[0].'","error":"'.$datos[1].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'","error":"'.$datos[1].'"}';
     }   
     return $datos1;
 }
//Servicio Consultar Inmueble
 function Servicio012($codcatastral)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Vivienda();
       $datos = $objetoDatos->ConsultarInmueble($codcatastral);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'","numinmueble":"'.$datos[1].'","metrocuadrado":"'.$datos[2].'",
			"alicuota":"'.$datos[3].'","direccion":"'.$datos[4].'","fechadocumento":"'.$datos[5].'",
			"cedcopropietario":"'.$datos[7].$datos[6].'"}';
       }
       else 
	{
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"'.$datos[0].'"}';
     }   
     return $datos1;
 }
//Servicio Listado de Areas Comunes
 function Servicio013($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoAreasComunes($idcondominio);
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "areascomunes":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
		$datos1 = $datos1.'{"codigoareacomun":"'.$datos[$i+2][1].'", ';
	    	$datos1 = $datos1.'"nombreareacomun":"'.$datos[$i+2][2].'", ';
	    	$datos1 = $datos1.'"descripcionareacomun":"'.$datos[$i+2][3].'", ';
		$datos1 = $datos1.'"capacidadareacomun":"'.$datos[$i+2][4].'", ';
		$datos1 = $datos1.'"idareacomun":"'.$datos[$i+2][6].'", '; /*agregado*/
	    	$datos1 = $datos1.'"estatusareacomun":"'.$datos[$i+2][5].'"}, ';
          }
	  else
	  {
	        $datos1 = $datos1.'{"codigoareacomun":"'.$datos[$i+2][1].'", ';
	    	$datos1 = $datos1.'"nombreareacomun":"'.$datos[$i+2][2].'", ';
	    	$datos1 = $datos1.'"descripcionareacomun":"'.$datos[$i+2][3].'", ';
		$datos1 = $datos1.'"capacidadareacomun":"'.$datos[$i+2][4].'", ';
		$datos1 = $datos1.'"idareacomun":"'.$datos[$i+2][6].'", ';    /*agregado*/
	    	$datos1 = $datos1.'"estatusareacomun":"'.$datos[$i+2][5].'"}]}';
            
	  }
	}
       }
       else {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"false"}';
     }   
     return $datos1;
 }
//Servicio Consultar Reservacion de Area Comun
 function Servicio014($idreservacion)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarReservacion($idreservacion);
       if ($datos[0]=="true")
       {
       	
        $datos1 = $datos1.'{"existe":"true",';
        $datos1 = $datos1.'"fechareservacion":"'.$datos[1].'",';
        $datos1 = $datos1.'"nombrelistainvitadosreservacion":"'.$datos[2].'",';
        $datos1 = $datos1.'"listainvitadosreservacion":"'.$datos[3].'",';
        $datos1 = $datos1.'"formatolistainvitadosreservacion":"'.$datos[4].'",';
        $datos1 = $datos1.'"estatusreservacion":"'.$datos[5].'",';
        $datos1 = $datos1.'"montoapagar":"'.$datos[6].'",';
        $datos1 = $datos1.'"idinmueble":"'.$datos[7].'"}';
        
       }
       else {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"existe":"false"}';
     }   
     return $datos1;
 }
//Servicio Listado de Reservaciones de Areas Comunes
 function Servicio015($idcondominio,$fecha1,$fecha2)
 {
  
  try {
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoReservaciones($idcondominio,$fecha1,$fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "reservaciones":[';
       
	       
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			 if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idreservacion":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"codigoreservacion":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"idareacomun":"'.$datos[$i+2][13].'",';
	        $datos1 = $datos1.'"nombreareacomun":"'.$datos[$i+2][12].'",';
	        $datos1 = $datos1.'"fechareservacion":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"nombrelistainvitadosreservacion":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"formatolistainvitadosreservacion":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"listainvitadosreservacion":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"estatusreservacion":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"montoapagar":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"idinmueblereservacion":"'.$datos[$i+2][9].'",';
	        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][10].'",';
	        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][11].'"}, ';
	 		}
	 		else 
	 		{	
	        $datos1 = $datos1.'{"idreservacion":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"codigoreservacion":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"fechareservacion":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"nombrelistainvitadosreservacion":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"formatolistainvitadosreservacion":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"listainvitadosreservacion":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"estatusreservacion":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"montoapagar":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"idinmueblereservacion":"'.$datos[$i+2][9].'",';
	        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][10].'",';
	        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][11].'",';
	        $datos1 = $datos1.'"nombreareacomun":"'.$datos[$i+2][12].'"}]}';
	 		}
		}
       }
       else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"'.$datos[0].'"}';
     }   
    return $datos1;
 }
 //Servicio Registrar Reservacion de Area Comun
 function Servicio016($codigoreservacion, $fechareservacion, $estatusreservacion, $montoapagar, $idareacomunreservacion, $idinmueblereservacion)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       
       $Maquina     = "localhost";
	  $UsuarioADM  = "root";
	  $ClaveADM    = "123";
	  $BaseDeDatos = "gestioncondominio";
	  $ObjetoConeccion = new ConeccionBD;
	  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
	  $InstruccionSQL="select idcondominioinmueble from inmuebles where idinmueble='$idinmueblereservacion'";
	  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
	  if (mysql_num_rows($ConjuntoDeRegistros)>0)
	  {
	  	  $resultado=mysql_fetch_array($ConjuntoDeRegistros);
	  	  $idcondominio=$resultado['idcondominioinmueble'];
		  $datos=$objetoDatos->VerificarDisponibilidadArea($idareacomunreservacion,$idcondominio,$fechareservacion);
		  if($datos[0]=="true")
		  {
		       $datos = $objetoDatos->RegistrarReservacion($codigoreservacion, $fechareservacion, $estatusreservacion, $montoapagar, $idareacomunreservacion, $idinmueblereservacion);
		       $datos1 = '{"exito":"'.$datos[0].'"}';
		  }
		  else
     		$datos1 = '{"exito":"false"}';
	 }
	  else
     	$datos1 = '{"exito":"false"}';
  }catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 //Servicio Verificar Disponibilidad de Area Comun en fecha
 function Servicio017($idarea,$idcondominio,$fecha)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->VerificarDisponibilidadArea($idarea, $idcondominio, $fecha);
       $datos1 = '{"disponibilidad":"'.$datos[0].'"}';
  }catch (Exception $e) {
     $datos1 = '{"disponibilidad":"false"}';
     }   
    return $datos1;
 }
 
 //Servicio Consultar Total por cobrar del  Condominio en recibos de cobro 
function Servicio018($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarTotalCobrarCondominioRecibosCobro($idcondominio);
       $datos1 = '{"monto":"'.$datos[0].'"}';
  }catch (Exception $e) {
     $datos1 = '{"monto":"0"}';
     }   
    return $datos1;
 }
 //Servicio Consultar listado de todos los Recibos  de Cobro de un Condominio por estatus
function Servicio019($idcondominio,$estatus)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarListadoRecibosCobro($idcondominio, $estatus);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "recibos":[';
        if($estatus!='todos')
        {
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"cuotapendiente":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"fechavencimiento":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"idinmueble":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"idcopropietario":"'.$datos[$i+2][8].'"}, ';
	  		}
	  		else
			{
	        $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"cuotapendiente":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"fechavencimiento":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"idinmueble":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"idcopropietario":"'.$datos[$i+2][8].'"}]}';
	  		}
		}
		
        }else 
         {
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"cuotapendiente":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"fechavencimiento":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"idinmueble":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"idcopropietario":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"estatusrecibocobro":"'.$datos[$i+2][9].'"}, ';
	  		}
	  		else
			{
	        $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"cuotapendiente":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"fechavencimiento":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"idinmueble":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"idcopropietario":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"estatusrecibocobro":"'.$datos[$i+2][9].'"}]}';
	  		}
		}
        }
      }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 //Servicio Consultar listado de todos los Recibos  de Cobro de un Condominio por estatus
function Servicio020()
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoCondominios();
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "condominios":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idcondominio":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"rifcondominio":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"nombrecondominio":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"direccioncondominio":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"nombretipocondominio":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"interesmoracondominio":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"tiempomoracondominio":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"fotocondominio":"'.base64_encode($datos[$i+2][8]).'"}, ';
	  		}
	  		else
			{
	      	$datos1 = $datos1.'{"idcondominio":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"rifcondominio":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"nombrecondominio":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"direccioncondominio":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"nombretipocondominio":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"interesmoracondominio":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"tiempomoracondominio":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"fotocondominio":"'.base64_encode($datos[$i+2][8]).'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 //Servicio Consultar Copropietario
 function Servicio021($cedula)
 {
  try {
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarCopropietario($cedula);
       if ($datos[0]=="true")	
       {
        $datos1 = $datos1.'{"existe":"true",';
        $datos1 = $datos1.'"idcopropietario":"'.$datos[1].'",';
        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[2].'",';
        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[3].'",';
        $datos1 = $datos1.'"direccioncopropietario":"'.$datos[4].'",';
        $datos1 = $datos1.'"correocopropietario":"'.$datos[5].'",';
        $datos1 = $datos1.'"telefonocopropietario":"'.$datos[6].'",';
        $datos1 = $datos1.'"fechacreacioncopropietario":"'.$datos[7].'",';
        $datos1 = $datos1.'"fechanacimientocopropietario":"'.$datos[8].'",';
        $datos1 = $datos1.'"formatofotocopropietario":"'.$datos[9].'",';
        $datos1 = $datos1.'"nombrefotocopropietario":"'.$datos[10].'",';
        $datos1 = $datos1.'"fotocopropietario":"'.base64_encode($datos[11]).'",';
        $datos1 = $datos1.'"estatuscopropietario":"'.$datos[12].'",';
        $datos1 = $datos1.'"twittercopropietario":"'.$datos[13].'"}';
       }
       else
       {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"existe":"'.$datos[0].'"}';
     }   
    return $datos1;
 }
function Servicio022($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoCopropietarios($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "copropietarios":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idcopropietario":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"cedulacopropietario":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"direccioncopropietario":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"correocopropietario":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"telefonocopropietario":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"fechacreacioncopropietario":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"fechanacimientocopropietario":"'.$datos[$i+2][9].'",';
	        $datos1 = $datos1.'"formatofotocopropietario":"'.$datos[$i+2][10].'",';
	        $datos1 = $datos1.'"fotocopropietario":"'.base64_encode($datos[$i+2][11]).'",';
	        $datos1 = $datos1.'"estatuscopropietario":"'.$datos[$i+2][12].'",';
        	$datos1 = $datos1.'"twittercopropietario":"'.$datos[$i+2][13].'"}, ';
	  		}
	  		else
			{
	        $datos1 = $datos1.'{"idcopropietario":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"cedulacopropietario":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"direccioncopropietario":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"correocopropietario":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"telefonocopropietario":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"fechacreacioncopropietario":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"fechanacimientocopropietario":"'.$datos[$i+2][9].'",';
	        $datos1 = $datos1.'"formatofotocopropietario":"'.$datos[$i+2][10].'",';
	        $datos1 = $datos1.'"fotocopropietario":"'.base64_encode($datos[$i+2][11]).'",';
	        $datos1 = $datos1.'"estatuscopropietario":"'.$datos[$i+2][12].'",';
        	$datos1 = $datos1.'"twittercopropietario":"'.$datos[$i+2][13].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio023($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoCuentasBancarias($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "cuentasbancarias":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"numerocuenta":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombrebanco":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"cedulatitularcuenta":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"nombretitularcuenta":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"tipocuenta":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"descripcionbanco":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"saldodisponible":"'.$datos[$i+2][7].'"}, ';
	        }
	  		else
			{
	        $datos1 = $datos1.'{"numerocuenta":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombrebanco":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"cedulatitularcuenta":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"nombretitularcuenta":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"tipocuenta":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"descripcionbanco":"'.$datos[$i+2][6].'",';
	        $datos1 = $datos1.'"saldodisponible":"'.$datos[$i+2][7].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 
 function Servicio024($idegreso)
 {
  try {
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarEgreso($idegreso);
       if ($datos[0]=="true")	
       {
        $datos1 = $datos1.'{"existe":"true",';
        $datos1 = $datos1.'"codigoegreso":"'.$datos[1].'",';
        $datos1 = $datos1.'"descripcionegreso":"'.$datos[2].'",';
        $datos1 = $datos1.'"fechaegreso":"'.$datos[3].'",';
        $datos1 = $datos1.'"montoegreso":"'.$datos[4].'",';
        $datos1 = $datos1.'"nombretipoegreso":"'.$datos[5].'"}';
       }
       else
       {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
 function Servicio025($idrecibo)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoEgresosComunes($idrecibo);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "egresoscomunes":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idegresoxrecibo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"descripciondetalle":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"montoegresoxrecibo":"'.$datos[$i+2][3].'"}, ';
	        }
	  		else
			{
	        $datos1 = $datos1.'{"idegresoxrecibo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"descripciondetalle":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"montoegresoxrecibo":"'.$datos[$i+2][3].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 function Servicio026($idrecibo)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoEgresosNoComunes($idrecibo);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "egresosnocomunes":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idegresoxrecibo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"descripciondetalle":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"montoegresoxrecibo":"'.$datos[$i+2][3].'"}, ';
	        }
	  		else
			{
	        $datos1 = $datos1.'{"idegresoxrecibo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"descripciondetalle":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"montoegresoxrecibo":"'.$datos[$i+2][3].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 
 function Servicio027($idcondominio,$fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoEgresosComunesFechas($idcondominio, $fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "egresoscomunes":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idegreso":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"descripciondetalle":"'.$datos[$i+2][2].'",';
		$datos1 = $datos1.'"fechaegreso":"'.$datos[$i+2][4].'",';/*agregado*/
	        $datos1 = $datos1.'"montodetalle":"'.$datos[$i+2][3].'"}, ';
	        }
	  		else
			{
	        $datos1 = $datos1.'{"idegreso":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"descripciondetalle":"'.$datos[$i+2][2].'",';
		$datos1 = $datos1.'"fechaegreso":"'.$datos[$i+2][4].'",';/*agregado*/
	        $datos1 = $datos1.'"montodetalle":"'.$datos[$i+2][3].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 } 
 function Servicio028($cedula, $direccion,$telefono, $correo)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ActualizarEmpleado($cedula, $direccion, $telefono, $correo);
        $datos1 = '{"exito":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 function Servicio029($idempleado,$idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarEmpleado($idempleado, $idcondominio);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"nombreempleado":"'.$datos[1].'",';
        $datos1 = $datos1.'"apellidoempleado":"'.$datos[2].'",';
        $datos1 = $datos1.'"direccionempleado":"'.$datos[3].'",';
        $datos1 = $datos1.'"telefonoempleado":"'.$datos[4].'",';
        $datos1 = $datos1.'"correoempleado":"'.$datos[5].'",';
        $datos1 = $datos1.'"fechanacimientoempleado":"'.$datos[6].'",';
        $datos1 = $datos1.'"nombrefotoempleado":"'.$datos[7].'",';
        $datos1 = $datos1.'"formatofotoempleado":"'.$datos[8].'",';
        $datos1 = $datos1.'"fotoempleado":"'.base64_encode($datos[9]).'",';
        $datos1 = $datos1.'"sueldobase":"'.$datos[10].'",';
        $datos1 = $datos1.'"estatusempleado":"'.$datos[11].'",';
        $datos1 = $datos1.'"idloginempleado":"'.$datos[12].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
 function Servicio030($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoEmpleados($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "empleados":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	  			
	        $datos1 = $datos1.'{"cedulaempleado":"'.$datos[$i+2][13].'", ';
	        $datos1 = $datos1.'"nombreempleado":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"apellidoempleado":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"direccionempleado":"'.$datos[$i+2][3].'", ';
	        $datos1 = $datos1.'"telefonoempleado":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"correoempleado":"'.$datos[$i+2][5].'",';
	        $datos1 = $datos1.'"fechanacimientoempleado":"'.$datos[$i+2][6].'", ';
	        $datos1 = $datos1.'"nombrefotoempleado":"'.$datos[$i+2][7].'",';
	        $datos1 = $datos1.'"formatofotoempleado":"'.$datos[$i+2][8].'",';
	        $datos1 = $datos1.'"fotoempleado":"'.base64_encode($datos[$i+2][9]).'", ';
	        $datos1 = $datos1.'"sueldobase":"'.$datos[$i+2][10].'",';
	        $datos1 = $datos1.'"estatusempleado":"'.$datos[$i+2][11].'",';
	        $datos1 = $datos1.'"idloginempleado":"'.$datos[$i+2][12].'"}, ';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"cedulaempleado":"'.$datos[$i+2][13].'", ';
		        $datos1 = $datos1.'"nombreempleado":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"apellidoempleado":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"direccionempleado":"'.$datos[$i+2][3].'", ';
		        $datos1 = $datos1.'"telefonoempleado":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"correoempleado":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"fechanacimientoempleado":"'.$datos[$i+2][6].'", ';
		        $datos1 = $datos1.'"nombrefotoempleado":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"formatofotoempleado":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"fotoempleado":"'.base64_encode($datos[$i+2][9]).'", ';
		        $datos1 = $datos1.'"sueldobase":"'.$datos[$i+2][10].'",';
		        $datos1 = $datos1.'"estatusempleado":"'.$datos[$i+2][11].'",';
		        $datos1 = $datos1.'"idloginempleado":"'.$datos[$i+2][12].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 } 
  function Servicio031($idcondominio,$idempleado,$fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoPagosNomina($idcondominio,$idempleado, $fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "nominasempleado":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	  			
	        
				$datos1 = $datos1.'{"idnomina":"'.$datos[$i+2][1].'", ';
		        $datos1 = $datos1.'"fechanominaempleado":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"nombreempleado":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"apellidoempleado":"'.$datos[$i+2][4].'", ';
		        $datos1 = $datos1.'"sueldoneto":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"deduccionesnominaempleado":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"asignacionesnominaempleado":"'.$datos[$i+2][7].'", ';
		        $datos1 = $datos1.'"sueldototal":"'.$datos[$i+2][8].'"}, ';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idnomina":"'.$datos[$i+2][1].'", ';
		        $datos1 = $datos1.'"fechanominaempleado":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"nombreempleado":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"apellidoempleado":"'.$datos[$i+2][4].'", ';
		        $datos1 = $datos1.'"sueldoneto":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"deduccionesnominaempleado":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"asignacionesnominaempleado":"'.$datos[$i+2][7].'", ';
		        $datos1 = $datos1.'"sueldototal":"'.$datos[$i+2][8].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
   function Servicio032($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoFondosReserva($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "fondosreserva":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	  			
	        
				$datos1 = $datos1.'{"idfondoreserva":"'.$datos[$i+2][1].'", ';
		        $datos1 = $datos1.'"codigofondoreserva":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"nombrefondoreserva":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"objetivofondoreserva":"'.$datos[$i+2][4].'", ';
		        $datos1 = $datos1.'"montofijofondoreserva":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"saldoactual":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatusfondoreserva":"'.$datos[$i+2][7].'"}, ';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idfondoreserva":"'.$datos[$i+2][1].'", ';
		        $datos1 = $datos1.'"codigofondoreserva":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"nombrefondoreserva":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"objetivofondoreserva":"'.$datos[$i+2][4].'", ';
		        $datos1 = $datos1.'"montofijofondoreserva":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"saldoactual":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatusfondoreserva":"'.$datos[$i+2][7].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio033($idingreso)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarIngreso($idingreso);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"descripcionpago":"'.$datos[1].'",';
        $datos1 = $datos1.'"fechapago":"'.$datos[2].'",';
        $datos1 = $datos1.'"montoingreso":"'.$datos[3].'",';
        $datos1 = $datos1.'"nombrerazondepago":"'.$datos[4].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
   function Servicio034($idcondominio,$fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoIngresos($idcondominio, $fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "ingresos":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			if($i!=$datos[1]-1)
	  		{
	  			
	        
			$datos1 = $datos1.'{"idingreso":"'.$datos[$i+2][1].'", ';
		        $datos1 = $datos1.'"fechaingreso":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcioningreso":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montoningreso":"'.$datos[$i+2][4].'"}, ';
	        
	        }
	  		else
			{
			$datos1 = $datos1.'{"idingreso":"'.$datos[$i+2][1].'", ';
		        $datos1 = $datos1.'"fechaingreso":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcioningreso":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montoningreso":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio035($idinmueble,$idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarDeudaInmueble($idinmueble, $idcondominio);
       $datos1 = $datos1.'{"deuda":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"deuda":"0"}';
     }   
    return $datos1;
 }  
function Servicio036($idinmueble,$idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarInmueble($idinmueble, $idcondominio);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"codigoinmueble":"'.$datos[1].'",';
        $datos1 = $datos1.'"metroscuadradosinmueble":"'.$datos[2].'",';
        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[3].'",';
        $datos1 = $datos1.'"descripcioninmueble":"'.$datos[4].'",';
        $datos1 = $datos1.'"estatusinmueble":"'.$datos[5].'",';
        $datos1 = $datos1.'"idcopropietarioinmueble":"'.$datos[6].'",';
        $datos1 = $datos1.'"idlogininmueble":"'.$datos[7].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
  function Servicio037($idcondominio,$idcopropietario)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoInmueblesCopropietario($idcondominio, $idcopropietario);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "inmuebles":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigoinmueble":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"metroscuadradosinmueble":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcioninmueble":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"estatusinmueble":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"codigocatastralinmueble":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"idlogininmueble":"'.$datos[$i+2][7].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"codigoinmueble":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"metroscuadradosinmueble":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcioninmueble":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"estatusinmueble":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"codigocatastralinmueble":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"idlogininmueble":"'.$datos[$i+2][7].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio038($idinmueble,$idcondominio,$mes)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarReciboCobroMes($idinmueble, $idcondominio, $mes);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"idrecibocobro":"'.$datos[1].'",';
        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[2].'",';
        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[3].'",';
        $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[4].'",';
        $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[5].'",';
        $datos1 = $datos1.'"abonorecibocobro":"'.$datos[6].'",';
        $datos1 = $datos1.'"montorecibocobro":"'.$datos[7].'",';
        $datos1 = $datos1.'"estatuscancelacionrecibo":"'.$datos[8].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
  function Servicio039($idcondominio,$codigoinmueble,$fecha1,$fecha2,$estatus)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoRecibosInmueble($idcondominio, $codigoinmueble, $fecha1, $fecha2, $estatus);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "reciboscobro":[';
       	if($estatus!='todos')
        {
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"abonorecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][7].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"abonorecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][7].'"}]}';
	  		}
		}
        }
        else 
        {
        for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"abonorecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"estatuscancelacionrecibo":"'.$datos[$i+2][8].'"}';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigorecibocobro":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fecharecibocobro":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"abonorecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"montorecibocobro":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"estatuscancelacionrecibo":"'.$datos[$i+2][8].'"}]}';
	  		}
		}
        	
        }
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
  function Servicio040($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoInmuebles($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "inmuebles":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
	  			$datos1 = $datos1.'{"idinmueble":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoinmueble":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"metroscuadradosinmueble":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"descripcioninmueble":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"estatusinmueble":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"codigocatastralinmueble":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"cedulacopropietario":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][9].'",';
		        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][10].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idinmueble":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoinmueble":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"metroscuadradosinmueble":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"descripcioninmueble":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"estatusinmueble":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"codigocatastralinmueble":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"cedulacopropietario":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][9].'",';
		        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][10].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
  function Servicio041($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoInmueblesMorosos($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "inmuebles":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigoinmueble":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"idcopropietario":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"deuda":"'.$datos[$i+2][6].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"codigoinmueble":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"alicuotainmueble":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"idcopropietario":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"deuda":"'.$datos[$i+2][6].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
  function Servicio042($codigoinmueble,$idcondominio,$npagos)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoPagosReciboInmueble($codigoinmueble, $idcondominio, $npagos);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "recibospago":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idpago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"idrecibocobro":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"mes":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcionpago":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"montopago":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"descripcionforma":"'.$datos[$i+2][6].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idpago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"idrecibocobro":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"mes":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcionpago":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"montopago":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"descripcionforma":"'.$datos[$i+2][6].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio043($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarJuntaCondominioActual($idcondominio);
       if ($datos[0]=="true")	
       {
       	$numfilas=$datos[1];
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'","fechainicio":"'.$datos[($numfilas+1)][6].'","fechaculminacion":"'.$datos[$numfilas+1][7].'" , "juntacondominio":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"nombrecargo":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombre":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"apellido":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"codigoinmueble":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"telefono":"'.$datos[$i+2][5].'"},';
      		}
       		else
			{
		        $datos1 = $datos1.'{"nombrecargo":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombre":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"apellido":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"codigoinmueble":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"telefono":"'.$datos[$i+2][5].'"}]}';
       		}
		} 
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 } 
function Servicio044($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoTelefonos($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "telefonos":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"nombrecargo":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombrepersona":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"apellidopersona":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"telefonopersona":"'.$datos[$i+2][4].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"nombrecargo":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombrepersona":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"apellidopersona":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"telefonopersona":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio045($idinmueble,$idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoMultasInmueble($idinmueble, $idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "multas":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idmulta":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigomulta":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionmulta":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montomulta":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechamulta":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"idrecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"nombremulta":"'.$datos[$i+2][7].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idmulta":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigomulta":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionmulta":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montomulta":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechamulta":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"idrecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"nombremulta":"'.$datos[$i+2][7].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio046($idcondominio,$fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoMultasCondominio($idcondominio, $fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "multas":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idmulta":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigomulta":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionmulta":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montomulta":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechamulta":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"idrecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"nombremulta":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"codigoinmueble":"'.$datos[$i+2][8].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idmulta":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigomulta":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionmulta":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montomulta":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"fechamulta":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"idrecibocobro":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"nombremulta":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"codigoinmueble":"'.$datos[$i+2][8].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio047($idcondominio,$fecha1,$fecha2,$nnoticias)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoNoticiasCondominio($idcondominio, $fecha1, $fecha2, $nnoticias);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "noticias":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
	
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigonoticia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"fechanoticia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionnoticia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"usuariologin":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"nombrerol":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"cedulaautor":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"nombrearchivonoticia":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"formatoarchivonoticia":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"archivonoticia":"'.$datos[$i+2][9].'"},';
	        
	        }
	  		else
			{
			$datos1 = $datos1.'{"codigonoticia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"fechanoticia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionnoticia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"usuariologin":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"nombrerol":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"cedulaautor":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"nombrearchivonoticia":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"formatoarchivonoticia":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"archivonoticia":"'.$datos[$i+2][9].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio048($idcondominio,$idreclamosugerencia)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarReclamoSugerencia($idcondominio, $idreclamosugerencia);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"codigoreclamosugerencia":"'.$datos[1].'",';
        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[2].'",';
        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[3].'",';
        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[4].'",';
        $datos1 = $datos1.'"autor":"'.$datos[5].'",';
        $datos1 = $datos1.'"destinatario":"'.$datos[6].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio049($idcondominio,$idinmueble)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoReclamoSugerencia($idcondominio, $idinmueble);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "reclamossugerencias":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigoreclamosugerencia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"destinatario":"'.$datos[$i+2][5].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"codigoreclamosugerencia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"destinatario":"'.$datos[$i+2][5].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio050($codigonoticia, $fechanoticia, $descripcionnoticia, $estatusnoticia, 
       						$idtiponoticiamaestronoticia, $idloginnoticia, $cedulaautor, $idrol, $idcondominio, 
       						$nombrearchivo, $archivonoticia, $formatoarchivonoticia)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->RegistrarNoticia($codigonoticia, $fechanoticia, $descripcionnoticia, $estatusnoticia, 
       						$idtiponoticiamaestronoticia, $idloginnoticia, $cedulaautor, $idrol, $idcondominio, 
       						$nombrearchivo, $archivonoticia, $formatoarchivonoticia);
       $datos1 = $datos1.'{"exito":"'.$datos[0].'"}';
      
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio051($idpago)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarPago($idpago);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"fechapago":"'.$datos[1].'",';
        $datos1 = $datos1.'"descripcionpago":"'.$datos[2].'",';
        $datos1 = $datos1.'"montopago":"'.$datos[3].'",';
        $datos1 = $datos1.'"descripcionforma":"'.$datos[4].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio052()
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoFormasPago();
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "formaspago":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idformapagopago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoformapago":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionforma":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"estatusformadepago":"'.$datos[$i+2][4].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"idformapagopago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoformapago":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionforma":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"estatusformadepago":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio053($idcondominio,$idservicio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoProveedoresServicio($idcondominio, $idservicio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "proveedores":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idproveedor":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"rifproveedor":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"razonsocialproveedor":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"telefonoproveedor":"'.$datos[$i+2][4].'"},';
	        
	        }
	  		else
			{
			   $datos1 = $datos1.'{"idproveedor":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"rifproveedor":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"razonsocialproveedor":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"telefonoproveedor":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio054($idcondominio,$idproveedor)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoServiciosProveedor($idcondominio, $idproveedor);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "servicios":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigoservicio":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"descripcionservicio":"'.$datos[$i+2][2].'"},';
	        
	        }
	  		else
			{
			    $datos1 = $datos1.'{"codigoservicio":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"descripcionservicio":"'.$datos[$i+2][2].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio055($idcondominio,$idproveedor)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoFacturasProveedor($idcondominio, $idproveedor);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "facturas":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idcomprobantedepago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigocomprobantedepago":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcioncomprobantedepago":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"fechacomprobantedepago":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"montototalcomprobante":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][6].'"},';
	        
	        }
	  		else
			{
			   $datos1 = $datos1.'{"idcomprobantedepago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigocomprobantedepago":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcioncomprobantedepago":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"fechacomprobantedepago":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"montototalcomprobante":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][6].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio056($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoProveedores($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "proveedores":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"rifproveedor":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"razonsocialproveedor":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"telefonoproveedor":"'.$datos[$i+2][4].'",';
			$datos1 = $datos1.'"idproveedor":"'.$datos[$i+2][6].'",'; /*agregado*/
		        $datos1 = $datos1.'"correoproveedor":"'.$datos[$i+2][5].'"},';
	        
	        }
	  		else
			{
			$datos1 = $datos1.'{"rifproveedor":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"razonsocialproveedor":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"telefonoproveedor":"'.$datos[$i+2][4].'",';
			$datos1 = $datos1.'"idproveedor":"'.$datos[$i+2][6].'",';   /* agregado*/
		        $datos1 = $datos1.'"correoproveedor":"'.$datos[$i+2][5].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio057($idcondominio,$fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoPagosProveedores($idcondominio, $fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "pagos":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"fechapago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"descripcionforma":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montopago":"'.$datos[$i+2][4].'"},';
	        
	        }
	  		else
			{
			    $datos1 = $datos1.'{"fechapago":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"descripcionforma":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"nombreproveedor":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"montopago":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio058($idreservacion,$idcondominio,$fechareservacion)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarListaInvitados($idreservacion, $idcondominio, $fechareservacion);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"listainvitadosreservacion":"'.$datos[1].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio059($codigopersona,$codigoinmueble,$idrol,$usuario,$nuevaclave,$correo,$direccion,$telefono)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ActualizarUsuario($codigopersona, $codigoinmueble, $idrol, $usuario, $nuevaclave, $correo, $direccion, $telefono);
       $datos1 = $datos1.'{"exito":"'.$datos[0].'"}';
      
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }

 function Servicio060($usuario,$clave)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->IniciarSesion($usuario, $clave);
       
       if ($datos[0]=="true")
       {
             
       
	      if(strtolower($datos[1])=="copropietario")
	      {
	        $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
	        $datos1 = $datos1.'"rol":"'.$datos[1].'",';
	        $datos1 = $datos1.'"cedula":"'.$datos[2].'",';
	        $datos1 = $datos1.'"idcopropietario":"'.$datos[4].'",';
	        $datos1 = $datos1.'"nombre":"'.$datos[5].'",';
	        $datos1 = $datos1.'"apellido":"'.$datos[6].'",';
	        $datos1 = $datos1.'"formatofoto":"'.$datos[7].'",';
	        $datos1 = $datos1.'"nombrefoto":"'.$datos[8].'",';
	        $datos1 = $datos1.'"foto":"'.base64_encode($datos[9]).'",';
	        $datos1 = $datos1.'"estatus":"'.$datos[10].'",';
	        $datos1 = $datos1.'"idcondominio":"'.$datos[11].'",';
	        $datos1 = $datos1.'"nombrecondominio":"'.$datos[12].'",';
		$datos1 = $datos1.'"idinmueble":"'.$datos[13].'",';
		$datos1 = $datos1.'"idlogin":"'.$datos[14].'",';
		$datos1 = $datos1.'"idrol":"'.$datos[15].'",';
	        $datos1 = $datos1.'"codigoinmueble":"'.$datos[3].'"}';
	      }
	      else if((strtolower($datos[1])=="empleado")||(strtolower($datos[1])=="administrador")||(strtolower($datos[1])=="vigilante"))
	      {
	      
	      
	        $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
	        $datos1 = $datos1.'"rol":"'.$datos[1].'",';
	        $datos1 = $datos1.'"cedula":"'.$datos[3].'",';
	        $datos1 = $datos1.'"idempleado":"'.$datos[2].'",';
	        $datos1 = $datos1.'"nombre":"'.$datos[4].'",';
	        $datos1 = $datos1.'"apellido":"'.$datos[5].'",';
	        $datos1 = $datos1.'"formatofoto":"'.$datos[8].'",';
	        $datos1 = $datos1.'"nombrefoto":"'.$datos[7].'",';
	        $datos1 = $datos1.'"foto":"'.base64_encode($datos[9]).'",';
	        $datos1 = $datos1.'"idcondominio":"'.$datos[11].'",';
	        $datos1 = $datos1.'"nombrecondominio":"'.$datos[12].'",';
		$datos1 = $datos1.'"idlogin":"'.$datos[17].'",';/*Agregado*/
		$datos1 = $datos1.'"idrol":"'.$datos[15].'",';/*Agregado*/
	        $datos1 = $datos1.'"estatus":"'.$datos[10].'"}';
	     
	           
	     }
	      else if(strtolower(($datos[1]))=="superusuario")
	      {
	      
	      
	        $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
	        $datos1 = $datos1.'"rol":"'.$datos[1].'",';
	        $datos1 = $datos1.'"codigosuperusuario":"'.$datos[2].'",';
	        $datos1 = $datos1.'"idsuperusuario":"'.$datos[3].'",';
	        $datos1 = $datos1.'"nombre":"'.$datos[4].'",';
	        $datos1 = $datos1.'"apellido":"'.$datos[5].'",';
	        $datos1 = $datos1.'"correo":"'.$datos[6].'",';
	        $datos1 = $datos1.'"nombrefoto":"'.$datos[7].'",';
	        $datos1 = $datos1.'"formatofoto":"'.$datos[8].'",';
	        $datos1 = $datos1.'"foto":"'.base64_encode($datos[9]).'"}';
	     
	     
	      }
	
	    else if(strtolower($datos[1])=="junta de condominio")
	      {
	      
	        $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
	        $datos1 = $datos1.'"rol":"'.$datos[1].'",';
	        $datos1 = $datos1.'"cedula":"'.$datos[2].'",';
	        $datos1 = $datos1.'"nombre":"'.$datos[3].'",';
	        $datos1 = $datos1.'"apellido":"'.$datos[4].'",';
	        $datos1 = $datos1.'"formatofoto":"'.$datos[5].'",';
	        $datos1 = $datos1.'"nombrefoto":"'.$datos[6].'",';
	        $datos1 = $datos1.'"foto":"'.base64_encode($datos[7]).'",';
	        $datos1 = $datos1.'"idcondominio":"'.$datos[9].'",';
	        $datos1 = $datos1.'"nombrecondominio":"'.$datos[12].'",';
		$datos1 = $datos1.'"idlogin":"'.$datos[10].'",';
		$datos1 = $datos1.'"idrol":"'.$datos[15].'",';
	        $datos1 = $datos1.'"estatus":"'.$datos[8].'"}';
	      }
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
 function Servicio061($idvisitante)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarVisitante($idvisitante);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"cedulavisitante":"'.$datos[1].'",';
        $datos1 = $datos1.'"nombrevisitante":"'.$datos[2].'",';
        $datos1 = $datos1.'"apellidovisitante":"'.$datos[3].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio062($idnoticia)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarNoticia($idnoticia);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"codigonoticia":"'.$datos[1].'",';
        $datos1 = $datos1.'"fechanoticia":"'.$datos[2].'",';
        $datos1 = $datos1.'"descripcionnoticia":"'.$datos[3].'",';
        $datos1 = $datos1.'"nombrearchivonoticia":"'.$datos[4].'",';
        $datos1 = $datos1.'"formatoarchivonoticia":"'.$datos[5].'",';
        $datos1 = $datos1.'"archivonoticia":"'.$datos[6].'",';
        $datos1 = $datos1.'"estatusnoticia":"'.$datos[7].'",';
        $datos1 = $datos1.'"idtiponoticiamaestronoticia":"'.$datos[8].'",';
        $datos1 = $datos1.'"cedulaautor":"'.$datos[9].'",';
        $datos1 = $datos1.'"idrol":"'.$datos[10].'",';
        $datos1 = $datos1.'"idcondominio":"'.$datos[11].'",';
        $datos1 = $datos1.'"nombretiponoticiamaestro":"'.$datos[12].'",';
        $datos1 = $datos1.'"nombrecondominio":"'.$datos[13].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio063($idcotizacion)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarCotizacion($idcotizacion);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"codigocotizacion":"'.$datos[1].'",';
        $datos1 = $datos1.'"descripcioncotizacion":"'.$datos[2].'",';
        $datos1 = $datos1.'"fechacotizacion":"'.$datos[3].'",';
        $datos1 = $datos1.'"fechavencimientocotizacion":"'.$datos[4].'",';
        $datos1 = $datos1.'"aprobacioncotizacion":"'.$datos[5].'",';
        $datos1 = $datos1.'"montocotizacion":"'.$datos[6].'",';
        $datos1 = $datos1.'"estatuscotizacion":"'.$datos[7].'",';
        $datos1 = $datos1.'"idproveedor":"'.$datos[8].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio064($idproveedor)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoCotizacionesProveedor($idproveedor);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "cotizaciones":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigocotizacion":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"descripcioncotizacion":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechacotizacion":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"fechavencimientocotizacion":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"aprobacioncotizacion":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"montocotizacion":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatuscotizacion":"'.$datos[$i+2][7].'"},';
	        
	        }
	  		else
			{
			    $datos1 = $datos1.'{"codigocotizacion":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"descripcioncotizacion":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechacotizacion":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"fechavencimientocotizacion":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"aprobacioncotizacion":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"montocotizacion":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatuscotizacion":"'.$datos[$i+2][7].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio065($fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoReclamoSugerenciaFechas($fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "reclamosugerencias":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idreclamosugerencia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoreclamosugerencia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"idinmueblereclamosugerencia":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatusreclamosugerencia":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"idcondominio":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"nombrecondominio":"'.$datos[$i+2][9].'"},';
	        
	        }
	  		else
			{
			    $datos1 = $datos1.'{"idreclamosugerencia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoreclamosugerencia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"idinmueblereclamosugerencia":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatusreclamosugerencia":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"idcondominio":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"nombrecondominio":"'.$datos[$i+2][9].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio066($idcontrolvisita,$idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarVisita($idcontrolvisita, $idcondominio);
       if ($datos[0]=="true")
       {
      
       $datos1 = $datos1.'{"existe":"'.$datos[0].'",';
        $datos1 = $datos1.'"idvisitante":"'.$datos[1].'",';
        $datos1 = $datos1.'"nombrevisitante":"'.$datos[2].'",';
        $datos1 = $datos1.'"apellidovisitante":"'.$datos[3].'",';
        $datos1 = $datos1.'"fechavisita":"'.$datos[4].'",';
        $datos1 = $datos1.'"horavisita":"'.$datos[5].'",';
        $datos1 = $datos1.'"codigoinmueble":"'.$datos[6].'"}';
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }
function Servicio067($idcondominio,$fecha1,$fecha2)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoNoticiasReunion($idcondominio, $fecha1, $fecha2);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "noticiasreunion":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigonoticia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"fechanoticia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionnoticia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"usuariologin":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"nombrerol":"'.$datos[$i+2][5].'"},';
	        
	        }
	  		else
			{
			     $datos1 = $datos1.'{"codigonoticia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"fechanoticia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"descripcionnoticia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"usuariologin":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"nombrerol":"'.$datos[$i+2][5].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio068($idcondominio,$codigoareacomun)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarAreaComun($idcondominio, $codigoareacomun);
       
       if($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"nombreareacomun":"'.$datos[2][4].'","descripcionareacomun":"'.$datos[2][5].'","numdias":"'.$datos[1].'", "horario":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"diahorario":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"horainicio":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"horafin":"'.$datos[$i+2][3].'"},';
	        
	        }
	  		else
			{
			    $datos1 = $datos1.'{"diahorario":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"horainicio":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"horafin":"'.$datos[$i+2][3].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio069($idcondominio,$fecha1,$fecha2,$idareacomun)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoReservacionesAreaComunFechas($idcondominio, $fecha1, $fecha2, $idareacomun);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "reservaciones":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"idreservacion":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoreservacion":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechareservacion":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"nombrelistainvitadosreservacion":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"formatolistainvitadosreservacion":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"listainvitadosreservacion":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatusreservacion":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"montoapagar":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"idareacomunreservacion":"'.$datos[$i+2][9].'",';
		        $datos1 = $datos1.'"nombreareacomun":"'.$datos[$i+2][10].'",';
		        $datos1 = $datos1.'"idinmueblereservacion":"'.$datos[$i+2][11].'",';
		        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][12].'",';
		        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][13].'"},';
	        
	        }
	  		else
			{
			    $datos1 = $datos1.'{"idreservacion":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"codigoreservacion":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechareservacion":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"nombrelistainvitadosreservacion":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"formatolistainvitadosreservacion":"'.$datos[$i+2][5].'",';
		        $datos1 = $datos1.'"listainvitadosreservacion":"'.$datos[$i+2][6].'",';
		        $datos1 = $datos1.'"estatusreservacion":"'.$datos[$i+2][7].'",';
		        $datos1 = $datos1.'"montoapagar":"'.$datos[$i+2][8].'",';
		        $datos1 = $datos1.'"idareacomunreservacion":"'.$datos[$i+2][9].'",';
		        $datos1 = $datos1.'"nombreareacomun":"'.$datos[$i+2][10].'",';
		        $datos1 = $datos1.'"idinmueblereservacion":"'.$datos[$i+2][11].'",';
		        $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i+2][12].'",';
		        $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i+2][13].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio070($idcondominio,$codigoinmueble)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoReclamoSugerenciaAInmueble($idcondominio, $codigoinmueble);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "reclamossugerencias":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"codigoreclamosugerencia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"autor":"'.$datos[$i+2][5].'"},';
	        
	        }
	  		else
			{
				$datos1 = $datos1.'{"codigoreclamosugerencia":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"razonreclamosugerencia":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"fechareclamosugerencia":"'.$datos[$i+2][3].'",';
		        $datos1 = $datos1.'"descripcionreclamosugerencia":"'.$datos[$i+2][4].'",';
		        $datos1 = $datos1.'"autor":"'.$datos[$i+2][5].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
function Servicio071($codigopago,$idrecibocobro,$descripcionpago,$nrodocumento,$montopago,
 $fechapago,$estatuspago,$idformadepago,$idrazonpago,$idcondominio,$cidepositante,$idbanco)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       if($montopago>0)
       {
       	$datos = $objetoDatos->RegistrarPago($codigopago, $idrecibocobro, $descripcionpago, $nrodocumento, $montopago, $fechapago, $estatuspago, $idformadepago, $idrazonpago, $idcondominio, $cidepositante, $idbanco);
       	$datos1 = '{"exito":"'.$datos[0].'"}';
       }
       	else
     		$datos1 = '{"exito":"false"}';
       
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }

 //consultar tipo de transaccion
 function Servicio072($idtipotransaccion)
 {
   try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Banco();
       $datos = $objetoDatos->ConsultarTipoTransaccion($idtipotransaccion);
	
       if ($datos[0]=="true")
       {
        $datos1 = $datos1.'{"existe":"'.$datos[0].'" ,"descripcion":"'.$datos[1].'" }';
             }
       else {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
     }
     catch (Exception $e) {
      $datos1 = '{"existe":"'.$datos[0].'"}';
     }   
     return $datos1;
 }
 
 
 
 //CONSULTAR ANTECEDENTE
 function Servicio073($cedula)
 {
  try {
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Saime();
      $datos = $objetoDatos->ConsultarAntecedentes($cedula);
     
       if ($datos[0]=="true")	
       {
        
        $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "antecedentes":[';
	       
	for ($i=0; $i<($datos[1]); $i++) 
	{
	  if($i!=$datos[1]-1)
	  {
              $datos1 = $datos1.'{"fecha":"'.$datos[$i+2]['fecha'].'",';
	      $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'",';
	      $datos1 = $datos1.'"antecedenteid":"'.$datos[$i+2]['antecedenteid'].'"}, ';

          }
	  else
	  {
	      $datos1 = $datos1.'{"fecha":"'.$datos[$i+2]['fecha'].'",';
	      $datos1 = $datos1.'"descripcion":"'.$datos[$i+2]['descripcion'].'",';
	      $datos1 = $datos1.'"antecedenteid":"'.$datos[$i+2]['antecedenteid'].'"}]}';
	}
       }
      }
       else
       {
        $datos1 = '{"existe":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"existe":"'.$datos[0].'"}';
     }   
    return $datos1;
 }
 
 
//SERVICIOS OTROS

 /*Servicio notifica di el resgistro de pago se realizo con exito*/
 function Servicio074($CodigoP,$ObservacionesP,$ReferenciaP,$MontoP,$ValidacionP,$FechaP,$EstatusP,$FormaP,$IdrecibocobroP,$Idcondominio)
 {
  try {

       $datos = array();
       $datos1 = "";
       $datos[0] = $CodigoP;  
       $datos[1] = $ObservacionesP;
       $datos[2] = $ReferenciaP;
       $datos[3] = $MontoP;
       $datos[4] = $ValidacionP;
       $datos[5] = $FechaP;
       $datos[6] = $EstatusP;
       $datos[7] = $FormaP;
       $datos[8] = $IdrecibocobroP;
       $datos[9] = $Idcondominio;

       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->GrabarPago($datos);
       $contenido = "";
       if ($Existe==0)
       {
         $datos1 = '{"exito":"0","success":"false"}';
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"1","success":"true"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0","success":"false"}';
      $contenido = $datos1;
     }
     return $contenido;
 }


 function Servicio075($Usuario,$Clave)
 {
  try { 
       $usuario=$Usuario;
       $clave=$Clave;
       $datos = array();
       $datos1 = "";
       $datos[0] = $Usuario;  
       $datos[1] = $Clave;
       $Existe = 0;  
       $objetoDatos = new Moviles();
      // $validado=$objetoDatos->ValidarUsuario($usuario,$clave);
       //if ($validado==1) {      
             $Existe = $objetoDatos->BuscarUsuario($datos);
             $contenido = "";
             if ($Existe==1)
             {
              $datos1 = $datos1.'{"exito":"1",';
              $datos1 = $datos1.'"cedula":"'.$datos[0].'",';
              $datos1 = $datos1.'"nombre":"'.$datos[1].'",';
              $datos1 = $datos1.'"apellido":"'.$datos[2].'",';
              $datos1 = $datos1.'"foto":"'.base64_encode($datos[3]).'",';
              $datos1 = $datos1.'"codigoinmueble":"'.$datos[4].'",';
              $datos1 = $datos1.'"rifcondominio":"'.$datos[5].'",';
              $datos1 = $datos1.'"rol":"'.$datos[6].'",';
              $datos1 = $datos1.'"idinmueble":"'.$datos[7].'",';
              $datos1 = $datos1.'"idcondominio":"'.$datos[8].'",';
              $datos1 = $datos1.'"idlogin":"'.$datos[9].'"}';            
              $contenido = $datos1;
             }
             else
             {
              $datos1 = '{"exito":"0"}';
              $contenido = $datos1;
             }
       /*}//fin if
       else{
            $datos1 = '{"exito":"0"}';
            $contenido = $datos1;
       }*/

    }
    catch (Exception $e) {
     $datos1 = '{"exito":"0"}';
     $contenido = $datos1;
    }


    return $contenido;
 }

  function Servicio076()
 {
  try {
       $datos = array();
       $datos1 = "";
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->BuscarmiembrosJC($datos);
       $contenido = "";
       if ($Existe==1)
       {
        $datos1 = $datos1.'{"exito":"'.sizeof($datos).'" , "miembros":[';
        for ($i=0; $i<sizeof($datos); $i++) {
         if ($i<sizeof($datos)-1) {
          $datos1 = $datos1.'{"codigoinmueble":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"nombrecargo":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"telefonocopropietario":"'.$datos[$i][4].'"}, ';
         }
         else {
          $datos1 = $datos1.'{"codigoinmueble":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"nombrecopropietario":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"apellidocopropietario":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"nombrecargo":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"telefonocopropietario":"'.$datos[$i][4].'"}]} ';
         }
        }
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"0"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0"}';
      $contenido = $datos1;
     }
     return $contenido;
 }/*fin servicio 6*/

 function Servicio077($Idinmueble)
 {
  try { 

       $datos = array();
       $datos1 = "";
       $datos[0] = $Idinmueble;  
       $Existe = 0;
       $objetoDatos = new Moviles();  
             $Existe = $objetoDatos->BuscarMonto($datos);
             $contenido = "";
             if ($Existe==1)
             {
              $datos1 = $datos1.'{"exito":"1",';
              $datos1 = $datos1.'"monto":"'.$datos[0].'"}';
              $contenido = $datos1;
             }
             else
             {
              $datos1 = '{"exito":"0"}';
              $contenido = $datos1;
             }

    }
    catch (Exception $e) {
     $datos1 = '{"exito":"0"}';
     $contenido = $datos1;
    }


    return $contenido;
 } /*fin funcion 7*/

  function Servicio078($Idinmueble)
 {
  try {
       $datos = array();
       $datos1 = "";
       $datos[0] = $Idinmueble;  
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->BuscarListaRecibos($datos);
       $contenido = "";
       if ($Existe==1)
       {
        $datos1 = $datos1.'{"exito":"'.sizeof($datos).'" , "recibos":[';
        for ($i=0; $i<sizeof($datos); $i++) {
         if ($i<sizeof($datos)-1) {
          $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"codigorecibo":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"fecharecibo":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[$i][4].'", ';
          $datos1 = $datos1.'"abonorecibo":"'.$datos[$i][5].'", ';
          $datos1 = $datos1.'"montorecibo":"'.$datos[$i][6].'"}, ';
         }
         else {
          $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"codigorecibo":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"fecharecibo":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"cuotapendienterecibo":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"fechavencimientorecibo":"'.$datos[$i][4].'", ';
          $datos1 = $datos1.'"abonorecibo":"'.$datos[$i][5].'", ';
          $datos1 = $datos1.'"montorecibo":"'.$datos[$i][6].'"}]} ';
         }
        }
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"0"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0"}';
      $contenido = $datos1;
     }
     return $contenido;
 }/*fin servicio 8*/

function Servicio079($Idinmueble)
 {
  try {
       $datos = array();
       $datos1 = "";
       $datos[0] = $Idinmueble;  
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->BuscarListaRecibosCancelados($datos);
       $contenido = "";
       if ($Existe==1)
       {
        $datos1 = $datos1.'{"exito":"'.sizeof($datos).'" , "recibos":[';
        for ($i=0; $i<sizeof($datos); $i++) {
         if ($i<sizeof($datos)-1) {
          $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"codigorecibo":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"montorecibo":"'.$datos[$i][2].'"}, ';
         }
         else {
          $datos1 = $datos1.'{"idrecibocobro":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"codigorecibo":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"montorecibo":"'.$datos[$i][2].'"}]} ';
         }
        }
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"0"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0"}';
      $contenido = $datos1;
     }
     return $contenido;
 }/*fin servicio 9*/

 function Servicio080($idrecibocobropago)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $datos[0] = $idrecibocobropago;  
       $Existe = 0;  
       $objetoDatos = new Moviles();    
             $Existe = $objetoDatos->BuscarDetallePagoRC($datos);
             $contenido = "";
             if ($Existe==1)
             {
              $datos1 = $datos1.'{"exito":"1",';
              $datos1 = $datos1.'"descripcion":"'.$datos[0].'",';
              $datos1 = $datos1.'"referencia":"'.$datos[1].'",';
              $datos1 = $datos1.'"monto":"'.$datos[2].'",';
              $datos1 = $datos1.'"fecha":"'.$datos[3].'"}';            
              $contenido = $datos1;
             }
             else
             {
              $datos1 = '{"exito":"0"}';
              $contenido = $datos1;
             }

    }
    catch (Exception $e) {
     $datos1 = '{"exito":"0"}';
     $contenido = $datos1;
    }


    return $contenido;
 }/*fin servicio 10*/

  function Servicio081($Idinmueble)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $datos[0] = $Idinmueble;  
       $Existe = 0;  
       $objetoDatos = new Moviles();  
             $Existe = $objetoDatos->informacioninmueble($datos);
             $contenido = "";
             if ($Existe==1)
             {
              $datos1 = $datos1.'{"exito":"1",';
              $datos1 = $datos1.'"codigo":"'.$datos[0].'",';
              $datos1 = $datos1.'"mts2":"'.$datos[1].'",';
              $datos1 = $datos1.'"alicuota":"'.$datos[2].'",';
              $datos1 = $datos1.'"descripcion":"'.$datos[3].'",';
              $datos1 = $datos1.'"catastral":"'.$datos[4].'",';
              $datos1 = $datos1.'"condominio":"'.$datos[5].'"}';            
              $contenido = $datos1;
             }
             else
             {
              $datos1 = '{"exito":"0"}';
              $contenido = $datos1;
             }

    }
    catch (Exception $e) {
     $datos1 = '{"exito":"0"}';
     $contenido = $datos1;
    }


    return $contenido;
 }/*fin servicio 11*/

 function Servicio082($Idcondominio)
 {
  try {
       $datos = array();
       $datos1 = "";
       $datos[0] = $Idcondominio;  
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->BuscarAreasComunes($datos);
       $contenido = "";
       if ($Existe==1)
       {
        $datos1 = $datos1.'{"exito":"'.sizeof($datos).'" , "areas":[';
        for ($i=0; $i<sizeof($datos); $i++) {
         if ($i<sizeof($datos)-1) {
          $datos1 = $datos1.'{"idareacomun":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"codigoareacomun":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"descripcionareacomun":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"capacidadareacomun":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"idcondominoareacomun":"'.$datos[$i][4].'", ';
          $datos1 = $datos1.'"nombreareacomun":"'.$datos[$i][5].'"}, ';
         }
         else {
          $datos1 = $datos1.'{"idareacomun":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"codigoareacomun":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"descripcionareacomun":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"capacidadareacomun":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"idcondominoareacomun":"'.$datos[$i][4].'", ';
          $datos1 = $datos1.'"nombreareacomun":"'.$datos[$i][5].'"}]} ';
         }
        }
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"0"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0"}';
      $contenido = $datos1;
     }
     return $contenido;
 }/*fin servicio 12*/

function Servicio083($Fecha,$idareacomun,$Idinmueblereservacion)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $datos[0] = $Fecha; 
       $datos[1] = $idareacomun;  
       $datos[2] = $Idinmueblereservacion;   
       $Existe = 0;  
       $objetoDatos = new Moviles();   
             $Existe = $objetoDatos->verificarArea($datos);
             $contenido = "";
             if ($Existe==1)
             {
              $datos1 = $datos1.'{"exito":"1",';
              $datos1 = $datos1.'"nombrecop":"'.$datos[0].'",';
              $datos1 = $datos1.'"apellidocop":"'.$datos[1].'",';
              $datos1 = $datos1.'"telefonocop":"'.$datos[2].'",';
              $datos1 = $datos1.'"codigoin":"'.$datos[3].'"}';            
              $contenido = $datos1;
             }
             else
             {
              $datos1 = '{"exito":"0","exito":"false"}';
              $contenido = $datos1;
             }

    }
    catch (Exception $e) {
     $datos1 = '{"exito":"0"}';
     $contenido = $datos1;
    }


    return $contenido;
 }/*fin servicio 13*/

  function Servicio084($Fecha,$Estatus,$MontoPagar,$Idreserva,$Idinmueblereservacion,$MontoAbonado)
 {
  try {

       $datos = array();
       $datos1 = "";
       $datos[0] = $Fecha;  
       $datos[1] = $Estatus;
       $datos[2] = $MontoPagar;
       $datos[3] = $Idreserva;
       $datos[4] = $Idinmueblereservacion;
       $datos[5] = $MontoAbonado;
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->GrabarReservacion($datos);
       $contenido = "";
       if ($Existe==0)
       {
         $datos1 = '{"exito":"0","success":"false"}';
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"1","success":"true"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0","success":"false"}';
      $contenido = $datos1;
     }
     return $contenido;
 }

  function Servicio085($Idcondominio)
 {
  try {
       $datos = array();
       $datos1 = "";
       $datos[0] = $Idcondominio;  
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->BuscarNoticiasCondominio($datos);
       $contenido = "";
       if ($Existe==1)
       {
        $datos1 = $datos1.'{"exito":"'.sizeof($datos).'" , "noticias":[';
        for ($i=0; $i<sizeof($datos); $i++) {
         if ($i<sizeof($datos)-1) {
          $datos1 = $datos1.'{"fecha":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"descripcion":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"codigo":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"cedula":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"nombre":"'.$datos[$i][4].'", ';
          $datos1 = $datos1.'"apellido":"'.$datos[$i][5].'"}, ';
         }
         else {
          $datos1 = $datos1.'{"fecha":"'.$datos[$i][0].'", ';
          $datos1 = $datos1.'"descripcion":"'.$datos[$i][1].'", ';
          $datos1 = $datos1.'"codigo":"'.$datos[$i][2].'", ';
          $datos1 = $datos1.'"cedula":"'.$datos[$i][3].'", ';
          $datos1 = $datos1.'"nombre":"'.$datos[$i][4].'", ';
          $datos1 = $datos1.'"apellido":"'.$datos[$i][5].'"}]} ';
         }
        }
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"0"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0"}';
      $contenido = $datos1;
     }
     return $contenido;
 }/*fin servicio 15*/

  function Servicio086($Fecha,$Descripcion,$Estatus,$Tiponoticia,$Idlogin,$Cedula,$Idcondominio)
 {
  try {

       $datos = array();
       $datos1 = "";
       $datos[0] = $Fecha;  
       $datos[1] = $Descripcion;
       $datos[2] = $Estatus;
       $datos[3] = $Tiponoticia;
       $datos[4] = $Idlogin;
       $datos[5] = $Cedula;
       $datos[6] = $Idcondominio;
       $Existe = 0;
       $objetoDatos = new Moviles();
       $Existe = $objetoDatos->GrabarPublicacion($datos);
       $contenido = "";
       if ($Existe==0)
       {
         $datos1 = '{"exito":"0","success":"false"}';
        $contenido = $datos1;
       }
       else {
        $datos1 = '{"exito":"1","success":"true"}';
        $contenido = $datos1;
       }
     }
     catch (Exception $e) {
      $datos1 = '{"exito":"0","success":"false"}';
      $contenido = $datos1;
     }
     return $contenido;
 }

//SERVICIOS OTROS
 

 function Servicio087($usuario,$clave)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListaOpcionesMenu($usuario,$clave);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "opciones":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
		
			
			if($i!=$datos[1]-1)
	  		{
		        $datos1 = $datos1.'{"actividad":"'.$datos[$i+2][1].'",';
		        $datos1 = $datos1.'"text":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"vinculo":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"ruta":"'.$datos[$i+2][3].'"},';
	        
			}
	  		else
			{
			$datos1 = $datos1.'{"actividad":"'.$datos[$i+2][1].'",';
			$datos1 = $datos1.'"text":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"vinculo":"'.$datos[$i+2][2].'",';
		        $datos1 = $datos1.'"ruta":"'.$datos[$i+2][3].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 
function Servicio088($codigopersona,$codigoinmueble,$idrol,$usuario,$nuevaclave,$correo,$direccion,$telefono, $nombrefoto, $formatofoto,$fotousuario)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ActualizarUsuarioFoto($codigopersona, $codigoinmueble, $idrol, $usuario, $nuevaclave, $correo, $direccion, $telefono, $nombrefoto, $formatofoto,$fotousuario);
       $datos1 = $datos1.'{"exito":"'.$datos[0].'"}';
      
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 
function Servicio089($idcondominio)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoBancoCondominio($idcondominio);
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "bancos":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{
		
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idbanco":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombrebanco":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"rifbanco":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"estatusbanco":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"codigobanco":"'.$datos[$i+2][5].'"}, ';
	        }
	  		else
			{
	        $datos1 = $datos1.'{"idbanco":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombrebanco":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"rifbanco":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"estatusbanco":"'.$datos[$i+2][4].'",';
	        $datos1 = $datos1.'"codigobanco":"'.$datos[$i+2][5].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 
function Servicio090($idcopropietario,$correo,$direccion,$telefono)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ActualizarCopropietario($idcopropietario,$correo,$direccion,$telefono);
       $datos1 = $datos1.'{"exito":"'.$datos[0].'"}';
      
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 } 
 
function Servicio091()
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoTiposNoticias();
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "noticias":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{		
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idtipo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombretipo":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"estatustipo":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"codigotipo":"'.$datos[$i+2][4].'"}, ';
	  		}
	  		else
			{
		$datos1 = $datos1.'{"idtipo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombretipo":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"estatustipo":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"codigotipo":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 } 
 
function Servicio092($idempleado, $mes)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ConsultarNominaEmpleado($idempleado, $mes);
       if ($datos[0]=="true")
       {
      $datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "nominas":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{		
			
			if($i!=$datos[1]-1)
	  		{
			  $datos1 = $datos1.'{"existe":"'.$datos[$i+2][0].'",';
			  $datos1 = $datos1.'"idnomina":"'.$datos[$i+2][1].'",';
			  $datos1 = $datos1.'"codigonomina":"'.$datos[$i+2][2].'",';
			  $datos1 = $datos1.'"fecha":"'.$datos[$i+2][3].'",';
			  $datos1 = $datos1.'"sueldoneto":"'.$datos[$i+2][4].'",';
			  $datos1 = $datos1.'"asignaciones":"'.$datos[$i+2][5].'",';
			  $datos1 = $datos1.'"deducciones":"'.$datos[$i+2][6].'",';
			  $datos1 = $datos1.'"sueldototal":"'.$datos[$i+2][7].'",';
			  $datos1 = $datos1.'"estatus":"'.$datos[$i+2][8].'",';
			  $datos1 = $datos1.'"formapago":"'.$datos[$i+2][9].'"}, ';
	  		}
	  		else
			{
			  $datos1 = $datos1.'{"existe":"'.$datos[$i+2][0].'",';
			  $datos1 = $datos1.'"idnomina":"'.$datos[$i+2][1].'",';
			  $datos1 = $datos1.'"codigonomina":"'.$datos[$i+2][2].'",';
			  $datos1 = $datos1.'"fecha":"'.$datos[$i+2][3].'",';
			  $datos1 = $datos1.'"sueldoneto":"'.$datos[$i+2][4].'",';
			  $datos1 = $datos1.'"asignaciones":"'.$datos[$i+2][5].'",';
			  $datos1 = $datos1.'"deducciones":"'.$datos[$i+2][6].'",';
			  $datos1 = $datos1.'"sueldototal":"'.$datos[$i+2][7].'",';
			  $datos1 = $datos1.'"estatus":"'.$datos[$i+2][8].'",';
			  $datos1 = $datos1.'"formapago":"'.$datos[$i+2][9].'"}]}';
	  		}
		}
      
       }else 
       $datos1 = '{"existe":"'.$datos[0].'"}';
  }
    catch (Exception $e) {
     $datos1 = '{"existe":"false"}';
     }   
    return $datos1;
 }

 function Servicio093($codigoreclamo, $razonreclamo, $fecha, $descripcion, $estatus, $idinmueblereclamo, 
						$codigoinmuebledestinatario, $idtiporeclamo)
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->RegistrarQueja($codigoreclamo, $razonreclamo, $fecha, $descripcion, $estatus, $idinmueblereclamo, 
						$codigoinmuebledestinatario, $idtiporeclamo);
       $datos1 = $datos1.'{"exito":"'.$datos[0].'"}';
      
  }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 }
 
 function Servicio094()
 {
  try { 
       $datos = array();
       $datos1 = "";
       $objetoDatos = new Moviles();
       $datos = $objetoDatos->ListadoTiposReclamos();
       if ($datos[0]=="true")	
       {
       	$datos1 = $datos1.'{"exito":"'.$datos[0].'" ,"numfilas":"'.$datos[1].'" , "tipos":[';
		for ($i=0; $i<($datos[1]); $i++) 
		{		
			
			if($i!=$datos[1]-1)
	  		{
	        $datos1 = $datos1.'{"idtipo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombretipo":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"codigotipo":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"estatustipo":"'.$datos[$i+2][4].'"}, ';
	  		}
	  		else
			{
		$datos1 = $datos1.'{"idtipo":"'.$datos[$i+2][1].'",';
	        $datos1 = $datos1.'"nombretipo":"'.$datos[$i+2][2].'",';
	        $datos1 = $datos1.'"codigotipo":"'.$datos[$i+2][3].'",';
	        $datos1 = $datos1.'"estatustipo":"'.$datos[$i+2][4].'"}]}';
	  		}
		}
		
       }
	    
         else
       {
        $datos1 = '{"exito":"'.$datos[0].'"}';
       }
    }
    catch (Exception $e) {
     $datos1 = '{"exito":"false"}';
     }   
    return $datos1;
 } 
 
 
 
}



//Laboratorio III. Dreamteam A. / EAI SERVICIOS 

?>

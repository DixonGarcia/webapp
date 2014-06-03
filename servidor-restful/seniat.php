<?php

/*
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/

require_once("Libreria_OO.php");
class Seniat
{ 
function BuscarRif($rif)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $rif=ucwords(strtolower($rif));
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from entejuridico where identejuridico='$rif' ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$resulado=array();
	$i=1;
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['nombre'];
	$datos[2]=$resultado['razonsocial'];
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
}

//Laboratorio III. Dreamteam A. / EAI SERVICIOS 
?>
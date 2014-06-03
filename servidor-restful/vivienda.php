<?php

/*
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/


require_once("Libreria_OO.php");
class Vivienda
{ 
 function ValidarCopropietarioInmueble($cedcopropietario,$codcatastral)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $nacionalidad=substr($cedcopropietario,0,1);
  $cedcopropietario=substr($cedcopropietario,1);
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from vivienda where codcatastral='$codcatastral'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  { 

  	$InstruccionSQL = "select count(*) from vivienda,persona where personaid='$cedcopropietario' 
			    and nacionalidadid='$nacionalidad' and codcatastral='$codcatastral' and persona.idpersona=vivienda.personaid";
  	$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
	
	if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  	{ 
		$datos[0]="true";
  	}
	else
	{
		$datos[0]="false";
		$datos[1]="2";//Error que resulta cuando el Inmueble no pertenece al copropietario dado
	}
  }
  else
  {
	$datos[0]="false";
	$datos[1]="1"; //Error que resulta cuando el Inmueble no existe
  }

  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
  function ConsultarInmueble($codcatastral)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from vivienda where codcatastral='$codcatastral'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[0]="true";
	$datos[1]=$resultado['numinmueble'];
	$datos[2]=$resultado['metrocuadrado'];
	$datos[3]=$resultado['alicuota'];
	$datos[4]=$resultado['direccion'];
	$datos[5]=$resultado['fechadocumento'];
	$datos[6]=$resultado['personaid'];
	$datos[7]=$resultado['nacionalidadid'];
  }
  else
  {
	$datos[0]="false";
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
}

//Laboratorio III. Dreamteam A. / EAI SERVICIOS 
?>
<?php
/*
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/

require_once("Libreria_OO.php");
class Banco
{ 
  function ConsultarCuentaBancaria($cuentabancaria)
  {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select cuentabancaria.tipocuenta,cuentabancaria.personaid,
			cuentabancaria.nacionalidadid,banco.nombre, cuentabancaria.saldo from cuentabancaria,banco
			where cuentabancaria.bancoid=banco.idbanco and 
			cuentabancaria.idcuentabancaria='$cuentabancaria' ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$resulado=array();
	$i=1;
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['tipocuenta'];
	$datos[2]=$resultado['nacionalidadid'].$resultado['personaid'];
	$datos[3]=$resultado['nombre'];
	$datos[4]=$resultado['saldo'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function AbonarTDC($numtarjeta,$cedtitular,$mesexpiracion,$annoexpiracion,$codseguridad,$monto)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $nacionalidad=substr($cedtitular,0,1);
  $cedtitular=substr($cedtitular,1);
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from tarjetacredito where idtarjetacredito='$numtarjeta' and
			mesexpiracion='$mesexpiracion' and annoexpiracion='$annoexpiracion' and codseguridad='$codseguridad' and 
			personaid='$cedtitular' and nacionalidadid='$nacionalidad'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$saldo=$resultado['saldo']+$monto;
	if($saldo<=$resultado['limite'])
	{
		$InstruccionSQL = "update tarjetacredito set saldo='$saldo'";
		if($ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion))
			$datos[0]="true";
		else
		{
			$datos[1]=1; //Error no se pudo completar la transaccion
			$datos[0]="false";
		}
	}	
	else
	{
		$datos[1]=2;//Error que resulta cuando el saldo de la tarjeta no es suficiente
		$datos[0]="false";
	}
  }
  else
{
    $datos[1]=1; //Error que resulta cuando los datos no coinciden
    $datos[0]="false";
}
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
	
 }

function ValidarTransaccion($numreferencia,$idbanco,$cedula,$monto,$fecha)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $nacionalidad=substr($cedula,0,1);
  $cedula=substr($cedula,1);
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select tipotransaccion.idtipotransaccion, transaccion.cuentabancariaid from transaccion, tipotransaccion where transaccion.idtransaccion='$numreferencia' 
 and transaccion.monto='$monto' and transaccion.fecha='$fecha' and transaccion.bancoid='$idbanco' and personaid='$cedula' and 	nacionalidadid='$nacionalidad' and tipotransaccion.idtipotransaccion=transaccion.tipotransaccionid";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[0]="true";
	$datos[1]=$resultado['idtipotransaccion'];
	$datos[2]=$resultado['cuentabancariaid'];
  }
  else
	$datos[0]="false";
 $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 
function ConsultarBancos()
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from banco";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resulado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i]['idbanco']=$resultado['idbanco'];
		$datos[$i]['rif']=$resultado['rif'];
		$datos[$i]['nombre']=$resultado['nombre'];
		$i++;
	}

  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 

	

  
 function ConsultarTipoTransaccion($idtipotransaccion)
  {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select descripcion from tipotransaccion where idtipotransaccion='$idtipotransaccion'";
  
 $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$resulado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['descripcion'];
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }




} 


//Laboratorio III. Dreamteam A. / EAI SERVICIOS 

?>

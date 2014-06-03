 <?php

 /*
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/
 
 
require_once("Libreria_OO.php");
class Moviles
{ 
function ListadoAreasComunes($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123"; 
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT * FROM gestioncondominio.areacomuns where idcondominioareacomun='$idcondominio' order by nombreareacomun";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['codigoareacomun'];
		$datos[$i][2]=$resultado['nombreareacomun'];
		$datos[$i][3]=$resultado['descripcionareacomun'];
		$datos[$i][4]=$resultado['capacidadareacomun'];
		$datos[$i][5]=$resultado['estatusareacomun'];
		$datos[$i][6]=$resultado['idareacomun'];  /* agregado */
		$i++;
	}

  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarReservacion($idreservacion)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT fechareservacion, nombrelistainvitadosreservacion,
					formatolistainvitadosreservacion, listainvitadosreservacion, estatusreservacion, 
					reservacions.montoapagar, idinmueblereservacion
					FROM gestioncondominio.reservacions  where idreservacion='$idreservacion'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['fechareservacion'];
	$datos[2]=$resultado['nombrelistainvitadosreservacion'];
	$datos[3]=$resultado['formatolistainvitadosreservacion'];
	$datos[4]=$resultado['listainvitadosreservacion'];
	$datos[5]=$resultado['estatusreservacion'];
	$datos[6]=$resultado['montoapagar'];
	$datos[7]=$resultado['idinmueblereservacion'];
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ListadoReservaciones($idcondominio,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idreservacion, codigoreservacion,areacomuns.idareacomun, fechareservacion, 
						nombrelistainvitadosreservacion,
						formatolistainvitadosreservacion, listainvitadosreservacion,estatusreservacion,
						montoapagar, nombreareacomun, idinmueblereservacion, 
						nombrecopropietario, apellidocopropietario
						FROM gestioncondominio.reservacions, inmuebles, areacomuns, copropietarios  
						where fechareservacion between  '$fecha1' and '$fecha2' 
						and reservacions.idinmueblereservacion=inmuebles.idinmueble
						and reservacions.idareacomunreservacion= areacomuns.idareacomun
						and inmuebles.idcopropietarioinmueble=copropietarios.idcopropietario
						and inmuebles.idcondominioinmueble='$idcondominio' order by fechareservacion";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idreservacion'];
		$datos[$i][2]=$resultado['codigoreservacion'];
		$datos[$i][3]=$resultado['fechareservacion'];
		$datos[$i][4]=$resultado['nombrelistainvitadosreservacion'];
		$datos[$i][5]=$resultado['formatolistainvitadosreservacion'];
		$datos[$i][6]=$resultado['listainvitadosreservacion'];
		$datos[$i][7]=$resultado['estatusreservacion'];
		$datos[$i][8]=$resultado['montoapagar'];
		$datos[$i][9]=$resultado['idinmueblereservacion'];
		$datos[$i][10]=$resultado['nombrecopropietario'];
		$datos[$i][11]=$resultado['apellidocopropietario'];
		$datos[$i][12]=$resultado['nombreareacomun'];
		$datos[$i][13]=$resultado['idareacomun'];
		$i++;
	}
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function RegistrarReservacion($codigoreservacion, $fechareservacion,
$estatusreservacion, $montoapagar, $idareacomunreservacion,
$idinmueblereservacion)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "INSERT INTO gestioncondominio.reservacions
					 (codigoreservacion, fechareservacion,
					estatusreservacion, montoapagar, idareacomunreservacion,
					idinmueblereservacion) 
					VALUES ('$codigoreservacion', '$fechareservacion',
					'$estatusreservacion', '$montoapagar', '$idareacomunreservacion',
					'$idinmueblereservacion')";
 if ($ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion))
  {
  	$datos[0]="true";
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function VerificarDisponibilidadArea($idarea,$idcondominio,$fecha)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT  idreservacion from reservacions, inmuebles where fechareservacion='$fecha' and reservacions.idinmueblereservacion=inmuebles.idinmueble and reservacions.idareacomunreservacion='$idarea' and inmuebles.idcondominioinmueble='$idcondominio'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
  	$datos[0]="false";
  }
  else
    $datos[0]="true";
    
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ConsultarTotalCobrarCondominioRecibosCobro($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT sum(recibocobros.montorecibocobro - recibocobros.abonorecibocobro) as monto
						from gestioncondominio.recibocobros, inmuebles
						where montorecibocobro>abonorecibocobro and
						recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and inmuebles.idcondominioinmueble='$idcondominio'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $resultado=mysql_fetch_array($ConjuntoDeRegistros);
  if($resultado['monto']=="") 
  	$datos[0]="0";
  else
  	$datos[0]=$resultado['monto'];
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos; 	
 }
 function ConsultarListadoRecibosCobro($idcondominio,$estatus)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  if($estatus!='todos')
  {
  	$InstruccionSQL = "SELECT idrecibocobro,
						codigorecibocobro,
						fecharecibocobro,
						montorecibocobro,
						cuotapendienterecibo,
						fechavencimientorecibo,
						idinmueble,
						idcopropietarioinmueble
						FROM recibocobros, inmuebles where 
						recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and inmuebles.idcondominioinmueble='$idcondominio'
						and recibocobros.estatuscancelacionrecibo='$estatus'
  ";
  }
  else
   {
  	$InstruccionSQL = "SELECT idrecibocobro,
						codigorecibocobro,
						fecharecibocobro,
						montorecibocobro,
						cuotapendienterecibo,
						fechavencimientorecibo,
						idinmueble,
						idcopropietarioinmueble,
						estatusrecibocobro
						FROM recibocobros, inmuebles where 
						recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and inmuebles.idcondominioinmueble='$idcondominio'
  ";
  }$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idrecibocobro'];
		$datos[$i][2]=$resultado['codigorecibocobro'];
		$datos[$i][3]=$resultado['fecharecibocobro'];
		$datos[$i][4]=$resultado['montorecibocobro'];
		$datos[$i][5]=$resultado['cuotapendienterecibo'];
		$datos[$i][6]=$resultado['fechavencimientorecibo'];
		$datos[$i][7]=$resultado['idinmueble'];
		$datos[$i][8]=$resultado['idcopropietarioinmueble'];
		if($estatus=='todos')
		$datos[$i][9]=$resultado['estatusrecibocobro'];
		$i++;
	}
  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoCondominios()
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idcondominio, rifcondominio, nombrecondominio,
						direccioncondominio, tipocondominios.nombretipocondominio, interesmoracondominio,
						tiempomoracondominio, fotocondominio
						 FROM gestioncondominio.condominios, gestioncondominio.tipocondominios
						where condominios.idtipocondominiocondominio=tipocondominios.codigotipocondominio";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idcondominio'];
		$datos[$i][2]=$resultado['rifcondominio'];
		$datos[$i][3]=$resultado['nombrecondominio'];
		$datos[$i][4]=$resultado['direccioncondominio'];
		$datos[$i][5]=$resultado['nombretipocondominio'];
		$datos[$i][6]=$resultado['interesmoracondominio'];
		$datos[$i][7]=$resultado['tiempomoracondominio'];
		$datos[$i][8]=$resultado['fotocondominio'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarCopropietario($cedula)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT copropietarios.idcopropietario,
						copropietarios.nombrecopropietario, copropietarios.apellidocopropietario,
						copropietarios.direccioncopropietario, copropietarios.correocopropietario,
						copropietarios.telefonocopropietario, copropietarios.fechacreacioncopropietario,
						copropietarios.fechanacimientocopropietario,
						copropietarios.formatofotocopropietario, 
						copropietarios.nombrefotocopropietario, 
						copropietarios.fotocopropietario,
						copropietarios.estatuscopropietario,
						copropietarios.twittercopropietario FROM gestioncondominio.copropietarios
						where copropietarios.cedulacopropietario='$cedula'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['idcopropietario'];
	$datos[2]=$resultado['nombrecopropietario'];
	$datos[3]=$resultado['apellidocopropietario'];
	$datos[4]=$resultado['direccioncopropietario'];
	$datos[5]=$resultado['correocopropietario'];
	$datos[6]=$resultado['telefonocopropietario'];
	$datos[7]=$resultado['fechacreacioncopropietario'];;
	$datos[8]=$resultado['fechanacimientocopropietario'];
	$datos[9]=$resultado['formatofotocopropietario'];
	$datos[10]=$resultado['nombrefotocopropietario'];
	$datos[11]=$resultado['fotocopropietario'];
	$datos[12]=$resultado['estatuscopropietario'];
	$datos[13]=$resultado['twittercopropietario'];
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoCopropietarios($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idcopropietario, copropietarios.cedulacopropietario,
						copropietarios.nombrecopropietario, copropietarios.apellidocopropietario,
						copropietarios.direccioncopropietario, copropietarios.correocopropietario,
						copropietarios.telefonocopropietario, copropietarios.fechacreacioncopropietario,
						copropietarios.fechanacimientocopropietario,
						copropietarios.formatofotocopropietario, 
						copropietarios.fotocopropietario,
						copropietarios.estatuscopropietario,
						copropietarios.twittercopropietario FROM gestioncondominio.copropietarios, inmuebles
						where copropietarios.idcopropietario=inmuebles.idcopropietarioinmueble
						and inmuebles.idcondominioinmueble='$idcondominio'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idcopropietario'];
		$datos[$i][2]=$resultado['cedulacopropietario'];
		$datos[$i][3]=$resultado['nombrecopropietario'];
		$datos[$i][4]=$resultado['apellidocopropietario'];
		$datos[$i][5]=$resultado['direccioncopropietario'];
		$datos[$i][6]=$resultado['correocopropietario'];
		$datos[$i][7]=$resultado['telefonocopropietario'];
		$datos[$i][8]=$resultado['fechacreacioncopropietario'];;
		$datos[$i][9]=$resultado['fechanacimientocopropietario'];
		$datos[$i][10]=$resultado['formatofotocopropietario'];
		$datos[$i][11]=$resultado['fotocopropietario'];
		$datos[$i][12]=$resultado['estatuscopropietario'];
		$datos[$i][13]=$resultado['twittercopropietario'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoCuentasBancarias($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT numerocuenta, nombrebanco,
						cedulatitularcuenta, nombretitularcuenta,
						tipocuenta, descripcionbanco, saldodisponible FROM gestioncondominio.cuentas, bancos
						where idcondominiocuenta='$idcondominio' and idbancocuenta=idbanco;";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['numerocuenta'];
		$datos[$i][2]=$resultado['nombrebanco'];
		$datos[$i][3]=$resultado['cedulatitularcuenta'];
		$datos[$i][4]=$resultado['nombretitularcuenta'];
		$datos[$i][5]=$resultado['tipocuenta'];
		$datos[$i][6]=$resultado['descripcionbanco'];
		$datos[$i][7]=$resultado['saldodisponible'];
		
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarEgreso($idegreso)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT codigoegreso, descripcionegreso, fechaegreso, montoegreso, 
						tipoegresos.nombretipoegreso FROM gestioncondominio.egresos, detalles, tipoegresos
						where detalles.iddetalle= egresos.iddetalles
						and detalles.idtipoegresodetalle=tipoegresos.idtipoegreso
						and idegreso='$idegreso';";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['codigoegreso'];
	$datos[2]=$resultado['descripcionegreso'];
	$datos[3]=$resultado['fechaegreso'];
	$datos[4]=$resultado['montoegreso'];
	$datos[5]=$resultado['nombretipoegreso'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoEgresosComunes($idrecibo)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idegresoxrecibo, detalles.descripciondetalle, montoegresoxrecibo
						FROM egresoxrecibos, detalles, egresos
						where egresoxrecibos.idegresoxrecibo=egresos.idegreso and
						egresos.iddetalles=detalles.iddetalle and 
						egresoxrecibos.idrecibocobro='$idrecibo'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idegresoxrecibo'];
		$datos[$i][2]=$resultado['descripciondetalle'];
		$datos[$i][3]=$resultado['montoegresoxrecibo'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoEgresosNoComunes($idrecibo)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idegresoxrecibo, detalles.descripciondetalle, montoegresoxrecibo
						FROM egresoxrecibos, detalles, egresonocomunxinmuebles, egresosnocomuns
						where 
						egresoxrecibos.idegresonocomunxinmueble=egresonocomunxinmuebles.idegresonocomunxinmueble
						and
						egresonocomunxinmuebles.idegresosnocomun=egresosnocomuns.idegresosnocomun
						and egresosnocomuns.iddetalle=detalles.iddetalle and 
						egresoxrecibos.idrecibocobro='$idrecibo';  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idegresoxrecibo'];
		$datos[$i][2]=$resultado['descripciondetalle'];
		$datos[$i][3]=$resultado['montoegresoxrecibo'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoEgresosComunesFechas($idcondominio,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idegreso,fechaegreso, detalles.descripciondetalle, detalles.montodetalle 
						FROM gestioncondominio.egresos, detalles
						where egresos.iddetalles=detalles.iddetalle
						and egresos.idcondominio='$idcondominio' and egresos.fechaegreso between 
						'$fecha1' and '$fecha2'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idegreso'];
		$datos[$i][2]=$resultado['descripciondetalle'];
		$datos[$i][3]=$resultado['montodetalle'];
		$datos[$i][4]=$resultado['fechaegreso']; /*agregado*/
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ActualizarEmpleado($cedula, $direccion,$telefono, $correo)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $InstruccionSQL = "UPDATE gestioncondominio.empleados
						SET direccionempledo='$direccion', telefonoempledo='$telefono', 
						correoempledo='$correo'
						WHERE cedulaempledo='$cedula'";
  $enlace = mysql_connect($Maquina, $UsuarioADM, $ClaveADM);
	if (!$enlace) 
	{
	    die('No se pudo conectar: ' . mysql_error());
	}
	mysql_select_db($BaseDeDatos);
  
	 if (mysql_query($InstruccionSQL))
	  {
	  	if(mysql_affected_rows()>0)
	  		$datos[0]="true";
	  	else
	    	$datos[0]="false";
	  }
	  else
	    $datos[0]="false";
	    mysql_close();
	  return $datos;
 }
function ConsultarEmpleado($idempleado,$idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select nombreempledo, apellidoempledo, direccionempledo, telefonoempledo, correoempledo, 
  					fechanacimientoempleado, nombrefotoempleado, formatofotoempleado, fotoempleado,
					sueldobase, estatusempleado, idloginempleado
					from gestioncondominio.empleados
					WHERE idempleado='$idempleado'
					and idcondominioempleado='$idcondominio'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['nombreempledo'];
	$datos[2]=$resultado['apellidoempledo'];
	$datos[3]=$resultado['direccionempledo'];
	$datos[4]=$resultado['telefonoempledo'];
	$datos[5]=$resultado['correoempledo'];
	$datos[6]=$resultado['fechanacimientoempleado'];
	$datos[7]=$resultado['nombrefotoempleado'];
	$datos[8]=$resultado['formatofotoempleado'];
	$datos[9]=$resultado['fotoempleado'];
	$datos[10]=$resultado['sueldobase'];
	$datos[11]=$resultado['estatusempleado'];
	$datos[12]=$resultado['idloginempleado'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoEmpleados($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select cedulaempledo,nombreempledo, apellidoempledo, direccionempledo, telefonoempledo, 
  						correoempledo, fechanacimientoempleado, nombrefotoempleado, formatofotoempleado, fotoempleado,
						sueldobase, estatusempleado, idloginempleado
						from gestioncondominio.empleados
						WHERE idcondominioempleado='$idcondominio'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['nombreempledo'];
		$datos[$i][2]=$resultado['apellidoempledo'];
		$datos[$i][3]=$resultado['direccionempledo'];
		$datos[$i][4]=$resultado['telefonoempledo'];
		$datos[$i][5]=$resultado['correoempledo'];
		$datos[$i][6]=$resultado['fechanacimientoempleado'];
		$datos[$i][7]=$resultado['nombrefotoempleado'];
		$datos[$i][8]=$resultado['formatofotoempleado'];
		$datos[$i][9]=$resultado['fotoempleado'];
		$datos[$i][10]=$resultado['sueldobase'];
		$datos[$i][11]=$resultado['estatusempleado'];
		$datos[$i][12]=$resultado['idloginempleado'];
		$datos[$i][13]=$resultado['cedulaempledo'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoPagosNomina($idcondominio,$idempleado,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idnomina, fechanominaempleado, nombreempledo, apellidoempledo, 
						sueldoneto, deduccionesnominaempleado, asignacionesnominaempleado, sueldototal
						FROM gestioncondominio.nominaempleados, empleados
						where nominaempleados.idempleado=empleados.idempleado
						and empleados.idcondominioempleado='$idcondominio'and empleados.idempleado='$idempleado'
						and fechanominaempleado between '$fecha1' and '$fecha2'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idnomina'];
		$datos[$i][2]=$resultado['fechanominaempleado'];
		$datos[$i][3]=$resultado['nombreempledo'];
		$datos[$i][4]=$resultado['apellidoempledo'];
		$datos[$i][5]=$resultado['sueldoneto']; 
		$datos[$i][6]=$resultado['deduccionesnominaempleado'];
		$datos[$i][7]=$resultado['asignacionesnominaempleado'];
		$datos[$i][8]=$resultado['sueldototal'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoFondosReserva($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idfondoreserva, codigofondoreserva,nombrefondoreserva, 
						objetivofondoreserva, montofijfondoreserva, saldoactual,
						estatusfondoreserva FROM gestioncondominio.fondoreservas 
						where fondoreservas.idcondominiofondoreserva='$idcondominio'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idfondoreserva'];
		$datos[$i][2]=$resultado['codigofondoreserva'];
		$datos[$i][3]=$resultado['nombrefondoreserva'];
		$datos[$i][4]=$resultado['objetivofondoreserva'];
		$datos[$i][5]=$resultado['montofijfondoreserva']; 
		$datos[$i][6]=$resultado['saldoactual'];
		$datos[$i][7]=$resultado['estatusfondoreserva'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarIngreso($idingreso)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT pagos.descripcionpago, pagos.fechapago, 
						ingresos.montoingreso, razondepagos.nombrerazondepago 
						FROM gestioncondominio.ingresos, pagos, razondepagos 
						where ingresos.idpagoingreso=pagos.idpago
						and pagos.idrazondepagopago=razondepagos.idrazondepago
						and idingresos='$idingreso'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['descripcionpago'];
	$datos[2]=$resultado['fechapago'];
	$datos[3]=$resultado['montoingreso'];
	$datos[4]=$resultado['nombrerazondepago'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoIngresos($idcondominio,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idingresos,fechaingreso, descripcioningreso,
					montoingreso 
					FROM gestioncondominio.ingresos
					where ingresos.idcondominio='$idcondominio'
					and fechaingreso between '$fecha1' and '$fecha2'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idingresos'];
		$datos[$i][2]=$resultado['fechaingreso'];
		$datos[$i][3]=$resultado['descripcioningreso'];
		$datos[$i][4]=$resultado['montoingreso'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarDeudaInmueble($idinmueble,$idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT sum(cuotapendienterecibo) as deuda FROM 
						gestioncondominio.recibocobros, inmuebles
						where recibocobros.idinmueblerecibocobro='$idinmueble' and 
						recibocobros.idinmueblerecibocobro=inmuebles.idinmueble and
						inmuebles.idcondominioinmueble='$idcondominio';
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	if($resultado['deuda']=="")
		$datos[0]='0';
	else
		$datos[0]=$resultado['deuda'];
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarInmueble($idinmueble,$idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT codigoinmueble, metroscuadradosinmueble, alicuotainmueble,
						descripcioninmueble, estatusinmueble, codigocatastralinmueble,
						idcopropietarioinmueble, idlogininmueble
						FROM gestioncondominio.inmuebles
						where idinmueble='$idinmueble' and idcondominioinmueble='$idcondominio';";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['codigoinmueble'];
	$datos[2]=$resultado['metroscuadradosinmueble'];
	$datos[3]=$resultado['alicuotainmueble'];
	$datos[4]=$resultado['descripcioninmueble'];
	$datos[5]=$resultado['estatusinmueble'];
	$datos[6]=$resultado['idcopropietarioinmueble'];
	$datos[7]=$resultado['idlogininmueble'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoInmueblesCopropietario($idcondominio,$idcopropietario)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT * FROM gestioncondominio.inmuebles
						where idcondominioinmueble='$idcondominio'
						and inmuebles.idcopropietarioinmueble='$idcopropietario';
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['codigoinmueble'];
		$datos[$i][2]=$resultado['metroscuadradosinmueble'];
		$datos[$i][3]=$resultado['alicuotainmueble'];
		$datos[$i][4]=$resultado['descripcioninmueble'];
		$datos[$i][5]=$resultado['estatusinmueble'];
		$datos[$i][6]=$resultado['codigocatastralinmueble'];
		$datos[$i][7]=$resultado['idlogininmueble'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarReciboCobroMes($idinmueble,$idcondominio,$mes)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idrecibocobro, codigorecibocobro, fecharecibocobro, 
						cuotapendienterecibo,fechavencimientorecibo, abonorecibocobro, 
						montorecibocobro, estatuscancelacionrecibo FROM 
						gestioncondominio.recibocobros, inmuebles
						Where recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and idcondominioinmueble='$idcondominio' and idinmueble='$idinmueble'
						and month(fecharecibocobro)='$mes'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['idrecibocobro'];
	$datos[2]=$resultado['codigorecibocobro'];
	$datos[3]=$resultado['fecharecibocobro'];
	$datos[4]=$resultado['cuotapendienterecibo'];
	$datos[5]=$resultado['fechavencimientorecibo'];
	$datos[6]=$resultado['abonorecibocobro'];
	$datos[7]=$resultado['montorecibocobro'];
	$datos[8]=$resultado['estatuscancelacionrecibo'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoRecibosInmueble($idcondominio,$codigoinmueble,$fecha1,$fecha2,$estatus)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  if($estatus!='todos')
  {
  $InstruccionSQL = "SELECT idrecibocobro, codigorecibocobro, fecharecibocobro, cuotapendienterecibo,
						fechavencimientorecibo, abonorecibocobro, montorecibocobro, estatuscancelacionrecibo 
						FROM gestioncondominio.recibocobros, inmuebles
						Where recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and idcondominioinmueble='$idcondominio' and 
						codigoinmueble='$codigoinmueble'
						and fecharecibocobro between '$fecha1' and '$fecha2'
						and estatuscancelacionrecibo='$estatus'
  ";
  }
  else
  {
  $InstruccionSQL = "SELECT idrecibocobro, codigorecibocobro, fecharecibocobro, cuotapendienterecibo,
						fechavencimientorecibo, abonorecibocobro, montorecibocobro, estatuscancelacionrecibo 
						FROM gestioncondominio.recibocobros, inmuebles
						Where recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and idcondominioinmueble='$idcondominio' and 
						codigoinmueble='$codigoinmueble'
						and fecharecibocobro between '$fecha1' and '$fecha2'";
	
  }
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idrecibocobro'];
		$datos[$i][2]=$resultado['codigorecibocobro'];
		$datos[$i][3]=$resultado['fecharecibocobro'];
		$datos[$i][4]=$resultado['cuotapendienterecibo'];
		$datos[$i][5]=$resultado['fechavencimientorecibo'];
		$datos[$i][6]=$resultado['abonorecibocobro'];
		$datos[$i][7]=$resultado['montorecibocobro'];
		if($estatus=='todos')
		$datos[$i][8]=$resultado['estatuscancelacionrecibo'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoInmuebles($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idinmueble, codigoinmueble, metroscuadradosinmueble,
						alicuotainmueble, descripcioninmueble, estatusinmueble, 
						codigocatastralinmueble, cedulacopropietario, nombrecopropietario,
						 apellidocopropietario
						FROM gestioncondominio.inmuebles, copropietarios
						where idcopropietario=idcopropietarioinmueble and idcondominioinmueble='$idcondominio'";
  
  
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idinmueble'];
		$datos[$i][2]=$resultado['codigoinmueble'];
		$datos[$i][3]=$resultado['metroscuadradosinmueble'];
		$datos[$i][4]=$resultado['alicuotainmueble'];
		$datos[$i][5]=$resultado['descripcioninmueble'];
		$datos[$i][6]=$resultado['estatusinmueble'];
		$datos[$i][7]=$resultado['codigocatastralinmueble'];
		$datos[$i][8]=$resultado['cedulacopropietario'];
		$datos[$i][9]=$resultado['nombrecopropietario'];
		$datos[$i][10]=$resultado['apellidocopropietario'];
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoInmueblesMorosos($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT codigoinmueble, alicuotainmueble, idcopropietario, 
						nombrecopropietario, apellidocopropietario,
						sum(cuotapendienterecibo) as deuda
						FROM gestioncondominio.recibocobros, inmuebles, copropietarios
						where 
						copropietarios.idcopropietario=inmuebles.idcopropietarioinmueble
						and recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and inmuebles.idcondominioinmueble='$idcondominio' group by recibocobros.idinmueblerecibocobro";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$resultado=array();
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		if($resultado['deuda']!="")
		{
			$datos[$i][1]=$resultado['codigoinmueble'];
			$datos[$i][2]=$resultado['alicuotainmueble'];
			$datos[$i][3]=$resultado['idcopropietario'];
			$datos[$i][4]=$resultado['nombrecopropietario'];
			$datos[$i][5]=$resultado['apellidocopropietario'];
			$datos[$i][6]=$resultado['deuda'];
			$i++;
		}
	}
	$datos[1]=$i-2;
	if($datos[1]==0)
		$datos[0]="false";
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoPagosReciboInmueble($codigoinmueble,$idcondominio,$npagos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT pagos.idpago, recibocobros.idrecibocobro,
						monthname(pagos.fechapago) as mes,
						pagos.descripcionpago, pagos.montopago,
						formapagos.descripcionforma  FROM gestioncondominio.pagos, recibocobros, 
						formapagos, inmuebles where pagos.idrecibocobropago = 
						recibocobros.idrecibocobro and formapagos.idformapagopago=
						pagos.idformapagopago and recibocobros.idinmueblerecibocobro=
						inmuebles.idinmueble and inmuebles.codigoinmueble='$codigoinmueble' 
						and pagos.idcondominio='$idcondominio' LIMIT  $npagos
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idpago'];
		$datos[$i][2]=$resultado['idrecibocobro'];
		$datos[$i][3]=$resultado['mes'];
		$datos[$i][4]=$resultado['descripcionpago'];
		$datos[$i][5]=$resultado['montopago'];
		$datos[$i][6]=$resultado['descripcionforma'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarJuntaCondominioActual($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT cargos.nombrecargo, nombrecopropietario, apellidocopropietario, 
						codigoinmueble, copropietarios.telefonocopropietario, fechainicio, 
						fechaculminacion 
						FROM gestioncondominio.juntacondominios, copropietarios, inmuebles, cargos
						where juntacondominios.idcondominiocondominio='$idcondominio'
						and juntacondominios.idcopropietario=copropietarios.idcopropietario
						and copropietarios.idcopropietario=inmuebles.idcopropietarioinmueble
						and juntacondominios.idcargojuntacondominio=cargos.idcargo
						and now() between fechainicio and fechaculminacion";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
  	
  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['nombrecargo'];
		$datos[$i][2]=$resultado['nombrecopropietario'];
		$datos[$i][3]=$resultado['apellidocopropietario'];
		$datos[$i][4]=$resultado['codigoinmueble'];
		$datos[$i][5]=$resultado['telefonocopropietario'];
		$datos[$i][6]=$resultado['fechainicio'];
		$datos[$i][7]=$resultado['fechaculminacion'];
		$i++;
  	}
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoTelefonos($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT cargos.nombrecargo, nombrecopropietario, apellidocopropietario, 
						copropietarios.telefonocopropietario
						FROM gestioncondominio.juntacondominios, copropietarios, cargos
						where juntacondominios.idcondominiocondominio='$idcondominio'
						and juntacondominios.idcopropietario=copropietarios.idcopropietario
						and juntacondominios.idcargojuntacondominio=cargos.idcargo
  ";
  $InstruccionSQL2 = "SELECT cargos.nombrecargo, nombreempledo, apellidoempledo, 
						empleados.telefonoempledo
						FROM gestioncondominio.empleados, cargos
						where empleados.idcondominioempleado='$idcondominio'
						and empleados.idcargoempleado=cargos.idcargo
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $ConjuntoDeRegistros2 = $ObjetoConeccion->EjecutarSQL($InstruccionSQL2,$MiConeccion);
  $datos[1]=mysql_num_rows($ConjuntoDeRegistros)+mysql_num_rows($ConjuntoDeRegistros2);	
  $i=2;
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$resultado=array();
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['nombrecargo'];
		$datos[$i][2]=$resultado['nombrecopropietario'];
		$datos[$i][3]=$resultado['apellidocopropietario'];
		$datos[$i][4]=$resultado['telefonocopropietario'];
		$i++;
	
	}
  }
 if (mysql_num_rows($ConjuntoDeRegistros2)>0) 
  {

	$resultado=array();
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros2))
	{	
		$datos[$i][1]=$resultado['nombrecargo'];
		$datos[$i][2]=$resultado['nombreempledo'];
		$datos[$i][3]=$resultado['apellidoempledo'];
		$datos[$i][4]=$resultado['telefonoempledo'];
		$i++;
	
	}
  }
  if($datos[1]==0)
  	$datos[0]="false";
  else
  	$datos[0]="true";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoMultasInmueble($idinmueble,$idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idmulta, codigomulta, descripcionmullta, montomulta,
						fechamulta, multas.idrecibocobro, tipomultas.nombremulta
						 FROM gestioncondominio.multas, inmuebles, tipomultas
						 where idinmueblemulta='$idinmueble' 
						and inmuebles.idcondominioinmueble='$idcondominio'
						and tipomultas.idtipomulta=multas.idtipomultamulta
						and inmuebles.idinmueble=multas.idinmueblemulta
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idmulta'];
		$datos[$i][2]=$resultado['codigomulta'];
		$datos[$i][3]=$resultado['descripcionmulta'];
		$datos[$i][4]=$resultado['montomulta'];
		$datos[$i][5]=$resultado['fechamulta'];
		$datos[$i][6]=$resultado['idrecibocobro'];
		$datos[$i][7]=$resultado['nombremulta'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoMultasCondominio($idcondominio,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idmulta, codigomulta, codigoinmueble, descripcionmullta, montomulta,
						fechamulta, tipomultas.nombremulta, multas.idrecibocobro
						FROM gestioncondominio.multas, inmuebles, tipomultas
						where tipomultas.idtipomulta=multas.idtipomultamulta
						and inmuebles.idinmueble=multas.idinmueblemulta and
						inmuebles.idcondominioinmueble='$idcondominio'
						and fechamulta between '$fecha1' and '$fecha2';
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idmulta'];
		$datos[$i][2]=$resultado['codigomulta'];
		$datos[$i][3]=$resultado['descripcionmulta'];
		$datos[$i][4]=$resultado['montomulta'];
		$datos[$i][5]=$resultado['fechamulta'];
		$datos[$i][6]=$resultado['idrecibocobro'];
		$datos[$i][7]=$resultado['nombremulta'];
		$datos[$i][8]=$resultado['codigoinmueble'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoNoticiasCondominio($idcondominio,$fecha1,$fecha2,$nnoticias)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT noticias.codigonoticia,
						noticias.fechanoticia,
						noticias.descripcionnoticia, logins.usuariologin, 
						rols.nombrerol, noticias.cedulaautor,
						noticias.nombrearchivonoticia,
						noticias.formatoarchivonoticia,
						noticias.archivonoticia
						FROM gestioncondominio.noticias, logins, rols
						WHERE  noticias.idloginnoticia=logins.idlogin
						and noticias.idrol=rols.idrol
						and noticias.idcondominio='$idcondominio' and 
						fechanoticia 
						between '$fecha1' and '$fecha2'  order by noticias.fechanoticia DESC LIMIT $nnoticias
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['codigonoticia'];
		$datos[$i][2]=$resultado['fechanoticia'];
		$datos[$i][3]=$resultado['descripcionnoticia'];
		$datos[$i][4]=$resultado['usuariologin'];
		$datos[$i][5]=$resultado['nombrerol'];
		$datos[$i][6]=$resultado['cedulaautor'];
		$datos[$i][7]=$resultado['nombrearchivonoticia'];
		$datos[$i][8]=$resultado['formatoarchivonoticia'];
		$datos[$i][9]=$resultado['archivonoticia'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarReclamoSugerencia($idcondominio,$idreclamosugerencia)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT reclamosugerencias.codigoreclamosugerencia,
						reclamosugerencias.razonreclamosugerencia, 
						reclamosugerencias.fechareclamosugerencia,
						reclamosugerencias.descripcionreclamosugerencia,
						reclamosugerencias.idinmueblereclamosugerencia as autor,
						codigoinmuebledestinatario as destinatario
						 FROM gestioncondominio.reclamosugerencias,gestioncondominio.condominios
						where condominios.idcondominio='$idcondominio' and 
						reclamosugerencias.idreclamosugerencia='$idreclamosugerencia';
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['codigoreclamosugerencia'];
	$datos[2]=$resultado['razonreclamosugerencia'];
	$datos[3]=$resultado['fechareclamosugerencia'];
	$datos[4]=$resultado['descripcionreclamosugerencia'];
	$datos[5]=$resultado['autor'];
	$datos[6]=$resultado['destinatario'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoReclamoSugerencia($idcondominio,$idinmueble)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT reclamosugerencias.codigoreclamosugerencia,
						reclamosugerencias.razonreclamosugerencia, 
						reclamosugerencias.fechareclamosugerencia,
						reclamosugerencias.descripcionreclamosugerencia,
						reclamosugerencias.codigoinmuebledestinatario as destino
						FROM gestioncondominio.reclamosugerencias,gestioncondominio.condominios
						where condominios.idcondominio='$idcondominio'
						and reclamosugerencias.idinmueblereclamosugerencia='$idinmueble'
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['codigoreclamosugerencia'];
		$datos[$i][2]=$resultado['razonreclamosugerencia'];
		$datos[$i][3]=$resultado['fechareclamosugerencia'];
		$datos[$i][4]=$resultado['descripcionreclamosugerencia'];
		$datos[$i][5]=$resultado['destino'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function RegistrarNoticia($codigonoticia, $fechanoticia, $descripcionnoticia,  
$estatusnoticia, $idtiponoticiamaestronoticia, $idloginnoticia, 
$cedulaautor, $idrol, $idcondominio,$nombrearchivo,$archivonoticia,$formatoarchivonoticia)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "INSERT INTO gestioncondominio.noticias  
						( idnoticia ,  codigonoticia ,  fechanoticia ,  descripcionnoticia, 
						estatusnoticia ,  idtiponoticiamaestronoticia ,  idloginnoticia ,  
						cedulaautor ,  idrol ,  idcondominio ,nombrearchivonoticia,archivonoticia,formatoarchivonoticia) VALUES 
						('', '$codigonoticia', '$fechanoticia', '$descripcionnoticia',  
						'$estatusnoticia', $idtiponoticiamaestronoticia, $idloginnoticia, 
						'$cedulaautor', $idrol, $idcondominio,'$nombrearchivo','$archivonoticia','$formatoarchivonoticia')
  ";
 $enlace = mysql_connect($Maquina, $UsuarioADM, $ClaveADM);
	if (!$enlace) 
	{
	    die('No se pudo conectar: ' . mysql_error());
	}
	mysql_select_db($BaseDeDatos);
  
	 if (mysql_query($InstruccionSQL))
	  {
	  	if(mysql_affected_rows()>0)
	  		$datos[0]="true";
	  	else
	    	$datos[0]="false";
	  }
	  else
	    $datos[0]="false";
	    mysql_close();
	  return $datos;
 }
function ConsultarPago($idpago)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT pagos.fechapago,pagos.descripcionpago,pagos.montopago, 
						formapagos.descripcionforma FROM gestioncondominio.pagos,
						gestioncondominio.formapagos where pagos.idformapagopago= 
						formapagos.idformapagopago and pagos.idpago='$idpago' 
						order by pagos.fechapago;
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['fechapago'];
	$datos[2]=$resultado['descripcionpago'];
	$datos[3]=$resultado['montopago'];
	$datos[4]=$resultado['descripcionforma'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoFormasPago()
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idformapagopago, codigoformapago, descripcionforma, estatusformadepago
 						FROM gestioncondominio.formapagos
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idformapagopago'];
		$datos[$i][2]=$resultado['codigoformapago'];
		$datos[$i][3]=$resultado['descripcionforma'];
		$datos[$i][4]=$resultado['estatusformadepago'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoProveedoresServicio($idcondominio,$idservicio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT distinct proveedors.idproveedor,
		      proveedors.nombreproveedor, 
		      proveedors.rifproveedor,
		      proveedors.razonsocialproveedor,
		      proveedors.telefonoproveedor, 
		      servicios.idservicio
		      FROM gestioncondominio.proveedorxservicios,
		      gestioncondominio.servicios,gestioncondominio.proveedorxcondominios,
		      gestioncondominio.proveedors
		      where proveedors. idproveedor=proveedorxcondominios.idproveedorproveedorxcndominio
		      and proveedorxcondominios.idproveedorxcondominio=proveedorxservicios.idproveedorxcondominioproveedorxservicio
		      and proveedorxservicios.idservicioproveedorxservicio=servicios.idservicio
		      and  proveedorxcondominios.idcondominioproveedorxcondominio='$idcondominio'
		      and servicios.idservicio='$idservicio'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idproveedor'];
		$datos[$i][2]=$resultado['rifproveedor'];
		$datos[$i][3]=$resultado['razonsocialproveedor'];
		$datos[$i][4]=$resultado['telefonoproveedor'];
		$datos[$i][5]=$resultado['nombreproveedor'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoServiciosProveedor($idcondominio,$idproveedor)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT distinct servicios.codigoservicio,servicios.descripcionservicio
		      FROM gestioncondominio.proveedorxservicios,
		      gestioncondominio.servicios,gestioncondominio.proveedorxcondominios,
		      gestioncondominio.proveedors
		      where proveedors. idproveedor=proveedorxcondominios.idproveedorproveedorxcndominio
		      and proveedorxcondominios.idproveedorxcondominio=proveedorxservicios.idproveedorxcondominioproveedorxservicio
		      and proveedorxservicios.idservicioproveedorxservicio=servicios.idservicio
		      and  proveedorxcondominios.idcondominioproveedorxcondominio='$idcondominio'
		      and proveedors.idproveedor='$idproveedor'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['codigoservicio'];
		$datos[$i][2]=$resultado['descripcionservicio'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoFacturasProveedor($idcondominio,$idproveedor)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idcomprobantedepago, codigocomprobantedepago,
		    comprobantedepagos.descripcioncomprobantedepago,
		    comprobantedepagos.fechacomprobantedepago,
		    comprobantedepagos.montototalcomprobante,
		    proveedors.nombreproveedor
		    FROM gestioncondominio.proveedorxcondominios,
		    gestioncondominio.proveedors,
		    gestioncondominio.comprobantedepagos
		    where comprobantedepagos.idproveedorxcondominiocomprobantedepago=
		    proveedorxcondominios.idproveedorxcondominio 
		    and proveedors.idproveedor=proveedorxcondominios.idproveedorproveedorxcndominio
		    and proveedors.idproveedor='$idproveedor' and 
		    proveedorxcondominios.idcondominioproveedorxcondominio='$idcondominio' order 
		     by comprobantedepagos.fechacomprobantedepago
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idcomprobantedepago'];
		$datos[$i][2]=$resultado['codigocomprobantedepago'];
		$datos[$i][3]=$resultado['descripcioncomprobantedepago'];
		$datos[$i][4]=$resultado['fechacomprobantedepago'];
		$datos[$i][5]=$resultado['montototalcomprobante'];
		$datos[$i][6]=$resultado['nombreproveedor'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
  function ListadoProveedores($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT distinct(proveedors.rifproveedor),proveedors.nombreproveedor,proveedors.razonsocialproveedor,
						proveedors.telefonoproveedor,proveedors.correoproveedor,proveedors.idproveedor /* agregador */
						FROM gestioncondominio.proveedorxcondominios,gestioncondominio.proveedors,
						gestioncondominio.condominios
						where proveedorxcondominios.idproveedorproveedorxcndominio=
						proveedors.idproveedor and condominios.idcondominio='$idcondominio'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['rifproveedor'];
		$datos[$i][2]=$resultado['nombreproveedor'];
		$datos[$i][3]=$resultado['razonsocialproveedor'];
		$datos[$i][4]=$resultado['telefonoproveedor'];
		$datos[$i][5]=$resultado['correoproveedor'];
		$datos[$i][6]=$resultado['idproveedor'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoPagosProveedores($idcondominio,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT codigocomprobantedepago,
		    comprobantedepagos.fechacomprobantedepago,
		    proveedors.nombreproveedor,
		    comprobantedepagos.descripcioncomprobantedepago,
		    comprobantedepagos.montototalcomprobante
		    
		    FROM gestioncondominio.proveedorxcondominios,
		    gestioncondominio.proveedors,
		    gestioncondominio.comprobantedepagos
		    where comprobantedepagos.idproveedorxcondominiocomprobantedepago=
		    proveedorxcondominios.idproveedorxcondominio 
		    and proveedors.idproveedor=proveedorxcondominios.idproveedorproveedorxcndominio
		    and    proveedorxcondominios.idcondominioproveedorxcondominio='$idcondominio'
		     and comprobantedepagos.fechacomprobantedepago between '$fecha1' and '$fecha2' order 
		     by comprobantedepagos.fechacomprobantedepago
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['fechacomprobantedepago'];
		$datos[$i][2]=$resultado['descripcioncomprobantedepago'];
		$datos[$i][3]=$resultado['nombreproveedor'];
		$datos[$i][4]=$resultado['montototalcomprobante'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarListaInvitados($idreservacion,$idcondominio,$fechareservacion)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT reservacions.listainvitadosreservacion FROM 
						gestioncondominio.reservacions,gestioncondominio.areacomuns,
						gestioncondominio.condominios where reservacions.idareacomunreservacion=
						areacomuns.idareacomun and areacomuns.idcondominioareacomun='$idcondominio'
						 and reservacions.idreservacion='$idreservacion' and reservacions.fechareservacion=
						'$fechareservacion'
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['listainvitadosreservacion'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ActualizarUsuario($codigopersona,$codigoinmueble,$idrol,$usuario,$nuevaclave,$correo,$direccion,$telefono)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL="SELECT nombrerol from rols where idrol='$idrol'";
  $ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
  
  
  if(mysql_num_rows($ConjuntoDeRegistros)>0)
  { 
  
 	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
  	$nombrerol=strtolower($resultado['nombrerol']);
  	 $datos[0]=$nombrerol;
  	
  	  if($nombrerol=='copropietario')
  	  {	 
		$InstruccionSQL="SELECT idcopropietario from copropietarios where cedulacopropietario='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idcopropietario= $resultado['idcopropietario'];
		
		$InstruccionSQL="select idlogininmueble from inmuebles  where codigoinmueble='$codigoinmueble'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idlogininmueble'];
		
		$InstruccionSQL = "UPDATE gestioncondominio.copropietarios
				    SET  direccioncopropietario='$direccion', telefonocopropietario='$telefono', 
				    correocopropietario='$correo' WHERE idcopropietario= '$idcopropietario'";
				    
		$InstruccionSQL2="UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave',  usuariologin='$usuario'  
						where idlogin='$idlogin'";
						
  	  }else if($nombrerol=='junta de condominio')
  	  {	 
		$InstruccionSQL="SELECT idloginjuntacondominio, idcopropietario from juntacondominios where codigojuntacondominio='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idloginjuntacondominio'];
		$idcopropietario= $resultado['idcopropietario'];
		
		$InstruccionSQL = "UPDATE gestioncondominio.copropietarios
				    SET  direccioncopropietario='$direccion', telefonocopropietario='$telefono', 
				    correocopropietario='$correo' WHERE idcopropietario= '$idcopropietario'";
				    
		$InstruccionSQL2="UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave',  usuariologin='$usuario'  
						where idlogin='$idlogin'";
						
  	  } 	  
  	  else if(($nombrerol=='vigilante')||($nombrerol=='administrador')||($nombrerol=='empleado'))
  	  {
	  	$InstruccionSQL="SELECT idloginempleado, idempleado FROM gestioncondominio.empleados where cedulaempledo='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idloginempleado'];
		$idempleado= $resultado['idempleado'];
		
		
		$InstruccionSQL = "UPDATE gestioncondominio.empleados
				    SET direccionempledo='$direccion', telefonoempledo='$telefono',correoempledo='$correo'
				    WHERE idempleado='$idempleado'";
				    
		$InstruccionSQL2="UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave', usuariologin='$usuario'  
		  		WHERE idlogin='$idlogin'";
  	  }
  	  else if($nombrerol=='superusuario')
      {
		$InstruccionSQL="SELECT idloginsuperusuario, idsuperusuario FROM gestioncondominio.superusuarios where codigosuperusuario='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idloginsuperusuario'];
		$idempleado= $resultado['idsuperusuario'];
		
	  	$InstruccionSQL = "UPDATE gestioncondominio.superusuarios
				    SET telefonosuperusuario='$telefono', correosuperusuario='$correo'
				    WHERE idsuperusuario='$idempleado'";
		  $InstruccionSQL2=	"UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave', usuariologin='$usuario'  
					WHERE idlogin='$idlogin'";
  	  
  	  //&&($ObjetoConeccion->EjecutarSQL($InstruccionSQL2,$MiConeccion))
  	  
  	  }
  	  
	  if(($ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion))&&($ObjetoConeccion->EjecutarSQL($InstruccionSQL2,$MiConeccion)))
	  {
		$datos[0]="true";
	  }
  	  else
    	$datos[0]="false";
    	
  }else
  //  $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function IniciarSesion($usuario,$clave)

 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT * FROM gestioncondominio.logins where usuariologin= '$usuario' and paswordlogin='$clave'  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$idrollogin=$resultado['idrollogin'];
	$idlogin=$resultado['idlogin'];
	$InstruccionSQL="select nombrerol,idrol from rols where idrol='$idrollogin'"; /*solicito el id del rol para usarlo al publicar una noticia*/
	$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
	if (mysql_num_rows($ConjuntoDeRegistros)>0)
	{
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$nombrerol=strtolower($resultado['nombrerol']);
		$idrol=strtolower($resultado['idrol']);
		$datos[15]=$resultado['idrol'];  /*agregado para publicar una noticia*/
		if($nombrerol=="copropietario")
		{
			$InstruccionSQL="select copropietarios.cedulacopropietario,inmuebles.codigoinmueble,inmuebles.idinmueble,
			          idcondominioinmueble,idlogin from
					  copropietarios,inmuebles,logins where
					  logins.idlogin=inmuebles.idlogininmueble and
					  inmuebles.idcopropietarioinmueble=copropietarios.idcopropietario and
					  logins.usuariologin='$usuario'";
			$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
			if (mysql_num_rows($ConjuntoDeRegistros)>0)
			{
			
				$resultado=mysql_fetch_array($ConjuntoDeRegistros);
				$idcondominio=$resultado['idcondominioinmueble'];
				$datos[0]="true";
				$datos[1]=ucfirst($nombrerol);
				$datos[2]=$resultado['cedulacopropietario'];
				$datos[3]=$resultado['codigoinmueble'];
				$datos[11]=$resultado['idcondominioinmueble'];

				$datos[13]=$resultado['idinmueble']; // agregado
				$datos[14]=$resultado['idlogin']; /*agregado para publicar una noticia*/
				    

				$cedulacopropietario=$datos[2];
				$InstruccionSQL=" SELECT 
						  idcopropietario,
						  copropietarios.nombrecopropietario,
						  copropietarios.apellidocopropietario,
						  copropietarios.formatofotocopropietario,
						  nombrefotocopropietario,
						  copropietarios.fotocopropietario,
						  copropietarios.estatuscopropietario
						  FROM gestioncondominio.copropietarios
						  where copropietarios.cedulacopropietario='$cedulacopropietario'";
				$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
				$resultado=mysql_fetch_array($ConjuntoDeRegistros);
				$datos[4]=$resultado['idcopropietario'];
				$datos[5]=$resultado['nombrecopropietario'];
				$datos[6]=$resultado['apellidocopropietario'];
				$datos[7]=$resultado['formatofotocopropietario'];
				$datos[8]=$resultado['nombrefotocopropietario'];
				$datos[9]=$resultado['fotocopropietario'];
				$datos[10]=$resultado['estatuscopropietario'];
				
				
			}
			else 
				$datos[0]="false";
		}
		else if(($nombrerol=='empleado')||($nombrerol=="administrador")||$nombrerol=="vigilante")
		{
			$InstruccionSQL="select idempleado,cedulaempledo, nombreempledo, apellidoempledo, correoempledo, nombrefotoempleado, 
					formatofotoempleado, fotoempleado, estatusempleado, idcondominioempleado,idloginempleado 
					from gestioncondominio.empleados
					WHERE idloginempleado='$idlogin'
			";
			$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
			if (mysql_num_rows($ConjuntoDeRegistros)>0)
			{
				$resultado=mysql_fetch_array($ConjuntoDeRegistros);
				$idcondominio=$resultado['idcondominioempleado'];
				$datos[0]="true";
				$datos[1]=ucfirst($nombrerol);
				$datos[2]=$resultado['idempleado'];
				$datos[3]=$resultado['cedulaempledo'];
				$datos[4]=$resultado['nombreempledo'];
				$datos[5]=$resultado['apellidoempledo'];
				$datos[6]=$resultado['correoempledo'];
				$datos[7]=$resultado['nombrefotoempleado'];
				$datos[8]=$resultado['formatofotoempleado'];
				$datos[9]=$resultado['fotoempleado'];
				$datos[10]=$resultado['estatusempleado'];
				$datos[11]=$resultado['idcondominioempleado'];
				$datos[17]=$resultado['idloginempleado']; /*Agregado*/
				
			}
			else 
				$datos[0]="false";
		}
		else if(($nombrerol=='superusuario'))
		{
		
		$InstruccionSQL="select idsuperusuario, codigosuperusuario, nombresuperusuario, apellidosuperusuario, correosuperusuario, nombrefotosuperusuario, formatofotosuperusuario, fotosuperusuario from gestioncondominio.superusuarios
							WHERE idloginsuperusuario='$idlogin'";
		$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
		
		if (mysql_num_rows($ConjuntoDeRegistros)>0)
			{
				$resultado=mysql_fetch_array($ConjuntoDeRegistros);
				$datos[0]="true";
				$datos[1]=ucfirst($nombrerol);
				$datos[2]=$resultado['codigosuperusuario'];
				$datos[3]=$resultado['idsuperusuario'];
				$datos[4]=$resultado['nombresuperusuario'];
				$datos[5]=$resultado['apellidosuperusuario'];
				$datos[6]=$resultado['correosuperusuario'];
				$datos[7]=$resultado['nombrefotosuperusuario'];
				$datos[8]=$resultado['formatofotosuperusuario'];
				$datos[9]=$resultado['fotosuperusuario'];
				$idcondominio="-1"; 

				
			}
			else 
				$datos[0]="false";
		
		
		}
		else if(($nombrerol=='junta de condominio'))							
		{																	/* agregado idloginjuntacondominio*/
			$InstruccionSQL="Select idcopropietario, idcondominiocondominio,idloginjuntacondominio from juntacondominios where idloginjuntacondominio='$idlogin'
			";
			$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
			if (mysql_num_rows($ConjuntoDeRegistros)>0)
			{
				$resultado=mysql_fetch_array($ConjuntoDeRegistros);
				$idcopropietario=$resultado['idcopropietario'];
				$idcondominio=$resultado['idcondominiocondominio'];
				$idloginjuntacondominio=$resultado['idloginjuntacondominio'];
				$InstruccionSQL=" SELECT
						    copropietarios.cedulacopropietario,
						    						  
						  copropietarios.nombrecopropietario, copropietarios.apellidocopropietario,
						  
						  copropietarios.formatofotocopropietario,
						  
						  copropietarios.fotocopropietario,
						  copropietarios.nombrefotocopropietario, /* agregado No estaba definido*/
						  
						  copropietarios.estatuscopropietario
						  					  
						  FROM gestioncondominio.copropietarios
						  
						  where idcopropietario='$idcopropietario'
				";
				$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
				$resultado=mysql_fetch_array($ConjuntoDeRegistros);
				$datos[0]="true";
				$datos[1]=ucfirst($nombrerol);
				$datos[2]=$resultado['cedulacopropietario'];
				$datos[3]=$resultado['nombrecopropietario'];
				$datos[4]=$resultado['apellidocopropietario'];
				$datos[5]=$resultado['formatofotocopropietario'];
				$datos[6]=$resultado['nombrefotocopropietario'];
				$datos[7]=$resultado['fotocopropietario'];
				$datos[8]=$resultado['estatuscopropietario'];
				$datos[9]=$idcondominio;
				$datos[10]=$idloginjuntacondominio;
			}
			else 
				$datos[0]="false";
		
			
		}
		
		$InstruccionSQL="SELECT nombrecondominio,idcondominio  from condominios where idcondominio='$idcondominio'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$datos[12]= $resultado['nombrecondominio'];
		
	}
	else 
		$datos[0]="false";
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarVisitante($idvisitante)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT visitantes.cedulavisitante,
						visitantes.nombrevisitante,visitantes.apellidovisitante 
						FROM gestioncondominio.visitantes where idvisitante='$idvisitante'
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['cedulavisitante'];
	$datos[2]=$resultado['nombrevisitante'];
	$datos[3]=$resultado['apellidovisitante'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarNoticia($idnoticia)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select noticias.codigonoticia,noticias.fechanoticia,
						noticias.descripcionnoticia,noticias.nombrearchivonoticia,
						noticias.formatoarchivonoticia,noticias.archivonoticia,noticias.estatusnoticia,
						noticias.idtiponoticiamaestronoticia,noticias.idloginnoticia,noticias.cedulaautor,
						noticias.idrol,noticias.idcondominio,tiponoticiamaestros.nombretiponoticiamaestro,
						condominios.nombrecondominio
						 from noticias,tiponoticiamaestros,condominios where idnoticia='$idnoticia'
						and tiponoticiamaestros.idtiponoticiamaestro=noticias.idtiponoticiamaestronoticia
						and condominios.idcondominio=noticias.idcondominio
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['codigonoticia'];
	$datos[2]=$resultado['fechanoticia'];
	$datos[3]=$resultado['descripcionnoticia'];
	$datos[4]=$resultado['nombrearchivonoticia'];
	$datos[5]=$resultado['formatoarchivonoticia'];
	$datos[6]=$resultado['archivonoticia'];
	$datos[7]=$resultado['estatusnoticia'];
	$datos[8]=$resultado['idtiponoticiamaestronoticia'];
	$datos[9]=$resultado['cedulaautor'];
	$datos[10]=$resultado['idrol'];
	$datos[11]=$resultado['idcondominio'];
	$datos[12]=$resultado['nombretiponoticiamaestro'];
	$datos[13]=$resultado['nombrecondominio'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarCotizacion($idcotizacion)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from cotizacions where idcotizacion='$idcotizacion'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['codigocotizacion'];
	$datos[2]=$resultado['descripcioncotizacion'];
	$datos[3]=$resultado['fechacotizacioncotizacion'];
	$datos[4]=$resultado['fechavencimientocotizacioncotizacion'];
	$datos[5]=$resultado['aprobacioncotizacion'];
	$datos[6]=$resultado['montocotizacion'];
	$datos[7]=$resultado['estatuscotizacion'];
	$datos[8]=$resultado['idproveedorxcondominiocotizacion'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoCotizacionesProveedor($idproveedor)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from cotizacions, proveedorxcondominios
		    where idproveedorxcondominio=idproveedorxcondominiocotizacion
		    and idproveedorproveedorxcndominio='$idproveedor'
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['codigocotizacion'];
		$datos[$i][2]=$resultado['descripcioncotizacion'];
		$datos[$i][3]=$resultado['fechacotizacioncotizacion'];
		$datos[$i][4]=$resultado['fechavencimientocotizacioncotizacion'];
		$datos[$i][5]=$resultado['aprobacioncotizacion'];
		$datos[$i][6]=$resultado['montocotizacion'];
		$datos[$i][7]=$resultado['estatuscotizacion'];
		
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ListadoReclamoSugerenciaFechas($fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT reclamosugerencias.idreclamosugerencia,reclamosugerencias.codigoreclamosugerencia,
						reclamosugerencias.razonreclamosugerencia, 
						reclamosugerencias.fechareclamosugerencia,
						reclamosugerencias.descripcionreclamosugerencia,
						reclamosugerencias.idinmueblereclamosugerencia,reclamosugerencias.estatusreclamosugerencia,
						condominios.idcondominio,condominios.nombrecondominio
						FROM gestioncondominio.reclamosugerencias,gestioncondominio.condominios,gestioncondominio.inmuebles
						where  reclamosugerencias.idinmueblereclamosugerencia=inmuebles.idinmueble 
						and condominios.idcondominio=inmuebles.idcondominioinmueble and
						fechareclamosugerencia
						between '$fecha1' and '$fecha2'
						order by 
						reclamosugerencias.fechareclamosugerencia
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idreclamosugerencia'];
		$datos[$i][2]=$resultado['codigoreclamosugerencia'];
		$datos[$i][3]=$resultado['razonreclamosugerencia'];
		$datos[$i][4]=$resultado['fechareclamosugerencia'];
		$datos[$i][5]=$resultado['descripcionreclamosugerencia'];
		$datos[$i][6]=$resultado['idinmueblereclamosugerencia'];
		$datos[$i][7]=$resultado['estatusreclamosugerencia'];
		$datos[$i][8]=$resultado['idcondominio'];
		$datos[$i][9]=$resultado['nombrecondominio'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarVisita($idcontrolvisita,$idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT distinct visitantes.idvisitante, nombrevisitante, apellidovisitante,
						controlvisitas.fechavisita,controlvisitas.horavisita, codigoinmueble
						FROM gestioncondominio.controlvisitas, gestioncondominio.visitantes, 
						inmuebles,
						gestioncondominio.condominios,gestioncondominio.empleados 
						where 
						controlvisitas.idinmueblecontrolvisita=idinmueble and
						visitantes.idvisitante=controlvisitas.idvisitantecontrolvisita
						 and condominios.idcondominio=empleados.idcondominioempleado
						 and controlvisitas.idempleadocontrolvisita=empleados.idempleado and
						controlvisitas.idcontrolvisita='$idcontrolvisita' and  
						condominios.idcondominio='$idcondominio' ORDER BY visitantes.idvisitante
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$datos[0]="true";
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$datos[1]=$resultado['idvisitante'];
	$datos[2]=$resultado['nombrevisitante'];
	$datos[3]=$resultado['apellidovisitante'];
	$datos[4]=$resultado['fechavisita'];
	$datos[5]=$resultado['horavisita'];
	$datos[6]=$resultado['codigoinmueble'];
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ListadoNoticiasReunion($idcondominio,$fecha1,$fecha2)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT noticias.codigonoticia,noticias.fechanoticia, 
						noticias.descripcionnoticia, logins.usuariologin, rols.nombrerol
						FROM gestioncondominio.noticias, logins, rols, tiponoticiamaestros
						WHERE  noticias.idloginnoticia=logins.idlogin
						and noticias.idrol=rols.idrol
						and noticias.idcondominio='$idcondominio' and
						fechanoticia
						between '$fecha1' and '$fecha2' and noticias.idtiponoticiamaestronoticia=
						tiponoticiamaestros.idtiponoticiamaestro
						and upper(tiponoticiamaestros.nombretiponoticiamaestro)='ASAMBLEA' 
						order by noticias.fechanoticia
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['codigonoticia'];
		$datos[$i][2]=$resultado['fechanoticia'];
		$datos[$i][3]=$resultado['descripcionnoticia'];
		$datos[$i][4]=$resultado['usuariologin'];
		$datos[$i][5]=$resultado['nombrerol'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ConsultarAreaComun($idcondominio,$codigoareacomun)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT nombreareacomun, descripcionareacomun, 
						horarioareas.diahorario, horarioareas.horainicio, horarioareas.horafin
						FROM gestioncondominio.areacomuns, horarioareas where 
						areacomuns.idareacomun= horarioareas.idareacomun and 
						areacomuns.codigoareacomun='$codigoareacomun' 
						and areacomuns.idcondominioareacomun='$idcondominio';
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['diahorario'];
		$datos[$i][2]=$resultado['horainicio'];
		$datos[$i][3]=$resultado['horafin'];
	
		$i++;
	}
	
			$datos[2][4]=$resultado['nombreareacomun'];
			$datos[2][5]=$resultado['descripcionareacomun'];
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
function ListadoReservacionesAreaComunFechas($idcondominio,$fecha1,$fecha2,$idareacomun)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT idreservacion, codigoreservacion, fechareservacion, 
						nombrelistainvitadosreservacion,
						formatolistainvitadosreservacion, listainvitadosreservacion,
						 estatusreservacion,
						montoapagar, idareacomunreservacion, nombreareacomun, idinmueblereservacion, 
						nombrecopropietario, apellidocopropietario
						FROM gestioncondominio.reservacions, inmuebles, areacomuns, copropietarios  
						where fechareservacion between  '$fecha1' and '$fecha2' 
						and reservacions.idinmueblereservacion=inmuebles.idinmueble
						and reservacions.idareacomunreservacion= areacomuns.idareacomun
						and inmuebles.idcopropietarioinmueble=copropietarios.idcopropietario
						and inmuebles.idcondominioinmueble='$idcondominio'
						and reservacions.idareacomunreservacion='$idareacomun'
						  
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['idreservacion'];
		$datos[$i][2]=$resultado['codigoreservacion'];
		$datos[$i][3]=$resultado['fechareservacion'];
		$datos[$i][4]=$resultado['nombrelistainvitadosreservacion'];
		$datos[$i][5]=$resultado['formatolistainvitadosreservacion'];
		$datos[$i][6]=$resultado['listainvitadosreservacion'];
		$datos[$i][7]=$resultado['estatusreservacion'];
		$datos[$i][8]=$resultado['montoapagar'];
		$datos[$i][9]=$resultado['idareacomunreservacion'];
		$datos[$i][10]=$resultado['nombreareacomun'];
		$datos[$i][11]=$resultado['idinmueblereservacion'];
		$datos[$i][12]=$resultado['nombrecopropietario'];
		$datos[$i][13]=$resultado['apellidocopropietario'];
		
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function ListadoReclamoSugerenciaAInmueble($idcondominio,$codigoinmueble)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT reclamosugerencias.codigoreclamosugerencia,
						reclamosugerencias.razonreclamosugerencia, 
						reclamosugerencias.fechareclamosugerencia,
						reclamosugerencias.descripcionreclamosugerencia,
						reclamosugerencias.idinmueblereclamosugerencia as autor
						FROM gestioncondominio.reclamosugerencias,gestioncondominio.condominios
						where condominios.idcondominio='$idcondominio'
						and codigoinmuebledestinatario='$codigoinmueble' order by
						 reclamosugerencias.fechareclamosugerencia;
  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		$datos[$i][1]=$resultado['codigoreclamosugerencia'];
		$datos[$i][2]=$resultado['razonreclamosugerencia'];
		$datos[$i][3]=$resultado['fechareclamosugerencia'];
		$datos[$i][4]=$resultado['descripcionreclamosugerencia'];
		$datos[$i][5]=$resultado['autor'];
		$i++;
	
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 function RegistrarPago($codigopago,$idrecibocobro,$descripcionpago,$nrodocumento,$montopago,
 $fechapago,$estatuspago,$idformadepago,$idrazonpago,$idcondominio,$cidepositante,$idbanco)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  
  $InstruccionSQL="SELECT Max(idpago) as ultimo FROM gestioncondominio.pagos";
  $ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
  $resultado=mysql_fetch_array($ConjuntoDeRegistros);
   $idpago= $resultado['ultimo']+1;
 
 $datos[0]=$idpago;
   
     
  $InstruccionSQL = "INSERT INTO pagos (idpago, codigopago, 
						descripcionpago, nrodocumento, montopago, validacionpago, 
						fechapago, estatuspago, idformapagopago, idrazondepagopago,
						 idrecibocobropago, idcondominio, cidepositante, idbanco) 
						VALUES ('$idpago', '$codigopago', '$descripcionpago', '$nrodocumento', '$montopago',
						 '0','$fechapago', '$estatuspago', '$idformadepago', 
						'$idrazonpago', '$idrecibocobro', '$idcondominio', '$cidepositante', 
						'$idbanco');
  ";
  if($ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion))
  {
  	$InstruccionSQL="SELECT cuotapendienterecibo, abonorecibocobro, montorecibocobro FROM gestioncondominio.recibocobros, inmuebles
						Where recibocobros.idinmueblerecibocobro=inmuebles.idinmueble
						and idcondominioinmueble=$idcondominio 
						and idrecibocobro=$idrecibocobro";

    $conjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
    $montos=mysql_fetch_array($conjuntoDeRegistros);
	$monto0=$montos[0];
	$monto1=$montos[1];
	
	if($monto0!=0)
	{
	if ($monto0>=$montopago)
	{
		$InstruccionSQL="UPDATE gestioncondominio.recibocobros SET cuotapendienterecibo=$monto0-$montopago,
						abonorecibocobro=$monto1+$montopago WHERE idrecibocobro='$idrecibocobro'";
		$datos[0]='entra1';
	}
	else 
	{
	    
		$InstruccionSQL="UPDATE gestioncondominio.recibocobros SET cuotapendienterecibo=0, 
						abonorecibocobro=$monto1+$montopago WHERE idrecibocobro='$idrecibocobro'";
		$datos[0]='entra2';
	}
	
	$ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  	$datos[0]="true";
	}
	else
	$datos[0]="false, recibo ya cancelado";
	
  }
  else
 // 	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 
 //SERVICIOS OTROS
 
 
 function BuscarPago(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $codigoP = $Datos[0];
  $referenciaP = $Datos[2];
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "Select * From pagos Where codigopago = '" . $codigoP . "' And nrodocumento = '" . $referenciaP ."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Valor = 0;
  }
  else
  { 
   $Valor = 1;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } 



  function GrabarPago($Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  
  $codigoP=$Datos[0];
  $observacionesP = $Datos[1];
  $referenciaP = $Datos[2];
  $montoP = $Datos[3];
  $validacionP = $Datos[4];
  $fechaP = $Datos[5];
  $estatusP = $Datos[6];
  $formaP = $Datos[7];
  $idrecibocobropago=$Datos[8];
  $idcondominio=$Datos[9];
  $ValorGrabarActualizar = 0;

  $ObjetoUsuarios = new Usuarios;
  $Valor = $ObjetoUsuarios->BuscarPago($Datos);
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  //Actualizar
  if ($Valor==0)
  { 
   $InstruccionSQL = "Update pagos set descripcionpago='" . $observacionesP . "' Where codigopago = '" .  $codigoP . "' And nrodocumento = '" . $referenciaP . "'";
  }
  else
  {
  //Insertar
  $InstruccionSQL = " Insert into pagos (codigopago,descripcionpago,nrodocumento,montopago,validacionpago,fechapago,estatuspago,idformapagopago,idrecibocobropago,idcondominio)
   values ('" . $codigoP . "','" . $observacionesP . "','" . $referenciaP . "'," . $montoP . "," . $validacionP . ",'" . $fechaP . "','" . $estatusP . "'," . $formaP . "," . $idrecibocobropago . ",".$idcondominio.")"; 
  }
  $ValorGrabarActualizar = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $ValorGrabarActualizar;
 }
 
 function ValidarUsuario($Usuario,$Clave)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "Select * From logins Where usuariologin = '" . $Usuario . "' And paswordlogin = '" . $Clave ."'" ;
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } //fin funcion ValidarUsuario

function BuscarUsuario(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $Usuario = trim($Datos[0]);
  $Clave = trim($Datos[1]);
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);

  $InstruccionSQL ="select cedulacopropietario,nombrecopropietario,apellidocopropietario,fotocopropietario,codigoinmueble,
  rifcondominio,nombrerol,idinmueble,idcondominio,idlogin from copropietarios,inmuebles,condominios,rols,logins where
    idcopropietario=(select idcopropietarioinmueble from inmuebles where idlogininmueble=(select idlogin from
    logins where usuariologin='" . $Usuario . "' and paswordlogin='" . $Clave ."'))
    and idlogininmueble=(select idlogin from logins where usuariologin='" . $Usuario . "' and paswordlogin='" . $Clave ."')
    and idcondominio=(select idcondominioinmueble from inmuebles where idlogininmueble=(select idlogin from logins
    where usuariologin='" . $Usuario . "' and paswordlogin='" . $Clave ."'))
    and idrol=(select idrollogin from logins where usuariologin='" . $Usuario . "' and paswordlogin='" . $Clave ."') 
    and usuariologin='" . $Usuario . "' and paswordlogin='" . $Clave ."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Datos[0] = $Registros['cedulacopropietario'];
   $Datos[1] = $Registros['nombrecopropietario'];
   $Datos[2] = $Registros['apellidocopropietario'];
   $Datos[3] = $Registros['fotocopropietario'];
   $Datos[4] = $Registros['codigoinmueble'];
   $Datos[5] = $Registros['rifcondominio'];
   $Datos[6] = $Registros['nombrerol'];
   $Datos[7] = $Registros['idinmueble'];
   $Datos[8] = $Registros['idcondominio'];
   $Datos[9] = $Registros['idlogin'];
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } //fin de la funcion

 function BuscarmiembrosJC(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $estatus="a"; /*declaro la variable estatus si se la meto directamente da error ojo*/
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select codigoinmueble,nombrecopropietario,apellidocopropietario,nombrecargo,telefonocopropietario from inmuebles,juntacondominios,copropietarios,cargos
     where idlogininmueble=idloginjuntacondominio and estatusjuntacondominio='".$estatus."' and  idcopropietario=idcopropietarioinmueble and   idcargo=idcargojuntacondominio";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros>=1) 
  {
   $J = 0;
   $I = 0;
   $Datos[$J][$I]   = $Registros['codigoinmueble'];
   $Datos[$J][$I+1] = $Registros['nombrecopropietario'];
   $Datos[$J][$I+2] = $Registros['apellidocopropietario'];
   $Datos[$J][$I+3] = $Registros['nombrecargo'];
   $Datos[$J][$I+4] = $Registros['telefonocopropietario'];
   while ($Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros)) 
   {
    $J=$J+1;
    $Datos[$J][$I]   = $Registros['codigoinmueble'];
    $Datos[$J][$I+1] = $Registros['nombrecopropietario'];
    $Datos[$J][$I+2] = $Registros['apellidocopropietario'];
    $Datos[$J][$I+3] = $Registros['nombrecargo'];
    $Datos[$J][$I+4] = $Registros['telefonocopropietario'];
   }
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 }//fin funcion buscar miembros junta condominio

function BuscarMonto(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idinmueble = $Datos[0];
  $estatus="a";
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = " select sum(montorecibocobro) as monto from recibocobros where
      idinmueblerecibocobro='" . $idinmueble . "' and estatuscancelacionrecibodecobro='".$estatus."' and estatusrecibocobro='".$estatus."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Datos[0] = $Registros['monto'];
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } 


 function BuscarListaRecibos(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idinmu = $Datos[0];
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $estatus="a"; /*declaro la variable estatus si se la meto directamente da error ojo*/
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select idrecibocobro,codigorecibocobro,fecharecibocobro,cuotapendienterecibocobro,fechavencimientorecibocobro,
 abonorecibocobro,montorecibocobro from recibocobros where
 idinmueblerecibocobro='" . $idinmu . "' and estatuscancelacionrecibodecobro='".$estatus."' and estatusrecibocobro='".$estatus."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros>=1) 
  {
   $J = 0;
   $I = 0;
   $Datos[$J][$I+0]   = $Registros['idrecibocobro'];
   $Datos[$J][$I+1]   = $Registros['codigorecibocobro'];
   $Datos[$J][$I+2] = $Registros['fecharecibocobro'];
   $Datos[$J][$I+3] = $Registros['cuotapendienterecibocobro'];
   $Datos[$J][$I+4] = $Registros['fechavencimientorecibocobro'];
   $Datos[$J][$I+5] = $Registros['abonorecibocobro'];
   $Datos[$J][$I+6] = $Registros['montorecibocobro'];
   while ($Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros)) 
   {
    $J=$J+1;
    $Datos[$J][$I+0]   = $Registros['idrecibocobro'];
    $Datos[$J][$I+1]   = $Registros['codigorecibocobro'];
    $Datos[$J][$I+2] = $Registros['fecharecibocobro'];
    $Datos[$J][$I+3] = $Registros['cuotapendienterecibocobro'];
    $Datos[$J][$I+4] = $Registros['fechavencimientorecibocobro'];
    $Datos[$J][$I+5] = $Registros['abonorecibocobro'];
    $Datos[$J][$I+6] = $Registros['montorecibocobro'];

   }
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 }//fin funcion BuscarListaRecibos

 function BuscarListaRecibosCancelados(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idinmu = trim($Datos[0]);
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $estatus="e"; /*declaro la variable estatus si se la meto directamente da error ojo*/
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select idrecibocobro,codigorecibocobro,montorecibocobro from recibocobros where 
  idinmueblerecibocobro='".$idinmu."' and estatuscancelacionrecibodecobro='".$estatus."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros>=1) 
  {
   $J = 0;
   $I = 0;
   $Datos[$J][$I+0]   = $Registros['idrecibocobro'];
   $Datos[$J][$I+1]   = $Registros['codigorecibocobro'];
   $Datos[$J][$I+2] = $Registros['montorecibocobro'];  
   while ($Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros)) 
   {
    $J=$J+1;
    $Datos[$J][$I+0]   = $Registros['idrecibocobro'];
    $Datos[$J][$I+1]   = $Registros['codigorecibocobro'];
    $Datos[$J][$I+2] = $Registros['montorecibocobro'];
   }
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 }//fin funcion BuscarListaRecibosCancelados


 function BuscarDetallePagoRC(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idrecibocobropago = trim($Datos[0]);
  $validacion='1';
  $estatus="a";
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);

  $InstruccionSQL ="select descripcionpago,nrodocumento,montopago,fechapago from pagos where idrecibocobropago='".$idrecibocobropago."' 
    and validacionpago='".$validacion."' and estatuspago='".$estatus."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Datos[0] = $Registros['descripcionpago'];
   $Datos[1] = $Registros['nrodocumento'];
   $Datos[2] = $Registros['montopago'];
   $Datos[3] = $Registros['fechapago'];
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } //fin de la funcion BuscarDetallePagoRC

  function informacioninmueble(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idinmueble = trim($Datos[0]);
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);

  $InstruccionSQL ="select codigoinmueble,metroscuadradosinmueble,alicuotainmueble,descripcioninmueble,codigocatastralinmueble,nombrecondominio from inmuebles,condominios where
    idinmueble='".$idinmueble."' and idcondominio=idcondominioinmueble";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Datos[0] = $Registros['codigoinmueble'];
   $Datos[1] = $Registros['metroscuadradosinmueble'];
   $Datos[2] = $Registros['alicuotainmueble'];
   $Datos[3] = $Registros['descripcioninmueble'];
   $Datos[4] = $Registros['codigocatastralinmueble'];
   $Datos[5] = $Registros['nombrecondominio'];

   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } //fin de la funcion informacioninmueble

 function BuscarAreasComunes(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idinmu = trim($Datos[0]);
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $estatus="a"; /*declaro la variable estatus si se la meto directamente da error ojo*/
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select idareacomun,codigoareacomun,descripcionareacomun,capacidadareacomun,idcondominioareacomun,nombreareacomun from areacomuns where
    idcondominioareacomun='".$idinmu."' and estatusareacomun='".$estatus."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros>=1) 
  {
   $J = 0;
   $I = 0;
   $Datos[$J][$I+0]   = $Registros['idareacomun'];
   $Datos[$J][$I+1]   = $Registros['codigoareacomun'];
   $Datos[$J][$I+2] = $Registros['descripcionareacomun'];
   $Datos[$J][$I+3] = $Registros['capacidadareacomun'];  
   $Datos[$J][$I+4] = $Registros['idcondominioareacomun'];  
   $Datos[$J][$I+5] = $Registros['nombreareacomun'];   
   while ($Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros)) 
   {
    $J=$J+1;
    $Datos[$J][$I+0]   = $Registros['idareacomun'];
    $Datos[$J][$I+1]   = $Registros['codigoareacomun'];
    $Datos[$J][$I+2] = $Registros['descripcionareacomun'];
    $Datos[$J][$I+3] = $Registros['capacidadareacomun'];
    $Datos[$J][$I+4] = $Registros['idcondominioareacomun'];
    $Datos[$J][$I+5] = $Registros['nombreareacomun'];
   }
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 }//fin funcion BuscarAreasComunes


  function verificarArea(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $fecha = $Datos[0];
  $idareacomun = $Datos[1];
  $Idinmueblereservacion = $Datos[2];
  $estatus="a";
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select nombrecopropietario,apellidocopropietario,telefonocopropietario,codigoinmueble from copropietarios,inmuebles where
    idinmueble=(select idinmueblereservacion from reservacions where fechareservacion='".$fecha."'
   and idareacomunreservacion='".$idareacomun."' and estatusreservacion='". $estatus."' and idinmueblereservacion ='".$Idinmueblereservacion."' ) and idcopropietarioinmueble=idcopropietario";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Datos[0] = $Registros['nombrecopropietario'];
   $Datos[1] = $Registros['apellidocopropietario'];
   $Datos[2] = $Registros['telefonocopropietario'];
   $Datos[3] = $Registros['codigoinmueble'];
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } 

 function BuscarReservacion(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $fecha = $Datos[0];
  $idarea = $Datos[3];
  $idarea = $Datos[4];
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "Select * From reservacions Where fechareservacion = '" . $fecha . "' 
  And idareacomunreservacion = '" . $idarea ."' and idinmueblereservacion='".$idarea."'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
   $Valor = 0;
  }
  else
  { 
   $Valor = 1;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 } 

   function GrabarReservacion($Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  
  $Fecha=$Datos[0];
  $Estatus = $Datos[1];
  $MontoPagar = $Datos[2];
  $Idreserva = $Datos[3];
  $Idinmueblereservacion = $Datos[4];
  $MontoAbonado = $Datos[5];
  $ValorGrabarActualizar = 0;

  $ObjetoUsuarios = new Usuarios;
  $ObjetoConeccion = new ConeccionBD;

  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = " Insert into reservacions (fechareservacion,estatusreservacion,montoapagar,idareacomunreservacion,idinmueblereservacion,montoabonado)
   values ('" . $Fecha . "','" . $Estatus . "'," . $MontoPagar . "," . $Idreserva . "," . $Idinmueblereservacion . "," . $MontoAbonado . ")"; 
  
  $ValorGrabarActualizar = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $ValorGrabarActualizar;
 }

  function BuscarNoticiasCondominio(&$Datos)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $idcondominio = trim($Datos[0]);
  $Valor = 0;
  $ObjetoConeccion = new ConeccionBD;
  $estatus="a"; /*declaro la variable estatus si se la meto directamente da error ojo*/
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select fechanoticia,descripcionnoticia,codigoinmueble,cedulacopropietario,nombrecopropietario,
  apellidocopropietario from noticias,inmuebles,copropietarios where estatusnoticia='".$estatus."'
    and idloginnoticia=idlogininmueble  and idcopropietarioinmueble=idcopropietario and idcondominio='".$idcondominio."' limit 0,10";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros>=1) 
  {
   $J = 0;
   $I = 0;
   $Datos[$J][$I+0]   = $Registros['fechanoticia'];
   $Datos[$J][$I+1]   = $Registros['descripcionnoticia'];
   $Datos[$J][$I+2] = $Registros['codigoinmueble'];
   $Datos[$J][$I+3] = $Registros['cedulacopropietario'];  
   $Datos[$J][$I+4] = $Registros['nombrecopropietario'];  
   $Datos[$J][$I+5] = $Registros['apellidocopropietario'];   
   while ($Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros)) 
   {
    $J=$J+1;
    $Datos[$J][$I+0]   = $Registros['fechanoticia'];
    $Datos[$J][$I+1]   = $Registros['descripcionnoticia'];
    $Datos[$J][$I+2] = $Registros['codigoinmueble'];
    $Datos[$J][$I+3] = $Registros['cedulacopropietario'];
    $Datos[$J][$I+4] = $Registros['nombrecopropietario'];
    $Datos[$J][$I+5] = $Registros['apellidocopropietario'];
   }
   $Valor = 1;
  }
  else
  { 
   $Valor = 0;
  }
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $Valor;
 }//fin funcion BuscarAreasComunes

 
 
function ListaOpcionesMenu($usuario,$clave)

 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT * FROM gestioncondominio.logins where usuariologin= '$usuario' and paswordlogin='$clave'  
  ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	$resultado=array();
	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
	$idrollogin=$resultado['idrollogin'];
	$idlogin=$resultado['idlogin'];
	$InstruccionSQL="select arbols.text, vinculo, ruta, actividad from arbols where tipo='$idrollogin'";
	$ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
	if (mysql_num_rows($ConjuntoDeRegistros)>0)
	{
		
	$datos[0]="true";
  	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{	
		
		$datos[$i][1]=$resultado['actividad'];
		$datos[$i][2]=$resultado['text'];
		$datos[$i][3]=$resultado['vinculo'];
		$datos[$i][4]=$resultado['ruta'];
		$i++;
	
	}
		
	}
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 
 
 
 function ActualizarUsuarioFoto($codigopersona,$codigoinmueble,$idrol,$usuario,$nuevaclave,$correo,$direccion,$telefono, $nombrefoto, $formatofoto,$fotousuario)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL="SELECT nombrerol from rols where idrol='$idrol'";
  $ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
  $foto= addslashes(base64_decode($fotousuario));
  
  if(mysql_num_rows($ConjuntoDeRegistros)>0)
  { 
  
 	$resultado=mysql_fetch_array($ConjuntoDeRegistros);
  	$nombrerol=strtolower($resultado['nombrerol']);
  	 $datos[0]=$nombrerol;
  	
  	  if($nombrerol=='copropietario')
  	  {	 
		$InstruccionSQL="SELECT idcopropietario from copropietarios where cedulacopropietario='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idcopropietario= $resultado['idcopropietario'];
		
		$InstruccionSQL="select idlogininmueble from inmuebles  where codigoinmueble='$codigoinmueble'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idlogininmueble'];
		
		$InstruccionSQL = "UPDATE gestioncondominio.copropietarios
				    SET  direccioncopropietario='$direccion', telefonocopropietario='$telefono', 
				    correocopropietario='$correo', fotocopropietario='$foto', formatofotocopropietario='$formatofoto',
				    nombrefotocopropietario='$nombrefoto' WHERE idcopropietario= '$idcopropietario'";
				    
		$InstruccionSQL2="UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave',  usuariologin='$usuario'  
						where idlogin='$idlogin'";
						
  	  }else if($nombrerol=='junta de condominio')
  	  {	 
		$InstruccionSQL="SELECT idloginjuntacondominio, idcopropietario from juntacondominios where codigojuntacondominio='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idloginjuntacondominio'];
		$idcopropietario= $resultado['idcopropietario'];
		
		$InstruccionSQL = "UPDATE gestioncondominio.copropietarios
				    SET  direccioncopropietario='$direccion', telefonocopropietario='$telefono', 
				    correocopropietario='$correo', fotocopropietario='$foto', formatofotocopropietario='$formatofoto',
				    nombrefotocopropietario='$nombrefoto' WHERE idcopropietario= '$idcopropietario'";
				    
		$InstruccionSQL2="UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave',  usuariologin='$usuario'  
						where idlogin='$idlogin'";
						
  	  } 	  
  	  else if(($nombrerol=='vigilante')||($nombrerol=='administrador')||($nombrerol=='empleado'))
  	  {
	  	$InstruccionSQL="SELECT idloginempleado, idempleado FROM gestioncondominio.empleados where cedulaempledo='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idloginempleado'];
		$idempleado= $resultado['idempleado'];
		
		
		$InstruccionSQL = "UPDATE gestioncondominio.empleados
				    SET direccionempledo='$direccion', telefonoempledo='$telefono',correoempledo='$correo',
				    fotoempleado='$foto', formatofotoempleado='$formatofoto',
				    nombrefotoempleado='$nombrefoto' WHERE idempleado='$idempleado'";
				    
		$InstruccionSQL2="UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave', usuariologin='$usuario'  
		  		WHERE idlogin='$idlogin'";
  	  }
  	  else if($nombrerol=='superusuario')
      {
		$InstruccionSQL="SELECT idloginsuperusuario, idsuperusuario FROM gestioncondominio.superusuarios where codigosuperusuario='$codigopersona'";
		$ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
		
		$resultado=mysql_fetch_array($ConjuntoDeRegistros);
		$idlogin= $resultado['idloginsuperusuario'];
		$idempleado= $resultado['idsuperusuario'];
		
	  	$InstruccionSQL = "UPDATE gestioncondominio.superusuarios
				    SET telefonosuperusuario='$telefono', correosuperusuario='$correo', fotosuperusuario='$foto', formatofotosuperusuario='$formatofoto', nombrefotosuperusuario='$nombrefoto' 
				    WHERE idsuperusuario='$idempleado'";
		  $InstruccionSQL2=	"UPDATE gestioncondominio.logins SET paswordlogin='$nuevaclave', usuariologin='$usuario'  
					WHERE idlogin='$idlogin'";
  	  
  	  //&&($ObjetoConeccion->EjecutarSQL($InstruccionSQL2,$MiConeccion))
  	  
  	  }
  	  
	  if(($ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion))&&($ObjetoConeccion->EjecutarSQL($InstruccionSQL2,$MiConeccion)))
	  {
		$datos[0]="true";
	  }
  	  else
    	$datos[0]="false";
    	
  }else
  //  $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 
 
 
 
 function ListadoBancoCondominio($idcondominio)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT DISTINCT idbanco, bancos.codigocondominio, nombrebanco, rifbanco, 
		    estatusbanco  FROM gestioncondominio.cuentas, 
		    bancos where idbancocuenta=idbanco and idcondominiocuenta='$idcondominio';";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idbanco'];
		$datos[$i][2]=$resultado['nombrebanco'];
		$datos[$i][3]=$resultado['rifbanco'];
		$datos[$i][4]=$resultado['estatusbanco'];
		$datos[$i][5]=$resultado['codigocondominio'];
		
		
		$i++;
	}
	  }
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }

 
function ActualizarCopropietario($idcopropietario,$correo,$direccion,$telefono)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL="SELECT * from copropietarios where idcopropietario='$idcopropietario'";
  $ConjuntoDeRegistros=$ObjetoConeccion->EjecutarSQL($InstruccionSQL, $MiConeccion);
  
  
  if(mysql_num_rows($ConjuntoDeRegistros)>0)
  { 
  		
		$InstruccionSQL = "UPDATE gestioncondominio.copropietarios
				    SET  direccioncopropietario='$direccion', telefonocopropietario='$telefono', 
				    correocopropietario='$correo' WHERE idcopropietario= '$idcopropietario'";
						
   if($ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion))
	  {
		$datos[0]="true";
	  }
  	  else
    	$datos[0]="false";
    	
  }else
  $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 
 
 

 function ListadoTiposNoticias()
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT * FROM tiponoticiamaestros";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
	{
  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idtiponoticiamaestro'];
		$datos[$i][2]=$resultado['nombretiponoticiamaestro'];
		$datos[$i][3]=$resultado['estatustiponoticiamaestro'];
		$datos[$i][4]=$resultado['codigotiponoticia'];
		
		$i++;
	}
	}
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }

 
function RegistrarQueja($codigoreclamo, $razonreclamo, $fecha, $descripcion, $estatus, $idinmueblereclamo, 
						$codigoinmuebledestinatario, $idtiporeclamo)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "INSERT INTO gestioncondominio.reclamosugerencias  
						(idreclamosugerencia ,  codigoreclamosugerencia ,razonreclamosugerencia,  
						 fechareclamosugerencia ,  descripcionreclamosugerencia, 
						estatusreclamosugerencia ,  idinmueblereclamosugerencia ,  codigoinmuebledestinatario, idtiporeclamo)
						VALUES 
						('', '$codigoreclamo', '$razonreclamo', '$fecha', '$descripcion',  
						'$estatus', '$idinmueblereclamo', 
						'$codigoinmuebledestinatario', '$idtiporeclamo')";
 $enlace = mysql_connect($Maquina, $UsuarioADM, $ClaveADM);
 
	if (!$enlace) 
	{
	    die('No se pudo conectar: ' . mysql_error());
	}
	mysql_select_db($BaseDeDatos);
  
	 if (mysql_query($InstruccionSQL))
	  {
	  	if(mysql_affected_rows()>0)
	  		$datos[0]="true";
	  	else
	    	$datos[0]="false";
	  }
	  else
	    $datos[0]="false";
	    mysql_close();
	  return $datos;
 }
 
 function ConsultarNominaEmpleado($idempleado, $mes)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT nominas.idnomina, nominas.codigonominanomina, fechanominaempleado, sueldoneto, asignacionesnominaempleado,
		    deduccionesnominaempleado, sueldototal, estatusnominaempleado, descripcionforma
 		    FROM gestioncondominio.nominaempleados, nominas,egresos,formapagos where
		    nominas.idnomina=nominaempleados.idnomina and 
		    egresos.idformapagopago=formapagos.idformapagopago and idegreso=idegresonomina and
		    idempleado='$idempleado'and month(fechanominaempleado)='$mes';";
						
					
						
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
	
	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
	$datos[$i][1]=$resultado['idnomina'];
	$datos[$i][2]=$resultado['codigonominanomina'];
	$datos[$i][3]=$resultado['fechanominaempleado'];
	$datos[$i][4]=$resultado['sueldoneto'];
	$datos[$i][5]=$resultado['asignacionesnominaempleado'];
	$datos[$i][6]=$resultado['deduccionesnominaempleado'];
	$datos[$i][7]=$resultado['sueldototal'];
	$datos[$i][8]=$resultado['estatusnominaempleado'];
	$datos[$i][9]=$resultado['descripcionforma'];
		
	$i++;
	}
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
 
function ListadoTiposReclamos()
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "gestioncondominio";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "SELECT * FROM tiporeclamos";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
	{
  	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resultado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i][1]=$resultado['idtiporeclamos'];
		$datos[$i][2]=$resultado['nombretiporeclamo'];
		$datos[$i][3]=$resultado['codigotiporeclamo'];
		$datos[$i][4]=$resultado['estatustiporeclamo'];
		$i++;
	}
	}
  else
  	$datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }

 
 /*fin de los servicios */


 
 
 
 
}


//Laboratorio III. Dreamteam A. / EAI SERVICIOS 
?>
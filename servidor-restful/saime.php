 <?php
/*
Laboratorio III. Dreamteam A. / EAI SERVICIOS 
Responsables:      
Verónica Vásquez. Euclides Mendoza. Fremberling Ramos.
Correos: veronicavasquez.92@gmail.com, mendoza.euclides@gmail.com, fremberling@gmail.com 
por cualquier duda o sugerencia.

*/
 
require_once("Libreria_OO.php");
class Saime
{
 function BuscarPersona($cedula)
 {
  $nacionalidad=substr($cedula,0,1);
  $ced=substr($cedula,1);
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select persona.nombre as nombre,persona.apellido as apellido,persona.direccion as direccion,
			persona.telefono as telefono,persona.correo as correo,persona.estadocivil as estadocivil,ciudad.descripcion as ciudad,
			municipio.descripcion as municipio,estado.descripcion as estado
			from eai.estado , eai.ciudad, eai.municipio,eai.persona where persona.ciudadid=ciudad.idciudad
and ciudad.municipioid=municipio.idmunicipio and estado.idestado=municipio.estadoid and persona.idpersona='$ced' 
 and persona.nacionalidad='$nacionalidad'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  $Registros = $ObjetoConeccion->BuscarRegistros($ConjuntoDeRegistros);
  if ((int)$Registros==1) 
  {
	$datos[0]="true";
	$datos[1]=$Registros['nombre'];
	$datos[2]=$Registros['apellido'];
	$datos[3]=$Registros['direccion'];
	$datos[4]=$Registros['telefono'];
	$datos[5]=$Registros['correo'];
	$datos[6]=$Registros['estadocivil'];
	$datos[7]=$Registros['ciudad'];
	$datos[8]=$Registros['municipio'];
	$datos[9]=$Registros['estado'];
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 
function BuscarEstados()
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select * from estado order by estado.descripcion asc";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resulado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i]['idestado']=$resultado['idestado'];
		$datos[$i]['descripcion']=$resultado['descripcion'];
		$i++;
	}

  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 
function BuscarMunicipios($estado)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $estado=ucwords(strtolower($estado));
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select municipio.idmunicipio,municipio.descripcion from municipio,estado where municipio.estadoid=estado.idestado and 
			estado.descripcion='$estado'order by municipio.descripcion asc ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resulado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i]['idmunicipio']=$resultado['idmunicipio'];
		$datos[$i]['descripcion']=$resultado['descripcion'];
		$i++;
	}
	
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 
function BuscarCiudadesEstado($estado)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $estado=ucwords(strtolower($estado));
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select ciudad.idciudad,ciudad.descripcion from eai.ciudad,eai.municipio,eai.estado where ciudad.municipioid=municipio.idmunicipio and 
estado.idestado=municipio.estadoid and estado.descripcion='$estado' order by ciudad.descripcion asc ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resulado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i]['idciudad']=$resultado['idciudad'];
		$datos[$i]['descripcion']=$resultado['descripcion'];
		$i++;
	}

  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 } 
function BuscarCiudadesMunicipio($municipio,$estado)
 {
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  $ObjetoConeccion = new ConeccionBD;
  $municipio=ucwords(strtolower($municipio));
  $estado=ucwords(strtolower($estado));
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
  $InstruccionSQL = "select ciudad.idciudad,ciudad.descripcion from ciudad,municipio,estado where 
ciudad.municipioid=municipio.idmunicipio and estado.idestado=municipio.estadoid and estado.descripcion='$estado' 
and municipio.descripcion='$municipio' ";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
  if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {

	$datos[0]="true";
	$datos[1]=mysql_num_rows($ConjuntoDeRegistros);
	$resulado=array();
	$i=2;
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
		$datos[$i]['idciudad']=$resultado['idciudad'];
		$datos[$i]['descripcion']=$resultado['descripcion'];
		$i++;
	}

  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }
  
 function ConsultarAntecedentes($cedula)
 {
  $nacionalidad=substr($cedula,0,1);
  $ced=substr($cedula,1);
  $Maquina     = "localhost";
  $UsuarioADM  = "root";
  $ClaveADM    = "123";
  $BaseDeDatos = "eai";
  
 $ObjetoConeccion = new ConeccionBD;
  $MiConeccion = $ObjetoConeccion->ConectarBD($Maquina,$UsuarioADM,$ClaveADM,$BaseDeDatos);
   $InstruccionSQL = "SELECT persona.nombre,persona.apellido, antecedentepersona.fecha,
antecedente.descripcion,antecedentepersona.antecedenteid 
 FROM eai.antecedentepersona,eai.persona,eai.antecedente
 where persona.idpersona=antecedentepersona.personaid
and antecedente.idantecedente=antecedentepersona.antecedenteid and
persona.idpersona='$ced' and persona.nacionalidad='$nacionalidad'";
  $ConjuntoDeRegistros = $ObjetoConeccion->EjecutarSQL($InstruccionSQL,$MiConeccion);
 if (mysql_num_rows($ConjuntoDeRegistros)>0) 
  {
        $i=2;
        $datos[0]="true";
        $datos[1]=mysql_num_rows($ConjuntoDeRegistros);
       	$resultado=array();
	while($resultado=mysql_fetch_array($ConjuntoDeRegistros))
	{
	
	$datos[$i]['fecha']=$resultado['fecha'];
	$datos[$i]['descripcion']=$resultado['descripcion'];
	$datos[$i]['antecedenteid']=$resultado['antecedenteid'];
	$i++;
	}
  }
  else
    $datos[0]="false";
  $ObjetoConeccion->CerrarBD($MiConeccion);
  return $datos;
 }

}


//Laboratorio III. Dreamteam A. / EAI SERVICIOS 

?>

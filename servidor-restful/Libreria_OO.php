<?php
/*********************************************************************************/
/*                 Libreria_OO.php
/*********************************************************************************/
/*
  Autor  : Edgar Gonzalez
  Version: 1.0 en PHP5
  Fecha  : 05 de Marzo del 2011
*/

class Vector {
  private $v;
  
  function __construct() {
    $this->v=array();
  }
  
  function setV($j,$valor) {
    $this->v[$j]=$valor;
  }
  
  function getV($j) {
    return $this->v[$j];
  }
  
  function clearV() {
    $this->v = array();
  }
  
   function countV() {
    return count($this->v);
  }
  
}

class Vector2d {
  private $v;

  function __construct() {
    $this->v=array();
  }

  function setV($i,$j,$valor) {
    $this->v[$i][$j]=$valor;
  }

  function getV($i,$j) {
    return $this->v[$i][$j];
  }

  function clearV() {
    $this->v = array();
  }
  
  function countV() {
    return count($this->v);
  }

}

class ConeccionBD
{

 /*********************************************************************************/
 /* Funcion ConectarBD
    Descripcion: Esta funcion nos conecta a la Base de Datos de mySQL que
                 que deseamos.
    Parametros:
               $Host    : El nombre de la maquina o IP
  	       $Login   : Nombre del usuario a la base de datos MySQL
 	       $Password: Clave del usuario a la base de datos MySQL
	       $BD      : Nombre de la Base de Datos de MySQL a conectarse
    Retorna:
             $Coneccion                                                           
 /*********************************************************************************/
 function ConectarBD($Host,$Login,$Password,$BD)
 {
   if (!($Coneccion=mysql_connect($Host,$Login,$Password)))
   {
      echo "Error conectando a la base de datos.";
      exit();
   }
   if (!mysql_select_db($BD,$Coneccion))
   {
      echo "Error seleccionando la base de datos.";
      exit();
   }
   mysql_set_charset('utf8',$Coneccion); 
   return $Coneccion;
 }
 /*********************************************************************************/
 /* Funcion LiberarRecordSet
    Descripcion: Esta funcion libera espacio de memoria despues de hacer una conulta
                 de un RecordSet.
    Parametros:
               $ElRecordSet : El id del RecordSet
    Retorna:
             $Entero                                                              
 /*********************************************************************************/
 function LiberarRecordSet($ElRecordSet)
 {
  $Entero = mysql_free_result($ElRecordSet);
  return $Entero;
 }

 /*********************************************************************************/
 /* Funcion CerrarBD
    Descripcion: Esta funcion libera espacio de memoria despues de hacer una conulta
                 de un RecordSet.
    Parametros:
               $LaConeccion : El id de Coneccion que retorno la funcion ConectarBD
    Retorna:
             $Entero Verdadero o Falso                                            
 /*********************************************************************************/
 function CerrarBD($LaConeccion)
 {
  $Entero = mysql_close ($LaConeccion);
  return $Entero;
 }
 /*********************************************************************************/
 /* Funcion EjecutarSQL
    Descripcion: Esta funcion nos permite Ejecutar una instruccion de SQL en una
                 tabla de la base de Datos.
    Parametros:
	       $iSQL        : Instruccion de SQL
               $LaConeccion : El id de Coneccion que retorno de la funcion ConectarBD
    Retorna:
             $IdSetRecordSet el ID de un registro o un conjunto de Registros      
 /*********************************************************************************/
 function EjecutarSQL($iSQL,$LaConeccion)
 {
  //mysql_query("SET NAMES 'UTF-8'");
  $IdSetRecordSet = mysql_query($iSQL, $LaConeccion);
  return $IdSetRecordSet;
 }
 
 /*********************************************************************************/ 
 /* Funcion BuscarRegistros
    Descripcion: Esta funcion nos permite buscar de uno a un conjunto de Registros
                 en una tabla de la base de Datos.
    Parametros:
 		 $LosRegistros: Contiene el ID del Registro o del Conjunto de
		 	        Registros que retorna la Funcion EjecutarSQL
    Retorna:
             $RecordSet es un registro o un conjunto de Registro                     
 /*********************************************************************************/
 function BuscarRegistros($LosRegistros)
 {
  $RecordSet = mysql_fetch_array($LosRegistros);
  return $RecordSet;
 }

}

?>

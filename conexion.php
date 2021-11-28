<?php
	//$host=''; 
	$host='localhost';
	$user=''; 
	$user='root'; 
	$password='';
	$db='logistics_creation';

	$conexion= mysqli_connect($host,$user,$password,$db);
	if(!$conexion){
		echo "error en la conexion";
	} else {
		//echo "ok";
	}
?>

